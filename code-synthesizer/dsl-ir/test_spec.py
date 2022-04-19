
spec_sema = [

    "(define (tensor-add v1 v2 row col prec)",
    "(apply concat",
    " (for/list ([i (range row)])",
    "(apply concat",
    "(for/list ([j (range col)])",
    "(define left_offset (+ (* i col ) j))",
    "(define right_offset (- (* row col) left_offset))",
    "(define offset (- right_offset 1))",
    "(bvadd",
    "(extract (+ (* offset prec) (- prec 1)) (* offset prec) v1)",
    "(extract (+ (* offset prec) (- prec 1)) (* offset prec) v2)",
    "    )",
    " ) ",
    ")",
    " )",
    " )",
    " )",
]


specification = {
    "name" : "tensor-add",
    "semantics": spec_sema,
    "input_shapes": [[8,8]],
    "output_shape": [8,8],
    "input_precision": 8,
    "output_precision": 8,
    "args": ["SYMBOLIC_BV_512", "SYMBOLIC_BV_512"],
    "spec_invokation": "(tensor-add {} 8 8 8)",
}
