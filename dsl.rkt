(define (vector-mac v-acc v1 v2)
  (assert (= (length v1)
             (length v2)
             (length v-acc))
          "vector-mac: length of vectors not equal")
  (for/vector ([e-acc v-acc]
             [e1 v1]
             [e2 v2])
    (box (+ (unbox e-acc) (* (unbox e1) (unbox e2))))))


(define (vector-mac-reduction v-acc v1 v2 len)
  (for ([i (length v1)])
    (define sum
      (apply
       +
       (for ([j len])
         (* (unbox v1[(+ j (* i len))]) (unbox v2[(+ j (* i len))])))))
    (set-box! (+ (unbox v-acc[i]) (sum)))))
