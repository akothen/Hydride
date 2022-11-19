"""
Specifications for each sub-expression seperately
"""


# ===== add Input =======

add_spec_sema = [
    "(extract bvadd)"
]


add_specification = {
    "name" : "add",
    "semantics": add_spec_sema,
    "input_shapes": [[1,64], [1,64] ],
    "output_shape": [1,64],
    "input_precision": 8,
    "output_precision": 8,
    "args": ["SYMBOLIC_BV_512", "SYMBOLIC_BV_512"],
    "spec_invokation": "(add {})",
}

# ===== X Avg =======


full_specs = [
    add_specification,
]
