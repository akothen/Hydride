

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


