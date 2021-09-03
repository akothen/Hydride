;; Vector add
(define (_mm256_add_epi32 c a b )
  (assert (= (vector-length a) (vector-length b))
          "_mm256_add_epi32:length of vectors not equal")
  (for ([j 8])
    (define sum (+ (bitwise-bit-field (vector-ref a j) 0 32) (bitwise-bit-field (vector-ref b j) 0 32)))
    (vector-set! c j sum)))
    

;; Vector add
(define (_mm256_add_epi16 c a b )
  (assert (= (vector-length a) (vector-length b))
          "_mm256_add_epi32:length of vectors not equal")
  (for ([j (vector-length b)])
    (define sum (+ (bitwise-bit-field (vector-ref a j) 0 16) (bitwise-bit-field (vector-ref b j) 0 16)))
    (vector-set! c j sum)))

;; Vector add
(define (_mm256_add_epi32_1 c a b )
  (assert (= (vector-length a) (vector-length b))
          "_mm256_add_epi32:length of vectors not equal")
  (for ([j (vector-length b)])
    (define sum (+ (vector-ref a j) (vector-ref b j)))
    (vector-set! c j sum)))
     


;; Vector mac reduction
(define (_mm512_dpbusds_epi32 v-acc v1 v2)
    (assert (= (vector-length v1) (vector-length v2))
          "_mm512_dpbusds_epi32: length of vectors not equal")
  (for ([i 16])
    (define sum
      (apply
       +
       (for/list ([j 4])
         (* (bitwise-bit-field (vector-ref v1 (+ j (* i 4))) 0 8) (bitwise-bit-field (vector-ref v2 (+ j (* i 4))) 0 8)))))
    (vector-set! c i (+ sum (vector-ref c i)))))


;; Vector mac reduction
(define (_mm_dpwssd_epi32 v-acc v1 v2)
    (assert (= (vector-length v1) (vector-length v2))
          "_mm_dpwssd_epi32: length of vectors not equal")
  (for ([i 4])
    (define sum
      (apply
       +
       (for/list ([j 2])
         (* (bitwise-bit-field (vector-ref v1 (+ j (* i 2))) 0 16) (bitwise-bit-field (vector-ref v2 (+ j (* i 2))) 0 16)))))
    (vector-set! c i (+ sum (vector-ref c i)))))


;; Vector mac reduction
(define (_mm256_maskz_dpbusds_epi32 v-acc v1 v2 mask)
    (assert (= (vector-length v1) (vector-length v2))
          "_mm512_dpbusds_epi32: length of vectors not equal")
  (for ([i 8])
    (define sum
      (if (zero? (vector-ref mask i))
       0
      (apply
       +
       (for/list ([j 4])
         (* (bitwise-bit-field (vector-ref v1 (+ j (* i 4))) 0 8) (bitwise-bit-field (vector-ref v2 (+ j (* i 4))) 0 8))))))
    (vector-set! c i (+ sum (vector-ref c i)))))


(define a (build-vector 8 add1))
(define b (build-vector 8 add1))
(define c (build-vector 4 add1))
(define (res v1 v2)
  (print (_mm_dpwssd_epi32 c a b))
  (print c))

(print (res a b))
