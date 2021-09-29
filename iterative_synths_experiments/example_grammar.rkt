
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
