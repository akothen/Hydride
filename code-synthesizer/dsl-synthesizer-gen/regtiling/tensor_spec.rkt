#lang rosette


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


;; Relu spec
(define (tensor-relu arg row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvsmax (ext-bv arg i precision) (bv 0 (bitvector precision))))))
 result
)


;; Add spec
(define (tensor-add arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvadd (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)

;; Sub spec
(define (tensor-sub arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvsub (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)


;; Mul spec
(define (tensor-mul arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvmul (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)

;; Sdiv spec
(define (tensor-sdiv arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvsdiv (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)

;; Udiv spec
(define (tensor-udiv arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvudiv (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)



;; And spec
(define (tensor-and arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvand (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)


;; Or spec
(define (tensor-or arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvor (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)


;; Xor spec
(define (tensor-xor arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvxor (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)


;; Shl spec
(define (tensor-shl arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvshl (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)


;; Lshr spec
(define (tensor-lshr arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvlshr (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)

;; Ashr spec
(define (tensor-ashr arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvashr (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)


;; Srem spec
(define (tensor-srem arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvsrem (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)

;; Urem spec
(define (tensor-urem arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvurem (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)


;; Smod spec
(define (tensor-smod arg1 arg2 row col precision)
 (define size (* row col))
 (define result
 (apply
  concat 
  (for/list ([i (reverse (range size))])
    (bvsmod (ext-bv arg1 i precision) (ext-bv arg2 i precision)))))
 result
)

