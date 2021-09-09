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
(define (_mm512_dpbusds_epi32 src a b)
  (apply
   concat
   (for/list ([j (range 16)])
     (define tmp
       (apply
        bvadd
        (for/list ([k (range 4)])
          (bvmul (zero-ext-bv a (+ k (* j 4)) 8 16) (sign-ext-bv b (+ k (* j 4)) 8 16)))))
     (bvadd (ext-bv src i 32) (sign-extend tmp (bitvector 32))))))


;; HVX VRMPY 
;;for (i = 0; i < VELEM(32); i++) {
;;  Vx.w[i] += (Vu.uw[i].ub[0] * Vv.w[i].b[0]);
;;  Vx.w[i] += (Vu.uw[i].ub[1] * Vv.w[i].b[1]);
;;  Vx.w[i] += (Vu.uw[i].ub[2] * Vv.w[i].b[2]);
;;  Vx.w[i] += (Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;
;}
(define (hvx_vrmpy Vx Vu Vv)
  (apply
   concat
   (for/list ([i (range 32)])
     (define tmp
       (apply
        bvadd
        (for/list ([j (range 4)])
          (bvmul (zero-ext-bv Vu (+ j (* i 4)) 8 16) (sign-ext-bv Vv (+ j (* i 4)) 8 16)))))
     (bvadd (ext-bv Vx i 32) (sign-extend tmp (bitvector 32))))))

