"""
Specifications for each sub-expression seperately
"""


# ===== complex Input =======

complex_spec_sema = [
    "(extract sign-extend bvmul bvadd)"
]


complex_specification = {
    "name" : "complex",
    "semantics": complex_spec_sema,
    "input_shapes": [[1,32], [1,32], [1,32]],
    "output_shape": [1,32],
    "input_precision": 16,
    "output_precision": 16,
    "args": ["SYMBOLIC_BV_512", "SYMBOLIC_BV_512", "SYMBOLIC_BV_512", "SYMBOLIC_BV_512"],
    "spec_invokation": "(complex {})",
}



full_specs = [
    complex_specification,
]
