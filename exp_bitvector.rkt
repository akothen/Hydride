#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)

;; Function to extract a bitvector
;; depending on the given type size
(define (ext-bv x i type_size)
  (extract (+ i (- type_size 1)) i x))


(define (spec v-acc v1 v2)
  (apply
   concat
   (for/list ([i (range 4)])
     (define sum
       (apply
        bvadd
        (for/list ([j (range 2)])
          (bvmul (ext-bv v1 (+ j (* i 2)) 16) (ext-bv v2 (+ j (* i 2)) 16)))))
     (bvadd (ext-bv v-acc i 16) sum))))


(define (same p f v1 v2 v3)
 (assert (= (p v1 v2 v3) (f v1 v2 v3))))



(define-symbolic a (bitvector 128))
(define-symbolic b (bitvector 128))
(define-symbolic c (bitvector 64))

;;(synthesize
;; #:forall (list a b c)
;; #:guarantee (same spec sketch c a b))

(define p (bv 1 128))
(define q (bv 1 128))
(define r (bv 0 64))

(define (res x y z)
  (print (spec x y z))
  (print r))

(print (res r p q))

