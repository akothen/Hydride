# RTFM: https://docs.racket-lang.org/rosette-guide/sec_bitvectors.html#%28def._%28%28lib._rosette%2Fbase%2Fbase..rkt%29._sign-extend%29%29

x86_sema = {

  "_mm512_dpwssd_epi32" : {
    "name" : "_mm512_dpwssd_epi32",
    "args" : "vreg-acc, vreg1, vreg2",
    "bitwidth" : "512",
    "input_precision" : "16",
    "output_precision" : "32",
    "semantics" : "{   \n \
                (define (_mm512_dpwssd_epi32 vreg-acc vreg1 vreg2) \n \
                  (apply \n \
                  concat  \n \
                  (for/list ([i (reverse (range 16))])  \n \
                    (define sum  \n \
                      (apply   \n \
                        bvadd   \n \
                        (for/list ([j (reverse (range 2))])  \n  \
                          (bvmul (sign-ext-bv vreg1 (+ j (* i 2)) 16 32) (sign-ext-bv vreg2 (+ j (* i 2)) 16 32))))) \n \
                    (bvadd (ext-bv vreg-acc i 32) sum))))  \n \
              }",
  },

  "_mm_dpwssds_epi32" : {
  "name" : "_mm_dpwssds_epi32",
  "args" : "vreg-acc, vreg1, vreg2",
  "bitwidth" : "128",
  "input_precision" : "16",
  "output_precision" : "32",
  "semantics" : "{   \n \
              (define (_mm_dpwssds_epi32 vreg-acc vreg1 vreg2) \n \
                (apply \n \
                concat \n \
                (for/list ([i (reverse (range 4))]) \n \
                  (define sum  \n \
                    (apply  \n  \
                      bvadd \n  \
                      (for/list ([j (reverse (range 2))]) \n  \
                        (bvmul (sign-ext-bv vreg1 (+ j (* i 2)) 16 32) (sign-ext-bv vreg2 (+ j (* i 2)) 16 32))))) \n \
                  (bvadd (ext-bv vreg-acc i 32) sum)))) \n  \
            }",
  },

  "_mm256_dpwssd_epi32" : {
    "name" : "_mm256_dpwssd_epi32",
    "args" : "vreg-acc, vreg1, vreg2",
    "bitwidth" : "256",
    "input_precision" : "16",
    "output_precision" : "32",
    "semantics" : "{   \n \
               (define (_mm256_dpwssd_epi32 vreg-acc vreg1 vreg2) \n \
                (apply  \n \
                concat  \n \
                (for/list ([i (reverse (range 8))])  \n \
                  (define sum  \n \
                    (apply  \n \
                      bvadd   \n \
                      (for/list ([j (reverse (range 2))])  \n \
                        (bvmul (sign-ext-bv vreg1 (+ j (* i 2)) 16 32) (sign-ext-bv vreg2 (+ j (* i 2)) 16 32)))))  \n \
                  (bvadd (ext-bv vreg-acc i 32) sum))))  \n \
              }",
  },


  "_mm512_dpbusd_epi32" : {
    "name" : "_mm512_dpbusd_epi32",
    "args" : "vreg-acc, vreg1, vreg2",
    "bitwidth" : "512",
    "input_precision" : "8",
    "output_precision" : "16",
    "semantics" : "{   \n \
               (define (_mm512_dpbusd_epi32 vreg-acc vreg1 vreg2)  \n \
                (apply  \n \
                concat   \n \
                (for/list ([i (reverse (range 16))])  \n \
                  (define sum   \n \
                    (apply   \n \
                      bvadd  \n \
                      (for/list ([j (reverse (range 4))])  \n \
                        (bvmul (zero-ext-bv vreg1 (+ j (* i 4)) 8 16) (sign-ext-bv vreg2 (+ j (* i 4)) 8 16)))))  \n \
                  (bvadd (ext-bv vreg-acc i 32) (sign-extend sum (bitvector 32))))))  \n \
              }",
  },


  "_mm256_dpbusd_epi32" : {
    "name" : "_mm256_dpbusd_epi32",
    "args" : "vreg-acc, vreg1, vreg2",
    "bitwidth" : "256",
    "input_precision" : "8",
    "output_precision" : "16",
    "semantics" : "{   \n \
               (define (_mm256_dpbusd_epi32 vreg-acc vreg1 vreg2 len red)  \n \
                (apply  \n \
                concat  \n \
                (for/list ([i (reverse (range 8))s])  \n \
                  (define sum   \n \
                    (apply  \n \
                      bvadd   \n \
                      (for/list ([j (reverse (range 4))])  \n \
                        (bvmul (zero-ext-bv vreg1 (+ j (* i 4)) 8 16) (sign-ext-bv vreg2 (+ j (* i 4)) 8 16)))))   \n \
                  (bvadd (ext-bv vreg-acc i 32) (sign-extend sum (bitvector 32))))))  \n \
              }",
  },


  "_mm256_mul_epi32" : {
    "name" : "_mm256_mul_epi32",
    "args" : "vreg1, vreg2",
    "bitwidth" : "256",
    "input_precision" : "32",
    "output_precision" : "64",
    "semantics" : "{   \n \
               (define (_mm256_mul_epi32 vreg1 vreg2) \n \
                (define result \n \
                  (apply  \n \
                  concat   \n \
                  (for/list ([i (reverse (range 4))])  \n \
                    (define tmp  \n \
                      (bvmul (sign-low-ext-bv vreg1 i 32 64 64) (sign-low-ext-bv vreg2 i 32 64 64)))  \n \
                    tmp)))  \n \
                result)  \n \
              }",
  },


  "_mm256_mul_epu32" : {
  "name" : "_mm256_mul_epu32",
  "args" : "vreg1, vreg2",
  "bitwidth" : "256",
  "input_precision" : "32",
  "output_precision" : "64",
  "semantics" : "{   \n \
              (define (_mm256_mul_epu32 vreg1 vreg2)  \n \
                (define result  \n \
                  (apply  \n \
                  concat  \n \
                  (for/list ([i (reverse (range 4))])  \n \
                    (define tmp  \n \
                      (bvmul (low-ext-bv vreg1 i 32 64) (low-ext-bv vreg2 i 32 64)))  \n \
                    (sign-ext-bv tmp 0 32 64))))  \n \
                result)   \n \
            }",
  },

  "_mm512_mul_epu32" : {
  "name" : "_mm512_mul_epu32",
  "args" : "vreg1, vreg2",
  "bitwidth" : "512",
  "input_precision" : "32",
  "output_precision" : "64",
  "semantics" : "{   \n \
              (define (_mm512_mul_epu32 vreg1 vreg2)  \n \
                (define result  \n \
                  (apply  \n \
                  concat  \n \
                  (for/list ([i (reverse (range 8))])  \n \
                    (define tmp  \n \
                      (bvmul (low-ext-bv vreg1 i 32 64) (low-ext-bv vreg2 i 32 64)))  \n \
                    (sign-ext-bv tmp 0 32 64))))  \n \
                result)   \n \
            }",
  },

  "_mm512_mul_epu32" : {
  "name" : "_mm512_mul_epu32",
  "args" : "vreg1, vreg2",
  "bitwidth" : "512",
  "input_precision" : "32",
  "output_precision" : "64",
  "semantics" : "{   \n \
              (define (_mm512_mul_epu32 vreg1 vreg2)  \n \
                (define result  \n \
                  (apply  \n \
                  concat  \n \
                  (for/list ([i (reverse (range 8))])  \n \
                    (define tmp  \n \
                      (bvmul (low-ext-bv vreg1 (i) 32 64) (low-ext-bv vreg2 (i) 32 64)))  \n \
                    (sign-ext-bv tmp 0 32 64))))  \n \
                result)   \n \
            }",
    },

  "_mm_mul_epu32" : {
  "name" : "_mm_mul_epu32",
  "args" : "vreg1, vreg2",
  "bitwidth" : "128",
  "input_precision" : "32",
  "output_precision" : "64",
  "semantics" : "{   \n \
              (define (_mm_mul_epu32 vreg1 vreg2)  \n \
                (define result  \n \
                  (apply  \n \
                  concat  \n \
                  (for/list ([i (reverse (range 1))])  \n \
                    (define tmp  \n \
                      (bvmul (low-ext-bv vreg1 (i) 32 64) (low-ext-bv vreg2 (i) 32 64)))  \n \
                    (sign-ext-bv tmp 0 32 64))))  \n \
                result)   \n \
            }",
  },
}
