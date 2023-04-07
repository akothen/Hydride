#lang rosette
;#lang rosette/safe

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require rosette/lib/destruct)
(require
  (only-in racket/base error bitwise-and)
  rosette/lib/destruct
  hydride/cpp
  hydride/ir/halide/types
  hydride/ir/halide/interpreter
  hydride/ir/halide/visitor
  hydride/utils/debug
  hydride/utils/misc
  hydride/utils/bvops
  hydride/synthesis/symbolic_synthesis
  )

(require racket/match)

(provide (prefix-out halide: (all-defined-out)))


;; Extract sub-expressions
;; Obtain sizes of sub-expressions
;; return a function which:
;; Given an expression of size len(sub-expressions) -> Bind elements of vectors accordingly


(define (is-broadcast expr)
  (destruct expr
    [(x8 sca) #t]
    [(x16 sca) #t]
    [(x32 sca) #t]
    [(x64 sca) #t]
    [(x128 sca) #t]
    [(x256 sca) #t]
    [(x512 sca) #t]
    [(xBroadcast sca factor) #t]
    [_ #f]
   )
)


;; Add buffer signed assumptions
(define (assume-buffer-signedness buf)
  (define is-signed (halide:is-buffer-signed buf))
  (define buffer-bv (halide:assemble-bitvector (halide:interpret buf) (halide:vec-len buf)))
  (assume-signedness buffer-bv (vec-precision buf) is-signed)
  )

;; wrapper to apply buffer signedness to list of buffers
(define (assume-buffers-signedness bufs)
  (for/list ([buf bufs])
            (assume-buffer-signedness buf)
            )
  )


(define (is-simple-ramp ramp-op)
  (destruct ramp-op
        [(ramp base stride len)

         (destruct stride
                   [(int-imm data signed?)
                    #t
                    ]
                   [_ #f]
                   )
         ]
        [_ #f]
            )
  )

;; Gather the list of bv-ops involved in the halide IR expressions.
;; This information will be used to identify the list of hydride IR
;; instructions to include.

(define empty-list (list ))

(define signed-casting-list (list extract sign-extend bvssat))
(define unsigned-casting-list (list extract zero-extend bvusat))


(define signed-upcasting-list (list extract sign-extend ))
(define unsigned-upcasting-list (list extract zero-extend ))

(define signed-downcasting-list (list extract  bvssat))
(define unsigned-downcasting-list (list extract  bvusat))


(define (get-bv-ops p)
  (destruct p
    ;; Abstract expressions
    [(abstr-halide-expr orig-expr abstr-vals) empty-list]

    ;; Var lookups
    [(var-lookup var val) empty-list]
    
    ;; Constructors
    [(x8 sca) empty-list]
    [(x16 sca) empty-list]
    [(x32 sca) empty-list]
    [(x64 sca) empty-list]
    [(x128 sca) empty-list]
    [(x256 sca) empty-list]
    [(x512 sca) empty-list]
    [(xBroadcast sca factor) empty-list]

    [(ramp base stride len)
     (append (list extract  bvadd  'ramp)  (if (is-simple-ramp (ramp base stride len)) (list) (list bvmul sign-extend zero-extend)))
     ]

    [(load buf idxs alignment) empty-list]
    [(int-imm data signed?) empty-list]
    [(buffer data elemT buffsize) (if (halide:is-buffer-signed p)  (list sign-extend)  (list zero-extend) ) ]
    [(load-sca buf idx) empty-list]

    ;; Type Casts
    [(cast-int vec olane oprec) 
     (cond
       ;; Upcast
       [(> (vec-size p) (vec-size vec))
            (append signed-upcasting-list (get-bv-ops vec))
        ] 
       ;; Downcast
       [(< (vec-size p) (vec-size vec))
            (append signed-downcasting-list (get-bv-ops vec))
        ] 
       ;; Same length -> reinterpret cast between signedness
       [else 
            (append signed-casting-list (get-bv-ops vec))
         ] 
       )
     ]
    [(cast-uint vec olane oprec) 
     (cond
       ;; Upcast
       [(> (vec-size p) (vec-size vec))
            (append unsigned-upcasting-list (get-bv-ops vec))
        ] 
       ;; Downcast
       [(< (vec-size p) (vec-size vec))
            (append unsigned-downcasting-list (get-bv-ops vec))
        ] 
       ;; Same length -> reinterpret cast between signedness
       [else 
            (append unsigned-casting-list (get-bv-ops vec))
         ] 
       )

     ]
    [(vec-saturate vec olane oprec signed?)
     (cond
       [signed?
         (append (list bvssat extract) (get-bv-ops vec))
         ]
       [else
        (append (list bvusat extract) (get-bv-ops vec))
         ]
       )
     ]
    [(uint8x1 sca) (list extract  zero-extend)]
    [(uint16x1 sca) (list  extract  zero-extend)]    
    [(uint32x1 sca) (list  extract  zero-extend)]
    [(uint64x1 sca) (list  extract  zero-extend)]

    [(int8x1 sca) (list  extract sign-extend )]
    [(int16x1 sca) (list  extract sign-extend )]
    [(int32x1 sca) (list  extract sign-extend )]
    [(int64x1 sca) (list  extract sign-extend )]

    ;[(uint1x32 vec) NYI: Not sure what would be casted into uint1?]
    ;[(uint1x64 vec) NYI: Not sure what would be casted into uint1?]
    ;[(uint1x128 vec) NYI: Not sure what would be casted into uint1?]
    ;[(uint1x256 vec) NYI: Not sure what would be casted into uint1?]    


    [(uint8x8 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint8x16 vec) (append  unsigned-casting-list (get-bv-ops vec))]
    [(uint8x32 vec) (append  unsigned-casting-list (get-bv-ops vec))]
    [(uint8x64 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint8x128 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint8x256 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint8x512 vec) (append unsigned-casting-list (get-bv-ops vec))]


    [(int8x8 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int8x16 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int8x32 vec) (append  signed-casting-list (get-bv-ops vec))]
    [(int8x64 vec) (append  signed-casting-list (get-bv-ops vec))]
    [(int8x128 vec) (append  signed-casting-list (get-bv-ops vec))]
    [(int8x256 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int8x512 vec) (append signed-casting-list (get-bv-ops vec))]


    [(uint16x8 vec) (append  unsigned-casting-list (get-bv-ops vec))]
    [(uint16x16 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint16x32 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint16x64 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint16x128 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint16x256 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint16x512 vec) (append unsigned-casting-list (get-bv-ops vec))]



    [(int16x8 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int16x16 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int16x32 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int16x64 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int16x128 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int16x256 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int16x512 vec) (append signed-casting-list (get-bv-ops vec))]
    

    [(uint32x8 vec) (append  unsigned-casting-list (get-bv-ops vec))]
    [(uint32x16 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint32x32 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint32x64 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint32x128 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint32x256 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint32x512 vec) (append unsigned-casting-list (get-bv-ops vec))]


    [(int32x8 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int32x16 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int32x32 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int32x64 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int32x128 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int32x256 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int32x512 vec) (append signed-casting-list (get-bv-ops vec))]
    

    [(uint64x8 vec) (append  unsigned-casting-list (get-bv-ops vec))]
    [(uint64x16 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint64x32 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint64x64 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint64x128 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint64x256 vec) (append unsigned-casting-list (get-bv-ops vec))]
    [(uint64x512 vec) (append unsigned-casting-list (get-bv-ops vec))]



    [(int64x8 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int64x16 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int64x32 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int64x64 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int64x128 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int64x256 vec) (append signed-casting-list (get-bv-ops vec))]
    [(int64x512 vec) (append signed-casting-list (get-bv-ops vec))]
    
    ;; Operations
    [(sca-add v1 v2) (append (list extract bvadd) (if (halide:is-signed-expr? v1 v2) (list sign-extend) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2) )]
    [(sca-sub v1 v2) (append (list extract bvsub) (if (halide:is-signed-expr? v1 v2) (list sign-extend) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2) ) ]
    [(sca-mul v1 v2) (append (list extract bvmul) (if (halide:is-signed-expr? v1 v2) (list sign-extend) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2))]
    [(sca-div v1 v2) (append (list  extract)  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsdiv bvashr) (list zero-extend bvudiv bvlshr))  (get-bv-ops v1)  (get-bv-ops v2))]
    [(sca-mod v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsrem bvsmod) (list zero-extend bvurem bvurem))   (get-bv-ops v1)  (get-bv-ops v2))]
    [(sca-min v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsmin) (list zero-extend bvumin)) (get-bv-ops v1)  (get-bv-ops v2))]
    [(sca-max v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsmax) (list zero-extend bvumax)) (get-bv-ops v1)  (get-bv-ops v2))]

    [(sca-if v1 v2 v3) (append (list ) (get-bv-ops v1)  (get-bv-ops v2)  (get-bv-ops v3) )]
    [(sca-eq v1 v2) (append (list eq? bveq) (get-bv-ops v1)  (get-bv-ops v2)   )]
    [(sca-lt v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvslt) (list zero-extend bvult))   (get-bv-ops v1)  (get-bv-ops v2))]
    [(sca-le v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsle) (list zero-extend bvule))  (get-bv-ops v1)  (get-bv-ops v2))]

    [(sca-abs v1) (append (list bvsge bvmul abs) (get-bv-ops v1)  )]
    [(sca-absd v1 v2) (append (list  bvsub ) (if (halide:is-signed-expr? v1 v2) (list bvsge  bvsmax bvsmin) (list bvuge bvumax bvumin ))  (get-bv-ops v1) (get-bv-ops v2))]
    [(sca-shl v1 v2) (append (list bvshl) (if (halide:is-signed-expr? v1 v2) (list  sign-extend ) (list zero-extend )) (get-bv-ops v1) (get-bv-ops v2))]
    [(sca-shr v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list bvashr  sign-extend) (list bvlshr  zero-extend)) (get-bv-ops v1) (get-bv-ops v2))]
    [(sca-clz v1) (append empty-list (get-bv-ops v1) )]

    [(sca-bwand v1 v2) (append (list extract bvand) (get-bv-ops v1) (get-bv-ops v2) )]
    
    [(vec-add v1 v2) (append (list extract bvadd) (if (halide:is-signed-expr? v1 v2) (list sign-extend  ) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2) )]

    [(vec-sat-add v1 v2) (append (list extract 
                                       ;TEMPORARY
                                       ;bvadd
                                       ) (if (halide:is-signed-expr? v1 v2) (list  bvaddnsw ) (list  bvaddnuw  )) (get-bv-ops v1)  (get-bv-ops v2) )]
    [(vec-sub v1 v2) (append (list extract bvsub)  (get-bv-ops v1)  (get-bv-ops v2) )]
    [(vec-sat-sub v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list bvsubnsw 'bvssat) (list  bvsubnuw 'bvusat)) (get-bv-ops v1)  (get-bv-ops v2) )]
    [(vec-mul v1 v2) (append (list extract bvmul) (if (halide:is-signed-expr? v1 v2) (list  sign-extend zero-extend ) (list  zero-extend sign-extend)) (get-bv-ops v1)  (get-bv-ops v2))] ;; FIXME: add bvshl

    ;[(vec-mul v1 v2) (append (list extract bvmul) (if (halide:is-signed-expr? v1 v2) (list  sign-extend  ) (list  zero-extend )) (get-bv-ops v1)  (get-bv-ops v2))] ;; FIXME: add bvshl

    [(vec-widen-mul v1 v2) (append (list extract bvmul) (if (halide:is-signed-expr? v1 v2) (list  sign-extend  ) (list  zero-extend )) (get-bv-ops v1)  (get-bv-ops v2))] ;; FIXME: add bvshl


    [(vec-rounding_mul_shift_right v1 v2 v3) (append (list extract bvmul sign-extend zero-extend) (if (halide:is-signed-expr? v1 v2) (list  sign-extend bvashr bvssat ) (list  zero-extend bvlshr bvusat)) (get-bv-ops v1)  (get-bv-ops v2) (get-bv-ops v3))] 

    [(vec-rounding_shift_right v1 v2) (append (list extract bvshl) (if (halide:is-signed-expr? v1 v2) (list  sign-extend bvashr bvssat bvsdiv) (list  zero-extend bvlshr bvusat bvudiv)) (get-bv-ops v1)  (get-bv-ops v2) )] ;; FIXME: add bvshl

    [(vec-rounding_halving_add v1 v2) (append (list extract bvadd) (if (halide:is-signed-expr? v1 v2) (list  sign-extend bvsdiv) (list  zero-extend  bvudiv)) (get-bv-ops v1)  (get-bv-ops v2) )] 

    ;; TODO: Since we now have context specific bitvector ops, this should be safe to do?
    ;[(vec-mul v1 v2) (append (list extract bvmul ) (if (halide:is-signed-expr? v1 v2) (list  sign-extend  ) (list  zero-extend )) (get-bv-ops v1)  (get-bv-ops v2))] ;; FIXME: add bvshl
    [(vec-div v1 v2) (append (list  extract)  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsdiv bvashr) (list zero-extend bvudiv bvlshr))  (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-mod v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list  bvsrem bvsmod) (list  bvurem bvurem))   (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-min v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list  bvsmin) (list  bvumin)) (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-max v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list  bvsmax ) (list  bvumax ))  (get-bv-ops v1)  (get-bv-ops v2))]

    [(vec-if v1 v2 v3) (append (list bveq 'if 'cond) (get-bv-ops v1)  (get-bv-ops v2)  (get-bv-ops v3) )]
    [(vec-eq v1 v2) (append (list eq? bveq) (get-bv-ops v1)  (get-bv-ops v2)   )]
    [(vec-lt v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvslt) (list zero-extend bvult))   (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-le v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsle) (list zero-extend bvule))  (get-bv-ops v1)  (get-bv-ops v2))]

    [(vec-abs v1) (append (list extract bvsge bvmul abs) (get-bv-ops v1)  )]
    [(vec-shl v1 v2) (append (list bvshl )  (get-bv-ops v1) (if (buffer? v2) (list) (get-bv-ops v2))  )]
    [(vec-shr v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list bvashr  ) (list bvlshr  )) (get-bv-ops v1)    (if (buffer? v2) (list) (get-bv-ops v2)))]
    ;[(vec-absd v1 v2) (append (list  bvsub ) (if (halide:is-signed-expr? v1 v2) (list   bvsmax bvsmin ) (list   bvumax bvumin ))  (get-bv-ops v1) (get-bv-ops v2))]
    [(vec-absd v1 v2) (append (list  bvsub )  (get-bv-ops (vec-max v1 v2))  (get-bv-ops (vec-min v1 v2)) )]
    [(vec-clz v1) (append empty-list (get-bv-ops v1) )]

    [(vec-bwand v1 v2) (append (list extract bvand) (get-bv-ops v1) (get-bv-ops v2) )]
    [(vec-bwnot v1 ) (append (list extract bvnot) (get-bv-ops v1)  )]

    [(vector_reduce op width vec)
     (cond
       [(eq? op 'add)
        (append (list extract bvadd bvmul) (if (halide:is-signed-expr? vec vec) (list sign-extend) (list  zero-extend )) (get-bv-ops vec))]
       [else (error "Unexpected vector_reduce op:" op)])]

    ;; Shuffles
    [(vec-broadcast n vec) (append (list extract concat) (get-bv-ops vec)  )]
    [(slice_vectors vec base stride len) (append (list extract concat) (get-bv-ops vec)  )]
    [(concat_vectors v1 v2) (append (list extract concat) (get-bv-ops v1)  (get-bv-ops v2))]
    [(dynamic_shuffle vec idxs st end) (append (list extract concat) (get-bv-ops vec) )]
    [(interleave v1 v2) (append (list extract concat) (get-bv-ops v1) (get-bv-ops v2) )]
    [(interleave4 v1 v2 v3 v4) 
     (append (list extract concat) (get-bv-ops v1) (get-bv-ops v2) (get-bv-ops v3)  (get-bv-ops v4) )
     ]
    
    ;; Base case
    [_ empty-list]))


;; Binds
(define (bind-expr-args expr args depth)
  (define (arg i) (vector-ref args i))
  (define is-leaf-depth (eq? depth 1))
  (define (broadcast-helper broad-ty val)
    (if (int-imm? val)
       (values (broad-ty val) 0)
       (if is-leaf-depth
            (begin
              (values (broad-ty (arg 0)) 1)
            )
            (begin
              (define-values (leaf-sol args-used) (bind-expr-args val args (- depth 1)))
              (values (broad-ty leaf-sol) args-used)
            )
        )
     )
    )
  (destruct expr
    ;; Constructors
    [(x8 sca) 
     (broadcast-helper x8 sca)
     ]
    [(x16 sca) 
     (broadcast-helper x16 sca)
     ]
    [(x32 sca) 
     (broadcast-helper x32 sca)
     ]
    [(x64 sca) 
      (broadcast-helper x64 sca)
     ]
    [(x128 sca) 
      (broadcast-helper x128 sca)
     ]
    [(x256 sca) 
      (broadcast-helper x256 sca)
     ]
    [(x512 sca) 
      (broadcast-helper x512 sca)
     ]
    [(xBroadcast sca factor) 
     (if (int-imm? sca)
       (values (xBroadcast sca factor) 0)
       (if is-leaf-depth
         (begin
           (values (xBroadcast (arg 0) factor) 1)
           )
         (begin
           (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
           (values (xBroadcast leaf-sol factor) args-used)
           )
         )
       )
     ]

    [(ramp base stride len) 
     (if is-leaf-depth
        (values (ramp (arg 0) (arg 1) len) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args base args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))

          (define-values (leaf2-sol args-used2) (bind-expr-args stride remaining-args (- depth 1)))


          (values (ramp leaf1-sol leaf2-sol len) (+ args-used1 args-used2))
        )
        )
     
     ]
    [(load buf idxs alignment) 
       (if is-leaf-depth
        (values (load (arg 0) idxs alignment) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args buf args (- depth 1)))
          (values (load leaf-sol idxs alignment) args-used)
        )
        )
     ]
    [(load-sca buf idx) 
       (if is-leaf-depth
        (values (load-sca (arg 0) idx) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args buf args (- depth 1)))
          (values (load-sca leaf-sol idx) args-used)
        )
        )
     ]


     [(int-imm data signed?)  
      (debug-log args)
      (values (int-imm data signed?) 0)
      ]

     [(buffer data elemT buffsize)  
        (values (arg 0) 1)
      ]

    ;; Type Casts
    [(cast-int vec olane oprec) 
       (if is-leaf-depth
        (values (cast-int (arg 0) olane oprec) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (cast-int leaf-sol olane oprec) args-used)
        )
        )
     ]
    [(cast-uint vec olane oprec) 
       (if is-leaf-depth
        (values (cast-uint (arg 0) olane oprec) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (cast-uint leaf-sol olane oprec) args-used)
        )
        )
     ]
    [(vec-saturate vec olane oprec signed?) 
       (if is-leaf-depth
        (values (vec-saturate (arg 0) olane oprec signed?) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (vec-saturate leaf-sol olane oprec signed?) args-used)
        )
        )
    ]

    [(uint8x1 sca) 
       (if is-leaf-depth
        (values (uint8x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (uint8x1 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x1 sca) 
       (if is-leaf-depth
        (values (uint16x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (uint16x1 leaf-sol) args-used)
        )
        )
     ]

    [(uint32x1 sca) 
       (if is-leaf-depth
        (values (uint32x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (uint32x1 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x1 sca) 
       (if is-leaf-depth
        (values (uint64x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (uint64x1 leaf-sol) args-used)
        )
        )
     ]
    
    [(int8x1 sca) 
       (if is-leaf-depth
        (values (int8x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (int8x1 leaf-sol) args-used)
        )
        )
     ]
    [(int16x1 sca) 
       (if is-leaf-depth
        (values (int16x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (int16x1 leaf-sol) args-used)
        )
        )
     ]
    [(int32x1 sca)
       (if is-leaf-depth
        (values (int32x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (int32x1 leaf-sol) args-used)
        )
        )
     ]
    [(int64x1 sca)
       (if is-leaf-depth
        (values (int64x1 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args sca args (- depth 1)))
          (values (int64x1 leaf-sol) args-used)
        )
        )
     ]

    [(uint1x32 vec) 
       (if is-leaf-depth
        (values (uint1x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint1x32 leaf-sol) args-used)
        )
        )
     ]
    [(uint1x64 vec) 
       (if is-leaf-depth
        (values (uint1x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint1x64 leaf-sol) args-used)
        )
        )
     ]
    [(uint1x128 vec)
       (if is-leaf-depth
        (values (uint1x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint1x128 leaf-sol) args-used)
        )
        )
     ]
    [(uint1x256 vec)
       (if is-leaf-depth
        (values (uint1x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint1x256 leaf-sol) args-used)
        )
        )
     ]
    [(uint1x512 vec)
       (if is-leaf-depth
        (values (uint1x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint1x512 leaf-sol) args-used)
        )
        )
     ]

    [(uint8x8 vec) 
       (if is-leaf-depth
        (values (uint8x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint8x8 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x8 vec) 
       (if is-leaf-depth
        (values (uint16x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint16x8 leaf-sol) args-used)
        )
        )
     ]
    [(uint32x8 vec) 
       (if is-leaf-depth
        (values (uint32x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint32x8 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x8 vec) 
       (if is-leaf-depth
        (values (uint64x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x8 leaf-sol) args-used)
        )
        )
     ]


    [(int8x8 vec) 
       (if is-leaf-depth
        (values (int8x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int8x8 leaf-sol) args-used)
        )
        )
     ]
    [(int16x8 vec) 
       (if is-leaf-depth
        (values (int16x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int16x8 leaf-sol) args-used)
        )
        )
     ]
    [(int32x8 vec) 
       (if is-leaf-depth
        (values (int32x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int32x8 leaf-sol) args-used)
        )
        )
     ]
    [(int64x8 vec) 
       (if is-leaf-depth
        (values (int64x8 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int64x8 leaf-sol) args-used)
        )
        )
     ]
   
    [(uint8x16 vec) 
       (if is-leaf-depth
        (values (uint8x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint8x16 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x16 vec) 
       (if is-leaf-depth
        (values (uint16x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint16x16 leaf-sol) args-used)
        )
        )
     ]
    [(uint32x16 vec) 
       (if is-leaf-depth
        (values (uint32x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint32x16 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x16 vec) 
       (if is-leaf-depth
        (values (uint64x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x16 leaf-sol) args-used)
        )
        )
     ]


    [(int8x16 vec) 
       (if is-leaf-depth
        (values (int8x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int8x16 leaf-sol) args-used)
        )
        )
     ]
    [(int16x16 vec) 
       (if is-leaf-depth
        (values (int16x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int16x16 leaf-sol) args-used)
        )
        )
     ]
    [(int32x16 vec) 
       (if is-leaf-depth
        (values (int32x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int32x16 leaf-sol) args-used)
        )
        )
     ]
    [(int64x16 vec) 
       (if is-leaf-depth
        (values (int64x16 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int64x16 leaf-sol) args-used)
        )
        )
     ]
    [(uint8x32 vec) 
       (if is-leaf-depth
        (values (uint8x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint8x32 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x32 vec) 
       (if is-leaf-depth
        (values (uint16x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint16x32 leaf-sol) args-used)
        )
        )
     ]
    [(uint32x32 vec) 
       (if is-leaf-depth
        (values (uint32x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint32x32 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x32 vec) 
       (if is-leaf-depth
        (values (uint64x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x32 leaf-sol) args-used)
        )
        )
     ]
    
    [(int8x32 vec) 
       (if is-leaf-depth
        (values (int8x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int8x32 leaf-sol) args-used)
        )
        )
     ]
    [(int16x32 vec)
       (if is-leaf-depth
        (values (int16x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int16x32 leaf-sol) args-used)
        )
        )
     ]
    [(int32x32 vec) 
       (if is-leaf-depth
        (values (int32x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int32x32 leaf-sol) args-used)
        )
        )
     ]
    [(int64x32 vec) 
       (if is-leaf-depth
        (values (int64x32 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int64x32 leaf-sol) args-used)
        )
        )
     ]
    
    [(uint8x64 vec) 
       (if is-leaf-depth
        (values (uint8x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint8x64 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x64 vec) 
       (if is-leaf-depth
        (values (uint16x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint16x64 leaf-sol) args-used)
        )
        )
     ]
    [(uint32x64 vec) 
       (if is-leaf-depth
        (values (uint32x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint32x64 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x64 vec) 
       (if is-leaf-depth
        (values (uint64x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x64 leaf-sol) args-used)
        )
        )
     ]
    
    [(int8x64 vec) 
       (if is-leaf-depth
        (values (int8x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int8x64 leaf-sol) args-used)
        )
        )
     ]
    [(int16x64 vec) 
       (if is-leaf-depth
        (values (int16x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int16x64 leaf-sol) args-used)
        )
        )
     ]
    [(int32x64 vec) 
       (if is-leaf-depth
        (values (int32x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int32x64 leaf-sol) args-used)
        )
        )
     ]
    [(int64x64 vec) 
       (if is-leaf-depth
        (values (int64x64 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int64x64 leaf-sol) args-used)
        )
        )
     ]
    
    [(uint8x128 vec) 
       (if is-leaf-depth
        (values (uint8x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint8x128 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x128 vec) 
       (if is-leaf-depth
        (values (uint16x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint16x128 leaf-sol) args-used)
        )
        )
     ]
    [(uint32x128 vec) 
       (if is-leaf-depth
        (values (uint32x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint32x128 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x128 vec) 
       (if is-leaf-depth
        (values (uint64x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x128 leaf-sol) args-used)
        )
        )
     ]
    
    [(int8x128 vec)
       (if is-leaf-depth
        (values (int8x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int8x128 leaf-sol) args-used)
        )
        )
     ]
    [(int16x128 vec) 
       (if is-leaf-depth
        (values (int16x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int16x128 leaf-sol) args-used)
        )
        )
     ]
    [(int32x128 vec) 
       (if is-leaf-depth
        (values (int32x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int32x128 leaf-sol) args-used)
        )
        )
     ]
    [(int64x128 vec) 
       (if is-leaf-depth
        (values (int64x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int64x128 leaf-sol) args-used)
        )
        )
     ]
    
    [(uint8x256 vec) 
       (if is-leaf-depth
        (values (uint8x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint8x256 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x256 vec)
       (if is-leaf-depth
        (values (uint16x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint16x256 leaf-sol) args-used)
        )
        )
     ]
    [(uint32x256 vec) 
       (if is-leaf-depth
        (values (uint32x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint32x256 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x256 vec) 
       (if is-leaf-depth
        (values (uint64x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x256 leaf-sol) args-used)
        )
        )
     ]

    [(int8x256 vec) 
       (if is-leaf-depth
        (values (int8x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int8x256 leaf-sol) args-used)
        )
        )
     ]
    [(int16x256 vec) 
       (if is-leaf-depth
        (values (int16x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int16x256 leaf-sol) args-used)
        )
        )
     ]
    [(int32x256 vec) 
       (if is-leaf-depth
        (values (int32x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int32x256 leaf-sol) args-used)
        )
        )
     ]
    [(int64x256 vec)
       (if is-leaf-depth
        (values (int64x256 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int64x256 leaf-sol) args-used)
        )
        )
     ]

    [(uint8x512 vec) 
       (if is-leaf-depth
        (values (uint8x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint8x512 leaf-sol) args-used)
        )
        )
     ]
    [(uint16x512 vec) 
       (if is-leaf-depth
        (values (uint16x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint16x512 leaf-sol) args-used)
        )
        )
     ]
    [(uint32x512 vec) 
       (if is-leaf-depth
        (values (uint32x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint32x512 leaf-sol) args-used)
        )
        )
     ]
    [(uint64x512 vec) 
       (if is-leaf-depth
        (values (uint64x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x512 leaf-sol) args-used)
        )
        )
     ]

    [(int8x512 vec) 
       (if is-leaf-depth
        (values (int8x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int8x512 leaf-sol) args-used)
        )
        )
     ]
    [(int16x512 vec) 
       (if is-leaf-depth
        (values (int16x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int16x512 leaf-sol) args-used)
        )
        )
     ]
    [(int32x512 vec)
       (if is-leaf-depth
        (values (int32x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int32x512 leaf-sol) args-used)
        )
        )
     ]
    [(int64x512 vec)
       (if is-leaf-depth
        (values (int64x512 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (int64x512 leaf-sol) args-used)
        )
        )
     ]

    ;; Operations
    [(vec-add v1 v2) 
       (if is-leaf-depth
        (values (vec-add (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))

          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


          (values (vec-add leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    ;; Operations
    [(vec-sat-add v1 v2) 
       (if is-leaf-depth
        (values (vec-sat-add (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))

          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


          (values (vec-sat-add leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-sub v1 v2) 
       (if is-leaf-depth
        (values (vec-sub (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-sub leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-sat-sub v1 v2) 
       (if is-leaf-depth
        (values (vec-sat-sub (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-sat-sub leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-mul v1 v2) 
       (if is-leaf-depth
        (values (vec-mul (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-mul leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]

    [(vec-widen-mul v1 v2) 
       (if is-leaf-depth
        (values (vec-widen-mul (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-widen-mul leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-rounding_shift_right v1 v2) 
       (if is-leaf-depth
        (values (vec-rounding_shift_right (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-rounding_shift_right leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]

    [(vec-rounding_halving_add v1 v2) 
       (if is-leaf-depth
        (values (vec-rounding_halving_add (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-rounding_halving_add leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-rounding_mul_shift_right v1 v2 v3) 
       (if is-leaf-depth
        ;(values (vec-rounding_mul_shift_right (arg 0) (arg 1) (arg 2)) 3)
        (values (vec-rounding_mul_shift_right (arg 0) (arg 1) v3) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))
          ;(define remaining-values-1 (- (vector-length remaining-args) args-used2))
          ;(define remaining-args-1 (vector-take-right remaining-args remaining-values-1))
          ;(define-values (leaf3-sol args-used3) (bind-expr-args v3 remaining-args-1 (- depth 1)))

          ;(values (vec-rounding_mul_shift_right leaf1-sol leaf2-sol leaf3-sol) (+ args-used1 args-used2 args-used3))

          (values (vec-rounding_mul_shift_right leaf1-sol leaf2-sol v3) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-div v1 v2)
       (if is-leaf-depth
        (values (vec-div (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-div leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-mod v1 v2)
       (if is-leaf-depth
        (values (vec-mod (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-mod leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-min v1 v2) 
       (if is-leaf-depth
        (values (vec-min (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-min leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-max v1 v2) 
       (if is-leaf-depth
        (values (vec-max (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-max leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-if v1 v2 v3)
       (if is-leaf-depth
        (values (vec-if (arg 0) (arg 1) (arg 2)) 3)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values1 (- (vector-length args) args-used1))
          (define remaining-args1 (vector-take-right args remaining-values1))

          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args1 (- depth 1)))
          (define remaining-values2 (- (vector-length remaining-args1) args-used2))
          (define remaining-args2 (vector-take-right remaining-args1 remaining-values2))


          (define-values (leaf3-sol args-used3) (bind-expr-args v3 remaining-args2 (- depth 1)))

          (values (vec-if leaf1-sol leaf2-sol leaf3-sol) (+ args-used1 args-used2 args-used3))
        )
        )
     ]
    [(vec-eq v1 v2)
       (if is-leaf-depth
        (values (vec-eq (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-eq leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-lt v1 v2) 
       (if is-leaf-depth
        (values (vec-lt (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-lt leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-le v1 v2) 
       (if is-leaf-depth
        (values (vec-le (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-le leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]

    [(vec-abs v1)
       (if is-leaf-depth
        (values (vec-abs (arg 0)) 1)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (values (vec-abs leaf1-sol) args-used1)
        )
        )
     ]
    [(vec-clz v1) 
       (if is-leaf-depth
        (values (vec-clz (arg 0)) 1)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (values (vec-clz leaf1-sol) args-used1)
        )
        )
     ]
    
    [(vec-absd v1 v2) 
       (if is-leaf-depth
        (values (vec-absd (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-absd leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-shl v1 v2) 
       (if is-leaf-depth
        (values (vec-shl (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

          (values (vec-shl leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]
    [(vec-shr v1 v2)
       (if is-leaf-depth
        (values (vec-shr (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))
          (values (vec-shr leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]

    [(vec-bwand v1 v2)
       (if is-leaf-depth
        (values (vec-bwand (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))
          (values (vec-bwand leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
     ]

    [(vec-bwnot v1 )
       (if is-leaf-depth
        (values (vec-bwnot (arg 0)) 1)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (values (vec-bwnot leaf1-sol) args-used1)
        )
        )
     ]

    [(vector_reduce op width vec) 
       (if is-leaf-depth
        (values (vector_reduce op width (arg 0)) 1)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args vec args (- depth 1)))
          (values (vector_reduce op width leaf1-sol) args-used1)
        )
        )
     ]

    ;; Shuffles
    [(vec-broadcast n vec) 
       (if is-leaf-depth
        (values (vec-broadcast n (arg 0)) 1)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args vec args (- depth 1)))
          (values (vec-broadcast n leaf1-sol) args-used1)
        )
        )
     ]
    [(slice_vectors vec base stride len)
       (if is-leaf-depth
        (values (slice_vectors (arg 0) base stride len) 1)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args vec args (- depth 1)))
          (values (slice_vectors leaf1-sol base stride len) args-used1)
        )
        )
    ]
    [(concat_vectors v1 v2) 
       (if is-leaf-depth
        (values (concat_vectors (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))
          (values (concat_vectors leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
    ]
    [(interleave v1 v2) 
       (if is-leaf-depth
        (values (interleave (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))
          (values (interleave leaf1-sol leaf2-sol) (+ args-used1 args-used2))
        )
        )
    ]
    [(interleave4 v1 v2 v3 v4) (list v1 v2 v3 v4)
       (if is-leaf-depth
        (values (interleave4 (arg 0) (arg 1) (arg 2) (arg 3)) 4)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
          (define remaining-values1 (- (vector-length args) args-used1))
          (define remaining-args1 (vector-take-right args remaining-values1))

          (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args1 (- depth 1)))
          (define remaining-values2 (- (vector-length remaining-args1) args-used2))
          (define remaining-args2 (vector-take-right remaining-args1 remaining-values2))


          (define-values (leaf3-sol args-used3) (bind-expr-args v3 remaining-args2 (- depth 1)))
          (define remaining-values3 (- (vector-length remaining-args2) args-used3))
          (define remaining-args3 (vector-take-right remaining-args2 remaining-values3))


          (define-values (leaf4-sol args-used4) (bind-expr-args v4 remaining-args3 (- depth 1)))

          (values (interleave4 leaf1-sol leaf2-sol leaf3-sol leaf4-sol) (+ args-used1 args-used2 args-used3 args-used4))
        )
        )
       ]
    [(dynamic_shuffle vec idxs st end) 
       (if is-leaf-depth
        (values (dynamic_shuffle (arg 0) (arg 1)) 2)
        (begin
          (define-values (leaf1-sol args-used1) (bind-expr-args vec args (- depth 1)))
          (define remaining-values (- (vector-length args) args-used1))
          (define remaining-args (vector-take-right args remaining-values))
          (define-values (leaf2-sol args-used2) (bind-expr-args idxs remaining-args (- depth 1)))
          (values (dynamic_shuffle leaf1-sol leaf2-sol st end) (+ args-used1 args-used2))
        )
        )
    ]
    
    ;; Base case
    [v (values v 0)])
  
  )

;; Returns the sub-expressions at depth away from
;; the root of expr. In the case where a leaf is reached
;; before at an earlier depth, we return '().
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
      (define imm-sub-exprs (halide:sub-exprs expr))
      (apply append
             (for/list ([i (range (length imm-sub-exprs))])
                       ;; Vector absd is a complex operation and should
                       ;; count as a sequence of 3 computations (depth 2)
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


(define (get-expr-bv-sizes expr-list)

  (for/list ([i (range (length expr-list))])
            (vec-size (list-ref expr-list i))
            )
  
  )


(define (get-expr-elemT expr-list)
  (for/list ([i (range (length expr-list))])
            (get-elemT (list-ref expr-list i))
            )
  
  )


(define (create-buffers sub-expr-ls sym-bvs)
  (list->vector (for/list ([i (range (length sub-expr-ls))])
            (define expr (list-ref sub-expr-ls i))
            (define sym-bv (vector-ref sym-bvs i))
            (define size (vec-size expr))
            (define expr-elemT (get-elemT expr))
            (halide:create-buffer sym-bv expr-elemT)
            )
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
        [else (error "halide/utils.rkt: Unexpected buffer type in print-buffer-type-info" buff)])
    )
  (define buffer-size (vec-size buff))
  (define buffer-num-elem (/ buffer-size step-size))

  (string-append "<" (~s buffer-num-elem) " x i" (~s step-size) ">")
  
  )




(define (get-expr-precisions expr-list)
  (for/list ([i (range (length expr-list))])
            (define expr (list-ref expr-list i))
            (vec-precision expr)
            )
  
  )

(define (create-expr expr-ty sub-expr-vector)
  (define (arg i) (vector-ref sub-expr-vector i))
  (cond
    [(eq? expr-ty x8) (x8 (arg 0))]
    [(eq? expr-ty x16) (x16 (arg 0))]
    [(eq? expr-ty x32) (x32 (arg 0))]
    [(eq? expr-ty x64) (x64 (arg 0))]
    [(eq? expr-ty x128) (x128 (arg 0))]
    [(eq? expr-ty x256) (x256 (arg 0))]
    [(eq? expr-ty x512) (x512 (arg 0))]

    [(eq? expr-ty ramp) (ramp (arg 0) (arg 1) (arg 2))]
    [(eq? expr-ty load) (load (arg 0) (arg 1) (arg 2))]
    [(eq? expr-ty load-sca) (load-sca (arg 0) (arg 1))]

    ;; Type Casts
    [(eq? expr-ty uint8x1) (uint8x1 (arg 0))]
    [(eq? expr-ty uint16x1) (uint16x1 (arg 0))]
    [(eq? expr-ty uint32x1) (uint32x1 (arg 0))]
    [(eq? expr-ty uint64x1) (uint64x1 (arg 0))]
    
    [(eq? expr-ty int8x1 ) (int8x1 (arg 0))]
    [(eq? expr-ty int16x1) (int16x1 (arg 0))]
    [(eq? expr-ty int32x1) (int32x1 (arg 0))]
    [(eq? expr-ty int64x1) (int64x1 (arg 0))]

    [(eq? expr-ty uint1x32) (uint1x32 (arg 0))]
    [(eq? expr-ty uint1x64) (uint1x64 (arg 0))]
    [(eq? expr-ty uint1x128) (uint1x128 (arg 0))]
    [(eq? expr-ty uint1x256) (uint1x256 (arg 0))]
    [(eq? expr-ty uint1x512) (uint1x512 (arg 0))]
   
    [(eq? expr-ty uint8x32) (uint8x32 (arg 0))]
    [(eq? expr-ty uint16x32) (uint16x32 (arg 0))]
    [(eq? expr-ty uint32x32) (uint32x32 (arg 0))]
    [(eq? expr-ty uint64x32 ) (uint64x32 (arg 0))]
    
    [(eq? expr-ty int8x32) (int8x32 (arg 0))]
    [(eq? expr-ty int16x32) (int16x32 (arg 0))]
    [(eq? expr-ty int32x32) (int32x32 (arg 0))]
    [(eq? expr-ty int64x32) (int64x32 (arg 0))]
    
    [(eq? expr-ty uint8x64) (uint8x64 (arg 0))]
    [(eq? expr-ty uint16x64) (uint16x64 (arg 0))]
    [(eq? expr-ty uint32x64) (uint32x64 (arg 0))]
    [(eq? expr-ty uint64x64) (uint64x64 (arg 0))]
    
    [(eq? expr-ty int8x64) (int8x64 (arg 0))]

    [else (error "Unrecognized expr ty")]
    )
  )


;; Infer the length of vector generated by the expression
(define (vec-size expr)
  (destruct expr
    ;; Abstract expressions
    [(abstr-halide-expr orig-expr abstr-vals) (vec-size orig-expr)]
    
    ;; Constructors
    [(x8 sca) (* 8 (vec-size sca))]
    [(x16 sca) (* 16 (vec-size sca))]
    [(x32 sca) (* 32 (vec-size sca))]
    [(x64 sca) (* 64 (vec-size sca))]
    [(x128 sca) (* 128 (vec-size sca))]
    [(x256 sca) (* 256 (vec-size sca))]
    [(x512 sca) (* 512 (vec-size sca))]
    [(xBroadcast sca factor) (* factor (vec-size sca))]

    [(ramp base stride len) (* len (vec-size base))]
    [(load buf idxs alignment) (vec-size idxs)]
    [(load-sca buf idx) 1]
    [(int-imm data signed?) (bvlength data)]
    [(buffer data elemT buffsize) buffsize]

    ;; Type Casts
    [(cast-int vec olane oprec) (* olane oprec)]
    [(cast-uint vec olane oprec) (* olane oprec)]
    [(vec-saturate vec olane oprec signed?) (* olane oprec)]
    [(uint8x1 sca) 8]
    [(uint16x1 sca) 16]
    [(uint32x1 sca) 32]
    [(uint64x1 sca) 64]
    
    [(int8x1 sca) 8]
    [(int16x1 sca) 16]
    [(int32x1 sca) 32]
    [(int64x1 sca) 64]

    [(uint1x32 vec) 32]
    [(uint1x64 vec) 64]
    [(uint1x128 vec) 128]
    [(uint1x256 vec) 256]
    [(uint1x512 vec) 512]


    [(uint8x8 vec) (* 8 8)]
    [(uint16x8 vec) (* 16 8)]
    [(uint32x8 vec) (* 32 8)]
    [(uint64x8 vec) (* 64 8)]


    [(int8x8 vec) (* 8 8)]
    [(int16x8 vec) (* 16 8)]
    [(int32x8 vec) (* 32 8)]
    [(int64x8 vec) (* 64 8)]


    [(uint8x16 vec) (* 8 16)]
    [(uint16x16 vec) (* 16 16)]
    [(uint32x16 vec) (* 32 16)]
    [(uint64x16 vec) (* 64 16)]


    [(int8x16 vec) (* 8 16)]
    [(int16x16 vec) (* 16 16)]
    [(int32x16 vec) (* 32 16)]
    [(int64x16 vec) (* 64 16)]
   
    [(uint8x32 vec) (* 8 32)]
    [(uint16x32 vec) (* 16 32)]
    [(uint32x32 vec) (* 32 32)]
    [(uint64x32 vec) (* 64 32)]
    
    [(int8x32 vec) (* 8 32)]
    [(int16x32 vec) (* 16 32)]
    [(int32x32 vec) (* 32 32)]
    [(int64x32 vec) (* 64 32)]
    
    [(uint8x64 vec) (* 8 64)]
    [(uint16x64 vec) (* 16 64)]
    [(uint32x64 vec) (* 32 64)]
    [(uint64x64 vec) (* 64 64)]
    
    [(int8x64 vec) (* 8 64)]
    [(int16x64 vec) (* 16 64)]
    [(int32x64 vec) (* 32 64)]
    [(int64x64 vec) (* 64 64)]
    
    [(uint8x128 vec) (* 8 128)]
    [(uint16x128 vec) (* 16 128)]
    [(uint32x128 vec) (* 32 128)]
    [(uint64x128 vec) (* 64 128)]
    
    [(int8x128 vec) (* 8 128)]
    [(int16x128 vec) (* 16 128)]
    [(int32x128 vec) (* 32 128)]
    [(int64x128 vec) (* 64 128)]
    
    [(uint8x256 vec) (* 8 256)]
    [(uint16x256 vec) (* 16 256)]
    [(uint32x256 vec) (* 32 256)]
    [(uint64x256 vec) (* 64 256)]

    [(int8x256 vec) (* 8 256)]
    [(int16x256 vec) (* 16 256)]
    [(int32x256 vec) (* 32 256)]
    [(int64x256 vec) (* 64 256)]

    [(uint8x512 vec) (* 8 512)]
    [(uint16x512 vec) (* 16 512)]
    [(uint32x512 vec) (* 32 512)]
    [(uint64x512 vec) (* 64 512)]

    [(int8x512 vec) (* 8  512)]
    [(int16x512 vec) (* 16 512)]
    [(int32x512 vec) (* 32 512)]
    [(int64x512 vec) (* 64 512)]

    ;; Operations
    [(vec-add v1 v2) (vec-size v1)]
    [(vec-sat-add v1 v2) (vec-size v1)]
    [(vec-sub v1 v2) (vec-size v1)]
    [(vec-sat-sub v1 v2) (vec-size v1)]
    [(vec-mul v1 v2) (vec-size v1)]
    [(vec-rounding_mul_shift_right v1 v2 v3) (vec-size v1)]
    [(vec-rounding_shift_right v1 v2) (vec-size v1)]
    [(vec-rounding_halving_add v1 v2) (vec-size v1)]
    [(vec-widen-mul v1 v2) (* 2 (vec-size v1))]
    [(vec-div v1 v2) (vec-size v1)]
    [(vec-mod v1 v2) (vec-size v1)]
    [(vec-min v1 v2) (vec-size v1)]
    [(vec-max v1 v2) (vec-size v1)]

    [(vec-if v1 v2 v3) (vec-size v2)]
    [(vec-eq v1 v2) (halide:vec-len v1)] ;; Vec eq returns one bit per lane
    [(vec-lt v1 v2) (vec-size v1)]
    [(vec-le v1 v2) (vec-size v1)]

    [(vec-abs v1) (vec-size v1)]
    [(vec-clz v1) (vec-size v1)]

    [(vec-absd v1 v2) (vec-size v1)]
    [(vec-shl v1 v2) (vec-size v1)]
    [(vec-shr v1 v2) (vec-size v1)]

    [(vec-bwand v1 v2) (vec-size v1)]
    [(vec-bwnot v1 ) (vec-size v1)]

    [(vector_reduce op width vec) (quotient (vec-size vec) width)]

    ;; Shuffles
    [(slice_vectors vec base stride len) (* len (vec-precision vec)) ]
    [(concat_vectors v1 v2) (+ (vec-size v1) (vec-size v2))]
    [(interleave v1 v2) (+ (vec-size v1) (vec-size v2))]
    [(interleave4 v1 v2 v3 v4) (+ (vec-size v1) (vec-size v2) (vec-size v3) (vec-size v4))]
    [(dynamic_shuffle vec idxs st end) (vec-size idxs)]

    [(vec-broadcast n vec) (* n (vec-size vec))]
    
    ;; Base case
    [_ (error "halide\\ir\\interpreter.rkt: Don't know how to infer vector size for Halide expression:" expr)]))


(define id-map (make-hash))




;; Reduce the number of vector lanes in the 
;; halide factor by scale-factor x
(define (scale-down-expr expr scale-factor)

  (define scaled? #t)

  (define (visitor-fn e)
    (destruct e
              [(buffer data elemT buffsize) 
               (define prec (vec-precision e))
               (define len (halide:vec-len e))

                (define scaled-size
                  (cond
                    [(equal? (modulo len scale-factor) 0)
                     (* prec (/ len scale-factor))
                     ]
                    [else

                      (set! scaled? #f)
                      ;(error "Unsupported scaling for " e)
                      (* prec len)
                      
                      ]
                    )
                  )
               (halide:create-buffer (bv 0 (bitvector scaled-size)) elemT)
               ]
              [(cast-int vec olane oprec)
               (cast-int vec (/ olane scale-factor) oprec)
               ]
              [(cast-uint vec olane oprec)
               (cast-uint vec (/ olane scale-factor) oprec)
               ]
              [(vec-saturate vec olane oprec signed?)
               (vec-saturate vec (/ olane scale-factor) oprec signed?)
               ]
              [(xBroadcast sca factor) 
               (xBroadcast sca (/ factor scale-factor))
               ]
              [(vec-broadcast n vec) 
               (vec-broadcast (/ n scale-factor) vec)
               ]
              [(x128 sca)
               (cond
                 [(equal? scale-factor 2)
                  (x64 sca)
                  ]
                 [(equal? scale-factor 4)
                  (x32 sca)
                  ]
                 [(equal? scale-factor 8)
                  (x16 sca)
                  ]
                 [(equal? scale-factor 16)
                  (x8 sca)
                  ]
                 [else
                    (set! scaled? #f)
                   ;(error "Unsupported scaling size: " scale-factor)
                   ]
                 )
               ]

              [(x64 sca)
               (cond
                 [(equal? scale-factor 2)
                  (x32 sca)
                  ]
                 [(equal? scale-factor 4)
                  (x16 sca)
                  ]
                 [(equal? scale-factor 8)
                  (x8 sca)
                  ]
                 [(equal? scale-factor 8)
                  (x8 sca)
                  ]
                 [else
                   (set! scaled? #f)
                   e
                   ;(error "Unsupported scaling size: " scale-factor)
                   ]
                 )
               ]
              [(x32 sca)
               (cond
                 [(equal? scale-factor 2)
                  (x16 sca)
                  ]
                 [(equal? scale-factor 4)
                  (x8 sca)
                  ]
                 [else
                   (set! scaled? #f)
                   e
                   ;(error "Unsupported scaling size: " scale-factor)
                   ]
                 )
               ]

              [(x16 sca)
               (cond
                 [(equal? scale-factor 2)
                  (x8 sca)
                  ]
                 [else
                   (set! scaled? #f)
                   e
                   ;(error "Unsupported scaling size: " scale-factor)
                   ]
                 )
               ]
              [(ramp base stride len)
                (set! scaled? #f)
                (ramp base stride (/ len scale-factor))
               ]

              [(slice_vectors vec base stride len)
               (slice_vectors vec (/ base scale-factor) stride (/ len scale-factor))
                
               ]

              [v 
                v]
              )
    )

  (define result 
    (cond
      [(equal? scale-factor 1)
       expr
       ]
      [else
        (halide:visit expr visitor-fn)
       ]
      )
  )

  (values scaled? result)
  
  )


(define (count-number-instructions expr)

  (define count 0)
  (define (visitor-fn e)
    (destruct e
              [(buffer data elemT buffsize) 
               '()
               ]
              [(int-imm data signed?) 
               '()
               ]
              [_ 
                (set! count (+ count 1))
                ]
              )
    )

  (halide:visit expr visitor-fn)
  count
  
  )

(define (get-buffer-ids expr)
  (hash-clear! id-map)

  (define (visitor-fn e)
    (destruct e
              [(buffer data elemT buffsize) 
               (begin
                 (if (hash-has-key? id-map e)
                   (list)
                   (begin
                         (define hash-id (hash-count id-map))
                         (hash-set! id-map e hash-id)
                     )

                   )
                 )
               ]
              [_ '()]
              )
    )

  (halide:visit expr visitor-fn)
  id-map
  
  )


(define (contains-complex-op-in-subexpr expr expr-depth)

  (define leaves (get-sub-exprs expr (+ expr-depth 1)))
  (define leaves-sizes (get-expr-bv-sizes leaves))

  (define leaves-elemT (get-expr-elemT leaves))
  (define sym-bvs (create-concrete-bvs leaves-sizes))

  (define dummy-args (create-buffers leaves sym-bvs))

  (define-values (expr-extract num-used) (bind-expr-args expr dummy-args expr-depth))


  (contains-complex-op expr-extract)
  )


;; Checks if the expression contains a complex operation
;; such as Ramp which performs broadcasts multiplication
;; and add. Additionally, check for expensive ops
;; such as div

(define (contains-complex-op expr)

  (define flag #f)
  (define (visitor-fn e)
    (destruct e
              [(ramp base stride len) 
               ;(set! flag #t)
               e
               ]

              [(vec-div v1 v2) 
               (set! flag #t)
               ]
              [(vec-if vi v1 v2)
               (set! flag #t)
               ]
              [_ e]
              )
    )
  (halide:visit expr visitor-fn)

  flag
  )


(define (contains-mul-op-in-subexpr expr expr-depth)

  (define leaves (get-sub-exprs expr (+ expr-depth 1)))
  (define leaves-sizes (get-expr-bv-sizes leaves))

  (define leaves-elemT (get-expr-elemT leaves))
  (define sym-bvs (create-concrete-bvs leaves-sizes))

  (define dummy-args (create-buffers leaves sym-bvs))

  (define-values (expr-extract num-used) (bind-expr-args expr dummy-args expr-depth))


  (contains-mul-op expr-extract)
  )



(define (contains-mul-op expr)

  (define flag #f)
  (define (visitor-fn e)
    (destruct e
              [(vec-mul v1 v2) 
               (set! flag #t)
               e
               ]
              [(vec-widen-mul v1 v2) 
               (set! flag #t)
               e
               ]
              [_ e]
              )
    )
  (halide:visit expr visitor-fn)

  flag
  )


(define (hash-expr expr)
  (define (visitor-fn e)
    (destruct e
              [(buffer data elemT buffsize) 
               (list 'buf elemT buffsize)
               ]
              [_ e]
              )
    )

  (define hashed-expr (halide:visit expr visitor-fn))
  hashed-expr
  )


(define (get-expr-depth e)
  (define depth 1)
  (destruct e
            [(buffer data elemT buffsize)
             (set! depth 0)
             ]
            [_
  (define sub-exp (halide:sub-exprs e))
  (for/list ([se sub-exp])
            ;(println se)
            (define sub-depth (get-expr-depth se))
            (define edge-depth (+ 1 sub-depth))
            (set! depth (max depth edge-depth))
            )

              ]
            )


  depth
  
  )


(define (extract-sub-expressions expr depth)
  (define is-buffer? (buffer? expr))
  (cond
    [is-buffer?
      (list (hash-expr expr))
      ]
    [else
      (define leaves (get-sub-exprs expr (+ 1 depth)))
      (define leaves-sizes (get-expr-bv-sizes leaves))
      (define sym-bvs (create-concrete-bvs leaves-sizes)) 

      (define halide-expr-args (create-buffers leaves sym-bvs))


      (define-values (expr-extract num-used) (bind-expr-args expr  halide-expr-args depth))

      (define current-hash (hash-expr expr-extract))

      (define sub-results (for/list ([leaf leaves]) (extract-sub-expressions leaf depth)))

      (define combine-children (apply append sub-results))
      (define final (append (list current-hash)   combine-children))
      final

      ]
    )
  )

(define (get-imm-values expr)

  (define imms-vals (list))
  (define (visitor-fn e)
    (destruct e
              [(int-imm data signed?) 
               (set! imms-vals (append imms-vals (list data)))
               e
               ]
              [(vector_reduce op width vec) 
               (set! imms-vals (append imms-vals (list (bv 1 (bitvector (vec-precision e))))))
               e
               ]
              [(vec-shr v1 v2) 
               (define shift-imms (get-imm-values v2))
               (define adjusted (for/list ([val shift-imms])   (if (< (bvlength val) 32)  (zero-extend val (bitvector 32)) val )))
               (set! imms-vals (append imms-vals adjusted))
               e

               ]
               [(vec-rounding_shift_right v1 v2) 
                (define prec (vec-precision v1))
                (define one (bv 1 (bitvector prec)))
                (define two (bv 2 (bitvector prec)))
               (set! imms-vals (append imms-vals (list one two)))
               e

               ]

               [(vec-rounding_halving_add v1 v2) 
                (define prec (* 2 (vec-precision v1)))
                (define one (bv 1 (bitvector prec)))
                (define two (bv 2 (bitvector prec)))
               (set! imms-vals (append imms-vals (list one two)))
               e

               ]
              ;; When target doesn't support saturating operations
              ;; of a given size then we can decompose the operation
              ;; into 
              [_ e]
              )
    )

  (halide:visit expr visitor-fn)

  (remove-duplicates imms-vals)

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
    [else (error "halide/utils.rkt: Unexpected buffer type in elemT-size" elemT )])
)


(define (size-to-elemT size) 
(cond
    [(eq? size 8) 'uint8]
    [(eq? size 16) 'uint16]
    [(eq? size 32) 'uint32]
    [(eq? size 64) 'uint64]
    [else (error "halide/utils.rkt: Unexpected buffer type in size-to-elemT" size )])
)


(define (size-to-elemT-signed size signed?) 
(cond
    [(and (eq? size 8) signed?) 'int8]
    [(and (eq? size 16) signed?) 'int16]
    [(and (eq? size 32) signed?) 'int32]
    [(and (eq? size 64) signed?) 'int64]
    [(eq? size 8) 'uint8]
    [(eq? size 16) 'uint16]
    [(eq? size 32) 'uint32]
    [(eq? size 64) 'uint64]
    [else (error "halide/utils.rkt: Unexpected buffer type in size-to-elemT-signed" size )])
)

(define (get-widened-elemT elemT)
  (cond
    [(equal? elemT 'int8) 'int16]
    [(equal? elemT 'int16) 'int32]
    [(equal? elemT 'int32) 'int64]
    [(equal? elemT 'int64) 'int128]
    [(equal? elemT 'uint8) 'uint16]
    [(equal? elemT 'uint16) 'uint32]
    [(equal? elemT 'uint32) 'uint64]
    [(equal? elemT 'uint64) 'uint128]
    [else
      (error "unsupported type for widening in halide" elemT)
      ]
   )
  )


;; Infer the length of vector generated by the expression
(define (get-elemT expr)
  (destruct expr
    ;; Abstract expressions
    [(abstr-halide-expr orig-expr abstr-vals) (vec-precision orig-expr)]
    
    ;; Constructors
    [(x8 sca) (get-elemT sca)]
    [(x16 sca) (get-elemT sca)]
    [(x32 sca) (get-elemT sca)]
    [(x64 sca)  (get-elemT sca)]
    [(x128 sca)  (get-elemT sca)]
    [(x256 sca)  (get-elemT sca)]
    [(x512 sca)  (get-elemT sca)]
    [(xBroadcast sca factor) (get-elemT sca)]

    [(ramp base stride len) (get-elemT base)]
    [(load buf idxs alignment) (size-to-elemT (vec-precision idxs))]
    [(load-sca buf idx) 'int8]
    [(int-imm data signed?) (size-to-elemT-signed (bvlength data) signed?)]
    [(buffer data elemT buffsize) elemT]

    ;; Type Casts
    [(cast-int vec olane oprec) (size-to-elemT-signed oprec #t)]
    [(cast-uint vec olane oprec) (size-to-elemT-signed oprec #f)]
    [(vec-saturate vec olane oprec signed?) (size-to-elemT-signed oprec signed?) ]
    [(uint8x1 sca) 'uint8]
    [(uint16x1 sca) 'uint16]
    [(uint32x1 sca) 'uint32]
    [(uint64x1 sca) 'uint64]
    
    [(int8x1 sca) 'int8]
    [(int16x1 sca) 'int16]
    [(int32x1 sca) 'int32]
    [(int64x1 sca) 'int64]

    [(uint1x32 vec) 'int1]
    [(uint1x64 vec) 'int1]
    [(uint1x128 vec) 'int1]
    [(uint1x256 vec) 'int1]
    [(uint1x512 vec) 'int1]
   

    [(uint8x8 vec) 'uint8]
    [(uint16x8 vec) 'uint16]
    [(uint32x8 vec) 'uint32]
    [(uint64x8 vec) 'uint64]

    [(int8x8 vec) 'int8]
    [(int16x8 vec) 'int16]
    [(int32x8 vec) 'int32]
    [(int64x8 vec) 'int64]


    [(uint8x16 vec) 'uint8]
    [(uint16x16 vec) 'uint16]
    [(uint32x16 vec) 'uint32]
    [(uint64x16 vec) 'uint64]

    [(int8x16 vec) 'int8]
    [(int16x16 vec) 'int16]
    [(int32x16 vec) 'int32]
    [(int64x16 vec) 'int64]

    [(uint8x32 vec) 'uint8]
    [(uint16x32 vec) 'uint16]
    [(uint32x32 vec) 'uint32]
    [(uint64x32 vec) 'uint64]
    
    [(int8x32 vec) 'int8]
    [(int16x32 vec) 'int16]
    [(int32x32 vec) 'int32]
    [(int64x32 vec) 'int64]
    
    [(uint8x64 vec) 'uint8]
    [(uint16x64 vec) 'uint16]
    [(uint32x64 vec) 'uint32]
    [(uint64x64 vec) 'uint64]
    
    [(int8x64 vec) 'int8]
    [(int16x64 vec) 'int16]
    [(int32x64 vec) 'int32]
    [(int64x64 vec) 'int64]
    
    [(uint8x128 vec) 'uint8]
    [(uint16x128 vec) 'uint16]
    [(uint32x128 vec) 'uint32]
    [(uint64x128 vec) 'uint64]
    
    [(int8x128 vec) 'int8]
    [(int16x128 vec) 'int16]
    [(int32x128 vec) 'int32]
    [(int64x128 vec) 'int64]
    
    [(uint8x256 vec) 'uint8]
    [(uint16x256 vec) 'uint16]
    [(uint32x256 vec) 'uint32]
    [(uint64x256 vec) 'uint64]

    [(int8x256 vec) 'int8]
    [(int16x256 vec) 'int16]
    [(int32x256 vec) 'int32]
    [(int64x256 vec) 'int64]

    [(uint8x512 vec) 'uint8]
    [(uint16x512 vec) 'uint16]
    [(uint32x512 vec) 'uint32]
    [(uint64x512 vec) 'uint64]

    [(int8x512 vec) 'int8]
    [(int16x512 vec) 'int16]
    [(int32x512 vec) 'int32]
    [(int64x512 vec) 'int64]

    ;; Operations
    [(vec-add v1 v2) (get-elemT v1)]
    [(vec-sat-add v1 v2) (get-elemT v1)]
    [(vec-sub v1 v2) (get-elemT v1)]
    [(vec-sat-sub v1 v2) (get-elemT v1)]
    [(vec-mul v1 v2) (get-elemT v1)]
    [(vec-rounding_mul_shift_right v1 v2 v3) (get-elemT v1)]
    [(vec-rounding_shift_right v1 v2) (get-elemT v1)]
    [(vec-rounding_halving_add v1 v2) (get-elemT v1)]
    [(vec-widen-mul v1 v2) (get-widened-elemT (get-elemT v1))] 
    [(vec-div v1 v2) (get-elemT v1)]
    [(vec-mod v1 v2) (get-elemT v1)]
    [(vec-min v1 v2) (get-elemT v1)]
    [(vec-max v1 v2) (get-elemT v1)]

    [(vec-if v1 v2 v3) (get-elemT v2)]
    [(vec-eq v1 v2) 'uint1]
    [(vec-lt v1 v2) (get-elemT v1)]
    [(vec-le v1 v2) (get-elemT v1)]

    [(vec-abs v1) (get-elemT v1)]
    [(vec-clz v1) (get-elemT v1)]

    [(vec-absd v1 v2) (get-elemT v1)]
    [(vec-shl v1 v2) (get-elemT v1)]
    [(vec-shr v1 v2) (get-elemT v1)]

    [(vec-bwand v1 v2) (get-elemT v1)]
    [(vec-bwnot v1) (get-elemT v1)]

    [(vector_reduce op width vec) (get-elemT vec)]

    ;; Shuffles
    [(slice_vectors vec base stride len) (get-elemT vec)]
    [(concat_vectors v1 v2) (get-elemT v1)]
    [(interleave v1 v2) (get-elemT v1) ]
    [(interleave4 v1 v2 v3 v4) (get-elemT v1)]
    [(dynamic_shuffle vec idxs st end) (get-elemT vec)]

    [(vec-broadcast n vec) (get-elemT vec)]
    
    ;; Base case
    [_ (error "halide\\utils.rkt: Don't know how to infer vector elemT for Halide expression:" expr)]))

;; 


;; Infer the length of vector generated by the expression
(define (vec-precision expr)
  (destruct expr
    ;; Abstract expressions
    [(abstr-halide-expr orig-expr abstr-vals) (vec-precision orig-expr)]
    
    ;; Constructors
    [(x8 sca) (vec-precision sca)]
    [(x16 sca) (vec-precision sca)]
    [(x32 sca) (vec-precision sca)]
    [(x64 sca) (vec-precision sca)]
    [(x128 sca) (vec-precision sca)]
    [(x256 sca) (vec-precision sca)]
    [(x512 sca) (vec-precision sca)]
    [(xBroadcast sca factor) (vec-precision sca)]

    [(ramp base stride len) (vec-precision base)]
    [(load buf idxs alignment) (vec-precision idxs)]
    [(load-sca buf idx) 1]
    [(int-imm data signed?) (bvlength data)]
    [(buffer data elemT buffsize) (elemT-size elemT)]

    ;; Type Casts
    [(cast-int vec olane oprec) oprec]
    [(cast-uint vec olane oprec) oprec]
    [(vec-saturate vec olane oprec signed?) oprec]
    [(uint8x1 sca) 8]
    [(uint16x1 sca) 16]
    [(uint32x1 sca) 32]
    [(uint64x1 sca) 64]
    
    [(int8x1 sca) 8]
    [(int16x1 sca) 16]
    [(int32x1 sca) 32]
    [(int64x1 sca) 64]

    [(uint1x32 vec) 1]
    [(uint1x64 vec) 1]
    [(uint1x128 vec) 1]
    [(uint1x256 vec) 1]
    [(uint1x512 vec) 1]
   

    [(uint8x8 vec) 8]
    [(uint16x8 vec) 16]
    [(uint32x8 vec) 32]
    [(uint64x8 vec) 64]


    [(int8x8 vec) 8]
    [(int16x8 vec) 16]
    [(int32x8 vec) 32]
    [(int64x8 vec) 64]


    [(uint8x16 vec) 8]
    [(uint16x16 vec) 16]
    [(uint32x16 vec) 32]
    [(uint64x16 vec) 64]


    [(int8x16 vec) 8]
    [(int16x16 vec) 16]
    [(int32x16 vec) 32]
    [(int64x16 vec) 64]

    [(uint8x32 vec) 8]
    [(uint16x32 vec) 16]
    [(uint32x32 vec) 32]
    [(uint64x32 vec) 64]
    
    [(int8x32 vec) 8]
    [(int16x32 vec) 16]
    [(int32x32 vec) 32]
    [(int64x32 vec) 64]
    
    [(uint8x64 vec) 8]
    [(uint16x64 vec) 16]
    [(uint32x64 vec) 32]
    [(uint64x64 vec) 64]
    
    [(int8x64 vec) 8]
    [(int16x64 vec) 16]
    [(int32x64 vec) 32]
    [(int64x64 vec) 64]
    
    [(uint8x128 vec) 8]
    [(uint16x128 vec) 16]
    [(uint32x128 vec) 32]
    [(uint64x128 vec) 64]
    
    [(int8x128 vec) 8]
    [(int16x128 vec) 16]
    [(int32x128 vec) 32]
    [(int64x128 vec) 64]
    
    [(uint8x256 vec) 8]
    [(uint16x256 vec) 16]
    [(uint32x256 vec) 32]
    [(uint64x256 vec) 64]

    [(int8x256 vec) 8]
    [(int16x256 vec) 16]
    [(int32x256 vec) 32]
    [(int64x256 vec) 64]

    [(uint8x512 vec) 8]
    [(uint16x512 vec) 16]
    [(uint32x512 vec) 32]
    [(uint64x512 vec) 64]

    [(int8x512 vec) 8]
    [(int16x512 vec) 16]
    [(int32x512 vec) 32]
    [(int64x512 vec) 64]

    ;; Operations
    [(vec-add v1 v2) (vec-precision v1)]
    [(vec-sat-add v1 v2) (vec-precision v1)]
    [(vec-sub v1 v2) (vec-precision v1)]
    [(vec-sat-sub v1 v2) (vec-precision v1)]
    [(vec-mul v1 v2) (vec-precision v1)]
    [(vec-rounding_mul_shift_right v1 v2 v3) (vec-precision v1)]
    [(vec-rounding_shift_right v1 v2) (vec-precision v1)]
    [(vec-rounding_halving_add v1 v2) (vec-precision v1)]
    [(vec-widen-mul v1 v2) (* 2 (vec-precision v1))]
    [(vec-div v1 v2) (vec-precision v1)]
    [(vec-mod v1 v2) (vec-precision v1)]
    [(vec-min v1 v2) (vec-precision v1)]
    [(vec-max v1 v2) (vec-precision v1)]

    [(vec-if v1 v2 v3) (vec-precision v2)]
    [(vec-eq v1 v2) 1]
    [(vec-lt v1 v2) (vec-precision v1)]
    [(vec-le v1 v2) (vec-precision v1)]

    [(vec-abs v1) (vec-precision v1)]
    [(vec-clz v1) (vec-precision v1)]

    [(vec-absd v1 v2) (vec-precision v1)]
    [(vec-shl v1 v2) (vec-precision v1)]
    [(vec-shr v1 v2) (vec-precision v1)]

    [(vec-bwand v1 v2) (vec-precision v1)]
    [(vec-bwnot v1 ) (vec-precision v1)]

    [(vector_reduce op width vec) (vec-precision vec)]

    ;; Shuffles
    [(slice_vectors vec base stride len) (vec-precision vec)]
    [(concat_vectors v1 v2) (vec-precision v1)]
    [(interleave v1 v2) (vec-precision v1) ]
    [(interleave4 v1 v2 v3 v4) (vec-precision v1)]
    [(dynamic_shuffle vec idxs st end) (vec-precision vec)]

    [(vec-broadcast n vec) (vec-precision vec)]
    
    ;; Base case
    [_ (error "halide\\utils.rkt: Don't know how to infer vector precision for Halide expression:" expr)]))

;; 




;; Utilities to check if halide expressions are equivalent

(define (is-buffer-hash e)
  (cond 
    [(equal? e '(buf uint8 32))
     (values #t 'uint8 32)
     ]
    [(equal? e '(buf uint8 64))
     (values #t 'uint8 64)
     ]
    [(equal? e '(buf uint8 128))
     (values #t 'uint8 128)
     ]
    [(equal? e '(buf uint8 256))
     (values #t 'uint8 256)
     ]
    [(equal? e '(buf uint8 512))
     (values #t 'uint8 512)
     ]
    [(equal? e '(buf uint8 1024))
     (values #t 'uint8 1024)
     ]
    [(equal? e '(buf uint8 2048))
     (values #t 'uint8 2048)
     ]
    [(equal? e '(buf int8 32))
     (values #t 'int8 32)
     ]
    [(equal? e '(buf int8 64))
     (values #t 'int8 64)
     ]
    [(equal? e '(buf int8 128))
     (values #t 'int8 128)
     ]
    [(equal? e '(buf int8 256))
     (values #t 'int8 256)
     ]
    [(equal? e '(buf int8 512))
     (values #t 'int8 512)
     ]
    [(equal? e '(buf int8 1024))
     (values #t 'int8 1024)
     ]
    [(equal? e '(buf int8 2048))
     (values #t 'int8 2048)
     ]
    [(equal? e '(buf uint16 32))
     (values #t 'uint16 32)
     ]
    [(equal? e '(buf uint16 64))
     (values #t 'uint16 64)
     ]
    [(equal? e '(buf uint16 128))
     (values #t 'uint16 128)
     ]
    [(equal? e '(buf uint16 256))
     (values #t 'uint16 256)
     ]
    [(equal? e '(buf uint16 512))
     (values #t 'uint16 512)
     ]
    [(equal? e '(buf uint16 1024))
     (values #t 'uint16 1024)
     ]
    [(equal? e '(buf uint16 2048))
     (values #t 'uint16 2048)
     ]
    [(equal? e '(buf int16 32))
     (values #t 'int16 32)
     ]
    [(equal? e '(buf int16 64))
     (values #t 'int16 64)
     ]
    [(equal? e '(buf int16 128))
     (values #t 'int16 128)
     ]
    [(equal? e '(buf int16 256))
     (values #t 'int16 256)
     ]
    [(equal? e '(buf int16 512))
     (values #t 'int16 512)
     ]
    [(equal? e '(buf int16 1024))
     (values #t 'int16 1024)
     ]
    [(equal? e '(buf int16 2048))
     (values #t 'int16 2048)
     ]
    [(equal? e '(buf uint32 32))
     (values #t 'uint32 32)
     ]
    [(equal? e '(buf uint32 64))
     (values #t 'uint32 64)
     ]
    [(equal? e '(buf uint32 1024))
     (values #t 'uint32 1024)
     ]
    [(equal? e '(buf uint32 2048))
     (values #t 'uint32 2048)
     ]
    [(equal? e '(buf int32 32))
     (values #t 'int32 32)
     ]
    [(equal? e '(buf int32 64))
     (values #t 'int32 64)
     ]
    [(equal? e '(buf int32 1024))
     (values #t 'int32 1024)
     ]
    [(equal? e '(buf int32 2048))
     (values #t 'int32 2048)
     ]
    [else
      (values #f 0 0)
      ]
    
    )
  
  )



(define (get-halide-expr-regs expr)
  (define-values (is-buf? type size) (is-buffer-hash expr))
  (cond
    [is-buf?
     (list (halide:create-buffer (bv 0 size) type))
     ]

    [(buffer? expr)
     (list expr)
     ]
    [else
      (define sub-exprs (halide:sub-exprs expr))
      (define nested-regs (for/list ([sub-exp sub-exprs])  (get-halide-expr-regs sub-exp)))
      (apply append nested-regs)
      ]
    )
  )


(define (halide-expr-equiv? e1 e2)
  (define regs-1 (get-halide-expr-regs e1))
  (define regs-2 (get-halide-expr-regs e2))



  (cond
    [(equal? e1 e2)
     ;; Hashs are equivalent, they match exactly
     #t
     ]
    [(equal? (length regs-1) (length regs-2))
     ;; proceed with next steps

     (define (get-types b)
       (destruct b
                 [(buffer data elemT buffsize)
                  elemT
                  ]
                 [_
                   (error "Must be buffers to get types")
                   ]
                 )
       )

     (define types-e1 (for/list ([b regs-1]) (get-types b)))
     (define types-e2 (for/list ([b regs-2]) (get-types b)))

     (define intersect-types (set-intersect types-e1 types-e2))

     (cond 
       [(not (equal? (length intersect-types) 0))
        ;; Check further if the list of the sizes (sorted) are the same

        (define (get-sizes b)
          (destruct b
                    [(buffer data elemT buffsize)
                     buffsize
                     ]
                    [_
                      (error "Must be buffers to get types")
                      ]
                    )
          )
        (define sizes-e1 (sort (for/list ([b regs-1]) (get-sizes b)) <))
        (define sizes-e2 (sort (for/list ([b regs-2]) (get-sizes b)) <))

        (cond
          [(and (equal? sizes-e1 sizes-e2) ) 
           ;; Same number of arguments with same sizes, 
           ;; we can check if they are equivalent through verification
           (verify-equivalent-halide-exprs e1 e2)
           ]
          [else
            ;; Operating on different sizes of vectors, hence can't be equivlant
            #f
            ]
          )
        ]
       [else
         ;; Has no common types, hence we can discard equivalence
         #f
         ]

       )


     ]
    [else
      ;; Different number of registers, hence expressions
      ;; are not equal
      #f
      ]
    
    )
  
  
  
  )


(define (verify-equivalent-halide-exprs e1 e2)
  ;(displayln "Verify-Equivalent-halide-exprs")
  (define regs-1 (get-halide-expr-regs e1))
  (define regs-2 (get-halide-expr-regs e2))

  (define (replace-hashed-buf expr)
    (define-values (is-buff? type size) (is-buffer-hash expr))
    (if 
      is-buff?
      (halide:create-buffer (bv 0 size) type)
      expr
      )
    )


  (define dummy-e1 (halide:visit e1 replace-hashed-buf ))
  (define dummy-e2 (halide:visit e2 replace-hashed-buf ))



  ;; We know that regs-1 and regs-2 have the same number
  ;; of arguments, have some common types, and have the
  ;; same number of arguments of a given sizes. To check
  ;; if they're equivalent, what we will do is
  ;; create symbolic holes according to e1, and 
  ;; define a grammar for e2 which can choose between
  ;; any of the bitvectors of the same size from e1.
  ;; This way, we let the synthesizer find any isomorphism
  ;; and ordering for the arguments


  (define (get-sizes b)
    (destruct b
              [(buffer data elemT buffsize)
               buffsize
               ]
              [_
                (error "Must be buffers to get types")
                ]
              )
    )

  (define (get-type b)
    (destruct b
              [(buffer data elemT buffsize)
               elemT
               ]
              [_
                (error "Must be buffers to get types")
                ]
              )
    )

  (define bv-sizes (for/list ([b regs-1])  (get-sizes b)))
  (define unique-sizes (remove-duplicates bv-sizes))

  (define sym-bvs (create-symbolic-bvs bv-sizes))
  ;(println bv-sizes)


  (define depth-e1 (get-expr-depth dummy-e1))

  (define bound-regs-1
    (for/list ([i (range (length bv-sizes))])
              (define hole (vector-ref sym-bvs i))
              (define reg-i (list-ref regs-1 i))
              (define type-i (get-type reg-i))
              ;(println type-i)
              ;(println hole)
              (halide:create-buffer hole type-i)
              )
    )


  (define-values (symbolic-e1 num-used-1) (bind-expr-args dummy-e1 (list->vector bound-regs-1) (+ depth-e1 1)))


  ;; For each unique size in e1, we define a map
  ;; which maps from a given bitvector size
  ;; to a grammar which selects bitvectors of those sizes

  (define bv-size-to-grammar-hash (make-hash))



  (define (grammar-visitor expr)
    (destruct expr
              [(buffer data elemT buffsize)

               (define (matches-size? s)
                 (equal? (bvlength s) buffsize)
                 )

               (define holes-of-size (filter matches-size? (vector->list sym-bvs)))
               ;(displayln "holes of sizes")
               ;(println holes-of-size)

               (define-grammar (choose-regs)
                               [expr
                                 (choose 
                                   ;(list-ref holes-of-size (?? integer?))
                                   (?? integer?)
                                  )
                                 ]
                               )

               (define-symbolic* index integer?)
               (assume (>= index 0))
               (assume (< index (length holes-of-size)))

               ;(halide:create-buffer (choose-regs) elemT)

               (halide:create-buffer (vector-ref (list->vector holes-of-size) index) elemT)
               ]
              [v v]
              )
    )
  (define symbolic-e2 (halide:visit dummy-e2 grammar-visitor))

  ;(displayln "Symbolic e1")
  ;(pretty-print symbolic-e1)

  ;(displayln "Symbolic e2")
  ;(pretty-print symbolic-e2)

  ;(println (halide:vec-len symbolic-e1))


  (define (equiv-at-index i)
    (define e1-result-i (cpp:eval ((halide:interpret symbolic-e1) i)))
    (define e2-result-i (cpp:eval ((halide:interpret symbolic-e2) i)))
    (clear-vc!)
    (define sol
      (synthesize
        #:forall (list sym-bvs)
        #:guarantee
        (assert (equal? e1-result-i e2-result-i ))
        )
      )

    (sat? sol)
    )


  ;; First test equivalence on just one index
  (define equiv (equiv-at-index 0))

  (cond
    [equiv
    (define e1-result (halide:assemble-bitvector (halide:interpret symbolic-e1) (halide:vec-len symbolic-e1) ))
    (define e2-result (halide:assemble-bitvector (halide:interpret symbolic-e2) (halide:vec-len symbolic-e2) ))

    (clear-vc!)
    (define sol
      (synthesize
        #:forall (list sym-bvs)
        #:guarantee
        (assert (equal? e1-result e2-result ))
        )
      )

    (sat? sol)
      ]
    [else
      ;(displayln "Not equal at index 0")
      #f
      ]
    )
  )



;; Given a list of expression hashes,
;; create a hash-map which maps each expression
;; to how many times it appears in the list.
;; This is useful for any analysis on the frequency
;; of expressions.
(define (bucketize-hash expr-ls)
  (define buckets (make-hash))

  (for/list ([expr expr-ls])
            (define-values  (is-buf? type size) (is-buffer-hash expr))
            (cond
              [is-buf?
                ;; Skip expressions which are just buffers
                '()
                ]
              [(hash-has-key? buckets expr)
               (define prev-count (hash-ref buckets expr))
               (hash-set! buckets expr (+ 1 prev-count))
               ]
              [else
                (hash-set! buckets expr 1)
                ]
              )
            )
  buckets
  
  )

(define (get-common-expressions expr-ls-1 expr-ls-2)
  
  (define hash1 (bucketize-hash expr-ls-1))
  (define hash2 (bucketize-hash expr-ls-2))

  ;(pretty-print hash1)
  ;(pretty-print hash2)

  (define exprs-1 (hash-keys hash1))
  (define exprs-2 (hash-keys hash2))

  (define common-expressions (list))

  (for/list ([e1 exprs-1])
            (for/list ([e2 exprs-2])

                      (define equivalent? (halide-expr-equiv? e1 e2))

                      (cond 
                        [equivalent? 
                          (set! common-expressions (append common-expressions (list (list e1 e2))))
                          ]
                        )

                      )
            )
  common-expressions
  )




(define (is-int-min? bits broadcast-expr signed?)
  (define int-min-value 
    (cond
      [signed? 
        (bvsminval bits)
        ]
      [else
        (bvuminval bits)
        ]
      )
    )

  (define cvt-to-integer 
    (cond
      [signed?
        bitvector->integer
        ]
      [else
        bitvector->natural
        ]
      
      )
    )



  (define expr-value (cpp:eval ((halide:interpret broadcast-expr) 0)))


  (equal? (cvt-to-integer expr-value) (cvt-to-integer int-min-value) )
  )

(define (is-int-max? bits broadcast-expr signed?)
  (define int-max-value 
    (cond
      [signed? 
        (bvsmaxval bits)
        ]
      [else
        (bvumaxval bits)
        ]
      )
    )

  (define cvt-to-integer 
    (cond
      [signed?
        bitvector->integer
        ]
      [else
        bitvector->natural
        ]
      
      )
    )



  (define expr-value (cpp:eval ((halide:interpret broadcast-expr) 0)))


  (equal? (cvt-to-integer expr-value) (cvt-to-integer int-max-value) )
  )

(define (match-saturating-cast expr)
  (define (visitor-fn ele)
    (match
      ele
      [
       (cast-int
         (vec-max
           (vec-min 
             min1
             min2
             )
           max2
           )
         olanes prec
         )

       (cond
         [(and  (is-int-min? prec max2 #t) (is-int-max? prec min2 #t))
          (vec-saturate min1 olanes prec #t)
          ]
         [else
           ele
           ]
         )
       ]
      [
       (cast-uint
         (vec-max
           (vec-min 
             min1
             min2
             )
           max2
           )
         olanes prec
         )

       (displayln "HERE!")

       (cond
         [(and  (is-int-min? prec max2 #f) (is-int-max? prec min2 #f))
          (vec-saturate min1 olanes prec #f)
          ]
         [else
           ele
           ]
         )
       ]
      [_ ele]
      )
    )
  (halide:visit expr visitor-fn)

  )
