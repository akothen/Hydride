; ModuleID = 'build/test/performance/blur.bc'
source_filename = "/home/akashk4/598/Halide/src/runtime/halide_buffer_t.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

%struct.halide_filter_argument_t = type { i8*, i32, i32, %struct.halide_type_t, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, i64** }
%struct.halide_type_t = type { i8, i8, i16 }
%struct.halide_scalar_value_t = type { %union.anon }
%union.anon = type { double }
%struct.halide_filter_metadata_t = type { i32, i32, %struct.halide_filter_argument_t*, i8*, i8* }
%struct.halide_buffer_t = type { i64, %struct.halide_device_interface_t*, i8*, i64, %struct.halide_type_t, i32, %struct.halide_dimension_t*, i8* }
%struct.halide_device_interface_t = type { i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, void (i8*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, i32*, i32*)*, %struct.halide_device_interface_impl_t* }
%struct.halide_device_interface_impl_t = type opaque
%struct.halide_dimension_t = type { i32, i32, i32, i32 }
%closure_t = type { i32, i32, i32, i32, i32, i32, i32, i32, i1, i32, i32, i32, i32, i32, i16*, %struct.halide_buffer_t*, i16*, %struct.halide_buffer_t* }

@0 = private constant [4 x i64*] zeroinitializer
@str = private constant [3 x i8] c"p0\00", align 32
@1 = private constant [4 x i64*] zeroinitializer
@str.3 = private constant [7 x i8] c"blur_y\00", align 32
@2 = private constant [2 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @0, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.3, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 1, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @1, i32 0, i32 0) }]
@str.4 = private constant [97 x i8] c"x86-64-linux-avx-avx2-avx512-avx512_skylake-f16c-fma-no_asserts-no_bounds_query-no_runtime-sse41\00", align 64
@blur_y_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 2, %struct.halide_filter_argument_t* getelementptr inbounds ([2 x %struct.halide_filter_argument_t], [2 x %struct.halide_filter_argument_t]* @2, i32 0, i32 0), i8* getelementptr inbounds ([97 x i8], [97 x i8]* @str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.3, i32 0, i32 0) }

declare void @halide_free(i8*, i8*) local_unnamed_addr #0

declare noalias i8* @halide_malloc(i8*, i64) local_unnamed_addr #0

declare i32 @halide_do_par_for(i8*, i32 (i8*, i32, i8*)*, i32, i32, i8* noalias) local_unnamed_addr #0

; Function Attrs: nounwind readnone
declare <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16>, <16 x i16>) #1

define i32 @blur_y(%struct.halide_buffer_t* noalias nocapture readonly %p0.buffer, %struct.halide_buffer_t* noalias nocapture readonly %blur_y.buffer) local_unnamed_addr #2 {
entry:
  %0 = alloca %closure_t, align 8
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %blur_y.buffer, i64 0, i32 2
  %1 = load i8*, i8** %host.i, align 8, !tbaa !11
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %blur_y.buffer, i64 0, i32 6
  %2 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !21
  %min.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i64 0, i32 0
  %3 = load i32, i32* %min.i, align 4, !tbaa !22
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i64 0, i32 1
  %4 = load i32, i32* %extent.i, align 4, !tbaa !24
  %min.i4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i64 1, i32 0
  %5 = load i32, i32* %min.i4, align 4, !tbaa !22
  %extent.i6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i64 1, i32 1
  %6 = load i32, i32* %extent.i6, align 4, !tbaa !24
  %stride.i8 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i64 1, i32 2
  %7 = load i32, i32* %stride.i8, align 4, !tbaa !25
  %host.i9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %p0.buffer, i64 0, i32 2
  %8 = load i8*, i8** %host.i9, align 8, !tbaa !11
  %dim.i10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %p0.buffer, i64 0, i32 6
  %9 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i10, align 8, !tbaa !21
  %min.i11 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %9, i64 0, i32 0
  %10 = load i32, i32* %min.i11, align 4, !tbaa !22
  %min.i15 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %9, i64 1, i32 0
  %11 = load i32, i32* %min.i15, align 4, !tbaa !22
  %stride.i17 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %9, i64 1, i32 2
  %12 = load i32, i32* %stride.i17, align 4, !tbaa !25
  %t787 = mul nsw i32 %7, %5
  %13 = icmp slt i32 %4, 16
  %t788 = select i1 %13, i32 %4, i32 16
  %14 = add nsw i32 %4, 15
  %a53 = ashr i32 %14, 4
  %15 = icmp slt i32 %a53, 1
  %b56 = select i1 %15, i32 %a53, i32 1
  %b57 = add nsw i32 %t788, -16
  %t781 = icmp sgt i32 %4, 0
  %a54 = ashr i32 %4, 4
  %16 = icmp sgt i32 %a54, %b56
  %t780 = select i1 %16, i32 %a54, i32 %b56
  %17 = icmp sgt i32 %4, 16
  %18 = icmp slt i32 %4, 0
  %19 = select i1 %18, i32 %4, i32 0
  %a55 = select i1 %17, i32 %19, i32 %b57
  %20 = icmp sgt i32 %b57, %a55
  %t777 = select i1 %20, i32 %a55, i32 %b57
  %21 = add nsw i32 %6, 31
  %t776 = ashr i32 %21, 5
  %reass.add = sub i32 2, %11
  %reass.mul = mul i32 %reass.add, %12
  %22 = add i32 %t788, %3
  %23 = sub i32 %22, %10
  %t782 = add i32 %23, %reass.mul
  %24 = sub i32 %3, %10
  %t779 = add i32 %24, %reass.mul
  %25 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 0
  store i32 %4, i32* %25, align 8
  %26 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 1
  store i32 %6, i32* %26, align 4
  %27 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 2
  store i32 %5, i32* %27, align 8
  %28 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 3
  store i32 %7, i32* %28, align 4
  %29 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 4
  store i32 %12, i32* %29, align 8
  %30 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 5
  store i32 %t777, i32* %30, align 4
  %31 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 6
  store i32 %t779, i32* %31, align 8
  %32 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 7
  store i32 %t780, i32* %32, align 4
  %33 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 8
  store i1 %t781, i1* %33, align 8
  %34 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 9
  store i32 %t782, i32* %34, align 4
  %35 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 10
  store i32 %t787, i32* %35, align 8
  %36 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 11
  store i32 %t788, i32* %36, align 4
  %37 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 12
  store i32 %a53, i32* %37, align 8
  %38 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 13
  store i32 %b56, i32* %38, align 4
  %39 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 14
  %40 = bitcast i16** %39 to i8**
  store i8* %1, i8** %40, align 8
  %41 = getelementptr inbounds %closure_t, %closure_t* %0, i64 0, i32 15
  %42 = bitcast %struct.halide_buffer_t** %41 to i8**
  store i8* %8, i8** %42, align 8
  %43 = bitcast %closure_t* %0 to i8*
  %44 = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @blur_y.par_for.blur_y.s0.y.y, i32 0, i32 %t776, i8* nonnull %43)
  ret i32 0
}

define internal i32 @blur_y.par_for.blur_y.s0.y.y(i8* %__user_context, i32 %blur_y.s0.y.y, i8* noalias nocapture readonly %closure) #2 {
entry:
  %0 = bitcast i8* %closure to i32*
  %b70 = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %closure, i64 4
  %2 = bitcast i8* %1 to i32*
  %blur_y.extent.1 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %closure, i64 8
  %4 = bitcast i8* %3 to i32*
  %blur_y.min.1 = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %closure, i64 12
  %6 = bitcast i8* %5 to i32*
  %blur_y.stride.1 = load i32, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %closure, i64 16
  %8 = bitcast i8* %7 to i32*
  %p0.stride.1 = load i32, i32* %8, align 4
  %9 = getelementptr inbounds i8, i8* %closure, i64 20
  %10 = bitcast i8* %9 to i32*
  %t777 = load i32, i32* %10, align 4
  %11 = getelementptr inbounds i8, i8* %closure, i64 24
  %12 = bitcast i8* %11 to i32*
  %t779 = load i32, i32* %12, align 4
  %13 = getelementptr inbounds i8, i8* %closure, i64 28
  %14 = bitcast i8* %13 to i32*
  %t780 = load i32, i32* %14, align 4
  %15 = getelementptr inbounds i8, i8* %closure, i64 32
  %16 = bitcast i8* %15 to i1*
  %t781 = load i1, i1* %16, align 1
  %17 = getelementptr inbounds i8, i8* %closure, i64 36
  %18 = bitcast i8* %17 to i32*
  %t782 = load i32, i32* %18, align 4
  %19 = getelementptr inbounds i8, i8* %closure, i64 40
  %20 = bitcast i8* %19 to i32*
  %t787 = load i32, i32* %20, align 4
  %21 = getelementptr inbounds i8, i8* %closure, i64 44
  %22 = bitcast i8* %21 to i32*
  %t788 = load i32, i32* %22, align 4
  %23 = getelementptr inbounds i8, i8* %closure, i64 48
  %24 = bitcast i8* %23 to i32*
  %t789 = load i32, i32* %24, align 4
  %25 = getelementptr inbounds i8, i8* %closure, i64 52
  %26 = bitcast i8* %25 to i32*
  %t790 = load i32, i32* %26, align 4
  %27 = getelementptr inbounds i8, i8* %closure, i64 56
  %28 = bitcast i8* %27 to i16**
  %blur_y = load i16*, i16** %28, align 8
  %29 = getelementptr inbounds i8, i8* %closure, i64 64
  %30 = bitcast i8* %29 to i16**
  %p053 = load i16*, i16** %30, align 8
  %a57 = shl nsw i32 %blur_y.s0.y.y, 5
  %b59 = add nsw i32 %blur_y.extent.1, -32
  %31 = icmp sgt i32 %b59, %a57
  %blur_y.s0.y.yi.base.s = select i1 %31, i32 %a57, i32 %b59
  %a58 = sub nsw i32 %b70, %t777
  %32 = icmp sgt i32 %a58, 0
  %33 = select i1 %32, i32 %a58, i32 0
  %t820 = zext i32 %33 to i64
  %34 = shl nuw nsw i64 %t820, 3
  %35 = or i64 %34, 6
  %36 = tail call i8* @halide_malloc(i8* %__user_context, i64 %35)
  %blur_x = bitcast i8* %36 to i16*
  %t792 = add nsw i32 %blur_y.s0.y.yi.base.s, %blur_y.min.1
  %37 = icmp sgt i32 %t789, 0
  %b64 = add nsw i32 %b70, -16
  br i1 %37, label %"for blur_y.s0.y.yi.$n.rebased.us.preheader", label %"end for blur_y.s0.y.yi.$n.rebased", !prof !26

"for blur_y.s0.y.yi.$n.rebased.us.preheader":     ; preds = %entry
  %38 = and i32 %t792, 3
  %39 = mul nsw i32 %38, %a58
  %t795.us = sub nsw i32 %39, %t777
  %40 = add nsw i32 %t792, -2
  %41 = mul nsw i32 %40, %p0.stride.1
  %t794.us = add nsw i32 %41, %t779
  %42 = sext i32 %t795.us to i64
  br label %"for blur_y.s0.x.x.us"

"for blur_y.s0.x.x.us":                           ; preds = %after_bb.us, %"for blur_y.s0.y.yi.$n.rebased.us.preheader"
  %blur_y.s0.x.x.us = phi i32 [ %67, %after_bb.us ], [ 0, %"for blur_y.s0.y.yi.$n.rebased.us.preheader" ]
  %.not30.us = icmp eq i32 %blur_y.s0.x.x.us, 0
  %43 = shl nsw i32 %blur_y.s0.x.x.us, 4
  %44 = icmp sgt i32 %b70, %43
  %45 = select i1 %.not30.us, i1 true, i1 %44
  br i1 %45, label %then_bb.us, label %after_bb.us

then_bb.us:                                       ; preds = %"for blur_y.s0.x.x.us"
  %46 = icmp sgt i32 %b64, %43
  %b66.us = select i1 %46, i32 %43, i32 %b64
  %47 = select i1 %44, i32 %43, i32 %b70
  %a64.us = select i1 %.not30.us, i32 %b66.us, i32 %47
  %48 = icmp sgt i32 %b66.us, %a64.us
  %blur_x.s0.x.v1.base.s.us = select i1 %48, i32 %a64.us, i32 %b66.us
  %t746.us = add nsw i32 %t794.us, %blur_x.s0.x.v1.base.s.us
  %49 = sext i32 %t746.us to i64
  %50 = getelementptr inbounds i16, i16* %p053, i64 %49
  %51 = getelementptr inbounds i16, i16* %50, i64 1
  %52 = bitcast i16* %51 to <16 x i16>*
  %53 = load <16 x i16>, <16 x i16>* %52, align 2, !tbaa !27
  %54 = getelementptr inbounds i16, i16* %50, i64 2
  %55 = bitcast i16* %54 to <16 x i16>*
  %56 = load <16 x i16>, <16 x i16>* %55, align 2, !tbaa !27
  %57 = bitcast i16* %50 to <16 x i16>*
  %58 = load <16 x i16>, <16 x i16>* %57, align 2, !tbaa !27
  %59 = add <16 x i16> %56, %53
  %60 = add <16 x i16> %59, %58
  %61 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %60, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %62 = lshr <16 x i16> %61, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %63 = sext i32 %blur_x.s0.x.v1.base.s.us to i64
  %64 = add nsw i64 %63, %42
  %65 = getelementptr inbounds i16, i16* %blur_x, i64 %64
  %66 = bitcast i16* %65 to <16 x i16>*
  store <16 x i16> %62, <16 x i16>* %66, align 2, !tbaa !30
  br label %after_bb.us

after_bb.us:                                      ; preds = %then_bb.us, %"for blur_y.s0.x.x.us"
  %67 = add nuw nsw i32 %blur_y.s0.x.x.us, 1
  %.not31.us = icmp eq i32 %67, %t789
  br i1 %.not31.us, label %"end for blur_y.s0.x.x.loopexit.us", label %"for blur_y.s0.x.x.us"

"end for blur_y.s0.x.x.loopexit.us":              ; preds = %after_bb.us
  %t796.us.1 = add nsw i32 %t792, 1
  %68 = and i32 %t796.us.1, 3
  %69 = mul nsw i32 %68, %a58
  %t795.us.1 = sub nsw i32 %69, %t777
  %70 = add nsw i32 %t792, -1
  %71 = mul nsw i32 %70, %p0.stride.1
  %t794.us.1 = add nsw i32 %71, %t779
  %72 = sext i32 %t795.us.1 to i64
  br label %"for blur_y.s0.x.x.us.1"

"end for blur_y.s0.y.yi.$n.rebased":              ; preds = %after_bb.us.1, %entry
  %t803 = sub nsw i32 %t789, %t780
  %t800 = sub nsw i32 %t788, %t787
  %t798 = sub nsw i32 %t788, %t777
  %t802 = sub nsw i32 0, %t787
  %73 = sext i32 %b70 to i64
  %74 = sext i32 %t777 to i64
  %75 = sub nsw i64 %73, %74
  %76 = sext i32 %t798 to i64
  %77 = add nsw i64 %76, -16
  %78 = sext i32 %a58 to i64
  %79 = sext i32 %blur_y.stride.1 to i64
  %80 = sext i32 %t800 to i64
  %81 = add nsw i64 %80, -16
  %t804 = sub nsw i32 %t780, %t790
  %82 = icmp sgt i32 %t804, 0
  %83 = sext i32 %t790 to i64
  %84 = sext i32 %t802 to i64
  %85 = icmp sgt i32 %t803, 0
  %86 = zext i32 %t804 to i64
  %87 = sext i32 %t792 to i64
  %88 = sext i32 %p0.stride.1 to i64
  %89 = sext i32 %t782 to i64
  %90 = sext i32 %t779 to i64
  br label %"for blur_y.s0.y.yi.$n"

"for blur_y.s0.y.yi.$n":                          ; preds = %"end for blur_y.s0.x.x.rebased11", %"end for blur_y.s0.y.yi.$n.rebased"
  %indvars.iv36 = phi i64 [ 0, %"end for blur_y.s0.y.yi.$n.rebased" ], [ %indvars.iv.next37, %"end for blur_y.s0.x.x.rebased11" ]
  %91 = add nsw i64 %indvars.iv36, %87
  br i1 %t781, label %"produce blur_x4", label %"for blur_y.s0.y.yi.$n.after_bb1_crit_edge"

"for blur_y.s0.y.yi.$n.after_bb1_crit_edge":      ; preds = %"for blur_y.s0.y.yi.$n"
  %92 = trunc i64 %91 to i32
  %.pre45 = add i32 %92, 2
  %.pre47 = and i32 %.pre45, 3
  %.pre49 = mul nsw i64 %91, %88
  br label %after_bb1

"end for blur_y.s0.y.yi.$n":                      ; preds = %"end for blur_y.s0.x.x.rebased11"
  %tobool.not.i = icmp eq i8* %36, null
  br i1 %tobool.not.i, label %call_destructor.exit, label %if.then.i

if.then.i:                                        ; preds = %"end for blur_y.s0.y.yi.$n"
  tail call void @halide_free(i8* %__user_context, i8* nonnull %36) #4
  br label %call_destructor.exit

call_destructor.exit:                             ; preds = %if.then.i, %"end for blur_y.s0.y.yi.$n"
  ret i32 0

after_bb1:                                        ; preds = %"produce blur_x4", %"for blur_y.s0.y.yi.$n.after_bb1_crit_edge"
  %.pre-phi50 = phi i64 [ %.pre49, %"for blur_y.s0.y.yi.$n.after_bb1_crit_edge" ], [ %108, %"produce blur_x4" ]
  %.pre-phi48 = phi i32 [ %.pre47, %"for blur_y.s0.y.yi.$n.after_bb1_crit_edge" ], [ %126, %"produce blur_x4" ]
  %93 = mul nsw i32 %.pre-phi48, %a58
  %t806 = sub nsw i32 %93, %t777
  %94 = add nsw i64 %.pre-phi50, %90
  br i1 %82, label %"for blur_y.s0.x.x.rebased.preheader", label %"end for blur_y.s0.x.x.rebased", !prof !26

"for blur_y.s0.x.x.rebased.preheader":            ; preds = %after_bb1
  %95 = sext i32 %t806 to i64
  %96 = add i64 %91, 1
  %97 = and i64 %96, 3
  %98 = mul nsw i64 %97, %78
  %99 = sub nsw i64 %98, %74
  %100 = zext i32 %.pre-phi48 to i64
  %101 = mul nsw i64 %100, %78
  %102 = sub nsw i64 %101, %74
  %103 = and i64 %91, 3
  %104 = mul nsw i64 %103, %78
  %105 = sub nsw i64 %104, %74
  %106 = mul nsw i64 %91, %79
  %107 = add nsw i64 %106, %84
  br label %"for blur_y.s0.x.x.rebased"

"produce blur_x4":                                ; preds = %"for blur_y.s0.y.yi.$n"
  %108 = mul nsw i64 %91, %88
  %109 = add nsw i64 %108, %89
  %110 = getelementptr inbounds i16, i16* %p053, i64 %109
  %111 = getelementptr inbounds i16, i16* %110, i64 -15
  %112 = bitcast i16* %111 to <16 x i16>*
  %113 = load <16 x i16>, <16 x i16>* %112, align 2, !tbaa !27
  %114 = getelementptr inbounds i16, i16* %110, i64 -14
  %115 = bitcast i16* %114 to <16 x i16>*
  %116 = load <16 x i16>, <16 x i16>* %115, align 2, !tbaa !27
  %117 = getelementptr inbounds i16, i16* %110, i64 -16
  %118 = bitcast i16* %117 to <16 x i16>*
  %119 = load <16 x i16>, <16 x i16>* %118, align 2, !tbaa !27
  %120 = add <16 x i16> %116, %113
  %121 = add <16 x i16> %120, %119
  %122 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %121, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %123 = lshr <16 x i16> %122, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %124 = trunc i64 %91 to i32
  %125 = add i32 %124, 2
  %126 = and i32 %125, 3
  %127 = zext i32 %126 to i64
  %128 = mul nsw i64 %75, %127
  %.idx = add nsw i64 %77, %128
  %129 = getelementptr inbounds i16, i16* %blur_x, i64 %.idx
  %130 = bitcast i16* %129 to <16 x i16>*
  store <16 x i16> %123, <16 x i16>* %130, align 2, !tbaa !30
  %131 = add i64 %91, 1
  %132 = and i64 %131, 3
  %133 = mul nsw i64 %132, %78
  %.idx26 = add nsw i64 %77, %133
  %134 = getelementptr inbounds i16, i16* %blur_x, i64 %.idx26
  %135 = bitcast i16* %134 to <16 x i16>*
  %136 = load <16 x i16>, <16 x i16>* %135, align 2, !tbaa !30
  %137 = mul nsw i64 %127, %78
  %.idx27 = add nsw i64 %77, %137
  %138 = getelementptr inbounds i16, i16* %blur_x, i64 %.idx27
  %139 = bitcast i16* %138 to <16 x i16>*
  %140 = load <16 x i16>, <16 x i16>* %139, align 2, !tbaa !30
  %141 = and i64 %91, 3
  %142 = mul nsw i64 %141, %78
  %.idx28 = add nsw i64 %77, %142
  %143 = getelementptr inbounds i16, i16* %blur_x, i64 %.idx28
  %144 = bitcast i16* %143 to <16 x i16>*
  %145 = load <16 x i16>, <16 x i16>* %144, align 2, !tbaa !30
  %146 = add <16 x i16> %140, %136
  %147 = add <16 x i16> %146, %145
  %148 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %147, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %149 = lshr <16 x i16> %148, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %150 = mul nsw i64 %91, %79
  %.idx29 = add i64 %81, %150
  %151 = getelementptr inbounds i16, i16* %blur_y, i64 %.idx29
  %152 = bitcast i16* %151 to <16 x i16>*
  store <16 x i16> %149, <16 x i16>* %152, align 2, !tbaa !32
  br label %after_bb1

"for blur_y.s0.x.x.rebased":                      ; preds = %"consume blur_x9", %"for blur_y.s0.x.x.rebased.preheader"
  %indvars.iv = phi i64 [ 0, %"for blur_y.s0.x.x.rebased.preheader" ], [ %indvars.iv.next, %"consume blur_x9" ]
  %153 = add nsw i64 %indvars.iv, %83
  %154 = icmp slt i64 %153, 1
  %155 = trunc i64 %153 to i32
  %156 = shl nsw i32 %155, 4
  %157 = icmp sgt i32 %b70, %156
  %158 = select i1 %154, i1 true, i1 %157
  br i1 %158, label %"produce blur_x8", label %"for blur_y.s0.x.x.rebased.consume blur_x9_crit_edge"

"for blur_y.s0.x.x.rebased.consume blur_x9_crit_edge": ; preds = %"for blur_y.s0.x.x.rebased"
  %.pre51 = shl nsw i64 %153, 4
  br label %"consume blur_x9"

"end for blur_y.s0.x.x.rebased":                  ; preds = %"consume blur_x9", %after_bb1
  br i1 %85, label %"for blur_y.s0.x.x.rebased10.preheader", label %"end for blur_y.s0.x.x.rebased11", !prof !26

"for blur_y.s0.x.x.rebased10.preheader":          ; preds = %"end for blur_y.s0.x.x.rebased"
  %159 = sext i32 %t806 to i64
  %160 = add i64 %91, 1
  %161 = and i64 %160, 3
  %162 = mul nsw i64 %161, %78
  %163 = sub nsw i64 %162, %74
  %164 = zext i32 %.pre-phi48 to i64
  %165 = mul nsw i64 %164, %78
  %166 = sub nsw i64 %165, %74
  %167 = and i64 %91, 3
  %168 = mul nsw i64 %167, %78
  %169 = sub nsw i64 %168, %74
  %170 = mul nsw i64 %91, %79
  %171 = add nsw i64 %170, %84
  br label %"for blur_y.s0.x.x.rebased10"

"produce blur_x8":                                ; preds = %"for blur_y.s0.x.x.rebased"
  %172 = sext i32 %156 to i64
  %173 = add nsw i64 %94, %172
  %174 = getelementptr inbounds i16, i16* %p053, i64 %173
  %175 = getelementptr inbounds i16, i16* %174, i64 1
  %176 = bitcast i16* %175 to <16 x i16>*
  %177 = load <16 x i16>, <16 x i16>* %176, align 2, !tbaa !27
  %178 = getelementptr inbounds i16, i16* %174, i64 2
  %179 = bitcast i16* %178 to <16 x i16>*
  %180 = load <16 x i16>, <16 x i16>* %179, align 2, !tbaa !27
  %181 = bitcast i16* %174 to <16 x i16>*
  %182 = load <16 x i16>, <16 x i16>* %181, align 2, !tbaa !27
  %183 = add <16 x i16> %180, %177
  %184 = add <16 x i16> %183, %182
  %185 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %184, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %186 = lshr <16 x i16> %185, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %187 = shl nsw i64 %153, 4
  %188 = add nsw i64 %187, %95
  %189 = getelementptr inbounds i16, i16* %blur_x, i64 %188
  %190 = bitcast i16* %189 to <16 x i16>*
  store <16 x i16> %186, <16 x i16>* %190, align 2, !tbaa !30
  br label %"consume blur_x9"

"consume blur_x9":                                ; preds = %"produce blur_x8", %"for blur_y.s0.x.x.rebased.consume blur_x9_crit_edge"
  %.pre-phi52 = phi i64 [ %.pre51, %"for blur_y.s0.x.x.rebased.consume blur_x9_crit_edge" ], [ %187, %"produce blur_x8" ]
  %191 = add nsw i64 %99, %.pre-phi52
  %192 = getelementptr inbounds i16, i16* %blur_x, i64 %191
  %193 = bitcast i16* %192 to <16 x i16>*
  %194 = load <16 x i16>, <16 x i16>* %193, align 2, !tbaa !30
  %195 = add nsw i64 %102, %.pre-phi52
  %196 = getelementptr inbounds i16, i16* %blur_x, i64 %195
  %197 = bitcast i16* %196 to <16 x i16>*
  %198 = load <16 x i16>, <16 x i16>* %197, align 2, !tbaa !30
  %199 = add nsw i64 %105, %.pre-phi52
  %200 = getelementptr inbounds i16, i16* %blur_x, i64 %199
  %201 = bitcast i16* %200 to <16 x i16>*
  %202 = load <16 x i16>, <16 x i16>* %201, align 2, !tbaa !30
  %203 = add <16 x i16> %198, %194
  %204 = add <16 x i16> %203, %202
  %205 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %204, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %206 = lshr <16 x i16> %205, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %207 = add nsw i64 %107, %.pre-phi52
  %208 = getelementptr inbounds i16, i16* %blur_y, i64 %207
  %209 = bitcast i16* %208 to <16 x i16>*
  store <16 x i16> %206, <16 x i16>* %209, align 2, !tbaa !32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %.not25 = icmp eq i64 %indvars.iv.next, %86
  br i1 %.not25, label %"end for blur_y.s0.x.x.rebased", label %"for blur_y.s0.x.x.rebased"

"for blur_y.s0.x.x.rebased10":                    ; preds = %"consume blur_x18", %"for blur_y.s0.x.x.rebased10.preheader"
  %blur_y.s0.x.x.rebased12 = phi i32 [ %254, %"consume blur_x18" ], [ 0, %"for blur_y.s0.x.x.rebased10.preheader" ]
  %210 = add nsw i32 %blur_y.s0.x.x.rebased12, %t780
  %a67 = shl nsw i32 %210, 4
  %211 = icmp sgt i32 %b64, %a67
  %b73 = select i1 %211, i32 %a67, i32 %b64
  %212 = icmp slt i32 %210, 1
  %213 = icmp sgt i32 %b70, %a67
  %214 = select i1 %212, i1 true, i1 %213
  br i1 %214, label %"produce blur_x16", label %"consume blur_x18"

"end for blur_y.s0.x.x.rebased11":                ; preds = %"consume blur_x18", %"end for blur_y.s0.x.x.rebased"
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %.not23 = icmp eq i64 %indvars.iv.next37, 32
  br i1 %.not23, label %"end for blur_y.s0.y.yi.$n", label %"for blur_y.s0.y.yi.$n"

"produce blur_x16":                               ; preds = %"for blur_y.s0.x.x.rebased10"
  %215 = icmp slt i32 %b73, %b70
  %blur_x.s0.x.v1.base.s17 = select i1 %215, i32 %b73, i32 %b70
  %216 = sext i32 %blur_x.s0.x.v1.base.s17 to i64
  %217 = add nsw i64 %94, %216
  %218 = getelementptr inbounds i16, i16* %p053, i64 %217
  %219 = getelementptr inbounds i16, i16* %218, i64 1
  %220 = bitcast i16* %219 to <16 x i16>*
  %221 = load <16 x i16>, <16 x i16>* %220, align 2, !tbaa !27
  %222 = getelementptr inbounds i16, i16* %218, i64 2
  %223 = bitcast i16* %222 to <16 x i16>*
  %224 = load <16 x i16>, <16 x i16>* %223, align 2, !tbaa !27
  %225 = bitcast i16* %218 to <16 x i16>*
  %226 = load <16 x i16>, <16 x i16>* %225, align 2, !tbaa !27
  %227 = add <16 x i16> %224, %221
  %228 = add <16 x i16> %227, %226
  %229 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %228, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %230 = lshr <16 x i16> %229, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %231 = add nsw i64 %216, %159
  %232 = getelementptr inbounds i16, i16* %blur_x, i64 %231
  %233 = bitcast i16* %232 to <16 x i16>*
  store <16 x i16> %230, <16 x i16>* %233, align 2, !tbaa !30
  br label %"consume blur_x18"

"consume blur_x18":                               ; preds = %"produce blur_x16", %"for blur_y.s0.x.x.rebased10"
  %234 = sext i32 %b73 to i64
  %235 = add nsw i64 %163, %234
  %236 = getelementptr inbounds i16, i16* %blur_x, i64 %235
  %237 = bitcast i16* %236 to <16 x i16>*
  %238 = load <16 x i16>, <16 x i16>* %237, align 2, !tbaa !30
  %239 = add nsw i64 %166, %234
  %240 = getelementptr inbounds i16, i16* %blur_x, i64 %239
  %241 = bitcast i16* %240 to <16 x i16>*
  %242 = load <16 x i16>, <16 x i16>* %241, align 2, !tbaa !30
  %243 = add nsw i64 %169, %234
  %244 = getelementptr inbounds i16, i16* %blur_x, i64 %243
  %245 = bitcast i16* %244 to <16 x i16>*
  %246 = load <16 x i16>, <16 x i16>* %245, align 2, !tbaa !30
  %247 = add <16 x i16> %242, %238
  %248 = add <16 x i16> %247, %246
  %249 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %248, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %250 = lshr <16 x i16> %249, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %251 = add nsw i64 %171, %234
  %252 = getelementptr inbounds i16, i16* %blur_y, i64 %251
  %253 = bitcast i16* %252 to <16 x i16>*
  store <16 x i16> %250, <16 x i16>* %253, align 2, !tbaa !32
  %254 = add nuw nsw i32 %blur_y.s0.x.x.rebased12, 1
  %.not24 = icmp eq i32 %254, %t803
  br i1 %.not24, label %"end for blur_y.s0.x.x.rebased11", label %"for blur_y.s0.x.x.rebased10"

"for blur_y.s0.x.x.us.1":                         ; preds = %after_bb.us.1, %"end for blur_y.s0.x.x.loopexit.us"
  %blur_y.s0.x.x.us.1 = phi i32 [ %279, %after_bb.us.1 ], [ 0, %"end for blur_y.s0.x.x.loopexit.us" ]
  %.not30.us.1 = icmp eq i32 %blur_y.s0.x.x.us.1, 0
  %255 = shl nsw i32 %blur_y.s0.x.x.us.1, 4
  %256 = icmp sgt i32 %b70, %255
  %257 = select i1 %.not30.us.1, i1 true, i1 %256
  br i1 %257, label %then_bb.us.1, label %after_bb.us.1

then_bb.us.1:                                     ; preds = %"for blur_y.s0.x.x.us.1"
  %258 = icmp sgt i32 %b64, %255
  %b66.us.1 = select i1 %258, i32 %255, i32 %b64
  %259 = select i1 %256, i32 %255, i32 %b70
  %a64.us.1 = select i1 %.not30.us.1, i32 %b66.us.1, i32 %259
  %260 = icmp sgt i32 %b66.us.1, %a64.us.1
  %blur_x.s0.x.v1.base.s.us.1 = select i1 %260, i32 %a64.us.1, i32 %b66.us.1
  %t746.us.1 = add nsw i32 %t794.us.1, %blur_x.s0.x.v1.base.s.us.1
  %261 = sext i32 %t746.us.1 to i64
  %262 = getelementptr inbounds i16, i16* %p053, i64 %261
  %263 = getelementptr inbounds i16, i16* %262, i64 1
  %264 = bitcast i16* %263 to <16 x i16>*
  %265 = load <16 x i16>, <16 x i16>* %264, align 2, !tbaa !27
  %266 = getelementptr inbounds i16, i16* %262, i64 2
  %267 = bitcast i16* %266 to <16 x i16>*
  %268 = load <16 x i16>, <16 x i16>* %267, align 2, !tbaa !27
  %269 = bitcast i16* %262 to <16 x i16>*
  %270 = load <16 x i16>, <16 x i16>* %269, align 2, !tbaa !27
  %271 = add <16 x i16> %268, %265
  %272 = add <16 x i16> %271, %270
  %273 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %272, <16 x i16> <i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845, i16 -21845>)
  %274 = lshr <16 x i16> %273, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %275 = sext i32 %blur_x.s0.x.v1.base.s.us.1 to i64
  %276 = add nsw i64 %275, %72
  %277 = getelementptr inbounds i16, i16* %blur_x, i64 %276
  %278 = bitcast i16* %277 to <16 x i16>*
  store <16 x i16> %274, <16 x i16>* %278, align 2, !tbaa !30
  br label %after_bb.us.1

after_bb.us.1:                                    ; preds = %then_bb.us.1, %"for blur_y.s0.x.x.us.1"
  %279 = add nuw nsw i32 %blur_y.s0.x.x.us.1, 1
  %.not31.us.1 = icmp eq i32 %279, %t789
  br i1 %.not31.us.1, label %"end for blur_y.s0.y.yi.$n.rebased", label %"for blur_y.s0.x.x.us.1"
}

define i32 @blur_y_argv(i8** nocapture readonly %0) local_unnamed_addr {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 8
  %3 = getelementptr i8*, i8** %0, i64 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 8
  %6 = tail call i32 @blur_y(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5) #5
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @blur_y_metadata() local_unnamed_addr #3 {
entry:
  ret %struct.halide_filter_metadata_t* @blur_y_metadata_storage
}

attributes #0 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nounwind readnone }
attributes #2 = { "reciprocal-estimates"="none" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #4 = { nobuiltin nounwind "no-builtins" }
attributes #5 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10, !10, !10, !10, !10}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 2, !"halide_use_soft_float_abi", i32 0}
!4 = !{i32 2, !"halide_mcpu", !"skylake-avx512"}
!5 = !{i32 2, !"halide_mattrs", !"+fma,+f16c,+avx512f,+avx512cd,+avx512vl,+avx512bw,+avx512dq"}
!6 = !{i32 2, !"halide_mabi", !""}
!7 = !{i32 2, !"halide_use_pic", i32 1}
!8 = !{i32 2, !"halide_use_large_code_model", i32 0}
!9 = !{i32 2, !"halide_per_instruction_fast_math_flags", i32 0}
!10 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git d7b669b3a30345cfcdb2fde2af6f48aa4b94845d)"}
!11 = !{!12, !16, i64 16}
!12 = !{!"_ZTS15halide_buffer_t", !13, i64 0, !16, i64 8, !16, i64 16, !13, i64 24, !17, i64 32, !20, i64 36, !16, i64 40, !16, i64 48}
!13 = !{!"long long", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
!16 = !{!"any pointer", !14, i64 0}
!17 = !{!"_ZTS13halide_type_t", !18, i64 0, !14, i64 1, !19, i64 2}
!18 = !{!"_ZTS18halide_type_code_t", !14, i64 0}
!19 = !{!"short", !14, i64 0}
!20 = !{!"int", !14, i64 0}
!21 = !{!12, !16, i64 40}
!22 = !{!23, !20, i64 0}
!23 = !{!"_ZTS18halide_dimension_t", !20, i64 0, !20, i64 4, !20, i64 8, !20, i64 12}
!24 = !{!23, !20, i64 4}
!25 = !{!23, !20, i64 8}
!26 = !{!"branch_weights", i32 1073741824, i32 0}
!27 = !{!28, !28, i64 0}
!28 = !{!"p0", !29, i64 0}
!29 = !{!"Halide buffer"}
!30 = !{!31, !31, i64 0}
!31 = !{!"blur_x", !29, i64 0}
!32 = !{!33, !33, i64 0}
!33 = !{!"blur_y", !29, i64 0}


