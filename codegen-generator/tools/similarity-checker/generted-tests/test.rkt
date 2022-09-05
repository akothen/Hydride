#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)



(custodian-limit-memory (current-custodian) (* 2500 1024 1024))



(define (bvumaxval bitwidth)
  (apply 
  concat
    (for/list ([idx (range 0 bitwidth)])
      (bv #b1 1)
    )
  )
)


(define (bvsmaxval bitwidth)
  (define end (- bitwidth 1))
  (define res
  (apply 
  concat
    (for/list ([idx (range 0 end)])
      (bv #b1 1)
    )
  )
  )
  (concat (bv #b0 1) res)
)


(define (bvuminval bitwidth)
  (apply 
  concat
    (for/list ([idx (range 0 bitwidth)])
      (bv #b0 1)
    )
  )
)


(define (bvsminval bitwidth)
  (define end (- bitwidth 1))
  (define res
  (apply 
  concat
    (for/list ([idx (range 0 end)])
      (bv #b0 1)
    )
  )
  )
  (concat (bv #b1 1) res)
)


(define (bvssat vect bitwidth sat_size)
  (if (> bitwidth sat_size)
  (begin
    (cond
    [(bvslt vect (bv (bitvector->integer (bvsminval sat_size)) bitwidth)) (bvsminval sat_size)]
    [(bvsgt vect (bv (bitvector->integer (bvsmaxval sat_size)) bitwidth)) (bvsmaxval sat_size)]
    [else (extract (- sat_size 1) 0 vect)])
  )
  (begin
   vect
  )
 )
)


(define (bvpadhighbits vect num_pad_bits)
  (if (equal? num_pad_bits 0)
    (begin
      vect
    )
    (begin
      (concat (bv 0 num_pad_bits) vect)
    )
  )
)


(define (_mm256_packs_epi32  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define dst
(apply
concat
(for/list ([iterator.lane (reverse (range 0 %vectsize %lanesize1))])
 (concat 
  (apply
  concat
  (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %low.cofactor0 (*  iterator.0  %arg1))
   (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
   (define %lastidx1 (-  %arg0  1))
   (define %high.offset0 (+  %low.scaled.it0  %lastidx1))
   (define %0 (extract  %high.offset0 %low.scaled.it0 a))
   (define %1 (bvssat %0 %arg0 %elemsize ))
   %1
  )
  )
  (apply
  concat
  (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %low.cofactor1 (*  iterator.1  %arg4))
   (define %low.scaled.it2 (+  iterator.lane  %low.cofactor1))
   (define %low.offset0.new0 (-  %low.scaled.it2  %arg3))
   (define %lastidx3 (-  %arg2  1))
   (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
   (define %8 (extract  %high.offset2 %low.offset0.new0 b))
   (define %9 (bvssat %8 %arg2 %elemsize1 ))
   %9
  )
  )
 )
)
)
)
(bvpadhighbits  dst %arg5)
)


(define (_mm_packs_epi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define dst
(apply
concat
(for/list ([iterator.lane (reverse (range 0 %vectsize %lanesize1))])
 (concat 
  (apply
  concat
  (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %low.cofactor0 (*  iterator.0  %arg1))
   (define %lastidx1 (-  %arg0  1))
   (define %new_index1 (poly-grammar1 iterator.lane iterator.0 %low.cofactor0 #:depth 2))
   (define %high.offset0 (+  %new_index1  %lastidx1))
   (define %0 (extract  %high.offset0 %new_index1 a))
   (define %1 (bvssat %0 %arg0 %elemsize ))
   %1
  )
  )
  (apply
  concat
  (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %low.cofactor1 (*  iterator.1  %arg4))
   (define %low.offset0.new0 (-  %low.cofactor1  %arg3))
   (define %lastidx3 (-  %arg2  1))
   (define %new_index2 (poly-grammar2 iterator.lane iterator.1 %low.offset0.new0 #:depth 2))
   (define %high.offset2 (+  %new_index2  %lastidx3))
   (define %8 (extract  %high.offset2 %new_index2 b))
   (define %9 (bvssat %8 %arg2 %elemsize1 ))
   %9
  )
  )
 )
)
)
)
(bvpadhighbits  dst %arg5)
)



(define-grammar (poly-grammar1 iterator.lane iterator.0 %low.cofactor0)

                [expr 
                  ( choose
                    %low.cofactor0
                    iterator.lane
                    iterator.0
                    (+ (expr) (expr))
                    (- (expr) (expr))
                    (/ (expr) (expr))
                    (* (expr) (expr))
                    )]
                )



(define-grammar (poly-grammar2 iterator.lane iterator.1 %low.cofactor1)

                [expr 
                  ( choose
                    %low.cofactor1
                    iterator.lane
                    iterator.1
                    (+ (expr) (expr))
                    (- (expr) (expr))
                    (/ (expr) (expr))
                    (* (expr) (expr))
                    )]
                )




(define-symbolic a_1 (bitvector 128))
(define-symbolic b_1 (bitvector 128))

 ;;(define a_1 (bv #xe8c714f7a32a2f008e507fac893800607fb0ad004d9a8f9b35441dccffdc32af 256))
 ;;(define b_1 (bv #x3360c2d1bc10b932fdb0e2ec3c1fffea000181017791b50eb2eabb1ef85497d0 256))


(define %vectsize_1 256)
(define %lanesize1_1 128)
(define %lanesize2_1 64)
(define %lanesize3_1 128)
(define %elemsize_1 16)
(define %elemsize1_1 16)
(define %laneoffset_1 0)
(define %laneoffset1_1 64)

(define %arg0_1 32)
(define %arg1_1 2)
(define %arg2_1 32)
(define %arg3_1 128)
(define %arg4_1 2)
(define %arg5_1 0)



(define sol
    (synthesize
    #:forall (list  a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %lanesize3_1 %elemsize_1
               %elemsize1_1 %laneoffset_1 %laneoffset1_1 %arg0_1 %arg1_1 %arg2_1 %arg3_1 %arg4_1 %arg5_1)
    #:guarantee  (begin
            (assert  
                (equal? (_mm256_packs_epi32 a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %lanesize3_1 %elemsize_1
               %elemsize1_1 %laneoffset_1 %laneoffset1_1 %arg0_1 %arg1_1 %arg2_1 %arg3_1 %arg4_1 %arg5_1)
                        (_mm_packs_epi16 a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %lanesize3_1 %elemsize_1
               %elemsize1_1 %laneoffset_1 %laneoffset1_1 %arg0_1 %arg1_1 %arg2_1 %arg3_1 %arg4_1 %arg5_1)

)))))


(assert (sat? sol) "Unsatisfiable")
(print-forms sol)



