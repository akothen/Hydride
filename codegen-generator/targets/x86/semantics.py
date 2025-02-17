#============================== Hydride File =================================
#
# Part of the Hydride Compiler Infrastructure. 
# <Placeholder for license information> 
#
#=============================================================================
#
# Do NOT modify this file. It is automatically generated. 
#
#=============================================================================




semantcs = {

            "_mm_srai_epi16" : {
              "target_instructions" : {
                "_mm_srai_epi16" : {
                  "args" : ["SYMBOLIC_BV_8","(bv #b1 1)","(bv #x0000000000000000 16)","(bv #x000000000000ffff 16)","SYMBOLIC_BV_128","(bv #x0000000f 8)","8","8","0","64","8","0","8","0","16","1","2","0","8","0","2","0"],
                  "in_vectsize" : 128,
                  "out_vectsize" : 128,
                  "lanesize" : 8,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : 6,
                  "out_vectsize_index" : 6,
                  "lanesize_index" : 7,
                  "in_precision_index" : 14,
                  "out_precision_index" : 14,
                  "arg_permute_map" : [1,-1,-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
                  "Signedness" : 0,
                  "Cost" : "[{'Skylake': {'l': '1', 't': '0.5'}}]",
                  "SIMD" : "True",
                  "Extensions" : "['sse2']",
      },
          },
              "semantics" : ['"(define (_mm_srai_epi16  imm8.norm %arg7.norm %arg6.norm %arg5.norm a.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg8.norm %arg9.norm %arg10.norm %arg11.norm %arg12.norm %arg13.norm %arg14.norm )"', '"(define dst.norm"', '"(apply"', '"concat"', '"(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])"', '" (apply"', '" concat"', '" (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])"', '"  (define %lastidx0.norm (-  %arg2.norm  1))"', '"  (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))"', '"  (define %1.norm (extract  %highidx0.norm %arg3.norm imm8.norm))"', '"  (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))"', '"  (cond"', '"  [(equal? %2.ab0.norm #t)"', '"   (begin"', '"   (define %0.copy.0.new0.norm (*  j0.new.norm  %arg9.norm))"', '"   (define %lastidx1.norm (-  %arg4.norm  1))"', '"   (define %4.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))"', '"   (define %lastidx2.norm (-  %arg8.norm  1))"', '"   (define %highidx1.norm (+  %4.norm  %lastidx2.norm))"', '"   (define %5.norm (extract  %highidx1.norm %4.norm a.norm))"', '"   (define %cond0.norm (bveq  %5.norm  %arg7.norm))"', '"   (define %6.norm (if (equal? %cond0.norm #t) %arg5.norm %arg6.norm))"', '"   %6.norm"', '"   )]"', '"  [else (begin"', '"   (define %0.copy.2.new0.norm (*  j0.new.norm  %arg13.norm))"', '"   (define %lastidx3.norm (-  %arg4.norm  1))"', '"   (define %8.norm (+  %0.copy.2.new0.norm  %lastidx3.norm))"', '"   (define %9.norm (extract  %8.norm %0.copy.2.new0.norm a.norm))"', '"   (define %lastidx4.norm (-  %arg11.norm  1))"', '"   (define %highidx2.norm (+  %lastidx4.norm  %arg12.norm))"', '"   (define %10.norm (extract  %highidx2.norm %arg12.norm imm8.norm))"', '"   (define %11.ab0.norm (bvsizeext  %10.norm %arg4.norm %arg10.norm))"', '"   (define %12.norm (bvashr  %9.norm  %11.ab0.norm))"', '"   %12.norm"', '"   )]"', '"  )"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  dst.norm %arg14.norm)"', '")"', '""'], 
        },
          
            "_mm_sra_epi16" : {
              "target_instructions" : {
                "_mm_sra_epi16" : {
                  "args" : ["SYMBOLIC_BV_128","SYMBOLIC_BV_128","(bv #x0000000000000000 16)","(bv #b1 1)","(bv #x000000000000ffff 16)","(bv #x000000000000000000000000000000000000000000000000000000000000000f 64)","128","128","0","128","16","0","64","0","16","1","0","64","0","0"],
                  "in_vectsize" : 128,
                  "out_vectsize" : 128,
                  "lanesize" : 128,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : 6,
                  "out_vectsize_index" : 6,
                  "lanesize_index" : 7,
                  "in_precision_index" : 14,
                  "out_precision_index" : 14,
                  "arg_permute_map" : [1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
                  "Signedness" : 0,
                  "Cost" : "[{'Skylake': {'l': '2', 't': '1'}}]",
                  "SIMD" : "True",
                  "Extensions" : "['sse2']",
      },
          },
              "semantics" : ['"(define (_mm_sra_epi16  count.norm a.norm %arg6.norm %arg7.norm %arg5.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg8.norm %arg9.norm %arg10.norm %arg11.norm %arg12.norm )"', '"(define dst.norm"', '"(apply"', '"concat"', '"(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])"', '" (apply"', '" concat"', '" (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])"', '"  (define %lastidx0.norm (-  %arg2.norm  1))"', '"  (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))"', '"  (define %1.norm (extract  %highidx0.norm %arg3.norm count.norm))"', '"  (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))"', '"  (cond"', '"  [(equal? %2.ab0.norm #t)"', '"   (begin"', '"   (define %lastidx1.norm (-  %arg4.norm  1))"', '"   (define %4.norm (+  j0.new.norm  %lastidx1.norm))"', '"   (define %lastidx2.norm (-  %arg8.norm  1))"', '"   (define %highidx1.norm (+  %4.norm  %lastidx2.norm))"', '"   (define %5.norm (extract  %highidx1.norm %4.norm a.norm))"', '"   (define %cond0.norm (bveq  %5.norm  %arg7.norm))"', '"   (define %6.norm (if (equal? %cond0.norm #t) %arg5.norm %arg6.norm))"', '"   %6.norm"', '"   )]"', '"  [else (begin"', '"   (define %lastidx3.norm (-  %arg4.norm  1))"', '"   (define %8.norm (+  j0.new.norm  %lastidx3.norm))"', '"   (define %9.norm (extract  %8.norm j0.new.norm a.norm))"', '"   (define %lastidx4.norm (-  %arg10.norm  1))"', '"   (define %highidx2.norm (+  %lastidx4.norm  %arg11.norm))"', '"   (define %10.norm (extract  %highidx2.norm %arg11.norm count.norm))"', '"   (define %11.ab0.norm (bvsizeext  %9.norm %arg10.norm %arg9.norm))"', '"   (define %12.norm (bvashr  %11.ab0.norm  %10.norm))"', '"   (define %14.norm.high.idx (- %arg10.norm 1))"', '"   (define %14.norm.low.idx (+ (- %14.norm.high.idx %arg4.norm) 1) )"', '"   (define %14.norm (extract  %14.norm.high.idx %14.norm.low.idx %12.norm))"', '"   %14.norm"', '"   )]"', '"  )"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  dst.norm %arg12.norm)"', '")"', '""'], 
        },
          }
