; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -disable-peephole -mtriple=x86_64-unknown-unknown -mattr=+avxvnni | FileCheck %s --check-prefix=AVX
; RUN: llc < %s -disable-peephole -mtriple=x86_64-unknown-unknown -mattr=+avx512vnni,+avx512vl,+avx512bw | FileCheck %s --check-prefix=AVX512
; RUN: llc < %s -disable-peephole -mtriple=x86_64-unknown-unknown -mattr=+avx512vnni,+avx512vl,+avx512bw,+avxvnni | FileCheck %s --check-prefix=AVX

define <4 x i32> @test_pmaddwd_v8i16_add_v4i32(<4 x i32> %a0, <8 x i16> %a1, <8 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v8i16_add_v4i32:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd %xmm2, %xmm1, %xmm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v8i16_add_v4i32:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd %xmm2, %xmm1, %xmm0
; AVX512-NEXT:    retq
  %1 = call <4 x i32> @llvm.x86.sse2.pmadd.wd(<8 x i16> %a1, <8 x i16> %a2)
  %2 = add <4 x i32> %1, %a0
  ret <4 x i32> %2
}

define <4 x i32> @test_pmaddwd_v8i16_add_v4i32_commute(<4 x i32> %a0, <8 x i16> %a1, <8 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v8i16_add_v4i32_commute:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd %xmm2, %xmm1, %xmm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v8i16_add_v4i32_commute:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd %xmm2, %xmm1, %xmm0
; AVX512-NEXT:    retq
  %1 = call <4 x i32> @llvm.x86.sse2.pmadd.wd(<8 x i16> %a1, <8 x i16> %a2)
  %2 = add <4 x i32> %a0, %1
  ret <4 x i32> %2
}

define <4 x i32> @test_pmaddwd_v8i16_add_v4i32_load1(<4 x i32> %a0, ptr %p1, <8 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v8i16_add_v4i32_load1:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %xmm1, %xmm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v8i16_add_v4i32_load1:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %xmm1, %xmm0
; AVX512-NEXT:    retq
  %a1 = load <8 x i16>, ptr %p1
  %1 = call <4 x i32> @llvm.x86.sse2.pmadd.wd(<8 x i16> %a1, <8 x i16> %a2)
  %2 = add <4 x i32> %1, %a0
  ret <4 x i32> %2
}

define <4 x i32> @test_pmaddwd_v8i16_add_v4i32_load2(<4 x i32> %a0, <8 x i16> %a1, ptr %p2) {
; AVX-LABEL: test_pmaddwd_v8i16_add_v4i32_load2:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %xmm1, %xmm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v8i16_add_v4i32_load2:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %xmm1, %xmm0
; AVX512-NEXT:    retq
  %a2 = load <8 x i16>, ptr %p2
  %1 = call <4 x i32> @llvm.x86.sse2.pmadd.wd(<8 x i16> %a1, <8 x i16> %a2)
  %2 = add <4 x i32> %1, %a0
  ret <4 x i32> %2
}

define <4 x i32> @test_pmaddwd_v8i16_add_v4i32_commute_load1(<4 x i32> %a0, ptr %p1, <8 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v8i16_add_v4i32_commute_load1:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %xmm1, %xmm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v8i16_add_v4i32_commute_load1:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %xmm1, %xmm0
; AVX512-NEXT:    retq
  %a1 = load <8 x i16>, ptr %p1
  %1 = call <4 x i32> @llvm.x86.sse2.pmadd.wd(<8 x i16> %a1, <8 x i16> %a2)
  %2 = add <4 x i32> %a0, %1
  ret <4 x i32> %2
}

define <4 x i32> @test_pmaddwd_v8i16_add_v4i32_commute_load2(<4 x i32> %a0, <8 x i16> %a1, ptr %p2) {
; AVX-LABEL: test_pmaddwd_v8i16_add_v4i32_commute_load2:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %xmm1, %xmm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v8i16_add_v4i32_commute_load2:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %xmm1, %xmm0
; AVX512-NEXT:    retq
  %a2 = load <8 x i16>, ptr %p2
  %1 = call <4 x i32> @llvm.x86.sse2.pmadd.wd(<8 x i16> %a1, <8 x i16> %a2)
  %2 = add <4 x i32> %a0, %1
  ret <4 x i32> %2
}

define <8 x i32> @test_pmaddwd_v16i16_add_v8i32(<8 x i32> %a0, <16 x i16> %a1, <16 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v16i16_add_v8i32:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd %ymm2, %ymm1, %ymm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v16i16_add_v8i32:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd %ymm2, %ymm1, %ymm0
; AVX512-NEXT:    retq
  %1 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %a1, <16 x i16> %a2)
  %2 = add <8 x i32> %1, %a0
  ret <8 x i32> %2
}

define <8 x i32> @test_pmaddwd_v16i16_add_v8i32_commute(<8 x i32> %a0, <16 x i16> %a1, <16 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v16i16_add_v8i32_commute:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd %ymm2, %ymm1, %ymm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v16i16_add_v8i32_commute:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd %ymm2, %ymm1, %ymm0
; AVX512-NEXT:    retq
  %1 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %a1, <16 x i16> %a2)
  %2 = add <8 x i32> %a0, %1
  ret <8 x i32> %2
}

define <8 x i32> @test_pmaddwd_v16i16_add_v8i32_load1(<8 x i32> %a0, ptr %p1, <16 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v16i16_add_v8i32_load1:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %ymm1, %ymm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v16i16_add_v8i32_load1:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %ymm1, %ymm0
; AVX512-NEXT:    retq
  %a1 = load <16 x i16>, ptr %p1
  %1 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %a1, <16 x i16> %a2)
  %2 = add <8 x i32> %1, %a0
  ret <8 x i32> %2
}

define <8 x i32> @test_pmaddwd_v16i16_add_v8i32_load2(<8 x i32> %a0, <16 x i16> %a1, ptr %p2) {
; AVX-LABEL: test_pmaddwd_v16i16_add_v8i32_load2:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %ymm1, %ymm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v16i16_add_v8i32_load2:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %ymm1, %ymm0
; AVX512-NEXT:    retq
  %a2 = load <16 x i16>, ptr %p2
  %1 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %a1, <16 x i16> %a2)
  %2 = add <8 x i32> %1, %a0
  ret <8 x i32> %2
}

define <8 x i32> @test_pmaddwd_v16i16_add_v8i32_commute_load1(<8 x i32> %a0, ptr %p1, <16 x i16> %a2) {
; AVX-LABEL: test_pmaddwd_v16i16_add_v8i32_commute_load1:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %ymm1, %ymm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v16i16_add_v8i32_commute_load1:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %ymm1, %ymm0
; AVX512-NEXT:    retq
  %a1 = load <16 x i16>, ptr %p1
  %1 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %a1, <16 x i16> %a2)
  %2 = add <8 x i32> %a0, %1
  ret <8 x i32> %2
}

define <8 x i32> @test_pmaddwd_v16i16_add_v8i32_commute_load2(<8 x i32> %a0, <16 x i16> %a1, ptr %p2) {
; AVX-LABEL: test_pmaddwd_v16i16_add_v8i32_commute_load2:
; AVX:       # %bb.0:
; AVX-NEXT:    {vex} vpdpwssd (%rdi), %ymm1, %ymm0
; AVX-NEXT:    retq
;
; AVX512-LABEL: test_pmaddwd_v16i16_add_v8i32_commute_load2:
; AVX512:       # %bb.0:
; AVX512-NEXT:    vpdpwssd (%rdi), %ymm1, %ymm0
; AVX512-NEXT:    retq
  %a2 = load <16 x i16>, ptr %p2
  %1 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %a1, <16 x i16> %a2)
  %2 = add <8 x i32> %a0, %1
  ret <8 x i32> %2
}

declare <4 x i32> @llvm.x86.sse2.pmadd.wd(<8 x i16>, <8 x i16>)
declare <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16>, <16 x i16>)