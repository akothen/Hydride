
;; Box blur: Takes the slice and calculates the average of the slice
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
                          (define imgSlice (apply
                                            concat
                                            (for/list ([s  (range blurR)])
                                                      (vector-load img img_size (+ (* s imgC) offset) blurC prec)
                                                      )
                                            ))
                          ;(displayln "Slice")
                          ;(display "(")
                          ;(display i)
                          ;(display ", ")
                          ;(display j)
                          ;(displayln ")")
                          ;(print-mat imgSlice filtR filtC prec)
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
