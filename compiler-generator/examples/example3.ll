

function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([j0 (range 0 16 1)]) {
  %0 = mul int32 4, int32 j0
  %1 = mul int32 8, int32 %0
  %2 = add int32 %1, int32 7
  %3 = bvextract bv512 a, int32 %1, int32 %2, int32 8
  %4 = bvzeroextend bv8 %3, int32 16
  %5 = mul int32 4, int32 j0
  %6 = mul int32 8, int32 %5
  %7 = add int32 %6, int32 7
  %8 = bvextract bv512 b, int32 %6, int32 %7, int32 8
  %9 = bvsignextend bv8 %8, int32 16
  %10 = bvmul bv16 %4, bv16 %9
  %11 = bvsignextend bv16 %10, int32 32
  %12 = mul int32 4, int32 j0
  %13 = add int32 %12, int32 1
  %14 = mul int32 8, int32 %13
  %15 = add int32 %14, int32 7
  %16 = bvextract bv512 a, int32 %14, int32 %15, int32 8
  %17 = bvzeroextend bv8 %16, int32 16
  %18 = mul int32 4, int32 j0
  %19 = add int32 %18, int32 1
  %20 = mul int32 8, int32 %19
  %21 = add int32 %20, int32 7
  %22 = bvextract bv512 b, int32 %20, int32 %21, int32 8
  %23 = bvsignextend bv8 %22, int32 16
  %24 = bvmul bv16 %17, bv16 %23
  %25 = bvsignextend bv16 %24, int32 32
  %26 = mul int32 4, int32 j0
  %27 = add int32 %26, int32 2
  %28 = mul int32 8, int32 %27
  %29 = add int32 %28, int32 7
  %30 = bvextract bv512 a, int32 %28, int32 %29, int32 8
  %31 = bvzeroextend bv8 %30, int32 16
  %32 = mul int32 4, int32 j0
  %33 = add int32 %32, int32 2
  %34 = mul int32 8, int32 %33
  %35 = add int32 %34, int32 7
  %36 = bvextract bv512 b, int32 %34, int32 %35, int32 8
  %37 = bvsignextend bv8 %36, int32 16
  %38 = bvmul bv16 %31, bv16 %37
  %39 = bvsignextend bv16 %38, int32 32
  %40 = mul int32 4, int32 j0
  %41 = add int32 %40, int32 3
  %42 = mul int32 8, int32 %41
  %43 = add int32 %42, int32 7
  %44 = bvextract bv512 a, int32 %42, int32 %43, int32 8
  %45 = bvzeroextend bv8 %44, int32 16
  %46 = mul int32 4, int32 j0
  %47 = add int32 %46, int32 3
  %48 = mul int32 8, int32 %47
  %49 = add int32 %48, int32 7
  %50 = bvextract bv512 b, int32 %48, int32 %49, int32 8
  %51 = bvsignextend bv8 %50, int32 16
  %52 = bvmul bv16 %45, bv16 %51
  %53 = bvsignextend bv16 %52, int32 32
  %54 = mul int32 32, int32 j0
  %55 = add int32 %54, int32 31
  %56 = bvextract bv512 src, int32 %54, int32 %55, int32 32
  %57 = bvadd bv32 %56, bv32 %11
  %58 = bvadd bv32 %57, bv32 %25
  %59 = bvadd bv32 %58, bv32 %39
  %60 = bvadd bv32 %59, bv32 %53
  %61 = mul int32 32, int32 j0
  %62 = add int32 %61, int32 31
  bvinsert bv32 %60, bv512 dst, int32 %61, int32 %62, int32 32
 }
 ret bv512 dst
}


function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([j0 (range 0 16 1)]) {
  %54.clone.0 = mul int32 32, int32 j0
  %55.clone.0 = add int32 %54.clone.0, int32 31
  %56.clone.0 = bvextract bv512 src, int32 %54.clone.0, int32 %55.clone.0, int32 32
  bvinsert bv32 %56.clone.0, bv512 dst, int32 %54.clone.0, int32 %55.clone.0, int32 32
  for ([iterator.0 (range 0 4 1)]) {
   %0 = mul int32 4, int32 j0
   %0.new = add int32 %0, int32 iterator.0
   %1 = mul int32 8, int32 %0.new
   %2 = add int32 %1, int32 7
   %3 = bvextract bv512 a, int32 %1, int32 %2, int32 8
   %4 = bvzeroextend bv8 %3, int32 16
   %8 = bvextract bv512 b, int32 %1, int32 %2, int32 8
   %9 = bvsignextend bv8 %8, int32 16
   %10 = bvmul bv16 %4, bv16 %9
   %11 = bvsignextend bv16 %10, int32 32
   %61.clone.8 = mul int32 32, int32 j0
   %62.clone.4 = add int32 %61.clone.8, int32 31
   %11.ext0 = bvextract bv512 dst, int32 %61.clone.8, int32 %62.clone.4, int32 32
   %11.acc0 = bvadd bv32 %11.ext0, bv32 %11
   bvinsert bv32 %11.acc0, bv512 dst, int32 %61.clone.8, int32 %62.clone.4, int32 32
  }
 }
 ret bv512 dst
}


function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([j0.new (range 0 512 32)]) {
  %55.clone.0 = add int32 j0.new, int32 31
  %56.clone.0 = bvextract bv512 src, int32 j0.new, int32 %55.clone.0, int32 32
  bvinsert bv32 %56.clone.0, bv512 dst, int32 j0.new, int32 %55.clone.0, int32 32
  for ([iterator.0.new (range 0 32 8)]) {
   %1 = add int32 j0.new, int32 iterator.0.new
   %2 = add int32 %1, int32 7
   %3 = bvextract bv512 a, int32 %1, int32 %2, int32 8
   %4 = bvzeroextend bv8 %3, int32 16
   %8 = bvextract bv512 b, int32 %1, int32 %2, int32 8
   %9 = bvsignextend bv8 %8, int32 16
   %10 = bvmul bv16 %4, bv16 %9
   %11 = bvsignextend bv16 %10, int32 32
   %62.clone.4 = add int32 j0.new, int32 31
   %11.ext0 = bvextract bv512 dst, int32 j0.new, int32 %62.clone.4, int32 32
   %11.acc0 = bvadd bv32 %11.ext0, bv32 %11
   bvinsert bv32 %11.acc0, bv512 dst, int32 j0.new, int32 %62.clone.4, int32 32
  }
 }
 ret bv512 dst
}











function _mm_max_epi32 ( bv128 a, bv128 b ) {
 for ([j0 (range 0 4 1)]) {
  %0 = mul int32 j0, int32 32
  %1 = add int32 %0, int32 31
  %2 = bvextract bv128 a, int32 %0, int32 %1, int32 32
  %3 = add int32 %0, int32 31
  %4 = bvextract bv128 b, int32 %0, int32 %3, int32 32
  %5 = bvsmax bv32 %2, bv32 %4
  %6 = add int32 %0, int32 31
  bvinsert bv32 %5, bv128 dst, int32 %0, int32 %6, int32 32
 }
 ret bv128 dst
}


function _mm_max_epi32 ( bv128 a, bv128 b ) {
 for ([j0 (range 0 4 1)]) {
  %0 = mul int32 j0, int32 32
  %1 = add int32 %0, int32 31
  %2 = bvextract bv128 a, int32 %0, int32 %1, int32 32
  %3 = add int32 %0, int32 31
  %4 = bvextract bv128 b, int32 %0, int32 %3, int32 32
  %5 = bvsmax bv32 %2, bv32 %4
  %6 = add int32 %0, int32 31
  bvinsert bv32 %5, bv128 dst, int32 %0, int32 %6, int32 32
 }
 ret bv128 dst
}


function _mm_max_epi32 ( bv128 a, bv128 b ) {
 for ([j0 (range 0 4 1)]) {
  %0 = mul int32 j0, int32 32
  %1 = add int32 %0, int32 31
  %2 = bvextract bv128 a, int32 %0, int32 %1, int32 32
  %4 = bvextract bv128 b, int32 %0, int32 %1, int32 32
  %5 = bvsmax bv32 %2, bv32 %4
  bvinsert bv32 %5, bv128 dst, int32 %0, int32 %1, int32 32
 }
 ret bv128 dst
}




function _mm_max_epi32 ( bv128 a, bv128 b ) {
 for ([%outer.it (range 0 128 128)]) {
  for ([j0.new (range 0 128 32)]) {
   j0.new.div = div int32 j0.new, int32 32
   %1 = add int32 j0.new, int32 31
   %2 = bvextract bv128 a, int32 j0.new, int32 %1, int32 32
   %4 = bvextract bv128 b, int32 j0.new, int32 %1, int32 32
   %5 = bvsmax bv32 %2, bv32 %4
   bvinsert bv32 %5, bv128 dst, int32 j0.new, int32 %1, int32 32
  }
 }
 ret bv128 dst
}














