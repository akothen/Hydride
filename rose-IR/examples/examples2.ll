
;;<intrinsic tech="AVX2" name="_mm256_packs_epi32">
;;	<type>Integer</type>
;;	<CPUID>AVX2</CPUID>
;;	<category>Miscellaneous</category>
;;	<return type="__m256i" varname="dst" etype="SI16"/>
;;	<parameter type="__m256i" varname="a" etype="SI32"/>
;;	<parameter type="__m256i" varname="b" etype="SI32"/>
;;	<description>Convert packed signed 32-bit integers from "a" and "b" to packed 16-bit integers using signed saturation, and store the results in "dst".</description>
;;	<operation>
;; dst[15:0] := Saturate16(a[31:0])
;; dst[31:16] := Saturate16(a[63:32])
;; dst[47:32] := Saturate16(a[95:64])
;; dst[63:48] := Saturate16(a[127:96])
;; dst[79:64] := Saturate16(b[31:0])
;; dst[95:80] := Saturate16(b[63:32])
;; dst[111:96] := Saturate16(b[95:64])
;; dst[127:112] := Saturate16(b[127:96])
;; dst[143:128] := Saturate16(a[159:128])
;; dst[159:144] := Saturate16(a[191:160])
;; dst[175:160] := Saturate16(a[223:192])
;; dst[191:176] := Saturate16(a[255:224])
;; dst[207:192] := Saturate16(b[159:128])
;; dst[223:208] := Saturate16(b[191:160])
;; dst[239:224] := Saturate16(b[223:192])
;; dst[255:240] := Saturate16(b[255:224])
;;	</operation>
;;	<instruction name="VPACKSSDW" form="ymm, ymm, ymm" xed="VPACKSSDW_YMMqq_YMMqq_YMMqq"/>
;;	<header>immintrin.h</header>
;;</intrinsic>


function _mm256_packs_epi32 (bv256 a, bv256 b) {
  %1 = bvextract bv256 a, int32 0, int32 31, int32 32
  %2 = bvssat bv32 %1, int32 16
  bvinsert bv16 %2, bv256 dst, int32 0, int32 15, int32 16
  %3 = bvextract bv256 a, int32 32, int32 63, int32 32
  %4 = bvssat bv32 %3, int32 16
  bvinsert bv16 %4, bv256 dst, int32 16, int32 31, int32 16
  %5 = bvextract bv256 a, int32 64, int32 95, int32 32
  %6 = bvssat bv32 %5, int32 16
  bvinsert bv16 %6, bv256 dst, int32 32, int32 47, int32 16
  %7 = bvextract bv256 a, int32 96, int32 127, int32 32
  %8 = bvssat bv32 %7, int32 16
  bvinsert bv16 %8, bv256 dst, int32 48, int32 63, int32 16
  %9 = bvextract bv256 b, int32 0, int32 31, int32 32
  %10 = bvssat bv32 %9, int32 16
  bvinsert bv16 %10, bv256 dst, int32 64, int32 79, int32 16
  %11 = bvextract bv256 b, int32 32, int32 63, int32 32
  %12 = bvssat bv32 %11, int32 16
  bvinsert bv16 %12, bv256 dst, int32 80, int32 95, int32 16
  %13 = bvextract bv256 b, int32 64, int32 95, int32 32
  %14 = bvssat bv32 %13, int32 16
  bvinsert bv16 %14, bv256 dst, int32 96, int32 111, int32 16
  %15 = bvextract bv256 b, int32 96, int32 127, int32 32
  %16 = bvssat bv32 %15, int32 16
  bvinsert bv16 %16, bv256 dst, int32 112, int32 127, int32 16
  %17 = bvextract bv256 a, int32 128, int32 159, int32 32
  %18 = bvssat bv32 %17, int32 16
  bvinsert bv16 %18, bv256 dst, int32 128, int32 143, int32 16
  %19 = bvextract bv256 a, int32 160, int32 191, int32 32
  %20 = bvssat bv32 %19, int32 16
  bvinsert bv16 %20, bv256 dst, int32 144, int32 159, int32 16
  %21 = bvextract bv256 a, int32 192, int32 223, int32 32
  %22 = bvssat bv32 %21, int32 16
  bvinsert bv16 %22, bv256 dst, int32 160, int32 175, int32 16
  %23 = bvextract bv256 a, int32 224, int32 255, int32 32
  %24 = bvssat bv32 %23, int32 16
  bvinsert bv16 %24, bv256 dst, int32 176, int32 191, int32 16
  %25 = bvextract bv256 b, int32 128, int32 159, int32 32
  %26 = bvssat bv32 %25, int32 16
  bvinsert bv16 %26, bv256 dst, int32 192, int32 207, int32 16
  %27 = bvextract bv256 b, int32 160, int32 191, int32 32
  %28 = bvssat bv32 %27, int32 16
  bvinsert bv16 %28, bv256 dst, int32 208, int32 223, int32 16
  %29 = bvextract bv256 b, int32 192, int32 223, int32 32
  %30 = bvssat bv32 %29, int32 16
  bvinsert bv16 %30, bv256 dst, int32 224, int32 239, int32 16
  %31 = bvextract bv256 b, int32 224, int32 255, int32 32
  %32 = bvssat bv32 %31, int32 16
  bvinsert bv16 %32, bv256 dst, int32 240, int32 255, int32 16
  ret bv256 dst
}

function _mm256_packs_epi32 (bv256 a, bv256 b) {
  for ([%i.0 (range 0 64 16)]) {
    %1 = mul int32 %i.0, int32 2
    %2 = add int32 %1, int32 31
    %3 = bvextract bv256 a, int32 %1, int32 %2, int32 32
    %4 = bvssat bv32 %3, int32 16
    %5 = add int32 %i.0, int32 15
    bvinsert bv16 %4, bv256 dst, int32 %i.0, int32 %5, int32 16
  }
  for ([%i.1 (range 64 128 16)]) {
    %6 = mul int32 %i.1, int32 2
    %7 = add int32 %6, int32 -128
    %8 = add int32 %7, int32 31
    %9 = bvextract bv256 b, int32 %7, int32 %8, int32 32
    %10 = bvssat bv32 %9, int32 16
    %11 = add int32 %i.1, int32 15
    bvinsert bv16 %10, bv256 dst, int32 %i.1, int32 %11, int32 16
  }
  for ([%i.2 (range 128 192 16)]) {
    %12 = mul int32 %i.2, int32 2
    %13 = add int32 %12, int32 -128
    %14 = add int32 %13, int32 31
    %15 = bvextract bv256 a, int32 %13, int32 %14, int32 32
    %16 = bvssat bv32 %15, int32 16
    %17 = add int32 %i.2, int32 15
    bvinsert bv16 %16, bv256 dst, int32 %i.2, int32 %17, int32 16
  }
  for ([%i.3 (range 192 256 16)]) {
    %18 = mul int32 %i.3, int32 2
    %19 = add int32 %18, int32 -256
    %20 = add int32 %19, int32 31
    %21 = bvextract bv256 b, int32 %19, int32 %20, int32 32
    %22 = bvssat bv32 %21, int32 16
    %23 = add int32 %i.3, int32 15
    bvinsert bv16 %22, bv256 dst, int32 %i.3, int32 %23, int32 16
  }
  ret bv256 dst
}


function _mm256_packs_epi32 (bv256 a, bv256 b) {
  for ([%i.out (range 0 256 128)]) {
    for ([%i.0 (range 0 64 16)]) {
      %1 = mul i32 %i.out, i32 128
      %2 = mul int32 %i.0, int32 2
      %3 = add i32 %1, i32 %2
      %4 = add int32 %3, int32 31
      %5 = bvextract bv256 a, int32 %3, int32 %4, int32 32
      %6 = bvssat bv32 %5, int32 16
      %7 = add int32 %3, int32 15
      bvinsert bv16 %6, bv256 dst, int32 %3, int32 %7, int32 16
    }
    for ([%i.1 (range 64 128 16)]) {
      %8 = mul i32 %i.out, i32 128
      %9 = mul int32 %i.1, int32 2
      %10 = add i32 %9, i32 %8
      %11 = div i32 %i.out, i32 128
      %12 = mul i32 %11, i32 -128
      %13 = add i32 %10, i32 %12
      %14 = add int32 %13, int32 31
      %15 = bvextract bv256 b, int32 %13, int32 %14, int32 32
      %16 = bvssat bv32 %15, int32 16
      %17 = add int32 %13, int32 15
      bvinsert bv16 %6, bv256 dst, int32 %13, int32 %17, int32 16
    }
  }
  ret bv256 dst
}





