

function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([%j (range 0 16 1)]) {
  %0 = mul i32 4, i32 %j
  %1 = mul i32 8, i32 %0
  %2 = add i32 %1, i32 7
  ;; Extract slice from a
  %3 = bvextract bv512 a, i32 %1, i32 %2, i32 8
  %4 = bvzeroextend bv8 %3, i32 16
  %5 = mul i32 4, i32 %j
  %6 = mul i32 8, i32 %5
  %7 = add i32 %6, i32 7
  ;; Extract slice from b
  %8 = bvextract bv512 b, i32 %6, i32 %7, i32 8
  %9 = bvsignextend bv8 %8, i32 16
  %10 = bvmul bv16 %4, bv16 %9
  %11 = bvsignextend bv16 %10, i32 32
  ...
  %54 = mul i32 32, i32 %j
  %55 = add i32 %54, i32 31
  ;; Extract slice from src
  %56 = bvextract bv512 src, i32 %54, i32 %55, i32 32
  ...
  %57 = bvadd bv32 %56, bv32 %11
  %60 = bvadd bv32 %59, bv32 %53
  %61 = mul i32 32, i32 %j
  %62 = add i32 %61, i32 31
  ;; Insert dot product result in a slice in dst
  bvinsert bv32 %60, bv512 %dst, i32 %61, i32 %62, i32 32
 }
 ret bv512 %dst
}





function hvx_vrmpybusv_acc ( bv1024 Vx, bv1024 Vu, bv1024 Vv ) {
 for ([%i (range 0 32 1)]) {
 ...
  ;; Extract slice from Vxx
  %2 = bvextract bv1024 Vx, i32 %0, i32 %1, i32 32
  ...
  ;; Extract slice from Vu
  %7 = bvextract bv1024 Vu, i32 %5, i32 %6, i32 8
  ;; Extract slice from Vv
  %12 = bvextract bv1024 Vv, i32 %5, i32 %6, i32 8
  %13 = bvzeroextend bv8 %7, i32 16
  %14 = bvsignextend bv8 %12, i32 16
  %15 = bvmul bv16 %13, bv16 %14
  %16 = bvsignextend bv16 %15, i32 32
  %17 = bvadd bv32 %2, bv32 %16
  ...
  ;; Add dot product result in a slice of dst
  bvinsert bv32 %77, bv1024 %dst, i32 %78, i32 %79, i32 32
 }
 ret bv1024 %dst
}


function hvx_vrmpybusv_acc ( bv1024 Vx, bv1024 Vu, bv1024 Vv ) {
 for ([%i (range 0 32 1)]) {
  ...
  %acc = bvextract bv1024 Vx, i32 %low0, i32 %high0, i32 32
  bvinsert bv32 %acc, bv1024 %dst, i32 %low0, i32 %high0, i32 32
  for ([%inner.it (range 0 4 1)]) {
   ...
   %7 = bvextract bv1024 Vu, i32 %5, i32 %6, i32 8
   %12 = bvextract bv1024 Vv, i32 %5, i32 %6, i32 8
   %13 = bvzeroextend bv8 %7, i32 16
   %14 = bvsignextend bv8 %12, i32 16
   %15 = bvmul bv16 %13, bv16 %14
   %16 = bvsignextend bv16 %15, i32 32
   ...
   %16.ext = bvextract bv1024 %dst, i32 %4, i32 %high1, i32 32
   %16.acc = bvadd bv32 %16.ext, bv32 %16
   bvinsert bv32 %16.acc, bv1024 %dst, i32 %4, i32 %high1, i32 32
  }
 }
 ret bv1024 %dst
}



function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([%j (range 0 16 1)]) {
  ...
  %acc = bvextract bv512 src, i32 %low, i32 %high, i32 32
  bvinsert bv32 %acc, bv512 dst, i32 %low, i32 %high, i32 32
  for ([%inner.it (range 0 4 1)]) {
   ...
   %3 = bvextract bv512 a, i32 %1, i32 %2, i32 8
   %4 = bvzeroextend bv8 %3, i32 16
   %8 = bvextract bv512 b, i32 %1, i32 %2, i32 8
   %9 = bvsignextend bv8 %8, i32 16
   %10 = bvmul bv16 %4, bv16 %9
   %11 = bvsignextend bv16 %10, i32 32
   ...
   %12 = bvextract bv512 %dst, i32 %low1, i32 %high1, i32 32
   %13 = bvadd bv32 %12, bv32 %11
   bvinsert bv32 %13, bv512 %dst, i32 %low1, i32 %high1, i32 32
  }
 }
 ret bv512 %dst
}



function hvx_vrmpybusv_acc ( bv1024 Vx, bv1024 Vu, bv1024 Vv ) {
 for ([%outer.it (range 0 1024 32)]) {
  ...
  %acc = bvextract bv1024 Vx, i32 %outer.it, i32 %high, i32 32
  bvinsert bv32 %acc, bv1024 %dst, i32 %outer.it, i32 %high, i32 32
  for ([%inner.it (range 0 32 8)]) {
   ...
   %7 = bvextract bv1024 Vu, i32 %5, i32 %6, i32 8
   %12 = bvextract bv1024 Vv, i32 %5, i32 %6, i32 8
   %13 = bvzeroextend bv8 %7, i32 16
   %14 = bvsignextend bv8 %12, i32 16
   %15 = bvmul bv16 %13, bv16 %14
   %16 = bvsignextend bv16 %15, i32 32
   ...
   %16.ext = bvextract bv1024 %dst0, i32 %outer.it, i32 %high.new, i32 32
   %16.acc = bvadd bv32 %16.ext, bv32 %16
   bvinsert bv32 %16.acc, bv1024 %dst, i32 %outer.it, i32 %high.new, i32 32
  }
 }
 ret bv1024 %dst
}


function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([%out.it (range 0 512 32)]) {
  ...
  %acc = bvextract bv512 src, i32 %out.it, i32 %high, i32 32
  bvinsert bv32 %acc, bv512 dst, i32 %out.it, i32 %high, i32 32
  for ([%in.it (range 0 32 8)]) {
   ...
   %3 = bvextract bv512 a, i32 %1.low, i32 %2, i32 8
   %4 = bvzeroextend bv8 %3, i32 16
   %8 = bvextract bv512 b, i32 %1.low, i32 %2, i32 8
   %9 = bvsignextend bv8 %8, i32 16
   %10 = bvmul bv16 %4, bv16 %9
   %11 = bvsignextend bv16 %10, i32 32
   ...
   %12 = bvextract bv512 dst, i32 %out.it, i32 %high1, i32 32
   %13 = bvadd bv32 %12, bv32 %11
   bvinsert bv32 %13, bv512 dst, i32 %out.it, i32 %high1, i32 32
  }
 }
 ret bv512 dst
}





function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b, i32 %vectsize, 
                              i32 %outerlanesize, i32 %innerlaneoffset, 
                              i32 %innerlanesize, i32 %elemsize, i32 %extend_size) {
 for ([%outer.it (range 0 %vectsize %outerlanesize)]) {
  %lastidx0 = sub i32 %outerlanesize, i32 1
  %high = add i32 %outer.it, i32 %lastidx0
  %acc = bvextract bv512 src, i32 %outer.it, i32 %high, i32 %outerlanesize
  bvinsert bv32 %acc, bv512 dst, i32 %outer.it, i32 %high, i32 %outerlanesize
  for ([%inner.it (range %innerlaneoffset %innerlanesize %elemsize)]) {
   %1.low = add i32 %outer.it, i32 %inner.it
   %lastidx1 = sub i32 %elemsize, i32 1
   %2 = add i32 %1.low, i32 %lastidx1
   %3 = bvextract bv512 a, i32 %1.low, i32 %2, i32 %elemsize
   %4 = bvzeroextend bv8 %3, i32 %extend_size
   %8 = bvextract bv512 b, i32 %1.low, i32 %2, i32 %elemsize
   %9 = bvsignextend bv8 %8, i32 %extend_size
   %10 = bvmul bv16 %4, bv16 %9
   %11 = bvsignextend bv16 %10, i32 %outerlanesize
   %lastidx2 = sub i32 %outerlanesize, i32 1
   %high1 = add i32 %outer.it, i32 %lastidx2
   %11.ext = bvextract bv512 dst, i32 %outer.it, i32 %high1, i32 %outerlanesize
   %11.acc = bvadd bv32 %11.ext, bv32 %11
   bvinsert bv32 %11.acc, bv512 dst, i32 %outer.it, i32 %high1, i32 %outerlanesize
  }
 }
 ret bv512 dst
}


function hvx_vrmpybusv_acc (bv1024 Vx, bv1024 Vu, bv1024 Vv, i32 %vectsize, 
                                i32 %outerlanesize, i32 %innerlaneoffset,
                                i32 %innerlanesize, i32 %elemsize, i32 %extend_size ) {
 for ([%outer.it (range 0 %vectsize %outerlanesize)]) {
  ...
  %acc = bvextract bv1024 Vx, i32 %outer.it, i32 %high0, i32 %outerlanesize
  bvinsert bv32 %acc, bv1024 %dst, i32 %outer.it, i32 %high0, i32 %outerlanesize
  for ([%inner.it (range %innerlaneoffset %innerlanesize %elemsize)]) {
   ...
   %7 = bvextract bv1024 Vu, i32 %5, i32 %6, i32 %elemsize
   %12 = bvextract bv1024 Vv, i32 %5, i32 %6, i32 %elemsize
   %13 = bvzeroextend bv8 %7, i32 %extend_size
   %14 = bvsignextend bv8 %12, i32 %extend_size
   %15 = bvmul bv16 %13, bv16 %14
   %16 = bvsignextend bv16 %15, i32 %outerlanesize
   ...
   %16.ext = bvextract bv1024 %dst0, i32 %outer.it, i32 %high1, i32 %outerlanesize
   %16.acc = bvadd bv32 %16.ext, bv32 %16
   bvinsert bv32 %16.acc, bv1024 %dst, i32 %outer.it, i32 %high1, i32 %outerlanesize
  }
 }
 ret bv1024 %dst
}


function _mm512_dpbusd_epi32 ( bv512 src, bv512 a, bv512 b ) {
 for ([%j (range 0 16 1)]) {
  ...
  ;; Extract slice from a
  %3 = bvextract bv512 a, i32 %1, i32 %2, i32 8
  %4 = bvzeroextend bv8 %3, i32 16
  ;; Extract slice from b
  %8 = bvextract bv512 b, i32 %1, i32 %2, i32 8
  %9 = bvsignextend bv8 %8, i32 16
  %10 = bvmul bv16 %4, bv16 %9
  %11 = bvsignextend bv16 %10, i32 32
  ...
  ;; Extract slice from src
  %56 = bvextract bv512 src, i32 %54, i32 %55, i32 32
  ...
  %57 = bvadd bv32 %56, bv32 %11
  %60 = bvadd bv32 %59, bv32 %53
  ;; Insert dot product result in a slice in dst
  bvinsert bv32 %60, bv512 %dst, i32 %61, i32 %62, i32 32
 }
 ret bv512 %dst
}




