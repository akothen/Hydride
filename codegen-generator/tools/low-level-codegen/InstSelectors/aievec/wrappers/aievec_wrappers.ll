; ModuleID = 'mul_wrapper.cpp'
source_filename = "mul_wrapper.cpp"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2"

define dso_local noundef <16 x i32> @v16int32_add16_wrapper(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <16 x i32> %b, %a
  ret <16 x i32> %add.i
}

define dso_local noundef <16 x i64> @_Z16test_mul_elem_32v() #0 {
entry:
  %a.addr.i = alloca <32 x i16>, align 32
  %b.addr.i = alloca <32 x i16>, align 32
  %conf.i = alloca i32, align 4
  %a = alloca <32 x i16>, align 32
  %b = alloca <32 x i16>, align 32
  %0 = call noundef <32 x i16> @llvm.aie2.v32int16()
  store <32 x i16> %0, ptr %a, align 32
  %1 = call noundef <32 x i16> @llvm.aie2.v32int16()
  store <32 x i16> %1, ptr %b, align 32
  %2 = load <32 x i16>, ptr %a, align 32
  %3 = load <32 x i16>, ptr %b, align 32
  store <32 x i16> %2, ptr %a.addr.i, align 32
  store <32 x i16> %3, ptr %b.addr.i, align 32
  %call.i = call noundef i32 @_ZL21aiev2_compute_controliiiiiiiiiii(i32 noundef 1, i32 noundef 1, i32 noundef 0, i32 noundef 3, i32 noundef 1, i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 0)
  store i32 %call.i, ptr %conf.i, align 4
  %4 = load <32 x i16>, ptr %a.addr.i, align 32
  %5 = bitcast <32 x i16> %4 to <64 x i8>
  %6 = load <32 x i16>, ptr %b.addr.i, align 32
  %7 = bitcast <32 x i16> %6 to <16 x i32>
  %8 = load i32, ptr %conf.i, align 4
  %9 = call noundef <16 x i64> @llvm.aie2.I512.I512.acc32.mul.conf(<64 x i8> %5, <16 x i32> %7, i32 %8)
  ret <16 x i64> %9
}

; Function Attrs: nounwind memory(none)
declare <32 x i16> @llvm.aie2.v32int16() #1

; Function Attrs: mustprogress noinline nounwind optnone
define internal noundef i32 @_ZL21aiev2_compute_controliiiiiiiiiii(i32 noundef %sgn_x, i32 noundef %sgn_y, i32 noundef %amode, i32 noundef %bmode, i32 noundef %variant, i32 noundef %zero_acc, i32 noundef %shift16, i32 noundef %sub0, i32 noundef %sub1, i32 noundef %sub2, i32 noundef %sub_mask) #2 {
entry:
  %sgn_x.addr = alloca i32, align 4
  %sgn_y.addr = alloca i32, align 4
  %amode.addr = alloca i32, align 4
  %bmode.addr = alloca i32, align 4
  %variant.addr = alloca i32, align 4
  %zero_acc.addr = alloca i32, align 4
  %shift16.addr = alloca i32, align 4
  %sub0.addr = alloca i32, align 4
  %sub1.addr = alloca i32, align 4
  %sub2.addr = alloca i32, align 4
  %sub_mask.addr = alloca i32, align 4
  store i32 %sgn_x, ptr %sgn_x.addr, align 4
  store i32 %sgn_y, ptr %sgn_y.addr, align 4
  store i32 %amode, ptr %amode.addr, align 4
  store i32 %bmode, ptr %bmode.addr, align 4
  store i32 %variant, ptr %variant.addr, align 4
  store i32 %zero_acc, ptr %zero_acc.addr, align 4
  store i32 %shift16, ptr %shift16.addr, align 4
  store i32 %sub0, ptr %sub0.addr, align 4
  store i32 %sub1, ptr %sub1.addr, align 4
  store i32 %sub2, ptr %sub2.addr, align 4
  store i32 %sub_mask, ptr %sub_mask.addr, align 4
  %0 = load i32, ptr %sub_mask.addr, align 4
  %shl = shl i32 %0, 16
  %1 = load i32, ptr %shift16.addr, align 4
  %shl1 = shl i32 %1, 10
  %or = or i32 %shl, %shl1
  %2 = load i32, ptr %sub0.addr, align 4
  %shl2 = shl i32 %2, 11
  %or3 = or i32 %or, %shl2
  %3 = load i32, ptr %sub1.addr, align 4
  %shl4 = shl i32 %3, 12
  %or5 = or i32 %or3, %shl4
  %4 = load i32, ptr %sub2.addr, align 4
  %shl6 = shl i32 %4, 13
  %or7 = or i32 %or5, %shl6
  %5 = load i32, ptr %amode.addr, align 4
  %shl8 = shl i32 %5, 1
  %or9 = or i32 %or7, %shl8
  %6 = load i32, ptr %bmode.addr, align 4
  %shl10 = shl i32 %6, 3
  %or11 = or i32 %or9, %shl10
  %7 = load i32, ptr %variant.addr, align 4
  %shl12 = shl i32 %7, 5
  %or13 = or i32 %or11, %shl12
  %8 = load i32, ptr %sgn_x.addr, align 4
  %shl14 = shl i32 %8, 9
  %9 = load i32, ptr %sgn_y.addr, align 4
  %shl15 = shl i32 %9, 8
  %or16 = or i32 %shl14, %shl15
  %or17 = or i32 %or13, %or16
  %10 = load i32, ptr %zero_acc.addr, align 4
  %shl18 = shl i32 %10, 0
  %or19 = or i32 %or17, %shl18
  ret i32 %or19
}

; Function Attrs: nounwind memory(none)
declare <16 x i64> @llvm.aie2.I512.I512.acc32.mul.conf(<64 x i8>, <16 x i32>, i32) #1

attributes #0 = { mustprogress noinline optnone "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nounwind memory(none) }
attributes #2 = { mustprogress noinline nounwind optnone "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 19.0.0 (https://github.com/Xilinx/llvm-aie 4c793d4a14cb8fa4dfbb6cf7d2c5305103e7d69e)"}