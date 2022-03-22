; (define (synth_check arg0 idx-i idx-j )
(vector-div 
(dsl_inst_1 
(vector-div 
(dsl_inst_0 
(bv #x00000000 32)
(vector-two-input-swizzle 
(vector-two-input-swizzle 
(vector-load 
arg0
288
(* ; idx-mul
(+ ; idx-add
idx-i ; idx-i
0
)
6
)
6
8
)
(bv #x000000000000 48)
6
8
idx-j ; idx-j
6
3
1
0
)
(vector-two-input-swizzle 
(vector-load 
arg0
288
(* ; idx-mul
(+ ; idx-add
idx-i ; idx-i
1
)
6
)
6
8
)
(vector-load 
arg0
288
(* ; idx-mul
(+ ; idx-add
idx-i ; idx-i
2
)
6
)
6
8
)
6
8
idx-j ; idx-j
6
3
1
0
)
6
8
0
6
6
1
0
)
(bv #x010101010101010101010101 96)
4
3
8
8
)
(bv #x03030303 32)
4
8
)
4
8
)
(bv #x03 8)
1
8
)

; )