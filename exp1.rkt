#lang rosette


(define (vector-mac v-acc v1 v2)
  (assert (= (length v1)
             (length v2)
             (length v-acc))
          "VECTOR-MAC: length of vectors not equal")
  (for/list ([e-acc v-acc]
             [e1 v1]
             [e2 v2])
    (box (+ (unbox e-acc) (* (unbox e1) (unbox e2))))))



(struct matrix (rows cols elements) #:transparent #:mutable)

(define (matrix-multiply-spec mat-A mat-B)
  (match-define (matrix A-rows A-cols A-elements) mat-A)
  (match-define (matrix B-rows B-cols B-elements) mat-B)
  (assert (= A-cols B-rows))
  (define C
    (matrix A-rows
            B-cols
            ((for/list ([_ (in-range (* A-rows B-cols))])
               (box 0.0)))))
  (for* ([i A-rows] [j B-cols])
    (define sum
      (apply
        +
        (for/list ([k A-cols])
          (* (unbox (list-ref (matrix-elements mat-A) (+ (* k i) k))))
             (unbox (list-ref (matrix-elements mat-B) (+ (* j k) j))))))
    (set-box! (list-ref (matrix-elements C) (+ (* j i) j)) sum))

  (matrix-elements C))
