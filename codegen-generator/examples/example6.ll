
function _mm256_packus_epi16 ( bv256 a, bv256 b ) {
 for ([iterator.lane (range 0 256 128)]) {
  for ([iterator.0 (range 0 64 8)]) {
   %low.cofactor0 = mul int32 iterator.0, int32 2
   %low.scaled.it0 = add int32 iterator.lane, int32 %low.cofactor0
   %high.offset0 = add int32 %low.scaled.it0, int32 15
   %0 = bvextract bv256 a, int32 %low.scaled.it0, int32 %high.offset0, int32 16
   %1 = bvusat bv16 %0, int32 8
   %low.scaled.it1 = add int32 iterator.lane, int32 iterator.0
   %high.offset1 = add int32 %low.scaled.it1, int32 7
   bvinsert bv8 %1, bv256 dst, int32 %low.scaled.it1, int32 %high.offset1, int32 8
  }
  for ([iterator.1 (range 64 128 8)]) {
   %low.cofactor1 = mul int32 iterator.1, int32 2
   %low.scaled.it2 = add int32 iterator.lane, int32 %low.cofactor1
   %low.offset0.new0 = sub int32 %low.scaled.it2, int32 128
   %high.offset2 = add int32 %low.offset0.new0, int32 15
   %16 = bvextract bv256 b, int32 %low.offset0.new0, int32 %high.offset2, int32 16
   %17 = bvusat bv16 %16, int32 8
   %low.scaled.it3 = add int32 iterator.lane, int32 iterator.1
   %high.offset3 = add int32 %low.scaled.it3, int32 7
   bvinsert bv8 %17, bv256 dst, int32 %low.scaled.it3, int32 %high.offset3, int32 8
  }
 }
 ret bv256 dst
}


function _m_packsswb ( bv64 a, bv64 b ) {
 for ([%outer.it (range 0 64 64)]) {
  for ([iterator.0 (range 0 32 8)]) {
   %low.cofactor0 = mul int32 iterator.0, int32 2
   %high.offset0 = add int32 %low.cofactor0, int32 15
   %0 = bvextract bv64 a, int32 %low.cofactor0, int32 %high.offset0, int32 16
   %1 = bvssat bv16 %0, int32 8
   %high.offset1 = add int32 iterator.0, int32 7
   bvinsert bv8 %1, bv64 dst, int32 iterator.0, int32 %high.offset1, int32 8
  }
  for ([iterator.1 (range 32 64 8)]) {
   %low.cofactor1 = mul int32 iterator.1, int32 2
   %low.offset0.new0 = sub int32 %low.cofactor1, int32 64
   %high.offset2 = add int32 %low.offset0.new0, int32 15
   %8 = bvextract bv64 b, int32 %low.offset0.new0, int32 %high.offset2, int32 16
   %9 = bvssat bv16 %8, int32 8
   %high.offset3 = add int32 iterator.1, int32 7
   bvinsert bv8 %9, bv64 dst, int32 iterator.1, int32 %high.offset3, int32 8
  }
 }
 ret bv64 dst
}
