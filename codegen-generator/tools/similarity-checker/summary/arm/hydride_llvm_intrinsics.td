def int_hydride_vmovl_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_veorq_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmull_high_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmull_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vuzp2q_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqrdmulhq_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlals_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,,llvm_anyint_ty,,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmull_high_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqrdmlsh_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmla_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vpmaxq_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vceqz_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vtrn1q_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vadd_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vuzp1_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqrshlq_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vandq_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqshl_u64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vcltd_u64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlal_high_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vtstq_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmull_n_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vaddw_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmulls_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlsl_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,,,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsq_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vzip2q_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vpmin_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlal_n_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vbslq_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmull_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vzip1_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vcltzq_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vsubl_high_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vcgeq_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmull_high_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqrdmlah_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmovn_high_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlsls_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,,llvm_anyint_ty,,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vsubw_high_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vpadd_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlsl_high_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,,,,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqrdmulhq_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqaddq_u64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmul_n_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vrhadd_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlal_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,,,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqrshlh_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vsubl_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vhsubq_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmull_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vaddw_high_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlal_high_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlal_high_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,,,,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vrsubhn_u64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlal_high_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,,,,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsl_high_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmovl_high_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vsubq_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqabs_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vshl_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmovn_u64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vaddhn_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vcgt_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmls_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vrax1q_u64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmull_high_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlsl_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,,,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsl_high_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmulq_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlal_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vclezq_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmax_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vtrn2_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmulq_n_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsl_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vrshl_u64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vcleq_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vornq_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqmovn_high_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlal_n_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsl_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vaddl_high_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmovq_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlsl_high_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,,,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmull_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vcgtz_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlaq_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlal_high_n_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmvn_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlsl_high_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,,,,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vshl_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlal_high_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,,,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vhadd_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vbcaxq_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vneg_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqnegq_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmull_high_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vorr_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vsubw_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqmovn_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmla_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmlal_n_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,,,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vaddl_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vbicq_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vrsubhn_high_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vaddhn_high_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqdmulh_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vceqq_u32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqshlb_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vminq_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsl_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vqsub_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsl_high_n_u16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vcgezq_s16 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vrshl_s8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmlsq_u8 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_veor3q_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyvector_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vabsq_s64 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vmull_high_n_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,llvm_anyint_ty,llvm_anyint_ty],[IntrNoMem, IntrSpeculatable]>;

def int_hydride_vuqadds_s32 : Intrinsic<[llvm_anyvector_ty],[llvm_anyvector_ty,llvm_anyvector_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,llvm_anyint_ty,,llvm_anyint_ty,,],[IntrNoMem, IntrSpeculatable]>;

