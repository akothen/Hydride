//============================== Hydride File =================================
//
// Part of the Hydride Compiler Infrastructure. 
// <Placeholder for license information> 
//
//=============================================================================
//
// Do NOT modify this file. It is automatically generated. 
//
//=============================================================================


#include <immintrin.h>
#include <stdio.h>
#include <stdint.h>
__m256i _mm256_maskz_add_epi8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_add_epi8(k, a, b);
}

__m512i _mm512_mask_add_epi8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_add_epi8(src, k, a, b);
}

__m512i _mm512_maskz_add_epi8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_add_epi8(k, a, b);
}

__m128i _mm_mask_add_epi8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_add_epi8(src, k, a, b);
}

__m128i _mm_maskz_add_epi8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_add_epi8(k, a, b);
}

__m256i _mm256_mask_abs_epi16_wrapper(__m256i src, __mmask16 k, __m256i a) {
  return _mm256_mask_abs_epi16(src, k, a);
}

__m256i _mm256_maskz_abs_epi16_wrapper(__mmask16 k, __m256i a) {
  return _mm256_maskz_abs_epi16(k, a);
}

__m512i _mm512_mask_abs_epi16_wrapper(__m512i src, __mmask32 k, __m512i a) {
  return _mm512_mask_abs_epi16(src, k, a);
}

__m512i _mm512_maskz_abs_epi16_wrapper(__mmask32 k, __m512i a) {
  return _mm512_maskz_abs_epi16(k, a);
}

__m128i _mm_mask_abs_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_abs_epi16(src, k, a);
}

__m128i _mm_maskz_abs_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_abs_epi16(k, a);
}

__m256i _mm256_mask_add_epi8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_add_epi8(src, k, a, b);
}

__m512i _mm512_mask_abs_epi8_wrapper(__m512i src, __mmask64 k, __m512i a) {
  return _mm512_mask_abs_epi8(src, k, a);
}

__m512i _mm512_maskz_abs_epi8_wrapper(__mmask64 k, __m512i a) {
  return _mm512_maskz_abs_epi8(k, a);
}

__m128i _mm_mask_abs_epi8_wrapper(__m128i src, __mmask16 k, __m128i a) {
  return _mm_mask_abs_epi8(src, k, a);
}

__m128i _mm_maskz_abs_epi8_wrapper(__mmask16 k, __m128i a) {
  return _mm_maskz_abs_epi8(k, a);
}

__m256i _mm256_maskz_mov_epi8_wrapper(__mmask32 k, __m256i a) {
  return _mm256_maskz_mov_epi8(k, a);
}

__m512i _mm512_mask_mov_epi8_wrapper(__m512i src, __mmask64 k, __m512i a) {
  return _mm512_mask_mov_epi8(src, k, a);
}

__m512i _mm512_maskz_mov_epi8_wrapper(__mmask64 k, __m512i a) {
  return _mm512_maskz_mov_epi8(k, a);
}

__m128i _mm_mask_mov_epi8_wrapper(__m128i src, __mmask16 k, __m128i a) {
  return _mm_mask_mov_epi8(src, k, a);
}

__m128i _mm_maskz_mov_epi8_wrapper(__mmask16 k, __m128i a) {
  return _mm_maskz_mov_epi8(k, a);
}

__m256i _mm256_mask_abs_epi8_wrapper(__m256i src, __mmask32 k, __m256i a) {
  return _mm256_mask_abs_epi8(src, k, a);
}

__m256i _mm256_maskz_abs_epi8_wrapper(__mmask32 k, __m256i a) {
  return _mm256_maskz_abs_epi8(k, a);
}

__m256i _mm256_mask_mov_epi16_wrapper(__m256i src, __mmask16 k, __m256i a) {
  return _mm256_mask_mov_epi16(src, k, a);
}

__m256i _mm256_maskz_mov_epi16_wrapper(__mmask16 k, __m256i a) {
  return _mm256_maskz_mov_epi16(k, a);
}

__m512i _mm512_mask_mov_epi16_wrapper(__m512i src, __mmask32 k, __m512i a) {
  return _mm512_mask_mov_epi16(src, k, a);
}

__m512i _mm512_maskz_mov_epi16_wrapper(__mmask32 k, __m512i a) {
  return _mm512_maskz_mov_epi16(k, a);
}

__m128i _mm_mask_mov_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_mov_epi16(src, k, a);
}

__m128i _mm_maskz_mov_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_mov_epi16(k, a);
}

__m256i _mm256_mask_mov_epi8_wrapper(__m256i src, __mmask32 k, __m256i a) {
  return _mm256_mask_mov_epi8(src, k, a);
}

__m256i _mm256_blendv_epi8_wrapper(__m256i a, __m256i b, __m256i mask) {
  return _mm256_blendv_epi8(a, b, mask);
}

__m256i _mm256_blend_epi16_wrapper(__m256i a, __m256i b, const int imm8) {
  return _mm256_blend_epi16(a, b, imm8);
}

__m128i _mm_blend_epi32_wrapper(__m128i a, __m128i b, const int imm8) {
  return _mm_blend_epi32(a, b, imm8);
}

__m256i _mm256_blend_epi32_wrapper(__m256i a, __m256i b, const int imm8) {
  return _mm256_blend_epi32(a, b, imm8);
}

__m128i _mm_blend_epi16_wrapper(__m128i a, __m128i b, const int imm8) {
  return _mm_blend_epi16(a, b, imm8);
}

__m128i _mm_blendv_epi8_wrapper(__m128i a, __m128i b, __m128i mask) {
  return _mm_blendv_epi8(a, b, mask);
}

__m64 _mm_max_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_max_pi16(a, b);
}

__m64 _m_pmaxsw_wrapper(__m64 a, __m64 b) {
  return _m_pmaxsw(a, b);
}

__m64 _mm_max_pu8_wrapper(__m64 a, __m64 b) {
  return _mm_max_pu8(a, b);
}

__m64 _m_pmaxub_wrapper(__m64 a, __m64 b) {
  return _m_pmaxub(a, b);
}

__m64 _mm_min_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_min_pi16(a, b);
}

__m64 _m_pminsw_wrapper(__m64 a, __m64 b) {
  return _m_pminsw(a, b);
}

__m64 _mm_min_pu8_wrapper(__m64 a, __m64 b) {
  return _mm_min_pu8(a, b);
}

__m64 _m_pminub_wrapper(__m64 a, __m64 b) {
  return _m_pminub(a, b);
}

__m64 _mm_mulhi_pu16_wrapper(__m64 a, __m64 b) {
  return _mm_mulhi_pu16(a, b);
}

__m64 _m_pmulhuw_wrapper(__m64 a, __m64 b) {
  return _m_pmulhuw(a, b);
}

__m64 _mm_avg_pu8_wrapper(__m64 a, __m64 b) {
  return _mm_avg_pu8(a, b);
}

__m64 _m_pavgb_wrapper(__m64 a, __m64 b) {
  return _m_pavgb(a, b);
}

__m64 _mm_avg_pu16_wrapper(__m64 a, __m64 b) {
  return _mm_avg_pu16(a, b);
}

__m64 _m_pavgw_wrapper(__m64 a, __m64 b) {
  return _m_pavgw(a, b);
}

int _mm_movemask_pi8_wrapper(__m64 a) {
  return _mm_movemask_pi8(a);
}

int _m_pmovmskb_wrapper(__m64 a) {
  return _m_pmovmskb(a);
}

__m128i _mm_min_epu32_wrapper(__m128i a, __m128i b) {
  return _mm_min_epu32(a, b);
}

__m128i _mm_min_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_min_epi32(a, b);
}

__m128i _mm_min_epu16_wrapper(__m128i a, __m128i b) {
  return _mm_min_epu16(a, b);
}

__m128i _mm_max_epu16_wrapper(__m128i a, __m128i b) {
  return _mm_max_epu16(a, b);
}

__m128i _mm_min_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_min_epi8(a, b);
}

__m128i _mm_max_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_max_epi32(a, b);
}

__m128i _mm_max_epu32_wrapper(__m128i a, __m128i b) {
  return _mm_max_epu32(a, b);
}

__m128i _mm_max_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_max_epi8(a, b);
}

__m128i _mm_sub_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_sub_epi64(a, b);
}

__m64 _mm_sub_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_sub_pi16(a, b);
}

__m64 _mm_sub_pi32_wrapper(__m64 a, __m64 b) {
  return _mm_sub_pi32(a, b);
}

__m64 _mm_sub_pi8_wrapper(__m64 a, __m64 b) {
  return _mm_sub_pi8(a, b);
}

__m64 _mm_add_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_add_pi16(a, b);
}

__m64 _mm_add_pi32_wrapper(__m64 a, __m64 b) {
  return _mm_add_pi32(a, b);
}

__m64 _mm_add_pi8_wrapper(__m64 a, __m64 b) {
  return _mm_add_pi8(a, b);
}

__m64 _m_paddd_wrapper(__m64 a, __m64 b) {
  return _m_paddd(a, b);
}

__m64 _m_paddb_wrapper(__m64 a, __m64 b) {
  return _m_paddb(a, b);
}

__m64 _m_paddw_wrapper(__m64 a, __m64 b) {
  return _m_paddw(a, b);
}

__m512i _mm512_xor_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_xor_epi32(a, b);
}

__m512i _mm512_sub_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_sub_epi32(a, b);
}

__m512i _mm512_or_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_or_epi64(a, b);
}

__m512i _mm512_or_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_or_epi32(a, b);
}

__m512i _mm512_min_epu32_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epu32(a, b);
}

__m512i _mm512_min_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epi32(a, b);
}

__m512i _mm512_max_epu32_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epu32(a, b);
}

__m512i _mm512_max_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epi32(a, b);
}

__m512i _mm512_sub_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_sub_epi64(a, b);
}

__m512i _mm512_mul_epu32_wrapper(__m512i a, __m512i b) {
  return _mm512_mul_epu32(a, b);
}

__m512i _mm512_min_epu64_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epu64(a, b);
}

__m512i _mm512_min_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epi64(a, b);
}

__m512i _mm512_max_epu64_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epu64(a, b);
}

__m512i _mm512_max_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epi64(a, b);
}

__m128i _mm_or_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_or_epi64(a, b);
}

__m128i _mm_or_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_or_epi32(a, b);
}

__m256i _mm256_or_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_or_epi64(a, b);
}

__m256i _mm256_or_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_or_epi32(a, b);
}

__m128i _mm_xor_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_xor_epi32(a, b);
}

__m256i _mm256_xor_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_xor_epi32(a, b);
}

__m128i _mm_xor_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_xor_epi64(a, b);
}

__m256i _mm256_xor_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_xor_epi64(a, b);
}

__m128i _mm_broadcastb_epi8_wrapper(__m128i a) {
  return _mm_broadcastb_epi8(a);
}

__m256i _mm256_broadcastb_epi8_wrapper(__m128i a) {
  return _mm256_broadcastb_epi8(a);
}

__m128i _mm_broadcastd_epi32_wrapper(__m128i a) {
  return _mm_broadcastd_epi32(a);
}

__m256i _mm256_broadcastd_epi32_wrapper(__m128i a) {
  return _mm256_broadcastd_epi32(a);
}

__m128i _mm_broadcastq_epi64_wrapper(__m128i a) {
  return _mm_broadcastq_epi64(a);
}

__m256i _mm256_broadcastq_epi64_wrapper(__m128i a) {
  return _mm256_broadcastq_epi64(a);
}

__m128i _mm_broadcastw_epi16_wrapper(__m128i a) {
  return _mm_broadcastw_epi16(a);
}

__m256i _mm256_broadcastw_epi16_wrapper(__m128i a) {
  return _mm256_broadcastw_epi16(a);
}

__m256i _mm256_max_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epi8(a, b);
}

__m256i _mm256_max_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epi16(a, b);
}

__m256i _mm256_max_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epi32(a, b);
}

__m256i _mm256_max_epu8_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epu8(a, b);
}

__m256i _mm256_max_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epu16(a, b);
}

__m256i _mm256_max_epu32_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epu32(a, b);
}

__m256i _mm256_min_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epi8(a, b);
}

__m256i _mm256_min_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epi16(a, b);
}

__m256i _mm256_min_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epi32(a, b);
}

__m256i _mm256_min_epu8_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epu8(a, b);
}

__m256i _mm256_min_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epu16(a, b);
}

__m256i _mm256_min_epu32_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epu32(a, b);
}

int _mm256_movemask_epi8_wrapper(__m256i a) {
  return _mm256_movemask_epi8(a);
}

__m256i _mm256_sub_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_sub_epi8(a, b);
}

__m256i _mm256_sub_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_sub_epi16(a, b);
}

__m256i _mm256_sub_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_sub_epi32(a, b);
}

__m256i _mm256_sub_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_sub_epi64(a, b);
}

__m256i _mm256_cvtepi8_epi32_wrapper(__m128i a) {
  return _mm256_cvtepi8_epi32(a);
}

__m256i _mm256_cvtepi8_epi64_wrapper(__m128i a) {
  return _mm256_cvtepi8_epi64(a);
}

__m256i _mm256_cvtepu16_epi32_wrapper(__m128i a) {
  return _mm256_cvtepu16_epi32(a);
}

__m256i _mm256_cvtepu16_epi64_wrapper(__m128i a) {
  return _mm256_cvtepu16_epi64(a);
}

__m256i _mm256_cvtepu32_epi64_wrapper(__m128i a) {
  return _mm256_cvtepu32_epi64(a);
}

__m256i _mm256_cvtepu8_epi16_wrapper(__m128i a) {
  return _mm256_cvtepu8_epi16(a);
}

__m256i _mm256_cvtepu8_epi32_wrapper(__m128i a) {
  return _mm256_cvtepu8_epi32(a);
}

__m256i _mm256_cvtepu8_epi64_wrapper(__m128i a) {
  return _mm256_cvtepu8_epi64(a);
}

__m256i _mm256_cvtepi32_epi64_wrapper(__m128i a) {
  return _mm256_cvtepi32_epi64(a);
}

__m256i _mm256_cvtepi8_epi16_wrapper(__m128i a) {
  return _mm256_cvtepi8_epi16(a);
}

__m256i _mm256_cvtepi16_epi32_wrapper(__m128i a) {
  return _mm256_cvtepi16_epi32(a);
}

__m256i _mm256_cvtepi16_epi64_wrapper(__m128i a) {
  return _mm256_cvtepi16_epi64(a);
}

__m128i _mm_abs_epi16_wrapper(__m128i a) {
  return _mm_abs_epi16(a);
}

__m64 _mm_abs_pi32_wrapper(__m64 a) {
  return _mm_abs_pi32(a);
}

__m128i _mm_abs_epi32_wrapper(__m128i a) {
  return _mm_abs_epi32(a);
}

__m128i _mm_abs_epi8_wrapper(__m128i a) {
  return _mm_abs_epi8(a);
}

__m512i _mm512_abs_epi8_wrapper(__m512i a) {
  return _mm512_abs_epi8(a);
}

__m512i _mm512_abs_epi16_wrapper(__m512i a) {
  return _mm512_abs_epi16(a);
}

__m256i _mm256_abs_epi64_wrapper(__m256i a) {
  return _mm256_abs_epi64(a);
}

__m128i _mm_abs_epi64_wrapper(__m128i a) {
  return _mm_abs_epi64(a);
}

__m512i _mm512_abs_epi32_wrapper(__m512i a) {
  return _mm512_abs_epi32(a);
}

__m512i _mm512_abs_epi64_wrapper(__m512i a) {
  return _mm512_abs_epi64(a);
}

__m256i _mm256_mask_add_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_add_epi16(src, k, a, b);
}

__m256i _mm256_maskz_add_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_add_epi16(k, a, b);
}

__m128i _mm_maskz_add_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_add_epi16(k, a, b);
}

__m128i _mm_dpbusd_epi32_wrapper(__m128i src, __m128i a, __m128i b) {
  return _mm_dpbusd_epi32(src, a, b);
}

__m512i _mm512_mask_add_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_add_epi16(src, k, a, b);
}

__m512i _mm512_maskz_add_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_add_epi16(k, a, b);
}

__m128i _mm_mask_add_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_add_epi16(src, k, a, b);
}

__m128i _mm_dpwssd_epi32_wrapper(__m128i src, __m128i a, __m128i b) {
  return _mm_dpwssd_epi32(src, a, b);
}

__m512i _mm512_dpwssd_epi32_wrapper(__m512i src, __m512i a, __m512i b) {
  return _mm512_dpwssd_epi32(src, a, b);
}

__m256i _mm256_dpwssd_epi32_wrapper(__m256i src, __m256i a, __m256i b) {
  return _mm256_dpwssd_epi32(src, a, b);
}

__m256i _mm256_dpbusd_epi32_wrapper(__m256i src, __m256i a, __m256i b) {
  return _mm256_dpbusd_epi32(src, a, b);
}

__m512i _mm512_dpbusd_epi32_wrapper(__m512i src, __m512i a, __m512i b) {
  return _mm512_dpbusd_epi32(src, a, b);
}

__m512i _mm512_mask_subr_epi32_wrapper(__m512i src, __mmask16 k, __m512i v2, __m512i v3) {
  return _mm512_mask_subr_epi32(src, k, v2, v3);
}

__m256i _mm256_mask_madd52hi_epu64_wrapper(__m256i a, __mmask8 k, __m256i b, __m256i c) {
  return _mm256_mask_madd52hi_epu64(a, k, b, c);
}

__m256i _mm256_maskz_madd52hi_epu64_wrapper(__mmask8 k, __m256i a, __m256i b, __m256i c) {
  return _mm256_maskz_madd52hi_epu64(k, a, b, c);
}

__m128i _mm_maskz_madd52hi_epu64_wrapper(__mmask8 k, __m128i a, __m128i b, __m128i c) {
  return _mm_maskz_madd52hi_epu64(k, a, b, c);
}

__m256i _mm256_mask_madd52lo_epu64_wrapper(__m256i a, __mmask8 k, __m256i b, __m256i c) {
  return _mm256_mask_madd52lo_epu64(a, k, b, c);
}

__m256i _mm256_maskz_madd52lo_epu64_wrapper(__mmask8 k, __m256i a, __m256i b, __m256i c) {
  return _mm256_maskz_madd52lo_epu64(k, a, b, c);
}

__m128i _mm_mask_madd52lo_epu64_wrapper(__m128i a, __mmask8 k, __m128i b, __m128i c) {
  return _mm_mask_madd52lo_epu64(a, k, b, c);
}

__m128i _mm_maskz_madd52lo_epu64_wrapper(__mmask8 k, __m128i a, __m128i b, __m128i c) {
  return _mm_maskz_madd52lo_epu64(k, a, b, c);
}

__m512i _mm512_madd52hi_epu64_wrapper(__m512i a, __m512i b, __m512i c) {
  return _mm512_madd52hi_epu64(a, b, c);
}

__m512i _mm512_mask_madd52hi_epu64_wrapper(__m512i a, __mmask8 k, __m512i b, __m512i c) {
  return _mm512_mask_madd52hi_epu64(a, k, b, c);
}

__m512i _mm512_maskz_madd52hi_epu64_wrapper(__mmask8 k, __m512i a, __m512i b, __m512i c) {
  return _mm512_maskz_madd52hi_epu64(k, a, b, c);
}

__m512i _mm512_mask_madd52lo_epu64_wrapper(__m512i a, __mmask8 k, __m512i b, __m512i c) {
  return _mm512_mask_madd52lo_epu64(a, k, b, c);
}

__m512i _mm512_maskz_madd52lo_epu64_wrapper(__mmask8 k, __m512i a, __m512i b, __m512i c) {
  return _mm512_maskz_madd52lo_epu64(k, a, b, c);
}

__m512i _mm512_mask_xor_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_xor_epi32(src, k, a, b);
}

__m512i _mm512_mask_xor_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_xor_epi64(src, k, a, b);
}

__m128i _mm_mask_madd52hi_epu64_wrapper(__m128i a, __mmask8 k, __m128i b, __m128i c) {
  return _mm_mask_madd52hi_epu64(a, k, b, c);
}

__m512i _mm512_mask_max_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epi32(src, k, a, b);
}

__m512i _mm512_mask_max_epu32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epu32(src, k, a, b);
}

__m512i _mm512_mask_min_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epi32(src, k, a, b);
}

__m512i _mm512_mask_min_epu32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epu32(src, k, a, b);
}

__m512i _mm512_mask_mullo_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_mullo_epi32(src, k, a, b);
}

__m512i _mm512_mask_or_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_or_epi32(src, k, a, b);
}

__m512i _mm512_mask_or_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_or_epi64(src, k, a, b);
}

__m512i _mm512_mask_sub_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_sub_epi32(src, k, a, b);
}

__m512i _mm512_xor_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_xor_epi64(a, b);
}

__m128i _mm_mul_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_mul_epi32(a, b);
}

int _mm_movemask_epi8_wrapper(__m128i a) {
  return _mm_movemask_epi8(a);
}

__m512i _mm512_broadcastb_epi8_wrapper(__m128i a) {
  return _mm512_broadcastb_epi8(a);
}

__m512i _mm512_broadcastw_epi16_wrapper(__m128i a) {
  return _mm512_broadcastw_epi16(a);
}

__m512i _mm512_set1_epi8_wrapper(char a) {
  return _mm512_set1_epi8(a);
}

__m512i _mm512_broadcastd_epi32_wrapper(__m128i a) {
  return _mm512_broadcastd_epi32(a);
}

__m512i _mm512_set1_epi64_wrapper(int64_t a) {
  return _mm512_set1_epi64(a);
}

__m512i _mm512_set1_epi16_wrapper(short a) {
  return _mm512_set1_epi16(a);
}

__m512i _mm512_set1_epi32_wrapper(int a) {
  return _mm512_set1_epi32(a);
}

__m512i _mm512_broadcastq_epi64_wrapper(__m128i a) {
  return _mm512_broadcastq_epi64(a);
}

__m512i _mm512_add_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_add_epi8(a, b);
}

__m128i _mm_cvtepu8_epi16_wrapper(__m128i a) {
  return _mm_cvtepu8_epi16(a);
}

__m128i _mm_cvtepi32_epi64_wrapper(__m128i a) {
  return _mm_cvtepi32_epi64(a);
}

__m128i _mm_cvtepu8_epi32_wrapper(__m128i a) {
  return _mm_cvtepu8_epi32(a);
}

__m128i _mm_cvtepi16_epi64_wrapper(__m128i a) {
  return _mm_cvtepi16_epi64(a);
}

__m128i _mm_cvtepi16_epi32_wrapper(__m128i a) {
  return _mm_cvtepi16_epi32(a);
}

__m128i _mm_cvtepi8_epi64_wrapper(__m128i a) {
  return _mm_cvtepi8_epi64(a);
}

__m128i _mm_cvtepu8_epi64_wrapper(__m128i a) {
  return _mm_cvtepu8_epi64(a);
}

__m128i _mm_cvtepu16_epi32_wrapper(__m128i a) {
  return _mm_cvtepu16_epi32(a);
}

__m128i _mm_cvtepi8_epi32_wrapper(__m128i a) {
  return _mm_cvtepi8_epi32(a);
}

__m128i _mm_cvtepu16_epi64_wrapper(__m128i a) {
  return _mm_cvtepu16_epi64(a);
}

__m128i _mm_cvtepu32_epi64_wrapper(__m128i a) {
  return _mm_cvtepu32_epi64(a);
}

__m128i _mm_cvtepi8_epi16_wrapper(__m128i a) {
  return _mm_cvtepi8_epi16(a);
}

__m256i _mm256_abs_epi8_wrapper(__m256i a) {
  return _mm256_abs_epi8(a);
}

__m256i _mm256_abs_epi32_wrapper(__m256i a) {
  return _mm256_abs_epi32(a);
}

__m256i _mm256_abs_epi16_wrapper(__m256i a) {
  return _mm256_abs_epi16(a);
}

__m256i _mm256_mullo_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_mullo_epi16(a, b);
}

__m256i _mm256_mulhi_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_mulhi_epi16(a, b);
}

__m256i _mm256_mul_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_mul_epi32(a, b);
}

__m64 _mm_abs_pi8_wrapper(__m64 a) {
  return _mm_abs_pi8(a);
}

__m64 _mm_abs_pi16_wrapper(__m64 a) {
  return _mm_abs_pi16(a);
}

__m128i _mm_broadcast_i32x2_wrapper(__m128i a) {
  return _mm_broadcast_i32x2(a);
}

__m512i _mm512_broadcast_i32x8_wrapper(__m256i a) {
  return _mm512_broadcast_i32x8(a);
}

__m256i _mm256_broadcast_i64x2_wrapper(__m128i a) {
  return _mm256_broadcast_i64x2(a);
}

__m512i _mm512_broadcast_i64x2_wrapper(__m128i a) {
  return _mm512_broadcast_i64x2(a);
}

__m256i _mm256_broadcast_i32x4_wrapper(__m128i a) {
  return _mm256_broadcast_i32x4(a);
}

__m512i _mm512_broadcast_i32x4_wrapper(__m128i a) {
  return _mm512_broadcast_i32x4(a);
}

__m512i _mm512_broadcast_i64x4_wrapper(__m256i a) {
  return _mm512_broadcast_i64x4(a);
}

__m256i _mm256_broadcast_i32x2_wrapper(__m128i a) {
  return _mm256_broadcast_i32x2(a);
}

__m128i _mm_madd_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_madd_epi16(a, b);
}

__m256i _mm256_madd_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_madd_epi16(a, b);
}

__m512i _mm512_madd_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_madd_epi16(a, b);
}

__m512i _mm512_cvtepi8_epi32_wrapper(__m128i a) {
  return _mm512_cvtepi8_epi32(a);
}

__m512i _mm512_cvtepi16_epi32_wrapper(__m256i a) {
  return _mm512_cvtepi16_epi32(a);
}

__m64 _m_pmaddwd_wrapper(__m64 a, __m64 b) {
  return _m_pmaddwd(a, b);
}

__m64 _mm_madd_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_madd_pi16(a, b);
}

__m512i _mm512_mulhrs_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_mulhrs_epi16(a, b);
}

__m256i _mm256_mullo_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_mullo_epi64(a, b);
}

__m128i _mm_mullo_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_mullo_epi64(a, b);
}

__m256i _mm256_mulhrs_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_mulhrs_epi16(a, b);
}

__m64 _m_pmullw_wrapper(__m64 a, __m64 b) {
  return _m_pmullw(a, b);
}

__m64 _mm_mulhrs_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_mulhrs_pi16(a, b);
}

__m64 _mm_mullo_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_mullo_pi16(a, b);
}

__m128i _mm_mulhi_epu16_wrapper(__m128i a, __m128i b) {
  return _mm_mulhi_epu16(a, b);
}

__m128i _mm_mulhrs_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_mulhrs_epi16(a, b);
}

__m256i _mm256_madd52lo_epu64_wrapper(__m256i a, __m256i b, __m256i c) {
  return _mm256_madd52lo_epu64(a, b, c);
}

__m128i _mm_madd52lo_epu64_wrapper(__m128i a, __m128i b, __m128i c) {
  return _mm_madd52lo_epu64(a, b, c);
}

__m128i _mm_madd52hi_epu64_wrapper(__m128i a, __m128i b, __m128i c) {
  return _mm_madd52hi_epu64(a, b, c);
}

__m512i _mm512_madd52lo_epu64_wrapper(__m512i a, __m512i b, __m512i c) {
  return _mm512_madd52lo_epu64(a, b, c);
}

__m256i _mm256_mullo_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_mullo_epi32(a, b);
}

__m256i _mm256_madd52hi_epu64_wrapper(__m256i a, __m256i b, __m256i c) {
  return _mm256_madd52hi_epu64(a, b, c);
}

__m256i _mm256_mul_epu32_wrapper(__m256i a, __m256i b) {
  return _mm256_mul_epu32(a, b);
}

__m256i _mm256_mulhi_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_mulhi_epu16(a, b);
}

__m128i _mm_mul_epu32_wrapper(__m128i a, __m128i b) {
  return _mm_mul_epu32(a, b);
}

__m128i _mm_mullo_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_mullo_epi32(a, b);
}

__m128i _mm_max_epu64_wrapper(__m128i a, __m128i b) {
  return _mm_max_epu64(a, b);
}

__m128i _mm_max_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_max_epi64(a, b);
}

__m256i _mm256_min_epu64_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epu64(a, b);
}

__m128i _mm_min_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_min_epi64(a, b);
}

__m256i _mm256_min_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_min_epi64(a, b);
}

__m256i _mm256_max_epu64_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epu64(a, b);
}

__m256i _mm256_max_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_max_epi64(a, b);
}

__m512i _mm512_mullo_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_mullo_epi64(a, b);
}

__m512i _mm512_broadcastmb_epi64_wrapper(__mmask8 k) {
  return _mm512_broadcastmb_epi64(k);
}

__m512i _mm512_broadcastmw_epi32_wrapper(__mmask16 k) {
  return _mm512_broadcastmw_epi32(k);
}

__m256i _mm256_broadcastmw_epi32_wrapper(__mmask16 k) {
  return _mm256_broadcastmw_epi32(k);
}

__m128i _mm_broadcastmw_epi32_wrapper(__mmask16 k) {
  return _mm_broadcastmw_epi32(k);
}

__m256i _mm256_broadcastmb_epi64_wrapper(__mmask8 k) {
  return _mm256_broadcastmb_epi64(k);
}

__m128i _mm_broadcastmb_epi64_wrapper(__mmask8 k) {
  return _mm_broadcastmb_epi64(k);
}

__m512i _mm512_cvtepi8_epi16_wrapper(__m256i a) {
  return _mm512_cvtepi8_epi16(a);
}

__m512i _mm512_min_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epi8(a, b);
}

__m512i _mm512_max_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epu16(a, b);
}

__m512i _mm512_min_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epi16(a, b);
}

__m512i _mm512_max_epu8_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epu8(a, b);
}

__m512i _mm512_max_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epi16(a, b);
}

__m512i _mm512_max_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_max_epi8(a, b);
}

__m256i _mm256_mask_broadcastw_epi16_wrapper(__m256i src, __mmask16 k, __m128i a) {
  return _mm256_mask_broadcastw_epi16(src, k, a);
}

__m512i _mm512_maskz_set1_epi8_wrapper(__mmask64 k, char a) {
  return _mm512_maskz_set1_epi8(k, a);
}

__m128i _mm_mask_broadcastb_epi8_wrapper(__m128i src, __mmask16 k, __m128i a) {
  return _mm_mask_broadcastb_epi8(src, k, a);
}

__m128i _mm_mask_set1_epi8_wrapper(__m128i src, __mmask16 k, char a) {
  return _mm_mask_set1_epi8(src, k, a);
}

__m128i _mm_maskz_broadcastb_epi8_wrapper(__mmask16 k, __m128i a) {
  return _mm_maskz_broadcastb_epi8(k, a);
}

__m128i _mm_maskz_set1_epi8_wrapper(__mmask16 k, char a) {
  return _mm_maskz_set1_epi8(k, a);
}

__m256i _mm256_mask_set1_epi16_wrapper(__m256i src, __mmask16 k, short a) {
  return _mm256_mask_set1_epi16(src, k, a);
}

__m256i _mm256_maskz_broadcastw_epi16_wrapper(__mmask16 k, __m128i a) {
  return _mm256_maskz_broadcastw_epi16(k, a);
}

__m256i _mm256_maskz_broadcastb_epi8_wrapper(__mmask32 k, __m128i a) {
  return _mm256_maskz_broadcastb_epi8(k, a);
}

__m256i _mm256_maskz_set1_epi8_wrapper(__mmask32 k, char a) {
  return _mm256_maskz_set1_epi8(k, a);
}

__m512i _mm512_mask_broadcastb_epi8_wrapper(__m512i src, __mmask64 k, __m128i a) {
  return _mm512_mask_broadcastb_epi8(src, k, a);
}

__m512i _mm512_mask_set1_epi8_wrapper(__m512i src, __mmask64 k, char a) {
  return _mm512_mask_set1_epi8(src, k, a);
}

__m512i _mm512_maskz_broadcastb_epi8_wrapper(__mmask64 k, __m128i a) {
  return _mm512_maskz_broadcastb_epi8(k, a);
}

__m256i _mm256_maskz_set1_epi16_wrapper(__mmask16 k, short a) {
  return _mm256_maskz_set1_epi16(k, a);
}

__m256i _mm256_mask_max_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epi16(src, k, a, b);
}

__m128i _mm_maskz_max_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epi16(k, a, b);
}

__m256i _mm256_mask_max_epu8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epu8(src, k, a, b);
}

__m256i _mm256_maskz_max_epu8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epu8(k, a, b);
}

__m512i _mm512_mask_max_epu8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epu8(src, k, a, b);
}

__m512i _mm512_maskz_max_epu8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epu8(k, a, b);
}

__m128i _mm_mask_max_epu8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_max_epu8(src, k, a, b);
}

__m128i _mm_maskz_max_epu8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epu8(k, a, b);
}

__m256i _mm256_mask_max_epu16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epu16(src, k, a, b);
}

__m512i _mm512_mask_broadcastw_epi16_wrapper(__m512i src, __mmask32 k, __m128i a) {
  return _mm512_mask_broadcastw_epi16(src, k, a);
}

__m256i _mm256_mask_broadcastb_epi8_wrapper(__m256i src, __mmask32 k, __m128i a) {
  return _mm256_mask_broadcastb_epi8(src, k, a);
}

__m256i _mm256_mask_set1_epi8_wrapper(__m256i src, __mmask32 k, char a) {
  return _mm256_mask_set1_epi8(src, k, a);
}

__m512i _mm512_mask_set1_epi16_wrapper(__m512i src, __mmask32 k, short a) {
  return _mm512_mask_set1_epi16(src, k, a);
}

__m128i _mm_mask_blend_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_blend_epi16(k, a, b);
}

__m128i _mm_mask_blend_epi8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_blend_epi8(k, a, b);
}

__m256i _mm256_mask_blend_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_blend_epi16(k, a, b);
}

__m512i _mm512_mask_blend_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_blend_epi16(k, a, b);
}

__m512i _mm512_maskz_broadcastw_epi16_wrapper(__mmask32 k, __m128i a) {
  return _mm512_maskz_broadcastw_epi16(k, a);
}

__m512i _mm512_mask_blend_epi8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_blend_epi8(k, a, b);
}

__m512i _mm512_maskz_set1_epi16_wrapper(__mmask32 k, short a) {
  return _mm512_maskz_set1_epi16(k, a);
}

__m128i _mm_mask_broadcastw_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_broadcastw_epi16(src, k, a);
}

__m128i _mm_mask_set1_epi16_wrapper(__m128i src, __mmask8 k, short a) {
  return _mm_mask_set1_epi16(src, k, a);
}

__m128i _mm_maskz_broadcastw_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_broadcastw_epi16(k, a);
}

__m128i _mm_maskz_set1_epi16_wrapper(__mmask8 k, short a) {
  return _mm_maskz_set1_epi16(k, a);
}

__m256i _mm256_mask_blend_epi8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_blend_epi8(k, a, b);
}

__m128i _mm_mask_max_epi8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_max_epi8(src, k, a, b);
}

__m128i _mm_maskz_max_epi8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epi8(k, a, b);
}

__m256i _mm256_maskz_max_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epi16(k, a, b);
}

__m512i _mm512_mask_max_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epi16(src, k, a, b);
}

__m512i _mm512_maskz_max_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epi16(k, a, b);
}

__m128i _mm_mask_max_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_max_epi16(src, k, a, b);
}

__m256i _mm256_maskz_max_epu16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epu16(k, a, b);
}

__m512i _mm512_mask_max_epu16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epu16(src, k, a, b);
}

__m512i _mm512_maskz_max_epu16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epu16(k, a, b);
}

__m128i _mm_mask_max_epu16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_max_epu16(src, k, a, b);
}

__m128i _mm_maskz_max_epu16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epu16(k, a, b);
}

__m256i _mm256_mask_min_epi8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epi8(src, k, a, b);
}

__m256i _mm256_maskz_min_epi8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epi8(k, a, b);
}

__m512i _mm512_mask_min_epi8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epi8(src, k, a, b);
}

__m512i _mm512_maskz_min_epi8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epi8(k, a, b);
}

__m128i _mm_mask_min_epi8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_min_epi8(src, k, a, b);
}

__m128i _mm_maskz_min_epi8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epi8(k, a, b);
}

__m256i _mm256_mask_min_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epi16(src, k, a, b);
}

__m256i _mm256_maskz_min_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epi16(k, a, b);
}

__m512i _mm512_mask_min_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epi16(src, k, a, b);
}

__m512i _mm512_maskz_min_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epi16(k, a, b);
}

__m128i _mm_mask_min_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_min_epi16(src, k, a, b);
}

__m128i _mm_maskz_min_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epi16(k, a, b);
}

__m256i _mm256_mask_min_epu8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epu8(src, k, a, b);
}

__m256i _mm256_maskz_min_epu8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epu8(k, a, b);
}

__m512i _mm512_mask_min_epu8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epu8(src, k, a, b);
}

__m512i _mm512_maskz_min_epu8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epu8(k, a, b);
}

__m128i _mm_mask_min_epu8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_min_epu8(src, k, a, b);
}

__m128i _mm_maskz_min_epu8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epu8(k, a, b);
}

__m256i _mm256_mask_min_epu16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epu16(src, k, a, b);
}

__m256i _mm256_maskz_min_epu16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epu16(k, a, b);
}

__m128i _mm_maskz_madd_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_madd_epi16(k, a, b);
}

__m256i _mm256_maskz_madd_epi16_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_madd_epi16(k, a, b);
}

__m512i _mm512_mask_madd_epi16_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_madd_epi16(src, k, a, b);
}

__m512i _mm512_maskz_madd_epi16_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_madd_epi16(k, a, b);
}

__m256i _mm256_mask_madd_epi16_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_madd_epi16(src, k, a, b);
}

__m128i _mm_mask_madd_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_madd_epi16(src, k, a, b);
}

__m256i _mm256_mask_max_epi8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epi8(src, k, a, b);
}

__m256i _mm256_maskz_max_epi8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epi8(k, a, b);
}

__m512i _mm512_mask_max_epi8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epi8(src, k, a, b);
}

__m512i _mm512_maskz_max_epi8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epi8(k, a, b);
}

__mmask32 _mm256_movepi8_mask_wrapper(__m256i a) {
  return _mm256_movepi8_mask(a);
}

__m512i _mm512_mask_min_epu16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epu16(src, k, a, b);
}

__m512i _mm512_maskz_min_epu16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epu16(k, a, b);
}

__m128i _mm_mask_min_epu16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_min_epu16(src, k, a, b);
}

__m128i _mm_maskz_min_epu16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epu16(k, a, b);
}

__mmask64 _mm512_movepi8_mask_wrapper(__m512i a) {
  return _mm512_movepi8_mask(a);
}

__m256i _mm256_mask_cvtepi8_epi16_wrapper(__m256i src, __mmask16 k, __m128i a) {
  return _mm256_mask_cvtepi8_epi16(src, k, a);
}

__m256i _mm256_maskz_cvtepi8_epi16_wrapper(__mmask16 k, __m128i a) {
  return _mm256_maskz_cvtepi8_epi16(k, a);
}

__m512i _mm512_mask_cvtepi8_epi16_wrapper(__m512i src, __mmask32 k, __m256i a) {
  return _mm512_mask_cvtepi8_epi16(src, k, a);
}

__m512i _mm512_maskz_cvtepi8_epi16_wrapper(__mmask32 k, __m256i a) {
  return _mm512_maskz_cvtepi8_epi16(k, a);
}

__m128i _mm_mask_cvtepi8_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi8_epi16(src, k, a);
}

__m128i _mm_maskz_cvtepi8_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi8_epi16(k, a);
}

__mmask32 _mm512_movepi16_mask_wrapper(__m512i a) {
  return _mm512_movepi16_mask(a);
}

__mmask16 _mm256_movepi16_mask_wrapper(__m256i a) {
  return _mm256_movepi16_mask(a);
}

__mmask8 _mm_movepi16_mask_wrapper(__m128i a) {
  return _mm_movepi16_mask(a);
}

__m128i _mm256_mask_cvtepi16_epi8_wrapper(__m128i src, __mmask16 k, __m256i a) {
  return _mm256_mask_cvtepi16_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtepi16_epi8_wrapper(__mmask16 k, __m256i a) {
  return _mm256_maskz_cvtepi16_epi8(k, a);
}

__m256i _mm512_mask_cvtepi16_epi8_wrapper(__m256i src, __mmask32 k, __m512i a) {
  return _mm512_mask_cvtepi16_epi8(src, k, a);
}

__m256i _mm512_maskz_cvtepi16_epi8_wrapper(__mmask32 k, __m512i a) {
  return _mm512_maskz_cvtepi16_epi8(k, a);
}

__m128i _mm_mask_cvtepi16_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi16_epi8(src, k, a);
}

__m128i _mm_maskz_cvtepi16_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi16_epi8(k, a);
}

__m256i _mm256_mask_cvtepu8_epi16_wrapper(__m256i src, __mmask16 k, __m128i a) {
  return _mm256_mask_cvtepu8_epi16(src, k, a);
}

__m256i _mm256_maskz_cvtepu8_epi16_wrapper(__mmask16 k, __m128i a) {
  return _mm256_maskz_cvtepu8_epi16(k, a);
}

__m256i _mm256_maskz_mulhrs_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_mulhrs_epi16(k, a, b);
}

__m512i _mm512_mask_mulhrs_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_mulhrs_epi16(src, k, a, b);
}

__m512i _mm512_maskz_mulhrs_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_mulhrs_epi16(k, a, b);
}

__m128i _mm_mask_mulhrs_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mulhrs_epi16(src, k, a, b);
}

__m128i _mm_mask_cvtepu8_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepu8_epi16(src, k, a);
}

__m128i _mm_maskz_cvtepu8_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepu8_epi16(k, a);
}

__m256i _mm256_mask_mulhrs_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_mulhrs_epi16(src, k, a, b);
}

__m128i _mm_maskz_mulhrs_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mulhrs_epi16(k, a, b);
}

__m256i _mm256_mask_mulhi_epu16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_mulhi_epu16(src, k, a, b);
}

__m256i _mm256_maskz_mulhi_epu16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_mulhi_epu16(k, a, b);
}

__m512i _mm512_mask_mulhi_epu16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_mulhi_epu16(src, k, a, b);
}

__m512i _mm512_mask_cvtepu8_epi16_wrapper(__m512i src, __mmask32 k, __m256i a) {
  return _mm512_mask_cvtepu8_epi16(src, k, a);
}

__m512i _mm512_maskz_cvtepu8_epi16_wrapper(__mmask32 k, __m256i a) {
  return _mm512_maskz_cvtepu8_epi16(k, a);
}

__m512i _mm512_maskz_mulhi_epu16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_mulhi_epu16(k, a, b);
}

__m128i _mm_mask_mulhi_epu16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mulhi_epu16(src, k, a, b);
}

__m128i _mm_maskz_mulhi_epu16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mulhi_epu16(k, a, b);
}

__m256i _mm256_mask_mulhi_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_mulhi_epi16(src, k, a, b);
}

__m256i _mm256_maskz_mulhi_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_mulhi_epi16(k, a, b);
}

__m512i _mm512_mask_mulhi_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_mulhi_epi16(src, k, a, b);
}

__m512i _mm512_maskz_mulhi_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_mulhi_epi16(k, a, b);
}

__m128i _mm_mask_mulhi_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mulhi_epi16(src, k, a, b);
}

__m128i _mm_maskz_mulhi_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mulhi_epi16(k, a, b);
}

__m256i _mm256_mask_mullo_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_mullo_epi16(src, k, a, b);
}

__m256i _mm256_maskz_mullo_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_mullo_epi16(k, a, b);
}

__m512i _mm512_mask_mullo_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_mullo_epi16(src, k, a, b);
}

__m512i _mm512_maskz_mullo_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_mullo_epi16(k, a, b);
}

__m512i _mm512_mullo_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_mullo_epi16(a, b);
}

__m128i _mm_mask_mullo_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mullo_epi16(src, k, a, b);
}

__m128i _mm_maskz_mullo_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mullo_epi16(k, a, b);
}

__m256i _mm256_maskz_sub_epi8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_sub_epi8(k, a, b);
}

__m512i _mm512_mask_sub_epi8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_sub_epi8(src, k, a, b);
}

__m256i _mm256_mask_sub_epi8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_sub_epi8(src, k, a, b);
}

__m512i _mm512_maskz_sub_epi8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_sub_epi8(k, a, b);
}

__m128i _mm_mask_sub_epi8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_sub_epi8(src, k, a, b);
}

__m128i _mm_maskz_sub_epi8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_sub_epi8(k, a, b);
}

__m256i _mm256_maskz_sub_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_sub_epi16(k, a, b);
}

__m256i _mm256_mask_sub_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_sub_epi16(src, k, a, b);
}

__m512i _mm512_mask_sub_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_sub_epi16(src, k, a, b);
}

__m512i _mm512_maskz_sub_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_sub_epi16(k, a, b);
}

__m128i _mm_mask_sub_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_sub_epi16(src, k, a, b);
}

__m128i _mm_maskz_sub_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_sub_epi16(k, a, b);
}

__m512i _mm512_mask_mullo_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_mullo_epi64(src, k, a, b);
}

__m512i _mm512_maskz_mullo_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_mullo_epi64(k, a, b);
}

__m128i _mm_mask_mullo_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mullo_epi64(src, k, a, b);
}

__m256i _mm256_maskz_mullo_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_mullo_epi64(k, a, b);
}

__m128i _mm_maskz_mullo_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mullo_epi64(k, a, b);
}

__m256i _mm256_mask_mullo_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_mullo_epi64(src, k, a, b);
}

__m128i _mm_mask_mov_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_mov_epi32(src, k, a);
}

__m128i _mm_maskz_mov_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_mov_epi32(k, a);
}

__m256i _mm256_mask_mov_epi64_wrapper(__m256i src, __mmask8 k, __m256i a) {
  return _mm256_mask_mov_epi64(src, k, a);
}

__m256i _mm256_maskz_mov_epi64_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_mov_epi64(k, a);
}

__m256i _mm256_maskz_mov_epi32_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_mov_epi32(k, a);
}

__m128i _mm_mask_mov_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_mov_epi64(src, k, a);
}

__m128i _mm_maskz_mov_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_mov_epi64(k, a);
}

__m256i _mm256_mask_abs_epi32_wrapper(__m256i src, __mmask8 k, __m256i a) {
  return _mm256_mask_abs_epi32(src, k, a);
}

__m256i _mm256_mask_mov_epi32_wrapper(__m256i src, __mmask8 k, __m256i a) {
  return _mm256_mask_mov_epi32(src, k, a);
}

__m256i _mm256_maskz_abs_epi32_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_abs_epi32(k, a);
}

__m128i _mm_mask_abs_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_abs_epi32(src, k, a);
}

__m128i _mm_maskz_abs_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_abs_epi32(k, a);
}

__m256i _mm256_mask_abs_epi64_wrapper(__m256i src, __mmask8 k, __m256i a) {
  return _mm256_mask_abs_epi64(src, k, a);
}

__m256i _mm256_maskz_abs_epi64_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_abs_epi64(k, a);
}

__m128i _mm_mask_abs_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_abs_epi64(src, k, a);
}

__m128i _mm_maskz_abs_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_abs_epi64(k, a);
}

__m256i _mm256_mask_add_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_add_epi32(src, k, a, b);
}

__m256i _mm256_maskz_add_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_add_epi32(k, a, b);
}

__m128i _mm_mask_add_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_add_epi32(src, k, a, b);
}

__m512i _mm512_mask_mov_epi64_wrapper(__m512i src, __mmask8 k, __m512i a) {
  return _mm512_mask_mov_epi64(src, k, a);
}

__m512i _mm512_maskz_xor_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_xor_epi32(k, a, b);
}

__m512i _mm512_maskz_xor_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_xor_epi64(k, a, b);
}

__m512i _mm512_mask_mov_epi32_wrapper(__m512i src, __mmask16 k, __m512i a) {
  return _mm512_mask_mov_epi32(src, k, a);
}

__m512i _mm512_mask_add_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_add_epi32(src, k, a, b);
}

__m512i _mm512_mask_andnot_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_andnot_epi32(src, k, a, b);
}

__m512i _mm512_mask_andnot_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_andnot_epi64(src, k, a, b);
}

__m512i _mm512_mask_and_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_and_epi64(src, k, a, b);
}

__m512i _mm512_mask_blend_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_blend_epi32(k, a, b);
}

__m512i _mm512_mask_blend_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_blend_epi64(k, a, b);
}

__mmask16 _mm512_mask_cmpeq_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epi32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmpge_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epi32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmpgt_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epi32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmple_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epi32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmpneq_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epi32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmpeq_epu32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epu32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmpge_epu32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epu32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmpgt_epu32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epu32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmple_epu32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epu32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmplt_epu32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epu32_mask(k1, a, b);
}

__mmask16 _mm512_mask_cmpneq_epu32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epu32_mask(k1, a, b);
}

__mmask16 _mm512_mask_testn_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_testn_epi32_mask(k1, a, b);
}

__m512i _mm512_cvtepu8_epi32_wrapper(__m128i a) {
  return _mm512_cvtepu8_epi32(a);
}

__m512i _mm512_mask_cvtepu8_epi32_wrapper(__m512i src, __mmask16 k, __m128i a) {
  return _mm512_mask_cvtepu8_epi32(src, k, a);
}

__m512i _mm512_maskz_cvtepu8_epi32_wrapper(__mmask16 k, __m128i a) {
  return _mm512_maskz_cvtepu8_epi32(k, a);
}

__m512i _mm512_cvtepu8_epi64_wrapper(__m128i a) {
  return _mm512_cvtepu8_epi64(a);
}

__m512i _mm512_mask_cvtepu8_epi64_wrapper(__m512i src, __mmask8 k, __m128i a) {
  return _mm512_mask_cvtepu8_epi64(src, k, a);
}

__m512i _mm512_maskz_cvtepu8_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm512_maskz_cvtepu8_epi64(k, a);
}

__m512i _mm512_mul_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_mul_epi32(a, b);
}

__m512i _mm512_mask_mul_epu32_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_mul_epu32(src, k, a, b);
}

__m512i _mm512_maskz_mul_epu32_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_mul_epu32(k, a, b);
}

__m512i _mm512_maskz_mul_epi32_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_mul_epi32(k, a, b);
}

__m512i _mm512_maskz_or_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_or_epi64(k, a, b);
}

__m512i _mm512_maskz_or_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_or_epi32(k, a, b);
}

__m512i _mm512_mask_mul_epi32_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_mul_epi32(src, k, a, b);
}

__m512i _mm512_maskz_cvtepu16_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm512_maskz_cvtepu16_epi64(k, a);
}

__m512i _mm512_maskz_cvtepu16_epi32_wrapper(__mmask16 k, __m256i a) {
  return _mm512_maskz_cvtepu16_epi32(k, a);
}

__m512i _mm512_cvtepu16_epi64_wrapper(__m128i a) {
  return _mm512_cvtepu16_epi64(a);
}

__m512i _mm512_cvtepu32_epi64_wrapper(__m256i a) {
  return _mm512_cvtepu32_epi64(a);
}

__m512i _mm512_mask_cvtepu32_epi64_wrapper(__m512i src, __mmask8 k, __m256i a) {
  return _mm512_mask_cvtepu32_epi64(src, k, a);
}

__m512i _mm512_maskz_cvtepu32_epi64_wrapper(__mmask8 k, __m256i a) {
  return _mm512_maskz_cvtepu32_epi64(k, a);
}

__m512i _mm512_cvtepu16_epi32_wrapper(__m256i a) {
  return _mm512_cvtepu16_epi32(a);
}

__m512i _mm512_mask_cvtepu16_epi32_wrapper(__m512i src, __mmask16 k, __m256i a) {
  return _mm512_mask_cvtepu16_epi32(src, k, a);
}

__m512i _mm512_mask_cvtepu16_epi64_wrapper(__m512i src, __mmask8 k, __m128i a) {
  return _mm512_mask_cvtepu16_epi64(src, k, a);
}

__mmask16 _mm512_testn_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_testn_epi32_mask(a, b);
}

__mmask8 _mm512_test_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_test_epi64_mask(a, b);
}

__mmask8 _mm512_mask_testn_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_testn_epi64_mask(k1, a, b);
}

__mmask8 _mm512_mask_test_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_test_epi64_mask(k1, a, b);
}

__mmask8 _mm512_testn_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_testn_epi64_mask(a, b);
}

__m512i _mm512_mask_cvtepi8_epi32_wrapper(__m512i src, __mmask16 k, __m128i a) {
  return _mm512_mask_cvtepi8_epi32(src, k, a);
}

__m512i _mm512_maskz_cvtepi8_epi32_wrapper(__mmask16 k, __m128i a) {
  return _mm512_maskz_cvtepi8_epi32(k, a);
}

__m512i _mm512_cvtepi8_epi64_wrapper(__m128i a) {
  return _mm512_cvtepi8_epi64(a);
}

__m512i _mm512_mask_cvtepi8_epi64_wrapper(__m512i src, __mmask8 k, __m128i a) {
  return _mm512_mask_cvtepi8_epi64(src, k, a);
}

__m512i _mm512_maskz_cvtepi8_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm512_maskz_cvtepi8_epi64(k, a);
}

__m512i _mm512_cvtepi32_epi64_wrapper(__m256i a) {
  return _mm512_cvtepi32_epi64(a);
}

__m512i _mm512_mask_cvtepi32_epi64_wrapper(__m512i src, __mmask8 k, __m256i a) {
  return _mm512_mask_cvtepi32_epi64(src, k, a);
}

__m512i _mm512_maskz_cvtepi32_epi64_wrapper(__mmask8 k, __m256i a) {
  return _mm512_maskz_cvtepi32_epi64(k, a);
}

__m512i _mm512_mask_cvtepi16_epi32_wrapper(__m512i src, __mmask16 k, __m256i a) {
  return _mm512_mask_cvtepi16_epi32(src, k, a);
}

__m512i _mm512_maskz_cvtepi16_epi32_wrapper(__mmask16 k, __m256i a) {
  return _mm512_maskz_cvtepi16_epi32(k, a);
}

__m512i _mm512_cvtepi16_epi64_wrapper(__m128i a) {
  return _mm512_cvtepi16_epi64(a);
}

__m512i _mm512_mask_cvtepi16_epi64_wrapper(__m512i src, __mmask8 k, __m128i a) {
  return _mm512_mask_cvtepi16_epi64(src, k, a);
}

__m512i _mm512_maskz_cvtepi16_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm512_maskz_cvtepi16_epi64(k, a);
}

__m512i _mm512_maskz_max_epu32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epu32(k, a, b);
}

__m512i _mm512_maskz_max_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epi32(k, a, b);
}

__m512i _mm512_mask_max_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epi64(src, k, a, b);
}

__m512i _mm512_maskz_max_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epi64(k, a, b);
}

__m512i _mm512_mask_max_epu64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_max_epu64(src, k, a, b);
}

__m512i _mm512_maskz_max_epu64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_max_epu64(k, a, b);
}

__m512i _mm512_maskz_min_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epi32(k, a, b);
}

__m512i _mm512_mask_min_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epi64(src, k, a, b);
}

__m512i _mm512_maskz_min_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epi64(k, a, b);
}

__m512i _mm512_maskz_min_epu32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epu32(k, a, b);
}

__m512i _mm512_mask_min_epu64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_min_epu64(src, k, a, b);
}

__m512i _mm512_maskz_min_epu64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_min_epu64(k, a, b);
}

__m128i _mm512_mask_cvtepi32_epi8_wrapper(__m128i src, __mmask16 k, __m512i a) {
  return _mm512_mask_cvtepi32_epi8(src, k, a);
}

__m128i _mm512_maskz_cvtepi32_epi8_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_cvtepi32_epi8(k, a);
}

__m256i _mm512_mask_cvtepi32_epi16_wrapper(__m256i src, __mmask16 k, __m512i a) {
  return _mm512_mask_cvtepi32_epi16(src, k, a);
}

__m256i _mm512_maskz_cvtepi32_epi16_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_cvtepi32_epi16(k, a);
}

__m128i _mm512_mask_cvtepi64_epi8_wrapper(__m128i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtepi64_epi8(src, k, a);
}

__m128i _mm512_maskz_cvtepi64_epi8_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtepi64_epi8(k, a);
}

__m256i _mm512_mask_cvtepi64_epi32_wrapper(__m256i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtepi64_epi32(src, k, a);
}

__m256i _mm512_maskz_cvtepi64_epi32_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtepi64_epi32(k, a);
}

__m128i _mm512_mask_cvtepi64_epi16_wrapper(__m128i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtepi64_epi16(src, k, a);
}

__m128i _mm512_maskz_cvtepi64_epi16_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtepi64_epi16(k, a);
}

__m512i _mm512_maskz_andnot_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_andnot_epi32(k, a, b);
}

__m512i _mm512_maskz_andnot_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_andnot_epi64(k, a, b);
}

__m512i _mm512_maskz_and_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_and_epi64(k, a, b);
}

__m512i _mm512_mask_broadcastd_epi32_wrapper(__m512i src, __mmask16 k, __m128i a) {
  return _mm512_mask_broadcastd_epi32(src, k, a);
}

__m512i _mm512_mask_set1_epi32_wrapper(__m512i src, __mmask16 k, int a) {
  return _mm512_mask_set1_epi32(src, k, a);
}

__m512i _mm512_maskz_broadcastd_epi32_wrapper(__mmask16 k, __m128i a) {
  return _mm512_maskz_broadcastd_epi32(k, a);
}

__m512i _mm512_maskz_set1_epi32_wrapper(__mmask16 k, int a) {
  return _mm512_maskz_set1_epi32(k, a);
}

__m512i _mm512_mask_broadcastq_epi64_wrapper(__m512i src, __mmask8 k, __m128i a) {
  return _mm512_mask_broadcastq_epi64(src, k, a);
}

__m512i _mm512_mask_set1_epi64_wrapper(__m512i src, __mmask8 k, int64_t a) {
  return _mm512_mask_set1_epi64(src, k, a);
}

__m512i _mm512_maskz_mov_epi32_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_mov_epi32(k, a);
}

__m512i _mm512_maskz_mov_epi64_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_mov_epi64(k, a);
}

__m512i _mm512_mask_abs_epi32_wrapper(__m512i src, __mmask16 k, __m512i a) {
  return _mm512_mask_abs_epi32(src, k, a);
}

__m512i _mm512_maskz_abs_epi32_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_abs_epi32(k, a);
}

__m512i _mm512_mask_abs_epi64_wrapper(__m512i src, __mmask8 k, __m512i a) {
  return _mm512_mask_abs_epi64(src, k, a);
}

__m512i _mm512_maskz_abs_epi64_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_abs_epi64(k, a);
}

__m512i _mm512_maskz_add_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_add_epi32(k, a, b);
}

__m512i _mm512_add_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_add_epi64(a, b);
}

__m512i _mm512_mask_add_epi64_wrapper(__m512i src, __mmask8 k, __m512i a, __m512i b) {
  return _mm512_mask_add_epi64(src, k, a, b);
}

__m512i _mm512_maskz_broadcastq_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm512_maskz_broadcastq_epi64(k, a);
}

__m512i _mm512_maskz_set1_epi64_wrapper(__mmask8 k, int64_t a) {
  return _mm512_maskz_set1_epi64(k, a);
}

__m256i _mm256_mask_xor_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_xor_epi32(src, k, a, b);
}

__m256i _mm256_maskz_xor_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_xor_epi32(k, a, b);
}

__m128i _mm_mask_xor_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_xor_epi32(src, k, a, b);
}

__m128i _mm_maskz_xor_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_xor_epi32(k, a, b);
}

__m256i _mm256_mask_xor_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_xor_epi64(src, k, a, b);
}

__m256i _mm256_maskz_xor_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_xor_epi64(k, a, b);
}

__m128i _mm_mask_xor_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_xor_epi64(src, k, a, b);
}

__m128i _mm_maskz_xor_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_xor_epi64(k, a, b);
}

__m512i _mm512_maskz_add_epi64_wrapper(__mmask8 k, __m512i a, __m512i b) {
  return _mm512_maskz_add_epi64(k, a, b);
}

__m512i _mm512_maskz_and_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_and_epi32(k, a, b);
}

__m128i _mm_mask_or_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_or_epi32(src, k, a, b);
}

__m128i _mm_maskz_or_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_or_epi32(k, a, b);
}

__m256i _mm256_mask_or_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_or_epi64(src, k, a, b);
}

__m256i _mm256_maskz_or_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_or_epi64(k, a, b);
}

__m128i _mm_mask_or_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_or_epi64(src, k, a, b);
}

__m128i _mm_maskz_or_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_or_epi64(k, a, b);
}

__m256i _mm256_mask_sub_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_sub_epi32(src, k, a, b);
}

__m256i _mm256_maskz_sub_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_sub_epi32(k, a, b);
}

__m128i _mm_mask_sub_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_sub_epi32(src, k, a, b);
}

__m128i _mm_maskz_sub_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_sub_epi32(k, a, b);
}

__m256i _mm256_mask_sub_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_sub_epi64(src, k, a, b);
}

__m256i _mm256_maskz_sub_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_sub_epi64(k, a, b);
}

__m128i _mm_mask_sub_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_sub_epi64(src, k, a, b);
}

__m128i _mm_maskz_sub_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_sub_epi64(k, a, b);
}

__mmask8 _mm256_mask_test_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_test_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_test_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_test_epi32_mask(k1, a, b);
}

__mmask8 _mm256_mask_test_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_test_epi64_mask(k1, a, b);
}

__mmask8 _mm_mask_test_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_test_epi64_mask(k1, a, b);
}

__mmask8 _mm256_mask_testn_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_testn_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_testn_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_testn_epi32_mask(k1, a, b);
}

__mmask8 _mm256_mask_testn_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_testn_epi64_mask(k1, a, b);
}

__mmask8 _mm256_testn_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_testn_epi64_mask(a, b);
}

__mmask8 _mm_mask_testn_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_testn_epi64_mask(k1, a, b);
}

__mmask8 _mm_testn_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_testn_epi64_mask(a, b);
}

__m128i _mm_mask_mul_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mul_epi32(src, k, a, b);
}

__m128i _mm_maskz_mul_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mul_epi32(k, a, b);
}

__m256i _mm256_mask_mullo_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_mullo_epi32(src, k, a, b);
}

__m256i _mm256_maskz_mullo_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_mullo_epi32(k, a, b);
}

__m512i _mm512_maskz_mullo_epi32_wrapper(__mmask16 k, __m512i a, __m512i b) {
  return _mm512_maskz_mullo_epi32(k, a, b);
}

__m128i _mm_mask_mullo_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mullo_epi32(src, k, a, b);
}

__m128i _mm_maskz_mullo_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mullo_epi32(k, a, b);
}

__m256i _mm256_mask_mul_epu32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_mul_epu32(src, k, a, b);
}

__m256i _mm256_maskz_mul_epu32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_mul_epu32(k, a, b);
}

__m128i _mm_mask_mul_epu32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_mul_epu32(src, k, a, b);
}

__m128i _mm_maskz_mul_epu32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_mul_epu32(k, a, b);
}

__m256i _mm256_mask_or_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_or_epi32(src, k, a, b);
}

__m256i _mm256_maskz_or_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_or_epi32(k, a, b);
}

__m256i _mm256_mask_cvtepu8_epi32_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepu8_epi32(src, k, a);
}

__m256i _mm256_maskz_cvtepu8_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepu8_epi32(k, a);
}

__m128i _mm_mask_cvtepu8_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepu8_epi32(src, k, a);
}

__m128i _mm_maskz_cvtepu8_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepu8_epi32(k, a);
}

__m256i _mm256_mask_cvtepu8_epi64_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepu8_epi64(src, k, a);
}

__m256i _mm256_maskz_cvtepu8_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepu8_epi64(k, a);
}

__m128i _mm_mask_cvtepu8_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepu8_epi64(src, k, a);
}

__m128i _mm_maskz_cvtepu8_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepu8_epi64(k, a);
}

__m256i _mm256_mask_cvtepu32_epi64_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepu32_epi64(src, k, a);
}

__m256i _mm256_maskz_cvtepu32_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepu32_epi64(k, a);
}

__m128i _mm_mask_cvtepu32_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepu32_epi64(src, k, a);
}

__m128i _mm_maskz_cvtepu32_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepu32_epi64(k, a);
}

__m256i _mm256_mask_cvtepu16_epi32_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepu16_epi32(src, k, a);
}

__m256i _mm256_maskz_cvtepu16_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepu16_epi32(k, a);
}

__m128i _mm_mask_cvtepu16_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepu16_epi32(src, k, a);
}

__m128i _mm_maskz_cvtepu16_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepu16_epi32(k, a);
}

__m256i _mm256_mask_cvtepu16_epi64_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepu16_epi64(src, k, a);
}

__m256i _mm256_maskz_cvtepu16_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepu16_epi64(k, a);
}

__m128i _mm_mask_cvtepu16_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepu16_epi64(src, k, a);
}

__m128i _mm_maskz_cvtepu16_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepu16_epi64(k, a);
}

__m256i _mm256_mask_mul_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_mul_epi32(src, k, a, b);
}

__m256i _mm256_maskz_mul_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_mul_epi32(k, a, b);
}

__m256i _mm256_mask_cvtepi8_epi32_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepi8_epi32(src, k, a);
}

__m256i _mm256_maskz_cvtepi8_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepi8_epi32(k, a);
}

__m128i _mm_mask_cvtepi8_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi8_epi32(src, k, a);
}

__m128i _mm_maskz_cvtepi8_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi8_epi32(k, a);
}

__m256i _mm256_mask_cvtepi8_epi64_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepi8_epi64(src, k, a);
}

__m256i _mm256_maskz_cvtepi8_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepi8_epi64(k, a);
}

__m128i _mm_mask_cvtepi8_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi8_epi64(src, k, a);
}

__m128i _mm_maskz_cvtepi8_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi8_epi64(k, a);
}

__m256i _mm256_mask_cvtepi32_epi64_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepi32_epi64(src, k, a);
}

__m256i _mm256_maskz_cvtepi32_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepi32_epi64(k, a);
}

__m128i _mm_mask_cvtepi32_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi32_epi64(src, k, a);
}

__m128i _mm_maskz_cvtepi32_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi32_epi64(k, a);
}

__m256i _mm256_mask_cvtepi16_epi32_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepi16_epi32(src, k, a);
}

__m256i _mm256_maskz_cvtepi16_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepi16_epi32(k, a);
}

__m128i _mm_mask_cvtepi16_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi16_epi32(src, k, a);
}

__m128i _mm_maskz_cvtepi16_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi16_epi32(k, a);
}

__m256i _mm256_mask_cvtepi16_epi64_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_cvtepi16_epi64(src, k, a);
}

__m256i _mm256_maskz_cvtepi16_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_cvtepi16_epi64(k, a);
}

__m128i _mm_mask_cvtepi16_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi16_epi64(src, k, a);
}

__m128i _mm_maskz_cvtepi16_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi16_epi64(k, a);
}

__m128i _mm256_maskz_cvtepi32_epi16_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtepi32_epi16(k, a);
}

__m128i _mm_mask_cvtepi32_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi32_epi16(src, k, a);
}

__m128i _mm_maskz_cvtepi32_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi32_epi16(k, a);
}

__m128i _mm256_mask_cvtepi64_epi8_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtepi64_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtepi64_epi8_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtepi64_epi8(k, a);
}

__m128i _mm_mask_cvtepi64_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi64_epi8(src, k, a);
}

__m128i _mm_maskz_cvtepi64_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi64_epi8(k, a);
}

__m128i _mm256_mask_cvtepi64_epi32_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtepi64_epi32(src, k, a);
}

__m128i _mm256_maskz_cvtepi64_epi32_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtepi64_epi32(k, a);
}

__m128i _mm_mask_cvtepi64_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi64_epi32(src, k, a);
}

__m128i _mm_maskz_cvtepi64_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi64_epi32(k, a);
}

__m128i _mm256_mask_cvtepi64_epi16_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtepi64_epi16(src, k, a);
}

__m128i _mm256_maskz_cvtepi64_epi16_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtepi64_epi16(k, a);
}

__m128i _mm_mask_cvtepi64_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi64_epi16(src, k, a);
}

__m128i _mm_maskz_cvtepi64_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi64_epi16(k, a);
}

__m256i _mm256_mask_min_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epi64(src, k, a, b);
}

__m256i _mm256_maskz_min_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epi64(k, a, b);
}

__m128i _mm_mask_min_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_min_epi64(src, k, a, b);
}

__m128i _mm_maskz_min_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epi64(k, a, b);
}

__m256i _mm256_mask_min_epu32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epu32(src, k, a, b);
}

__m256i _mm256_maskz_min_epu32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epu32(k, a, b);
}

__m128i _mm_mask_min_epu32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_min_epu32(src, k, a, b);
}

__m128i _mm_maskz_min_epu32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epu32(k, a, b);
}

__m256i _mm256_mask_min_epu64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epu64(src, k, a, b);
}

__m256i _mm256_maskz_min_epu64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epu64(k, a, b);
}

__m128i _mm_mask_min_epu64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_min_epu64(src, k, a, b);
}

__m128i _mm_maskz_min_epu64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epu64(k, a, b);
}

__m128i _mm256_mask_cvtepi32_epi8_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtepi32_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtepi32_epi8_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtepi32_epi8(k, a);
}

__m128i _mm_mask_cvtepi32_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtepi32_epi8(src, k, a);
}

__m128i _mm_maskz_cvtepi32_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtepi32_epi8(k, a);
}

__m128i _mm256_mask_cvtepi32_epi16_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtepi32_epi16(src, k, a);
}

__m256i _mm256_mask_max_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epi32(src, k, a, b);
}

__m256i _mm256_maskz_max_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epi32(k, a, b);
}

__m128i _mm_mask_max_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_max_epi32(src, k, a, b);
}

__m128i _mm_maskz_max_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epi32(k, a, b);
}

__m256i _mm256_mask_max_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epi64(src, k, a, b);
}

__m256i _mm256_maskz_max_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epi64(k, a, b);
}

__m128i _mm_mask_max_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_max_epi64(src, k, a, b);
}

__m128i _mm_maskz_max_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epi64(k, a, b);
}

__m256i _mm256_mask_max_epu32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epu32(src, k, a, b);
}

__m256i _mm256_maskz_max_epu32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epu32(k, a, b);
}

__m128i _mm_mask_max_epu32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_max_epu32(src, k, a, b);
}

__m128i _mm_maskz_max_epu32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epu32(k, a, b);
}

__m256i _mm256_mask_max_epu64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_max_epu64(src, k, a, b);
}

__m256i _mm256_maskz_max_epu64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_max_epu64(k, a, b);
}

__m128i _mm_mask_max_epu64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_max_epu64(src, k, a, b);
}

__m128i _mm_maskz_max_epu64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_max_epu64(k, a, b);
}

__m256i _mm256_mask_min_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_min_epi32(src, k, a, b);
}

__m256i _mm256_maskz_min_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_min_epi32(k, a, b);
}

__m128i _mm_mask_min_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_min_epi32(src, k, a, b);
}

__m128i _mm_maskz_min_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_min_epi32(k, a, b);
}

__mmask8 _mm256_mask_cmpneq_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpeq_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpneq_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epi32_mask(k1, a, b);
}

__m128i _mm_mask_set1_epi32_wrapper(__m128i src, __mmask8 k, int a) {
  return _mm_mask_set1_epi32(src, k, a);
}

__m128i _mm_maskz_broadcastd_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_broadcastd_epi32(k, a);
}

__m128i _mm_maskz_set1_epi32_wrapper(__mmask8 k, int a) {
  return _mm_maskz_set1_epi32(k, a);
}

__m256i _mm256_mask_broadcastq_epi64_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_broadcastq_epi64(src, k, a);
}

__m256i _mm256_mask_set1_epi64_wrapper(__m256i src, __mmask8 k, int64_t a) {
  return _mm256_mask_set1_epi64(src, k, a);
}

__m256i _mm256_maskz_broadcastq_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_broadcastq_epi64(k, a);
}

__m256i _mm256_maskz_set1_epi64_wrapper(__mmask8 k, int64_t a) {
  return _mm256_maskz_set1_epi64(k, a);
}

__m128i _mm_mask_broadcastq_epi64_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_broadcastq_epi64(src, k, a);
}

__m128i _mm_mask_set1_epi64_wrapper(__m128i src, __mmask8 k, int64_t a) {
  return _mm_mask_set1_epi64(src, k, a);
}

__m128i _mm_maskz_broadcastq_epi64_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_broadcastq_epi64(k, a);
}

__m128i _mm_maskz_set1_epi64_wrapper(__mmask8 k, int64_t a) {
  return _mm_maskz_set1_epi64(k, a);
}

__mmask8 _mm256_mask_cmpeq_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epi32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpge_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epi32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpgt_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epi32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmple_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epi32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmplt_epi32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpge_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpgt_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmple_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epi32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmplt_epi32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epi32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpeq_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epi64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpge_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epi64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpgt_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epi64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmple_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epi64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmplt_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epi64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpneq_epi64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epi64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpeq_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epi64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpge_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epi64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpgt_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epi64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmple_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epi64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmplt_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epi64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpneq_epi64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epi64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpeq_epu32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epu32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpge_epu32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epu32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpgt_epu32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epu32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmple_epu32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epu32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmplt_epu32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epu32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpneq_epu32_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epu32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpeq_epu32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epu32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpge_epu32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epu32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpgt_epu32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epu32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmple_epu32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epu32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmplt_epu32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epu32_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpneq_epu32_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epu32_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpeq_epu64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epu64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpge_epu64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epu64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpgt_epu64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epu64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmple_epu64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epu64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmplt_epu64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epu64_mask(k1, a, b);
}

__mmask8 _mm256_mask_cmpneq_epu64_mask_wrapper(__mmask8 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epu64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpeq_epu64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epu64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpge_epu64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epu64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpgt_epu64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epu64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmple_epu64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epu64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmplt_epu64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epu64_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpneq_epu64_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epu64_mask(k1, a, b);
}

__m128i _mm_maskz_andnot_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_andnot_epi64(k, a, b);
}

__m256i _mm256_mask_and_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_and_epi64(src, k, a, b);
}

__m256i _mm256_maskz_and_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_and_epi64(k, a, b);
}

__m128i _mm_mask_and_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_and_epi64(src, k, a, b);
}

__m128i _mm_maskz_and_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_and_epi64(k, a, b);
}

__m256i _mm256_mask_blend_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_blend_epi32(k, a, b);
}

__m128i _mm_mask_blend_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_blend_epi32(k, a, b);
}

__m256i _mm256_mask_blend_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_blend_epi64(k, a, b);
}

__m128i _mm_mask_blend_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_blend_epi64(k, a, b);
}

__m256i _mm256_mask_broadcastd_epi32_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_broadcastd_epi32(src, k, a);
}

__m256i _mm256_mask_set1_epi32_wrapper(__m256i src, __mmask8 k, int a) {
  return _mm256_mask_set1_epi32(src, k, a);
}

__m256i _mm256_maskz_broadcastd_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_broadcastd_epi32(k, a);
}

__m256i _mm256_maskz_set1_epi32_wrapper(__mmask8 k, int a) {
  return _mm256_maskz_set1_epi32(k, a);
}

__m128i _mm_mask_broadcastd_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_broadcastd_epi32(src, k, a);
}

__m128i _mm_maskz_add_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_add_epi32(k, a, b);
}

__m256i _mm256_mask_add_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_add_epi64(src, k, a, b);
}

__m256i _mm256_maskz_add_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_add_epi64(k, a, b);
}

__m128i _mm_mask_add_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_add_epi64(src, k, a, b);
}

__m128i _mm_maskz_add_epi64_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_add_epi64(k, a, b);
}

__m256i _mm256_mask_and_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_and_epi32(src, k, a, b);
}

__m256i _mm256_maskz_and_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_and_epi32(k, a, b);
}

__m128i _mm_mask_and_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_and_epi32(src, k, a, b);
}

__m128i _mm_maskz_and_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_and_epi32(k, a, b);
}

__m256i _mm256_mask_andnot_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_andnot_epi32(src, k, a, b);
}

__m256i _mm256_maskz_andnot_epi32_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_andnot_epi32(k, a, b);
}

__m128i _mm_mask_andnot_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_andnot_epi32(src, k, a, b);
}

__m128i _mm_maskz_andnot_epi32_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_andnot_epi32(k, a, b);
}

__m256i _mm256_mask_andnot_epi64_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_andnot_epi64(src, k, a, b);
}

__m256i _mm256_maskz_andnot_epi64_wrapper(__mmask8 k, __m256i a, __m256i b) {
  return _mm256_maskz_andnot_epi64(k, a, b);
}

__m128i _mm_mask_andnot_epi64_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_andnot_epi64(src, k, a, b);
}

__mmask8 _mm256_movepi32_mask_wrapper(__m256i a) {
  return _mm256_movepi32_mask(a);
}

__mmask16 _mm512_movepi32_mask_wrapper(__m512i a) {
  return _mm512_movepi32_mask(a);
}

__mmask8 _mm_movepi32_mask_wrapper(__m128i a) {
  return _mm_movepi32_mask(a);
}

__m256i _mm256_movm_epi32_wrapper(__mmask8 k) {
  return _mm256_movm_epi32(k);
}

__m512i _mm512_movm_epi32_wrapper(__mmask16 k) {
  return _mm512_movm_epi32(k);
}

__m128i _mm_movm_epi32_wrapper(__mmask8 k) {
  return _mm_movm_epi32(k);
}

__m256i _mm256_movm_epi64_wrapper(__mmask8 k) {
  return _mm256_movm_epi64(k);
}

__m512i _mm512_movm_epi64_wrapper(__mmask8 k) {
  return _mm512_movm_epi64(k);
}

__m128i _mm_movm_epi64_wrapper(__mmask8 k) {
  return _mm_movm_epi64(k);
}

__mmask8 _mm256_movepi64_mask_wrapper(__m256i a) {
  return _mm256_movepi64_mask(a);
}

__mmask8 _mm512_movepi64_mask_wrapper(__m512i a) {
  return _mm512_movepi64_mask(a);
}

__mmask8 _mm_movepi64_mask_wrapper(__m128i a) {
  return _mm_movepi64_mask(a);
}

__mmask32 _mm256_mask_test_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_test_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_test_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_test_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_test_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_test_epi8_mask(k1, a, b);
}

__mmask16 _mm256_mask_test_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_test_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_test_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_test_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_test_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_test_epi16_mask(k1, a, b);
}

__mmask32 _mm256_mask_testn_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_testn_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_testn_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_testn_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_testn_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_testn_epi8_mask(k1, a, b);
}

__mmask16 _mm256_mask_testn_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_testn_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_testn_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_testn_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_testn_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_testn_epi16_mask(k1, a, b);
}

__mmask16 _mm_movepi8_mask_wrapper(__m128i a) {
  return _mm_movepi8_mask(a);
}

__m256i _mm256_movm_epi8_wrapper(__mmask32 k) {
  return _mm256_movm_epi8(k);
}

__m512i _mm512_movm_epi8_wrapper(__mmask64 k) {
  return _mm512_movm_epi8(k);
}

__m128i _mm_movm_epi8_wrapper(__mmask16 k) {
  return _mm_movm_epi8(k);
}

__m256i _mm256_movm_epi16_wrapper(__mmask16 k) {
  return _mm256_movm_epi16(k);
}

__m512i _mm512_movm_epi16_wrapper(__mmask32 k) {
  return _mm512_movm_epi16(k);
}

__m128i _mm_movm_epi16_wrapper(__mmask8 k) {
  return _mm_movm_epi16(k);
}

__m512i _mm512_mask_avg_epu16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_avg_epu16(src, k, a, b);
}

__m256i _mm256_maskz_avg_epu16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_avg_epu16(k, a, b);
}

__m256i _mm256_mask_avg_epu16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_avg_epu16(src, k, a, b);
}

__m128i _mm_maskz_avg_epu8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_avg_epu8(k, a, b);
}

__m128i _mm_mask_avg_epu8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_avg_epu8(src, k, a, b);
}

__m512i _mm512_maskz_avg_epu8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_avg_epu8(k, a, b);
}

__m512i _mm512_mask_avg_epu8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_avg_epu8(src, k, a, b);
}

__m256i _mm256_maskz_avg_epu8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_avg_epu8(k, a, b);
}

__m256i _mm256_mask_avg_epu8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_avg_epu8(src, k, a, b);
}

__mmask16 _mm256_mask_cmpge_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epi16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmpgt_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epi16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmple_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epi16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmplt_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epi16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmpneq_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpeq_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpge_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpgt_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmple_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmplt_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epi16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpneq_epi16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpeq_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpge_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpgt_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmple_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmplt_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epi16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpneq_epi16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epi16_mask(k1, a, b);
}

__m128i _mm_maskz_avg_epu16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_avg_epu16(k, a, b);
}

__m128i _mm_mask_avg_epu16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_avg_epu16(src, k, a, b);
}

__m512i _mm512_maskz_avg_epu16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_avg_epu16(k, a, b);
}

__mmask16 _mm_mask_cmpneq_epu8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epu8_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmpeq_epu16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epu16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmpge_epu16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epu16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmpgt_epu16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epu16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmple_epu16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epu16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmplt_epu16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epu16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmpneq_epu16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epu16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpeq_epu16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epu16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpge_epu16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epu16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpgt_epu16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epu16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmple_epu16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epu16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmplt_epu16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epu16_mask(k1, a, b);
}

__mmask32 _mm512_mask_cmpneq_epu16_mask_wrapper(__mmask32 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epu16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpeq_epu16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epu16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpge_epu16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epu16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpgt_epu16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epu16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmple_epu16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epu16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmplt_epu16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epu16_mask(k1, a, b);
}

__mmask8 _mm_mask_cmpneq_epu16_mask_wrapper(__mmask8 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epu16_mask(k1, a, b);
}

__mmask16 _mm256_mask_cmpeq_epi16_mask_wrapper(__mmask16 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epi16_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmpneq_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpeq_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpge_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpgt_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmple_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmplt_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epi8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpneq_epi8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmpeq_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmpge_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmpgt_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmple_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmplt_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epi8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmpneq_epi8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpneq_epi8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmpeq_epu8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epu8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmpge_epu8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epu8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmpgt_epu8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epu8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmple_epu8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epu8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmplt_epu8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epu8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmpneq_epu8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpneq_epu8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpeq_epu8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epu8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpge_epu8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epu8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpgt_epu8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epu8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmple_epu8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epu8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmplt_epu8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epu8_mask(k1, a, b);
}

__mmask64 _mm512_mask_cmpneq_epu8_mask_wrapper(__mmask64 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epu8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmpeq_epu8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpeq_epu8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmpge_epu8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpge_epu8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmpgt_epu8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmpgt_epu8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmple_epu8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmple_epu8_mask(k1, a, b);
}

__mmask16 _mm_mask_cmplt_epu8_mask_wrapper(__mmask16 k1, __m128i a, __m128i b) {
  return _mm_mask_cmplt_epu8_mask(k1, a, b);
}

__m128i _mm_cvtepi32_epi16_wrapper(__m128i a) {
  return _mm_cvtepi32_epi16(a);
}

__m128i _mm256_cvtepi64_epi8_wrapper(__m256i a) {
  return _mm256_cvtepi64_epi8(a);
}

__m128i _mm_cvtepi64_epi8_wrapper(__m128i a) {
  return _mm_cvtepi64_epi8(a);
}

__m128i _mm256_cvtepi64_epi32_wrapper(__m256i a) {
  return _mm256_cvtepi64_epi32(a);
}

__m128i _mm_cvtepi64_epi32_wrapper(__m128i a) {
  return _mm_cvtepi64_epi32(a);
}

__m128i _mm256_cvtepi64_epi16_wrapper(__m256i a) {
  return _mm256_cvtepi64_epi16(a);
}

__m128i _mm_cvtepi64_epi16_wrapper(__m128i a) {
  return _mm_cvtepi64_epi16(a);
}

__m128i _mm512_cvtepi32_epi8_wrapper(__m512i a) {
  return _mm512_cvtepi32_epi8(a);
}

__m256i _mm512_cvtepi32_epi16_wrapper(__m512i a) {
  return _mm512_cvtepi32_epi16(a);
}

__m128i _mm512_cvtepi64_epi8_wrapper(__m512i a) {
  return _mm512_cvtepi64_epi8(a);
}

__m256i _mm512_cvtepi64_epi32_wrapper(__m512i a) {
  return _mm512_cvtepi64_epi32(a);
}

__m128i _mm512_cvtepi64_epi16_wrapper(__m512i a) {
  return _mm512_cvtepi64_epi16(a);
}

__mmask32 _mm256_mask_cmpeq_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpeq_epi8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmpge_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpge_epi8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmpgt_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmpgt_epi8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmple_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmple_epi8_mask(k1, a, b);
}

__mmask32 _mm256_mask_cmplt_epi8_mask_wrapper(__mmask32 k1, __m256i a, __m256i b) {
  return _mm256_mask_cmplt_epi8_mask(k1, a, b);
}

__m256i _mm256_avg_epu8_wrapper(__m256i a, __m256i b) {
  return _mm256_avg_epu8(a, b);
}

__m256i _mm256_avg_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_avg_epu16(a, b);
}

__m128i _mm_cvtepi32_epi8_wrapper(__m128i a) {
  return _mm_cvtepi32_epi8(a);
}

__m128i _mm_min_epu64_wrapper(__m128i a, __m128i b) {
  return _mm_min_epu64(a, b);
}

__m128i _mm256_cvtepi32_epi8_wrapper(__m256i a) {
  return _mm256_cvtepi32_epi8(a);
}

__m128i _mm256_cvtepi16_epi8_wrapper(__m256i a) {
  return _mm256_cvtepi16_epi8(a);
}

__m256i _mm512_cvtepi16_epi8_wrapper(__m512i a) {
  return _mm512_cvtepi16_epi8(a);
}

__m128i _mm_cvtepi16_epi8_wrapper(__m128i a) {
  return _mm_cvtepi16_epi8(a);
}

__m128i _mm256_cvtepi32_epi16_wrapper(__m256i a) {
  return _mm256_cvtepi32_epi16(a);
}

__mmask8 _mm_testn_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_testn_epi16_mask(a, b);
}

__mmask32 _mm512_testn_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_testn_epi16_mask(a, b);
}

__mmask16 _mm256_testn_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_testn_epi16_mask(a, b);
}

__mmask16 _mm_testn_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_testn_epi8_mask(a, b);
}

__mmask64 _mm512_testn_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_testn_epi8_mask(a, b);
}

__mmask32 _mm256_testn_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_testn_epi8_mask(a, b);
}

__mmask8 _mm_test_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_test_epi16_mask(a, b);
}

__mmask32 _mm512_test_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_test_epi16_mask(a, b);
}

__mmask16 _mm256_test_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_test_epi16_mask(a, b);
}

__mmask16 _mm_test_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_test_epi8_mask(a, b);
}

__mmask64 _mm512_test_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_test_epi8_mask(a, b);
}

__mmask32 _mm256_test_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_test_epi8_mask(a, b);
}

__m512i _mm512_sub_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_sub_epi16(a, b);
}

__m128i _mm_sub_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_sub_epi32(a, b);
}

__m128i _mm_sub_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_sub_epi16(a, b);
}

__m128i _mm_sub_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_sub_epi8(a, b);
}

__m128i _mm_min_epu8_wrapper(__m128i a, __m128i b) {
  return _mm_min_epu8(a, b);
}

__m128i _mm_min_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_min_epi16(a, b);
}

__m128i _mm_max_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_max_epi16(a, b);
}

__m128i _mm_max_epu8_wrapper(__m128i a, __m128i b) {
  return _mm_max_epu8(a, b);
}

__m128i _mm_avg_epu16_wrapper(__m128i a, __m128i b) {
  return _mm_avg_epu16(a, b);
}

__m128i _mm_add_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_add_epi16(a, b);
}

__m128i _mm_avg_epu8_wrapper(__m128i a, __m128i b) {
  return _mm_avg_epu8(a, b);
}

__m128i _mm_add_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_add_epi64(a, b);
}

__m128i _mm_add_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_add_epi32(a, b);
}

__m128i _mm_add_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_add_epi8(a, b);
}

__m256i _mm256_add_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_add_epi32(a, b);
}

__m256i _mm256_add_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_add_epi64(a, b);
}

__m256i _mm256_add_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_add_epi8(a, b);
}

__m256i _mm256_add_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_add_epi16(a, b);
}

__m512i _mm512_add_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_add_epi16(a, b);
}

__mmask64 _mm512_cmpeq_epu8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epu8_mask(a, b);
}

__mmask16 _mm_cmpeq_epu8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epu8_mask(a, b);
}

__mmask16 _mm256_cmpeq_epu16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epu16_mask(a, b);
}

__mmask32 _mm512_cmpeq_epu16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epu16_mask(a, b);
}

__mmask8 _mm_cmpeq_epu16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epu16_mask(a, b);
}

__mmask16 _mm256_cmpeq_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi16_mask(a, b);
}

__mmask32 _mm512_cmpeq_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epi16_mask(a, b);
}

__mmask8 _mm_cmpeq_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi16_mask(a, b);
}

__mmask8 _mm256_cmpeq_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi32_mask(a, b);
}

__mmask8 _mm_cmpeq_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi32_mask(a, b);
}

__mmask8 _mm256_cmpeq_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi64_mask(a, b);
}

__mmask8 _mm_cmpeq_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi64_mask(a, b);
}

__mmask8 _mm256_cmpeq_epu32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epu32_mask(a, b);
}

__mmask8 _mm_cmpeq_epu32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epu32_mask(a, b);
}

__mmask8 _mm256_cmpeq_epu64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epu64_mask(a, b);
}

__mmask8 _mm_cmpeq_epu64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epu64_mask(a, b);
}

__mmask8 _mm512_cmpeq_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epi64_mask(a, b);
}

__mmask8 _mm512_cmpeq_epu64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epu64_mask(a, b);
}

__mmask16 _mm512_cmpeq_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epi32_mask(a, b);
}

__mmask16 _mm512_cmpeq_epu32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epu32_mask(a, b);
}

__m64 _m_pcmpeqb_wrapper(__m64 a, __m64 b) {
  return _m_pcmpeqb(a, b);
}

__m64 _m_pcmpeqw_wrapper(__m64 a, __m64 b) {
  return _m_pcmpeqw(a, b);
}

__m64 _m_pcmpeqd_wrapper(__m64 a, __m64 b) {
  return _m_pcmpeqd(a, b);
}

__m64 _mm_cmpeq_pi8_wrapper(__m64 a, __m64 b) {
  return _mm_cmpeq_pi8(a, b);
}

__m64 _mm_cmpeq_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_cmpeq_pi16(a, b);
}

__m64 _mm_cmpeq_pi32_wrapper(__m64 a, __m64 b) {
  return _mm_cmpeq_pi32(a, b);
}

__m128i _mm_cmpeq_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi8(a, b);
}

__m128i _mm_cmpeq_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi16(a, b);
}

__m128i _mm_cmpeq_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi32(a, b);
}

__m128i _mm_cmpeq_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi64(a, b);
}

__m256i _mm256_cmpeq_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi8(a, b);
}

__m256i _mm256_cmpeq_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi16(a, b);
}

__m256i _mm256_cmpeq_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi32(a, b);
}

__m256i _mm256_cmpeq_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi64(a, b);
}

__mmask32 _mm256_cmpeq_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epi8_mask(a, b);
}

__mmask64 _mm512_cmpeq_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpeq_epi8_mask(a, b);
}

__mmask16 _mm_cmpeq_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpeq_epi8_mask(a, b);
}

__mmask32 _mm256_cmpeq_epu8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpeq_epu8_mask(a, b);
}

__mmask32 _mm256_cmplt_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epi8_mask(a, b);
}

__mmask32 _mm256_cmpneq_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epi8_mask(a, b);
}

__mmask64 _mm512_cmplt_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epi8_mask(a, b);
}

__mmask16 _mm_cmplt_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epi8_mask(a, b);
}

__mmask32 _mm256_cmplt_epu8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epu8_mask(a, b);
}

__mmask64 _mm512_cmplt_epu8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epu8_mask(a, b);
}

__mmask16 _mm_cmplt_epu8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epu8_mask(a, b);
}

__mmask16 _mm256_cmplt_epu16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epu16_mask(a, b);
}

__mmask32 _mm512_cmplt_epu16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epu16_mask(a, b);
}

__mmask8 _mm_cmplt_epu16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epu16_mask(a, b);
}

__mmask16 _mm256_cmplt_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epi16_mask(a, b);
}

__mmask32 _mm512_cmplt_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epi16_mask(a, b);
}

__mmask8 _mm_cmplt_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epi16_mask(a, b);
}

__mmask8 _mm256_cmplt_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epi32_mask(a, b);
}

__mmask8 _mm256_cmpneq_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epi32_mask(a, b);
}

__mmask8 _mm_cmplt_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epi32_mask(a, b);
}

__mmask8 _mm256_cmplt_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epi64_mask(a, b);
}

__mmask8 _mm256_cmpneq_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epi64_mask(a, b);
}

__mmask8 _mm_cmplt_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epi64_mask(a, b);
}

__mmask8 _mm_cmpneq_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epi64_mask(a, b);
}

__mmask8 _mm256_cmplt_epu32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epu32_mask(a, b);
}

__mmask8 _mm256_cmpneq_epu32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epu32_mask(a, b);
}

__mmask8 _mm_cmplt_epu32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epu32_mask(a, b);
}

__mmask8 _mm_cmpneq_epu32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epu32_mask(a, b);
}

__mmask8 _mm256_cmplt_epu64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmplt_epu64_mask(a, b);
}

__mmask8 _mm256_cmpneq_epu64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epu64_mask(a, b);
}

__mmask8 _mm_cmplt_epu64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epu64_mask(a, b);
}

__mmask8 _mm_cmpneq_epu64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epu64_mask(a, b);
}

__mmask64 _mm512_cmpneq_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epi8_mask(a, b);
}

__mmask16 _mm_cmpneq_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epi8_mask(a, b);
}

__mmask32 _mm256_cmpneq_epu8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epu8_mask(a, b);
}

__mmask64 _mm512_cmpneq_epu8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epu8_mask(a, b);
}

__mmask16 _mm_cmpneq_epu8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epu8_mask(a, b);
}

__mmask16 _mm256_cmpneq_epu16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epu16_mask(a, b);
}

__mmask32 _mm512_cmpneq_epu16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epu16_mask(a, b);
}

__mmask8 _mm_cmpneq_epu16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epu16_mask(a, b);
}

__mmask16 _mm256_cmpneq_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpneq_epi16_mask(a, b);
}

__mmask32 _mm512_cmpneq_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epi16_mask(a, b);
}

__mmask8 _mm_cmpneq_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epi16_mask(a, b);
}

__mmask8 _mm_cmpneq_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpneq_epi32_mask(a, b);
}

__mmask16 _mm512_cmpneq_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epi32_mask(a, b);
}

__mmask8 _mm_cmpgt_epu64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epu64_mask(a, b);
}

__mmask8 _mm512_cmpgt_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epi64_mask(a, b);
}

__mmask8 _mm512_cmpgt_epu64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epu64_mask(a, b);
}

__mmask16 _mm512_cmpgt_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epi32_mask(a, b);
}

__mmask16 _mm512_cmpgt_epu32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epu32_mask(a, b);
}

__m64 _m_pcmpgtb_wrapper(__m64 a, __m64 b) {
  return _m_pcmpgtb(a, b);
}

__m64 _m_pcmpgtw_wrapper(__m64 a, __m64 b) {
  return _m_pcmpgtw(a, b);
}

__m64 _m_pcmpgtd_wrapper(__m64 a, __m64 b) {
  return _m_pcmpgtd(a, b);
}

__m64 _mm_cmpgt_pi8_wrapper(__m64 a, __m64 b) {
  return _mm_cmpgt_pi8(a, b);
}

__m64 _mm_cmpgt_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_cmpgt_pi16(a, b);
}

__m64 _mm_cmpgt_pi32_wrapper(__m64 a, __m64 b) {
  return _mm_cmpgt_pi32(a, b);
}

__m128i _mm_cmpgt_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi64(a, b);
}

__m256i _mm256_cmpgt_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi8(a, b);
}

__m256i _mm256_cmpgt_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi16(a, b);
}

__m256i _mm256_cmpgt_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi32(a, b);
}

__m256i _mm256_cmpgt_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi64(a, b);
}

__mmask32 _mm256_cmpgt_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi8_mask(a, b);
}

__mmask64 _mm512_cmpgt_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epi8_mask(a, b);
}

__mmask16 _mm_cmpgt_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi8_mask(a, b);
}

__mmask32 _mm256_cmpgt_epu8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epu8_mask(a, b);
}

__mmask64 _mm512_cmpgt_epu8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epu8_mask(a, b);
}

__mmask16 _mm_cmpgt_epu8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epu8_mask(a, b);
}

__mmask16 _mm256_cmpgt_epu16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epu16_mask(a, b);
}

__mmask32 _mm512_cmpgt_epu16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epu16_mask(a, b);
}

__mmask8 _mm_cmpgt_epu16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epu16_mask(a, b);
}

__mmask16 _mm256_cmpgt_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi16_mask(a, b);
}

__mmask32 _mm512_cmpgt_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpgt_epi16_mask(a, b);
}

__mmask8 _mm_cmpgt_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi16_mask(a, b);
}

__mmask8 _mm256_cmpgt_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi32_mask(a, b);
}

__mmask8 _mm_cmpgt_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi32_mask(a, b);
}

__mmask8 _mm256_cmpgt_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epi64_mask(a, b);
}

__mmask8 _mm_cmpgt_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi64_mask(a, b);
}

__mmask8 _mm256_cmpgt_epu32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epu32_mask(a, b);
}

__mmask8 _mm_cmpgt_epu32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epu32_mask(a, b);
}

__mmask8 _mm256_cmpgt_epu64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpgt_epu64_mask(a, b);
}

__mmask16 _mm256_cmpge_epu16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epu16_mask(a, b);
}

__mmask16 _mm256_cmple_epu16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epu16_mask(a, b);
}

__mmask32 _mm512_cmpge_epu16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epu16_mask(a, b);
}

__mmask32 _mm512_cmple_epu16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epu16_mask(a, b);
}

__mmask8 _mm_cmpge_epu16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epu16_mask(a, b);
}

__m128i _mm_cmplt_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epi8(a, b);
}

__m128i _mm_cmpgt_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi32(a, b);
}

__m128i _mm_cmplt_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epi16(a, b);
}

__m128i _mm_cmplt_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_cmplt_epi32(a, b);
}

__m128i _mm_cmpgt_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi8(a, b);
}

__m128i _mm_cmpgt_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_cmpgt_epi16(a, b);
}

__mmask8 _mm_cmple_epu16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epu16_mask(a, b);
}

__mmask16 _mm256_cmpge_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epi16_mask(a, b);
}

__mmask16 _mm256_cmple_epi16_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epi16_mask(a, b);
}

__mmask32 _mm512_cmpge_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epi16_mask(a, b);
}

__mmask32 _mm512_cmple_epi16_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epi16_mask(a, b);
}

__mmask8 _mm_cmpge_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epi16_mask(a, b);
}

__mmask8 _mm_cmple_epi16_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epi16_mask(a, b);
}

__mmask8 _mm256_cmpge_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epi32_mask(a, b);
}

__mmask8 _mm256_cmple_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epi32_mask(a, b);
}

__mmask8 _mm_cmpge_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epi32_mask(a, b);
}

__mmask8 _mm_cmple_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epi32_mask(a, b);
}

__mmask8 _mm256_cmpge_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epi64_mask(a, b);
}

__mmask8 _mm256_cmple_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epi64_mask(a, b);
}

__mmask8 _mm_cmpge_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epi64_mask(a, b);
}

__mmask8 _mm_cmple_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epi64_mask(a, b);
}

__mmask8 _mm256_cmpge_epu32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epu32_mask(a, b);
}

__mmask8 _mm256_cmple_epu32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epu32_mask(a, b);
}

__mmask8 _mm_cmpge_epu32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epu32_mask(a, b);
}

__mmask8 _mm_cmple_epu32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epu32_mask(a, b);
}

__mmask8 _mm256_cmpge_epu64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epu64_mask(a, b);
}

__mmask8 _mm256_cmple_epu64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epu64_mask(a, b);
}

__mmask8 _mm_cmpge_epu64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epu64_mask(a, b);
}

__mmask8 _mm_cmple_epu64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epu64_mask(a, b);
}

__mmask8 _mm512_cmpge_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epi64_mask(a, b);
}

__mmask8 _mm512_cmple_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epi64_mask(a, b);
}

__mmask8 _mm512_cmpge_epu64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epu64_mask(a, b);
}

__mmask8 _mm512_cmple_epu64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epu64_mask(a, b);
}

__mmask16 _mm512_cmpge_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epi32_mask(a, b);
}

__mmask16 _mm512_cmple_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epi32_mask(a, b);
}

__mmask16 _mm512_cmpge_epu32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epu32_mask(a, b);
}

__mmask16 _mm512_cmple_epu32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epu32_mask(a, b);
}

__mmask32 _mm256_cmpge_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epi8_mask(a, b);
}

__mmask32 _mm256_cmple_epi8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epi8_mask(a, b);
}

__mmask64 _mm512_cmpge_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epi8_mask(a, b);
}

__mmask64 _mm512_cmple_epi8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epi8_mask(a, b);
}

__mmask16 _mm_cmpge_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epi8_mask(a, b);
}

__mmask16 _mm_cmple_epi8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epi8_mask(a, b);
}

__mmask32 _mm256_cmpge_epu8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmpge_epu8_mask(a, b);
}

__mmask32 _mm256_cmple_epu8_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_cmple_epu8_mask(a, b);
}

__mmask64 _mm512_cmpge_epu8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpge_epu8_mask(a, b);
}

__mmask64 _mm512_cmple_epu8_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmple_epu8_mask(a, b);
}

__mmask16 _mm_cmpge_epu8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmpge_epu8_mask(a, b);
}

__mmask16 _mm_cmple_epu8_mask_wrapper(__m128i a, __m128i b) {
  return _mm_cmple_epu8_mask(a, b);
}

__m512i _mm512_and_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_and_epi32(a, b);
}

__m512i _mm512_andnot_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_andnot_epi32(a, b);
}

__mmask16 _mm512_cmplt_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epi32_mask(a, b);
}

__mmask8 _mm512_cmplt_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epi64_mask(a, b);
}

__mmask8 _mm512_cmpneq_epi64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epi64_mask(a, b);
}

__mmask8 _mm512_cmplt_epu64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epu64_mask(a, b);
}

__mmask8 _mm512_cmpneq_epu64_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epu64_mask(a, b);
}

__mmask16 _mm512_cmplt_epu32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epu32_mask(a, b);
}

__mmask16 _mm512_cmpneq_epu32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmpneq_epu32_mask(a, b);
}

__mmask16 _mm512_cmplt_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_cmplt_epi32_mask(a, b);
}

__m512i _mm512_mullo_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_mullo_epi32(a, b);
}

__mmask8 _mm_testn_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_testn_epi32_mask(a, b);
}

__mmask8 _mm256_testn_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_testn_epi32_mask(a, b);
}

__mmask8 _mm_test_epi64_mask_wrapper(__m128i a, __m128i b) {
  return _mm_test_epi64_mask(a, b);
}

__mmask8 _mm256_test_epi64_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_test_epi64_mask(a, b);
}

__mmask8 _mm_test_epi32_mask_wrapper(__m128i a, __m128i b) {
  return _mm_test_epi32_mask(a, b);
}

__mmask8 _mm256_test_epi32_mask_wrapper(__m256i a, __m256i b) {
  return _mm256_test_epi32_mask(a, b);
}

__m128i _mm_mulhi_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_mulhi_epi16(a, b);
}

__m128i _mm_mullo_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_mullo_epi16(a, b);
}

__m64 _mm_mulhi_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_mulhi_pi16(a, b);
}

__m512i _mm512_sub_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_sub_epi8(a, b);
}

__m512i _mm512_mulhi_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_mulhi_epi16(a, b);
}

__m512i _mm512_cvtepu8_epi16_wrapper(__m256i a) {
  return _mm512_cvtepu8_epi16(a);
}

__m512i _mm512_mulhi_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_mulhi_epu16(a, b);
}

__mmask16 _mm512_mask_cmplt_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epi32_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpeq_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epi64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpge_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epi64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpgt_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epi64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmple_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epi64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmplt_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epi64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpneq_epi64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epi64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpeq_epu64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpeq_epu64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpge_epu64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpge_epu64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpgt_epu64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpgt_epu64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmple_epu64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmple_epu64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmplt_epu64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epu64_mask(k1, a, b);
}

__mmask8 _mm512_mask_cmpneq_epu64_mask_wrapper(__mmask8 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmpneq_epu64_mask(k1, a, b);
}

__m64 _m_pmulhw_wrapper(__m64 a, __m64 b) {
  return _m_pmulhw(a, b);
}

__mmask16 _mm512_test_epi32_mask_wrapper(__m512i a, __m512i b) {
  return _mm512_test_epi32_mask(a, b);
}

__mmask16 _mm512_mask_test_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_test_epi32_mask(k1, a, b);
}

__m512i _mm512_min_epu8_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epu8(a, b);
}

__m512i _mm512_min_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_min_epu16(a, b);
}

__mmask16 _mm512_mask_cmplt_epi32_mask_wrapper(__mmask16 k1, __m512i a, __m512i b) {
  return _mm512_mask_cmplt_epi32_mask(k1, a, b);
}

__m512i _mm512_mask_and_epi32_wrapper(__m512i src, __mmask16 k, __m512i v2, __m512i v3) {
  return _mm512_mask_and_epi32(src, k, v2, v3);
}

__m512i _mm512_avg_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_avg_epu16(a, b);
}

__m512i _mm512_avg_epu8_wrapper(__m512i a, __m512i b) {
  return _mm512_avg_epu8(a, b);
}

__m512i _mm512_mask_dpwssd_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_dpwssd_epi32(src, k, a, b);
}

__m128i _mm_maskz_dpwssd_epi32_wrapper(__mmask8 k, __m128i src, __m128i a, __m128i b) {
  return _mm_maskz_dpwssd_epi32(k, src, a, b);
}

__m256i _mm256_mask_dpwssd_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_dpwssd_epi32(src, k, a, b);
}

__m256i _mm256_maskz_dpwssd_epi32_wrapper(__mmask8 k, __m256i src, __m256i a, __m256i b) {
  return _mm256_maskz_dpwssd_epi32(k, src, a, b);
}

__m128i _mm_mask_dpwssd_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_dpwssd_epi32(src, k, a, b);
}

__m512i _mm512_maskz_dpbusd_epi32_wrapper(__mmask16 k, __m512i src, __m512i a, __m512i b) {
  return _mm512_maskz_dpbusd_epi32(k, src, a, b);
}

__m512i _mm512_mask_dpbusd_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_dpbusd_epi32(src, k, a, b);
}

__m256i _mm256_maskz_dpbusd_epi32_wrapper(__mmask8 k, __m256i src, __m256i a, __m256i b) {
  return _mm256_maskz_dpbusd_epi32(k, src, a, b);
}

__m256i _mm256_mask_dpbusd_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_dpbusd_epi32(src, k, a, b);
}

__m512i _mm512_maskz_dpwssd_epi32_wrapper(__mmask16 k, __m512i src, __m512i a, __m512i b) {
  return _mm512_maskz_dpwssd_epi32(k, src, a, b);
}

__m128i _mm_mask_dpbusd_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_dpbusd_epi32(src, k, a, b);
}

__m128i _mm_maskz_dpbusd_epi32_wrapper(__mmask8 k, __m128i src, __m128i a, __m128i b) {
  return _mm_maskz_dpbusd_epi32(k, src, a, b);
}

__m128i _mm256_cvtusepi32_epi8_wrapper(__m256i a) {
  return _mm256_cvtusepi32_epi8(a);
}

__m128i _mm_cvtsepi64_epi16_wrapper(__m128i a) {
  return _mm_cvtsepi64_epi16(a);
}

__m128i _mm256_cvtsepi64_epi16_wrapper(__m256i a) {
  return _mm256_cvtsepi64_epi16(a);
}

__m128i _mm_cvtsepi64_epi32_wrapper(__m128i a) {
  return _mm_cvtsepi64_epi32(a);
}

__m128i _mm256_cvtsepi64_epi32_wrapper(__m256i a) {
  return _mm256_cvtsepi64_epi32(a);
}

__m128i _mm_cvtsepi64_epi8_wrapper(__m128i a) {
  return _mm_cvtsepi64_epi8(a);
}

__m128i _mm256_cvtsepi64_epi8_wrapper(__m256i a) {
  return _mm256_cvtsepi64_epi8(a);
}

__m128i _mm_cvtsepi32_epi16_wrapper(__m128i a) {
  return _mm_cvtsepi32_epi16(a);
}

__m128i _mm256_cvtsepi32_epi16_wrapper(__m256i a) {
  return _mm256_cvtsepi32_epi16(a);
}

__m128i _mm_cvtsepi32_epi8_wrapper(__m128i a) {
  return _mm_cvtsepi32_epi8(a);
}

__m128i _mm256_cvtsepi32_epi8_wrapper(__m256i a) {
  return _mm256_cvtsepi32_epi8(a);
}

__m128i _mm256_cvtusepi32_epi16_wrapper(__m256i a) {
  return _mm256_cvtusepi32_epi16(a);
}

__m128i _mm_cvtusepi32_epi8_wrapper(__m128i a) {
  return _mm_cvtusepi32_epi8(a);
}

__m128i _mm_cvtusepi64_epi32_wrapper(__m128i a) {
  return _mm_cvtusepi64_epi32(a);
}

__m128i _mm256_cvtusepi64_epi32_wrapper(__m256i a) {
  return _mm256_cvtusepi64_epi32(a);
}

__m128i _mm_cvtusepi64_epi8_wrapper(__m128i a) {
  return _mm_cvtusepi64_epi8(a);
}

__m128i _mm256_cvtusepi64_epi8_wrapper(__m256i a) {
  return _mm256_cvtusepi64_epi8(a);
}

__m128i _mm_cvtusepi32_epi16_wrapper(__m128i a) {
  return _mm_cvtusepi32_epi16(a);
}

__m128i _mm_cvtusepi64_epi16_wrapper(__m128i a) {
  return _mm_cvtusepi64_epi16(a);
}

__m128i _mm256_cvtusepi64_epi16_wrapper(__m256i a) {
  return _mm256_cvtusepi64_epi16(a);
}

__m128i _mm_adds_epu16_wrapper(__m128i a, __m128i b) {
  return _mm_adds_epu16(a, b);
}

__m128i _mm_subs_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_subs_epi8(a, b);
}

__m128i _mm_subs_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_subs_epi16(a, b);
}

__m128i _mm_subs_epu8_wrapper(__m128i a, __m128i b) {
  return _mm_subs_epu8(a, b);
}

__m128i _mm_adds_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_adds_epi16(a, b);
}

__m128i _mm_adds_epu8_wrapper(__m128i a, __m128i b) {
  return _mm_adds_epu8(a, b);
}

__m128i _mm_adds_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_adds_epi8(a, b);
}

__m512i _mm512_adds_epu8_wrapper(__m512i a, __m512i b) {
  return _mm512_adds_epu8(a, b);
}

__m512i _mm512_adds_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_adds_epu16(a, b);
}

__m512i _mm512_maddubs_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_maddubs_epi16(a, b);
}

__m256i _mm512_cvtsepi16_epi8_wrapper(__m512i a) {
  return _mm512_cvtsepi16_epi8(a);
}

__m128i _mm256_cvtsepi16_epi8_wrapper(__m256i a) {
  return _mm256_cvtsepi16_epi8(a);
}

__m128i _mm256_cvtusepi16_epi8_wrapper(__m256i a) {
  return _mm256_cvtusepi16_epi8(a);
}

__m128i _mm_cvtsepi16_epi8_wrapper(__m128i a) {
  return _mm_cvtsepi16_epi8(a);
}

__m512i _mm512_subs_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_subs_epu16(a, b);
}

__m512i _mm512_subs_epu8_wrapper(__m512i a, __m512i b) {
  return _mm512_subs_epu8(a, b);
}

__m512i _mm512_subs_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_subs_epi16(a, b);
}

__m512i _mm512_subs_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_subs_epi8(a, b);
}

__m128i _mm_cvtusepi16_epi8_wrapper(__m128i a) {
  return _mm_cvtusepi16_epi8(a);
}

__m256i _mm512_cvtusepi16_epi8_wrapper(__m512i a) {
  return _mm512_cvtusepi16_epi8(a);
}

__m256i _mm256_mask_maddubs_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_maddubs_epi16(src, k, a, b);
}

__m256i _mm256_maskz_maddubs_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_maddubs_epi16(k, a, b);
}

__m512i _mm512_mask_maddubs_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_maddubs_epi16(src, k, a, b);
}

__m512i _mm512_maskz_maddubs_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_maddubs_epi16(k, a, b);
}

__m128i _mm_mask_maddubs_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_maddubs_epi16(src, k, a, b);
}

__m128i _mm_maskz_maddubs_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_maddubs_epi16(k, a, b);
}

__m64 _mm_maddubs_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_maddubs_pi16(a, b);
}

__m256i _mm256_maddubs_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_maddubs_epi16(a, b);
}

__m128i _mm256_mask_cvtsepi16_epi8_wrapper(__m128i src, __mmask16 k, __m256i a) {
  return _mm256_mask_cvtsepi16_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtsepi16_epi8_wrapper(__mmask16 k, __m256i a) {
  return _mm256_maskz_cvtsepi16_epi8(k, a);
}

__m256i _mm512_mask_cvtsepi16_epi8_wrapper(__m256i src, __mmask32 k, __m512i a) {
  return _mm512_mask_cvtsepi16_epi8(src, k, a);
}

__m256i _mm512_maskz_cvtsepi16_epi8_wrapper(__mmask32 k, __m512i a) {
  return _mm512_maskz_cvtsepi16_epi8(k, a);
}

__m128i _mm_mask_cvtsepi16_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtsepi16_epi8(src, k, a);
}

__m128i _mm_maskz_cvtsepi16_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtsepi16_epi8(k, a);
}

__m128i _mm256_mask_cvtusepi16_epi8_wrapper(__m128i src, __mmask16 k, __m256i a) {
  return _mm256_mask_cvtusepi16_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtusepi16_epi8_wrapper(__mmask16 k, __m256i a) {
  return _mm256_maskz_cvtusepi16_epi8(k, a);
}

__m256i _mm512_mask_cvtusepi16_epi8_wrapper(__m256i src, __mmask32 k, __m512i a) {
  return _mm512_mask_cvtusepi16_epi8(src, k, a);
}

__m256i _mm512_maskz_cvtusepi16_epi8_wrapper(__mmask32 k, __m512i a) {
  return _mm512_maskz_cvtusepi16_epi8(k, a);
}

__m128i _mm_mask_cvtusepi16_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtusepi16_epi8(src, k, a);
}

__m128i _mm_maskz_cvtusepi16_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtusepi16_epi8(k, a);
}

__m256i _mm256_mask_subs_epi8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_subs_epi8(src, k, a, b);
}

__m256i _mm256_maskz_subs_epi8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_subs_epi8(k, a, b);
}

__m512i _mm512_mask_subs_epi8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_subs_epi8(src, k, a, b);
}

__m512i _mm512_maskz_subs_epi8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_subs_epi8(k, a, b);
}

__m128i _mm_mask_subs_epi8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_subs_epi8(src, k, a, b);
}

__m128i _mm_maskz_subs_epi8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_subs_epi8(k, a, b);
}

__m256i _mm256_mask_subs_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_subs_epi16(src, k, a, b);
}

__m256i _mm256_maskz_subs_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_subs_epi16(k, a, b);
}

__m512i _mm512_mask_subs_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_subs_epi16(src, k, a, b);
}

__m512i _mm512_maskz_subs_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_subs_epi16(k, a, b);
}

__m128i _mm_mask_subs_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_subs_epi16(src, k, a, b);
}

__m128i _mm_maskz_subs_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_subs_epi16(k, a, b);
}

__m256i _mm256_mask_subs_epu8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_subs_epu8(src, k, a, b);
}

__m256i _mm256_maskz_subs_epu8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_subs_epu8(k, a, b);
}

__m512i _mm512_mask_subs_epu8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_subs_epu8(src, k, a, b);
}

__m512i _mm512_maskz_subs_epu8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_subs_epu8(k, a, b);
}

__m128i _mm_mask_subs_epu8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_subs_epu8(src, k, a, b);
}

__m128i _mm_maskz_subs_epu8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_subs_epu8(k, a, b);
}

__m256i _mm256_mask_subs_epu16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_subs_epu16(src, k, a, b);
}

__m256i _mm256_maskz_subs_epu16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_subs_epu16(k, a, b);
}

__m512i _mm512_mask_subs_epu16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_subs_epu16(src, k, a, b);
}

__m512i _mm512_maskz_subs_epu16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_subs_epu16(k, a, b);
}

__m128i _mm_mask_subs_epu16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_subs_epu16(src, k, a, b);
}

__m128i _mm_maskz_subs_epu16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_subs_epu16(k, a, b);
}

__m128i _mm256_mask_cvtsepi32_epi8_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtsepi32_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtsepi32_epi8_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtsepi32_epi8(k, a);
}

__m128i _mm_mask_cvtsepi32_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtsepi32_epi8(src, k, a);
}

__m128i _mm_maskz_cvtsepi32_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtsepi32_epi8(k, a);
}

__m128i _mm256_mask_cvtsepi32_epi16_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtsepi32_epi16(src, k, a);
}

__m128i _mm256_maskz_cvtsepi32_epi16_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtsepi32_epi16(k, a);
}

__m128i _mm_mask_cvtsepi32_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtsepi32_epi16(src, k, a);
}

__m128i _mm_maskz_cvtsepi32_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtsepi32_epi16(k, a);
}

__m128i _mm256_mask_cvtsepi64_epi8_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtsepi64_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtsepi64_epi8_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtsepi64_epi8(k, a);
}

__m128i _mm_mask_cvtsepi64_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtsepi64_epi8(src, k, a);
}

__m128i _mm_maskz_cvtsepi64_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtsepi64_epi8(k, a);
}

__m128i _mm256_mask_cvtsepi64_epi32_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtsepi64_epi32(src, k, a);
}

__m128i _mm256_maskz_cvtsepi64_epi32_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtsepi64_epi32(k, a);
}

__m128i _mm_mask_cvtsepi64_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtsepi64_epi32(src, k, a);
}

__m128i _mm_maskz_cvtsepi64_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtsepi64_epi32(k, a);
}

__m128i _mm256_mask_cvtsepi64_epi16_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtsepi64_epi16(src, k, a);
}

__m128i _mm256_maskz_cvtsepi64_epi16_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtsepi64_epi16(k, a);
}

__m128i _mm_mask_cvtsepi64_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtsepi64_epi16(src, k, a);
}

__m128i _mm_maskz_cvtsepi64_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtsepi64_epi16(k, a);
}

__m128i _mm256_mask_cvtusepi32_epi8_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtusepi32_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtusepi32_epi8_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtusepi32_epi8(k, a);
}

__m128i _mm_mask_cvtusepi32_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtusepi32_epi8(src, k, a);
}

__m128i _mm_maskz_cvtusepi32_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtusepi32_epi8(k, a);
}

__m128i _mm256_mask_cvtusepi32_epi16_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtusepi32_epi16(src, k, a);
}

__m128i _mm256_maskz_cvtusepi32_epi16_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtusepi32_epi16(k, a);
}

__m128i _mm_mask_cvtusepi32_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtusepi32_epi16(src, k, a);
}

__m128i _mm_maskz_cvtusepi32_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtusepi32_epi16(k, a);
}

__m128i _mm256_mask_cvtusepi64_epi8_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtusepi64_epi8(src, k, a);
}

__m128i _mm256_maskz_cvtusepi64_epi8_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtusepi64_epi8(k, a);
}

__m128i _mm_mask_cvtusepi64_epi8_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtusepi64_epi8(src, k, a);
}

__m128i _mm_maskz_cvtusepi64_epi8_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtusepi64_epi8(k, a);
}

__m128i _mm256_mask_cvtusepi64_epi32_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtusepi64_epi32(src, k, a);
}

__m128i _mm256_maskz_cvtusepi64_epi32_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtusepi64_epi32(k, a);
}

__m128i _mm_mask_cvtusepi64_epi32_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtusepi64_epi32(src, k, a);
}

__m128i _mm_maskz_cvtusepi64_epi32_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtusepi64_epi32(k, a);
}

__m128i _mm256_mask_cvtusepi64_epi16_wrapper(__m128i src, __mmask8 k, __m256i a) {
  return _mm256_mask_cvtusepi64_epi16(src, k, a);
}

__m128i _mm256_maskz_cvtusepi64_epi16_wrapper(__mmask8 k, __m256i a) {
  return _mm256_maskz_cvtusepi64_epi16(k, a);
}

__m128i _mm_mask_cvtusepi64_epi16_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_cvtusepi64_epi16(src, k, a);
}

__m128i _mm_maskz_cvtusepi64_epi16_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_cvtusepi64_epi16(k, a);
}

__m128i _mm512_cvtsepi32_epi8_wrapper(__m512i a) {
  return _mm512_cvtsepi32_epi8(a);
}

__m128i _mm512_mask_cvtsepi32_epi8_wrapper(__m128i src, __mmask16 k, __m512i a) {
  return _mm512_mask_cvtsepi32_epi8(src, k, a);
}

__m128i _mm512_maskz_cvtsepi32_epi8_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_cvtsepi32_epi8(k, a);
}

__m256i _mm512_cvtsepi32_epi16_wrapper(__m512i a) {
  return _mm512_cvtsepi32_epi16(a);
}

__m256i _mm512_mask_cvtsepi32_epi16_wrapper(__m256i src, __mmask16 k, __m512i a) {
  return _mm512_mask_cvtsepi32_epi16(src, k, a);
}

__m256i _mm512_maskz_cvtsepi32_epi16_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_cvtsepi32_epi16(k, a);
}

__m128i _mm512_cvtsepi64_epi8_wrapper(__m512i a) {
  return _mm512_cvtsepi64_epi8(a);
}

__m128i _mm512_mask_cvtsepi64_epi8_wrapper(__m128i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtsepi64_epi8(src, k, a);
}

__m128i _mm512_maskz_cvtsepi64_epi8_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtsepi64_epi8(k, a);
}

__m256i _mm512_cvtsepi64_epi32_wrapper(__m512i a) {
  return _mm512_cvtsepi64_epi32(a);
}

__m256i _mm512_mask_cvtsepi64_epi32_wrapper(__m256i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtsepi64_epi32(src, k, a);
}

__m256i _mm512_maskz_cvtsepi64_epi32_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtsepi64_epi32(k, a);
}

__m128i _mm512_cvtsepi64_epi16_wrapper(__m512i a) {
  return _mm512_cvtsepi64_epi16(a);
}

__m128i _mm512_mask_cvtsepi64_epi16_wrapper(__m128i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtsepi64_epi16(src, k, a);
}

__m128i _mm512_maskz_cvtsepi64_epi16_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtsepi64_epi16(k, a);
}

__m128i _mm512_cvtusepi32_epi8_wrapper(__m512i a) {
  return _mm512_cvtusepi32_epi8(a);
}

__m128i _mm512_mask_cvtusepi32_epi8_wrapper(__m128i src, __mmask16 k, __m512i a) {
  return _mm512_mask_cvtusepi32_epi8(src, k, a);
}

__m128i _mm512_maskz_cvtusepi32_epi8_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_cvtusepi32_epi8(k, a);
}

__m256i _mm512_cvtusepi32_epi16_wrapper(__m512i a) {
  return _mm512_cvtusepi32_epi16(a);
}

__m256i _mm512_mask_cvtusepi32_epi16_wrapper(__m256i src, __mmask16 k, __m512i a) {
  return _mm512_mask_cvtusepi32_epi16(src, k, a);
}

__m256i _mm512_maskz_cvtusepi32_epi16_wrapper(__mmask16 k, __m512i a) {
  return _mm512_maskz_cvtusepi32_epi16(k, a);
}

__m128i _mm512_cvtusepi64_epi8_wrapper(__m512i a) {
  return _mm512_cvtusepi64_epi8(a);
}

__m128i _mm512_mask_cvtusepi64_epi8_wrapper(__m128i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtusepi64_epi8(src, k, a);
}

__m128i _mm512_maskz_cvtusepi64_epi8_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtusepi64_epi8(k, a);
}

__m256i _mm512_cvtusepi64_epi32_wrapper(__m512i a) {
  return _mm512_cvtusepi64_epi32(a);
}

__m256i _mm512_mask_cvtusepi64_epi32_wrapper(__m256i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtusepi64_epi32(src, k, a);
}

__m256i _mm512_maskz_cvtusepi64_epi32_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtusepi64_epi32(k, a);
}

__m128i _mm512_cvtusepi64_epi16_wrapper(__m512i a) {
  return _mm512_cvtusepi64_epi16(a);
}

__m128i _mm512_mask_cvtusepi64_epi16_wrapper(__m128i src, __mmask8 k, __m512i a) {
  return _mm512_mask_cvtusepi64_epi16(src, k, a);
}

__m128i _mm512_maskz_cvtusepi64_epi16_wrapper(__mmask8 k, __m512i a) {
  return _mm512_maskz_cvtusepi64_epi16(k, a);
}

__m512i _mm512_dpbusds_epi32_wrapper(__m512i src, __m512i a, __m512i b) {
  return _mm512_dpbusds_epi32(src, a, b);
}

__m256i _mm256_maskz_dpbusds_epi32_wrapper(__mmask8 k, __m256i src, __m256i a, __m256i b) {
  return _mm256_maskz_dpbusds_epi32(k, src, a, b);
}

__m512i _mm512_mask_dpbusds_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_dpbusds_epi32(src, k, a, b);
}

__m512i _mm512_maskz_dpbusds_epi32_wrapper(__mmask16 k, __m512i src, __m512i a, __m512i b) {
  return _mm512_maskz_dpbusds_epi32(k, src, a, b);
}

__m128i _mm_dpwssds_epi32_wrapper(__m128i src, __m128i a, __m128i b) {
  return _mm_dpwssds_epi32(src, a, b);
}

__m128i _mm_mask_dpwssds_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_dpwssds_epi32(src, k, a, b);
}

__m128i _mm_maskz_dpwssds_epi32_wrapper(__mmask8 k, __m128i src, __m128i a, __m128i b) {
  return _mm_maskz_dpwssds_epi32(k, src, a, b);
}

__m256i _mm256_dpwssds_epi32_wrapper(__m256i src, __m256i a, __m256i b) {
  return _mm256_dpwssds_epi32(src, a, b);
}

__m256i _mm256_mask_dpwssds_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_dpwssds_epi32(src, k, a, b);
}

__m256i _mm256_maskz_dpwssds_epi32_wrapper(__mmask8 k, __m256i src, __m256i a, __m256i b) {
  return _mm256_maskz_dpwssds_epi32(k, src, a, b);
}

__m512i _mm512_dpwssds_epi32_wrapper(__m512i src, __m512i a, __m512i b) {
  return _mm512_dpwssds_epi32(src, a, b);
}

__m512i _mm512_mask_dpwssds_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_dpwssds_epi32(src, k, a, b);
}

__m512i _mm512_maskz_dpwssds_epi32_wrapper(__mmask16 k, __m512i src, __m512i a, __m512i b) {
  return _mm512_maskz_dpwssds_epi32(k, src, a, b);
}

__m256i _mm256_dpbusds_epi32_wrapper(__m256i src, __m256i a, __m256i b) {
  return _mm256_dpbusds_epi32(src, a, b);
}

__m128i _mm_maskz_dpbusds_epi32_wrapper(__mmask8 k, __m128i src, __m128i a, __m128i b) {
  return _mm_maskz_dpbusds_epi32(k, src, a, b);
}

__m256i _mm256_mask_dpbusds_epi32_wrapper(__m256i src, __mmask8 k, __m256i a, __m256i b) {
  return _mm256_mask_dpbusds_epi32(src, k, a, b);
}

__m128i _mm_dpbusds_epi32_wrapper(__m128i src, __m128i a, __m128i b) {
  return _mm_dpbusds_epi32(src, a, b);
}

__m128i _mm_mask_dpbusds_epi32_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_dpbusds_epi32(src, k, a, b);
}

__m128i _mm_maskz_adds_epu16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_adds_epu16(k, a, b);
}

__m128i _mm_maskz_adds_epu8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_adds_epu8(k, a, b);
}

__m256i _mm256_mask_adds_epu16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_adds_epu16(src, k, a, b);
}

__m256i _mm256_maskz_adds_epu16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_adds_epu16(k, a, b);
}

__m512i _mm512_mask_adds_epu16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_adds_epu16(src, k, a, b);
}

__m512i _mm512_maskz_adds_epu16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_adds_epu16(k, a, b);
}

__m128i _mm_mask_adds_epu16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_adds_epu16(src, k, a, b);
}

__m128i _mm_mask_adds_epi16_wrapper(__m128i src, __mmask8 k, __m128i a, __m128i b) {
  return _mm_mask_adds_epi16(src, k, a, b);
}

__m256i _mm256_maskz_adds_epi16_wrapper(__mmask16 k, __m256i a, __m256i b) {
  return _mm256_maskz_adds_epi16(k, a, b);
}

__m512i _mm512_mask_adds_epi16_wrapper(__m512i src, __mmask32 k, __m512i a, __m512i b) {
  return _mm512_mask_adds_epi16(src, k, a, b);
}

__m512i _mm512_maskz_adds_epi16_wrapper(__mmask32 k, __m512i a, __m512i b) {
  return _mm512_maskz_adds_epi16(k, a, b);
}

__m256i _mm256_maskz_adds_epu8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_adds_epu8(k, a, b);
}

__m512i _mm512_mask_adds_epu8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_adds_epu8(src, k, a, b);
}

__m512i _mm512_maskz_adds_epu8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_adds_epu8(k, a, b);
}

__m128i _mm_mask_adds_epu8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_adds_epu8(src, k, a, b);
}

__m256i _mm256_mask_adds_epi8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_adds_epi8(src, k, a, b);
}

__m256i _mm256_maskz_adds_epi8_wrapper(__mmask32 k, __m256i a, __m256i b) {
  return _mm256_maskz_adds_epi8(k, a, b);
}

__m512i _mm512_mask_adds_epi8_wrapper(__m512i src, __mmask64 k, __m512i a, __m512i b) {
  return _mm512_mask_adds_epi8(src, k, a, b);
}

__m512i _mm512_maskz_adds_epi8_wrapper(__mmask64 k, __m512i a, __m512i b) {
  return _mm512_maskz_adds_epi8(k, a, b);
}

__m128i _mm_mask_adds_epi8_wrapper(__m128i src, __mmask16 k, __m128i a, __m128i b) {
  return _mm_mask_adds_epi8(src, k, a, b);
}

__m128i _mm_maskz_adds_epi8_wrapper(__mmask16 k, __m128i a, __m128i b) {
  return _mm_maskz_adds_epi8(k, a, b);
}

__m256i _mm256_mask_adds_epi16_wrapper(__m256i src, __mmask16 k, __m256i a, __m256i b) {
  return _mm256_mask_adds_epi16(src, k, a, b);
}

__m128i _mm_maskz_adds_epi16_wrapper(__mmask8 k, __m128i a, __m128i b) {
  return _mm_maskz_adds_epi16(k, a, b);
}

__m256i _mm256_mask_adds_epu8_wrapper(__m256i src, __mmask32 k, __m256i a, __m256i b) {
  return _mm256_mask_adds_epu8(src, k, a, b);
}

__m64 _mm_adds_pu8_wrapper(__m64 a, __m64 b) {
  return _mm_adds_pu8(a, b);
}

__m64 _mm_adds_pu16_wrapper(__m64 a, __m64 b) {
  return _mm_adds_pu16(a, b);
}

__m64 _mm_subs_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_subs_pi16(a, b);
}

__m64 _mm_subs_pu8_wrapper(__m64 a, __m64 b) {
  return _mm_subs_pu8(a, b);
}

__m64 _mm_subs_pi8_wrapper(__m64 a, __m64 b) {
  return _mm_subs_pi8(a, b);
}

__m64 _mm_subs_pu16_wrapper(__m64 a, __m64 b) {
  return _mm_subs_pu16(a, b);
}

__m64 _m_paddsb_wrapper(__m64 a, __m64 b) {
  return _m_paddsb(a, b);
}

__m64 _m_paddsw_wrapper(__m64 a, __m64 b) {
  return _m_paddsw(a, b);
}

__m64 _m_paddusb_wrapper(__m64 a, __m64 b) {
  return _m_paddusb(a, b);
}

__m64 _m_paddusw_wrapper(__m64 a, __m64 b) {
  return _m_paddusw(a, b);
}

__m64 _mm_adds_pi8_wrapper(__m64 a, __m64 b) {
  return _mm_adds_pi8(a, b);
}

__m64 _mm_adds_pi16_wrapper(__m64 a, __m64 b) {
  return _mm_adds_pi16(a, b);
}

__m256i _mm256_subs_epu8_wrapper(__m256i a, __m256i b) {
  return _mm256_subs_epu8(a, b);
}

__m256i _mm256_subs_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_subs_epu16(a, b);
}

__m256i _mm256_subs_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_subs_epi16(a, b);
}

__m256i _mm256_subs_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_subs_epi8(a, b);
}

__m256i _mm256_adds_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_adds_epi16(a, b);
}

__m256i _mm256_adds_epu8_wrapper(__m256i a, __m256i b) {
  return _mm256_adds_epu8(a, b);
}

__m256i _mm256_adds_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_adds_epu16(a, b);
}

__m256i _mm256_adds_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_adds_epi8(a, b);
}

__m512i _mm512_add_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_add_epi32(a, b);
}

__m512i _mm512_subr_epi32_wrapper(__m512i v2, __m512i v3) {
  return _mm512_subr_epi32(v2, v3);
}

__m512i _mm512_mask_broadcast_i32x8_wrapper(__m512i src, __mmask16 k, __m256i a) {
  return _mm512_mask_broadcast_i32x8(src, k, a);
}

__m512i _mm512_maskz_broadcast_i32x8_wrapper(__mmask16 k, __m256i a) {
  return _mm512_maskz_broadcast_i32x8(k, a);
}

__m256i _mm256_mask_broadcast_i64x2_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_broadcast_i64x2(src, k, a);
}

__m256i _mm256_maskz_broadcast_i64x2_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_broadcast_i64x2(k, a);
}

__m512i _mm512_mask_broadcast_i64x2_wrapper(__m512i src, __mmask8 k, __m128i a) {
  return _mm512_mask_broadcast_i64x2(src, k, a);
}

__m512i _mm512_maskz_broadcast_i64x2_wrapper(__mmask8 k, __m128i a) {
  return _mm512_maskz_broadcast_i64x2(k, a);
}

__m256i _mm256_mask_broadcast_i32x2_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_broadcast_i32x2(src, k, a);
}

__m256i _mm256_maskz_broadcast_i32x2_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_broadcast_i32x2(k, a);
}

__m512i _mm512_broadcast_i32x2_wrapper(__m128i a) {
  return _mm512_broadcast_i32x2(a);
}

__m512i _mm512_mask_broadcast_i32x2_wrapper(__m512i src, __mmask16 k, __m128i a) {
  return _mm512_mask_broadcast_i32x2(src, k, a);
}

__m512i _mm512_maskz_broadcast_i32x2_wrapper(__mmask16 k, __m128i a) {
  return _mm512_maskz_broadcast_i32x2(k, a);
}

__m128i _mm_mask_broadcast_i32x2_wrapper(__m128i src, __mmask8 k, __m128i a) {
  return _mm_mask_broadcast_i32x2(src, k, a);
}

__m128i _mm_maskz_broadcast_i32x2_wrapper(__mmask8 k, __m128i a) {
  return _mm_maskz_broadcast_i32x2(k, a);
}

__m256i _mm256_mask_broadcast_i32x4_wrapper(__m256i src, __mmask8 k, __m128i a) {
  return _mm256_mask_broadcast_i32x4(src, k, a);
}

__m256i _mm256_maskz_broadcast_i32x4_wrapper(__mmask8 k, __m128i a) {
  return _mm256_maskz_broadcast_i32x4(k, a);
}

__m512i _mm512_adds_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_adds_epi16(a, b);
}

__m512i _mm512_adds_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_adds_epi8(a, b);
}

__m128i _mm_rem_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epi8(a, b);
}

__m128i _mm_rem_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epi16(a, b);
}

__m128i _mm_rem_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epi32(a, b);
}

__m128i _mm_rem_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epi64(a, b);
}

__m128i _mm_rem_epu8_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epu8(a, b);
}

__m128i _mm_rem_epu16_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epu16(a, b);
}

__m128i _mm_rem_epu32_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epu32(a, b);
}

__m128i _mm_rem_epu64_wrapper(__m128i a, __m128i b) {
  return _mm_rem_epu64(a, b);
}

__m128i _mm_udiv_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_udiv_epi32(a, b);
}

__m128i _mm_urem_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_urem_epi32(a, b);
}

__m128i _mm_idiv_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_idiv_epi32(a, b);
}

__m128i _mm_irem_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_irem_epi32(a, b);
}

__m256i _mm256_idiv_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_idiv_epi32(a, b);
}

__m256i _mm256_irem_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_irem_epi32(a, b);
}

__m256i _mm256_rem_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epi8(a, b);
}

__m256i _mm256_rem_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epi16(a, b);
}

__m256i _mm256_rem_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epi32(a, b);
}

__m256i _mm256_rem_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epi64(a, b);
}

__m256i _mm256_rem_epu8_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epu8(a, b);
}

__m256i _mm256_rem_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epu16(a, b);
}

__m256i _mm256_rem_epu32_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epu32(a, b);
}

__m256i _mm256_rem_epu64_wrapper(__m256i a, __m256i b) {
  return _mm256_rem_epu64(a, b);
}

__m512i _mm512_rem_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epi32(a, b);
}

__m512i _mm512_mask_rem_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_rem_epi32(src, k, a, b);
}

__m512i _mm512_rem_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epi8(a, b);
}

__m512i _mm512_rem_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epi16(a, b);
}

__m512i _mm512_rem_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epi64(a, b);
}

__m512i _mm512_rem_epu32_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epu32(a, b);
}

__m512i _mm512_mask_rem_epu32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_rem_epu32(src, k, a, b);
}

__m512i _mm512_rem_epu8_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epu8(a, b);
}

__m512i _mm512_rem_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epu16(a, b);
}

__m512i _mm512_rem_epu64_wrapper(__m512i a, __m512i b) {
  return _mm512_rem_epu64(a, b);
}

__m256i _mm256_urem_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_urem_epi32(a, b);
}

__m256i _mm256_udiv_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_udiv_epi32(a, b);
}

__m128i _mm_set1_epi64_wrapper(__m64 a) {
  return _mm_set1_epi64(a);
}

__m128i _mm_set1_epi64x_wrapper(int64_t a) {
  return _mm_set1_epi64x(a);
}

__m128i _mm_set1_epi32_wrapper(int a) {
  return _mm_set1_epi32(a);
}

__m128i _mm_set1_epi16_wrapper(short a) {
  return _mm_set1_epi16(a);
}

__m128i _mm_set1_epi8_wrapper(char a) {
  return _mm_set1_epi8(a);
}

__m256i _mm256_set1_epi8_wrapper(char a) {
  return _mm256_set1_epi8(a);
}

__m256i _mm256_set1_epi16_wrapper(short a) {
  return _mm256_set1_epi16(a);
}

__m256i _mm256_set1_epi32_wrapper(int a) {
  return _mm256_set1_epi32(a);
}

__m256i _mm256_set1_epi64x_wrapper(long long a) {
  return _mm256_set1_epi64x(a);
}

__m512i _mm512_div_epu32_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epu32(a, b);
}

__m512i _mm512_mask_div_epu32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_div_epu32(src, k, a, b);
}

__m512i _mm512_div_epu8_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epu8(a, b);
}

__m512i _mm512_div_epu16_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epu16(a, b);
}

__m512i _mm512_div_epu64_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epu64(a, b);
}

__m512i _mm512_div_epi8_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epi8(a, b);
}

__m512i _mm512_div_epi16_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epi16(a, b);
}

__m512i _mm512_div_epi64_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epi64(a, b);
}

__m512i _mm512_mask_div_epi32_wrapper(__m512i src, __mmask16 k, __m512i a, __m512i b) {
  return _mm512_mask_div_epi32(src, k, a, b);
}

__m512i _mm512_div_epi32_wrapper(__m512i a, __m512i b) {
  return _mm512_div_epi32(a, b);
}

__m128i _mm_div_epi8_wrapper(__m128i a, __m128i b) {
  return _mm_div_epi8(a, b);
}

__m128i _mm_div_epi16_wrapper(__m128i a, __m128i b) {
  return _mm_div_epi16(a, b);
}

__m128i _mm_div_epi32_wrapper(__m128i a, __m128i b) {
  return _mm_div_epi32(a, b);
}

__m128i _mm_div_epi64_wrapper(__m128i a, __m128i b) {
  return _mm_div_epi64(a, b);
}

__m128i _mm_div_epu8_wrapper(__m128i a, __m128i b) {
  return _mm_div_epu8(a, b);
}

__m128i _mm_div_epu16_wrapper(__m128i a, __m128i b) {
  return _mm_div_epu16(a, b);
}

__m128i _mm_div_epu32_wrapper(__m128i a, __m128i b) {
  return _mm_div_epu32(a, b);
}

__m128i _mm_div_epu64_wrapper(__m128i a, __m128i b) {
  return _mm_div_epu64(a, b);
}

__m256i _mm256_div_epi8_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epi8(a, b);
}

__m256i _mm256_div_epi16_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epi16(a, b);
}

__m256i _mm256_div_epi32_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epi32(a, b);
}

__m256i _mm256_div_epi64_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epi64(a, b);
}

__m256i _mm256_div_epu8_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epu8(a, b);
}

__m256i _mm256_div_epu16_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epu16(a, b);
}

__m256i _mm256_div_epu32_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epu32(a, b);
}

__m256i _mm256_div_epu64_wrapper(__m256i a, __m256i b) {
  return _mm256_div_epu64(a, b);
}

__m64 _mm_set1_pi32_wrapper(int a) {
  return _mm_set1_pi32(a);
}

__m64 _mm_set1_pi16_wrapper(short a) {
  return _mm_set1_pi16(a);
}

__m64 _mm_set1_pi8_wrapper(char a) {
  return _mm_set1_pi8(a);
}

int _mm512_mask_reduce_add_epi32_wrapper(__mmask16 k, __m512i a) {
  return _mm512_mask_reduce_add_epi32(k, a);
}

int64_t _mm512_mask_reduce_add_epi64_wrapper(__mmask8 k, __m512i a) {
  return _mm512_mask_reduce_add_epi64(k, a);
}

int _mm512_mask_reduce_and_epi32_wrapper(__mmask16 k, __m512i a) {
  return _mm512_mask_reduce_and_epi32(k, a);
}

int64_t _mm512_mask_reduce_and_epi64_wrapper(__mmask8 k, __m512i a) {
  return _mm512_mask_reduce_and_epi64(k, a);
}

int _mm512_reduce_and_epi32_wrapper(__m512i a) {
  return _mm512_reduce_and_epi32(a);
}

int64_t _mm512_reduce_and_epi64_wrapper(__m512i a) {
  return _mm512_reduce_and_epi64(a);
}

int _mm512_reduce_add_epi32_wrapper(__m512i a) {
  return _mm512_reduce_add_epi32(a);
}

int64_t _mm512_reduce_add_epi64_wrapper(__m512i a) {
  return _mm512_reduce_add_epi64(a);
}

int _mm512_mask_reduce_or_epi32_wrapper(__mmask16 k, __m512i a) {
  return _mm512_mask_reduce_or_epi32(k, a);
}

int64_t _mm512_mask_reduce_or_epi64_wrapper(__mmask8 k, __m512i a) {
  return _mm512_mask_reduce_or_epi64(k, a);
}

int _mm512_reduce_or_epi32_wrapper(__m512i a) {
  return _mm512_reduce_or_epi32(a);
}

int64_t _mm512_reduce_or_epi64_wrapper(__m512i a) {
  return _mm512_reduce_or_epi64(a);
}

