#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

;; Function to extract a bitvector
;; depending on the given type size
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)

(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

;;<intrinsic tech="AVX-512" name="_mm512_dpwssd_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m512i" varname="dst" etype="SI32"/>
;;	<parameter type="__m512i" varname="src" etype="SI32"/>
;;	<parameter type="__m512i" varname="a" etype="SI16"/>
;;	<parameter type="__m512i" varname="b" etype="SI16"/>
;;	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 15
;;	tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
;;	tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
;;	dst.dword[j] := src.dword[j] + tmp1 + tmp2
;;ENDFOR
;;dst[MAX:512] := 0
;;	</operation>
;;	<instruction name="VPDPWSSD" form="zmm, zmm, zmm" xed="VPDPWSSD_ZMMi32_MASKmskw_ZMMi16_ZMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
;; Valid Inputs: len = 4;red = 2;v-acc v1 v2 = 128-bit
(define (_mm512_dpwssd_epi32 v-acc v1 v2 len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define sum
             (apply bvadd
                    (for/list ([j (reverse (range red))])
                      (bvmul (sign-ext-bv v1 (+ j (* i 2)) 16 out_precision)
                             (sign-ext-bv v2 (+ j (* i 2)) 16 out_precision)))))
           (bvadd (ext-bv v-acc i out_precision) sum))))

;;<intrinsic tech="AVX-512" name="_mm256_dpwssd_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<CPUID>AVX512VL</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m256i" varname="dst" etype="SI32"/>
;;	<parameter type="__m256i" varname="src" etype="SI32"/>
;;	<parameter type="__m256i" varname="a" etype="SI16"/>
;;	<parameter type="__m256i" varname="b" etype="SI16"/>
;;	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 7
;;	tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
;;	tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
;;	dst.dword[j] := src.dword[j] + tmp1 + tmp2
;;ENDFOR
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPDPWSSD" form="ymm, ymm, ymm" xed="VPDPWSSD_YMMi32_MASKmskw_YMMi16_YMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_dpwssd_epi32 v-acc v1 v2 len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define sum
             (apply bvadd
                    (for/list ([j (reverse (range red))])
                      (bvmul (sign-ext-bv v1 (+ j (* i 2)) 16 out_precision)
                             (sign-ext-bv v2 (+ j (* i 2)) 16 out_precision)))))
           (bvadd (ext-bv v-acc i out_precision) sum))))

;;<intrinsic tech="AVX-512" name="_mm512_dpbusd_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m512i" varname="dst" etype="SI32"/>
;;	<parameter type="__m512i" varname="src" etype="SI32"/>
;;	<parameter type="__m512i" varname="a" etype="UI8"/>
;;	<parameter type="__m512i" varname="b" etype="SI8"/>
;;	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 15
;;	tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
;;	tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
;;	tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
;;	tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
;;	dst.dword[j] := src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4
;;ENDFOR
;;dst[MAX:512] := 0
;;	</operation>
;;	<instruction name="VPDPBUSDS" form="zmm, zmm, zmm" xed="VPDPBUSDS_ZMMi32_MASKmskw_ZMMu8_ZMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm512_dpbusd_epi32 v-acc v1 v2 len red)
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply bvadd
              (for/list ([j (reverse (range red))])
                (bvmul (zero-ext-bv v1 (+ j (* i 4)) 8 16) (sign-ext-bv v2 (+ j (* i 4)) 8 16)))))
     (bvadd (ext-bv v-acc i 32) (sign-extend sum (bitvector 32))))))

;;<intrinsic tech="AVX-512" name="_mm256_dpbusd_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<CPUID>AVX512VL</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m256i" varname="dst" etype="SI32"/>
;;	<parameter type="__m256i" varname="src" etype="SI32"/>
;;	<parameter type="__m256i" varname="a" etype="UI8"/>
;;	<parameter type="__m256i" varname="b" etype="SI8"/>
;;	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 7
;;	tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
;;	tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
;;	tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
;;	tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
;;	dst.dword[j] := src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4
;;ENDFOR
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPDPBUSDS" form="ymm, ymm, ymm" xed="VPDPBUSDS_YMMi32_MASKmskw_YMMu8_YMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_dpbusd_epi32 v-acc v1 v2 len red)
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply bvadd
              (for/list ([j (reverse (range red))])
                (bvmul (zero-ext-bv v1 (+ j (* i 4)) 8 16) (sign-ext-bv v2 (+ j (* i 4)) 8 16)))))
     (bvadd (ext-bv v-acc i 32) (sign-extend sum (bitvector 32))))))

;; HVX VRMPY
;;for (i = 0; i < VELEM(32); i++) {
;;  Vx.w[i] += (Vu.uw[i].ub[0] * Vv.w[i].b[0]);
;;  Vx.w[i] += (Vu.uw[i].ub[1] * Vv.w[i].b[1]);
;;  Vx.w[i] += (Vu.uw[i].ub[2] * Vv.w[i].b[2]);
;;  Vx.w[i] += (Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;
;}
(define (hvx_vrmpy v-acc v1 v2 len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define sum
             (apply bvadd
                    (for/list ([j (reverse (range red))])
                      (bvmul (zero-ext-bv v1 (+ j (* i 4)) 8 out_precision)
                             (sign-ext-bv v2 (+ j (* i 4)) 8 out_precision)))))
           (bvadd (ext-bv v-acc i out_precision) (sign-extend sum (bitvector out_precision))))))

;;for (i = 0; i < VELEM(32); i++) {
;;  Vx.w[i] += (Vu.w[i].b[0] * Vv.w[i].b[0]);
;;  Vx.w[i] += (Vu.w[i].b[1] * Vv.w[i].b[1]);
;;  Vx.w[i] += (Vu.w[i].b[2] * Vv.w[i].b[2]);
;;  Vx.w[i] += (Vu.w[i].b[3] * Vv.w[i].b[3]);
;;}
(define (hvx_vrmpy2 v-acc v1 v2 len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define sum
             (apply bvadd
                    (for/list ([j (reverse (range red))])
                      (bvmul (sign-ext-bv v1 (+ j (* i 4)) 8 out_precision)
                             (sign-ext-bv v2 (+ j (* i 4)) 8 out_precision)))))
           (bvadd (ext-bv v-acc i out_precision) sum))))

;;for (i = 0; i < VELEM(32); i++) {
;;     Vx.uw[i] += (Vu.uw[i].ub[0] *
;;     Vv.uw[i].ub[0]);
;;     Vx.uw[i] += (Vu.uw[i].ub[1] *
;;     Vv.uw[i].ub[1]);
;;     Vx.uw[i] += (Vu.uw[i].ub[2] *
;;     Vv.uw[i].ub[2]);
;;     Vx.uw[i] += (Vu.uw[i].ub[3] *
;;     Vv.uw[i].ub[3]) ;
;;}
(define (hvx_vrmpy3 v-acc v1 v2 len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define sum
             (apply bvadd
                    (for/list ([j (reverse (range red))])
                      (bvmul (zero-ext-bv v1 (+ j (* i 4)) 8 out_precision)
                             (zero-ext-bv v2 (+ j (* i 4)) 8 out_precision)))))
           (bvadd (ext-bv v-acc i out_precision) sum))))

;;<intrinsic tech="AVX-512" name="_mm_mask_dpwssds_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<CPUID>AVX512VL</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m128i" varname="dst" etype="SI32"/>
;;	<parameter type="__m128i" varname="src" etype="SI32"/>
;;	<parameter type="__mmask8" varname="k" etype="MASK"/>
;;	<parameter type="__m128i" varname="a" etype="SI16"/>
;;	<parameter type="__m128i" varname="b" etype="SI16"/>
;;	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
;;	<operation>
;;FOR j := 0 to 3
;;	IF k[j]
;;		tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
;;		tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
;;		dst.dword[j] := Saturate32(src.dword[j] + tmp1 + tmp2)
;;	ELSE
;;		dst.dword[j] := src.dword[j]
;;	FI
;;ENDFOR
;;dst[MAX:128] := 0
;;	</operation>
;;	<instruction name="VPDPWSSDS" form="xmm {k}, xmm, xmm" xed="VPDPWSSDS_XMMi32_MASKmskw_XMMi16_XMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
;; Valid Inputs: len = 4;red = 2;v-acc v1 v2 = 128-bit
(define (_mm_mask_dpwssds_epi32 src k a b len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define tmp
             (if (equal? (ext-bv k i 2) (bv 0 2))
                 (bv 0 32)
                 (apply bvadd
                        (for/list ([j (reverse (range red))])
                          (bvmul (sign-ext-bv a (+ j (* i 2)) 16 out_precision)
                                 (sign-ext-bv b (+ j (* i 2)) 16 out_precision))))))
           (bvadd (ext-bv src i out_precision) tmp))))

;;<intrinsic tech="AVX-512" name="_mm512_mask_dpwssd_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m512i" varname="dst" etype="SI32"/>
;;	<parameter type="__m512i" varname="src" etype="SI32"/>
;;	<parameter type="__mmask16" varname="k" etype="MASK"/>
;;	<parameter type="__m512i" varname="a" etype="SI16"/>
;;	<parameter type="__m512i" varname="b" etype="SI16"/>
;;	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
;;	<operation>
;;FOR j := 0 to 15
;;	IF k[j]
;;		tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
;;		tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
;;		dst.dword[j] := src.dword[j] + tmp1 + tmp2
;;	ELSE
;;		dst.dword[j] := src.dword[j]
;;	FI
;;ENDFOR
;;dst[MAX:512] := 0
;;	</operation>
;;	<instruction name="VPDPWSSD" form="zmm {k}, zmm, zmm" xed="VPDPWSSD_ZMMi32_MASKmskw_ZMMi16_ZMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm512_mask_dpwssd_epi32 src k a b len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define tmp
             (if (equal? (ext-bv k i 1) (bv 0 1))
                 (bv 0 32)
                 (apply bvadd
                        (for/list ([j (reverse (range red))])
                          (bvmul (sign-ext-bv a (+ j (* i 2)) 16 out_precision)
                                 (sign-ext-bv b (+ j (* i 2)) 16 out_precision))))))
           (bvadd (ext-bv src i out_precision) tmp))))

;;<intrinsic tech="AVX-512" name="_mm256_mask_dpwssd_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<CPUID>AVX512VL</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m256i" varname="dst" etype="SI32"/>
;;	<parameter type="__m256i" varname="src" etype="SI32"/>
;;	<parameter type="__mmask8" varname="k" etype="MASK"/>
;;	<parameter type="__m256i" varname="a" etype="SI16"/>
;;	<parameter type="__m256i" varname="b" etype="SI16"/>
;;	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
;;	<operation>
;;FOR j := 0 to 7
;;	IF k[j]
;;		tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
;;		tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
;;		dst.dword[j] := src.dword[j] + tmp1 + tmp2
;;	ELSE
;;		dst.dword[j] := src.dword[j]
;;	FI
;;ENDFOR
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPDPWSSD" form="ymm {k}, ymm, ymm" xed="VPDPWSSD_YMMi32_MASKmskw_YMMi16_YMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_mask_dpwssd_epi32 src k a b len red out_precision)
  (apply concat
         (for/list ([i (reverse (range len))])
           (define tmp
             (if (equal? (ext-bv k i 1) (bv 0 1))
                 (bv 0 32)
                 (apply bvadd
                        (for/list ([j (reverse (range red))])
                          (bvmul (sign-ext-bv a (+ j (* i 2)) 16 out_precision)
                                 (sign-ext-bv b (+ j (* i 2)) 16 out_precision))))))
           (bvadd (ext-bv src i out_precision) tmp))))

(define (_mm256_add_epi8 a b)
  (define dst (bv 0 256))
  (define MAX (bv 0 1024))
  (apply concat
         (for/list ([j (in-range 0 32 1)])
           (define i (* j 8))
           (bvadd (extract (+ i 7) i a) (extract (+ i 7) i b)))))

(define (aa_mm256_add_epi8 a b)
  (define dst (bv 0 256))
  (define MAX (bv 0 1024))
  (apply bvor
         (for/list ([j (in-range 0 31 1)])
           (define i (* j 8))
           i
           (concat dst
                   (extract 255
                            0
                            (if (= i 0)
                                (concat dst
                                        (extract 255 (+ (+ i 7) 1) dst)
                                        (bvadd (extract (+ i 7) i a) (extract (+ i 7) i b)))
                                (concat dst
                                        (extract 255 (+ (+ i 7) 1) dst)
                                        (bvadd (extract (+ i 7) i a) (extract (+ i 7) i b))
                                        (extract (- i 1) 0 dst))))))))

(define (aaINTERLEAVE_HIGH_QWORDS_mm256_unpackhi_pd src1 src2)
  (define dst (bv 0 1024))
  (define dst0 (concat (extract 63 0 dst) (extract 127 64 src1)))
  dst0
  (define dst1 (concat (extract 127 64 dst0) (extract 127 64 src2)))
  dst1
  (extract 127 0 dst1))
(define (aa_mm256_unpackhi_pd a b)
  (define dst (bv 0 256))
  (define MAX (bv 0 1024))
  (define dst0
    (concat (extract 127 0 dst)
            (INTERLEAVE_HIGH_QWORDS_mm256_unpackhi_pd (extract 127 0 a) (extract 127 0 b))))
  dst0
  (define dst1
    (concat (extract 255 128 dst0)
            (INTERLEAVE_HIGH_QWORDS_mm256_unpackhi_pd (extract 255 128 a) (extract 255 128 b))))
  dst1)

(define (INTERLEAVE_HIGH_QWORDS_mm256_unpackhi_pd src1 src2)
  (define dst (bv 0 1024))
  (define dst0 (concat (extract 1023 64 dst) (extract 127 64 src1)))
  dst0
  (define dst1 (concat (extract 1023 128 dst0) (extract 127 64 src2) (extract 63 0 dst0)))
  dst1
  (extract 127 0 dst1))
(define (_mm256_unpackhi_pd a b)
  (define dst (bv 0 256))
  (define MAX (bv 0 1024))
  (define dst0
    (concat (extract 255 128 dst)
            (INTERLEAVE_HIGH_QWORDS_mm256_unpackhi_pd (extract 127 0 a) (extract 127 0 b))))
  dst0
  (define dst1
    (concat (INTERLEAVE_HIGH_QWORDS_mm256_unpackhi_pd (extract 255 128 a) (extract 255 128 b))
            (extract 127 0 dst0)))
  dst1)

;; Test the semantics
(define a128 (bv #x00010001000100010001000100010001 128))
(define b128 (bv #x00020003000200030002000300020003 128))
(define src128 (bv 0 128))
(define mask8 (bv #x0f 8))

(define a256 (bv #x0009000100010001000100010001000100010001000100010001000100010009 256))
(define b256 (bv #x0002000300020003000200030002000300020003000200030002000300020003 256))
(define c256 (bv #x0000000000000000000000000000000000000000000000000000000000000000 256))
(define src256 (bv 0 256))
(define mask16 (bv #x0f0f 16))

(define a512
  (bv
   #x00010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001
   512))
(define b512
  (bv
   #x00020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003
   512))
(define src512 (bv 0 512))
(define mask128 (bv #x00010100000101000001010000010100 128))

(define a1024
  (bv
   #x0001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001
   1024))
(define b1024
  (bv
   #x0001000100020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003
   1024))
(define src1024 (bv 0 1024))

(define (res)
  (pretty-print (_mm_mask_dpwssds_epi32 src128 mask8 a128 b128 4 2 32))
  (pretty-print "Before")
  (pretty-print a256)
  (pretty-print b256)
  (pretty-print (_mm256_unpackhi_pd a256 b256))
  (pretty-print (extract 0 0 a256))
  (pretty-print "After")

  (pretty-print "Before-ADD")
  (pretty-print a256)
  (pretty-print b256)
  (pretty-print (_mm256_add_epi8 a256 b256))
  (pretty-print "After-ADD")
  (pretty-print (_mm512_dpwssd_epi32 src512 a512 b512 16 2 32))
  (pretty-print (_mm512_mask_dpwssd_epi32 src512 mask16 a512 b512 16 2 32))
  (pretty-print (_mm256_dpwssd_epi32 src256 a256 b256 8 2 32))
  (pretty-print (_mm256_mask_dpwssd_epi32 src256 mask8 a256 b256 8 2 32))
  (pretty-print (_mm512_dpbusd_epi32 src512 a512 b512 16 4))
  (pretty-print (_mm256_dpbusd_epi32 src256 a256 b256 8 4))
  (pretty-print (hvx_vrmpy src1024 a1024 b1024 32 4 32))
  (pretty-print (hvx_vrmpy2 src1024 a1024 b1024 32 4 32))
  (pretty-print (hvx_vrmpy3 src1024 a1024 b1024 32 4 32)))

(res)