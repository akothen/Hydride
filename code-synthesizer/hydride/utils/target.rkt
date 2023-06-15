#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)

(provide (all-defined-out))

(define target 'hvx)

(define (set-target-hvx)
  (set! target 'hvx))

(define (set-target-arm)
  (set! target 'arm))

(define (set-target-x86)
  (set! target 'x86))
