#lang racket/base
(require racket/path
         racket/string
         syntax/modresolve)
(provide (all-defined-out))

;; Goal: To prevent "link: module mismatch" errors, especially when
;; some modules are intercepted (eg by current-load) to be recompiled
;; from source with instrumentation.

;; Approach: Replace the default load/use-compiled handler with one
;; that peeks at the zo file and checks its dependencies before
;; loading the zo file. If any dependency has a stale zo file or is
;; blacklisted, the module is loaded from source. The zo blacklist is
;; used to indicate what files will be intercepted by a special
;; compiler (eg instrumentation for profiling, coverage, etc).

;; We assume the load-zo function (defaulting to the current
;; load/use-compiled handler) has behavior compatible with the default
;; handler (eg wrt zo search paths, etc).

;; TODO
;; - if file is X.rkt, also check for X.ss (maybe?)
;; - check for .so, .dll, .dylib, higher priority than .zo
;; - return zo-file from use-zo?, pass to load-zo function (?)
;; - helper functions to produce blacklist preds from module path
;;   patterns (eg, "everything in the db collection", "everything in
;;   mumble/private/**"); see current-library-collection-{links,paths}
;; - add option to use .dep file to get dependencies

(define-logger custom-load)

;; ----------------------------------------

;; A WantName is (U #f Symbol (cons (U #f Symbol) (Listof Symbol)))
;; A ResolvedMod is (U Symbol Path (list* 'submod (U Symbol Path) (Listof Symbol)))

;; A CLUC is an instance of custom-load/use-compiled:
(struct custom-load/use-compiled
  (cache        ;; hash[ Path => Boolean ]
   blacklist    ;; Path -> Boolean
   load-zo      ;; (Path WantName -> Any)  -- Note: given orig path, NOT zo path
   load-src)    ;; (Path WantName -> Any)
  #:property prop:procedure
  (lambda (self file/maybe-badext name)
    (define file
      (if (file-exists? file/maybe-badext)
          file/maybe-badext
          (if (or (not (equal? (filename-extension file/maybe-badext) #"rkt"))
                  (not (symbol? name)))
              file/maybe-badext
              (path-replace-suffix file/maybe-badext #".ss"))))
    (cond [(use-zo? self file)
           (log-custom-load-info "using zo for ~s" file)
           (let ([load-zo (custom-load/use-compiled-load-zo self)])
             (load-zo file name))]
          [(and (pair? name) (eq? (car name) #f))
           ;; means don't load from source; since can't use bytecode,
           ;; must not load at all (w/o complaint)
           (log-custom-load-info "skipping (zo submod request) ~s" file)
           (void)]
          [else
           (log-custom-load-info "using source for ~s" file)
           (parameterize ((current-load-relative-directory (path-only file)))
             (let ([load-src (custom-load/use-compiled-load-src self)])
               (load-src file name)))])))

(define (make-custom-load/use-compiled
         #:blacklist [blacklist (lambda (file) #f)]
         #:load-zo   [load-zo (current-load/use-compiled)]
         #:load-src  [load-src (lambda (file name) ((current-load) file name))])
  (custom-load/use-compiled (make-hash)
                            (blacklist->pred 'make-custom-load/use-compiled blacklist)
                            load-zo load-src))

;; ----------------------------------------

(define (blacklist->pred who spec)
  ;; FIXME: might be better to do all regexps together, avoid repeated path->string
  (define (loop spec)
    (cond [(and (procedure? spec) (procedure-arity-includes? spec 1))
           spec]
          [(regexp? spec)
           (lambda (mod) (regexp-match? spec (path->string mod)))]
          [(list? spec)
           (let ([preds (map loop spec)])
             (lambda (mod) (for/or ([pred (in-list preds)]) (pred mod))))]
          [else (error who "bad blacklist: ~e" spec)]))
  (loop spec))

;; ----------------------------------------

;; use-zo? : CLUC ResolvedMod -> boolean
(define (use-zo? self mod)
  (cond [(symbol? mod) #t]
        [(pair? mod)
         (use-zo? self (cadr mod))]
        [(path-string? mod)
         (let ([mod (simplify-path mod)]
               [cache (custom-load/use-compiled-cache self)])
           (and
            (hash-ref! cache mod
                       (lambda ()
                         ;; Submodules can cause cycles in use-zo?, so tentatively
                         ;; put mod in table as ok to use zo?, then replace once checked.
                         (hash-set! cache mod 'pending)
                         (file-use-zo? self mod)))
            #t))]))

;; file-use-zo? : CLUC Path -> Boolean
(define (file-use-zo? self file)
  (cond [(blacklisted? self file)
         (log-custom-load-info "blacklisted: ~s" file)
         #f]
        [else
         (file-use-zo?* self file)]))

;; blacklisted? : CLUC Path -> Boolean
(define (blacklisted? self file)
  ((custom-load/use-compiled-blacklist self) file))

;; file-use-zo?* : CLUC Path -> Boolean
(define (file-use-zo?* self file)
  (define dir (path-only file))
  (define file-name (file-name-from-path file))
  (define zo-file (find-zo-file dir file-name))
  ;; If the file does not exist we must use continue to use
  ;; current-load/use-compiled, which does not fail in this case
  (cond [(not (file-exists? file)) #t]
        [(not zo-file)
         (log-custom-load-info "no zo for ~s" file)
         #f]
        [(> (file-or-directory-modify-seconds file)
            (file-or-directory-modify-seconds zo-file))
         ;; zo is stale
         (log-custom-load-info "stale zo: ~s" zo-file)
         #f]
        [(read-zo-module zo-file)
         => (lambda (zo)
              (for*/and ([phase+imps (in-list (module-compiled-imports zo))]
                         [imp (in-list (cdr phase+imps))])
                (use-zo? self (resolve-module-path-index imp file))))]
        [else
         (log-custom-load-info "garbage zo: ~s" zo-file)
         #f]))

;; find-zo-file : Path Path -> (U Path #f)
;; Returns the zo file that would be used by the default load/use-compiled handler.
;; Note: doesn't do ".rkt" -> ".ss" mapping, and ignores native libs (.so/.dll/.dylib)
(define (find-zo-file dir file-name)
  (define zo-file-name (path-add-suffix file-name ".zo"))
  (for/or ([root (in-list (current-compiled-file-roots))])
    ;; root : (U 'same path?)
    (define dir*
      (cond [(and (path? root) (absolute-path? root)) (reroot-path dir root)]
            [else (build-path dir root)]))
    (for/or ([suffix (in-list (use-compiled-file-paths))])
      ;; suffix : relative-path?
      (define zo-file (build-path dir* suffix zo-file-name))
      (and (file-exists? zo-file) zo-file))))

;; read-zo-module : Path -> (U #f Compiled-Module-Expression)
(define (read-zo-module zo-file)
  (parameterize ((read-accept-compiled #t))
    (with-handlers ([exn:fail? (lambda (e) #f)])
      (call-with-input-file* zo-file
        (lambda (in)
          (define zo (read in))
          (define more (read in))
          (and (compiled-module-expression? zo)
               (eof-object? more)
               zo))))))
