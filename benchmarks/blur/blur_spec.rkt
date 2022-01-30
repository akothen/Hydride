
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




(define row_0 (vec-load (reg 0) 288 0 6 8))  ; Row 0
(define row_1 (vec-load (reg 0) 288 6 6 8))  ; Row 0
(define row_2 (vec-load (reg 0) 288 12 6 8))  ; Row 0
(define row_3 (vec-load (reg 0) 288 18 6 8))  ; Row 0
(define row_4 (vec-load (reg 0) 288 24 6 8))  ; Row 0
(define row_5 (vec-load (reg 0) 288 30 6 8))  ; Row 0


(define slide_slice_0 (vec-shuffle-ext-special row_0 (lit (bv 0 (bitvector 48))) 6 8 1 3))
(define slide_slice_1 (vec-shuffle-ext-special row_1 (lit (bv 0 (bitvector 48))) 6 8 1 3))
(define slide_slice_2 (vec-shuffle-ext-special row_2 (lit (bv 0 (bitvector 48))) 6 8 1 3))
(define slide_slice_3 (vec-shuffle-ext-special row_3 (lit (bv 0 (bitvector 48))) 6 8 1 3))
(define slide_slice_4 (vec-shuffle-ext-special row_4 (lit (bv 0 (bitvector 48))) 6 8 1 3))
(define slide_slice_5 (vec-shuffle-ext-special row_5 (lit (bv 0 (bitvector 48))) 6 8 1 3))



(define slide_red_0 (vec-reduction slide_slice_0 6 8))
(define slide_red_1 (vec-reduction slide_slice_1 6 8))
(define slide_red_2 (vec-reduction slide_slice_2 6 8))
(define slide_red_3 (vec-reduction slide_slice_3 6 8))
(define slide_red_4 (vec-reduction slide_slice_4 6 8))
(define slide_red_5 (vec-reduction slide_slice_5 6 8))

(define avg_slide_red_0 (vec-div slide_red_0 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_slide_red_1 (vec-div slide_red_1 (lit (bv 3 (bitvector 8))) 1 8))
(define avg_slide_red_2 (vec-div slide_red_2 (lit (bv 3 (bitvector 8))) 1 8))
(define avg_slide_red_3 (vec-div slide_red_3 (lit (bv 3 (bitvector 8))) 1 8))
(define avg_slide_red_4 (vec-div slide_red_4 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_slide_red_5 (vec-div slide_red_5 (lit (bv 3 (bitvector 8))) 1 8 ))


;; [0,1]
(define s1_comb_0_left (vec-shuffle-special avg_slide_red_0  avg_slide_red_1 1 8))
(define s1_comb_0_right (vec-shuffle-special avg_slide_red_2  (lit (bv 0 (bitvector 8))) 1 8))
(define s1_comb_0 (vec-shuffle-special s1_comb_0_left s1_comb_0_right 2 8))
(define s1_comb_0_red (vec-reduction s1_comb_0 4 8))
(define final_val_0_1 (vec-div s1_comb_0_red (lit (bv 3 (bitvector 8))) 1 8 ))



;; [1,1]
(define s1_comb_1_left (vec-shuffle-special avg_slide_red_1  avg_slide_red_2 1 8))
(define s1_comb_1_right (vec-shuffle-special avg_slide_red_3  (lit (bv 0 (bitvector 8))) 1 8))
(define s1_comb_1 (vec-shuffle-special s1_comb_1_left s1_comb_1_right 2 8))
(define s1_comb_1_red (vec-reduction s1_comb_1 4 8))
(define final_val_1_1 (vec-div s1_comb_1_red (lit (bv 3 (bitvector 8))) 1 8))


;; [2,1]
(define s1_comb_2_left (vec-shuffle-special avg_slide_red_2  avg_slide_red_3 1 8))
(define s1_comb_2_right (vec-shuffle-special avg_slide_red_4  (lit (bv 0 (bitvector 8))) 1 8))
(define s1_comb_2 (vec-shuffle-special s1_comb_2_left s1_comb_2_right 2 8))
(define s1_comb_2_red (vec-reduction s1_comb_2 4 8))
(define final_val_2_1 (vec-div s1_comb_2_red (lit (bv 3 (bitvector 8))) 1 8 ))


;; [3,1]
(define s1_comb_3_left (vec-shuffle-special avg_slide_red_3  avg_slide_red_4 1 8))
(define s1_comb_3_right (vec-shuffle-special avg_slide_red_5  (lit (bv 0 (bitvector 8))) 1 8))
(define s1_comb_3 (vec-shuffle-special s1_comb_3_left s1_comb_3_right 2 8))
(define s1_comb_3_red (vec-reduction s1_comb_3 4 8))
(define final_val_3_1 (vec-div s1_comb_3_red (lit (bv 3 (bitvector 8))) 1 8))



(define slide2_slice_0 (vec-shuffle-ext-special row_0 (lit (bv 0 (bitvector 48))) 6 8 2 3 ))
(define slide2_slice_1 (vec-shuffle-ext-special row_1 (lit (bv 0 (bitvector 48))) 6 8 2 3 ))
(define slide2_slice_2 (vec-shuffle-ext-special row_2 (lit (bv 0 (bitvector 48))) 6 8 2 3 ))
(define slide2_slice_3 (vec-shuffle-ext-special row_3 (lit (bv 0 (bitvector 48))) 6 8 2 3 ))
(define slide2_slice_4 (vec-shuffle-ext-special row_4 (lit (bv 0 (bitvector 48))) 6 8 2 3 ))
(define slide2_slice_5 (vec-shuffle-ext-special row_5 (lit (bv 0 (bitvector 48))) 6 8 2 3 ))

(define slide2_red_0 (vec-reduction slide2_slice_0 6 8))
(define slide2_red_1 (vec-reduction slide2_slice_1 6 8))
(define slide2_red_2 (vec-reduction slide2_slice_2 6 8))
(define slide2_red_3 (vec-reduction slide2_slice_3 6 8))
(define slide2_red_4 (vec-reduction slide2_slice_4 6 8))
(define slide2_red_5 (vec-reduction slide2_slice_5 6 8))



(define avg_slide2_red_0 (vec-div slide2_red_0 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_slide2_red_1 (vec-div slide2_red_1 (lit (bv 3 (bitvector 8))) 1 8  ))
(define avg_slide2_red_2 (vec-div slide2_red_2 (lit (bv 3 (bitvector 8)))  1 8))
(define avg_slide2_red_3 (vec-div slide2_red_3 (lit (bv 3 (bitvector 8)))  1 8 ))
(define avg_slide2_red_4 (vec-div slide2_red_4 (lit (bv 3 (bitvector 8)))  1 8 ))
(define avg_slide2_red_5 (vec-div slide2_red_5 (lit (bv 3 (bitvector 8)))  1 8))


;; [0,2]
(define s2_comb_0_left (vec-shuffle-special avg_slide2_red_0  avg_slide2_red_1 1 8))
(define s2_comb_0_right (vec-shuffle-special avg_slide2_red_2  (lit (bv 0 (bitvector 8))) 1 8))
(define s2_comb_0 (vec-shuffle-special s2_comb_0_left s2_comb_0_right 2 8))
(define s2_comb_0_red (vec-reduction s2_comb_0 4 8))
(define final_val_0_2 (vec-div s2_comb_0_red (lit (bv 3 (bitvector 8))) 1 8 ))


;; [1,2]
(define s2_comb_1_left (vec-shuffle-special avg_slide2_red_1  avg_slide2_red_2 1 8))
(define s2_comb_1_right (vec-shuffle-special avg_slide2_red_3  (lit (bv 0 (bitvector 8))) 1 8))
(define s2_comb_1 (vec-shuffle-special s2_comb_1_left s2_comb_1_right 2 8))
(define s2_comb_1_red (vec-reduction s2_comb_1 4 8))
(define final_val_1_2 (vec-div s2_comb_1_red (lit (bv 3 (bitvector 8))) 1 8 ))


;; [2,2]
(define s2_comb_2_left (vec-shuffle-special avg_slide2_red_2  avg_slide2_red_3 1 8))
(define s2_comb_2_right (vec-shuffle-special avg_slide2_red_4  (lit (bv 0 (bitvector 8))) 1 8))
(define s2_comb_2 (vec-shuffle-special s2_comb_2_left s2_comb_2_right 2 8))
(define s2_comb_2_red (vec-reduction s2_comb_2 4 8))
(define final_val_2_2 (vec-div s2_comb_2_red (lit (bv 3 (bitvector 8))) 1 8))


;; [3,2]
(define s2_comb_3_left (vec-shuffle-special avg_slide2_red_3  avg_slide2_red_4 1 8))
(define s2_comb_3_right (vec-shuffle-special avg_slide2_red_5  (lit (bv 0 (bitvector 8))) 1 8))
(define s2_comb_3 (vec-shuffle-special s2_comb_3_left s2_comb_3_right 2 8))
(define s2_comb_3_red (vec-reduction s2_comb_3 4 8))
(define final_val_3_2 (vec-div s2_comb_3_red (lit (bv 3 (bitvector 8))) 1 8 ))

;;3rd  idx column

(define slide3_slice_0 (vec-shuffle-ext-special row_0 (lit (bv 0 (bitvector 48))) 6 8 3 3 ))
(define slide3_slice_1 (vec-shuffle-ext-special row_1 (lit (bv 0 (bitvector 48))) 6 8 3  3 ))
(define slide3_slice_2 (vec-shuffle-ext-special row_2 (lit (bv 0 (bitvector 48))) 6 8 3 3 ))
(define slide3_slice_3 (vec-shuffle-ext-special row_3 (lit (bv 0 (bitvector 48))) 6 8 3 3 ))
(define slide3_slice_4 (vec-shuffle-ext-special row_4 (lit (bv 0 (bitvector 48))) 6 8 3 3 ))
(define slide3_slice_5 (vec-shuffle-ext-special row_5 (lit (bv 0 (bitvector 48))) 6 8 3 3 ))

(define slide3_red_0 (vec-reduction slide3_slice_0 6 8))
(define slide3_red_1 (vec-reduction slide3_slice_1 6 8))
(define slide3_red_2 (vec-reduction slide3_slice_2 6 8))
(define slide3_red_3 (vec-reduction slide3_slice_3 6 8))
(define slide3_red_4 (vec-reduction slide3_slice_4 6 8))
(define slide3_red_5 (vec-reduction slide3_slice_5 6 8))





(define avg_slide3_red_0 (vec-div slide3_red_0 (lit (bv 3 (bitvector 8))) 1 8))
(define avg_slide3_red_1 (vec-div slide3_red_1 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_slide3_red_2 (vec-div slide3_red_2 (lit (bv 3 (bitvector 8))) 1 8))
(define avg_slide3_red_3 (vec-div slide3_red_3 (lit (bv 3 (bitvector 8))) 1 8))
(define avg_slide3_red_4 (vec-div slide3_red_4 (lit (bv 3 (bitvector 8))) 1 8))
(define avg_slide3_red_5 (vec-div slide3_red_5 (lit (bv 3 (bitvector 8))) 1 8))


;; [0,3]
(define s3_comb_0_left (vec-shuffle-special avg_slide3_red_0  avg_slide3_red_1 1 8))
(define s3_comb_0_right (vec-shuffle-special avg_slide3_red_2  (lit (bv 0 (bitvector 8))) 1 8))
(define s3_comb_0 (vec-shuffle-special s3_comb_0_left s3_comb_0_right 2 8))
(define s3_comb_0_red (vec-reduction s3_comb_0 4 8))
(define final_val_0_3 (vec-div s3_comb_0_red (lit (bv 3 (bitvector 8))) 1 8 ))


;; [1,3]
(define s3_comb_1_left (vec-shuffle-special avg_slide3_red_1  avg_slide3_red_2 1 8))
(define s3_comb_1_right (vec-shuffle-special avg_slide3_red_3  (lit (bv 0 (bitvector 8))) 1 8))
(define s3_comb_1 (vec-shuffle-special s3_comb_1_left s3_comb_1_right 2 8))
(define s3_comb_1_red (vec-reduction s3_comb_1 4 8))
(define final_val_1_3 (vec-div s3_comb_1_red (lit (bv 3 (bitvector 8))) 1 8))


;; [2,3]
(define s3_comb_2_left (vec-shuffle-special avg_slide3_red_2  avg_slide3_red_3 1 8))
(define s3_comb_2_right (vec-shuffle-special avg_slide3_red_4  (lit (bv 0 (bitvector 8))) 1 8))
(define s3_comb_2 (vec-shuffle-special s3_comb_2_left s3_comb_2_right 2 8))
(define s3_comb_2_red (vec-reduction s3_comb_2 4 8))
(define final_val_2_3 (vec-div s3_comb_2_red (lit (bv 3 (bitvector 8))) 1 8))


;; [3,3]
(define s3_comb_3_left (vec-shuffle-special avg_slide3_red_3  avg_slide3_red_4 1 8))
(define s3_comb_3_right (vec-shuffle-special avg_slide3_red_5  (lit (bv 0 (bitvector 8))) 1 8))
(define s3_comb_3 (vec-shuffle-special s3_comb_3_left s3_comb_3_right 2 8))
(define s3_comb_3_red (vec-reduction s3_comb_3 4 8))
(define final_val_3_3 (vec-div s3_comb_3_red (lit (bv 3 (bitvector 8))) 1 8 ))

(define slice_0 (vec-load (reg 0) 288 0 3 8))  ; Row 0
(define slice_1 (vec-load (reg 0) 288 3 3 8) ) ; Row 0
(define slice_2 (vec-load (reg 0) 288 6 3 8) ) ; Row 1
(define slice_3 (vec-load (reg 0) 288 9 3 8) ) ; Row 1
(define slice_4 (vec-load (reg 0) 288 12 3 8)) ; Row 2
(define slice_5 (vec-load (reg 0) 288 15 3 8)) ; Row 2
(define slice_6 (vec-load (reg 0) 288 18 3 8)) ; Row 3
(define slice_7 (vec-load (reg 0) 288 21 3 8)) ; Row 3
(define slice_8 (vec-load (reg 0) 288 24 3 8)) ; Row 4
(define slice_9 (vec-load (reg 0) 288 27 3 8)) ; Row 4
(define slice_10 (vec-load (reg 0) 288 30 3 8)) ; Row 5
(define slice_11 (vec-load (reg 0) 288 33 3 8)) ; Row 5

(define extended_slice_0 (vec-shuffle-special slice_0 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_1 (vec-shuffle-special slice_1 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_2 (vec-shuffle-special slice_2 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_3 (vec-shuffle-special slice_3 (lit (bv 0 (bitvector 24))) 3 8))

(define extended_slice_4 (vec-shuffle-special slice_4 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_5 (vec-shuffle-special slice_5 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_6 (vec-shuffle-special slice_6 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_7 (vec-shuffle-special slice_7 (lit (bv 0 (bitvector 24))) 3 8))

(define extended_slice_8 (vec-shuffle-special slice_8 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_9 (vec-shuffle-special slice_9 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_10 (vec-shuffle-special slice_10 (lit (bv 0 (bitvector 24))) 3 8))
(define extended_slice_11 (vec-shuffle-special slice_11 (lit (bv 0 (bitvector 24))) 3 8 ))

(define reduced_eslice_0 (vec-reduction extended_slice_0 6 8))
(define reduced_eslice_1 (vec-reduction extended_slice_1 6 8))
(define reduced_eslice_2 (vec-reduction extended_slice_2 6 8))
(define reduced_eslice_3 (vec-reduction extended_slice_3 6 8))
(define reduced_eslice_4 (vec-reduction extended_slice_4 6 8))
(define reduced_eslice_5 (vec-reduction extended_slice_5 6 8))
(define reduced_eslice_6 (vec-reduction extended_slice_6 6 8))
(define reduced_eslice_7 (vec-reduction extended_slice_7 6 8))
(define reduced_eslice_8 (vec-reduction extended_slice_8 6 8))
(define reduced_eslice_9 (vec-reduction extended_slice_9 6 8))
(define reduced_eslice_10 (vec-reduction extended_slice_10 6 8))
(define reduced_eslice_11 (vec-reduction extended_slice_11 6 8))

(define avg_reslice_0 (vec-div reduced_eslice_0 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_1 (vec-div reduced_eslice_1 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_2 (vec-div reduced_eslice_2 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_3 (vec-div reduced_eslice_3 (lit (bv 3 (bitvector 8))) 1 8 ))

(define avg_reslice_4 (vec-div reduced_eslice_4 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_5 (vec-div reduced_eslice_5 (lit (bv 3 (bitvector 8))) 1 8 ))

(define avg_reslice_6 (vec-div reduced_eslice_6 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_7 (vec-div reduced_eslice_7 (lit (bv 3 (bitvector 8))) 1 8 ))

(define avg_reslice_8 (vec-div reduced_eslice_8 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_9 (vec-div reduced_eslice_9 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_10 (vec-div reduced_eslice_10 (lit (bv 3 (bitvector 8))) 1 8 ))
(define avg_reslice_11 (vec-div reduced_eslice_11 (lit (bv 3 (bitvector 8))) 1 8 ))


;; [0,0]
(define comb_0_left (vec-shuffle-special avg_reslice_0 avg_reslice_2 1 8 ))
(define comb_0_right (vec-shuffle-special avg_reslice_4 (lit (bv 0 (bitvector 8))) 1 8 ))
(define comb_0 (vec-shuffle-special  comb_0_left comb_0_right  2 8))
(define reduce_comb_0 (vec-reduction comb_0 4 8))
(define final_val_0_0 (vec-div reduce_comb_0 (lit (bv 3 (bitvector 8))) 1 8))


;; [1,0]
(define comb_1_left (vec-shuffle-special avg_reslice_2 avg_reslice_4 1 8 ))
(define comb_1_right (vec-shuffle-special avg_reslice_6 (lit (bv 0 (bitvector 8))) 1 8 ))
(define comb_1 (vec-shuffle-special  comb_1_left comb_1_right  2 8))
(define reduce_comb_1 (vec-reduction comb_1 4 8))
(define final_val_1_0 (vec-div reduce_comb_1 (lit (bv 3 (bitvector 8))) 1 8))


;; [2,0]
(define comb_2_left (vec-shuffle-special avg_reslice_4 avg_reslice_6 1 8 ))
(define comb_2_right (vec-shuffle-special avg_reslice_8 (lit (bv 0 (bitvector 8))) 1 8 ))
(define comb_2 (vec-shuffle-special  comb_2_left comb_2_right  2 8))
(define reduce_comb_2 (vec-reduction comb_2 4 8))
(define final_val_2_0 (vec-div reduce_comb_2 (lit (bv 3 (bitvector 8))) 1 8))



;; [3,0]
(define comb_3_left (vec-shuffle-special avg_reslice_6 avg_reslice_8 1 8 ))
(define comb_3_right (vec-shuffle-special avg_reslice_10 (lit (bv 0 (bitvector 8))) 1 8 ))
(define comb_3 (vec-shuffle-special  comb_3_left comb_3_right  2 8))
(define reduce_comb_3 (vec-reduction comb_3 4 8))
(define final_val_3_0 (vec-div reduce_comb_3 (lit (bv 3 (bitvector 8))) 1 8))


(define blur-dsl (vec-concat-16 
                   final_val_0_0 final_val_0_1 final_val_0_2 final_val_0_3
                   final_val_1_0 final_val_1_1 final_val_1_2 final_val_1_3
                   final_val_2_0 final_val_2_1 final_val_2_2 final_val_2_3
                   final_val_3_0 final_val_3_1 final_val_3_2 final_val_3_3
                   ))


(displayln "Column 0")
(println (interpret final_val_0_0 (vector image)))
(println (interpret final_val_1_0 (vector image)))
(println (interpret final_val_2_0 (vector image)))
(println (interpret final_val_3_0 (vector image)))


(displayln "Column 1")
(println (interpret final_val_0_1 (vector image)))
(println (interpret final_val_1_1 (vector image)))
(println (interpret final_val_2_1 (vector image)))
(println (interpret final_val_3_1 (vector image)))


(displayln "Column 2")
(println (interpret final_val_0_2 (vector image)))
(println (interpret final_val_1_2 (vector image)))
(println (interpret final_val_2_2 (vector image)))
(println (interpret final_val_3_2 (vector image)))


(displayln "Column 3")
(println (interpret final_val_0_3 (vector image)))
(println (interpret final_val_1_3 (vector image)))
(println (interpret final_val_2_3 (vector image)))
(println (interpret final_val_3_3 (vector image)))

(displayln "Input")
(print-mat image 6 6 8)

(displayln "Spec")
(print-mat (blur image 6 6 3 3 8 ) 4 4 8)


(displayln "DSL")
(print-mat (interpret blur-dsl (vector image) ) 4 4 8)

