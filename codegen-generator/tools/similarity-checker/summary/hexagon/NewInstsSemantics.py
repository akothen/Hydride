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

          "hexagon_V6_vaslh_acc_128B" : {
            "target_instructions" : {
              "hexagon_V6_vaslh_acc_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vaslh_acc_128B  Vx Vu Rt )"', '"(define %dst0"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 16))])"', '"  (define %1 (+  i.new  15))"', '"  (define %2 (extract  %1 i.new Vx))"', '"  (define %5 (extract  %1 i.new Vu))"', '"  (define %6 (bvand  Rt  (bv 15 32)))"', '"  (define %7.ab0 (bvsizeext  %5 32 1))"', '"  (define %8 (bvshl  %7.ab0  %6))"', '"  (define %9.ab0 (bvsizeext  %2 32 1))"', '"  (define %10.ab0 (bvaddnw %9.ab0 %8 32 -1 ))"', '"  (define %13.high.idx 31 )"', '"  (define %13.low.idx (+ (- %13.high.idx 16) 1) )"', '"  (define %13 (extract  %13.high.idx %13.low.idx %10.ab0))"', '"  %13"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  %dst0 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vroundwuh_128B" : {
            "target_instructions" : {
              "hexagon_V6_vroundwuh_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","0","0"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vrounduwuh_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","0","0"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vroundwh_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","1","1"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vroundwuh_128B  Vu Vv %arg1 %arg6 )"', '"(define Vd"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1024 1024))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 16))])"', '"  (define %0.new0 (*  i.new  2))"', '"  (define %1 (+  %0.new0  31))"', '"  (define %2 (extract  %1 %0.new0 Vv))"', '"  (define %3.ab0 (bvaddnw %2 (bv 32768 32) 32 -1 ))"', '"  (define %4 (bvlshr  %3.ab0  (bv 16 32)))"', '"  (define %5.ab0 (bvsaturate  %4 32 16 %arg6))"', '"  (define %12 (extract  %1 %0.new0 Vu))"', '"  (define %13.ab0 (bvaddnw %12 (bv 32768 32) 32 -1 ))"', '"  (define %14 (bvlshr  %13.ab0  (bv 16 32)))"', '"  (define %15.ab0 (bvsaturate  %14 32 16 %arg1))"', '"(concat %15.ab0 %5.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  Vd 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasruwuhrndsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasruwuhrndsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32","0","0"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,2,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vasrwhrndsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32","1","1"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,2,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vasrwuhrndsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32","0","0"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,2,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasruwuhrndsat_128B  Vu Vv Rt %arg1 %arg4 )"', '"(define Vd"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1024 1024))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 16))])"', '"  (define %0 (bvand  Rt  (bv 15 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  31))"', '"  (define %3 (extract  %2 %1.new0 Vv))"', '"  (define %4.ab0 (bvsubnw %0 (bv 1 32) 32 -1 ))"', '"  (define %5 (bvshl  (bv 1 32)  %4.ab0))"', '"  (define %6.ab0 (bvaddnw %3 %5 32 -1 ))"', '"  (define %7 (bvashr  %6.ab0  %0))"', '"  (define %8.ab0 (bvsaturate  %7 32 16 %arg4))"', '"  (define %15 (extract  %2 %1.new0 Vu))"', '"  (define %18.ab0 (bvaddnw %15 %5 32 -1 ))"', '"  (define %19 (bvashr  %18.ab0  %0))"', '"  (define %20.ab0 (bvsaturate  %19 32 16 %arg1))"', '"(concat %20.ab0 %8.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  Vd 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vaslw_128B" : {
            "target_instructions" : {
              "hexagon_V6_vaslw_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vaslw_128B  VuV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 32))])"', '"  (define %1 (+  i.new  31))"', '"  (define %2 (extract  %1 i.new VuV))"', '"  (define %3 (bvand  RtV  (bv 31 32)))"', '"  (define %4 (bvshl  %2  %3))"', '"  %4"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrwhsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrwhsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrwhsat_128B  VuV VvV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 16))])"', '"  (define %0 (bvand  RtV  (bv 15 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  31))"', '"  (define %3 (extract  %2 %1.new0 VvV))"', '"  (define %4 (bvashr  %3  %0))"', '"  (define %5.ab0 (bvsaturate  %4 32 16 1))"', '"  (define %12 (extract  %2 %1.new0 VuV))"', '"  (define %13 (bvashr  %12  %0))"', '"  (define %14.ab0 (bvsaturate  %13 32 16 1))"', '"(concat %14.ab0 %5.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrwuhsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrwuhsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrwuhsat_128B  VuV VvV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 16))])"', '"  (define %0 (bvand  RtV  (bv 15 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  31))"', '"  (define %3 (extract  %2 %1.new0 VvV))"', '"  (define %4 (bvashr  %3  %0))"', '"  (define %5.ab0 (bvsaturate  %4 32 16 0))"', '"  (define %12 (extract  %2 %1.new0 VuV))"', '"  (define %13 (bvashr  %12  %0))"', '"  (define %14.ab0 (bvsaturate  %13 32 16 0))"', '"(concat %14.ab0 %5.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrhbsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrhbsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrhbsat_128B  VuV VvV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 8))])"', '"  (define %0 (bvand  RtV  (bv 7 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  15))"', '"  (define %3 (extract  %2 %1.new0 VvV))"', '"  (define %4.ab0 (bvsizeext  %3 32 1))"', '"  (define %5 (bvashr  %4.ab0  %0))"', '"  (define %6.ab0 (bvsaturate  %5 32 8 1))"', '"  (define %13 (extract  %2 %1.new0 VuV))"', '"  (define %14.ab0 (bvsizeext  %13 32 1))"', '"  (define %15 (bvashr  %14.ab0  %0))"', '"  (define %16.ab0 (bvsaturate  %15 32 8 1))"', '"(concat %16.ab0 %6.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vaslw_acc_128B" : {
            "target_instructions" : {
              "hexagon_V6_vaslw_acc_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vaslw_acc_128B  Vx Vu Rt )"', '"(define %dst0"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 32))])"', '"  (define %1 (+  i.new  31))"', '"  (define %2 (extract  %1 i.new Vx))"', '"  (define %5 (extract  %1 i.new Vu))"', '"  (define %6 (bvand  Rt  (bv 31 32)))"', '"  (define %7 (bvshl  %5  %6))"', '"  (define %8.ab0 (bvaddnw %2 %7 32 -1 ))"', '"  %8.ab0"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  %dst0 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasruwuhsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasruwuhsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasruwuhsat_128B  VuV VvV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 16))])"', '"  (define %0 (bvand  RtV  (bv 15 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  31))"', '"  (define %3 (extract  %2 %1.new0 VvV))"', '"  (define %4 (bvashr  %3  %0))"', '"  (define %5.ab0 (bvsaturate  %4 32 16 0))"', '"  (define %12 (extract  %2 %1.new0 VuV))"', '"  (define %13 (bvashr  %12  %0))"', '"  (define %14.ab0 (bvsaturate  %13 32 16 0))"', '"(concat %14.ab0 %5.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vroundhb_128B" : {
            "target_instructions" : {
              "hexagon_V6_vroundhb_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","1","1"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vroundhub_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","0","0"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vrounduhub_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","0","0"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vroundhb_128B  Vu Vv %arg1 %arg6 )"', '"(define Vd"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1024 1024))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 8))])"', '"  (define %0.new0 (*  i.new  2))"', '"  (define %1 (+  %0.new0  15))"', '"  (define %2 (extract  %1 %0.new0 Vv))"', '"  (define %3.ab0 (bvaddnw %2 (bv 128 16) 16 -1 ))"', '"  (define %4 (bvlshr  %3.ab0  (bv 8 16)))"', '"  (define %5.ab0 (bvsaturate  %4 16 8 %arg6))"', '"  (define %12 (extract  %1 %0.new0 Vu))"', '"  (define %13.ab0 (bvaddnw %12 (bv 128 16) 16 -1 ))"', '"  (define %14 (bvlshr  %13.ab0  (bv 8 16)))"', '"  (define %15.ab0 (bvsaturate  %14 16 8 %arg1))"', '"(concat %15.ab0 %5.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  Vd 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrwh_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrwh_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrwh_128B  VuV VvV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 16))])"', '"  (define %0 (bvand  RtV  (bv 15 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  31))"', '"  (define %3 (extract  %2 %1.new0 VvV))"', '"  (define %4 (bvashr  %3  %0))"', '"  (define %9.high.idx 31 )"', '"  (define %9.low.idx (+ (- %9.high.idx 16) 1) )"', '"  (define %9 (extract  %9.high.idx %9.low.idx %4))"', '"  (define %12 (extract  %2 %1.new0 VuV))"', '"  (define %13 (bvashr  %12  %0))"', '"  (define %18.high.idx 31 )"', '"  (define %18.low.idx (+ (- %18.high.idx 16) 1) )"', '"  (define %18 (extract  %18.high.idx %18.low.idx %13))"', '"(concat %18 %9)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vlsrh_128B" : {
            "target_instructions" : {
              "hexagon_V6_vlsrh_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vlsrh_128B  VuV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 16))])"', '"  (define %1 (+  i.new  15))"', '"  (define %2 (extract  %1 i.new VuV))"', '"  (define %3 (bvand  RtV  (bv 15 32)))"', '"  (define %4.ab0 (bvsizeext  %2 32 0))"', '"  (define %5 (bvlshr  %4.ab0  %3))"', '"  (define %8.high.idx 31 )"', '"  (define %8.low.idx (+ (- %8.high.idx 16) 1) )"', '"  (define %8 (extract  %8.high.idx %8.low.idx %5))"', '"  %8"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrhubrndsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrhubrndsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32","0","1","0","1"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,2,-1,-1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vasrhbrndsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32","1","1","1","1"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,2,-1,-1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vasruhubrndsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32","0","0","0","0"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,2,-1,-1,-1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrhubrndsat_128B  Vu Vv Rt %arg1 %arg3 %arg6 %arg8 )"', '"(define Vd"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1024 1024))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 8))])"', '"  (define %0 (bvand  Rt  (bv 7 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  15))"', '"  (define %3 (extract  %2 %1.new0 Vv))"', '"  (define %4.ab0 (bvsubnw %0 (bv 1 32) 32 -1 ))"', '"  (define %5 (bvshl  (bv 1 32)  %4.ab0))"', '"  (define %6.ab0 (bvsizeext  %3 32 %arg8))"', '"  (define %7.ab0 (bvaddnw %6.ab0 %5 32 -1 ))"', '"  (define %8 (bvashr  %7.ab0  %0))"', '"  (define %9.ab0 (bvsaturate  %8 32 8 %arg6))"', '"  (define %16 (extract  %2 %1.new0 Vu))"', '"  (define %19.ab0 (bvsizeext  %16 32 %arg3))"', '"  (define %20.ab0 (bvaddnw %19.ab0 %5 32 -1 ))"', '"  (define %21 (bvashr  %20.ab0  %0))"', '"  (define %22.ab0 (bvsaturate  %21 32 8 %arg1))"', '"(concat %22.ab0 %9.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  Vd 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrh_acc_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrh_acc_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrh_acc_128B  Vx Vu Rt )"', '"(define %dst0"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 16))])"', '"  (define %1 (+  i.new  15))"', '"  (define %2 (extract  %1 i.new Vx))"', '"  (define %5 (extract  %1 i.new Vu))"', '"  (define %6 (bvand  Rt  (bv 15 32)))"', '"  (define %7.ab0 (bvsizeext  %5 32 1))"', '"  (define %8 (bvashr  %7.ab0  %6))"', '"  (define %9.ab0 (bvsizeext  %2 32 1))"', '"  (define %10.ab0 (bvaddnw %9.ab0 %8 32 -1 ))"', '"  (define %13.high.idx 31 )"', '"  (define %13.low.idx (+ (- %13.high.idx 16) 1) )"', '"  (define %13 (extract  %13.high.idx %13.low.idx %10.ab0))"', '"  %13"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  %dst0 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vlsrb_128B" : {
            "target_instructions" : {
              "hexagon_V6_vlsrb_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 8,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vlsrb_128B  VuV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 8))])"', '"  (define %1 (+  i.new  7))"', '"  (define %2 (extract  %1 i.new VuV))"', '"  (define %3 (bvand  RtV  (bv 7 32)))"', '"  (define %4.ab0 (bvsizeext  %2 32 0))"', '"  (define %5 (bvlshr  %4.ab0  %3))"', '"  (define %8.high.idx 31 )"', '"  (define %8.low.idx (+ (- %8.high.idx 8) 1) )"', '"  (define %8 (extract  %8.high.idx %8.low.idx %5))"', '"  %8"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrhubsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrhubsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrhubsat_128B  VuV VvV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 8))])"', '"  (define %0 (bvand  RtV  (bv 7 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  15))"', '"  (define %3 (extract  %2 %1.new0 VvV))"', '"  (define %4.ab0 (bvsizeext  %3 32 1))"', '"  (define %5 (bvashr  %4.ab0  %0))"', '"  (define %6.ab0 (bvsaturate  %5 32 8 0))"', '"  (define %13 (extract  %2 %1.new0 VuV))"', '"  (define %14.ab0 (bvsizeext  %13 32 1))"', '"  (define %15 (bvashr  %14.ab0  %0))"', '"  (define %16.ab0 (bvsaturate  %15 32 8 0))"', '"(concat %16.ab0 %6.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vlsrw_128B" : {
            "target_instructions" : {
              "hexagon_V6_vlsrw_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vlsrw_128B  VuV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 32))])"', '"  (define %1 (+  i.new  31))"', '"  (define %2 (extract  %1 i.new VuV))"', '"  (define %3 (bvand  RtV  (bv 31 32)))"', '"  (define %4 (bvlshr  %2  %3))"', '"  %4"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrw_acc_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrw_acc_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrw_acc_128B  Vx Vu Rt )"', '"(define %dst0"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 32))])"', '"  (define %1 (+  i.new  31))"', '"  (define %2 (extract  %1 i.new Vx))"', '"  (define %5 (extract  %1 i.new Vu))"', '"  (define %6 (bvand  Rt  (bv 31 32)))"', '"  (define %7 (bvashr  %5  %6))"', '"  (define %8.ab0 (bvaddnw %2 %7 32 -1 ))"', '"  %8.ab0"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  %dst0 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vaslh_128B" : {
            "target_instructions" : {
              "hexagon_V6_vaslh_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vaslh_128B  VuV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 1024 16))])"', '"  (define %1 (+  i.new  15))"', '"  (define %2 (extract  %1 i.new VuV))"', '"  (define %3 (bvand  RtV  (bv 15 32)))"', '"  (define %4.ab0 (bvsizeext  %2 32 1))"', '"  (define %5 (bvshl  %4.ab0  %3))"', '"  (define %8.high.idx 31 )"', '"  (define %8.low.idx (+ (- %8.high.idx 16) 1) )"', '"  (define %8 (extract  %8.high.idx %8.low.idx %5))"', '"  %8"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vmpyewuh_64_128B" : {
            "target_instructions" : {
              "hexagon_V6_vmpyewuh_64_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 2048,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vmpyewuh_64_128B  Vu Vv )"', '"(define Vdd"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (concat "', '"  (apply"', '"  concat"', '"  (for/list ([%iterator1.new (reverse (range 0 512 16))])"', '"   (define %18.new0 (*  %iterator1.new  2))"', '"   (define %19 (+  %18.new0  31))"', '"   (define %20 (extract  %19 %18.new0 Vu))"', '"   (define %24 (+  %18.new0  15))"', '"   (define %25 (extract  %24 %18.new0 Vv))"', '"   (define %27.ab0 (bvsizeext  %20 64 1))"', '"   (define %28.ab0 (bvsizeext  %25 64 1))"', '"   (define %29 (bvmul  %27.ab0  %28.ab0))"', '"   (define %30 (bvlshr  %29  (bv 16 64)))"', '"   (define %35.high.idx 63 )"', '"   (define %35.low.idx (+ (- %35.high.idx 32) 1) )"', '"   (define %35 (extract  %35.high.idx %35.low.idx %30))"', '"   %35"', '"  )"', '"  )"', '"  (apply"', '"  concat"', '"  (for/list ([%iterator0.new (reverse (range 0 512 16))])"', '"   (define %0.new0 (*  %iterator0.new  2))"', '"   (define %1 (+  %0.new0  31))"', '"   (define %2 (extract  %1 %0.new0 Vu))"', '"   (define %6 (+  %0.new0  15))"', '"   (define %7 (extract  %6 %0.new0 Vv))"', '"   (define %9.ab0 (bvsizeext  %2 64 1))"', '"   (define %10.ab0 (bvsizeext  %7 64 1))"', '"   (define %11 (bvmul  %9.ab0  %10.ab0))"', '"   (define %12 (bvshl  %11  (bv 16 64)))"', '"   (define %17.high.idx 63 )"', '"   (define %17.low.idx (+ (- %17.high.idx 32) 1) )"', '"   (define %17 (extract  %17.high.idx %17.low.idx %12))"', '"   %17"', '"  )"', '"  )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  Vdd 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasruhubsat_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasruhubsat_128B" : {
                  "args" : ["SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","SYMBOLIC_BV_32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 8,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : None,
                  "out_precision_index" : None,
                  "arg_permute_map" : [0,1,-1],
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasruhubsat_128B  VuV VvV RtV )"', '"(define VdV"', '"(apply"', '"concat"', '"(for/list ([%outer.it (reverse (range 0 1 1))])"', '" (apply"', '" concat"', '" (for/list ([i.new (reverse (range 0 512 8))])"', '"  (define %0 (bvand  RtV  (bv 7 32)))"', '"  (define %1.new0 (*  i.new  2))"', '"  (define %2 (+  %1.new0  15))"', '"  (define %3 (extract  %2 %1.new0 VvV))"', '"  (define %4.ab0 (bvsizeext  %3 32 0))"', '"  (define %5 (bvashr  %4.ab0  %0))"', '"  (define %6.ab0 (bvsaturate  %5 32 8 0))"', '"  (define %13 (extract  %2 %1.new0 VuV))"', '"  (define %14.ab0 (bvsizeext  %13 32 0))"', '"  (define %15 (bvashr  %14.ab0  %0))"', '"  (define %16.ab0 (bvsaturate  %15 32 8 0))"', '"(concat %16.ab0 %6.ab0)"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV 0)"', '")"', '""'], 
      },
        }