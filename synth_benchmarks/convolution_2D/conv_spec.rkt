
(define (tensor-conv2D img filt imgR imgC filtR filtC prec) 
  (define i_bound (+ (- imgR filtR) 1))
  (define j_bound (+ (- imgC filtC) 1))
  (define numFilt (* filtR filtC))
  (define img_size (* imgR imgC prec))
  (apply concat
    (for/list ([i (range i_bound)])
              (apply concat
                (for/list ([j (range j_bound)])
                          (define offset (+ (* i imgC ) j))
                          (define imgSlice (apply
                                            concat
                                            (for/list ([s  (range filtR)])
                                                      (vector-load img img_size (+ (* s imgC) offset) filtC prec)
                                                      )
                                            ))
                          (apply bvadd
                            (for/list ([k (reverse (range numFilt))])
                                      (bvmul 
                                        (ext-bv imgSlice k prec)
                                        (ext-bv filt k prec)
                                        )

                                      )
                            )
                          )
                )
              )
    )
  )
