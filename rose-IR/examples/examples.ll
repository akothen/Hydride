
function _mm256_unpacklo_epi8 ( %a, %b ) {
  function INTERLEAVE_BYTES ( %src1, %src2 ) {
    %1 = bvextract %src1, 0, 7, 8
    bvinsert %1, %dst, 0, 7, 8
    %2 = bvextract %src2, 0, 7, 8
    bvinsert %2, %dst, 8, 15, 8
    %3 = bvextract %src1, 8, 15, 8
    bvinsert %3, %dst, 16, 23, 8
    %4 = bvextract %src2, 8, 15, 8
    bvinsert %4, %dst, 24, 31, 8
    %5 = bvextract %src1, 16, 23, 8
    bvinsert %5, %dst, 32, 39, 8
    %6 = bvextract %src2, 16, 23, 8
    bvinsert %6, %dst, 40, 47, 8
    %7 = bvextract %src1, 24, 31, 8
    bvinsert %7, %dst, 48, 55, 8
    %8 = bvextract %src2, 24, 31, 8
    bvinsert %8, %dst, 56, 63, 8
    %9 = bvextract %src1, 32, 39, 8
    bvinsert %9, %dst, 64, 71, 8
    %10 = bvextract %src2, 32, 39, 8
    bvinsert %10, %dst, 72, 79, 8
    %11 = bvextract %src1, 40, 47, 8
    bvinsert %11, %dst, 80, 87, 8
    %12 = bvextract %src2, 40, 47, 8
    bvinsert %12, %dst, 88, 95, 8
    %13 = bvextract %src1, 48, 55, 8
    bvinsert %13, %dst, 96, 103, 8
    %14 = bvextract %src2, 48, 55, 8
    bvinsert %14, %dst, 104, 111, 8
    %15 = bvextract %src1, 56, 63, 8
    bvinsert %15, %dst, 112, 119, 8
    %16 = bvextract %src2, 56, 63, 8
    bvinsert %16, %dst, 120, 127, 8
    %17 = bvextract %dst, 0, 127, 128
    ret %17
  }
  %1 = bvextract %a, 0, 127, 128
  %2 = bvextract %b, 0, 127, 128
  %3 = call INTERLEAVE_BYTES(%1, %2)
  bvinsert %3, %dst, 0, 127, 128
  %4 = bvextract %a, 128, 255, 128
  %5 = bvextract %b, 128, 255, 128
  %6 = call INTERLEAVE_BYTES(%4, %5)
  bvinsert %6, %dst, 128, 255, 128
  ret %dst
}






function _mm256_unpacklo_epi8 ( %a %b ) {
  function INTERLEAVE_BYTES ( %src1 %src2 ) {
    (for ([%i (range 0 64 8)]) {
      %1 = add %i, 7
      %2 = bvextract %src1, %i, %1, 8
      %3 = add %i, 7
      bvinsert %2, %dst, %i, %3, 8
      %4 = add %i, 7
      %5 = bvextract %src2, %i, %4, 8
      %6 = add %i, 8
      %7 = add %6, 7
      bvinsert %5, %dst, %6, %7, 8
    }
    %17 = bvextract %dst, 0, 127, 128
    ret %17
  }
  for ([%i (range 0 256 128)]) {
    %1 = add %i, 127
    %2 = bvextract %a %i %1 128
    %3 = add %i, 127
    %4 = bvextract %b, %i, %3, 128
    %5 = call INTERLEAVE_BYTES(%2, %4)
    %6 = add %i 127
    bvinsert %5, %dst, %i, %6, 128
  }
  ret %dst
}





function _mm256_unpacklo_epi8 ( %a %b ) {
  function INTERLEAVE_BYTES ( %src1 %src2 ) {
    (for ([%i (range 0 64 8)]) {
      %1 = add %i, 7
      %2 = bvextract %src1, %i, %1, 8
      bvinsert %2, %dst, %i, %1, 8
      %5 = bvextract %src2, %i, %1, 8
      %6 = add %i, 8
      %7 = add %6, 7
      bvinsert %5, %dst, %6, %7, 8
    }
    %8 = bvextract %dst, 0, 127, 128
    ret %8
  }
  for ([%i (range 0 256 128)]) {
    %1 = add %i, 127
    %2 = bvextract %a %i %1 128
    %4 = bvextract %b, %i, %1, 128
    %5 = call INTERLEAVE_BYTES(%2, %4)
    bvinsert %5, %dst, %i, %1, 128
  }
  ret %dst
}




function _mm256_unpacklo_epi8 ( %a %b ) {
  for ([%i (range 0 256 128)]) {
    %1 = add %i, 127
    %2 = bvextract %a %i %1 128
    %4 = bvextract %b, %i, %1, 128
    %5 = call INTERLEAVE_BYTES(%2, %4)
    (for ([%j (range 0 64 8)]) {
      %6 = add %j, 7
      %7 = bvextract %2, %j, %6, 8
      bvinsert %7, %var, %j, %6, 8
      %8 = bvextract %4, %j, %6, 8
      %9 = add %j, 8
      %10 = add %9, 7
      bvinsert %8, %var, %9, %10, 8
    }
    %11 = bvextract %var, 0, 127, 128
    bvinsert %11, %dst, %i, %1, 128
  }
  ret %dst
}









