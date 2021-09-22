#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

;(current-bitwidth 32)

; Import the DSL definitions
;(require (file "/Users/abdulrafaenoor/Documents/Rosette/Rosette-experiments-main/dsl.rkt"))

(define int128? (bitvector 128))
(define int32? (bitvector 32))
(define int8? (bitvector 8))
(define int4? (bitvector 4))

(define (int4 i)
  (bv i int4?))

(define (int8 i)
  (bv i int8?))

(define (int32 i)
  (bv i int32?))

(define (int128 i)
  (bv i int128?))

;; Some uility functions
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)
  
(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)






;; This is the "spec". 
(define (compute dst a b)
  (apply
   concat
   (for/list ([j (range 4)])
     (define tmp
       (bvmul (ext-bv a (- 3 j) 32) (ext-bv b (- 3 j) 32)))
     (bvadd (ext-bv dst (- 3 j) 32) tmp)
     )
   )
  )


;; Vector mac (DSL instruction)
(define (vector-mac dst a b len precision)
  (begin
  (assert (bv? dst))
  (assert (bv? a))
  (assert (bv? b))
  (apply
   concat
   (for/list ([j (range len)])
     (define tmp
       (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision)))
     (bvadd (ext-bv dst (- (- len 1) j) precision) tmp)
     )
   )
  )
)

;; Vector Add 
(define (vector-add a b len precision)
  (apply
   concat
   (for/list ([j (range len)])
     (define tmp
       (bvadd (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision)))
     tmp
     )
   )
  )

;; Vector Sub
(define (vector-sub a b len precision)
  (apply
   concat
   (for/list ([j (range len)])
     (define tmp
       (bvsub (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision)))
     tmp
     )
   )
  )
;; Vector Mul
(define (vector-mul a b len precision)
  (apply
   concat
   (for/list ([j (range len)])
     (define tmp
       (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision)))
     tmp
     )
   )
  )
;
;;; Vector mac fixed
;(define (vector-mac-fixed dst a b)
;  (apply
;   concat
;   (for/list ([j (range 4)])
;     (define tmp
;       (bvmul (ext-bv a (- (- 4 1) j) 32) (ext-bv b (- (- 4 1) j) 32)))
;     (begin
;       (define dst_res (bvadd (ext-bv dst j 32) tmp))
;       ;(assert (bvsge dst_res (ext-bv dst j 32)))
;       dst_res
;     )
;   )
;  )
;  )
;
;(define (vector-mac-unrolled dst a b)
;  (apply
;   concat (list 
;       (bvadd (ext-bv dst 0 32) (bvmul (ext-bv a 3 32) (ext-bv b 3 32)))
;       (bvadd (ext-bv dst 1 32) (bvmul (ext-bv a 2 32) (ext-bv b 2 32)))
;       (bvadd (ext-bv dst 2 32) (bvmul (ext-bv a 1 32) (ext-bv b 1 32)))
;       (bvadd (ext-bv dst 3 32) (bvmul (ext-bv a 0 32) (ext-bv b 0 32)))
;       )
;     )
;   )
; 
;
;
(define arg1  (apply concat
              (for/list ([j (range 4)])
                 (bv j 32))
  )
)

(define arg2  (apply concat
              (for/list ([j (range 4)])
                 (bv j 32))
  )
)

(define acc  (apply concat
              (for/list ([j (range 4)])
                 (bv (- 4 j) 32))
  )
)

;(bv? acc
;(print acc)
;(print arg1)
;(print arg2)
;(vector-mac acc arg1 arg2 4 32)
;;
;(define res (compute acc arg1 arg2))
;;(define vec-res (vector-mac acc arg1 arg2 (bitvector->integer (int4 4)) 32))
;(define vec-res (vector-mac acc arg1 arg2 4 32))
;(define fixed-res (vector-mac-fixed acc arg1 arg2))
;(define unrolled-res (vector-mac-unrolled acc arg1 arg2))
;(assert (equal? res vec-res) "Implementations not equal")
;(assert (equal? fixed-res vec-res) "Implementations not equal")
;(assert (equal? fixed-res unrolled-res) "Implementations not equal")

(define-grammar (vec_grammar a b c)
  [expr                            
   (choose  a b c
            (vector-mac (arg) (arg) (arg) 1 (scale))
            (vector-add (arg) (arg) 1 (scale))
            (vector-sub (arg) (arg) 1 (scale))
            (vector-mul (arg) (arg) 1 (scale))
            (vector-mac (arg) (arg) (arg) 2 (scale))
            (vector-add (arg) (arg) 2 (scale))
            (vector-sub (arg) (arg) 2 (scale))
            (vector-mul (arg) (arg) 2 (scale))
            (vector-mac (arg) (arg) (arg) 4 (scale))
            (vector-add (arg) (arg) 4 (scale))
            (vector-sub (arg) (arg) 4 (scale))
            (vector-mul (arg) (arg) 4 (scale))
           )]
  [arg
   (choose a b c)]
  [scale
   (choose 16 32)]

  )


(define (no-op a)
  a)


(define-grammar (gen-grammar arg0 arg1 arg2)
[expr (choose
	arg0
	arg1
	arg2
        (int128 0)
        (no-op (expr))
	(vector-mac (expr) (expr) (expr) 8 16)
	(vector-add (expr) (expr) 8 16)
	(vector-sub (expr) (expr) 8 16)
	(vector-mul (expr) (expr) 8 16)
	(vector-mac (expr) (expr) (expr) 4 32)
	(vector-add (expr) (expr) 4 32)
	(vector-sub (expr) (expr) 4 32)
	(vector-mul (expr) (expr) 4 32)
	(vector-mac (expr) (expr) (expr) 2 64)
	(vector-add (expr) (expr) 2 64)
	(vector-sub (expr) (expr) 2 64)
	(vector-mul (expr) (expr) 2 64)
        (vector-mac (expr) (expr) (expr) 1 128)
	(vector-add (expr) (expr) 1 128)
	(vector-sub (expr) (expr) 1 128)
	(vector-mul (expr) (expr) 1 128))]
)

(define (vmac_synth a b c)
  (gen-grammar a b c #:depth 2)
)

(define-symbolic _arg1 (bitvector 128))
(define-symbolic _arg2 (bitvector 128))
(define-symbolic _acc  (bitvector 128))

;(for/list ([j (range 4)])
;  (begin
;    (define a1_j (ext-bv _arg1 (- (- 4 1) j) 32))
;    (define a2_j (ext-bv _arg2 (- (- 4 1) j) 32))
;    (define acc_j (ext-bv _acc (- (- 4 1) j) 32))
;    (assume (bvsge a1_j (int32 0)))
;    (assume (bvsge a2_j (int32 0)))
;    (assume (bvsge acc_j (int32 0)))
;    (assume (bvsle a1_j (int32 32)))
;    (assume (bvsle a2_j (int32 32)))
;    (assume (bvsle acc_j (int32 32)))
;)

(define (verify-impl impl ref)
  (verify (assert (equal? (impl _acc _arg1 _arg2) (ref _acc _arg1 _arg2)))))

(define cex1_arg1 (bv #x1c35991bcc1b1dbb424f12036c14862b 128))
(define cex1_arg2 (bv #x3aa510518bc70cbf5bf01eff30c0900d 128))
(define cex1_acc (bv #xf0e008163b947687c0102100448ea0af 128))

(define cex2_arg1 (bv #xde388d971f8503f580007ffa0101ffef 128))
(define cex2_arg2 (bv #x66da214dab368e9e471c555634987f5f 128))
(define cex2_acc (bv #xa8ea0d6b0708573600000000013e8ab3 128))


;; As mentioned in the porcupine paper
;; having input over symbolic bitvectors
;; presents universal quantifiers
;; which can cause time-out or exhaust memory.
;; Modified the synthesis approach to
;; 1. Take concrete inputs and attempt
;; to synthesize function.
;; 2. Attempt to verify equivalance over all
;; symbolic inputs. Will yield counter example. (verify-impl?)
;; 3. Re-insert the concret counter example
;; into the synthesis contraint, stating it must
;; also satisfy this.
;; 4. Repeat steps 3 and 4 until verification step
;; produces unsat.

;(define sol 
;(time
;(synthesize
;     #:forall (list acc arg1 arg2 cex1_arg1 cex1_arg2 cex1_acc cex2_arg1 cex2_arg2 cex2_acc)
;     #:guarantee (assert (and
;                          (equal? (compute cex1_acc cex1_arg1 cex1_arg2) (vmac_synth cex1_acc
;                                                                        cex1_arg1
;                                                                        cex1_arg2
;                                                                    ))
;                          (equal? (compute cex2_acc cex2_arg1 cex2_arg2) (vmac_synth cex2_acc
;                                                                        cex2_arg1
;                                                                        cex2_arg2
;                                                                    ))
;
;                          (equal? (compute acc arg1 arg2) (vmac_synth acc
;                                                                        arg1
;                                                                        arg2
;                                                                        ))
;
;                                )))))
;
;(assert (sat? sol) "Unsatisfiable")
;(print-forms sol)


;; Without no-op and 0 bitvector
;(define (vmac_gen a b c)
;   (vector-add (vector-sub a a 4 32) (vector-mac a c b 4 32) 4 32))

;; With no-op and 0 bitvector
;(define (vmac_gen a b c) (no-op (vector-mac a c b 4 32)))


;; adding counter examples
;(define (vmac_gen a b c)
;   (vector-sub
;    (vector-mac a b c 4 32)
;    (vector-sub (int128 0) (int128 0) 8 16)
;    8
;    16))

; =========================================================================================================

(define relu-arg (apply concat (list (int32 1) (int32 2) (int32 3) (int32 -1))))

(define (bvmax a b)
  (if (bvsle a b) b a))

(define (tensor-relu arg length width precision)
  (apply
   concat
   (for/list ([i (range length)])
     (apply
      concat
      (for/list ([j (range width)])
        (define size (* length width))
        (define idx (- (- size 1)(+ (* i length) j)))
        
        (define value (ext-bv arg idx precision))
        (define max (bvmax value (bv 0 (bitvector precision))))
        max
        )
      )
    )
   )
  )


(define (tensor-matmul arg1 arg2 length1 common_dim width2 precision)
  (apply
   concat
   (for/list ([i (range length1)])
     (apply concat
      (for/list ([j (range width2)])
        (define size1 (* length1 common_dim))
        (define size2 (* width2 common_dim))
        (apply bvadd (for/list ([k (range common_dim)])
          (define idx_left (- (- size1 1)(+ (* i length1) k)))
          (define idx_right (- (- size2 1)(+ (* k common_dim) j)))
          (define value1 (ext-bv arg1 idx_left precision))
          (define value2 (ext-bv arg2 idx_right precision))
          (bvmul value1 value2)
        )
           )
       )
      )
      )
    )
   )
  

(define (relu-ref arg)
  (apply
   concat
   (for/list ([i (range 2)])
     (apply
      concat
      (for/list ([j (range 2)])
        (define size (* 2 2))
        (define idx (- (- size 1)(+ (* i 2) j)))
        
        (define value (ext-bv arg idx 32))
        (define max (bvmax value (bv 0 (bitvector 32))))
        max
        )
      )
    )
   )
  )


(define-grammar (tensor-grammar arg0)
[expr (choose
	arg0
        (int128 0)
        (no-op (expr))
        (tensor-relu (expr) 2 2 32)
        (tensor-relu (expr) 4 4 8)
        )]
)

(define (tensor_synth a)
  (tensor-grammar a #:depth 1)
)


;(tensor-matmul relu-arg relu-arg 2 2 2 32)

(define cex1_arg (bv #x007f7f7f007f7f7f00807d7f007f7f7f 128))

(define sol 
(time
(synthesize
     #:forall (list relu-arg cex1_arg)
     #:guarantee (assert (and
                          (equal? (relu-ref relu-arg) (tensor_synth relu-arg
                                                                    ))
                          (equal? (relu-ref cex1_arg) (tensor_synth cex1_arg
                                                                    ))
                                )))))

(assert (sat? sol) "Unsatisfiable")
(print-forms sol)

(define tensor_gen (generate-forms sol))

(define (verify-relu impl ref)
  (verify (assert (equal? (impl _acc) (ref _acc)))))

(print-forms (verify-relu tensor_gen relu-ref))



(define-grammar (matmul-grammar arg0 arg1)
[expr (choose
	arg0
        arg2
        (int128 0)
        (no-op (expr))
        (tensor-matmul (expr) (expr) 2 2 2 32)
        (tensor-matmul (expr) (expr) 1 4 1 32)
        )]
)

(define (matmul_synth a b)
  (matmul-grammar a b #:depth 1)
)

