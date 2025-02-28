#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)



(provide (all-defined-out))

(define empty_hash 
  (hash
    ;; VF = 32
    (vec-add (vec-add '(buf int32 1024) (xBroadcast '(buf int32 32) 32)) '(buf int32 1024)) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 1024 1024 0 1024 32 -1 0) (reg (bv #x01 8)) 1024 1024 0 1024 32 -1 0) 12)

    (vec-add '(buf int32 1024) (vec-mul '(buf int32 1024) (xBroadcast '(buf int32 32) 32))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 1024 1024 0 1024 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 1024) (xBroadcast '(buf int32 32) 32)) (xBroadcast '(buf int32 32) 32)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1024 1024 0 1024 32 -1 0) (reg (bv #x02 8)) 1024 1024 0 1024 32 0) 15)

    ;; VF = 512
    (vec-add (vec-add '(buf int32 16384) (xBroadcast '(buf int32 32) 512)) '(buf int32 16384 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 16384 16384 0 16384 32 -1 0) (reg (bv #x01 8)) 16384 16384 0 16384 32 -1 0) 12)

    (vec-add '(buf int32  16384) (vec-mul '(buf int32 16384) (xBroadcast '(buf int32 32) 512))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 16384 16384 0 16384 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 16384) (xBroadcast '(buf int32 32) 512)) (xBroadcast '(buf int32 32) 512)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16384 16384 0 16384 32 -1 0) (reg (bv #x02 8)) 16384 16384 0 16384 32 0) 15)

    ;; VF = 1024

    (vec-add '(buf int32 32768)  '(buf int32 32768 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 32768 32768 0 32768 32 -1 0)   12)

    (vec-max '(buf int32 32768)  '(buf int32 32768 )) 
    (vector #t   (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) 32768 32768 0 32768 32 1 0)   12)

    (vec-add (vec-add '(buf int32 32768) (xBroadcast '(buf int32 32) 1024)) '(buf int32 32768 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 32768 32768 0 32768 32 -1 0) (reg (bv #x01 8)) 32768 32768 0 32768 32 -1 0) 12)

    (vec-add '(buf int32  32768) (vec-mul '(buf int32 32768) (xBroadcast '(buf int32 32) 1024))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 32768 32768 0 32768 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 32768) (xBroadcast '(buf int32 32) 1024)) (xBroadcast '(buf int32 32) 1024)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 32768 32768 0 32768 32 -1 0) (reg (bv #x02 8)) 32768 32768 0 32768 32 0) 15)

    ;; VF = 2048
    (vec-add (vec-add '(buf int32 65536) (xBroadcast '(buf int32 32) 2048)) '(buf int32 65536 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 65536 65536 0 65536 32 -1 0) (reg (bv #x01 8)) 65536 65536 0 65536 32 -1 0) 12)

    (vec-add '(buf int32  65536) (vec-mul '(buf int32 65536) (xBroadcast '(buf int32 32) 2048))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 65536 65536 0 65536 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 65536) (xBroadcast '(buf int32 32) 2048)) (xBroadcast '(buf int32 32) 2048)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 65536 65536 0 65536 32 -1 0) (reg (bv #x02 8)) 65536 65536 0 65536 32 0) 15)

    ;; VF = 4096

    (vec-add '(buf int32 131072)  '(buf int32 131072 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 131072 131072 0 131072 32 -1 0)   12)

    (vec-max '(buf int32 131072)  '(buf int32 131072 )) 
    (vector #t   (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) 131072 131072 0 131072 32 1 0)   12)

    (vec-add (vec-add '(buf int32 131072) (xBroadcast '(buf int32 32) 4096)) '(buf int32 131072 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 131072 131072 0 131072 32 -1 0) (reg (bv #x01 8)) 131072 131072 0 131072 32 -1 0) 12)

    (vec-add '(buf int32  131072) (vec-mul '(buf int32 131072) (xBroadcast '(buf int32 32) 4096))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 131072 131072 0 131072 32 -1 0) 3)

    (vec-mul  '(buf int32 131072)  (xBroadcast '(buf int32 32) 4096)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl  (reg (bv #x00 8))(reg (bv #x01 8)) 131072 131072 0 131072 32 0) 15)

    (vec-mul (vec-add '(buf int32 131072) (xBroadcast '(buf int32 32) 4096)) (xBroadcast '(buf int32 32) 4096)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 131072 131072 0 131072 32 -1 0) (reg (bv #x02 8)) 131072 131072 0 131072 32 0) 15)

    (vec-add '(buf int32 131072) (xBroadcast '(buf int32 32) 4096))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 131072 131072 0 131072 32 -1 0) 12)


    ;; VF = 8192
    (vec-add (vec-add '(buf int32 262144) (xBroadcast '(buf int32 32) 8192)) '(buf int32 262144 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 262144 262144 0 262144 32 -1 0) (reg (bv #x01 8)) 262144 262144 0 262144 32 -1 0) 12)

    (vec-add '(buf int32  262144) (vec-mul '(buf int32 262144) (xBroadcast '(buf int32 32) 8192))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 262144 262144 0 262144 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 262144) (xBroadcast '(buf int32 32) 8192)) (xBroadcast '(buf int32 32) 8192)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 262144 262144 0 262144 32 -1 0) (reg (bv #x02 8)) 262144 262144 0 262144 32 0) 15)

    (vec-add
      '(buf int32 262144)
      (xBroadcast '(buf int32 32) 8192))
    (vector #t 
            (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              262144
              262144
              0
              262144
              32
              -1
              0)

            10)

    (vec-mul
      '(buf int32 262144)
      (xBroadcast '(buf int32 32) 8192))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              262144
              262144
              0
              262144
              32
              0)

            10)

    (vec-max '(buf int32 262144)  '(buf int32 262144 )) 
    (vector #t   (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) 262144 262144 0 262144 32 1 0)   12)

    (vec-add '(buf int32 262144)  '(buf int32 262144 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 262144 262144 0 262144 32 -1 0)   12)

    ;; VF = 16384
    (vec-add (vec-add '(buf int32 524288) (xBroadcast '(buf int32 32) 16384)) '(buf int32 524288 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 524288 524288 0 524288 32 -1 0) (reg (bv #x01 8)) 524288 524288 0 524288 32 -1 0) 12)

    (vec-add '(buf int32  524288) (vec-mul '(buf int32 524288) (xBroadcast '(buf int32 32) 16384))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 524288 524288 0 524288 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 524288) (xBroadcast '(buf int32 32) 16384)) (xBroadcast '(buf int32 32) 16384)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 -1 0) (reg (bv #x02 8)) 524288 524288 0 524288 32 0) 15)

    (vec-add (vec-add '(buf int32 524288) '(buf int32 524288)) '(buf int32 524288 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 -1 0)  (reg (bv #x02 8)) 524288 524288 0 524288 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 524288) (xBroadcast '(buf int32 32) 16384))
      (xBroadcast '(buf int32 32) 16384))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 524288 32 0 0)
              (reg (bv #x01 8))
              524288
              524288
              0
              524288
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 524288)
      (xBroadcast '(buf int32 32) 16384))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              524288
              524288
              0
              524288
              32
              0)

            10)

    (vec-mul
      '(buf int32 524288)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 16384))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              524288
              524288
              0
              524288
              32
              0)

            10)


    (vec-add '(buf int32 524288) (xBroadcast '(buf int32 32) 16384))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 -1 0) 12)

    (vec-mul '(buf int32 524288) '(buf int32 524288))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 1 64 1 0)  10)

    (vec-add '(buf int32 524288) (vec-mul '(buf int32 524288) '(buf int32 524288))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 1 64 1 0) (reg (bv #x00 8)) 524288 524288 0 524288 32 -1 0) 10)


    (vec-add '(buf int32 524288)  '(buf int32 524288 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 -1 0)   12)

    (vec-max '(buf int32 524288) (xBroadcast '(buf int32 32) 16384))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 1 0) 12)

    (vec-add '(buf int32 524288) (xBroadcast '(buf int32 32) 16384))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 -1 0) 12)

    (vec-add '(buf int32 524288) (xBroadcast (int-imm (bv #x01 32 ) #t) 16384))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 524288 524288 0 524288 32 -1 0) 12)


    (vec-min '(buf int32 524288) (xBroadcast '(buf int32 32) 16384))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 524288)
        (xBroadcast '(buf int32 32)  16384))
      (vec-add
        '(buf int32 524288) 
        (xBroadcast '(buf int32 32)  16384)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 524288 524288 0 524288 32 -1 0)
              524288 524288 0 524288 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 524288)
        (xBroadcast '(buf int32 32) 16384))
      (xBroadcast '(buf int32 32) 16384))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 -1 0)
              (reg (bv #x02 8)) 524288 524288 0 524288 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 524288) 
        (xBroadcast '(buf int32 32) 16384))
      (xBroadcast '(buf int32 32) 16384))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 524288 524288 0 524288 32 1 0)
              (reg (bv #x02 8))
              524288
              524288
              0
              524288
              32
              0)
            20
            )



    ;; VF = 32768
    (vec-add (vec-add '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768)) '(buf int32 1048576 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 1048576 1048576 0 1048576 32 -1 0) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 -1 0) 12)

    (vec-add '(buf int32  1048576) (vec-mul '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 1048576 1048576 0 1048576 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768)) (xBroadcast '(buf int32 32) 32768)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 -1 0) (reg (bv #x02 8)) 1048576 1048576 0 1048576 32 0) 15)

    (vec-add (vec-add '(buf int32 1048576) '(buf int32 1048576)) '(buf int32 1048576 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 -1 0)  (reg (bv #x02 8)) 1048576 1048576 0 1048576 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768))
      (xBroadcast '(buf int32 32) 32768))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 1048576 32 0 0)
              (reg (bv #x01 8))
              1048576
              1048576
              0
              1048576
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 1048576)
      (xBroadcast '(buf int32 32) 32768))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              1048576
              1048576
              0
              1048576
              32
              0)

            10)

    (vec-mul
      '(buf int32 1048576)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 32768))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              1048576
              1048576
              0
              1048576
              32
              0)

            10)


    (vec-add '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 -1 0) 12)

    (vec-mul '(buf int32 1048576) '(buf int32 1048576))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 1 64 1 0)  10)

    (vec-add '(buf int32 1048576) (vec-mul '(buf int32 1048576) '(buf int32 1048576))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 1 64 1 0) (reg (bv #x00 8)) 1048576 1048576 0 1048576 32 -1 0) 10)


    (vec-add '(buf int32 1048576)  '(buf int32 1048576 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 -1 0)   12)

    (vec-max '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 1 0) 12)

    (vec-add '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 -1 0) 12)

    (vec-add '(buf int32 1048576) (xBroadcast (int-imm (bv #x01 32 ) #t) 32768))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 1048576 1048576 0 1048576 32 -1 0) 12)


    (vec-min '(buf int32 1048576) (xBroadcast '(buf int32 32) 32768))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 1048576)
        (xBroadcast '(buf int32 32)  32768))
      (vec-add
        '(buf int32 1048576) 
        (xBroadcast '(buf int32 32)  32768)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 1048576 1048576 0 1048576 32 -1 0)
              1048576 1048576 0 1048576 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 1048576)
        (xBroadcast '(buf int32 32) 32768))
      (xBroadcast '(buf int32 32) 32768))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 -1 0)
              (reg (bv #x02 8)) 1048576 1048576 0 1048576 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 1048576) 
        (xBroadcast '(buf int32 32) 32768))
      (xBroadcast '(buf int32 32) 32768))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 1048576 1048576 0 1048576 32 1 0)
              (reg (bv #x02 8))
              1048576
              1048576
              0
              1048576
              32
              0)
            20
            )


    ;; VF = 65536
    (vec-add (vec-add '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536)) '(buf int32 2097152 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 2097152 2097152 0 2097152 32 -1 0) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 -1 0) 12)

    (vec-add '(buf int32  2097152) (vec-mul '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 2097152 2097152 0 2097152 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536)) (xBroadcast '(buf int32 32) 65536)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 -1 0) (reg (bv #x02 8)) 2097152 2097152 0 2097152 32 0) 15)

    (vec-add (vec-add '(buf int32 2097152) '(buf int32 2097152)) '(buf int32 2097152 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 -1 0)  (reg (bv #x02 8)) 2097152 2097152 0 2097152 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536))
      (xBroadcast '(buf int32 32) 65536))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 2097152 32 0 0)
              (reg (bv #x01 8))
              2097152
              2097152
              0
              2097152
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 2097152)
      (xBroadcast '(buf int32 32) 65536))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              2097152
              2097152
              0
              2097152
              32
              0)

            10)

    (vec-mul
      '(buf int32 2097152)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 65536))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              2097152
              2097152
              0
              2097152
              32
              0)

            10)


    (vec-add '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 -1 0) 12)

    (vec-mul '(buf int32 2097152) '(buf int32 2097152))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 1 64 1 0)  10)

    (vec-add '(buf int32 2097152) (vec-mul '(buf int32 2097152) '(buf int32 2097152))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 1 64 1 0) (reg (bv #x00 8)) 2097152 2097152 0 2097152 32 -1 0) 10)


    (vec-add '(buf int32 2097152)  '(buf int32 2097152 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 -1 0)   12)

    (vec-max '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 1 0) 12)

    (vec-add '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 -1 0) 12)

    (vec-add '(buf int32 2097152) (xBroadcast (int-imm (bv #x01 32 ) #t) 65536))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 2097152 2097152 0 2097152 32 -1 0) 12)


    (vec-min '(buf int32 2097152) (xBroadcast '(buf int32 32) 65536))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 2097152)
        (xBroadcast '(buf int32 32)  65536))
      (vec-add
        '(buf int32 2097152) 
        (xBroadcast '(buf int32 32)  65536)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 2097152 2097152 0 2097152 32 -1 0)
              2097152 2097152 0 2097152 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 2097152)
        (xBroadcast '(buf int32 32) 65536))
      (xBroadcast '(buf int32 32) 65536))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 -1 0)
              (reg (bv #x02 8)) 2097152 2097152 0 2097152 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 2097152) 
        (xBroadcast '(buf int32 32) 65536))
      (xBroadcast '(buf int32 32) 65536))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 2097152 2097152 0 2097152 32 1 0)
              (reg (bv #x02 8))
              2097152
              2097152
              0
              2097152
              32
              0)
            20
            )


    ;; VF = 131072
    (vec-add (vec-add '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072)) '(buf int32 4194304 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 4194304 4194304 0 4194304 32 -1 0) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 -1 0) 12)

    (vec-add '(buf int32  4194304) (vec-mul '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 4194304 4194304 0 4194304 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072)) (xBroadcast '(buf int32 32) 131072)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 -1 0) (reg (bv #x02 8)) 4194304 4194304 0 4194304 32 0) 15)

    (vec-add (vec-add '(buf int32 4194304) '(buf int32 4194304)) '(buf int32 4194304 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 -1 0)  (reg (bv #x02 8)) 4194304 4194304 0 4194304 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072))
      (xBroadcast '(buf int32 32) 131072))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 4194304 32 0 0)
              (reg (bv #x01 8))
              4194304
              4194304
              0
              4194304
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 4194304)
      (xBroadcast '(buf int32 32) 131072))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              4194304
              4194304
              0
              4194304
              32
              0)

            10)

    (vec-mul
      '(buf int32 4194304)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 131072))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              4194304
              4194304
              0
              4194304
              32
              0)

            10)


    (vec-add '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 -1 0) 12)

    (vec-mul '(buf int32 4194304) '(buf int32 4194304))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 1 64 1 0)  10)

    (vec-add '(buf int32 4194304) (vec-mul '(buf int32 4194304) '(buf int32 4194304))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 1 64 1 0) (reg (bv #x00 8)) 4194304 4194304 0 4194304 32 -1 0) 10)


    (vec-add '(buf int32 4194304)  '(buf int32 4194304 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 -1 0)   12)

    (vec-max '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 1 0) 12)

    (vec-add '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 -1 0) 12)

    (vec-add '(buf int32 4194304) (xBroadcast (int-imm (bv #x01 32 ) #t) 131072))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 4194304 4194304 0 4194304 32 -1 0) 12)


    (vec-min '(buf int32 4194304) (xBroadcast '(buf int32 32) 131072))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 4194304)
        (xBroadcast '(buf int32 32)  131072))
      (vec-add
        '(buf int32 4194304) 
        (xBroadcast '(buf int32 32)  131072)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 4194304 4194304 0 4194304 32 -1 0)
              4194304 4194304 0 4194304 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 4194304)
        (xBroadcast '(buf int32 32) 131072))
      (xBroadcast '(buf int32 32) 131072))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 -1 0)
              (reg (bv #x02 8)) 4194304 4194304 0 4194304 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 4194304) 
        (xBroadcast '(buf int32 32) 131072))
      (xBroadcast '(buf int32 32) 131072))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 4194304 4194304 0 4194304 32 1 0)
              (reg (bv #x02 8))
              4194304
              4194304
              0
              4194304
              32
              0)
            20
            )


    ;; VF = 262144
    (vec-add (vec-add '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144)) '(buf int32 8388608 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 8388608 8388608 0 8388608 32 -1 0) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 -1 0) 12)

    (vec-add '(buf int32  8388608) (vec-mul '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 8388608 8388608 0 8388608 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144)) (xBroadcast '(buf int32 32) 262144)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 -1 0) (reg (bv #x02 8)) 8388608 8388608 0 8388608 32 0) 15)

    (vec-add (vec-add '(buf int32 8388608) '(buf int32 8388608)) '(buf int32 8388608 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 -1 0)  (reg (bv #x02 8)) 8388608 8388608 0 8388608 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144))
      (xBroadcast '(buf int32 32) 262144))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 8388608 32 0 0)
              (reg (bv #x01 8))
              8388608
              8388608
              0
              8388608
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 8388608)
      (xBroadcast '(buf int32 32) 262144))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              8388608
              8388608
              0
              8388608
              32
              0)

            10)

    (vec-mul
      '(buf int32 8388608)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 262144))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              8388608
              8388608
              0
              8388608
              32
              0)

            10)


    (vec-add '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 -1 0) 12)

    (vec-mul '(buf int32 8388608) '(buf int32 8388608))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 1 64 1 0)  10)

    (vec-add '(buf int32 8388608) (vec-mul '(buf int32 8388608) '(buf int32 8388608))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 1 64 1 0) (reg (bv #x00 8)) 8388608 8388608 0 8388608 32 -1 0) 10)


    (vec-add '(buf int32 8388608)  '(buf int32 8388608 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 -1 0)   12)

    (vec-max '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 1 0) 12)

    (vec-add '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 -1 0) 12)

    (vec-add '(buf int32 8388608) (xBroadcast (int-imm (bv #x01 32 ) #t) 262144))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 8388608 8388608 0 8388608 32 -1 0) 12)


    (vec-min '(buf int32 8388608) (xBroadcast '(buf int32 32) 262144))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 8388608)
        (xBroadcast '(buf int32 32)  262144))
      (vec-add
        '(buf int32 8388608) 
        (xBroadcast '(buf int32 32)  262144)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 8388608 8388608 0 8388608 32 -1 0)
              8388608 8388608 0 8388608 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 8388608)
        (xBroadcast '(buf int32 32) 262144))
      (xBroadcast '(buf int32 32) 262144))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 -1 0)
              (reg (bv #x02 8)) 8388608 8388608 0 8388608 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 8388608) 
        (xBroadcast '(buf int32 32) 262144))
      (xBroadcast '(buf int32 32) 262144))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 8388608 8388608 0 8388608 32 1 0)
              (reg (bv #x02 8))
              8388608
              8388608
              0
              8388608
              32
              0)
            20
            )


    ;; VF = 524288
    (vec-add (vec-add '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288)) '(buf int32 16777216 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 16777216 16777216 0 16777216 32 -1 0) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 -1 0) 12)

    (vec-add '(buf int32  16777216) (vec-mul '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 16777216 16777216 0 16777216 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288)) (xBroadcast '(buf int32 32) 524288)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 -1 0) (reg (bv #x02 8)) 16777216 16777216 0 16777216 32 0) 15)

    (vec-add (vec-add '(buf int32 16777216) '(buf int32 16777216)) '(buf int32 16777216 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 -1 0)  (reg (bv #x02 8)) 16777216 16777216 0 16777216 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288))
      (xBroadcast '(buf int32 32) 524288))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 16777216 32 0 0)
              (reg (bv #x01 8))
              16777216
              16777216
              0
              16777216
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 16777216)
      (xBroadcast '(buf int32 32) 524288))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              16777216
              16777216
              0
              16777216
              32
              0)

            10)

    (vec-mul
      '(buf int32 16777216)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 524288))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              16777216
              16777216
              0
              16777216
              32
              0)

            10)


    (vec-add '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 -1 0) 12)

    (vec-mul '(buf int32 16777216) '(buf int32 16777216))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 1 64 1 0)  10)

    (vec-add '(buf int32 16777216) (vec-mul '(buf int32 16777216) '(buf int32 16777216))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 1 64 1 0) (reg (bv #x00 8)) 16777216 16777216 0 16777216 32 -1 0) 10)


    (vec-add '(buf int32 16777216)  '(buf int32 16777216 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 -1 0)   12)

    (vec-max '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 1 0) 12)

    (vec-add '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 -1 0) 12)

    (vec-add '(buf int32 16777216) (xBroadcast (int-imm (bv #x01 32 ) #t) 524288))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 16777216 16777216 0 16777216 32 -1 0) 12)


    (vec-min '(buf int32 16777216) (xBroadcast '(buf int32 32) 524288))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 16777216)
        (xBroadcast '(buf int32 32)  524288))
      (vec-add
        '(buf int32 16777216) 
        (xBroadcast '(buf int32 32)  524288)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 16777216 16777216 0 16777216 32 -1 0)
              16777216 16777216 0 16777216 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 16777216)
        (xBroadcast '(buf int32 32) 524288))
      (xBroadcast '(buf int32 32) 524288))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 -1 0)
              (reg (bv #x02 8)) 16777216 16777216 0 16777216 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 16777216) 
        (xBroadcast '(buf int32 32) 524288))
      (xBroadcast '(buf int32 32) 524288))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 16777216 16777216 0 16777216 32 1 0)
              (reg (bv #x02 8))
              16777216
              16777216
              0
              16777216
              32
              0)
            20
            )


    ;; VF = 1048576
    (vec-add (vec-add '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576)) '(buf int32 33554432 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 33554432 33554432 0 33554432 32 -1 0) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 -1 0) 12)

    (vec-add '(buf int32  33554432) (vec-mul '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 33554432 33554432 0 33554432 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576)) (xBroadcast '(buf int32 32) 1048576)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 -1 0) (reg (bv #x02 8)) 33554432 33554432 0 33554432 32 0) 15)

    (vec-add (vec-add '(buf int32 33554432) '(buf int32 33554432)) '(buf int32 33554432 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 -1 0)  (reg (bv #x02 8)) 33554432 33554432 0 33554432 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576))
      (xBroadcast '(buf int32 32) 1048576))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 33554432 32 0 0)
              (reg (bv #x01 8))
              33554432
              33554432
              0
              33554432
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 33554432)
      (xBroadcast '(buf int32 32) 1048576))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              33554432
              33554432
              0
              33554432
              32
              0)

            10)

    (vec-mul
      '(buf int32 33554432)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 1048576))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              33554432
              33554432
              0
              33554432
              32
              0)

            10)


    (vec-add '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 -1 0) 12)

    (vec-mul '(buf int32 33554432) '(buf int32 33554432))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 1 64 1 0)  10)

    (vec-add '(buf int32 33554432) (vec-mul '(buf int32 33554432) '(buf int32 33554432))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 1 64 1 0) (reg (bv #x00 8)) 33554432 33554432 0 33554432 32 -1 0) 10)


    (vec-add '(buf int32 33554432)  '(buf int32 33554432 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 -1 0)   12)

    (vec-max '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 1 0) 12)

    (vec-add '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 -1 0) 12)

    (vec-add '(buf int32 33554432) (xBroadcast (int-imm (bv #x01 32 ) #t) 1048576))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 33554432 33554432 0 33554432 32 -1 0) 12)


    (vec-min '(buf int32 33554432) (xBroadcast '(buf int32 32) 1048576))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 33554432)
        (xBroadcast '(buf int32 32)  1048576))
      (vec-add
        '(buf int32 33554432) 
        (xBroadcast '(buf int32 32)  1048576)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 33554432 33554432 0 33554432 32 -1 0)
              33554432 33554432 0 33554432 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 33554432)
        (xBroadcast '(buf int32 32) 1048576))
      (xBroadcast '(buf int32 32) 1048576))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 -1 0)
              (reg (bv #x02 8)) 33554432 33554432 0 33554432 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 33554432) 
        (xBroadcast '(buf int32 32) 1048576))
      (xBroadcast '(buf int32 32) 1048576))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 33554432 33554432 0 33554432 32 1 0)
              (reg (bv #x02 8))
              33554432
              33554432
              0
              33554432
              32
              0)
            20
            )


    ;; VF = 2097152
    (vec-add (vec-add '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152)) '(buf int32 67108864 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 67108864 67108864 0 67108864 32 -1 0) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 -1 0) 12)

    (vec-add '(buf int32  67108864) (vec-mul '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 67108864 67108864 0 67108864 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152)) (xBroadcast '(buf int32 32) 2097152)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 -1 0) (reg (bv #x02 8)) 67108864 67108864 0 67108864 32 0) 15)

    (vec-add (vec-add '(buf int32 67108864) '(buf int32 67108864)) '(buf int32 67108864 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 -1 0)  (reg (bv #x02 8)) 67108864 67108864 0 67108864 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152))
      (xBroadcast '(buf int32 32) 2097152))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 67108864 32 0 0)
              (reg (bv #x01 8))
              67108864
              67108864
              0
              67108864
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 67108864)
      (xBroadcast '(buf int32 32) 2097152))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              67108864
              67108864
              0
              67108864
              32
              0)

            10)

    (vec-mul
      '(buf int32 67108864)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 2097152))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              67108864
              67108864
              0
              67108864
              32
              0)

            10)


    (vec-add '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 -1 0) 12)

    (vec-mul '(buf int32 67108864) '(buf int32 67108864))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 1 64 1 0)  10)

    (vec-add '(buf int32 67108864) (vec-mul '(buf int32 67108864) '(buf int32 67108864))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 1 64 1 0) (reg (bv #x00 8)) 67108864 67108864 0 67108864 32 -1 0) 10)


    (vec-add '(buf int32 67108864)  '(buf int32 67108864 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 -1 0)   12)

    (vec-max '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 1 0) 12)

    (vec-add '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 -1 0) 12)

    (vec-add '(buf int32 67108864) (xBroadcast (int-imm (bv #x01 32 ) #t) 2097152))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 67108864 67108864 0 67108864 32 -1 0) 12)


    (vec-min '(buf int32 67108864) (xBroadcast '(buf int32 32) 2097152))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 67108864)
        (xBroadcast '(buf int32 32)  2097152))
      (vec-add
        '(buf int32 67108864) 
        (xBroadcast '(buf int32 32)  2097152)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 67108864 67108864 0 67108864 32 -1 0)
              67108864 67108864 0 67108864 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 67108864)
        (xBroadcast '(buf int32 32) 2097152))
      (xBroadcast '(buf int32 32) 2097152))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 -1 0)
              (reg (bv #x02 8)) 67108864 67108864 0 67108864 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 67108864) 
        (xBroadcast '(buf int32 32) 2097152))
      (xBroadcast '(buf int32 32) 2097152))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 67108864 67108864 0 67108864 32 1 0)
              (reg (bv #x02 8))
              67108864
              67108864
              0
              67108864
              32
              0)
            20
            )


    ;; VF = 4194304
    (vec-add (vec-add '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304)) '(buf int32 134217728 )) 
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x02 8)) (reg (bv #x00 8)) 134217728 134217728 0 134217728 32 -1 0) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 -1 0) 12)

    (vec-add '(buf int32  134217728) (vec-mul '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304))) 
    (vector #t (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (reg (bv #x01 8)) (reg (bv #x00 8)) (reg (bv #x02 8)) 134217728 134217728 0 134217728 32 -1 0) 3)

    (vec-mul (vec-add '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304)) (xBroadcast '(buf int32 32) 4194304)) 
    (vector #t (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 -1 0) (reg (bv #x02 8)) 134217728 134217728 0 134217728 32 0) 15)

    (vec-add (vec-add '(buf int32 134217728) '(buf int32 134217728)) '(buf int32 134217728 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl  (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 -1 0)  (reg (bv #x02 8)) 134217728 134217728 0 134217728 32 -1 0)   12)



    (vec-add
      (vec-mul '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304))
      (xBroadcast '(buf int32 32) 4194304))
    (vector #t
            (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
              (reg (bv #x00 8))
              (pimBroadCast_v1024_e16__v16_e16_dsl (reg (bv #x02 8)) 32 32 0 134217728 32 0 0)
              (reg (bv #x01 8))
              134217728
              134217728
              0
              134217728
              32
              -1
              0)
            15



            )


    (vec-mul
      '(buf int32 134217728)
      (xBroadcast '(buf int32 32) 4194304))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (reg (bv #x01 8))
              134217728
              134217728
              0
              134217728
              32
              0)

            10)

    (vec-mul
      '(buf int32 134217728)
      (xBroadcast (int-imm (bv #x00004000 32) #t) 4194304))
    (vector #t 
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (reg (bv #x00 8))
              (lit (bv #x00004000 32))
              134217728
              134217728
              0
              134217728
              32
              0)

            10)


    (vec-add '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 -1 0) 12)

    (vec-mul '(buf int32 134217728) '(buf int32 134217728))
    (vector #t  (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 1 64 1 0)  10)

    (vec-add '(buf int32 134217728) (vec-mul '(buf int32 134217728) '(buf int32 134217728))) 

    (vector #t (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (pimMul_v512_e8__v512_e8__v512_e8_dsl (reg (bv #x02 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 1 64 1 0) (reg (bv #x00 8)) 134217728 134217728 0 134217728 32 -1 0) 10)


    (vec-add '(buf int32 134217728)  '(buf int32 134217728 )) 
    (vector #t   (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 -1 0)   12)

    (vec-max '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304))  
    (vector #t (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 1 0) 12)

    (vec-add '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 -1 0) 12)

    (vec-add '(buf int32 134217728) (xBroadcast (int-imm (bv #x01 32 ) #t) 4194304))  
    (vector #t (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (lit (bv 1 32)) 134217728 134217728 0 134217728 32 -1 0) 12)


    (vec-min '(buf int32 134217728) (xBroadcast '(buf int32 32) 4194304))  
    (vector #t (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 1 0) 12)

    (vec-add
      (vec-max
        '(buf int32 134217728)
        (xBroadcast '(buf int32 32)  4194304))
      (vec-add
        '(buf int32 134217728) 
        (xBroadcast '(buf int32 32)  4194304)))



    (vector #t  
            (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl   
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 1 0)
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x02 8)) (reg (bv #x03 8)) 134217728 134217728 0 134217728 32 -1 0)
              134217728 134217728 0 134217728 32 -1 0)
            20
            )


    (vec-min
      (vec-add
        '(buf int32 134217728)
        (xBroadcast '(buf int32 32) 4194304))
      (xBroadcast '(buf int32 32) 4194304))
    (vector #t  
            (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl 
              (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 -1 0)
              (reg (bv #x02 8)) 134217728 134217728 0 134217728 32 1 0)

            20
            )

    (vec-mul
      (vec-max
        '(buf int32 134217728) 
        (xBroadcast '(buf int32 32) 4194304))
      (xBroadcast '(buf int32 32) 4194304))
    (vector #t
            (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
              (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (reg (bv #x00 8)) (reg (bv #x01 8)) 134217728 134217728 0 134217728 32 1 0)
              (reg (bv #x02 8))
              134217728
              134217728
              0
              134217728
              32
              0)
            20
            )







    )



  )

