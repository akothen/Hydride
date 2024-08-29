#lang rosette

(require racket/pretty)

;;; Vector Multiply

;; v16acc48 mul 	( 	v16int16  	a,
;; 		v16int16  	b 
;; 	) 		
;; 
;; Lane by lane 16-bit real multiply.

;; 16b x 16b multiplication -> 32 bit result stored in 48 bit register (16 guard bits for accumulation)
;; v16acc48 is 16 lanes of 48 bit values -> total data size is 16 * 48 = 768 bit
;; TODO: Size of Rosette bvmul product is not sum of operand widths, issue?

(define (v16acc48_mul xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff1 (sign-extend (extract %high1 %low1 xbuff) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_xbuff2 (sign-extend (extract %high2 %low2 ybuff) (bitvector 32)))
        (define %o (zero-extend (bvmul %ext_xbuff1 %ext_xbuff2) (bitvector 48)))
        %o
      )
    )
  )
  dst
)
 
;; v16acc48 mul16 	( 	v64int16  	xbuff,
;; 		int  	xstart,
;; 		unsigned int  	xoffsets,
;; 		unsigned int  	xoffsets_hi,
;; 		unsigned int  	xsquare,
;; 		v16int16  	zbuff,
;; 		int  	zstart,
;; 		unsigned int  	zoffsets,
;; 		unsigned int  	zoffsets_hi,
;; 		int  	zstep 
;; 	) 		
;; 
;; Multiply intrinsic function .
;; 
;; acc0 = z00*x00 + z01*x01
;; acc1 = z10*x10 + z11*x11
;; acc2 = z20*x20 + z21*x21
;; acc3 = z30*x30 + z31*x31
;; acc4 = z40*x40 + z41*x41
;; acc5 = z50*x50 + z51*x51
;; acc6 = z60*x60 + z61*x61
;; acc7 = z70*x70 + z71*x71
;; acc8 = z80*x80 + z81*x81
;; acc9 = z90*x90 + z91*x91
;; acc10 = z100*x100 + z101*x101
;; acc11 = z110*x110 + z111*x111
;; acc12 = z120*x120 + z121*x121
;; acc13 = z130*x130 + z131*x131
;; acc14 = z140*x140 + z141*x141
;; acc15 = z150*x150 + z151*x151
;; 
;; Returns
;;     Returned accumulation vector (16 x int48 lanes) 
;; 
;; Parameters
;;     xbuff	Input buffer of 64 elements of type int16
;;     xstart	Starting position offset applied to all lanes of input from X buffer. xstart is restricted to multiples of 2 as granularity for xbuff is 32-bit.
;;     xoffsets	4b offset for each lane, corresponds to 2x the lane number and each second lane is an offset to the lane before + 1. LSB apply to first lane
;;     xoffsets_hi	4b offset for each lane, corresponds to 2x the lane number and each second lane is an offset to the lane before + 1. LSB apply to 8th lane
;;     xsquare	Select order of the mini-permute square (default=0x3210). LSB apply to first element
;;     zbuff	Input buffer of 16 elements of type int16
;;     zstart	Starting position offset applied to all lanes for input from Z buffer. This must be a compile time constant. Only the 4 LSB of the argument are used.
;;     zoffsets	4b offset for each lane, applied to input from Z buffer. LSB apply to first lane
;;     zoffsets_hi	4b offset for each lane, applied to input from Z buffer. LSB apply to 8th lane
;;     zstep	Step between each column for selection in the zbuffer.

;; For more information on how data selection works from the buffers go here. For this intrinsic, the data buffer uses the 16bx16b scheme and the coefficient buffer uses the general scheme.
;; Parameter 'zstart' must be a compile time constant. 

(define (v16acc48_mul16 xbuff	xstart xoffsets xoffsets_hi	xsquare	zbuff	zstart zoffsets zoffsets_hi	zstep)

  ;; (define m_val (let ([m 1]) (let ([m (if (= data_size 32) (* m 2) m)]) (let ([m (if (= coeff_size 32) (* m 2) m)]) (let ([m (if data_complex (* m 2) m)]) (let ([m (if coeff_complex (* m 2) m)]) m))))))
  ;; manually define m_val for each semantic
  (define m_val 1)  ;; data_size = 16, coeff_size = 16, not complex
  (define rows 16)
  (define cols (/ 32 (* m_val 16)))

  (define total_num_lanes_buf 16)

  (define half_num_lanes_buf (/ total_num_lanes_buf 2))

  ;; Select xoffsets or xoffsets_hi

  (define dst
    (apply concat
      (for/list ([i (reverse (range 0 (* cols rows) 1))])

        (define c (modulo i cols))
        (define r (/ i cols))


        (define bvzoffsets
          (if (>= i half_num_lanes_buf)
            (integer->bitvector zoffsets (bitvector 32))
            (integer->bitvector zoffsets_hi (bitvector 32))
          )
        )

        (define low_index_r (* 4 (- (- half_num_lanes_buf 1) (modulo r half_num_lanes_buf))))
        (define high_index_r (+ low_index_r 3))
        (define ext_bvxoffsets_r (extract high_index_r low_index_r bvzoffsets))
        (define offset_r (bitvector->integer ext_bvxoffsets_r))

        (define low_index_r_1 (* 4 (- (- half_num_lanes_buf 1) (modulo (- r 1) half_num_lanes_buf))))
        (define high_index_r_1 (+ low_index_r_1 3))
        (define ext_bvxoffsets_r_1 (extract high_index_r_1 low_index_r_1 bvzoffsets))
        (define offset_r_1 (bitvector->integer ext_bvxoffsets_r_1))

        (define offset_16_16
          (if (eq? (modulo r 2) 0)
            (* offset_r 2)
            (+ (* offset_r 2) (* (+ offset_r_1 1) 2))
          )
        )

        ;; idx for z buffer
        (define gen_idx (modulo (+ i (+ (* zstep c) (+ zstart offset_r))) total_num_lanes_buf))

        ;; idx for x buffer
        (define 16_16_idx (modulo (+ i (modulo (+ 2 offset_16_16 xstart) 64)) total_num_lanes_buf))
    
        (define %low1 (* 16 16_16_idx))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff1 (sign-extend (extract %high1 %low1 xbuff) (bitvector 32)))
        (define %low2 (* 16 gen_idx))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_xbuff2 (sign-extend (extract %high2 %low2 zbuff) (bitvector 32)))
        ;; todo each out in loop in acc
        (define %o (zero-extend (bvmul %ext_xbuff1 %ext_xbuff2) (bitvector 48)))
        %o
      )
    )
  )
  dst
)

(define xbuff_64_16 (bv #x80ecdc1b732d594fd8c415b9d8c6ad013bf522b837e25ad7d685aa6d3e6e74342d093619d85a6c4fc5bed844d1743d45ea14e07fcba46210fe00d1a8b525b55627e820b8320480a34df211015380c3517462889d2210d78bf2328e9c4b97ca0e01796933e37761b955f5eaa10a10dd4e3ec6765ab2bb4d51051a79f3cb7f68df 1024))
(define ybuff_16_16 (bv #xbac1fd5a5c9cc5a5cde2903c0c62085b504c9acdb653e4175430738aebd1d496 256))

(pretty-print (bv #x7 4))
(pretty-print (bvmul (bv #x7 4) (bv #x7 4)))
(pretty-print (v16acc48_mul xbuff_64_16  ybuff_16_16))
