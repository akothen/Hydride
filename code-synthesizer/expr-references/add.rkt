; hydride.node.0
; (reg 10) <8 x i16>
; (reg 0) <8 x i8>
; (reg 1) <8 x i16>
; (reg 2) <8 x i16>
; (reg 4) <8 x i8>
; (reg 6) <8 x i16>
; (reg 7) <8 x i16>
; (reg 3) <8 x i16>
; (reg 9) <8 x i16>
; (reg 5) <8 x i16>
; (reg 8) <8 x i16>

(_mm256_max_epi64_dsl (_mm256_min_epi8_dsl (reg 9)
  (_mm512_cvtusepi32_epi8_dsl (_mm256_max_epi64_dsl (_mm256_min_epi8_dsl (_m_paddd_dsl (_mm256_cvtepi8_epi16_dsl (reg 8)
  256  256  128  16  0  32  0  );<8 x i32>
  (_mm256_cvtepi8_epi16_dsl (_mm512_cvtusepi32_epi8_dsl (_mm256_max_epi64_dsl (_mm256_min_epi8_dsl (_mm256_rolv_epi32_dsl (_mm256_cvtepi16_epi8_dsl (_mm256_max_epi64_dsl (_mm256_min_epi8_dsl (_mm_sub_epi8_dsl (_mm256_cvtepi8_epi16_dsl (_m_paddd_dsl (_mm512_mulhi_epi16_dsl (_mm256_cvtepi8_epi16_dsl (reg 7)
  256  256  128  16  0  32  0  );<8 x i32>
  (_mm256_cvtepi8_epi16_dsl (_m_paddd_dsl (_mm_sllv_epi64_dsl (lit (bv #x00000000000000000000000000000000 128)) ; <8 x i16>
  (interleave-vectors_dsl (lit (bv #x0000000000000000 64)) ; <8 x i8>
  (reg 4)
  64  8  );<16 x i8>
  (reg 5)
  128  128  128  16  0  (lit (bv #x0010 16)) ; <1 x i16>
  16  0  );<8 x i16>
  (reg 6)
  128  128  128  16  0  0  );<8 x i16>
  256  256  128  16  0  32  0  );<8 x i32>
  256  256  256  32  0  0  64  0  );<8 x i32>
  (_mm512_mulhi_epi16_dsl (_mm256_cvtepi8_epi16_dsl (reg 3)
  256  256  128  16  0  32  0  );<8 x i32>
  (_mm256_cvtepi8_epi16_dsl (_m_paddd_dsl (_mm_sllv_epi64_dsl (lit (bv #x00000000000000000000000000000000 128)) ; <8 x i16>
  (interleave-vectors_dsl (lit (bv #x0000000000000000 64)) ; <8 x i8>
  (reg 0)
  64  8  );<16 x i8>
  (reg 1)
  128  128  128  16  0  (lit (bv #x0010 16)) ; <1 x i16>
  16  0  );<8 x i16>
  (reg 2)
  128  128  128  16  0  0  );<8 x i16>
  256  256  128  16  0  32  0  );<8 x i32>
  256  256  256  32  0  0  64  0  );<8 x i32>
  256  256  256  32  0  0  );<8 x i32>
  512  512  256  32  0  64  0  );<8 x i64>
  (_mm256_cvtepi8_epi16_dsl (_mm_sub_epi8_dsl (_mm_sllv_epi64_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  256  256  256  32  0  (lit (bv #x00000020 32)) ; <1 x i32>
  32  0  );<8 x i32>
  (lit (bv #x0000000200000002000000020000000200000002000000020000000200000002 256)) ; <8 x i32>
  256  256  256  32  0  0  );<8 x i32>
  512  512  256  32  0  64  0  );<8 x i64>
  512  512  512  64  0  0  );<8 x i64>
  (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  512  512  512  64  0  0  );<8 x i64>
  (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  512  512  512  64  0  0  );<8 x i64>
  512  512  256  32  0  64  0  );<8 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  256  256  256  32  0  (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x00000020 32)) ; <1 x i32>
  0  );<8 x i32>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  256  256  256  32  0  0  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  256  256  32  0  0  );<8 x i32>
  256  256  128  16  0  32  0  );<8 x i16>
  256  256  128  16  0  32  0  );<8 x i32>
  256  256  256  32  0  0  );<8 x i32>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  256  256  256  32  0  0  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  256  256  32  0  0  );<8 x i32>
  256  256  128  16  0  32  0  );<8 x i16>
  128  128  128  16  0  0  );<8 x i16>
  (reg 10)
  128  128  128  16  0  0  );<8 x i16>

