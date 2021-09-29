

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
  (gen-grammar a b c #:depth 1)
)
