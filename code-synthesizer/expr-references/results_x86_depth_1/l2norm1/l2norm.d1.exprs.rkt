; hydride.node.0
; (reg 0) <8 x i8>
; (reg 1) <1 x i8>


(_mm_sub_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 0)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(_mm_set1_pi8_dsl 
(reg 1)  64  8  );<8 x i8>
  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  128  16  );<8 x i16>

; hydride.node.1
; (reg 1) <8 x i16>
; (reg 0) <8 x i32>


(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  
(reg 0)  256  32  );<8 x i32>

; hydride.node.2
; (reg 0) <8 x i8>
; (reg 1) <1 x i8>


(_mm_sub_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 0)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(_mm_set1_pi8_dsl 
(reg 1)  64  8  );<8 x i8>
  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  128  16  );<8 x i16>

; hydride.node.3
; (reg 1) <8 x i16>
; (reg 0) <8 x i32>


(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  
(reg 0)  256  32  );<8 x i32>

; hydride.node.4
; (reg 0) <8 x i8>
; (reg 1) <1 x i8>


(_mm_sub_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 0)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(_mm_set1_pi8_dsl 
(reg 1)  64  8  );<8 x i8>
  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  128  16  );<8 x i16>

; hydride.node.5
; (reg 1) <8 x i16>
; (reg 0) <8 x i32>


(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  
(reg 0)  256  32  );<8 x i32>

; hydride.node.6
; (reg 0) <8 x i32>


(_mm_cvtepi64_epi32_dsl 
(reg 0)  128  16  32  0  );<8 x i16>

; hydride.node.7
; (reg 1) <8 x i16>
; (reg 0) <8 x i32>


(_mm256_and_si256_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(reg 1)  (lit (bv #xfff0fff0fff0fff0fff0fff0fff0fff0 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(reg 0)  256  32  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  (lit (bv #x7fff7fff7fff7fff7fff7fff7fff7fff 128)) ; <1 x i128>
  128  128  );<1 x i128>

; hydride.node.8
; (reg 0) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.9
; (reg 1) <8 x i16>
; (reg 0) <8 x i16>
; (reg 2) <8 x i16>


(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000f0000000f0000000f0000000f0000000f0000000f0000000f0000000f 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000f0000000f0000000f0000000f0000000f0000000f0000000f0000000f 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_sub_pi16_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00050005000500050005000500050005 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl (lit (bv #x001f001f001f001f001f001f001f001f 128)) ; <8 x i16>
  
(reg 0)  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  256  32  32  );<8 x i32>

; hydride.node.10
; (reg 2) <8 x i16>
; (reg 0) <8 x i16>
; (reg 1) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_rem_epu16_dsl 
(_mm_sub_pi16_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00050005000500050005000500050005 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl (lit (bv #x001f001f001f001f001f001f001f001f 128)) ; <8 x i16>
  
(reg 0)  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x0000800000008000000080000000800000008000000080000000800000008000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.11
; (reg 0) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.12
; (reg 0) <8 x i32>
; (reg 1) <8 x i16>
; (reg 2) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_and_si256_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <1 x i512>
  
(_mm_mulhi_epu16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  512  512  );<1 x i512>
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
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>

; hydride.node.13
; (reg 0) <8 x i32>


(_mm_cvtepi64_epi32_dsl 
(reg 0)  128  16  32  0  );<8 x i16>

; hydride.node.14
; (reg 1) <8 x i16>
; (reg 0) <8 x i32>


(_mm256_and_si256_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(reg 1)  (lit (bv #xfff0fff0fff0fff0fff0fff0fff0fff0 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(reg 0)  256  32  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  (lit (bv #x7fff7fff7fff7fff7fff7fff7fff7fff 128)) ; <1 x i128>
  128  128  );<1 x i128>

; hydride.node.15
; (reg 0) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.16
; (reg 1) <8 x i16>
; (reg 2) <8 x i16>
; (reg 0) <8 x i16>


(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000f0000000f0000000f0000000f0000000f0000000f0000000f0000000f 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000f0000000f0000000f0000000f0000000f0000000f0000000f0000000f 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_sub_pi16_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00050005000500050005000500050005 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl (lit (bv #x001f001f001f001f001f001f001f001f 128)) ; <8 x i16>
  
(reg 0)  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  256  32  32  );<8 x i32>

; hydride.node.17
; (reg 0) <8 x i16>
; (reg 2) <8 x i16>
; (reg 1) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_rem_epu16_dsl 
(_mm_sub_pi16_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00050005000500050005000500050005 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl (lit (bv #x001f001f001f001f001f001f001f001f 128)) ; <8 x i16>
  
(reg 0)  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x0000800000008000000080000000800000008000000080000000800000008000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.18
; (reg 0) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.19
; (reg 0) <8 x i32>
; (reg 1) <8 x i16>
; (reg 2) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_and_si256_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <1 x i512>
  
(_mm_mulhi_epu16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  512  512  );<1 x i512>
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
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>

; hydride.node.20
; (reg 0) <8 x i32>


(_mm_cvtepi64_epi32_dsl 
(reg 0)  128  16  32  0  );<8 x i16>

; hydride.node.21
; (reg 0) <8 x i32>
; (reg 1) <8 x i16>


(_mm256_and_si256_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(reg 1)  (lit (bv #xfff0fff0fff0fff0fff0fff0fff0fff0 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(reg 0)  256  32  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  (lit (bv #x7fff7fff7fff7fff7fff7fff7fff7fff 128)) ; <1 x i128>
  128  128  );<1 x i128>

; hydride.node.22
; (reg 0) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.23
; (reg 0) <8 x i16>
; (reg 2) <8 x i16>
; (reg 1) <8 x i16>


(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000f0000000f0000000f0000000f0000000f0000000f0000000f0000000f 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000f0000000f0000000f0000000f0000000f0000000f0000000f0000000f 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_sub_pi16_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00050005000500050005000500050005 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl (lit (bv #x001f001f001f001f001f001f001f001f 128)) ; <8 x i16>
  
(reg 0)  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  256  32  32  );<8 x i32>

; hydride.node.24
; (reg 1) <8 x i16>
; (reg 2) <8 x i16>
; (reg 0) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_rem_epu16_dsl 
(_mm_sub_pi16_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #xffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33ffffdb33 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x000009fb000009fb000009fb000009fb000009fb000009fb000009fb000009fb 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00005ad100005ad100005ad100005ad100005ad100005ad100005ad100005ad1 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00050005000500050005000500050005 128)) ; <8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl (lit (bv #x001f001f001f001f001f001f001f001f 128)) ; <8 x i16>
  
(reg 0)  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x0000800000008000000080000000800000008000000080000000800000008000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.25
; (reg 0) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>

; hydride.node.26
; (reg 0) <8 x i32>
; (reg 1) <8 x i16>
; (reg 2) <8 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl (lit (bv #xffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000ffffffff80000000 512)) ; <8 x i64>
  
(_mm256_min_epi16_dsl (lit (bv #x000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff000000007fffffff 512)) ; <8 x i64>
  
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e000000000000001e 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0000000000000040 64)) ; <1 x i64>
  (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  (lit (bv #xffffffffffffffff 64)) ; <1 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_add_epi8_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <8 x i64>
  
(_mm256_and_si256_dsl (lit (bv #x00000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001 512)) ; <1 x i512>
  
(_mm_mulhi_epu16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  512  512  );<1 x i512>
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
(_mm512_sllv_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000001000000010000000100000001000000010000000100000001000000010 256)) ; <8 x i32>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00001cc300001cc300001cc300001cc300001cc300001cc300001cc300001cc3 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm256_add_epi8_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0000591c0000591c0000591c0000591c0000591c0000591c0000591c0000591c 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl (lit (bv #x00000a2000000a2000000a2000000a2000000a2000000a2000000a2000000a20 256)) ; <8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000e0000000e0000000e0000000e0000000e0000000e0000000e0000000e 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x00001fff00001fff00001fff00001fff00001fff00001fff00001fff00001fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(reg 1)  128  16  32  );<8 x i32>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 2)  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  128  16  );<8 x i16>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  256  32  32  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  0  128  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  (lit (bv #x0000000000000000 64)) ; <1 x i64>
  512  64  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>
  256  32  64  );<8 x i64>
  
(_mm256_cvtepi8_epi32_dsl 
(reg 0)  256  32  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  512  64  );<8 x i64>
  256  32  64  0  );<8 x i32>

; hydride.node.27
; (reg 1) <1 x i8>
; (reg 0) <8 x i8>
; (reg 3) <8 x i8>
; (reg 2) <1 x i32>


(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl 
(_m_paddsb_dsl 
(_mm_cvtepi64_epi32_dsl 
(_mm512_max_epi16_dsl 
(_mm256_min_epi16_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000700000007000000070000000700000007000000070000000700000007 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  
(_mm256_and_si256_dsl (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <1 x i256>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 3)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(_mm_set1_pi8_dsl 
(reg 1)  64  8  );<8 x i8>
  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  
(_mm_set1_pi8_dsl 
(reg 2)  256  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  256  256  );<1 x i256>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  
(_mm256_add_epi8_dsl (lit (bv #x0000003f0000003f0000003f0000003f0000003f0000003f0000003f0000003f 256)) ; <8 x i32>
  
(_mm512_srav_epi64_dsl (lit (bv #x00000020 32)) ; <1 x i32>
  (lit (bv #x0000000100000001000000010000000100000001000000010000000100000001 256)) ; <8 x i32>
  (lit (bv #xffffffff 32)) ; <1 x i32>
  
(_mm_mulhi_pi16_dsl 
(_mm256_cvtepi8_epi32_dsl 
(_mm_sub_pi16_dsl 
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(reg 0)  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  
(_mm_unpacklo_epi32_dsl 
(_mm_movepi64_pi64_dsl 
(_mm_set1_pi8_dsl 
(reg 1)  64  8  );<8 x i8>
  64  64  64  );<2 x i64>
  
(_mm_movepi64_pi64_dsl (lit (bv #x0000000000000000 64)) ; <1 x i64>
  64  64  64  );<2 x i64>
  64  8  8  );<16 x i8>
  128  16  );<8 x i16>
  128  16  32  );<8 x i32>
  
(_mm_set1_pi8_dsl 
(reg 2)  256  32  );<8 x i32>
  256  32  0  64  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  256  32  32  );<8 x i32>
  256  32  );<8 x i32>
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 256)) ; <8 x i32>
  256  32  );<8 x i32>
  128  16  32  0  );<8 x i16>
  (lit (bv #x00800080008000800080008000800080 128)) ; <8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff 128)) ; <8 x i16>
  128  16  );<8 x i16>
  (lit (bv #x00000000000000000000000000000000 128)) ; <8 x i16>
  128  16  );<8 x i16>

