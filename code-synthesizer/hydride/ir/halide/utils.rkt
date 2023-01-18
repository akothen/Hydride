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
  )

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
     (list extract bvmul bvadd sign-extend zero-extend 'ramp)
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
    [(sca-absd v1 v2) (append (list abs bvsub bvor) (if (halide:is-signed-expr? v1 v2) (list bvsge sign-extend bvsmax bvsmin) (list bvuge zero-extend bvumax bvumin ))  (get-bv-ops v1) (get-bv-ops v2))]
    [(sca-shl v1 v2) (append (list bvshl) (if (halide:is-signed-expr? v1 v2) (list  sign-extend ) (list zero-extend )) (get-bv-ops v1) (get-bv-ops v2))]
    [(sca-shr v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list bvashr  sign-extend) (list bvlshr  zero-extend)) (get-bv-ops v1) (get-bv-ops v2))]
    [(sca-clz v1) (append empty-list (get-bv-ops v1) )]

    [(sca-bwand v1 v2) (append (list extract bvand) (get-bv-ops v1) (get-bv-ops v2) )]
    
    [(vec-add v1 v2) (append (list extract bvadd) (if (halide:is-signed-expr? v1 v2) (list sign-extend  ) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2) )]

    [(vec-sat-add v1 v2) (append (list extract ) (if (halide:is-signed-expr? v1 v2) (list  bvaddnsw ) (list  bvaddnuw  )) (get-bv-ops v1)  (get-bv-ops v2) )]
    [(vec-sub v1 v2) (append (list extract bvsub)  (get-bv-ops v1)  (get-bv-ops v2) )]
    [(vec-sat-sub v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list bvsubnsw 'bvssat) (list  bvsubnuw 'bvusat)) (get-bv-ops v1)  (get-bv-ops v2) )]
    [(vec-mul v1 v2) (append (list extract bvmul) (if (halide:is-signed-expr? v1 v2) (list  sign-extend zero-extend ) (list  zero-extend sign-extend)) (get-bv-ops v1)  (get-bv-ops v2))] ;; FIXME: add bvshl
    [(vec-div v1 v2) (append (list  extract)  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsdiv bvashr) (list zero-extend bvudiv bvlshr))  (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-mod v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list  bvsrem bvsmod) (list  bvurem bvurem))   (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-min v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list bvslt  bvsmin) (list bvult bvumin)) (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-max v1 v2) (append (list extract) (if (halide:is-signed-expr? v1 v2) (list  bvsmax bvsgt) (list  bvumax bvugt))  (get-bv-ops v1)  (get-bv-ops v2))]

    [(vec-if v1 v2 v3) (append (list bveq 'if 'cond) (get-bv-ops v1)  (get-bv-ops v2)  (get-bv-ops v3) )]
    [(vec-eq v1 v2) (append (list eq? bveq) (get-bv-ops v1)  (get-bv-ops v2)   )]
    [(vec-lt v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvslt) (list zero-extend bvult))   (get-bv-ops v1)  (get-bv-ops v2))]
    [(vec-le v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list sign-extend bvsle) (list zero-extend bvule))  (get-bv-ops v1)  (get-bv-ops v2))]

    [(vec-abs v1) (append (list extract bvsge bvmul abs) (get-bv-ops v1)  )]
    [(vec-shl v1 v2) (append (list bvshl )  (get-bv-ops v1) (get-bv-ops v2))]
    [(vec-shr v1 v2) (append  (if (halide:is-signed-expr? v1 v2) (list bvashr  ) (list bvlshr  )) (get-bv-ops v1) (get-bv-ops v2))]
    [(vec-absd v1 v2) (append (list  bvsub bvor) (if (halide:is-signed-expr? v1 v2) (list  sign-extend bvsmax bvsmin) (list  zero-extend bvumax bvumin ))  (get-bv-ops v1) (get-bv-ops v2))]
    [(vec-clz v1) (append empty-list (get-bv-ops v1) )]

    [(vec-bwand v1 v2) (append (list extract bvand) (get-bv-ops v1) (get-bv-ops v2) )]

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

  (define (visitor-fn e)
    (destruct e
              [(buffer data elemT buffsize) 
               (define scaled-size (/ buffsize scale-factor))
               (halide:create-buffer (bv 0 (bitvector scaled-size)) elemT)
               ]
              [(cast-int vec olane oprec)
               (cast-int vec (/ olane scale-factor) oprec)
               ]
              [(cast-uint vec olane oprec)
               (cast-uint vec (/ olane scale-factor) oprec)
               ]
              [(xBroadcast sca factor) 
               (xBroadcast sca (/ factor scale-factor))
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
                   (error "Unsupported scaling size: " scale-factor)
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
                   (error "Unsupported scaling size: " scale-factor)
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
                   (error "Unsupported scaling size: " scale-factor)
                   ]
                 )
               ]

              [(x16 sca)
               (cond
                 [(equal? scale-factor 2)
                  (x8 sca)
                  ]
                 [else
                   (error "Unsupported scaling size: " scale-factor)
                   ]
                 )
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

  result
  
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
               (set! flag #t)
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



(define (get-imm-values expr)

  (define imms-vals (list))
  (define (visitor-fn e)
    (destruct e
              [(int-imm data signed?) 
               (set! imms-vals (append imms-vals (list data)))
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
