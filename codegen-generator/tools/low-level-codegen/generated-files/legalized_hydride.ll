; ModuleID = 'legalized_hydride.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %0, <8 x i64> %1) #0 {
  %3 = alloca <8 x i64>, align 64
  %4 = alloca <8 x i64>, align 64
  %5 = alloca <8 x i64>, align 64
  %6 = alloca <8 x i64>, align 64
  store <8 x i64> %0, <8 x i64>* %5, align 64
  store <8 x i64> %1, <8 x i64>* %6, align 64
  %7 = load <8 x i64>, <8 x i64>* %5, align 64
  %8 = load <8 x i64>, <8 x i64>* %6, align 64
  store <8 x i64> %7, <8 x i64>* %3, align 64
  store <8 x i64> %8, <8 x i64>* %4, align 64
  %9 = load <8 x i64>, <8 x i64>* %3, align 64
  %10 = bitcast <8 x i64> %9 to <32 x i16>
  %11 = load <8 x i64>, <8 x i64>* %4, align 64
  %12 = bitcast <8 x i64> %11 to <32 x i16>
  %13 = add <32 x i16> %10, %12
  %14 = bitcast <32 x i16> %13 to <8 x i64>
  ret <8 x i64> %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local <8 x i64> @_mm512_max_epu16_wrapper(<8 x i64> %0, <8 x i64> %1) #0 {
  %3 = alloca <8 x i64>, align 64
  %4 = alloca <8 x i64>, align 64
  %5 = alloca <8 x i64>, align 64
  %6 = alloca <8 x i64>, align 64
  store <8 x i64> %0, <8 x i64>* %5, align 64
  store <8 x i64> %1, <8 x i64>* %6, align 64
  %7 = load <8 x i64>, <8 x i64>* %5, align 64
  %8 = load <8 x i64>, <8 x i64>* %6, align 64
  store <8 x i64> %7, <8 x i64>* %3, align 64
  store <8 x i64> %8, <8 x i64>* %4, align 64
  %9 = load <8 x i64>, <8 x i64>* %3, align 64
  %10 = bitcast <8 x i64> %9 to <32 x i16>
  %11 = load <8 x i64>, <8 x i64>* %4, align 64
  %12 = bitcast <8 x i64> %11 to <32 x i16>
  %13 = call <32 x i16> @llvm.umax.v32i16(<32 x i16> %10, <32 x i16> %12) #2
  %14 = bitcast <32 x i16> %13 to <8 x i64>
  ret <8 x i64> %14
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <32 x i16> @llvm.umax.v32i16(<32 x i16>, <32 x i16>) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local <8 x i64> @_mm512_min_epu16_wrapper(<8 x i64> %0, <8 x i64> %1) #0 {
  %3 = alloca <8 x i64>, align 64
  %4 = alloca <8 x i64>, align 64
  %5 = alloca <8 x i64>, align 64
  %6 = alloca <8 x i64>, align 64
  store <8 x i64> %0, <8 x i64>* %5, align 64
  store <8 x i64> %1, <8 x i64>* %6, align 64
  %7 = load <8 x i64>, <8 x i64>* %5, align 64
  %8 = load <8 x i64>, <8 x i64>* %6, align 64
  store <8 x i64> %7, <8 x i64>* %3, align 64
  store <8 x i64> %8, <8 x i64>* %4, align 64
  %9 = load <8 x i64>, <8 x i64>* %3, align 64
  %10 = bitcast <8 x i64> %9 to <32 x i16>
  %11 = load <8 x i64>, <8 x i64>* %4, align 64
  %12 = bitcast <8 x i64> %11 to <32 x i16>
  %13 = call <32 x i16> @llvm.umin.v32i16(<32 x i16> %10, <32 x i16> %12) #2
  %14 = bitcast <32 x i16> %13 to <8 x i64>
  ret <8 x i64> %14
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <32 x i16> @llvm.umin.v32i16(<32 x i16>, <32 x i16>) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local <8 x i64> @_mm512_sub_epi16_wrapper(<8 x i64> %0, <8 x i64> %1) #0 {
  %3 = alloca <8 x i64>, align 64
  %4 = alloca <8 x i64>, align 64
  %5 = alloca <8 x i64>, align 64
  %6 = alloca <8 x i64>, align 64
  store <8 x i64> %0, <8 x i64>* %5, align 64
  store <8 x i64> %1, <8 x i64>* %6, align 64
  %7 = load <8 x i64>, <8 x i64>* %5, align 64
  %8 = load <8 x i64>, <8 x i64>* %6, align 64
  store <8 x i64> %7, <8 x i64>* %3, align 64
  store <8 x i64> %8, <8 x i64>* %4, align 64
  %9 = load <8 x i64>, <8 x i64>* %3, align 64
  %10 = bitcast <8 x i64> %9 to <32 x i16>
  %11 = load <8 x i64>, <8 x i64>* %4, align 64
  %12 = bitcast <8 x i64> %11 to <32 x i16>
  %13 = sub <32 x i16> %10, %12
  %14 = bitcast <32 x i16> %13 to <8 x i64>
  ret <8 x i64> %14
}

define <32 x i16> @hydride.node.1(<32 x i16> %arg, <32 x i16> %arg.1, <32 x i16> %arg.2, <32 x i16> %arg.3, <32 x i16> %arg.4, <32 x i16> %arg.5, <32 x i16> %arg.6, <32 x i16> %arg.7, <32 x i16> %arg.8, <32 x i16> %arg.9) {
entry:
  %cast.arg.9 = bitcast <32 x i16> %arg.9 to <8 x i64>
  %cast.arg.8 = bitcast <32 x i16> %arg.8 to <8 x i64>
  %cast.arg.7 = bitcast <32 x i16> %arg.7 to <8 x i64>
  %cast.arg.6 = bitcast <32 x i16> %arg.6 to <8 x i64>
  %cast.arg.5 = bitcast <32 x i16> %arg.5 to <8 x i64>
  %cast.arg.4 = bitcast <32 x i16> %arg.4 to <8 x i64>
  %cast.arg.3 = bitcast <32 x i16> %arg.3 to <8 x i64>
  %cast.arg.2 = bitcast <32 x i16> %arg.2 to <8 x i64>
  %cast.arg.1 = bitcast <32 x i16> %arg.1 to <8 x i64>
  %cast.arg = bitcast <32 x i16> %arg to <8 x i64>
  %cast.0 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.9, <8 x i64> %cast.arg.8)
  %cast.1 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.0, <8 x i64> %cast.arg.7)
  %cast.2 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.2, <8 x i64> %cast.arg.6)
  %cast.3 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.5, <8 x i64> %cast.2)
  %cast.4 = call <8 x i64> @_mm512_max_epu16_wrapper(<8 x i64> %cast.1, <8 x i64> %cast.3)
  %cast.5 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.9, <8 x i64> %cast.arg.8)
  %cast.6 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.5, <8 x i64> %cast.arg.7)
  %cast.7 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.2, <8 x i64> %cast.arg.6)
  %cast.8 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.5, <8 x i64> %cast.7)
  %cast.9 = call <8 x i64> @_mm512_min_epu16_wrapper(<8 x i64> %cast.6, <8 x i64> %cast.8)
  %cast.10 = call <8 x i64> @_mm512_sub_epi16_wrapper(<8 x i64> %cast.4, <8 x i64> %cast.9)
  %cast.11 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg, <8 x i64> %cast.arg.1)
  %cast.12 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.11, <8 x i64> %cast.arg.2)
  %cast.13 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.3, <8 x i64> %cast.arg.4)
  %cast.14 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.13, <8 x i64> %cast.arg.5)
  %cast.15 = call <8 x i64> @_mm512_max_epu16_wrapper(<8 x i64> %cast.12, <8 x i64> %cast.14)
  %cast.16 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg.3, <8 x i64> %cast.arg.4)
  %cast.17 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.16, <8 x i64> %cast.arg.5)
  %cast.18 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.arg, <8 x i64> %cast.arg.1)
  %cast.19 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.18, <8 x i64> %cast.arg.2)
  %cast.20 = call <8 x i64> @_mm512_min_epu16_wrapper(<8 x i64> %cast.17, <8 x i64> %cast.19)
  %cast.21 = call <8 x i64> @_mm512_sub_epi16_wrapper(<8 x i64> %cast.15, <8 x i64> %cast.20)
  %cast.22 = call <8 x i64> @_mm512_add_epi16_wrapper(<8 x i64> %cast.10, <8 x i64> %cast.21)
  %cast.constant = bitcast <32 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <8 x i64>
  %cast.23 = call <8 x i64> @_mm512_min_epu16_wrapper(<8 x i64> %cast.22, <8 x i64> %cast.constant)
  %res.23 = bitcast <8 x i64> %cast.23 to <32 x i16>
  ret <32 x i16> %res.23
}

declare <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16>, <32 x i16>, i32, i32, i32, i32, i32)

declare <32 x i16> @llvm.hydride._m_pmaxub_dsl(<32 x i16>, <32 x i16>, i32, i32, i32, i32, i32)

declare <32 x i16> @llvm.hydride._mm512_min_epu64_dsl(<32 x i16>, <32 x i16>, i32, i32, i32, i32, i32)

declare <32 x i16> @llvm.hydride._mm512_sub_epi8_dsl(<32 x i16>, <32 x i16>, i32, i32, i32, i32, i32)

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="512" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cascadelake" "target-features"="+64bit,+adx,+aes,+avx,+avx2,+avx512bw,+avx512cd,+avx512dq,+avx512f,+avx512ifma,+avx512vl,+avx512vnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+invpcid,+lzcnt,+mmx,+movbe,+pclmul,+pku,+popcnt,+prfchw,+rdrnd,+rdseed,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsavec,+xsaveopt,+xsaves,-amx-bf16,-amx-int8,-amx-tile,-avx512bf16,-avx512bitalg,-avx512er,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vp2intersect,-avx512vpopcntdq,-avxvnni,-cldemote,-clzero,-enqcmd,-fma4,-gfni,-hreset,-kl,-lwp,-movdir64b,-movdiri,-mwaitx,-pconfig,-prefetchwt1,-ptwrite,-rdpid,-rtm,-serialize,-sgx,-sha,-shstk,-sse4a,-tbm,-tsxldtrk,-uintr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"}
!1 = !{i32 1, !"wchar_size", i32 4}
