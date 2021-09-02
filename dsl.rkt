 #lang rosette

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
