#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

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
  (apply
   concat
   (for/list ([j (range len)])
     (define tmp
       (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision)))
     (bvadd (ext-bv dst (- (- len 1) j) precision) tmp)
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
;(define arg1  (apply concat
;              (for/list ([j (range 4)])
;                 (bv j 32))
;  )
;)
;
;(define arg2  (apply concat
;              (for/list ([j (range 4)])
;                 (bv j 32))
;  )
;)
;
;(define acc  (apply concat
;              (for/list ([j (range 4)])
;                 (bv 1 32))
;  )
;)
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


(define (vmac_synth a b c)
  (vec_grammar a b c #:depth 4)
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



(define sol 
(time
(synthesize
     #:forall (list _acc _arg1 _arg2)
     #:guarantee (assert (equal? (compute _acc _arg1 _arg2) (vmac_synth _acc
                                                                        _arg1
                                                                        _arg2
                                                                        ))))))

(assert (sat? sol) "Unsatisfiable")
(print-forms sol)




