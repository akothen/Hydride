#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

;; Function to extract a bitvector
;; depending on the given type size
(define (ext-bv x i type_size)
  (define var (extract (+ (* i type_size) (- type_size 1)) (* i type_size) x))
  (pretty-print	 var)
  (pretty-print	 (* i type_size))
  (pretty-print	 (+ (- type_size 1) (* i type_size)))
  var)


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


;; Test the spec
(define p (bv #x00010001000100010001000100010001 128))
(define q (bv #x00010001000100010001000100010001 128))
(define r (bv #x00000000000000000000000000000000 64))

(define (res x y z)
  (pretty-print	 x)
  (pretty-print	 y)
  (pretty-print	 z)
  (pretty-print	 (spec x y z)))

(res r p q)
