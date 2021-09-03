#lang rosette

(require rosette/lib/synthax)

(define (vector-add v1 v2)
  (for/vector ([i v1] [j v2])
    (+ i j)))

;;<intrinsic tech="AVX2" name="_mm256_add_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX2</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m256i" varname="dst" etype="UI32"/>
;;	<parameter type="__m256i" varname="a" etype="UI32"/>
;;	<parameter type="__m256i" varname="b" etype="UI32"/>
;;	<description>Add packed 32-bit integers in "a" and "b", and store the results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 7
;;	i := j*32
;;	dst[i+31:i] := a[i+31:i] + b[i+31:i]
;;ENDFOR
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPADDD" form="ymm, ymm, ymm" xed="VPADDD_YMMqq_YMMqq_YMMqq"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_add_epi32 c a b )
  (assert (= (vector-length a) (vector-length b))
          "_mm256_add_epi32:length of vectors not equal")
  (for ([j 8])
    (define sum (+ (bitwise-bit-field (vector-ref a j) 0 32) (bitwise-bit-field (vector-ref b j) 0 32)))
    (vector-set! c j sum)))
    

;;<intrinsic tech="AVX2" name="_mm256_add_epi16">
;;	<type>Integer</type>
;;	<CPUID>AVX2</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m256i" varname="dst" etype="UI16"/>
;;	<parameter type="__m256i" varname="a" etype="UI16"/>
;;	<parameter type="__m256i" varname="b" etype="UI16"/>
;;	<description>Add packed 16-bit integers in "a" and "b", and store the results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 15
;;	i := j*16
;;	dst[i+15:i] := a[i+15:i] + b[i+15:i]
;;ENDFOR
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPADDW" form="ymm, ymm, ymm" xed="VPADDW_YMMqq_YMMqq_YMMqq"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_add_epi16 c a b )
  (assert (= (vector-length a) (vector-length b))
          "_mm256_add_epi32:length of vectors not equal")
  (for ([j (vector-length b)])
    (define sum (+ (bitwise-bit-field (vector-ref a j) 0 16) (bitwise-bit-field (vector-ref b j) 0 16)))
    (vector-set! c j sum)))

;; Vector add
(define (_mm256_add_epi32_1 c a b )
  (assert (= (vector-length a) (vector-length b))
          "_mm256_add_epi32:length of vectors not equal")
  (for ([j (vector-length b)])
    (define sum (+ (vector-ref a j) (vector-ref b j)))
    (vector-set! c j sum)))
     


;;<intrinsic tech="AVX-512" name="_mm512_dpbusds_epi32">
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
;;	dst.dword[j] := Saturate32(src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4)
;;ENDFOR
;;dst[MAX:512] := 0
;;	</operation>
;;	<instruction name="VPDPBUSDS" form="zmm, zmm, zmm" xed="VPDPBUSDS_ZMMi32_MASKmskw_ZMMu8_ZMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm512_dpbusds_epi32 v-acc v1 v2)
    (assert (= (vector-length v1) (vector-length v2))
          "_mm512_dpbusds_epi32: length of vectors not equal")
  (for ([i 16])
    (define sum
      (apply
       +
       (for/list ([j 4])
         (* (bitwise-bit-field (vector-ref v1 (+ j (* i 4))) 0 8) (bitwise-bit-field (vector-ref v2 (+ j (* i 4))) 0 8)))))
    (vector-set! c i (+ sum (vector-ref c i)))))


;;<intrinsic tech="AVX-512" name="_mm_dpwssd_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<CPUID>AVX512VL</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m128i" varname="dst" etype="SI32"/>
;;	<parameter type="__m128i" varname="src" etype="SI32"/>
;;	<parameter type="__m128i" varname="a" etype="SI16"/>
;;	<parameter type="__m128i" varname="b" etype="SI16"/>
;;	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src", and store the packed 32-bit results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 3
;;	tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
;;	tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
;;	dst.dword[j] := src.dword[j] + tmp1 + tmp2
;;ENDFOR
;;dst[MAX:128] := 0
;;	</operation>
;;	<instruction name="VPDPWSSD" form="xmm, xmm, xmm" xed="VPDPWSSD_XMMi32_MASKmskw_XMMi16_XMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm_dpwssd_epi32 v-acc v1 v2)
    (assert (= (vector-length v1) (vector-length v2))
          "_mm_dpwssd_epi32: length of vectors not equal")
  (for ([i 4])
    (define sum
      (apply
       +
       (for/list ([j 2])
         (* (bitwise-bit-field (vector-ref v1 (+ j (* i 2))) 0 16) (bitwise-bit-field (vector-ref v2 (+ j (* i 2))) 0 16)))))
    (vector-set! c i (+ sum (vector-ref c i)))))



;;<intrinsic tech="AVX-512" name="_mm256_maskz_dpbusds_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<CPUID>AVX512VL</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m256i" varname="dst" etype="SI32"/>
;;	<parameter type="__mmask8" varname="k" etype="MASK"/>
;;	<parameter type="__m256i" varname="src" etype="SI32"/>
;;	<parameter type="__m256i" varname="a" etype="UI8"/>
;;	<parameter type="__m256i" varname="b" etype="SI8"/>
;;	<description>Multiply groups of 4 adjacent pairs of unsigned 8-bit integers in "a" with corresponding signed 8-bit integers in "b", producing 4 intermediate signed 16-bit results. Sum these 4 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst" using zeromask "k" (elements are zeroed out when the corresponding mask bit is not set).</description>
;;	<operation>
;;FOR j := 0 to 7
;;	IF k[j]
;;		tmp1.word := Signed(ZeroExtend16(a.byte[4*j]) * SignExtend16(b.byte[4*j]))
;;		tmp2.word := Signed(ZeroExtend16(a.byte[4*j+1]) * SignExtend16(b.byte[4*j+1]))
;;		tmp3.word := Signed(ZeroExtend16(a.byte[4*j+2]) * SignExtend16(b.byte[4*j+2]))
;;		tmp4.word := Signed(ZeroExtend16(a.byte[4*j+3]) * SignExtend16(b.byte[4*j+3]))
;;		dst.dword[j] := Saturate32(src.dword[j] + tmp1 + tmp2 + tmp3 + tmp4)
;;	ELSE
;;		dst.dword[j] := 0
;;	FI
;;ENDFOR
;;dst[MAX:256] := 0
;;	</operation>
;;	<instruction name="VPDPBUSDS" form="ymm {z}, ymm, ymm" xed="VPDPBUSDS_YMMi32_MASKmskw_YMMu8_YMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;;</intrinsic>
(define (_mm256_maskz_dpbusds_epi32 v-acc v1 v2 mask)
    (assert (= (vector-length v1) (vector-length v2))
          "_mm512_dpbusds_epi32: length of vectors not equal")
  (for ([i 8])
    (define sum
      (if (zero? (vector-ref mask i))
       0
      (apply
       +
       (for/list ([j 4])
         (* (bitwise-bit-field (vector-ref v1 (+ j (* i 4))) 0 8) (bitwise-bit-field (vector-ref v2 (+ j (* i 4))) 0 8))))))
    (vector-set! c i (+ sum (vector-ref c i)))))



(define a (build-vector 32 add1))
(define b (build-vector 32 add1))
(define mask (build-vector 32 add1))
(define c (build-vector 8 add1))
(define (res v1 v2 mask1)
  (print (_mm256_maskz_dpbusds_epi32 c a b mask))
  (print c))

(print (res a b mask))











