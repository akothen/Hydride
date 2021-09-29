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



(define (no-op a)
  a)


