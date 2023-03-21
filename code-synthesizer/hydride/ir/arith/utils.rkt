#lang rosette
;#lang rosette/safe

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require rosette/lib/destruct)
(require
  (only-in racket/base error bitwise-and)
  rosette/lib/destruct
  hydride/cpp
  hydride/utils/bvops
  hydride/ir/arith/types
  hydride/ir/arith/interpreter
  hydride/ir/arith/visitor
  
  )

(provide (prefix-out arith: (all-defined-out)))



(define (get-expr-depth e)
  (define depth 1)
  (destruct e
            [(arith:tensor data shape layout elemT buffsize)
             (set! depth 0)
             ]
            [_
  (define sub-exp (arith:sub-exprs e))
  (for/list ([se sub-exp])
            (define sub-depth (get-expr-depth se))
            (define edge-depth (+ 1 sub-depth))
            (set! depth (max depth edge-depth))
            )
              ]
            )
  depth
  
  )



(define (get-expr-bv-sizes expr-list)

  (for/list ([i (range (length expr-list))])
            (vec-size (list-ref expr-list i))
            )
  
  )


(define (get-elemT expr)
  (destruct expr
            [(arith:tensor data shape layout elemT buffsize)
             elemT
             ]
            [(arith:tensor-add v1 v2)
             (get-elemT v1)
             ]
            )
  
  
  )


(define (get-expr-elemT expr-list)
  (for/list ([i (range (length expr-list))])
            (get-elemT (list-ref expr-list i))
            )
  
  )


(define (elemT-size elemT) 
(cond
    [(eq? elemT 'int8) 8]
    [(eq? elemT 'int16) 16]
    [(eq? elemT 'int32) 32]
    [(eq? elemT 'int64) 64]
    [(eq? elemT 'uint1) 1]
    [(eq? elemT 'uint8) 8]
    [(eq? elemT 'uint16) 16]
    [(eq? elemT 'uint32) 32]
    [(eq? elemT 'uint64) 64]
    [else (error "arith/utils.rkt: Unexpected buffer type in elemT-size" elemT )])
)

(define (vec-size expr)

  (define input-shape (arith:tensor-shape expr))
  (define num-elems (arith:get-num-elements input-shape))
  (define element-type (get-elemT expr))
  (define element-bitwidth (elemT-size element-type))
  (* num-elems element-bitwidth)
  )

(define (vec-len expr)
  (define input-shape (arith:tensor-shape expr))
  (vector-ref input-shape 0)
  )

(define (vec-precision expr)
  (define element-type (get-elemT expr))
  (define element-bitwidth (elemT-size element-type))
  element-bitwidth
  )

(define (scale-down-expr expr scale-factor)
  (values #t expr)
  )



(define (create-buffers sub-expr-ls sym-bvs)
  (list->vector (for/list ([i (range (length sub-expr-ls))])
            (define expr (list-ref sub-expr-ls i))
            (define sym-bv (vector-ref sym-bvs i))
            (define size (vec-size expr))
            (define expr-elemT (get-elemT expr))
            (println (arith:tensor-layout expr))
            (arith:create-tensor sym-bv (arith:tensor-shape expr) (arith:tensor-layout expr) expr-elemT)
            )
  )
)





(define (bind-expr-args expr args depth)
  (define (arg i) (vector-ref args i))
  (define is-leaf-depth (eq? depth 1))

  (destruct expr
            [(arith:tensor data shape layout elemT buffsize)
             (values (arg 0) 1)
             ]
            [(arith:tensor-add v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-add (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-add leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]
            
            )

  )


(define (hash-expr expr)
  (define (visitor-fn e)
    (destruct e
              [(arith:tensor data shape layout elemT buffsize)               
                (list 'buf shape layout elemT buffsize)
               ]
              [_ e]
              )
    )

  (define hashed-expr (arith:visit expr visitor-fn))
  hashed-expr
  )

(define (get-sub-exprs expr depth)

  (cond
    [(equal? expr '())
     expr
     ]
    [(<= depth 0)
     (list )
     ]
    [(equal? depth 1)
        (list expr)
     ]
    [else
      (define imm-sub-exprs (arith:sub-exprs expr))
      (apply append
             (for/list ([i (range (length imm-sub-exprs))])
                       (define imm-sub-expr (list-ref imm-sub-exprs i))
                       (define decremented-depth 
                         (- depth 1)
                         )
                       (get-sub-exprs (list-ref imm-sub-exprs i) decremented-depth)
                       )
             )
     ]
    
    )

  )



(define (print-buffer-type-info buff)

  (define elemT (get-elemT buff))
  (define step-size
    (cond
        [(eq? elemT 'int8) 8]
        [(eq? elemT 'int16) 16]
        [(eq? elemT 'int32) 32]
        [(eq? elemT 'int64) 64]
        [(eq? elemT 'uint1) 1]
        [(eq? elemT 'uint8) 8]
        [(eq? elemT 'uint16) 16]
        [(eq? elemT 'uint32) 32]
        [(eq? elemT 'uint64) 64]
        [else (error "arith/utils.rkt: Unexpected buffer type in print-buffer-type-info" buff)])
    )
  (define buffer-size (vec-size buff))
  (define buffer-num-elem (/ buffer-size step-size))

  (string-append "<" (~s buffer-num-elem) " x i" (~s step-size) ">")
  
  )



(define (get-bv-ops expr)
  (destruct expr
            [(arith:tensor data shape layout elemT buffsize)
             (list (if (arith:is-buffer-signed expr)  (list sign-extend)  (list zero-extend)))
             ]
            [(arith:tensor-add v1 v2) (append (list extract bvadd) (if (arith:is-signed-expr? v1 v2) (list sign-extend  ) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2) )]
            )


  )

