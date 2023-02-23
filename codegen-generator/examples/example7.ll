

function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([%j (range 0 16 1)]) {
  %0 = mul int32 4, int32 %j
  %1 = mul int32 8, int32 %0
  %2 = add int32 %1, int32 7
  ;; Extract slice from a
  %3 = bvextract bv512 a, int32 %1, int32 %2, int32 8
  %4 = bvzeroextend bv8 %3, int32 16
  %5 = mul int32 4, int32 %j
  %6 = mul int32 8, int32 %5
  %7 = add int32 %6, int32 7
  ;; Extract slice from b
  %8 = bvextract bv512 b, int32 %6, int32 %7, int32 8
  %9 = bvsignextend bv8 %8, int32 16
  %10 = bvmul bv16 %4, bv16 %9
  %11 = bvsignextend bv16 %10, int32 32
  ...
  %54 = mul int32 32, int32 %j
  %55 = add int32 %54, int32 31
  ;; Extract slice from src
  %56 = bvextract bv512 src, int32 %54, int32 %55, int32 32
  %57 = bvadd bv32 %56, bv32 %11
  %58 = bvadd bv32 %57, bv32 %25
  %59 = bvadd bv32 %58, bv32 %39
  %60 = bvadd bv32 %59, bv32 %53
  %61 = mul int32 32, int32 %j
  %62 = add int32 %61, int32 31
  ;; Insert dot product result in a slice in dst
  bvinsert bv32 %60, bv512 %dst, int32 %61, int32 %62, int32 32
 }
 ret bv512 %dst
}





function hexagon_V6_vrmpybusv_acc_128B ( bv1024 Vx, bv1024 Vu, bv1024 Vv ) {
 for ([%i (range 0 32 1)]) {
  %0 = mul int32 32, int32 %i
  %1 = add int32 %0, int32 31
  ;; Extract slice from Vxx
  %2 = bvextract bv1024 Vx, int32 %0, int32 %1, int32 32
  %3 = mul int32 8, int32 0
  %4 = mul int32 32, int32 %i
  %5 = add int32 %3, int32 %4
  %6 = add int32 %5, int32 7
  ;; Extract slice from Vu
  %7 = bvextract bv1024 Vu, int32 %5, int32 %6, int32 8
  %8 = mul int32 8, int32 0
  %9 = mul int32 32, int32 %i
  %10 = add int32 %8, int32 %9
  %11 = add int32 %10, int32 7
  ;; Extract slice from Vv
  %12 = bvextract bv1024 Vv, int32 %10, int32 %11, int32 8
  %13 = bvzeroextend bv8 %7, int32 16
  %14 = bvsignextend bv8 %12, int32 16
  %15 = bvmul bv16 %13, bv16 %14
  %16 = bvsignextend bv16 %15, int32 32
  %17 = bvadd bv32 %2, bv32 %16
  ...
  %78 = mul int32 32, int32 %i
  %79 = add int32 %78, int32 31
  ;; Add dot product result in a slice of dst
  bvinsert bv32 %77, bv1024 %dst, int32 %78, int32 %79, int32 32
 }
 ret bv1024 %dst
}


function hexagon_V6_vrmpybusv_acc_128B ( bv1024 Vx, bv1024 Vu, bv1024 Vv ) {
 for ([%i (range 0 32 1)]) {
  %low.idx = mul int32 32, int32 %i
  %high.idx  = add int32 %low.idx, int32 31
  %acc = bvextract bv1024 Vx, int32 %low.idx, int32 %high.idx, int32 32
  bvinsert bv32 %acc, bv1024 %dst, int32 %low.idx, int32 %high.idx, int32 32
  for ([%inner.it (range 0 4 1)]) {
   %3 = mul int32 8, int32 %inner.it
   %4 = mul int32 32, int32 %i
   %5 = add int32 %3, int32 %4
   %6 = add int32 %5, int32 7
   %7 = bvextract bv1024 Vu, int32 %5, int32 %6, int32 8
   %12 = bvextract bv1024 Vv, int32 %5, int32 %6, int32 8
   %13 = bvzeroextend bv8 %7, int32 16
   %14 = bvsignextend bv8 %12, int32 16
   %15 = bvmul bv16 %13, bv16 %14
   %16 = bvsignextend bv16 %15, int32 32
   %high = add int32 %4, int32 31
   %16.ext = bvextract bv1024 %dst, int32 %4, int32 %high, int32 32
   %16.acc = bvadd bv32 %16.ext, bv32 %16
   bvinsert bv32 %16.acc, bv1024 %dst, int32 %4, int32 %high, int32 32
  }
 }
 ret bv1024 %dst
}



function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([%j (range 0 16 1)]) {
  %low.idx = mul int32 32, int32 %j
  %high.idx = add int32 %low.idx, int32 31
  %acc = bvextract bv512 src, int32 %low.idx, int32 %high.idx, int32 32
  bvinsert bv32 %acc, bv512 dst, int32 %low.idx, int32 %high.idx, int32 32
  for ([%inner.it (range 0 4 1)]) {
   %0 = mul int32 4, int32 %j
   %0.fact = add int32 %0, int32 %inner.it
   %1 = mul int32 8, int32 %0.fact
   %2 = add int32 %1, int32 7
   %3 = bvextract bv512 a, int32 %1, int32 %2, int32 8
   %4 = bvzeroextend bv8 %3, int32 16
   %8 = bvextract bv512 b, int32 %1, int32 %2, int32 8
   %9 = bvsignextend bv8 %8, int32 16
   %10 = bvmul bv16 %4, bv16 %9
   %11 = bvsignextend bv16 %10, int32 32
   %11.low = mul int32 32, int32 %j
   %11.high = add int32 %61.clone.4, int32 31
   %11.ext = bvextract bv512 %dst, int32 %11.low, int32 %11.high, int32 32
   %11.acc = bvadd bv32 %11.ext, bv32 %11
   bvinsert bv32 %11.acc, bv512 %dst, int32 %11.low, int32 %11.high,, int32 32
  }
 }
 ret bv512 %dst
}



function hexagon_V6_vrmpybusv_acc_128B ( bv1024 Vx, bv1024 Vu, bv1024 Vv ) {
 for ([%outer.it (range 0 1024 32)]) {
  %high = add int32 %outer.it, int32 31
  %acc = bvextract bv1024 Vx, int32 %outer.it, int32 %high, int32 32
  bvinsert bv32 %acc, bv1024 %dst, int32 %outer.it, int32 %high, int32 32
  for ([%inner.it (range 0 32 8)]) {
   %5 = add int32 %inner.it, int32 %outer.it
   %6 = add int32 %5, int32 7
   %7 = bvextract bv1024 Vu, int32 %5, int32 %6, int32 8
   %12 = bvextract bv1024 Vv, int32 %5, int32 %6, int32 8
   %13 = bvzeroextend bv8 %7, int32 16
   %14 = bvsignextend bv8 %12, int32 16
   %15 = bvmul bv16 %13, bv16 %14
   %16 = bvsignextend bv16 %15, int32 32
   %16.high.new = add int32 %outer.it, int32 31
   %16.ext = bvextract bv1024 %dst0, int32 %outer.it, int32 %16.high.new, int32 32
   %16.acc = bvadd bv32 %16.ext, bv32 %16
   bvinsert bv32 %16.acc, bv1024 %dst, int32 %outer.it, int32 %16.high.new, int32 32
  }
 }
 ret bv1024 %dst
}


function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([%outer.it (range 0 512 32)]) {
  %high = add int32 %outer.it, int32 31
  %acc = bvextract bv512 src, int32 %outer.it, int32 %high, int32 32
  bvinsert bv32 %acc, bv512 dst, int32 %outer.it, int32 %high, int32 32
  for ([%inner.it (range 0 32 8)]) {
   %1.low = add int32 %outer.it, int32 %inner.it
   %2 = add int32 %1.low, int32 7
   %3 = bvextract bv512 a, int32 %1.low, int32 %2, int32 8
   %4 = bvzeroextend bv8 %3, int32 16
   %8 = bvextract bv512 b, int32 %1.low, int32 %2, int32 8
   %9 = bvsignextend bv8 %8, int32 16
   %10 = bvmul bv16 %4, bv16 %9
   %11 = bvsignextend bv16 %10, int32 32
   %11.high.new = add int32 %outer.it, int32 31
   %11.ext = bvextract bv512 dst, int32 %outer.it, int32 %11.high.new, int32 32
   %11.acc = bvadd bv32 %11.ext, bv32 %11
   bvinsert bv32 %11.acc, bv512 dst, int32 %outer.it, int32 %11.high.new, int32 32
  }
 }
 ret bv512 dst
}




