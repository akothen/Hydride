; hydride.node.0
; (reg 0) <16 x i8>
; (reg 4) <16 x i8>
; (reg 2) <16 x i8>
; (reg 3) <16 x i8>
; (reg 1) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.1
; (reg 0) <16 x i8>
; (reg 1) <16 x i8>
; (reg 4) <16 x i8>
; (reg 2) <16 x i8>
; (reg 3) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.2
; (reg 4) <16 x i8>
; (reg 2) <16 x i8>
; (reg 3) <16 x i8>
; (reg 1) <16 x i8>
; (reg 0) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.3
; (reg 2) <16 x i8>
; (reg 3) <16 x i8>
; (reg 0) <16 x i8>
; (reg 4) <16 x i8>
; (reg 1) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.4
; (reg 1) <16 x i8>
; (reg 2) <16 x i8>
; (reg 0) <16 x i8>
; (reg 3) <16 x i8>
; (reg 4) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.5
; (reg 0) <16 x i8>
; (reg 3) <16 x i8>
; (reg 1) <16 x i8>
; (reg 4) <16 x i8>
; (reg 2) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.6
; (reg 1) <16 x i8>
; (reg 4) <16 x i8>
; (reg 3) <16 x i8>
; (reg 0) <16 x i8>
; (reg 2) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.7
; (reg 2) <16 x i8>
; (reg 3) <16 x i8>
; (reg 0) <16 x i8>
; (reg 1) <16 x i8>
; (reg 4) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.8
; (reg 1) <16 x i8>
; (reg 0) <16 x i8>
; (reg 2) <16 x i8>
; (reg 3) <16 x i8>
; (reg 4) <16 x i8>


(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 4)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_cvtepu16_epi32_dsl 
(reg 3)  128  8  16  );<16 x i16>
  
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 2)  128  8  16  );<16 x i16>
  256  16  0  32  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 1)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(_mm256_cvtepu16_epi32_dsl 
(reg 0)  128  8  16  );<16 x i16>
  256  16  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.9
; (reg 3) <16 x i16>
; (reg 0) <16 x i16>
; (reg 4) <16 x i16>
; (reg 1) <16 x i16>
; (reg 2) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.10
; (reg 0) <16 x i16>
; (reg 4) <16 x i16>
; (reg 3) <16 x i16>
; (reg 1) <16 x i16>
; (reg 2) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.11
; (reg 0) <32 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x00080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008 512)) ; <32 x i16>
  (lit (bv #xffff 16)) ; <1 x i16>
  
(reg 0)  (lit (bv #x0000 16)) ; <1 x i16>
  512  16  16  );<32 x i16>
  256  8  16  0  );<32 x i8>

; hydride.node.12
; (reg 4) <16 x i16>
; (reg 3) <16 x i16>
; (reg 1) <16 x i16>
; (reg 0) <16 x i16>
; (reg 2) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.13
; (reg 3) <16 x i16>
; (reg 4) <16 x i16>
; (reg 2) <16 x i16>
; (reg 1) <16 x i16>
; (reg 0) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.14
; (reg 0) <32 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x00080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008 512)) ; <32 x i16>
  (lit (bv #xffff 16)) ; <1 x i16>
  
(reg 0)  (lit (bv #x0000 16)) ; <1 x i16>
  512  16  16  );<32 x i16>
  256  8  16  0  );<32 x i8>

; hydride.node.15
; (reg 2) <16 x i16>
; (reg 1) <16 x i16>
; (reg 3) <16 x i16>
; (reg 4) <16 x i16>
; (reg 0) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.16
; (reg 3) <16 x i16>
; (reg 4) <16 x i16>
; (reg 0) <16 x i16>
; (reg 1) <16 x i16>
; (reg 2) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.17
; (reg 0) <32 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x00080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008 512)) ; <32 x i16>
  (lit (bv #xffff 16)) ; <1 x i16>
  
(reg 0)  (lit (bv #x0000 16)) ; <1 x i16>
  512  16  16  );<32 x i16>
  256  8  16  0  );<32 x i8>

; hydride.node.18
; (reg 4) <16 x i16>
; (reg 0) <16 x i16>
; (reg 1) <16 x i16>
; (reg 3) <16 x i16>
; (reg 2) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.19
; (reg 4) <16 x i16>
; (reg 3) <16 x i16>
; (reg 0) <16 x i16>
; (reg 2) <16 x i16>
; (reg 1) <16 x i16>


(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm256_add_epi8_dsl 
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 4)  256  16  16  );<16 x i16>
  
(reg 3)  256  16  );<16 x i16>
  
(_mm_mulhi_pi16_dsl (lit (bv #x0006000600060006000600060006000600060006000600060006000600060006 256)) ; <16 x i16>
  
(reg 2)  256  16  0  32  );<16 x i16>
  256  16  );<16 x i16>
  
(reg 1)  256  16  );<16 x i16>
  
(_mm512_sllv_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x0002000200020002000200020002000200020002000200020002000200020002 256)) ; <16 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 256)) ; <16 x i16>
  
(reg 0)  256  16  16  );<16 x i16>
  256  16  );<16 x i16>

; hydride.node.20
; (reg 0) <32 x i16>


(_mm_cvtepi64_epi32_dsl 
(_mm512_srav_epi64_dsl (lit (bv #x0010 16)) ; <1 x i16>
  (lit (bv #x00080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008000800080008 512)) ; <32 x i16>
  (lit (bv #xffff 16)) ; <1 x i16>
  
(reg 0)  (lit (bv #x0000 16)) ; <1 x i16>
  512  16  16  );<32 x i16>
  256  8  16  0  );<32 x i8>
