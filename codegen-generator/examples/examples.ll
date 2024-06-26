;; RAW ROSE IR
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



function _mm256_unpacklo_epi8 ( %a, %b ) {
  function INTERLEAVE_BYTES ( %src1, %src2 ) {
    %1 = bvextract %src1, 0, 7, 8
    bvinsert %1, %dst, 0, 7, 8
    %2 = bvextract %src2, 0, 7, 8
    bvinsert %2, %dst, 8, 15, 8
    ...
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




;; ROSE IR AFTER LOOP REROLLING
function _mm256_unpacklo_epi8 ( %a, %b ) {
  function INTERLEAVE_BYTES ( %src1, %src2 ) {
    for ([%i (range 0 64 8)]) {
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
    %2 = bvextract %a, %i, %1, 128
    %3 = add %i, 127
    %4 = bvextract %b, %i, %3, 128
    %5 = call INTERLEAVE_BYTES(%2, %4)
    %6 = add %i 127
    bvinsert %5, %dst, %i, %6, 128
  }
  ret %dst
}




;; ROSE IR AFTER CSE
function _mm256_unpacklo_epi8 ( %a, %b ) {
  function INTERLEAVE_BYTES ( %src1, %src2 ) {
    for ([%i (range 0 64 8)]) {
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
    %2 = bvextract %a, %i, %1, 128
    %4 = bvextract %b, %i, %1, 128
    %5 = call INTERLEAVE_BYTES(%2, %4)
    bvinsert %5, %dst, %i, %1, 128
  }
  ret %dst
}



;; ROSE IR AFTER FUNCTION INLINING
function _mm256_unpacklo_epi8 ( %a, %b ) {
  for ([%i (range 0 256 128)]) {
    %1 = add %i, 127
    %2 = bvextract %a, %i, %1, 128
    %4 = bvextract %b, %i, %1, 128
    for ([%j (range 0 64 8)]) {
      %5 = add %j, 7
      %6 = bvextract %2, %j, %5, 8
      bvinsert %6, %var, %j, %5, 8
      %7 = bvextract %4, %j, %5, 8
      %8 = add %j, 8
      %9 = add %8, 7
      bvinsert %7, %var, %8, %9, 8
    }
    %10 = bvextract %var, 0, 127, 128
    bvinsert %10, %dst, %i, %1, 128
  }
  ret %dst
}


;; Corresponding Rosette code
(define (_mm256_unpacklo_epi8 v1 v2)
  (define %dst
    (apply
     concat
     (for/list ([i (reverse (range 0 256 128))])
       (apply
        concat
        (for/list ([j (reverse (range 0 64 8))])
          (define %1 (+ i 127))
          (define %2 (extract %1 i v1))
          (define %4 (extract %1 i v2))
          (define %5 (+ j 7))
          (define %6 (extract %5 j %2))
          (define %7 (extract %5 j %4))
          (concat %6 %7)
         )
        )
       )
     )
    )
    %dst
)



;; Another example
function _mm512_unpackhi_epi32 ( %a, %b ) {
  for ([%i (range 0 512 128)]) {
    %1 = add %i, 127
    %2 = bvextract %a, %i, %1, 128
    %4 = bvextract %b, %i, %1, 128
    for ([%j (range 64 128 32)]) {
      %5 = add %j, 31
      %6 = bvextract %2, %j, %5, 32
      bvinsert %6, %var, %j, %5, 32
      %7 = bvextract %4, %j, %5, 32
      %8 = add %j, 32
      %9 = add %8, 31
      bvinsert %7, %var, %8, %9, 32
    }
    %10 = bvextract %var, 0, 127, 128
    bvinsert %10, %dst, %i, %1, 128
  }
  ret %dst
}


function _mm256_unpacklo_epi8 ( %a, %b, %offset, %vector_length, %lane_size, %precision ) {
  for ([%i (range 0 %vector_length %lane_size)]) {
    %lane_last_idx = sub %lane_size, 1
    %1 = add %i, %lane_last_idx
    %2 = bvextract %a, %i, %1, %lane_size
    %4 = bvextract %b, %i, %1, %lane_size
    for ([%j (range  %offset %lane_size %precision)]) {
      %elem_last_idx = sub %precision, 1 
      %5 = add %j, %elem_last_idx
      %6 = bvextract %2, %j, %5, %precision
      bvinsert %6, %var, %j, %5, %precision
      %7 = bvextract %4, %j, %5, %precision
      %8 = add %j, %precision
      %9 = add %8, %elem_last_idx
      bvinsert %7, %var, %8, %9, %precision
    }
    %10 = bvextract %var, 0, %lane_last_idx, %lane_size
    bvinsert %10, %dst, %i, %1, %lane_size
  }
  ret %dst
}

(define (_mm256_unpacklo_epi8 %a %b %offset %vector_length %lane_size %precision)
  (define %dst
    (apply
     concat
     (for/list ([i (reverse (range 0 %vector_length %lane_size))])
       (apply
        concat
        (for/list ([j (reverse (range %offset %lane_size %precision))])
          (define %1 (+ i (- %lane_size 1)))
          (define %2 (extract %1 i %a))
          (define %4 (extract %1 i %b))
          (define %5 (+ j (- %precision 1)))
          (define %6 (extract %5 j %2))
          (define %7 (extract %5 j %4))
          (concat %6 %7)
         )
        )
       )
     )
    )
    %dst
)


function _mm512_unpackhi_epi32 ( %a, %b, %offset, %vector_length, %lane_size, %precision ) {
  for ([%i (range 0 %vector_length %lane_size)]) {
    %lane_last_idx = sub %lane_size, 1
    %1 = add %i, %lane_last_idx
    %2 = bvextract %a, %i, %1, %lane_size
    %4 = bvextract %b, %i, %1, %lane_size
    for ([%j (range  %offset %lane_size %precision)]) {
      %elem_last_idx = sub %precision, 1 
      %5 = add %j, %elem_last_idx
      %6 = bvextract %2, %j, %5, %precision
      bvinsert %6, %var, %j, %5, %precision
      %7 = bvextract %4, %j, %5, %precision
      %8 = add %j, %precision
      %9 = add %8, %elem_last_idx
      bvinsert %7, %var, %8, %9, %precision
    }
    %10 = bvextract %var, 0, %lane_last_idx, %lane_size
    bvinsert %10, %dst, %i, %1, %lane_size
  }
  ret %dst
}

(define (_mm512_unpackhi_epi32 %a %b %offset %vector_length %lane_size %precision)
  (define %dst
    (apply
     concat
     (for/list ([i (reverse (range 0 %vector_length %lane_size))])
       (apply
        concat
        (for/list ([j (reverse (range %offset %lane_size %precision))])
          (define %1 (+ i (- %lane_size 1)))
          (define %2 (extract %1 i %a))
          (define %4 (extract %1 i %b))
          (define %5 (+ j (- %precision 1)))
          (define %6 (extract %5 j %2))
          (define %7 (extract %5 j %4))
          (concat %6 %7)
         )
        )
       )
     )
    )
    %dst
)


(define-symbolic %a_1 (bitvector 512))
(define-symbolic %b_1 (bitvector 512))
(define %offset_1 0)
(define %vector_length_1 512)
(define %lane_size_1 256)
(define %precision_1 32)

(verify (assert (equal? (_mm512_unpackhi_epi32 %a_1 %b_1 %offset_1 %vector_length_1 %lane_size_1 %precision_1) 
                        (_mm256_unpacklo_epi8  %a_1 %b_1 %offset_1 %vector_length_1 %lane_size_1 %precision_1))))

(define-symbolic %a_2 (bitvector 256))
(define-symbolic %b_2 (bitvector 256))
(define %offset_2 64)
(define %vector_length_2 256)
(define %lane_size_2 64)
(define %precision_2 8)

(verify (assert (equal? (_mm512_unpackhi_epi32 %a_2 %b_2 %offset_2 %vector_length_2 %lane_size_2 %precision_2) 
                        (_mm256_unpacklo_epi8  %a_2 %b_2 %offset_2 %vector_length_2 %lane_size_2 %precision_2))))
                        
                      

function interleave_shuffle ( %a, %b, %offset, %vector_length, %lane_size, %precision ) {
  for ([%i (range 0 %vector_length %lane_size)]) {
    %lane_last_idx = sub %lane_size, 1
    %1 = add %i, %lane_last_idx
    %2 = bvextract %a, %i, %1, %lane_size
    %4 = bvextract %b, %i, %1, %lane_size
    for ([%j (range  %offset %lane_size %precision)]) {
      %elem_last_idx = sub %precision, 1 
      %5 = add %j, %elem_last_idx
      %6 = bvextract %2, %j, %5, %precision
      bvinsert %6, %var, %j, %5, %precision
      %7 = bvextract %4, %j, %5, %precision
      %8 = add %j, %precision
      %9 = add %8, %elem_last_idx
      bvinsert %7, %var, %8, %9, %precision
    }
    %10 = bvextract %var, 0, %lane_last_idx, %lane_size
    bvinsert %10, %dst, %i, %1, %lane_size
  }
  ret %dst
}

(define (interleave_shuffle %a %b %offset %vector_length %lane_size %precision)
  (define %dst
    (apply
     concat
     (for/list ([i (reverse (range 0 %vector_length %lane_size))])
       (apply
        concat
        (for/list ([j (reverse (range %offset %lane_size %precision))])
          (define %1 (+ i (- %lane_size 1)))
          (define %2 (extract %1 i %a))
          (define %4 (extract %1 i %b))
          (define %5 (+ j (- %precision 1)))
          (define %6 (extract %5 j %2))
          (define %7 (extract %5 j %4))
          (concat %6 %7)
         )
        )
       )
     )
    )
    %dst
)



;; Add some examples of generated dot product instruction semantics

function vnni_dot_product (%src, %a, %b, %vector_length, %lane_size, %precision, %extend_size) {
  for ([%i (range 0 %vector_length %lane_size)]) {
    %lane_last_idx = sub %lane_size, 1
    %dst.high.idx = add %i, %lane_last_idx
    %ext.src = bvextract %src, %i, %dst.high.idx, %lane_size
    bvinsert %ext.src, %dst, %i, %dst.high.idx, %lane_size
    for ([%j (range  0 %lane_size %precision)]) {
      %elem_last_idx = sub %precision, 1
      %low.index = add %i, %j
      %high.index = add %low.index, %elem_last_idx
      %ext.a = bvextract %a, %low.index, %high.index, %precision
      %zext.a = bvzeroextend %ext.a, %extend_size
      %ext.b = bvextract %b, %low.index, %high.index, %precision
      %sext.b = bvsignextend %ext.b, %extend_size
      %dot = bvmul %zext.a, %sext.b
      %sext.dot = bvsignextend %dot, %lane_size
      %prev.dst = bvextract %dst, %i, %dst.high.idx, %lane_size
      %acc = bvadd %prev.dst, %sext.dot
      bvinsert %acc, %dst, %i, %dst.high.idx, %lane_size
    }
  }
  ret %dst
}

function vnni_dot_product (%src, %a, %b) {
  for ([%i (range 0 512 32)]) {
    %dst.high.idx = add %i, 31
    %ext.src = bvextract %src, %i, %dst.high.idx, 32
    bvinsert %ext.src, %dst, %i, %dst.high.idx, 32
    for ([%j (range  0 32 8)]) {
      %low.index = add %i, %j
      %high.index = add %low.index, 7
      %ext.a = bvextract %a, %low.index, %high.index, 8
      %zext.a = bvzeroextend %ext.a, 16
      %ext.b = bvextract %b, %low.index, %high.index, 8
      %sext.b = bvsignextend %ext.b, 16
      %dot = bvmul %zext.a, %sext.b
      %sext.dot = bvsignextend %dot, 32
      %prev.dst = bvextract %dst, %i, %dst.high.idx, 32
      %acc = bvadd %prev.dst, %sext.dot
      bvinsert %acc, %dst, %i, %dst.high.idx, 32
    }
  }
  ret %dst
}


function vrmpy_dot_product (%Vx, %Vu, %Vv, %vector_length, %lane_size, %precision, %extend_size) {
  for ([%i (range 0 %vector_length %lane_size)]) {
    %lane_last_idx = sub %lane_size, 1
    %dst.high.idx = add %i, %lane_last_idx
    %ext.Vx = bvextract %Vx, %i, %dst.high.idx, %lane_size
    bvinsert %ext.Vx, %dst, %i, %dst.high.idx, %lane_size
    for ([%j (range  0 %lane_size %precision)]) {
      %elem_last_idx = sub %precision, 1
      %low.index = add %i, %j
      %high.index = add %low.index, %elem_last_idx
      %ext.Vu = bvextract %Vu, %low.index, %high.index, %precision
      %zext.Vu = bvzeroextend %ext.Vu, %extend_size
      %ext.Vv = bvextract %Vv, %low.index, %high.index, %precision
      %sext.Vv = bvsignextend %ext.Vv, %extend_size
      %dot = bvmul %zext.Vu, %sext.Vv
      %sext.dot = bvsignextend %dot, %lane_size
      %prev.dst = bvextract %dst, %i, %dst.high.idx, %lane_size
      %acc = bvadd %prev.dst, %sext.dot
      bvinsert %acc, %dst, %i, %dst.high.idx, %lane_size
    }
  }
  ret %dst
}


function vrmpy_dot_product (%Vx, %Vu, %Vv) {
  for ([%i (range 0 1024 32)]) {
    %dst.high.idx = add %i, 31
    %ext.Vx = bvextract %Vx, %i, %dst.high.idx, 32
    bvinsert %ext.Vx, %dst, %i, %dst.high.idx, 32
    for ([%j (range  0 32 8)]) {
      %low.index = add %i, %j
      %high.index = add %low.index, 7
      %ext.Vu = bvextract %Vu, %low.index, %high.index, 8
      %zext.Vu = bvzeroextend %ext.Vu, 16
      %ext.Vv = bvextract %Vv, %low.index, %high.index, 8
      %sext.Vv = bvsignextend %ext.Vv, 16
      %dot = bvmul %zext.Vu, %sext.Vv
      %sext.dot = bvsignextend %dot, 32
      %prev.dst = bvextract %dst, %i, %dst.high.idx, 32
      %acc = bvadd %prev.dst, %sext.dot
      bvinsert %acc, %dst, %i, %dst.high.idx, 32
    }
  }
  ret %dst
}




function _mm256_madd52hi_epu64 ( bv256 a, bv256 b, bv256 c ) {
 for ([%outer.it (range 0 256 256)]) {
  for ([%j0.new (range 0 256 64)]) {
   %1 = add int32 %j0.new, int32 51
   %2 = bvextract bv256 b, int32 %j0.new, int32 %1, int32 52
   %3 = bvzeroextend bv52 %2, int32 64
   %5 = bvextract bv256 c, int32 %j0.new, int32 %1, int32 52
   %6 = bvzeroextend bv52 %5, int32 64
   %7 = bvzeroextend bv64 %3, int32 128
   %8 = bvzeroextend bv64 %6, int32 128
   %9 = bvmul bv128 %7, bv128 %8
   %12 = add int32 %j0.new, int32 63
   %13 = bvextract bv256 a, int32 %j0.new, int32 %12, int32 64
   %14 = bvextract bv128 %9, int32 52, int32 103, int32 52
   %15 = bvzeroextend bv52 %14, int32 64
   %16 = bvadd bv64 %13, bv64 %15
   bvinsert bv64 %16, bv256 dst, int32 %j0.new, int32 %12, int32 64
  }
 }
 ret bv256 dst
}


function _mm256_madd52hi_epu64 ( a, b, c, %vector_length, %lane_size, %precision, 
                                  %extract_size1, %extend_size1, %extend_size2, 
                                  %start, %extract_size2 ) {
 for ([%outer.it (range 0 %vector_length %lane_size)]) {
  for ([%j0.new (range 0 %lane_size %precision)]) {
   %last_idx.1 = sub %extract_size1, 1
   %1 = add %j0.new, %last_idx.1
   %2 = bvextract b, %j0.new, %1, %extract_size1
   %3 = bvzeroextend %2, %extend_size1
   %5 = bvextract c, %j0.new, %1, %extract_size1
   %6 = bvzeroextend %5, %extend_size1
   %7 = bvzeroextend %3, %extend_size2
   %8 = bvzeroextend %6, %extend_size2
   %9 = bvmul %7, %8
   %last_idx.2 = sub %precision, 1
   %12 = add  %j0.new, %last_idx.2
   %13 = bvextract a, %j0.new, %12, %precision
   %last_idx.3 = sub %extract_size2, 1
   %end = add  %start, %last_idx.3
   %14 = bvextract %9, %start, %end, %extract_size2
   %15 = bvzeroextend %14, %precision
   %16 = bvadd %13, %15
   bvinsert %16, dst, %j0.new, %12, %precision
  }
 }
 ret dst
}



function _mm_madd52lo_epu64 ( bv128 a, bv128 b, bv128 c ) {
 for ([%outer.it (range 0 128 128)]) {
  for ([%j0.new (range 0 128 64)]) {
   %1 = add int32 %j0.new, int32 51
   %2 = bvextract bv128 b, int32 %j0.new, int32 %1, int32 52
   %3 = bvzeroextend bv52 %2, int32 64
   %5 = bvextract bv128 c, int32 %j0.new, int32 %1, int32 52
   %6 = bvzeroextend bv52 %5, int32 64
   %7 = bvzeroextend bv64 %3, int32 128
   %8 = bvzeroextend bv64 %6, int32 128
   %9 = bvmul bv128 %7, bv128 %8
   %12 = add int32 %j0.new, int32 63
   %13 = bvextract bv128 a, int32 %j0.new, int32 %12, int32 64
   %14 = bvextract bv128 %9, int32 0, int32 51, int32 52
   %15 = bvzeroextend bv52 %14, int32 64
   %16 = bvadd bv64 %13, bv64 %15
   bvinsert bv64 %16, bv128 dst, int32 %j0.new, int32 %12, int32 64
  }
 }
 ret bv128 dst
}


function _mm_madd52lo_epu64 ( a, b, c, %vector_length, %lane_size, %precision, 
                                  %extract_size1, %extend_size1, %extend_size2, 
                                  %start, %extract_size2 ) {
 for ([%outer.it (range 0 %vector_length %lane_size)]) {
  for ([%j0.new (range 0 %lane_size %precision)]) {
   %last_idx.1 = sub %extract_size1, 1
   %1 = add %j0.new, %last_idx.1
   %2 = bvextract b, %j0.new, %1, %extract_size1
   %3 = bvzeroextend %2, %extend_size1
   %5 = bvextract c, %j0.new, %1, %extract_size1
   %6 = bvzeroextend %5, %extend_size1
   %7 = bvzeroextend %3, %extend_size2
   %8 = bvzeroextend %6, %extend_size2
   %9 = bvmul %7, %8
   %last_idx.2 = sub %precision, 1
   %12 = add  %j0.new, %last_idx.2
   %13 = bvextract a, %j0.new, %12, %precision
   %last_idx.3 = sub %extract_size2, 1
   %end = add  %start, %last_idx.3
   %14 = bvextract %9, %start, %end, %extract_size2
   %15 = bvzeroextend %14, %precision
   %16 = bvadd %13, %15
   bvinsert %16, dst, %j0.new, %12, %precision
  }
 }
 ret dst
}









function _mm_max_pi16 ( a, b ) {
 for ([%outer.it (range 0 64 64)]) {
  for ([%j0.new (range 0 64 16)]) {
   %1 = add  %j0.new, 15
   %2 = bvextract a, %j0.new, %1, 16
   %4 = bvextract b, %j0.new, %1, 16
   %5 = bvsmax %2, %4
   bvinsert %5, dst, %j0.new, %1, 16
  }
 }
 ret  dst
}

function _mm_max_epi32 ( a, b ) {
 for ([%outer.it (range 0 128 128)]) {
  for ([%j0.new (range 0 128 32)]) {
   %1 = add  %j0.new, 31
   %2 = bvextract a, %j0.new, %1, 32
   %4 = bvextract b, %j0.new, %1, 32
   %5 = bvsmax %2, %4
   bvinsert %5, dst, %j0.new, %1, 32
  }
 }
 ret  dst
}


function _mm_max_pi16 ( a, b, %vector_length, %lane_size, %precision ) {
 for ([%outer.it (range 0 %vector_length %lane_size)]) {
  for ([%j0.new (range 0 %lane_size %precision)]) {
   %last_idx = sub %precision, 1
   %1 = add %j0.new, %last_idx
   %2 = bvextract a, %j0.new, %1, %precision
   %4 = bvextract b, %j0.new, %1, %precision
   %5 = bvsmax %2, %4
   bvinsert %5, dst, %j0.new, %1, %precision
  }
 }
 ret dst
}


function _mm_max_epi32 ( a, b, %vector_length, %lane_size, %precision ) {
 for ([%outer.it (range 0 %vector_length %lane_size)]) {
  for ([%j0.new (range 0 %lane_size %precision)]) {
   %last_idx = sub %precision, 1
   %1 = add %j0.new, %last_idx
   %2 = bvextract a, %j0.new, %1, %precision
   %4 = bvextract b, %j0.new, %1, %precision
   %5 = bvsmax %2, %4
   bvinsert %5, dst, %j0.new, %1, %precision
  }
 }
 ret dst
}


function _mm_xor_si128 ( a, b ) {
 for ([%outer.it (range 0 128 128)]) {
  for ([%inner.it (range 0 128 128)]) {
   %0 = bvextract a, 0, 127, 128
   %1 = bvextract b, 0, 127, 128
   %2 = bvxor %0, %1
   bvinsert %2, dst, 0, 127, 128
  }
 }
 ret  dst
}


function _mm512_xor_epi64 ( a, b ) {
 for ([%outer.it (range 0 512 512)]) {
  for ([%j0.new (range 0 512 64)]) {
   %4 = add %j0.new, 63
   %5 = bvextract a, %j0.new, %4, 64
   %7 = bvextract b, %j0.new, %4, 64
   %8 = bvxor %5, %7
   bvinsert %8, dst, %j0.new, %4, 64
  }
 }
 ret  dst
}



function _mm_xor_si128 ( a, b, %vector_length, %lane_size, %precision ) {
 for ([%outer.it (range 0 %vector_length %lane_size)]) {
  for ([%j0.new (range 0 %lane_size %precision)]) {
   %last_idx = sub %precision, 1
   %start_idx = add %j0.new, %last_idx
   %0 = bvextract a, %j0.new, %start_idx, %precision
   %1 = bvextract b, %j0.new, %start_idx, %precision
   %2 = bvxor %0, %1
   bvinsert %2, dst, 0, %start_idx, %precision
  }
 }
 ret  dst
}


function _mm512_xor_epi64 ( a, b, %vector_length, %lane_size, %precision ) {
 for ([%outer.it (range 0 %vector_length %lane_size)]) {
  for ([%j0.new (range 0 %lane_size %precision)]) {
   %last_idx = sub %precision, 1
   %4 = add %j0.new, %last_idx
   %5 = bvextract a, %j0.new, %4, %precision
   %7 = bvextract b, %j0.new, %4, %precision
   %8 = bvxor %5, %7
   bvinsert %8, dst, %j0.new, %4, %precision4
  }
 }
 ret dst
}



function _mm_mask_mov_epi16 ( bv128 src, bv8 k, bv128 a ) {
 for ([j0 (range 0 8 1)]) {
  %0 = mul int32 j0, int32 16
  %1 = bvextract bv8 k, int32 j0, int32 j0, int32 1
  if (bv1 %1) {
   %3 = add int32 %0, int32 15
   %4 = bvextract bv128 a, int32 %0, int32 %3, int32 16
   %5 = add int32 %0, int32 15
   bvinsert bv16 %4, bv128 dst, int32 %0, int32 %5, int32 16
  } else {
   %7 = add int32 %0, int32 15
   %8 = bvextract bv128 src, int32 %0, int32 %7, int32 16
   %9 = add int32 %0, int32 15
   bvinsert bv16 %8, bv128 dst, int32 %0, int32 %9, int32 16
  }
 }
 ret bv128 dst
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



