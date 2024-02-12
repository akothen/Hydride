#lang rosette



;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here

;; Utils
(require hydride/utils/bvops)
(require hydride/utils/misc)
(require hydride/utils/debug)
(require hydride/utils/llvm_impl)
(require hydride/utils/target)
(require hydride/utils/extract_sub_exprs)


;; Hydride IR
(require hydride/ir/hydride/semantics)
(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/cost_model)
(require hydride/ir/hydride/length)
(require hydride/ir/hydride/prec)
(require hydride/ir/hydride/printer)
(require hydride/ir/hydride/interpreter)
(require hydride/ir/hydride/binder)
(require hydride/ir/hydride/const_fold)
(require hydride/ir/hydride/visitor)
(require hydride/ir/hydride/scale)
(require hydride/ir/hydride/get_ops)



;; HVX IR
(require hydride/ir/hvx/semantics)
(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/cost_model)
(require hydride/ir/hvx/length)
(require hydride/ir/hvx/prec)
(require hydride/ir/hvx/printer)
(require hydride/ir/hvx/interpreter)
(require hydride/ir/hvx/binder)
(require hydride/ir/hvx/const_fold)
(require hydride/ir/hvx/visitor)
(require hydride/ir/hvx/scale)
(require hydride/ir/hvx/get_ops)
(require hydride/ir/hvx/get_name)
(require hydride/ir/hvx/sub_expr)
(require hydride/ir/hvx/extract)
(require hydride/ir/hvx/instcombine_fast)
(require hydride/ir/hvx/get_variants)


;; BitSIMD IR
(require hydride/ir/bitsimd/semantics)
(require hydride/ir/bitsimd/definition)
(require hydride/ir/bitsimd/cost_model)
(require hydride/ir/bitsimd/length)
(require hydride/ir/bitsimd/prec)
(require hydride/ir/bitsimd/printer)
(require hydride/ir/bitsimd/interpreter)
(require hydride/ir/bitsimd/binder)
(require hydride/ir/bitsimd/const_fold)
(require hydride/ir/bitsimd/visitor)
(require hydride/ir/bitsimd/scale)
(require hydride/ir/bitsimd/get_ops)
(require hydride/ir/bitsimd/get_name)
(require hydride/ir/bitsimd/sub_expr)
(require hydride/ir/bitsimd/extract)
(require hydride/ir/bitsimd/get_variants)


;; ARM IR
(require hydride/ir/arm/semantics)
(require hydride/ir/arm/definition)
(require hydride/ir/arm/cost_model)
(require hydride/ir/arm/length)
(require hydride/ir/arm/prec)
(require hydride/ir/arm/printer)
(require hydride/ir/arm/interpreter)
(require hydride/ir/arm/binder)
(require hydride/ir/arm/const_fold)
(require hydride/ir/arm/visitor)
(require hydride/ir/arm/scale)
(require hydride/ir/arm/get_ops)
(require hydride/ir/arm/get_name)


;; CPP IR
(require hydride/cpp)

;; Halide IR
(require hydride/halide)


;; ARITH Dialect IR
(require hydride/ir/arith/types)
(require hydride/ir/arith/interpreter)
(require hydride/ir/arith/utils)
(require hydride/ir/arith/visitor)


;; Synthesis 
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/synth_main)
(require hydride/synthesis/spec_utils)
(require hydride/synthesis/python)
(require hydride/synthesis/algorithm)
(require hydride/synthesis/llvm_codegen)
(require hydride/synthesis/lower_swizzle)
(require hydride/synthesis/scalable_synthesis)
(require hydride/synthesis/ir_to_ir_transform)
(require hydride/synthesis/hash_utils)



(provide 
  (all-from-out hydride/utils/bvops)
  (all-from-out hydride/utils/misc)
  (all-from-out hydride/utils/debug)
  (all-from-out hydride/utils/llvm_impl)
  (all-from-out hydride/utils/target)
  (all-from-out hydride/utils/extract_sub_exprs)

  (all-from-out hydride/ir/hydride/semantics)
  (all-from-out hydride/ir/hydride/definition)
  (all-from-out hydride/ir/hydride/cost_model)
  (all-from-out hydride/ir/hydride/length)
  (all-from-out hydride/ir/hydride/prec)
  (all-from-out hydride/ir/hydride/printer)
  (all-from-out hydride/ir/hydride/interpreter)
  (all-from-out hydride/ir/hydride/binder)
  (all-from-out hydride/ir/hydride/const_fold)
  (all-from-out hydride/ir/hydride/visitor)
  (all-from-out hydride/ir/hydride/scale)
  (all-from-out hydride/ir/hydride/get_ops)


  (all-from-out hydride/ir/hvx/semantics)
  (all-from-out hydride/ir/hvx/definition)
  (all-from-out hydride/ir/hvx/cost_model)
  (all-from-out hydride/ir/hvx/length)
  (all-from-out hydride/ir/hvx/prec)
  (all-from-out hydride/ir/hvx/printer)
  (all-from-out hydride/ir/hvx/interpreter)
  (all-from-out hydride/ir/hvx/binder)
  (all-from-out hydride/ir/hvx/const_fold)
  (all-from-out hydride/ir/hvx/visitor)
  (all-from-out hydride/ir/hvx/scale)
  (all-from-out hydride/ir/hvx/get_ops)
  (all-from-out hydride/ir/hvx/get_name)
  (all-from-out hydride/ir/hvx/sub_expr)
  (all-from-out hydride/ir/hvx/extract)
  (all-from-out hydride/ir/hvx/instcombine_fast)
  (all-from-out hydride/ir/hvx/get_variants)


  (all-from-out hydride/ir/arm/semantics)
  (all-from-out hydride/ir/arm/definition)
  (all-from-out hydride/ir/arm/cost_model)
  (all-from-out hydride/ir/arm/length)
  (all-from-out hydride/ir/arm/prec)
  (all-from-out hydride/ir/arm/printer)
  (all-from-out hydride/ir/arm/interpreter)
  (all-from-out hydride/ir/arm/binder)
  (all-from-out hydride/ir/arm/const_fold)
  (all-from-out hydride/ir/arm/visitor)
  (all-from-out hydride/ir/arm/scale)
  (all-from-out hydride/ir/arm/get_ops)
  (all-from-out hydride/ir/arm/get_name)





  (all-from-out hydride/ir/bitsimd/semantics)
  (all-from-out hydride/ir/bitsimd/definition)
  (all-from-out hydride/ir/bitsimd/cost_model)
  (all-from-out hydride/ir/bitsimd/length)
  (all-from-out hydride/ir/bitsimd/prec)
  (all-from-out hydride/ir/bitsimd/printer)
  (all-from-out hydride/ir/bitsimd/interpreter)
  (all-from-out hydride/ir/bitsimd/binder)
  (all-from-out hydride/ir/bitsimd/const_fold)
  (all-from-out hydride/ir/bitsimd/visitor)
  (all-from-out hydride/ir/bitsimd/scale)
  (all-from-out hydride/ir/bitsimd/get_ops)
  (all-from-out hydride/ir/bitsimd/get_name)


  (all-from-out hydride/cpp)

  (all-from-out hydride/halide)


  (all-from-out hydride/ir/arith/types)
  (all-from-out hydride/ir/arith/interpreter)
  (all-from-out hydride/ir/arith/utils)
  (all-from-out hydride/ir/arith/visitor)



  (all-from-out hydride/synthesis/symbolic_synthesis)
  (all-from-out hydride/synthesis/iterative_synthesis)
  (all-from-out hydride/synthesis/synth_main)
  (all-from-out hydride/synthesis/spec_utils)
  (all-from-out hydride/synthesis/algorithm)
  (all-from-out hydride/synthesis/python)
  (all-from-out hydride/synthesis/llvm_codegen)
  (all-from-out hydride/synthesis/lower_swizzle)
  (all-from-out hydride/synthesis/scalable_synthesis)
  (all-from-out hydride/synthesis/ir_to_ir_transform)
  (all-from-out hydride/synthesis/hash_utils)
  )

