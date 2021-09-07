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

(define (spec v-acc v1 v2 len red)
  (apply
   concat
   (for/list ([i (range len)])
     (define sum
       (apply
        bvadd
        (for/list ([j (range red)])
          (bvmul (sign-ext-bv v1 (+ j (* i 2)) 16 32) (sign-ext-bv v2 (+ j (* i 2)) 16 32)))))
     (bvadd (ext-bv v-acc i 32) sum))))


(define (sketch v-acc v1 v2 len red)
  (define-symbolic r integer?)
  ;;(define-symbolic q integer? (apply choose* (list 8 16 32 64)))
  (define q (apply choose* (list 8 16 32 64)))
  ;;(define p (apply choose* (list 32 64)))
  (apply
   concat
   (for/list ([i (range len)])
     (define sum
       (apply
        bvadd
        (for/list ([j (range red)])
          (bvmul (sign-ext-bv v1 (+ j (* i r)) q 32) (sign-ext-bv v2 (+ j (* i r)) q 32)))))
     (bvadd (ext-bv v-acc i 32) sum))))



(define (same p f v1 v2 v3 len red)
 (assert (equal?  (p v1 v2 v3 len red) (f v1 v2 v3 len red))))


(define-symbolic a (bitvector 128))
(define-symbolic b (bitvector 128))
(define-symbolic c (bitvector 128))

;;(define-symbolic len integer?)
;;(define-symbolic red integer?)

(time (synthesize
 #:forall (list a b c)
 #:guarantee (same spec sketch c a b 4 2)))


;; Test the spec
(define p (bv #x00010001000100010001000100010001 128))
(define q (bv #x00010001000100010001000100010001 128))
(define r (bv #x00000000000000000000000000000000 128))

(define (res x y z)
  (pretty-print	 (spec x y z 4 2)))
  ;;(pretty-print	 (sketch x y z)))

(res r p q)
