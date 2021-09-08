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


;;<intrinsic tech="AVX-512" name="_mm_dpwssds_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX512_VNNI</CPUID>
;;	<CPUID>AVX512VL</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__m128i" varname="dst" etype="SI32"/>
;;	<parameter type="__m128i" varname="src" etype="SI32"/>
;;	<parameter type="__m128i" varname="a" etype="SI16"/>
;;	<parameter type="__m128i" varname="b" etype="SI16"/>
;;	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst".</description>
;;	<operation>
;;FOR j := 0 to 3
;;	tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
;;	tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
;;	dst.dword[j] := Saturate32(src.dword[j] + tmp1 + tmp2)
;;ENDFOR
;;dst[MAX:128] := 0
;;	</operation>
;;	<instruction name="VPDPWSSDS" form="xmm, xmm, xmm" xed="VPDPWSSDS_XMMi32_MASKmskw_XMMi16_XMMu32_AVX512"/>
;;	<header>immintrin.h</header>
;; Valid Inputs: len = 4;red = 2;v-acc v1 v2 = 128-bit
(define (_mm_dpwssds_epi32 v-acc v1 v2 len red)
  (apply
   concat
   (for/list ([i (range len)])
     (define sum
       (apply
        bvadd
        (for/list ([j (range red)])
          (bvmul (sign-ext-bv v1 (+ j (* i 2)) 16 32) (sign-ext-bv v2 (+ j (* i 2)) 16 32)))))
     (bvadd (ext-bv v-acc i 32) sum))))



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
(define (_mm_mask_dpwssds_epi32 src k a b len red)
  (apply
   concat
   (for/list ([i (range len)])
     (define tmp
       (if (equal? (ext-bv k i 8) (bv #x00 8))
         (bv 0 32)
         (apply
          bvadd
          (for/list ([j (range red)])
            (bvmul (sign-ext-bv a (+ j (* i 2)) 16 32) (sign-ext-bv b (+ j (* i 2)) 16 32))))))
     (bvadd (ext-bv src i 32) tmp))))





;; Test the semantics
(define a (bv #x00010001000100010001000100010001 128))
(define b (bv #x00020003000200030002000300020003 128))
(define src (bv #x00000000000000000000000000000000 128))
(define mask (bv #x00010100 32))

(define (res)
  (pretty-print	 (_mm_dpwssds_epi32 src a b 4 2))
  (pretty-print	 (_mm_mask_dpwssds_epi32 src mask a b 4 2))
 )

(res)
