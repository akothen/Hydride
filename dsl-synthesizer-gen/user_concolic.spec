{
    "compute": {
        "semantics": "\n;; This is the \"spec\".\n(define (compute dst a b)\n(apply\nconcat\n(for/list ([j (range 4)])\n(define tmp\n(bvmul (ext-bv a (- 3 j) 32) (ext-bv b (- 3 j) 32)))\n(bvadd (ext-bv dst (- 3 j) 32) tmp)\n)\n)\n)\n",
        "args" : ["dst", "a", "b"],
        "arg_types": ["BitVectorConst", "BitVectorConst", "BitVectorSymbolic"],
        "input_precision": [128, 128, 128]
    }
}
