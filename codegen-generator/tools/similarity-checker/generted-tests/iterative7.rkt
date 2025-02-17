#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require racket/serialize)
(require rosette/lib/destruct)
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
                              ;;(define %new_index1 (?hole_op iterator.lane iterator.0 %low.cofactor0 #:depth 1))
                              (define %new_index1 (expression iterator.lane iterator.0 %low.cofactor0 1))
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
                              ;;(define %new_index2 (?hole_op iterator.lane iterator.1 %low.offset0.new0 #:depth 1))
                              (define %new_index2 (expression iterator.lane iterator.1 %low.offset0.new0 1))
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


(struct VAR (a) #:transparent #:mutable)
(struct SCALAR (a) #:transparent #:mutable)
(struct ADD (a b) #:transparent #:mutable)
(struct SUB (a b) #:transparent #:mutable)
(struct MUL (a b) #:transparent #:mutable)

(define (cost prog)
  (destruct prog
      [(VAR a) 0]
      [(SCALAR a) 0]
      [(ADD a b) (+ 1 (cost a) (cost b))]
      [(SUB a b) (+ 1 (cost a) (cost b))]
      [(MUL a b) (+ 1 (cost a) (cost b))]
      [_ (error "Unrecognized term in param abstract cost")]
  )
)

(define (interpret prog)
  (destruct prog
    [(VAR a) a]
    [(SCALAR a) a]
    [(ADD a b) (+ (interpret a) (interpret b))]
    [(SUB a b) (- (interpret a) (interpret b))]
    [(MUL a b) (* (interpret a) (interpret b))]
    [_ (error "Unrecognized term in param abstract interpreter")]
  )
)

(define (to-string prog)
  (destruct prog
    [(VAR a) (~s a)]
    [(SCALAR a) (~s a)]
    [(ADD a b) (format "(+ ~a ~a)" (to-string a) (to-string b) )]
    [(SUB a b) (format "(- ~a ~a)" (to-string a) (to-string b) )]
    [(MUL a b) (format "(* ~a ~a)" (to-string a) (to-string b) )]
    [_ (error "Unrecognized term in param abstract to string")]
  )
)


(define-grammar (?hole_op x y z)
  [expr 
    (choose 
      (VAR x)
      (VAR y)
      (VAR z)
      (SCALAR 0)
      (SCALAR 1)
      (SCALAR 2)
      (ADD (expr) (expr))
      (MUL (expr) (expr))
      (SUB (expr) (expr))
    )
  ]
)

(define (expression x y z k)
  (interpret (?hole_op x y z #:depth k))
)

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


(define (synthesis)
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
  (cond 
    [(sat? sol) (values #t sol)]
    [else (values #f '())]
  )
  (print-forms sol)
  ;;sol
)


;; (define (synthesis)
;;   (pretty-display "solving...")
;;   (define sol
;;     (optimize
;;       #:minimize 
;;       #:guarantee (assert (bveq 
;;         (_mm256_packs_epi32 a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
;;         (_mm_packs_epi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
;;       ))
;;     )
;;   )
;;   (print-forms sol)
;;    (define cex 
;;      (verify (assert (bveq
;;       (_mm256_packs_epi32 a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
;;       sol
;;     ))))
;;    cex
;; )


(define t0 (current-seconds))
(synthesis)
(define t1 (current-seconds))
(- t1 t0)


