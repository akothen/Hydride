#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)
(require hydride/utils/bvops)
(require hydride/utils/debug)

(provide (all-defined-out))

(define (dump-hash-to-target-names memo-hash scale-functor get-names-functor scale-factor)

  (define (dump-helper k v)

    (cond
      ;; skip
      [(equal? (vector-ref v 0) #f) '()]
      [else
       (define expr (vector-ref v 1))

       (println k)
       (define scaled-expression (scale-functor expr scale-factor))
       (define names (get-names-functor scaled-expression))
       (displayln (format ";~a " expr))
       (displayln (format "(vector #t ~a ~a)" names (vector-ref v 2)))
       (displayln "")]))

  (hash-map memo-hash dump-helper))
