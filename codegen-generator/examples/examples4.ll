
function _mm256_mask_mov_epi16 ( bv256 src, bv16 k, bv256 a ) {
 for ([j0 (range 0 16 1)]) {
  %0 = mul int32 j0, int32 16
  %1 = bvextract bv16 k, int32 j0, int32 j0, int32 1
  if (bv1 %1) {
   %3 = add int32 %0, int32 15
   %4 = bvextract bv256 a, int32 %0, int32 %3, int32 16
   bvinsert bv16 %4, bv256 dst, int32 %0, int32 %3, int32 16
  } else {
   %7 = add int32 %0, int32 15
   %8 = bvextract bv256 src, int32 %0, int32 %7, int32 16
   bvinsert bv16 %8, bv256 dst, int32 %0, int32 %7, int32 16
  }
 }
 ret bv256 dst
}

function _mm_blend_epi16 ( bv128 a, bv128 b, bv8 imm8 ) {
 for ([j0 (range 0 8 1)]) {
  %0 = mul int32 j0, int32 16
  %1 = bvextract bv8 imm8, int32 j0, int32 j0, int32 1
  if (bv1 %1) {
   %3 = add int32 %0, int32 15
   %4 = bvextract bv128 b, int32 %0, int32 %3, int32 16
   %5 = add int32 %0, int32 15
   bvinsert bv16 %4, bv128 dst, int32 %0, int32 %5, int32 16
  } else {
   %7 = add int32 %0, int32 15
   %8 = bvextract bv128 a, int32 %0, int32 %7, int32 16
   %9 = add int32 %0, int32 15
   bvinsert bv16 %8, bv128 dst, int32 %0, int32 %9, int32 16
  }
 }
 ret bv128 dst
}

