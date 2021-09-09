#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

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
(define (_mm_dpwssd_epi32 src a b len red_len out_precision)
  (apply
   concat
   (for/list ([j (range len)])
     (define tmp
       (apply
        bvadd
        (for/list ([k (range red_len)])
          (bvmul (sign-ext-bv a (+ k (* j 4)) 8 out_precision) (sign-ext-bv b (+ k (* j 4)) 8 out_precision)))))
     (bvadd (ext-bv src j out_precision) tmp))))


;; This is the "sketch".
(define (hvx_vrmpy Vx Vu Vv len red_len out_precision)
  (define-symbolic ??p integer?)
  (define-symbolic ??q integer?)
  (apply
   concat
   (for/list ([i (range len)])
     (define tmp
       (apply
        bvadd
        (for/list ([j (range red_len)])
          (bvmul (sign-ext-bv Vu (+ j (* i ??p)) ??q out_precision) (sign-ext-bv Vv (+ j (* i ??p)) ??q out_precision)))))
     (bvadd (ext-bv Vx i out_precision) tmp))))



(define-symbolic asym128 (bitvector 128))
(define-symbolic bsym128 (bitvector 128))
(define-symbolic csym128 (bitvector 128))

(define len 4)
(define red_len 2)
(define out_precision 32)

(time (synthesize
 #:forall (list asym128 bsym128 csym128)
 #:guarantee (assert (equal?  (_mm_dpwssd_epi32 csym128 asym128 bsym128 len red_len out_precision)
                              (hvx_vrmpy csym128 asym128 bsym128 len red_len out_precision)))))


