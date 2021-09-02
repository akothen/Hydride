#lang rosette

(require rosette/lib/synthax) 

;; Vector mac
(define (vector-mac v-acc v1 v2)
  (assert (= (length v1)
             (length v2)
             (length v-acc))
          "vector-mac: length of vectors not equal")
  (for/vector ([e-acc v-acc]
             [e1 v1]
             [e2 v2])
    (box (+ (unbox e-acc) (* (unbox e1) (unbox e2))))))

;; Vector mac reduction
(define (vector-mac-reduction v-acc v1 v2 len)
    (assert (= (length v1) (length v2))
          "vector-mac-reduction: length of vectors not equal")
  (for ([i (length v1)])
    (define sum
      (apply
       +
       (for ([j len])
         (* (unbox v1[(+ j (* i len))]) (unbox v2[(+ j (* i len))])))))
    (set-box! (+ (unbox v-acc[i]) (sum)))))




;; Vector add
(define (vector-add v1 v2)
  (assert (= (length v1) (length v2))
          "vector-add: length of vectors not equal")
  (for/list ([e1 v1]
             [e2 v2])
    (box (+ (unbox e1) (unbox e2)))))

;; Vector sub
(define (vector-sub v1 v2)
  (assert (= (length v1) (length v2))
          "vector-sub: length of vectors not equal")
  (for/list ([e1 v1]
             [e2 v2])
    (box (- (unbox e1) (unbox e2)))))

;; Vector div
(define (vector-div v1 v2)
  (assert (= (length v1) (length v2))
          "vector-div: length of vectors not equal")
  (for/list ([e1 v1]
             [e2 v2])
    (box (/ (unbox e1) (unbox e2)))))

;; Vector mul
(define (vector-mul v1 v2)
  (assert (= (length v1) (length v2))
          "vector-mul: length of vectors not equal")
  (for/list ([e1 v1]
             [e2 v2])
    (box (* (unbox e1) (unbox e2)))))

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


(define (Gx-Sketch ct0 L)
  ;(define (??ct) (choose ct0))
  (for/list ([_ (in-range (L))])
    (vector-mac (??) (??) (??))))


(define-symbolic l integer?)
(define-symbolic h integer?)
(define sol
    (synthesize
     #:forall    (list l h) 
     #:guarantee (matrix-multiply-spec Gx-Sketch l h)))

(if (sat? sol) (print-forms sol) (print "UNSAT"))
