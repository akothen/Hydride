
(define image (apply concat (for/list ([k (range 36)])
                                      (bv (+ k 1) (bitvector 8))
                        )))


(define (check a)
  (println (interpret a (vector image)))
  )


;; Box blur: Takes the slice and calculates the average of the slice
(define (box-blur img imgR imgC blurR blurC prec) 
  (define i_bound (+ (- imgR blurR) 1))
  (define j_bound (+ (- imgC blurC) 1))
  (define numBlur (* blurR blurC))
  (define img_size (* imgR imgC prec))
  (apply concat
         (for/list ([i (range i_bound)])
                   (apply concat
                          (for/list ([j (range j_bound)])
                                    (define offset (+ (* i imgC ) j))
                                    (define imgSlice (apply
                                                       concat
                                                       (for/list ([s  (range blurR)])
                                                                 (vector-load img img_size (+ (* s imgC) offset) blurC prec)
                                                                 )
                                                       ))
                                    (bvsdiv
                                      (apply bvadd
                                             (for/list ([k (reverse (range numBlur))])
                                                       (ext-bv imgSlice k prec)
                                                       )
                                             )
                                      (bv numBlur (bitvector prec))
                                      )
                                    )
                          )
                   )
         )
  )



;; Blur used by Halide
(define (blur img imgR imgC blurR blurC prec) 
  (define i_bound (+ (- imgR blurR) 1))
  (define j_bound (+ (- imgC blurC) 1))
  (define numBlur (* blurR blurC))
  (define img_size (* imgR imgC prec))
  (apply concat
         (for/list ([i (range i_bound)])
                   (apply concat
                          (for/list ([j (range j_bound)])
                                    (define offset (+ (* i imgC ) j))
                                    (define reduced-vertical-slice  ; tensor of shape (1, blurR)
                                      (apply
                                        concat
                                        (for/list ([s  (range blurR)])
                                                  (define horizontal-slice (vector-load img img_size (+ (* s imgC) offset) blurC prec))
                                                  (bvsdiv
                                                    (apply bvadd 
                                                           (for/list ([t (reverse (range blurC))])
                                                                     (ext-bv horizontal-slice t prec)
                                                                     )
                                                           ) 
                                                    (bv blurC (bitvector prec))
                                                    )


                                                  )
                                        )
                                      )

                                    ;; Now reduce vertical slice and take vertical average
                                    (bvsdiv
                                      (apply bvadd
                                             (for/list ([k (reverse (range blurR))])
                                                       (ext-bv reduced-vertical-slice k prec)
                                                       )
                                             )
                                      (bv blurR (bitvector prec))
                                      )
                                    )
                          )
                   )
         )
  )





