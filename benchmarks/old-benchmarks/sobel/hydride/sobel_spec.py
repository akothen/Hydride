"""
Specifications for each sub-expression seperately
"""


# ===== SEXT Input =======

sext_spec_sema = [
    "(define (sext input)",
    "(define extend-type (bitvector 16))",
    "(apply concat",
    "(for/list ( [i (reverse (range 8))] )",
    "(sign-extend (ext-bv input i 8) extend-type)",
    ")",
    "",
    ")",
    ")",
    "",
    "",
]


sext_specification = {
    "name" : "sext",
    "semantics": sext_spec_sema,
    "input_shapes": [[1,16] ],
    "output_shape": [1,8],
    "input_precision": 8,
    "output_precision": 16,
    "args": ["SYMBOLIC_BV_128"],
    "spec_invokation": "(sext {})",
}

# ===== X Avg =======

x_avg_spec_sema = [
    "(define (x_avg v1 v2 v3)",
    "(define IP 16)",
    "(define extend-type (bitvector 16))",
    "",
    "(apply concat",
    "(for/list ( [i (reverse (range VF))] )",
    "(bvadd",
    "(ext-bv v1 i IP)",
    "(bvmul (ext-bv v2 i IP)  (bv 2 extend-type))",
    "(ext-bv  v3 i IP)",
    ")",
    ")",
    "",
    ")",
    ")"
]


x_avg_specification = {
    "name" : "x_avg",
    "semantics": x_avg_spec_sema,
    "input_shapes": [[1,8] ,  [1,8] , [1,8] ],
    "output_shape": [1,8],
    "input_precision": 16,
    "output_precision": 16,
    "args": ["SYMBOLIC_BV_128", "SYMBOLIC_BV_128", "SYMBOLIC_BV_128"],
    "spec_invokation": "(x_avg {})",
}


# ===== Y Avg =======

y_avg_spec_sema = [
    "(define (y_avg v1 v2 v3)",
    "(define extend-type (bitvector 16))",
    "(define IP 16)",
    "",
    "(apply concat",
    "(for/list ( [i (reverse (range VF))] )",
    "(bvadd",
    "(ext-bv v1 i IP)",
    "(bvmul (ext-bv v2 i IP) (bv 2 extend-type))",
    "(ext-bv v3 i IP)",
    ")",
    ")",
    "",
    ")",
    ")"
]


y_avg_specification = {
    "name" : "y_avg",
    "semantics": y_avg_spec_sema,
    "input_shapes": [[1,8] ,  [1,8] , [1,8] ],
    "output_shape": [1,8],
    "input_precision": 16,
    "output_precision": 16,
    "args": ["SYMBOLIC_BV_128", "SYMBOLIC_BV_128", "SYMBOLIC_BV_128"],
    "spec_invokation": "(y_avg {})",
}


# ===== Sobel_x  =======

sobel_x_spec_sema = [
    "",
    "(define (sobel_x v1 v2)",
    "",
    "(define IP 16)",
    "",
    "(define (iabs x)",
    "(define integer_abs (abs (bitvector->integer x)))",
    "(integer->bitvector integer_abs (bitvector (bvlength x)))",
    ")",
    "(apply concat",
    "(for/list ( [i (reverse (range VF))] )",
    "(define diff_res",
    "(bvsub",
    "(ext-bv v1 i IP)",
    "(ext-bv v2 i IP)",
    "",
    ")",
    ")",
    "(iabs diff_res)",
    ")",
    "",
    ")",
    ")",
]


sobel_x_specification = {
    "name" : "sobel_x",
    "semantics": sobel_x_spec_sema,
    "input_shapes": [[1,8] ,  [1,8] ],
    "output_shape": [1,8],
    "input_precision": 16,
    "output_precision": 16,
    "args": ["SYMBOLIC_BV_128", "SYMBOLIC_BV_128"],
    "spec_invokation": "(sobel_x {})",
}



# ===== Sobel_y  =======


sobel_y_spec_sema = [
    "",
    "(define (sobel_x v1 v2)",
    "",
    "(define IP 16)",
    "",
    "(define (iabs x)",
    "(define integer_abs (abs (bitvector->integer x)))",
    "(integer->bitvector integer_abs (bitvector (bvlength x)))",
    ")",
    "(apply concat",
    "(for/list ( [i (reverse (range VF))] )",
    "(define diff_res",
    "(bvsub",
    "(ext-bv v1 i IP)",
    "(ext-bv v2 i IP)",
    "",
    ")",
    ")",
    "(iabs diff_res)",
    ")",
    "",
    ")",
    ")",
]

sobel_y_specification = {
    "name" : "sobel_y",
    "semantics": sobel_y_spec_sema,
    "input_shapes": [[1,8] ,  [1,8] ],
    "output_shape": [1,8],
    "input_precision": 16,
    "output_precision": 16,
    "args": ["SYMBOLIC_BV_128", "SYMBOLIC_BV_128"],
    "spec_invokation": "(sobel_y {})",
}




# ===== add output  =======

add_output_spec_sema = [
    "(define (add_output v1 v2)",
    "  (apply concat",
    "         (for/list ( [i (reverse (range VF))] )",
    "",
    "          (define add_res (bvadd",
    "                            (ext-bv v1 i 16)",
    "                            (ext-bv v2 i 16)",
    "                            )",
    "            )",
    "          add_res",
    "                   ))",
    "  )"
]


add_output_specification = {
    "name" : "add_output",
    "semantics": add_output_spec_sema,
    "input_shapes": [[1,8] ,  [1,8] ],
    "output_shape": [1,8],
    "input_precision": 16,
    "output_precision": 16,
    "args": ["SYMBOLIC_BV_128", "SYMBOLIC_BV_128"],
    "spec_invokation": "(add_output {})",
}


# ===== clamp   =======

clamp_spec_sema = [
    "(define (clamp v1)",
    "  (define (clamp_res val low high)",
    "   (define clamp_low (bvsmax val low))",
    "  (define clamp_high (bvsmin clamp_low high))",
    "    clamp_high",
    "    )",
    "  (apply concat ",
    "         (for/list ( [i (reverse (range VF))] )",
    "          (define vi (ext-bv v1 i 16))",
    "          (clamp_res vi (bv 0 16) (bv 255 16)) ;; Clamp the value between 0 and 255",
    "                   ))",
    "  )",
]


clamp_specification = {
    "name" : "clamp",
    "semantics": clamp_spec_sema,
    "input_shapes": [  [1,8] ],
    "output_shape": [1,8],
    "input_precision": 16,
    "output_precision": 16,
    "args": [ "SYMBOLIC_BV_128"],
    "spec_invokation": "(clamp {})",
}


full_specs = [
    sext_specification,
    x_avg_specification,
    y_avg_specification,
    sobel_x_specification,
    sobel_y_specification,
    add_output_specification,
    clamp_specification,
]
