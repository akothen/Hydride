{
    "compute1": {
        "semantics":"\n;; This is the \"spec\".\n(define (compute1 dst a b)\n(define res1 (apply\nconcat\n(for/list ([j (range 2)])\n(define tmp\n(bvmul (ext-bv a (- 1 j) 32) (ext-bv b (- 1 j) 32)))\n(bvadd (ext-bv dst (- 1 j) 32) tmp)\n)\n)\n)\n(define res2 (apply\nconcat\n(for/list ([j (range 2)])\n(define tmp1\n(bvmul (ext-bv a (- 1 j) 32) (ext-bv b (- 1 j) 32)))\ntmp1\n)\n)\n)\n(define final (apply\nconcat\n(for/list ([j (range 4)])\n(define tmp2\n(bvadd (ext-bv res1 (- 3 j) 16) (ext-bv res2 (- 3 j) 16)))\ntmp2\n)\n)\n)\nfinal\n)\n",
        "args" : ["dst", "a", "b"],
        "arg_types": ["BitVectorConst", "BitVectorConst", "BitVectorConst"],
        "input_length": [64, 64, 64],
        "output_precision": [32]
    }
}
