
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



function _m_packsswb ( bv64 a, bv64 b ) {
 for ([%outer.it (range 0 64 64)]) {
  for ([iterator.0 (range 0 32 8)]) {
   %low.cofactor0 = mul int32 iterator.0, int32 2
   %hole.0 = call @hole.grammar.0(int32 %outer.it, int32 iterator.0, int32 %low.cofactor0)
   %high.offset0 = add int32 %hole.0, int32 15
   %0 = bvextract bv64 a, int32 %hole.0, int32 %high.offset0, int32 16
   %1 = bvssat bv16 %0, int32 8
   %high.offset1 = add int32 iterator.0, int32 7
   bvinsert bv8 %1, bv64 dst, int32 iterator.0, int32 %high.offset1, int32 8
  }
  for ([iterator.1 (range 32 64 8)]) {
   %low.cofactor1 = mul int32 iterator.1, int32 2
   %low.offset0.new0 = sub int32 %low.cofactor1, int32 64
   %hole.1 = call @hole.grammar.1(int32 %outer.it, int32 iterator.1, int32 %low.offset0.new0)
   %high.offset2 = add int32 %hole.1, int32 15
   %8 = bvextract bv64 b, int32 %hole.1, int32 %high.offset2, int32 16
   %9 = bvssat bv16 %8, int32 8
   %high.offset3 = add int32 iterator.1, int32 7
   bvinsert bv8 %9, bv64 dst, int32 iterator.1, int32 %high.offset3, int32 8
  }
 }
 ret bv64 dst
}



(define-grammar (hole.grammar.0 a b c)
                [expr 
                  ( choose
                    a
                    b
                    c
                    0
                    1
                    (+ (expr) (expr))
                    (- (expr) (expr))
                    (/ (expr) (expr))
                    (* (expr) (expr))
                    )]
                )









function _mm256_unpackhi_epi16 ( bv256 a, bv256 b ) {
 function INTERLEAVE_HIGH_WORDS ( bv128 src1, bv128 src2 ) {
  %0 = bvextract bv128 src1, int32 64, int32 79, int32 16
  bvinsert bv16 %0, bv128 %dst0, int32 0, int32 15, int32 16
  %1 = bvextract bv128 src2, int32 64, int32 79, int32 16
  bvinsert bv16 %1, bv128 %dst0, int32 16, int32 31, int32 16
  %2 = bvextract bv128 src1, int32 80, int32 95, int32 16
  bvinsert bv16 %2, bv128 %dst0, int32 32, int32 47, int32 16
  %3 = bvextract bv128 src2, int32 80, int32 95, int32 16
  bvinsert bv16 %3, bv128 %dst0, int32 48, int32 63, int32 16
  %4 = bvextract bv128 src1, int32 96, int32 111, int32 16
  bvinsert bv16 %4, bv128 %dst0, int32 64, int32 79, int32 16
  %5 = bvextract bv128 src2, int32 96, int32 111, int32 16
  bvinsert bv16 %5, bv128 %dst0, int32 80, int32 95, int32 16
  %6 = bvextract bv128 src1, int32 112, int32 127, int32 16
  bvinsert bv16 %6, bv128 %dst0, int32 96, int32 111, int32 16
  %7 = bvextract bv128 src2, int32 112, int32 127, int32 16
  bvinsert bv16 %7, bv128 %dst0, int32 112, int32 127, int32 16
  ret bv128 %dst0
 }
 %0 = bvextract bv256 a, int32 0, int32 127, int32 128
 %1 = bvextract bv256 b, int32 0, int32 127, int32 128
 %2 = call INTERLEAVE_HIGH_WORDS( bv128 %0, bv128 %1 )
 bvinsert bv128 %2, bv256 dst, int32 0, int32 127, int32 128
 %3 = bvextract bv256 a, int32 128, int32 255, int32 128
 %4 = bvextract bv256 b, int32 128, int32 255, int32 128
 %5 = call INTERLEAVE_HIGH_WORDS( bv128 %3, bv128 %4 )
 bvinsert bv128 %5, bv256 dst, int32 128, int32 255, int32 128
 ret bv256 dst
}



function _mm256_unpackhi_epi16 ( bv256 a, bv256 b ) {
 function INTERLEAVE_HIGH_WORDS ( bv128 src1, bv128 src2 ) {
  for ([iterator.0 (range 0 128 32)]) {
   %low.cofactor0 = div int32 iterator.0, int32 2
   %low.offset0 = add int32 %low.cofactor0, int32 64
   %high.offset0 = add int32 %low.offset0, int32 15
   %0 = bvextract bv128 src1, int32 %low.offset0, int32 %high.offset0, int32 16
   %high.offset1 = add int32 iterator.0, int32 15
   bvinsert bv16 %0, bv128 %dst, int32 iterator.0, int32 %high.offset1, int32 16
   %low.cofactor1 = div int32 iterator.0, int32 2
   %low.offset1 = add int32 %low.cofactor1, int32 64
   %high.offset2 = add int32 %low.offset1, int32 15
   %1 = bvextract bv128 src2, int32 %low.offset1, int32 %high.offset2, int32 16
   %low.offset2 = add int32 iterator.0, int32 16
   %high.offset3 = add int32 %low.offset2, int32 15
   bvinsert bv16 %1, bv128 %dst, int32 %low.offset2, int32 %high.offset3, int32 16
  }
  ret bv128 %dst
 }
 for ([iterator.0 (range 0 256 128)]) {
  %high.offset4 = add int32 iterator.0, int32 127
  %0 = bvextract bv256 a, int32 iterator.0, int32 %high.offset4, int32 128
  %high.offset5 = add int32 iterator.0, int32 127
  %1 = bvextract bv256 b, int32 iterator.0, int32 %high.offset5, int32 128
  %2 = call INTERLEAVE_HIGH_WORDS( bv128 %0, bv128 %1 )
  %high.offset6 = add int32 iterator.0, int32 127
  bvinsert bv128 %2, bv256 dst, int32 iterator.0, int32 %high.offset6, int32 128
 }
 ret bv256 dst
}





function _mm256_unpackhi_epi16 ( bv256 a, bv256 b ) {
 for ([iterator.0 (range 0 256 128)]) {
  %high.offset4 = add int32 iterator.0, int32 127
  %0 = bvextract bv256 a, int32 iterator.0, int32 %high.offset4, int32 128
  %1 = bvextract bv256 b, int32 iterator.0, int32 %high.offset4, int32 128
  for ([iterator.0.site0 (range 0 128 32)]) {
   %low.cofactor0.site0 = div int32 iterator.0.site0, int32 2
   %low.offset0.site0 = add int32 %low.cofactor0.site0, int32 64
   %high.offset0.site0 = add int32 %low.offset0.site0, int32 15
   %0.copy.copy.0 = bvextract bv256 a, int32 iterator.0, int32 %high.offset4, int32 128
   %0.site0 = bvextract bv128 %0.copy.copy.0, int32 %low.offset0.site0, int32 %high.offset0.site0, int32 16
   %6 = add int32 iterator.0.site0, int32 15
   %high.offset1.site0 = add int32 iterator.0.site0, int32 15
   bvinsert bv16 %0.site0, bv256 dst, int32 iterator.0.site0, int32 %6, int32 16
   %1.copy.copy.0 = bvextract bv256 b, int32 iterator.0, int32 %high.offset4, int32 128
   %1.site0 = bvextract bv128 %1.copy.copy.0, int32 %low.offset0.site0, int32 %high.offset0.site0, int32 16
   %7 = add int32 %low.offset2.site0, int32 iterator.0
   %low.offset2.site0 = add int32 iterator.0.site0, int32 16
   %8 = add int32 %7, int32 15
   %high.offset3.site0 = add int32 %low.offset2.site0, int32 15
   bvinsert bv16 %1.site0, bv256 dst, int32 %7, int32 %8, int32 16
  }
 }
 ret bv256 dst
}





function _mm256_unpackhi_epi16 ( bv256 a, bv256 b, int32 %vectsize0, int32 %outerlanesize0, int32 %innerlaneoffset0, 
                                 int32 %innerlanesize0, int32 %elemsize0, int32 %arg0, int32 %alpha.arg0, int32 %arg1 ) {
 for ([iterator.0 (range 0 %vectsize0 %outerlanesize0)]) {
  for ([iterator.0.site0.new (range %innerlaneoffset0 %innerlanesize0 %elemsize0)]) {
   %factor0 = div int32 %elemsize0, int32 %elemsize0
   %factor1 = mul int32 %alpha.arg0, int32 %factor0
   iterator.0.site0.new.mul = mul int32 iterator.0.site0.new, int32 %factor1
   %low.offset0.site0 = add int32 iterator.0.site0.new, int32 %arg1
   %0.site0.new.low.idx = add int32 iterator.0, int32 %low.offset0.site0
   %lastidx1 = sub int32 %elemsize0, int32 1
   %0.site0.new.high.idx0 = add int32 %0.site0.new.low.idx, int32 %lastidx1
   %0.copy.copy.00.new = bvextract bv256 a, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 %elemsize0
   %lastidx2 = sub int32 %elemsize0, int32 1
   %6 = add int32 iterator.0.site0.new.mul, int32 %lastidx2
   bvinsert bv %0.copy.copy.00.new, bv256 dst, int32 iterator.0.site0.new.mul, int32 %6, int32 %elemsize0
   %1.copy.copy.00.new = bvextract bv256 b, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 %elemsize0
   %7 = add int32 %low.offset2.site0, int32 iterator.0
   %low.offset2.site0 = add int32 iterator.0.site0.new.mul, int32 %arg0
   %lastidx0 = sub int32 %elemsize0, int32 1
   %8 = add int32 %7, int32 %lastidx0
   bvinsert bv %1.copy.copy.00.new, bv256 dst, int32 %7, int32 %8, int32 %elemsize0
  }
 }
 ret bv256 dst
}




function _mm512_unpacklo_epi8 ( bv512 a, bv512 b ) {
 for ([iterator.0 (range 0 512 128)]) {
  %high.offset4 = add int32 iterator.0, int32 127
  %0 = bvextract bv512 a, int32 iterator.0, int32 %high.offset4, int32 128
  %1 = bvextract bv512 b, int32 iterator.0, int32 %high.offset4, int32 128
  for ([iterator.0.site0 (range 0 128 16)]) {
   %low.cofactor0.site0 = div int32 iterator.0.site0, int32 2
   %high.offset0.site0 = add int32 %low.cofactor0.site0, int32 7
   %0.copy.copy.0 = bvextract bv512 a, int32 iterator.0, int32 %high.offset4, int32 128
   %0.site0 = bvextract bv128 %0.copy.copy.0, int32 %low.cofactor0.site0, int32 %high.offset0.site0, int32 8
   %12 = add int32 iterator.0.site0, int32 7
   %high.offset1.site0 = add int32 iterator.0.site0, int32 7
   bvinsert bv8 %0.site0, bv512 dst, int32 iterator.0.site0, int32 %12, int32 8
   %1.copy.copy.0 = bvextract bv512 b, int32 iterator.0, int32 %high.offset4, int32 128
   %1.site0 = bvextract bv128 %1.copy.copy.0, int32 %low.cofactor0.site0, int32 %high.offset0.site0, int32 8
   %13 = add int32 %low.offset0.site0, int32 iterator.0
   %low.offset0.site0 = add int32 iterator.0.site0, int32 8
   %14 = add int32 %13, int32 7
   %high.offset3.site0 = add int32 %low.offset0.site0, int32 7
   bvinsert bv8 %1.site0, bv512 dst, int32 %13, int32 %14, int32 8
  }
 }
 ret bv512 dst
}








function _mm256_unpackhi_epi16 ( bv256 a, bv256 b ) {
 for ([iterator.0 (range 0 256 128)]) {
  for ([iterator.0.site0 (range 0 128 32)]) {
   %low.cofactor0.site0 = div int32 iterator.0.site0, int32 2
   %low.offset0.site0 = add int32 %low.cofactor0.site0, int32 64
   %0.site0.new.low.idx = add int32 iterator.0, int32 %low.offset0.site0
   %0.site0.new.high.idx0 = add int32 %0.site0.new.low.idx, int32 15
   %0.copy.copy.00.new = bvextract bv256 a, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 16
   %6 = add int32 iterator.0.site0, int32 15
   bvinsert bv16 %0.copy.copy.00.new, bv256 dst, int32 iterator.0.site0, int32 %6, int32 16
   %1.copy.copy.00.new = bvextract bv256 b, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 16
   %7 = add int32 %low.offset2.site0, int32 iterator.0
   %low.offset2.site0 = add int32 iterator.0.site0, int32 16
   %8 = add int32 %7, int32 15
   bvinsert bv16 %1.copy.copy.00.new, bv256 dst, int32 %7, int32 %8, int32 16
  }
 }
 ret bv256 dst
}


function _mm512_unpacklo_epi8 ( bv512 a, bv512 b ) {
 for ([iterator.0 (range 0 512 128)]) {
  for ([iterator.0.site0 (range 0 128 16)]) {
   %low.cofactor0.site0 = div int32 iterator.0.site0, int32 2
   %0.site0.new.low.idx = add int32 iterator.0, int32 %low.cofactor0.site0
   %0.site0.new.high.idx0 = add int32 %0.site0.new.low.idx, int32 7
   %0.copy.copy.00.new = bvextract bv512 a, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 8
   %12 = add int32 iterator.0.site0, int32 7
   bvinsert bv8 %0.copy.copy.00.new, bv512 dst, int32 iterator.0.site0, int32 %12, int32 8
   %1.copy.copy.00.new = bvextract bv512 b, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 8
   %13 = add int32 %low.offset0.site0, int32 iterator.0
   %low.offset0.site0 = add int32 iterator.0.site0, int32 8
   %14 = add int32 %13, int32 7
   bvinsert bv8 %1.copy.copy.00.new, bv512 dst, int32 %13, int32 %14, int32 8
  }
 }
 ret bv512 dst
}






function _mm256_unpackhi_epi16 ( bv256 a, bv256 b, int32 %vectsize0, int32 %outerlanesize0, int32 %innerlaneoffset0, 
                                 int32 %innerlanesize0, int32 %elemsize0, int32 %arg0, int32 %alpha.arg0, int32 %arg1 ) {
 for ([iterator.0 (range 0 %vectsize0 %outerlanesize0)]) {
  for ([iterator.0.site0.new (range %innerlaneoffset0 %innerlanesize0 %elemsize0)]) {
   %factor0 = div int32 %elemsize0, int32 %elemsize0
   %factor1 = mul int32 %alpha.arg0, int32 %factor0
   iterator.0.site0.new.mul = mul int32 iterator.0.site0.new, int32 %factor1
   %low.offset0.site0 = add int32 iterator.0.site0.new, int32 %arg1
   %0.site0.new.low.idx = add int32 iterator.0, int32 %low.offset0.site0
   %lastidx1 = sub int32 %elemsize0, int32 1
   %0.site0.new.high.idx0 = add int32 %0.site0.new.low.idx, int32 %lastidx1
   %0.copy.copy.00.new = bvextract bv256 a, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 %elemsize0
   %lastidx2 = sub int32 %elemsize0, int32 1
   %6 = add int32 iterator.0.site0.new.mul, int32 %lastidx2
   bvinsert bv %0.copy.copy.00.new, bv256 dst, int32 iterator.0.site0.new.mul, int32 %6, int32 %elemsize0
   %1.copy.copy.00.new = bvextract bv256 b, int32 %0.site0.new.low.idx, int32 %0.site0.new.high.idx0, int32 %elemsize0
   %7 = add int32 %low.offset2.site0, int32 iterator.0
   %low.offset2.site0 = add int32 iterator.0.site0.new.mul, int32 %arg0
   %lastidx0 = sub int32 %elemsize0, int32 1
   %8 = add int32 %7, int32 %lastidx0
   bvinsert bv %1.copy.copy.00.new, bv256 dst, int32 %7, int32 %8, int32 %elemsize0
  }
 }
 ret bv256 dst
}








function _mm512_mask_mov_epi8 ( bv512 src, bv64 k, bv512 a ) {
 for ([j0 (range 0 64 1)]) {
  %0 = mul int32 j0, int32 8
  %1 = bvextract bv64 k, int32 j0, int32 j0, int32 1
  if (bv1 %1) {
   %3 = add int32 %0, int32 7
   %4 = bvextract bv512 a, int32 %0, int32 %3, int32 8
   bvinsert bv8 %4, bv512 dst, int32 %0, int32 %3, int32 8
  } else {
   %7 = add int32 %0, int32 7
   %8 = bvextract bv512 src, int32 %0, int32 %7, int32 8
   bvinsert bv8 %8, bv512 dst, int32 %0, int32 %7, int32 8
  }
 }
 ret bv512 dst
}

function _mm512_mask_blend_epi8 ( bv64 k, bv512 a, bv512 b ) {
 for ([j0 (range 0 64 1)]) {
  %0 = mul int32 j0, int32 8
  %1 = bvextract bv64 k, int32 j0, int32 j0, int32 1
  if (bv1 %1) {
   %3 = add int32 %0, int32 7
   %4 = bvextract bv512 b, int32 %0, int32 %3, int32 8
   bvinsert bv8 %4, bv512 dst, int32 %0, int32 %3, int32 8
  } else {
   %7 = add int32 %0, int32 7
   %8 = bvextract bv512 a, int32 %0, int32 %7, int32 8
   bvinsert bv8 %8, bv512 dst, int32 %0, int32 %7, int32 8
  }
 }
 ret bv512 dst
}










function _mm256_unpackhi_epi16 ( bv256 a, bv256 b, int32 %vectsize, int32 %outerlanesize, int32 %laneoffset, 
                                    int32 %innerlanesize, int32 %elemsize, int32 %arg0, int32 %alpha.arg0) {
  for ([outer.it (range 0 %vectsize %outerlanesize)]) {
    for ([inner.it (range %laneoffset %innerlanesize %elemsize)]) {
      %factor0 = div int32 %elemsize, int32 %elemsize
      %factor1 = mul int32 %alpha.arg0, int32 %factor0
      inner.it.mul = mul int32 inner.it, int32 %factor1
      %low.offset0 = add int32 inner.it, int32 %arg1
      %0.low.idx = add int32 outer.it, int32 %low.offset0
      %hole = call @hole.grammar(int32 outer.it, int32 inner.it, int32 %0.low.idx)
      %lastidx1 = sub int32 %elemsize, int32 1
      %0.high.idx = add int32 %hole , int32 %lastidx1
      %0 = bvextract bv256 a, int32 %hole, int32 %0.high.idx, int32 %elemsize
      %lastidx2 = sub int32 %elemsize, int32 1
      %6 = add int32 inner.it.mul, int32 %lastidx2
      bvinsert bv %0, bv256 dst, int32 inner.it.mul, int32 %6, int32 %elemsize
      %1 = bvextract bv256 b, int32 %hole, int32 %0.high.idx, int32 %elemsize
      %low.offset1 = add int32 inner.it.mul, int32 %arg0
      %7 = add int32 %low.offset1, int32 outer.it
      %lastidx0 = sub int32 %elemsize, int32 1
      %8 = add int32 %7, int32 %lastidx0
      bvinsert bv %1, bv256 dst, int32 %7, int32 %8, int32 %elemsize
    }
  }
  ret bv256 dst
}




