#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)

(provide (all-defined-out))

(define target 'hvx)

(define input-lang 'halide)

(define (set-target-hvx)
  (set! target 'hvx))

(define (set-target-x86)
  (set! target 'x86))

(define (set-target-halide)
  (set! target 'halide))

(define (set-input-halide)
  (set! input-lang 'halide))

(define (set-input-mlir)
  (set! input-lang 'mlir))
