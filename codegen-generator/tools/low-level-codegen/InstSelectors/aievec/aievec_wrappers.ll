; ModuleID = 'test_add_wrapper.c'
source_filename = "test_add_wrapper.c"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2-none-unknown-elf"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @v16int32_add16_wrapper(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <16 x i32> %b, %a
  ret <16 x i32> %add.i
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 19.0.0 (https://github.com/Xilinx/llvm-aie 4c793d4a14cb8fa4dfbb6cf7d2c5305103e7d69e)"}