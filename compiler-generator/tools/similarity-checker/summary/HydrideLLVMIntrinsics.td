def int_hydride__mm_mask_test_epi64_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_madd52lo_epu64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_broadcast_i32x2 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_blendv_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_movepi64_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_mul_epu32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_cmplt_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_blend_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_sub_pi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_dpwssds_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_mov_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_maskz_min_epu32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_dpwssds_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_maskz_madd52hi_epu64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_sub_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_reduce_add_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_maskz_dpbusd_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_cmpge_epi16_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_div_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_cvtepi16_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_cmpeq_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_adds_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mullo_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_subr_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_reduce_add_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_dpwssd_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_subr_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_min_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_cmpgt_epu8_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_reduce_and_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_add_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_cvtsepi64_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_cmple_epi16_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_dpbusd_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_min_epu8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_cmpgt_epu8_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_abs_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_reduce_and_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_cmple_epu16_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_cmplt_epu32_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_reduce_and_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_subs_epu8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_rem_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_div_epu64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_dpbusds_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_reduce_or_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_cmpneq_epu8_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_cvtepu8_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_cmple_epi16_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_dpwssd_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_or_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_cmpge_epu8_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_blend_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_xor_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_testn_epi32_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_max_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_cmpge_epu32_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_dpbusds_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_subs_pi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_dpwssd_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_movm_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_mulhrs_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_or_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_broadcast_i32x2 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_cmpge_epi32_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_rem_epu8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_cmpeq_epi8_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_div_epu32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_reduce_or_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_and_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mul_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maddubs_pi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_andnot_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_andnot_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_cmple_epu32_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_reduce_add_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_movemask_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__m_pmaddwd : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_cmpgt_epi8_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_cmplt_epu16_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mullo_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_blend_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_cvtsepi32_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_reduce_add_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_broadcastd_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_cmpeq_epi64_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_maddubs_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__m_paddusb : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_testn_epi16_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_reduce_or_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_cmplt_epi64_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_maskz_mulhi_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_dpbusds_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_xor_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_subs_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mul_epu32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_min_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mulhrs_pi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_madd52hi_epu64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_reduce_and_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_max_epu32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_broadcastmb_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_abs_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_max_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_mul_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_dpwssds_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_cmpgt_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_avg_epu8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_cmpneq_epu32_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_madd_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_cvtepi64_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_div_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_adds_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_and_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_test_epi8_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_cvtepu8_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_dpbusd_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_reduce_or_epi32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_avg_epu16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_max_epu32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_mask_cmpgt_epi64_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_mullo_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm256_maskz_set1_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_maskz_subs_epu8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_mask_cvtepi64_epi8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_maskz_adds_epu8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_mask_cvtepi8_epi16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm_add_epi64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride__mm512_cmplt_epi32_mask : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

