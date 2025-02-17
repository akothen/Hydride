#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require racket/serialize)
;;(require hydride)


;;(enable-debug)
(current-bitwidth 16)
(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define solver 'z3)


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
                              ;;(define %new_index1 (poly-grammar1 iterator.lane iterator.0 %low.cofactor0 #:depth 2 ) )
                              ;;(define %new_index1 (+ iterator.lane %low.cofactor0))
                              (define %new_index1 (?hole_op iterator.lane iterator.0 %low.cofactor0))
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
                              ;;(define %new_index2 (poly-grammar2 iterator.lane iterator.1 %low.offset0.new0 #:depth 2 ) )
                              ;;(define %new_index2 (+ iterator.lane %low.offset0.new0))
                              (define %new_index2 (?hole_op iterator.lane iterator.1 %low.offset0.new0))
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


(define-synthax (?hole_op x y z)
   ((choose + - *) (choose x y z) (choose x y z))
)

;;(define-grammar (?hole_op x y z)
;;    [expr ((choose + - *) (choose x y z 0 1 2) (choose x y z 0 1 2))]
;;)


(define %vectsize 256)
(define %lanesize1 128)
(define %lanesize2 64)
(define %lanesize3 128)
(define %elemsize 16)
(define %elemsize1 16)
(define %laneoffset 0)
(define %laneoffset1 64)
(define %arg0 32)
(define %arg1 2)
(define %arg2 32)
(define %arg3 128)
(define %arg4 2)
(define %arg5 0)

(define-symbolic a (bitvector %vectsize))
(define-symbolic b (bitvector %vectsize))


(define (synthesis1)
  (pretty-display "solving...")
  (define sol
    (synthesize
      #:forall (list a b)
      #:guarantee (assert (bveq 
        (_mm256_packs_epi32 a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
        (_mm_packs_epi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
      ))
    )
  )
  (print-forms sol)
   (print (assert (bveq
      (_mm256_packs_epi32 a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
      sol
    )))
)



 (define a_1 (bv #x0200200800100040773a80202004002004040000020002002001000001000040 256))
 (define b_1 (bv #x4000800050001100004000002000200020008000020010001000800000800001 256))

(define a_2 (bv #x3fffc0004012000300010001000110007fff6000300018000c00040c10008000 256))
(define b_2 (bv #xc000004080000081800300018002000080024020800000348290000a80040008 256))

(define (synthesis)
  (pretty-display "solving...")
  (define sol
    (time (solve
      (assert 
      (and 
        (bveq
        (_mm256_packs_epi32 a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
        (_mm_packs_epi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
        )
        (bveq
        (_mm256_packs_epi32 a_1 b_1 %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
        (_mm_packs_epi16  a_1 b_1 %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
        )
        (bveq
        (_mm256_packs_epi32 a_2 b_2 %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
        (_mm_packs_epi16  a_2 b_2 %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
        )
    )
    )
    )))
  (print-forms sol)
   (print-forms (verify (assert (bveq
      (_mm256_packs_epi32 a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
      sol
    ))))
)
(define t0 (current-seconds))
(synthesis)
(define t1 (current-seconds))
(- t1 t0)

;;(if (sat? solution) (print-forms solution) (print "UNSAT"))



