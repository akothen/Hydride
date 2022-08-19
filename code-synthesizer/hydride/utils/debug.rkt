#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require hydride/utils/bvops)


(provide (all-defined-out))

;; DEBUG-MODEs:
;;  0 : Print no debug messages
;;  1 : Print all debug logs
(define DEBUG-MODE 1)

(define (enable-debug)
  (set! DEBUG-MODE 1)
  )


(define (disable-debug)
  (set! DEBUG-MODE 0)
  )

(define (print-to-console v)
  (if (struct? v)
    (pretty-print v)
    (displayln v)
    )
  )

(define (debug-log msg)
  (if (equal? DEBUG-MODE 1)
    (print-to-console msg)
    '()
    )
  )


