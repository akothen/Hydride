(define (box-blur img imgR imgC blurR blurC prec o_prec) 
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
                                                       (define elem (ext-bv imgSlice k prec))
                                                       (sign-extend elem (bitvector o_prec))
                                                       )
                                             )
                                      (bv numBlur (bitvector o_prec))
                                      )
                                    )
                          )
                   )
         )
  )
