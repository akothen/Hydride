

function _m_paddsb ( bv64 a, bv64 b ) {
 for ([j0 (range 0 8 1)]) {
  %0 = mul int32 j0, int32 8
  %1 = add int32 %0, int32 7
  %2 = bvextract bv64 a, int32 %0, int32 %1, int32 8
  %3 = bvextract bv64 b, int32 %0, int32 %1, int32 8
  %4 = bvadd nsw bv8 %2, bv8 %3
  bvinsert bv8 %4, bv64 dst, int32 %0, int32 %1, int32 8
 }
 ret bv64 dst
}

function _mm_add_pi8 ( bv64 a, bv64 b ) {
 for ([j0 (range 0 8 1)]) {
  %0 = mul int32 j0, int32 8
  %1 = add int32 %0, int32 7
  %2 = bvextract bv64 a, int32 %0, int32 %1, int32 8
  %3 = bvextract bv64 b, int32 %0, int32 %1, int32 8
  %4 = bvadd bv8 %2, bv8 %3
  bvinsert bv8 %4, bv64 dst, int32 %0, int32 %1, int32 8
 }
 ret bv64 dst
}



<intrinsic tech="AVX-512" name="_mm_mask_mov_epi32">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Move</category>
	<return type="__m128i" varname="dst" etype="UI32"/>
	<parameter type="__m128i" varname="src" etype="UI32"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="UI32"/>
	<description>Move packed 32-bit integers from "a" to "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 3
	i := j*32
	IF k[j]
		dst[i+31:i] := a[i+31:i]
	ELSE
		dst[i+31:i] := src[i+31:i]
	FI
ENDFOR
dst[MAX:128] := 0
	</operation>
	<instruction name="VMOVDQA32" form="xmm {k}, xmm" xed="VMOVDQA32_XMMu32_MASKmskw_XMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
function _mm_mask_mov_epi32 ( bv128 src, bv8 k, bv128 a ) {
 for ([j0 (range 0 4 1)]) {
  %0 = mul int32 j0, int32 32
  %1 = bvextract bv8 k, int32 j0, int32 j0, int32 1
  if (bv1 %1) {
   %3 = add int32 %0, int32 31
   %4 = bvextract bv128 a, int32 %0, int32 %3, int32 32
   %5 = add int32 %0, int32 31
   bvinsert bv32 %4, bv128 dst, int32 %0, int32 %5, int32 32
  } else {
   %7 = add int32 %0, int32 31
   %8 = bvextract bv128 src, int32 %0, int32 %7, int32 32
   %9 = add int32 %0, int32 31
   bvinsert bv32 %8, bv128 dst, int32 %0, int32 %9, int32 32
  }
 }
 ret bv128 dst
}


<intrinsic tech="AVX-512" name="_mm256_mask_cvtsepi32_epi8">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512F</CPUID>
	<category>Convert</category>
	<return type="__m128i" varname="dst" etype="SI8"/>
	<parameter type="__m128i" varname="src" etype="UI8"/>
	<parameter type="__mmask8" varname="k" etype="MASK"/>
	<parameter type="__m256i" varname="a" etype="SI32"/>
	<description>Convert packed signed 32-bit integers in "a" to packed 8-bit integers with signed saturation, and store the results in "dst" using writemask "k" (elements are copied from "src" when the corresponding mask bit is not set).</description>
	<operation>
FOR j := 0 to 7
	i := 32*j
	l := 8*j
	IF k[j]
		dst[l+7:l] := Saturate8(a[i+31:i])
	ELSE
		dst[l+7:l] := src[l+7:l]
	FI
ENDFOR
dst[MAX:64] := 0
	</operation>
	<instruction name="VPMOVSDB" form="xmm {k}, ymm" xed="VPMOVSDB_XMMi8_MASKmskw_YMMi32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
function _mm256_mask_cvtsepi32_epi8 ( bv128 src, bv8 k, bv256 a ) {
 for ([j0 (range 0 8 1)]) {
  %0 = mul int32 32, int32 j0
  %1 = mul int32 8, int32 j0
  %2 = bvextract bv8 k, int32 j0, int32 j0, int32 1
  if (bv1 %2) {
   %3 = add int32 %0, int32 31
   %4 = bvextract bv256 a, int32 %0, int32 %3, int32 32
   %5 = bvssat bv32 %4, int32 8
   %6 = add int32 %1, int32 7
   bvinsert bv8 %5, bv128 dst, int32 %1, int32 %6, int32 8
  } else {
   %8 = add int32 %1, int32 7
   %9 = bvextract bv128 src, int32 %1, int32 %8, int32 8
   %10 = add int32 %1, int32 7
   bvinsert bv8 %9, bv128 dst, int32 %1, int32 %10, int32 8
  }
 }
 ret bv128 dst
}





