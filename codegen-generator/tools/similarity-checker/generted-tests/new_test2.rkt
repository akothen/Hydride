#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require racket/serialize)
(require hydride)


(enable-debug)
;;(current-bitwidth 16)
(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define solver 'z3)


(define (function1  a b %arg0 %arg1)
(apply
concat
(for/list ([%outer.iterator (reverse (range 0 256 128))])
 (concat 
  (apply
  concat
  (for/list ([%inner.iterator.0 (reverse (range 0 64 8))])
   (define %index.0 (+  %inner.iterator.0  %arg0))
   (define %low.index.0 (+  %outer.iterator  %index.0))
   (define %high.index.0 (+  %low.index.0  7))
   (define %0 (extract  %high.index.0 %low.index.0 b))
   %0
  )
  )
  (apply
  concat
  (for/list ([%inner.iterator.1 (reverse (range 0 64 8))])
   (define %index.1 (+  %inner.iterator.1  %arg1))
   (define %low.index.1 (+  %outer.iterator  %index.1))
   (define %high.index.1 (+  %low.index.1  7))
   (define %1 (extract  %high.index.1 %low.index.1 a))
   %1
  )
  )
 )
)
)
)


(define (function2  a b)
(apply
concat
(for/list ([%outer.iterator (reverse (range 0 256 128))])
 (concat 
  (apply
  concat
  (for/list ([%inner.iterator.0 (reverse (range 0 64 8))])
   (define %index.0 (+  %inner.iterator.0  64))
   (define %low.index.0 (+  %outer.iterator  %index.0))
   (define %high.index.0 (+  %low.index.0  7))
   (define %0 (extract  %high.index.0 %low.index.0 b))
   %0
  )
  )
  (apply
  concat
  (for/list ([%inner.iterator.1 (reverse (range 0 64 8))])
   (define %index.1 (+  %inner.iterator.1  64))
   (define %low.index.1 (+  %outer.iterator  %index.1))
   (define %high.index.1 (+  %low.index.1  7))
   (define %1 (extract  %high.index.1 %low.index.1 a))
   %1
  )
  )
 )
)
)
)

(define-symbolic %arg0_1 integer?)
(define-symbolic %arg1_1 integer?)

(define (generate-params-f1 env)
  (vector (vector-ref env 0) (vector-ref env 1) %arg0_1 %arg1_1)
)

(define (generate-params-f2 env)
  (vector (vector-ref env 0) (vector-ref env 1))
)


(define bitwidth-list (list 256 256))


(define (invoke_f1 params)
  (assume (equal? (remainder %arg0_1 2) 0))
  (assume (>= %arg0_1 0))
  (assume (<= %arg0_1 512))
  (assume (equal? (remainder %arg1_1 2) 0))
  (assume (>= %arg1_1 0))
  (assume (<= %arg1_1 512))
  (function1
    (vector-ref params 0) 
    (vector-ref params 1) 
    (vector-ref params 2) 
    (vector-ref params 3) 
  )
)


(define (invoke_f2 params)
  (function2
    (vector-ref params 0) 
    (vector-ref params 1) 
  )
)

(define test-depth 2)
(define-values (satisfiable? sol? _) (general-synthesize-sol-iterative invoke_f1 invoke_f2 
                                      bitwidth-list generate-params-f1 generate-params-f2 '() solver))

(displayln "is Satisfiable?")
(println satisfiable?)

