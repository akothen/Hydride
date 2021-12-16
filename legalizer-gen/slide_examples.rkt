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
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply
        bvadd
        (for/list ([j (reverse (range red))])
          (bvmul (sign-ext-bv v1 (+ j (* i 2)) 16 out_precision) (sign-ext-bv v2 (+ j (* i 2)) 16 out_precision)))))
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
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply
        bvadd
        (for/list ([j (reverse (range red))])
          (bvmul (sign-ext-bv v1 (+ j (* i 2)) 16 out_precision) (sign-ext-bv v2 (+ j (* i 2)) 16 out_precision)))))
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
       (apply
        bvadd
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
       (apply
        bvadd
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
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply
        bvadd
        (for/list ([j (reverse (range red))])
          (bvmul (zero-ext-bv v1 (+ j (* i 4)) 8 out_precision) (sign-ext-bv v2 (+ j (* i 4)) 8 out_precision)))))
     (bvadd (ext-bv v-acc i out_precision) (sign-extend sum (bitvector out_precision))))))


;;for (i = 0; i < VELEM(32); i++) {
;;  Vx.w[i] += (Vu.w[i].b[0] * Vv.w[i].b[0]);
;;  Vx.w[i] += (Vu.w[i].b[1] * Vv.w[i].b[1]);
;;  Vx.w[i] += (Vu.w[i].b[2] * Vv.w[i].b[2]);
;;  Vx.w[i] += (Vu.w[i].b[3] * Vv.w[i].b[3]);
;;}
(define (hvx_vrmpy2 v-acc v1 v2 len red out_precision)
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply
        bvadd
        (for/list ([j (reverse (range red))])
          (bvmul (sign-ext-bv v1 (+ j (* i 4)) 8 out_precision) (sign-ext-bv v2 (+ j (* i 4)) 8 out_precision)))))
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
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define sum
       (apply
        bvadd
        (for/list ([j (reverse (range red))])
          (bvmul (zero-ext-bv v1 (+ j (* i 4)) 8 out_precision) (zero-ext-bv v2 (+ j (* i 4)) 8 out_precision)))))
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
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define tmp
       (if (equal? (ext-bv k i 2) (bv 0 2))
         (bv 0 32)
         (apply
          bvadd
          (for/list ([j (reverse (range red))])
            (bvmul (sign-ext-bv a (+ j (* i 2)) 16 out_precision) (sign-ext-bv b (+ j (* i 2)) 16 out_precision))))))
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
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define tmp
       (if (equal? (ext-bv k i 1) (bv 0 1))
         (bv 0 32)
         (apply
          bvadd
          (for/list ([j (reverse (range red))])
            (bvmul (sign-ext-bv a (+ j (* i 2)) 16 out_precision) (sign-ext-bv b (+ j (* i 2)) 16 out_precision))))))
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
  (apply
   concat
   (for/list ([i (reverse (range len))])
     (define tmp
       (if (equal? (ext-bv k i 1) (bv 0 1))
         (bv 0 32)
         (apply
          bvadd
          (for/list ([j (reverse (range red))])
            (bvmul (sign-ext-bv a (+ j (* i 2)) 16 out_precision) (sign-ext-bv b (+ j (* i 2)) 16 out_precision))))))
     (bvadd (ext-bv src i out_precision) tmp))))



;;<intrinsic tech="AVX-512/KNC" sequence="TRUE" name="_mm512_reduce_add_epi64">
;;	<type>Integer</type>
;;	<CPUID>AVX512F/KNCNI</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__int64" varname="dst" etype="UI64"/>
;;	<parameter type="__m512i" varname="a" etype="UI64"/>
;;	<description>Reduce the packed 64-bit integers in "a" by addition. Returns the sum of all elements in "a".</description>
;;	<operation>
;;dst[63:0] := 0
;;FOR j := 0 to 7
;;	i := j*64
;;	dst[63:0] := dst[63:0] + a[i+63:i]
;;ENDFOR
;;	</operation>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm512_reduce_add_epi64 v)
  (define result
    (apply
     bvadd
     (for/list ([i (reverse (range 8))])
       (ext-bv v i 64))))
  result)



;; Interleave-low instruction
;;<intrinsic tech="AVX2" name="_mm256_unpacklo_epi8">
;;	<type>Integer</type>
;;	<CPUID>AVX2</CPUID>
;;	<category>Swizzle</category>
;;	<return type="__m256i" varname="dst" etype="UI8"/>
;;	<parameter type="__m256i" varname="a" etype="UI8"/>
;;	<parameter type="__m256i" varname="b" etype="UI8"/>
;;	<description>Unpack and interleave 8-bit integers from the low half of each 128-bit lane in "a" and "b", and store the results in "dst".</description>
;;	<operation>
;;DEFINE INTERLEAVE_BYTES(src1[127:0], src2[127:0]) {
;;	dst[7:0] := src1[7:0] 
;;	dst[15:8] := src2[7:0] 
;;	dst[23:16] := src1[15:8] 
;;	dst[31:24] := src2[15:8] 
;;	dst[39:32] := src1[23:16] 
;;	dst[47:40] := src2[23:16] 
;;	dst[55:48] := src1[31:24] 
;;	dst[63:56] := src2[31:24] 
;;	dst[71:64] := src1[39:32]
;;	dst[79:72] := src2[39:32] 
;;	dst[87:80] := src1[47:40] 
;;	dst[95:88] := src2[47:40] 
;;	dst[103:96] := src1[55:48] 
;;	dst[111:104] := src2[55:48] 
;;	dst[119:112] := src1[63:56] 
;;	dst[127:120] := src2[63:56] 
;;	RETURN dst[127:0]
;;}
;;dst[127:0] := INTERLEAVE_BYTES(a[127:0], b[127:0])
;;dst[255:128] := INTERLEAVE_BYTES(a[255:128], b[255:128])
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPUNPCKLBW" form="ymm, ymm, ymm" xed="VPUNPCKLBW_YMMqq_YMMqq_YMMqq"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_unpacklo_epi8 v1 v2)
  (define result
    (apply
     concat
     (for/list ([i (reverse (range 2))])
       (apply
        concat
        (for/list ([j (reverse (range 8 16))])
          (concat (ext-bv v1 (+ j (* i 16)) 8) (ext-bv v2 (+ j (* i 16)) 8))
         )
        )
       )
     )
    )
    result
)


;; Interleave-high instruction
;;<intrinsic tech="AVX2" name="_mm256_unpackhi_epi8">
;;	<type>Integer</type>
;;	<CPUID>AVX2</CPUID>
;;	<category>Swizzle</category>
;;	<return type="__m256i" varname="dst" etype="UI8"/>
;;	<parameter type="__m256i" varname="a" etype="UI8"/>
;;	<parameter type="__m256i" varname="b" etype="UI8"/>
;;	<description>Unpack and interleave 8-bit integers from the high half of each 128-bit lane in "a" and "b", and store the results in "dst".</description>
;;	<operation>
;;DEFINE INTERLEAVE_HIGH_BYTES(src1[127:0], src2[127:0]) {
;;	dst[7:0] := src1[71:64] 
;;	dst[15:8] := src2[71:64] 
;;	dst[23:16] := src1[79:72] 
;;	dst[31:24] := src2[79:72] 
;;	dst[39:32] := src1[87:80] 
;;	dst[47:40] := src2[87:80] 
;;	dst[55:48] := src1[95:88] 
;;	dst[63:56] := src2[95:88] 
;;	dst[71:64] := src1[103:96] 
;;	dst[79:72] := src2[103:96] 
;;	dst[87:80] := src1[111:104] 
;;	dst[95:88] := src2[111:104] 
;;	dst[103:96] := src1[119:112] 
;;	dst[111:104] := src2[119:112] 
;;	dst[119:112] := src1[127:120] 
;;	dst[127:120] := src2[127:120] 
;;	RETURN dst[127:0]	
;;}
;;dst[127:0] := INTERLEAVE_HIGH_BYTES(a[127:0], b[127:0])
;;dst[255:128] := INTERLEAVE_HIGH_BYTES(a[255:128], b[255:128])
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPUNPCKHBW" form="ymm, ymm, ymm" xed="VPUNPCKHBW_YMMqq_YMMqq_YMMqq"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_unpackhi_epi8 v1 v2)
  (define result
    (apply
     concat
     (for/list ([i (reverse (range 2))])
       (apply
        concat
        (for/list ([j (reverse (range 0 8))])
          (concat (ext-bv v1 (+ j (* i 16)) 8) (ext-bv v2 (+ j (* i 16)) 8))
         )
        )
       )
     )
    )
    result
)


<intrinsic tech="AVX-512" name="_mm512_unpackhi_epi32">
	<type>Integer</type>
	<CPUID>AVX512F</CPUID>
	<category>Swizzle</category>
	<return type="__m512i" varname="dst" etype="UI32"/>
	<parameter type="__m512i" varname="a" etype="UI32"/>
	<parameter type="__m512i" varname="b" etype="UI32"/>
	<description>Unpack and interleave 32-bit integers from the high half of each 128-bit lane in "a" and "b", and store the results in "dst".</description>
	<operation>
DEFINE INTERLEAVE_HIGH_DWORDS(src1[127:0], src2[127:0]) {
	dst[31:0] := src1[95:64] 
	dst[63:32] := src2[95:64] 
	dst[95:64] := src1[127:96] 
	dst[127:96] := src2[127:96] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_HIGH_DWORDS(a[127:0], b[127:0])
dst[255:128] := INTERLEAVE_HIGH_DWORDS(a[255:128], b[255:128])
dst[383:256] := INTERLEAVE_HIGH_DWORDS(a[383:256], b[383:256])
dst[511:384] := INTERLEAVE_HIGH_DWORDS(a[511:384], b[511:384])
dst[MAX:512] := 0
	</operation>
	<instruction name="VPUNPCKHDQ" form="zmm, zmm, zmm" xed="VPUNPCKHDQ_ZMMu32_MASKmskw_ZMMu32_ZMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
(define (_mm512_unpackhi_epi32 v1 v2)
  (define result
    (apply
     concat
     (for/list ([i (reverse (range 4))])
       (apply
        concat
        (for/list ([j (reverse (range 0 2))])
          (concat (ext-bv v1 (+ j (* i 8)) 32) (ext-bv v2 (+ j (* i 8)) 32))
         )
        )
       )
     )
    )
    result
)



(define (interleave v1 v2 num_lanes low_idx high_idex elem)
  (define result
    (apply
     concat
     (for/list ([i (reverse (range num_lanes))])
       (apply
        concat
        (for/list ([j (reverse (range low_idx high_idx))])
          (concat (ext-bv v1 (+ j (* i  num_lanes (- high_idx low_idx))) elem) (ext-bv v2 (+ j (* i num_lanes (- high_idx low_idx))) elem))
         )
        )
       )
     )
    )
    result
)


<intrinsic tech="AVX2" name="_mm256_packs_epi32">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="SI16"/>
	<parameter type="__m256i" varname="a" etype="SI32"/>
	<parameter type="__m256i" varname="b" etype="SI32"/>
	<description>Convert packed signed 32-bit integers from "a" and "b" to packed 16-bit integers using signed saturation, and store the results in "dst".</description>
	<operation>
dst[15:0] := Saturate16(a[31:0])
dst[31:16] := Saturate16(a[63:32])
dst[47:32] := Saturate16(a[95:64])
dst[63:48] := Saturate16(a[127:96])
dst[79:64] := Saturate16(b[31:0])
dst[95:80] := Saturate16(b[63:32])
dst[111:96] := Saturate16(b[95:64])
dst[127:112] := Saturate16(b[127:96])
dst[143:128] := Saturate16(a[159:128])
dst[159:144] := Saturate16(a[191:160])
dst[175:160] := Saturate16(a[223:192])
dst[191:176] := Saturate16(a[255:224])
dst[207:192] := Saturate16(b[159:128])
dst[223:208] := Saturate16(b[191:160])
dst[239:224] := Saturate16(b[223:192])
dst[255:240] := Saturate16(b[255:224])
dst[MAX:256] := 0
	</operation>
	<instruction name="VPACKSSDW" form="ymm, ymm, ymm" xed="VPACKSSDW_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
(define (_mm256_packs_epi32 v1 v2)
  (define result
    (apply
     concat
     (for/list ([i (range 2)])
       (apply
        concat
        (for/list ([j (range 4)])
          (SAT (ext-bv v1 (+ j (* 4 i)) 32) 16)
         )
        )
       (apply
        concat
        (for/list ([j (range 4)])
          (SAT (ext-bv v2 (+ j (* 4 i)) 32) 16)
         )
        )
       )
     )
    )
  result
)

(define (havx_pack v1 v2)
  (define result
    (apply
     concat
     (for/list ([i (range 16)])
       (apply
        concat
        (for/list ([j (range 1)])
          (SAT (ext-bv v1 (+ j (* 16 i)) 16) 8)
         )
        )
       (apply
        concat
        (for/list ([j (range 1)])
          (SAT (ext-bv v2 (+ j (* 16 i)) 16) 8)
         )
        )
       )
     )
    )
  result
)


;; Test the semantics
(define a128 (bv #x00010001000100010001000100010001 128))
(define b128 (bv #x00020003000200030002000300020003 128))
(define src128 (bv 0 128))
(define mask8 (bv #x0f 8))

(define a256 (bv #x0001000100010001000100010001000100010001000100010001000100010001 256))
(define b256 (bv #x0002000300020003000200030002000300020003000200030002000300020003 256))
(define src256 (bv 0 256))
(define mask16 (bv #x0f0f 16))

(define a512 (bv #x00010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001 512))
(define b512 (bv #x00020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003 512))
(define src512 (bv 0 512))
(define mask128 (bv #x00010100000101000001010000010100 128))

(define a1024 (bv #x0001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001 1024))
(define b1024 (bv #x0001000100020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003 1024))
(define src1024 (bv 0 1024))

(define (res)
  (pretty-print	 (_mm_mask_dpwssds_epi32 src128 mask8 a128 b128 4 2 32))
  
  (pretty-print  (_mm512_dpwssd_epi32 src512 a512 b512 16 2 32))
  (pretty-print	 (_mm512_mask_dpwssd_epi32 src512 mask16 a512 b512 16 2 32))
  (pretty-print  (_mm256_dpwssd_epi32 src256 a256 b256 8 2 32))
  (pretty-print  (_mm256_mask_dpwssd_epi32 src256 mask8 a256 b256 8 2 32))
  (pretty-print  (_mm512_dpbusd_epi32 src512 a512 b512 16 4))
  (pretty-print  (_mm256_dpbusd_epi32 src256 a256 b256 8 4))
  (pretty-print  (hvx_vrmpy src1024 a1024 b1024 32 4 32))
  (pretty-print  (hvx_vrmpy2 src1024 a1024 b1024 32 4 32))
  (pretty-print  (hvx_vrmpy3 src1024 a1024 b1024 32 4 32))
  (pretty-print (_mm256_unpacklo_epi8 a256 b256))
  (pretty-print (_mm256_unpackhi_epi8 a256 b256))
 )

(res)
