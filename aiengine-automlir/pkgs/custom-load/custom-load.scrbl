#lang scribble/manual
@(require scribble/manual
          scribble/basic
          (for-label (except-in racket/base file)
                     racket/contract
                     custom-load
                     custom-load/top))

@(define (reference-tech . pre-content)
   (apply tech #:doc '(lib "scribblings/reference/reference.scrbl") pre-content))

@title{custom-load: Cautious Bytecode Loaders}
@author[@author+email["Ryan Culpepper" "ryanc@racket-lang.org"]]

This package provides a function for building
@reference-tech{compiled-load handlers} that avoid loading stale
@tt{".zo"} files, thus avoiding errors of the form ``link: module
mismatch.''

To be more precise, a ``link: module mismatch'' error arises when
Racket loads a @tt{".zo"} file with an ancestor whose @tt{".zo"} file
is stale or missing; the ancestor is recompiled in a way inconsistent
with the descendant, but it is too late to recompile to descendant,
because its bytecode is already loaded. The handlers produced by this
library recursively check ancestors before loading a descendant's
@tt{".zo"} file.

This library uses a logger named @tt{custom-load}; to see its output,
try setting @exec|{PLTSTDERR="info@custom-load"}|.

@section[#:tag "custom-load"]{Custom Compiled-Load Handlers}

@defmodule[custom-load]

@defproc[(make-custom-load/use-compiled
          [#:blacklist blacklist
                       (treeof (or/c regexp? (-> path? any/c)))
                       (lambda (file) #f)]
          [#:load-zo load-zo
                     (-> path? 
                         (or/c #f symbol? (cons/c (or/c #f symbol?) (listof symbol?)))
                         any)
                     (current-load/use-compiled)]
          [#:load-src load-src
                      (-> path?
                          (or/c #f symbol? (cons/c (or/c #f symbol?) (listof symbol?)))
                          any)
                      (lambda (file want) ((current-load) file want))])
         (-> path? 
             (or/c #f symbol? (cons/c (or/c #f symbol?) (listof symbol?)))
             any)]{

Returns a function, @racket[_loader], suitable for use as a
@reference-tech{compiled-load handler}---that is, as a value of the
@racket[current-load/use-compiled] parameter.

When @racket[_loader] is called to load @racket[_file], it performs
the following checks, loading the @tt{".zo"} version of @racket[_file]
only if all of them pass.

@itemlist[

@item{If @racket[_file] is ``zo blacklisted''---that is, if
@racket[(blacklist _file)] returns a true value---then @racket[_file]
must be loaded from source.}

@item{The corresponding @tt{".zo"} file @racket[_zo-file] is located
according to the rules of the default @reference-tech{compiled-load
handler}. If no @racket[_zo-file] can be located, or if @racket[_file]
is newer than @racket[_zo-file], then @racket[_file] must be loaded
from source.}

@item{The dependencies of @racket[_zo-file] are recursively checked;
if any of them must be loaded from source, @racket[_file] must be
loaded from source. The result of dependency checking is cached.}

@item{Otherwise, @racket[_file] is loaded from @tt{".zo"} file.}

]

To load @racket[_file] from source, @racket[_loader] calls
@racket[(load-src _file _what)], where @racket[_what] is the module or
submodule requested (see @reference-tech{compiled-load handler}). The
@racket[current-load-relative-directory] parameter is first set to the
directory containing @racket[_file].

To load @racket[_file] from @tt{".zo"} file, @racket[_loader] calls
@racket[(load-zo _file _name)]. Note that @racket[load-zo] is called
with the original @racket[_file], not with the @racket[_zo-file]; thus
the previous value of @racket[(current-load/use-compiled)] is an
appropriate value of @racket[load-zo].

The @racket[blacklist] argument is useful when using an instrumenting
compiler that intercepts loads of certain modules and recompiles them
after performing some sort of instrumentation. Examples include
debuggers, profilers, and coverage testers. Set the @racket[blacklist]
argument to a predicate that recognizes the files to be instrumented
and supply the following function for @racket[load-src]:

@racketblock[
(lambda (file what)
  (cond [(blacklist? file)
         (code:comment "compile this file with instrumentation")
         ....]
        [else
         ((current-load) file what)]))
]

As an alternative to supplying a @racket[load-src] argument, you can
also override @racket[current-load], chaining to the previous value in
the default branch.

}


@section[#:tag "top-level"]{Automatic Installation of Loader}

@defmodule[custom-load/top]

Requiring the @racketmodname[custom-load/top] module automatically
installs a custom loader as the value of
@racket[current-load/use-compiled], using the old value as the
@racket[_load-zo] argument.

You can also run a program with a custom loader using a command line
like @exec{racket -l custom-load/top -t program.rkt}.

@defparam*[current-zo-blacklist pred
           (treeof (or/c (-> path? any/c) regexp?))
           (-> path? any/c)]{

Parameter holding the zo blacklist predicate used by the
@reference-tech{compiled-load handler} installed by
@racketmodname[custom-load/top].
}
