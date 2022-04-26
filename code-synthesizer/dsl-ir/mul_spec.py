
spec_sema = [

    "(define (tensor-mul v1 v2 row col input_prec output_prec)",
    "(apply concat",
    " (for/list ([i (range row)])",
    "(apply concat",
    "(for/list ([j (range col)])",
    "(define left_offset (+ (* i col ) j))",
    "(define right_offset (- (* row col) left_offset))",
    "(define offset (- right_offset 1))",
    "(define left-vector (extract (+ (* offset output_prec) (- output_prec 1)) (* offset output_prec) v1) )",
    "(define right-vector (extract (+ (* offset output_prec) (- output_prec 1)) (* offset output_prec) v2) )",
    "(define left-slice (sign-extend (extract (- input_prec 1) 0 left-vector) (bitvector output_prec))  )",
    "(define right-slice (sign-extend (extract (- input_prec 1) 0 right-vector) (bitvector output_prec))  )",
    "(bvmul",
    "left-slice right-slice",
    "    )",
    " ) ",
    ")",
    " )",
    " )",
    " )",
]


specification = {
    "name" : "tensor-mul",
    "semantics": spec_sema,
    "input_shapes": [[8,8]],
    "output_shape": [8,8],
    "input_precision": 64,
    "output_precision": 64,
    "args": ["SYMBOLIC_BV_4096", "SYMBOLIC_BV_4096"],
    "spec_invokation": "(tensor-mul {} 8 8 32 64)",
}
