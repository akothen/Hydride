
spec_sema = [

    "(define (tensor-add v1 v2 row col prec)",
    "(apply concat",
    " (for/list ([i (range row)])",
    "(apply concat",
    "(for/list ([j (range col)])",
    "       (define offset (+ (* i col ) j))",
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
    "input_shape": [4,4],
    "output_shape": [4,4],
    "input_precision": 8,
    "output_precision": 8,
    "args": ["SYMBOLIC_BV_128", "SYMBOLIC_BV_128"],
    "spec_invokation": "(tensor-add {} 4 4 8)",
}
