#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)

(provide (all-defined-out))

;; Some uility functions
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)

(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (no-op a)
  a)

(define (bvumaxval bitwidth)
  (apply concat
         (for/list ([idx (range 0 bitwidth)])
           (bv #b1 1))))

(define (bvsmaxval bitwidth)
  (define end (- bitwidth 1))
  (define res
    (apply concat
           (for/list ([idx (range 0 end)])
             (bv #b1 1))))
  (concat (bv #b0 1) res))

(define (bvuminval bitwidth)
  (apply concat
         (for/list ([idx (range 0 bitwidth)])
           (bv #b0 1))))

(define (bvsminval bitwidth)
  (define end (- bitwidth 1))
  (define res
    (apply concat
           (for/list ([idx (range 0 end)])
             (bv #b0 1))))
  (concat (bv #b1 1) res))

;(define (bvssat vect bitwidth sat_size)
;  (if (> bitwidth sat_size)
;  (begin
;    (cond
;    [(bvslt vect (bv (bitvector->integer (bvsminval sat_size)) bitwidth)) (bvsminval sat_size)]
;    [(bvsgt vect (bv (bitvector->integer (bvsmaxval sat_size)) bitwidth)) (bvsmaxval sat_size)]
;    [else (extract (- sat_size 1) 0 vect)])
;  )
;  (begin
;   vect
;  )
; )
;)

(define (bvssat vect bitwidth sat_size)
  (if (> bitwidth sat_size)
      (begin
        (define sminval (bvsminval sat_size))
        (define smaxval (bvsmaxval sat_size))
        (cond
          [(bvslt vect (sign-extend sminval (bitvector bitwidth))) sminval]
          [(bvsgt vect (sign-extend smaxval (bitvector bitwidth))) smaxval]
          [else (extract (- sat_size 1) 0 vect)]))
      vect))

(define (bvusat vect bitwidth sat_size)
  (if (> bitwidth sat_size)
      (begin
        (define uminval (bvuminval sat_size))
        (define umaxval (bvumaxval sat_size))
        (cond
          [(bvslt vect (zero-extend uminval (bitvector bitwidth))) uminval]
          [(bvsgt vect (zero-extend umaxval (bitvector bitwidth))) umaxval]
          [else (extract (- sat_size 1) 0 vect)]))
      vect))

(define (bvpadhighbits vect num_pad_bits)
  (if (equal? num_pad_bits 0)
      (begin
        vect)
      (begin
        (concat (bv 0 num_pad_bits) vect))))

;(define (bvaddnsw a b bitwidth)
;  (define c (bvadd a b))
;  (define result
;  (cond
;    [(and (> (bitvector->integer a) 0) (> (bitvector->integer b) 0)
;          (< (bitvector->integer c) 0))
;          (bvsmaxval bitwidth)]
;    [(and (< (bitvector->integer a) 0) (< (bitvector->integer b) 0)
;          (> (bitvector->integer c) 0))
;          (bvsminval bitwidth)]
;    [else (bvadd a b)]
;  )
;  )
;  result
;)

;; Replaced entirely in bitvector domain

(define (bvaddnsw a b bitwidth)
  (define c (bvadd a b))
  (define zero (bv 0 (bitvector bitwidth)))
  (define result
    (cond
      [(and (bvsgt a zero) (bvsgt b zero) (bvsle c zero)) (bvsmaxval bitwidth)]
      [(and (bvslt a zero) (bvslt b zero) (bvsge c zero)) (bvsminval bitwidth)]
      [else (bvadd a b)]))
  result)

(define (bvaddnuw a b bitwidth)
  (bvadd a (bvumin (bvsub (bvumaxval bitwidth) a) b)))

;(define (bvsubnsw a b bitwidth)
;  (define result
;  (cond
;     [(and (> (bitvector->integer b) 0)
;           (< (bitvector->integer a) (bitvector->integer (bvadd (bvsminval bitwidth) b))))
;            (bvsminval bitwidth)]
;     [(and (< (bitvector->integer b) 0)
;           (> (bitvector->integer a) (bitvector->integer (bvadd (bvsmaxval bitwidth) b))))
;            (bvsmaxval bitwidth)]
;      [else (bvsub a b)]
;  )
;  )
;  result
;)

(define (bvsubnsw a b bitwidth)
  (define zero (bv 0 (bitvector bitwidth)))
  (define result
    (cond
      [(and (bvsgt b zero) (bvslt a (bvadd (bvsminval bitwidth) b))) (bvsminval bitwidth)]
      [(and (bvslt b zero) (bvsgt a (bvadd (bvsmaxval bitwidth) b))) (bvsmaxval bitwidth)]
      [else (bvsub a b)]))
  result)

(define (bvsubnuw a b bitwidth)
  (bvsub a (bvumin a b)))

(define (bvmulnsw a b bitwidth)
  (define minusonebv (bv -1 (bitvector bitwidth)))
  (define result
    (cond
      [(bveq b (bv 0 bitwidth)) b]
      [(bveq a minusonebv)
       (cond
         [(bveq b (bvsminval bitwidth)) (bvsmaxval bitwidth)]
         [else (bvmul a b)])]
      [(bveq b minusonebv)
       (cond
         [(bveq a (bvsminval bitwidth)) (bvsmaxval bitwidth)]
         [else (bvmul a b)])]
      [(bvsgt b (bv 0 bitwidth))
       (cond
         [(bvsgt a (bvsdiv (bvsmaxval bitwidth) b)) (bvsmaxval bitwidth)]
         [(bvslt a (bvsdiv (bvsminval bitwidth) b)) (bvsminval bitwidth)]
         [else (bvmul a b)])]
      [(bvslt b (bv 0 bitwidth))
       (cond
         [(bvslt a (bvsdiv (bvsmaxval bitwidth) b)) (bvsmaxval bitwidth)]
         [(bvsgt a (bvsdiv (bvsminval bitwidth) b)) (bvsminval bitwidth)]
         [else (bvmul a b)])]

      [else (bvmul a b)]))
  result)

(define (bvmulnuw a b bitwidth)
  (define result
    (if (bvugt a (bvudiv (bvumaxval bitwidth) b))
        (begin
          (bvumaxval bitwidth))
        (begin
          (bvmul a b))))
  result)

(define (bvsizeext vect ext_size is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (sign-extend vect (bitvector ext_size)))
        (begin
          (zero-extend vect (bitvector ext_size)))))
  result)

(define (bvsaturate vect bitwidth sat_size is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvssat vect bitwidth sat_size))
        (begin
          (bvusat vect bitwidth sat_size))))
  result)

(define (bvaddnw a b bitwidth wrap_around_id)
  (define result
    (cond
      [(equal? wrap_around_id 1) (bvaddnsw a b bitwidth)]
      [(equal? wrap_around_id 0) (bvaddnuw a b bitwidth)]
      [else (bvadd a b)]))
  result)

(define (bvsubnw a b bitwidth wrap_around_id)
  (define result
    (cond
      [(equal? wrap_around_id 1) (bvsubnsw a b bitwidth)]
      [(equal? wrap_around_id 0) (bvsubnuw a b bitwidth)]
      [else (bvsub a b)]))
  result)

(define (bvdiv a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvsdiv a b))
        (begin
          (bvudiv a b))))
  result)

(define (bvrem a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvsrem a b))
        (begin
          (bvurem a b))))
  result)

(define (bvmax a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvsmax a b))
        (begin
          (bvumax a b))))
  result)

(define (bvmin a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvsmin a b))
        (begin
          (bvumin a b))))
  result)

(define (bvlt a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvslt a b))
        (begin
          (bvult a b))))
  result)

(define (bvle a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvsle a b))
        (begin
          (bvule a b))))
  result)

(define (bvgt a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvsgt a b))
        (begin
          (bvugt a b))))
  result)

(define (bvge a b is_signed)
  (define result
    (if (equal? is_signed 1)
        (begin
          (bvsge a b))
        (begin
          (bvuge a b))))
  result)

(define (bvzero a)
  (define result (bitvector->integer a))
  (eq? result 0))
