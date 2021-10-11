#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

;; Function to extract a bitvector
;; depending on the given type size
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)

(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

;; HVX VRMPY 
;;for (i = 0; i < VELEM(32); i++) {
;;  Vx.w[i] += (Vu.uw[i].ub[0] * Vv.w[i].b[0]);
;;  Vx.w[i] += (Vu.uw[i].ub[1] * Vv.w[i].b[1]);
;;  Vx.w[i] += (Vu.uw[i].ub[2] * Vv.w[i].b[2]);
;;  Vx.w[i] += (Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;
;}
(define (hvx_vrmpy v-acc v1 v2 len red out_precision)
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply
        bvadd
        (for/list ([j (reverse (range red))])
          (bvmul (zero-ext-bv v1 (+ j (* i 4)) 8 out_precision) (sign-ext-bv v2 (+ j (* i 4)) 8 out_precision)))))
     (bvadd (ext-bv v-acc i out_precision) (sign-extend sum (bitvector out_precision))))))

