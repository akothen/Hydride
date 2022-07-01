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
  )

(provide (prefix-out halide: (all-defined-out)))


;; Extract sub-expressions
;; Obtain sizes of sub-expressions
;; return a function which:
;; Given an expression of size len(sub-expressions) -> Bind elements of vectors accordingly



;; Binds
(define (bind-expr-args expr args depth)
  (define (arg i) (vector-ref args i))
  (define is-leaf-depth (eq? depth 1))
  (destruct expr
    ;; Constructors
    [(x32 sca) (values (x32 (arg 0)) 1)]
    [(x64 sca) (values (x64 (arg 0)) 1)]
    [(x128 sca) (values (x128 (arg 0)) 1)]
    [(x256 sca) (values (x256 (arg 0)) 1)]
    [(x512 sca) (values (x512 (arg 0)) 1)]

    [(ramp base stride len) (values '() 0)]
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

    ;; Type Casts
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
    
    [(uint64x128 vec) 
       (if is-leaf-depth
        (values (uint64x128 (arg 0)) 1)
        (begin
          (define-values (leaf-sol args-used) (bind-expr-args vec args (- depth 1)))
          (values (uint64x128 leaf-sol) args-used)
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
          (values (vector_reduce n leaf1-sol) args-used1)
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
;; before at an earleir depth, we return '().
(define (get-sub-exprs expr depth)

  (cond
    [(equal? expr '())
     expr
     ]

    [(equal? depth 1)
     (list expr)
     ]

    [else
      (define imm-sub-exprs (halide:sub-exprs expr))
      (apply append
             (for/list ([i (range (length imm-sub-exprs))])
                       (get-sub-exprs (list-ref imm-sub-exprs i) (- depth 1))
                       )
             )
     ]
    
    )

  )


(define (get-expr-bv-sizes expr-list)
  (for/list ([i (range (length expr-list))])
            (halide:vec-len (list-ref expr-list i))
            )
  
  )

(define (create-expr expr-ty sub-expr-vector)
  (define (arg i) (vector-ref sub-expr-vector i))
  (cond
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



;; 
