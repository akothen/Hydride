; hydride.node.0
; (reg 14) <1 x i16>
; (reg 17) <8 x i8>
; (reg 15) <8 x i8>
; (reg 11) <8 x i8>
; (reg 19) <1 x i32>
; (reg 18) <1 x i16>
; (reg 13) <8 x i8>
; (reg 10) <1 x i1>
; (reg 2) <8 x i8>
; (reg 5) <8 x i8>
; (reg 0) <8 x i8>
; (reg 7) <8 x i8>
; (reg 6) <1 x i16>
; (reg 16) <1 x i16>
; (reg 1) <1 x i16>
; (reg 12) <1 x i16>
; (reg 4) <1 x i32>
; (reg 9) <1 x i32>
; (reg 20) <1 x i16>
; (reg 3) <1 x i16>
; (reg 8) <1 x i16>


(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff 128)) ; <8 x i16>
  
(_m_paddsb_dsl 
(_mm_set1_pi8_dsl 
(reg 20)  128  16  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm_set1_pi8_dsl 
(reg 9)  256  32  );<8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_and_si256_dsl 
(_mm_mulhi_epu16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_set1_pi8_dsl 
(reg 4)  256  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 7)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 8)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 5)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 6)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <16 x i32>
  512  32  );<16 x i32>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff 512)) ; <8 x i64>
  
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm_mulhi_epu16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_set1_pi8_dsl 
(reg 4)  256  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 2)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 3)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 0)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 1)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  512  64  );<8 x i64>
  (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm_set1_pi8_dsl 
(reg 19)  256  32  );<8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_and_si256_dsl 
(_mm_mulhi_epu16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_set1_pi8_dsl 
(reg 4)  256  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 17)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 18)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 15)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 16)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <16 x i32>
  512  32  );<16 x i32>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff000000001fffffff 512)) ; <8 x i64>
  
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm_mulhi_epu16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_set1_pi8_dsl 
(reg 4)  256  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 13)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 14)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 11)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  (lit (bv #x00400040004000400040004000400040 128)) ; <8 x i16>
  128  16  0  32  );<8 x i16>
  
(_mm_set1_pi8_dsl 
(reg 12)  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  512  64  );<8 x i64>
  (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00000000000000000000000000000000 128)) ; <8 x i16>
  128  16  );<8 x i16>

