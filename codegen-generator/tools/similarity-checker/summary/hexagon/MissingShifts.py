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

          "hexagon_V6_vaslhv_128B" : {
            "target_instructions" : {
              "hexagon_V6_vaslhv_128B" : {
                  "args" : ["(bv #x0000000000000000 16)","SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","16"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : 3,
                  "out_precision_index" : 3,
                  "arg_permute_map" : [-1,1,0,-1],
                  "Signedness" : 1,
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vaslwv_128B" : {
                  "args" : ["(bv #x00000000000000000000000000000000 32)","SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : 3,
                  "out_precision_index" : 3,
                  "arg_permute_map" : [-1,1,0,-1],
                  "Signedness" : 1,
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vaslhv_128B  %arg0.norm VvV.norm VuV.norm %elemsize0.norm )"', '"(define VdV.norm"', '"(apply"', '"concat"', '"(for/list ([%outer.it.norm (reverse (range 0 1024 1024))])"', '" (apply"', '" concat"', '" (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])"', '"  (define %lastidx0.norm (-  %elemsize0.norm  1))"', '"  (define %1.norm (+  i.new.norm  %lastidx0.norm))"', '"  (define %2.norm (extract  %1.norm i.new.norm VvV.norm))"', '"  (define %3.norm (bvsgt  %2.norm  %arg0.norm))"', '"  (define %6.norm (extract  %1.norm i.new.norm VuV.norm))"', '"  (define %10.norm (bvshl  %6.norm  %2.norm))"', '"  (define %17.norm (bvashr  %6.norm  %2.norm))"', '"  (define %18.norm (if (equal? %3.norm #t) %10.norm %17.norm))"', '"  %18.norm"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV.norm 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vlsrwv_128B" : {
            "target_instructions" : {
              "hexagon_V6_vlsrwv_128B" : {
                  "args" : ["(bv #x00000000000000000000000000000000 32)","SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : 3,
                  "out_precision_index" : 3,
                  "arg_permute_map" : [-1,1,0,-1],
                  "Signedness" : 1,
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vlsrhv_128B" : {
                  "args" : ["(bv #x0000000000000000 16)","SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","16"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : 3,
                  "out_precision_index" : 3,
                  "arg_permute_map" : [-1,1,0,-1],
                  "Signedness" : 1,
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vlsrwv_128B  %arg0.norm VvV.norm VuV.norm %elemsize0.norm )"', '"(define VdV.norm"', '"(apply"', '"concat"', '"(for/list ([%outer.it.norm (reverse (range 0 1024 1024))])"', '" (apply"', '" concat"', '" (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])"', '"  (define %lastidx0.norm (-  %elemsize0.norm  1))"', '"  (define %1.norm (+  i.new.norm  %lastidx0.norm))"', '"  (define %2.norm (extract  %1.norm i.new.norm VvV.norm))"', '"  (define %3.norm (bvsgt  %2.norm  %arg0.norm))"', '"  (define %6.norm (extract  %1.norm i.new.norm VuV.norm))"', '"  (define %10.norm (bvlshr  %6.norm  %2.norm))"', '"  (define %17.norm (bvshl  %6.norm  %2.norm))"', '"  (define %18.norm (if (equal? %3.norm #t) %10.norm %17.norm))"', '"  %18.norm"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV.norm 0)"', '")"', '""'], 
      },
        
          "hexagon_V6_vasrwv_128B" : {
            "target_instructions" : {
              "hexagon_V6_vasrwv_128B" : {
                  "args" : ["(bv #x00000000000000000000000000000000 32)","SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","32"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 32,
                  "out_precision" : 32,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : 3,
                  "out_precision_index" : 3,
                  "arg_permute_map" : [-1,1,0,-1],
                  "Signedness" : 1,
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        
              "hexagon_V6_vasrhv_128B" : {
                  "args" : ["(bv #x0000000000000000 16)","SYMBOLIC_BV_1024","SYMBOLIC_BV_1024","16"],
                  "in_vectsize" : 1024,
                  "out_vectsize" : 1024,
                  "lanesize" : 1024,
                  "in_precision" : 16,
                  "out_precision" : 16,
                  "in_vectsize_index" : None,
                  "out_vectsize_index" : None,
                  "lanesize_index" : None,
                  "in_precision_index" : 3,
                  "out_precision_index" : 3,
                  "arg_permute_map" : [-1,1,0,-1],
                  "Signedness" : 1,
                  "Cost" : "None",
                  "SIMD" : "True",
      },
        },
            "semantics" : ['"(define (hexagon_V6_vasrwv_128B  %arg0.norm VvV.norm VuV.norm %elemsize0.norm )"', '"(define VdV.norm"', '"(apply"', '"concat"', '"(for/list ([%outer.it.norm (reverse (range 0 1024 1024))])"', '" (apply"', '" concat"', '" (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])"', '"  (define %lastidx0.norm (-  %elemsize0.norm  1))"', '"  (define %1.norm (+  i.new.norm  %lastidx0.norm))"', '"  (define %2.norm (extract  %1.norm i.new.norm VvV.norm))"', '"  (define %3.norm (bvsgt  %2.norm  %arg0.norm))"', '"  (define %6.norm (extract  %1.norm i.new.norm VuV.norm))"', '"  (define %10.norm (bvashr  %6.norm  %2.norm))"', '"  (define %17.norm (bvshl  %6.norm  %2.norm))"', '"  (define %18.norm (if (equal? %3.norm #t) %10.norm %17.norm))"', '"  %18.norm"', '" )"', '" )"', '")"', '")"', '")"', '"(bvpadhighbits  VdV.norm 0)"', '")"', '""'], 
      },
        }
