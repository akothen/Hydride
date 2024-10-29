(module a racket/base
(require racket/contract/base)

(define f add1)
;; (define g add1)

(provide
 (contract-out
  [f (-> exact-integer? exact-integer?)]))
)
