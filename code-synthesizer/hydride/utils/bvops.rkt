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

(define (no-op a) a)


(define (bvumaxval bitwidth)
  (apply
    concat
    (for/list ([idx (range 0 bitwidth)])
              (bv #b1 1)
              )
    )
  )


(define (bvsmaxval bitwidth)
  (define end (- bitwidth 1))
  (define res
    (apply
      concat
      (for/list ([idx (range 0 end)])
                (bv #b1 1)
                )
      )
    )
  (concat (bv #b0 1) res)
  )


(define (bvuminval bitwidth)
  (apply
    concat
    (for/list ([idx (range 0 bitwidth)])
              (bv #b0 1)
              )
    )
  )


(define (bvsminval bitwidth)
  (define end (- bitwidth 1))
  (define res
    (apply
      concat
      (for/list ([idx (range 0 end)])
                (bv #b0 1)
                )
      )
    )
  (concat (bv #b1 1) res)
  )


;(define (bvssat vect bitwidth sat_size)
;  (if (> bitwidth sat_size)
;    (begin
;      (cond
;        [(bvslt vect (bv (bitvector->integer (bvsminval sat_size)) bitwidth)) (bvsminval sat_size)]
;        [(bvsgt vect (bv (bitvector->integer (bvsmaxval sat_size)) bitwidth)) (bvsmaxval sat_size)]
;        [else (extract (- sat_size 1) 0 vect)])
;      )
;    (begin
;      vect
;      )
;    )
;  )


(define (bvssat vect bitwidth sat_size)
  (if (> bitwidth sat_size)
    (begin
      (define sminval (bvsminval sat_size))
      (define smaxval (bvsmaxval sat_size))
      (cond
        [(bvslt vect (sign-extend sminval (bitvector bitwidth))) sminval]
        [(bvsgt vect (sign-extend smaxval (bitvector bitwidth))) smaxval]
        [else (extract (- sat_size 1) 0 vect)])
      )
    (begin
      vect
      )
    )
  )

(define (bvpadhighbits vect num_pad_bits)
  (if (equal? num_pad_bits 0)
    (begin
      vect
      )
    (begin
      (concat (integer->bitvector 0 (bitvector num_pad_bits)) vect)
      )
    )
  )


(define (bvusat vect bitwidth sat_size)
  (if (bvugt vect (bvumaxval bitwidth)) 
    (begin
      (bvumaxval bitwidth)
    )
    (begin
      (extract (- sat_size 1) 0 vect)
    )
  )
  ;;(bvumin (bvumax vect (bvuminval bitwidth)) (bvumaxval bitwidth))
)

(define (bvaddnsw a b bitwidth)
  (define zerobv (bv 0 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bvsgt a zerobv) (bvsgt b zerobv) 
          (bvsgt a (bvsub (bvsmaxval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a zerobv) (bvslt b zerobv) 
          (bvslt a (bvsub (bvsminval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [else (bvadd a b)]
  )
  )
  result
)

(define (bvaddnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvsub (bvumaxval bitwidth) b))
    (begin 
      (bvumaxval bitwidth)
    )
    (begin
      (bvadd a b)
    )
  )
  )
  result
)

(define (bvsubnsw a b bitwidth)
  (define zerobv (bv 0 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bvsgt a zerobv) (bvsgt (bvneg b) zerobv) 
          (bvsgt a (bvsub (bvsmaxval bitwidth) (bvneg b)))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a zerobv) (bvslt (bvneg b) zerobv) 
          (bvslt a (bvsub (bvsminval bitwidth) (bvneg b)))) 
          (bvsmaxval bitwidth)]
    [else (bvsub a b)]
  )
  )
  result
)

(define (bvsubnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvsub (bvumaxval bitwidth) (bvneg b)))
    (begin 
      (bvumaxval bitwidth)
    )
    (begin
      (bvsub a b)
    )
  )
  )
  result
)

(define (bvmulnsw a b bitwidth)
  (define minusonebv (bv -1 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bveq a minusonebv) (bveq b (bvsminval bitwidth)))
          (bvsmaxval bitwidth)]
      [(and (bveq b minusonebv) (bveq a (bvsminval bitwidth)))
          (bvsmaxval bitwidth)]
    [(and (bvsgt a (bvsdiv (bvsmaxval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a (bvsdiv (bvsminval bitwidth) b)))
          (bvsmaxval bitwidth)]
    [else (bvmul a b)]
  )
  )
  result
)

(define (bvmulnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvudiv (bvumaxval bitwidth) b))
    (begin
      (bvumaxval bitwidth)
    )
    (begin
      (bvmul a b)
    )
  )
  )
  result
)
