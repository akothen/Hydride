(module c racket/base
(require racket/contract/base)

(define h /)

(provide
 (contract-out
  [h (-> real? real?)]))
)
