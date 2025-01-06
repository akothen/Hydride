; ModuleID = 'aiev2-vadd-intrinsics.cpp'
source_filename = "aiev2-vadd-intrinsics.cpp"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_add_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <64 x i8> %b, %a
  ret <64 x i8> %add.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_sub_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i = sub <64 x i8> %a, %b
  ret <64 x i8> %sub.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z20test_addsub_v64uint8Dv64_hS_y(<64 x i8> noundef %a, <64 x i8> noundef %b, i64 noundef %as) local_unnamed_addr #0 {
entry:
  %0 = bitcast i64 %as to <2 x i32>
  %1 = tail call noundef <64 x i8> @llvm.aie2.vaddsub8(<64 x i8> %a, <64 x i8> %b, <2 x i32> %0)
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z21test_neg_gtz_v64uint8Dv64_hRy(<64 x i8> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vneg.gtz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_neg_v64uint8Dv64_h(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vneg.gtz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_sub_lt_v64uint8Dv64_hS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.lt8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_sub_lt_v64uint8Dv64_hS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_sub_ge_v64uint8Dv64_hS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.ge8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_sub_ge_v64uint8Dv64_hS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.ge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z24test_maxdiff_lt_v64uint8Dv64_hS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z24test_maxdiff_lt_v64uint8Dv64_hS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z21test_maxdiff_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z21test_maxdiff_v64uint8Dv64_hS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_min_ge_v64uint8Dv64_hS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_min_ge_v64uint8Dv64_hS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_min_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_min_v64uint8Dv64_hS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_max_lt_v64uint8Dv64_hS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_max_lt_v64uint8Dv64_hS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_max_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_max_v64uint8Dv64_hS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z18test_band_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %and.i = and <64 x i8> %b, %a
  ret <64 x i8> %and.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_bor_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %or.i = or <64 x i8> %b, %a
  ret <64 x i8> %or.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z22test_bneg_ltz_v64uint8Dv64_hRy(<64 x i8> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  store i64 -1, ptr %cmp, align 4, !tbaa !2
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z22test_bneg_ltz_v64uint8Dv64_hbRy(<64 x i8> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  br i1 %sgn, label %_ZL8bneg_ltzDv64_hbRy.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  store i64 -1, ptr %cmp, align 4, !tbaa !2
  br label %_ZL8bneg_ltzDv64_hbRy.exit

_ZL8bneg_ltzDv64_hbRy.exit:                       ; preds = %entry, %if.then.i
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z18test_bneg_v64uint8Dv64_h(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z18test_bxor_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %b)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  %and.i.i = and <64 x i8> %1, %a
  %2 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %3 = extractvalue { <64 x i8>, <2 x i32> } %2, 0
  %and.i7.i = and <64 x i8> %3, %b
  %or.i.i = or <64 x i8> %and.i7.i, %and.i.i
  ret <64 x i8> %or.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z21test_abs_gtz_v64uint8Dv64_hRy(<64 x i8> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z21test_abs_gtz_v64uint8Dv64_hbRy(<64 x i8> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_abs_v64uint8Dv64_h(<64 x i8> noundef returned %a) local_unnamed_addr #0 {
entry:
  ret <64 x i8> %a
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_abs_v64uint8Dv64_hb(<64 x i8> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_lt_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_ge_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %a, <64 x i8> %b, i32 0)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_le_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %b, <64 x i8> %a, i32 0)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_gt_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %b, <64 x i8> %a, i32 0)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_lt_v64uint8Dv64_hS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_ge_v64uint8Dv64_hS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_le_v64uint8Dv64_hS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %b, <64 x i8> %a, i32 %conv.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_gt_v64uint8Dv64_hS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %b, <64 x i8> %a, i32 %conv.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z17test_ltz_v64uint8Dv64_h(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  ret i64 -1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z17test_ltz_v64uint8Dv64_hb(<64 x i8> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  %2 = bitcast <2 x i32> %1 to i64
  %spec.select.i = select i1 %sgn, i64 %2, i64 -1
  ret i64 %spec.select.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z17test_gtz_v64uint8Dv64_h(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 0)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  %2 = bitcast <2 x i32> %1 to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z17test_gtz_v64uint8Dv64_hb(<64 x i8> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  %2 = bitcast <2 x i32> %1 to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z17test_eqz_v64uint8Dv64_h(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.veqz8(<64 x i8> %a)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_eq_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i = sub <64 x i8> %a, %b
  %0 = tail call <2 x i32> @llvm.aie2.veqz8(<64 x i8> %sub.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_ne_v64uint8Dv64_hS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i.i = sub <64 x i8> %a, %b
  %0 = tail call <2 x i32> @llvm.aie2.veqz8(<64 x i8> %sub.i.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  %not.i = xor i64 %1, -1
  ret i64 %not.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_sel_v64uint8Dv64_hS_y(<64 x i8> noundef %a, <64 x i8> noundef %b, i64 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = bitcast i64 %s to <2 x i32>
  %1 = tail call noundef <64 x i8> @llvm.aie2.vsel8(<64 x i8> %a, <64 x i8> %b, <2 x i32> %0)
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_add_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <64 x i8> %b, %a
  ret <64 x i8> %add.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_sub_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i = sub <64 x i8> %a, %b
  ret <64 x i8> %sub.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z19test_addsub_v64int8Dv64_aS_y(<64 x i8> noundef %a, <64 x i8> noundef %b, i64 noundef %as) local_unnamed_addr #0 {
entry:
  %0 = bitcast i64 %as to <2 x i32>
  %1 = tail call noundef <64 x i8> @llvm.aie2.vaddsub8(<64 x i8> %a, <64 x i8> %b, <2 x i32> %0)
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_neg_gtz_v64int8Dv64_aRy(<64 x i8> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vneg.gtz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_neg_v64int8Dv64_a(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vneg.gtz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_sub_lt_v64int8Dv64_aS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.lt8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_sub_lt_v64int8Dv64_aS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_sub_ge_v64int8Dv64_aS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.ge8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_sub_ge_v64int8Dv64_aS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.ge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z23test_maxdiff_lt_v64int8Dv64_aS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z23test_maxdiff_lt_v64int8Dv64_aS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z20test_maxdiff_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z20test_maxdiff_v64int8Dv64_aS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_min_ge_v64int8Dv64_aS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_min_ge_v64int8Dv64_aS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_min_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_min_v64int8Dv64_aS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_max_lt_v64int8Dv64_aS_Ry(<64 x i8> noundef %a, <64 x i8> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z19test_max_lt_v64int8Dv64_aS_bRy(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_max_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_max_v64int8Dv64_aS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_band_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %and.i = and <64 x i8> %b, %a
  ret <64 x i8> %and.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_bor_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %or.i = or <64 x i8> %b, %a
  ret <64 x i8> %or.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z21test_bneg_ltz_v64int8Dv64_aRy(<64 x i8> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z21test_bneg_ltz_v64int8Dv64_abRy(<64 x i8> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  br i1 %sgn, label %_ZL8bneg_ltzDv64_abRy.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  store i64 -1, ptr %cmp, align 4, !tbaa !2
  br label %_ZL8bneg_ltzDv64_abRy.exit

_ZL8bneg_ltzDv64_abRy.exit:                       ; preds = %entry, %if.then.i
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_bneg_v64int8Dv64_a(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z17test_bxor_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %b)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  %and.i.i = and <64 x i8> %1, %a
  %2 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %3 = extractvalue { <64 x i8>, <2 x i32> } %2, 0
  %and.i7.i = and <64 x i8> %3, %b
  %or.i.i = or <64 x i8> %and.i7.i, %and.i.i
  ret <64 x i8> %or.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_abs_gtz_v64int8Dv64_aRy(<64 x i8> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <64 x i8> @_Z20test_abs_gtz_v64int8Dv64_abRy(<64 x i8> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(8) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 %conv.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  store <2 x i32> %1, ptr %cmp, align 8
  %2 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_abs_v64int8Dv64_a(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_abs_v64int8Dv64_ab(<64 x i8> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 0
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_lt_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_ge_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %a, <64 x i8> %b, i32 1)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_le_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %b, <64 x i8> %a, i32 1)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_gt_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %b, <64 x i8> %a, i32 1)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_lt_v64int8Dv64_aS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_ge_v64int8Dv64_aS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %a, <64 x i8> %b, i32 %conv.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_le_v64int8Dv64_aS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vge8(<64 x i8> %b, <64 x i8> %a, i32 %conv.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_gt_v64int8Dv64_aS_b(<64 x i8> noundef %a, <64 x i8> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call <2 x i32> @llvm.aie2.vlt8(<64 x i8> %b, <64 x i8> %a, i32 %conv.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_ltz_v64int8Dv64_a(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  %2 = bitcast <2 x i32> %1 to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_ltz_v64int8Dv64_ab(<64 x i8> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8> %a)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  %2 = bitcast <2 x i32> %1 to i64
  %spec.select.i = select i1 %sgn, i64 %2, i64 -1
  ret i64 %spec.select.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_gtz_v64int8Dv64_a(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 1)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  %2 = bitcast <2 x i32> %1 to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_gtz_v64int8Dv64_ab(<64 x i8> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8> %a, i32 %conv.i.i)
  %1 = extractvalue { <64 x i8>, <2 x i32> } %0, 1
  %2 = bitcast <2 x i32> %1 to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z16test_eqz_v64int8Dv64_a(<64 x i8> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call <2 x i32> @llvm.aie2.veqz8(<64 x i8> %a)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_eq_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i = sub <64 x i8> %a, %b
  %0 = tail call <2 x i32> @llvm.aie2.veqz8(<64 x i8> %sub.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  ret i64 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @_Z15test_ne_v64int8Dv64_aS_(<64 x i8> noundef %a, <64 x i8> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i.i = sub <64 x i8> %a, %b
  %0 = tail call <2 x i32> @llvm.aie2.veqz8(<64 x i8> %sub.i.i.i)
  %1 = bitcast <2 x i32> %0 to i64
  %not.i = xor i64 %1, -1
  ret i64 %not.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <64 x i8> @_Z16test_sel_v64int8Dv64_aS_y(<64 x i8> noundef %a, <64 x i8> noundef %b, i64 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = bitcast i64 %s to <2 x i32>
  %1 = tail call noundef <64 x i8> @llvm.aie2.vsel8(<64 x i8> %a, <64 x i8> %b, <2 x i32> %0)
  ret <64 x i8> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_add_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <32 x i16> %b, %a
  ret <32 x i16> %add.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_sub_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i = sub <32 x i16> %a, %b
  ret <32 x i16> %sub.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z21test_addsub_v32uint16Dv32_tS_j(<32 x i16> noundef %a, <32 x i16> noundef %b, i32 noundef %as) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <32 x i16> @llvm.aie2.vaddsub16(<32 x i16> %a, <32 x i16> %b, i32 %as)
  ret <32 x i16> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z22test_neg_gtz_v32uint16Dv32_tRj(<32 x i16> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vneg.gtz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_neg_v32uint16Dv32_t(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vneg.gtz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_sub_lt_v32uint16Dv32_tS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.lt16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_sub_lt_v32uint16Dv32_tS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_sub_ge_v32uint16Dv32_tS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.ge16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_sub_ge_v32uint16Dv32_tS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.ge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z25test_maxdiff_lt_v32uint16Dv32_tS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z25test_maxdiff_lt_v32uint16Dv32_tS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z22test_maxdiff_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z22test_maxdiff_v32uint16Dv32_tS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_min_ge_v32uint16Dv32_tS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_min_ge_v32uint16Dv32_tS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_min_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_min_v32uint16Dv32_tS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_max_lt_v32uint16Dv32_tS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_max_lt_v32uint16Dv32_tS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_max_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_max_v32uint16Dv32_tS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z19test_band_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %and.i = and <32 x i16> %b, %a
  ret <32 x i16> %and.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_bor_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %or.i = or <32 x i16> %b, %a
  ret <32 x i16> %or.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z23test_bneg_ltz_v32uint16Dv32_tRj(<32 x i16> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  store i32 -1, ptr %cmp, align 4, !tbaa !6
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z23test_bneg_ltz_v32uint16Dv32_tbRj(<32 x i16> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  %spec.select.i = select i1 %sgn, i32 %1, i32 -1
  store i32 %spec.select.i, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z19test_bneg_v32uint16Dv32_t(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z19test_bxor_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %b)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  %and.i.i = and <32 x i16> %1, %a
  %2 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %3 = extractvalue { <32 x i16>, i32 } %2, 0
  %and.i7.i = and <32 x i16> %3, %b
  %or.i.i = or <32 x i16> %and.i7.i, %and.i.i
  ret <32 x i16> %or.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z22test_abs_gtz_v32uint16Dv32_tRj(<32 x i16> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z22test_abs_gtz_v32uint16Dv32_tbRj(<32 x i16> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_abs_v32uint16Dv32_t(<32 x i16> noundef returned %a) local_unnamed_addr #0 {
entry:
  ret <32 x i16> %a
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_abs_v32uint16Dv32_tb(<32 x i16> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_lt_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %a, <32 x i16> %b, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ge_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %a, <32 x i16> %b, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_le_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %b, <32 x i16> %a, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gt_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %b, <32 x i16> %a, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_lt_v32uint16Dv32_tS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ge_v32uint16Dv32_tS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_le_v32uint16Dv32_tS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %b, <32 x i16> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gt_v32uint16Dv32_tS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %b, <32 x i16> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_ltz_v32uint16Dv32_t(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  ret i32 -1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_ltz_v32uint16Dv32_tb(<32 x i16> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  %spec.select.i.i = select i1 %sgn, i32 %1, i32 -1
  ret i32 %spec.select.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_gtz_v32uint16Dv32_t(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 0)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_gtz_v32uint16Dv32_tb(<32 x i16> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_eqz_v32uint16Dv32_t(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.veqz16(<32 x i16> %a)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_eq_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i = sub <32 x i16> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz16(<32 x i16> %sub.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ne_v32uint16Dv32_tS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i.i = sub <32 x i16> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz16(<32 x i16> %sub.i.i.i)
  %not.i = xor i32 %0, -1
  ret i32 %not.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_sel_v32uint16Dv32_tS_j(<32 x i16> noundef %a, <32 x i16> noundef %b, i32 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <32 x i16> @llvm.aie2.vsel16(<32 x i16> %a, <32 x i16> %b, i32 %s)
  ret <32 x i16> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_add_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <32 x i16> %b, %a
  ret <32 x i16> %add.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_sub_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i = sub <32 x i16> %a, %b
  ret <32 x i16> %sub.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z20test_addsub_v32int16Dv32_sS_j(<32 x i16> noundef %a, <32 x i16> noundef %b, i32 noundef %as) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <32 x i16> @llvm.aie2.vaddsub16(<32 x i16> %a, <32 x i16> %b, i32 %as)
  ret <32 x i16> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_neg_gtz_v32int16Dv32_sRj(<32 x i16> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vneg.gtz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_neg_v32int16Dv32_s(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vneg.gtz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_sub_lt_v32int16Dv32_sS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.lt16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_sub_lt_v32int16Dv32_sS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_sub_ge_v32int16Dv32_sS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.ge16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_sub_ge_v32int16Dv32_sS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vsub.ge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z24test_maxdiff_lt_v32int16Dv32_sS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z24test_maxdiff_lt_v32int16Dv32_sS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z21test_maxdiff_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z21test_maxdiff_v32int16Dv32_sS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_min_ge_v32int16Dv32_sS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_min_ge_v32int16Dv32_sS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_min_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_min_v32int16Dv32_sS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_max_lt_v32int16Dv32_sS_Rj(<32 x i16> noundef %a, <32 x i16> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z20test_max_lt_v32int16Dv32_sS_bRj(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_max_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_max_v32int16Dv32_sS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_band_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %and.i = and <32 x i16> %b, %a
  ret <32 x i16> %and.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_bor_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %or.i = or <32 x i16> %b, %a
  ret <32 x i16> %or.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z22test_bneg_ltz_v32int16Dv32_sRj(<32 x i16> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z22test_bneg_ltz_v32int16Dv32_sbRj(<32 x i16> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  %spec.select.i = select i1 %sgn, i32 %1, i32 -1
  store i32 %spec.select.i, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_bneg_v32int16Dv32_s(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z18test_bxor_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %b)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  %and.i.i = and <32 x i16> %1, %a
  %2 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %3 = extractvalue { <32 x i16>, i32 } %2, 0
  %and.i7.i = and <32 x i16> %3, %b
  %or.i.i = or <32 x i16> %and.i7.i, %and.i.i
  ret <32 x i16> %or.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_abs_gtz_v32int16Dv32_sRj(<32 x i16> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <32 x i16> @_Z21test_abs_gtz_v32int16Dv32_sbRj(<32 x i16> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 %conv.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_abs_v32int16Dv32_s(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_abs_v32int16Dv32_sb(<32 x i16> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 0
  ret <32 x i16> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_lt_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %a, <32 x i16> %b, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_ge_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %a, <32 x i16> %b, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_le_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %b, <32 x i16> %a, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_gt_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %b, <32 x i16> %a, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_lt_v32int16Dv32_sS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_ge_v32int16Dv32_sS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %a, <32 x i16> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_le_v32int16Dv32_sS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge16(<32 x i16> %b, <32 x i16> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_gt_v32int16Dv32_sS_b(<32 x i16> noundef %a, <32 x i16> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt16(<32 x i16> %b, <32 x i16> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ltz_v32int16Dv32_s(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ltz_v32int16Dv32_sb(<32 x i16> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16> %a)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  %spec.select.i.i = select i1 %sgn, i32 %1, i32 -1
  ret i32 %spec.select.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gtz_v32int16Dv32_s(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 1)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gtz_v32int16Dv32_sb(<32 x i16> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16> %a, i32 %conv.i.i)
  %1 = extractvalue { <32 x i16>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_eqz_v32int16Dv32_s(<32 x i16> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.veqz16(<32 x i16> %a)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_eq_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i = sub <32 x i16> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz16(<32 x i16> %sub.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_ne_v32int16Dv32_sS_(<32 x i16> noundef %a, <32 x i16> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i.i = sub <32 x i16> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz16(<32 x i16> %sub.i.i.i)
  %not.i = xor i32 %0, -1
  ret i32 %not.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x i16> @_Z17test_sel_v32int16Dv32_sS_j(<32 x i16> noundef %a, <32 x i16> noundef %b, i32 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <32 x i16> @llvm.aie2.vsel16(<32 x i16> %a, <32 x i16> %b, i32 %s)
  ret <32 x i16> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_add_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <16 x i32> %b, %a
  ret <16 x i32> %add.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_sub_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i = sub <16 x i32> %a, %b
  ret <16 x i32> %sub.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z21test_addsub_v16uint32Dv16_jS_j(<16 x i32> noundef %a, <16 x i32> noundef %b, i32 noundef %as) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <16 x i32> @llvm.aie2.vaddsub32(<16 x i32> %a, <16 x i32> %b, i32 %as)
  ret <16 x i32> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z22test_neg_gtz_v16uint32Dv16_jRj(<16 x i32> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vneg.gtz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_neg_v16uint32Dv16_j(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vneg.gtz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_sub_lt_v16uint32Dv16_jS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.lt32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_sub_lt_v16uint32Dv16_jS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_sub_ge_v16uint32Dv16_jS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.ge32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_sub_ge_v16uint32Dv16_jS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.ge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z25test_maxdiff_lt_v16uint32Dv16_jS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z25test_maxdiff_lt_v16uint32Dv16_jS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z22test_maxdiff_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z22test_maxdiff_v16uint32Dv16_jS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_min_ge_v16uint32Dv16_jS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_min_ge_v16uint32Dv16_jS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_min_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_min_v16uint32Dv16_jS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_max_lt_v16uint32Dv16_jS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_max_lt_v16uint32Dv16_jS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_max_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_max_v16uint32Dv16_jS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z19test_band_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %and.i = and <16 x i32> %b, %a
  ret <16 x i32> %and.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_bor_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %or.i = or <16 x i32> %b, %a
  ret <16 x i32> %or.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z23test_bneg_ltz_v16uint32Dv16_jRj(<16 x i32> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  store i32 -1, ptr %cmp, align 4, !tbaa !6
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z23test_bneg_ltz_v16uint32Dv16_jbRj(<16 x i32> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  %spec.select.i = select i1 %sgn, i32 %1, i32 -1
  store i32 %spec.select.i, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z19test_bneg_v16uint32Dv16_j(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z19test_bxor_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %b)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  %and.i.i = and <16 x i32> %1, %a
  %2 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %3 = extractvalue { <16 x i32>, i32 } %2, 0
  %and.i7.i = and <16 x i32> %3, %b
  %or.i.i = or <16 x i32> %and.i7.i, %and.i.i
  ret <16 x i32> %or.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z22test_abs_gtz_v16uint32Dv16_jRj(<16 x i32> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z22test_abs_gtz_v16uint32Dv16_jbRj(<16 x i32> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_abs_v16uint32Dv16_j(<16 x i32> noundef returned %a) local_unnamed_addr #0 {
entry:
  ret <16 x i32> %a
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_abs_v16uint32Dv16_jb(<16 x i32> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_lt_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %a, <16 x i32> %b, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ge_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %a, <16 x i32> %b, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_le_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %b, <16 x i32> %a, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gt_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %b, <16 x i32> %a, i32 0)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_lt_v16uint32Dv16_jS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ge_v16uint32Dv16_jS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_le_v16uint32Dv16_jS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %b, <16 x i32> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gt_v16uint32Dv16_jS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %b, <16 x i32> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_ltz_v16uint32Dv16_j(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  ret i32 -1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_ltz_v16uint32Dv16_jb(<16 x i32> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  %spec.select.i.i = select i1 %sgn, i32 %1, i32 -1
  ret i32 %spec.select.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_gtz_v16uint32Dv16_j(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 0)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_gtz_v16uint32Dv16_jb(<16 x i32> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z18test_eqz_v16uint32Dv16_j(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.veqz32(<16 x i32> %a)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_eq_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i = sub <16 x i32> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz32(<16 x i32> %sub.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ne_v16uint32Dv16_jS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i.i = sub <16 x i32> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz32(<16 x i32> %sub.i.i.i)
  %not.i = xor i32 %0, -1
  ret i32 %not.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_sel_v16uint32Dv16_jS_j(<16 x i32> noundef %a, <16 x i32> noundef %b, i32 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %a, <16 x i32> %b, i32 %s)
  ret <16 x i32> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_add_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %add.i = add <16 x i32> %b, %a
  ret <16 x i32> %add.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_sub_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i = sub <16 x i32> %a, %b
  ret <16 x i32> %sub.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z20test_addsub_v16int32Dv16_iS_j(<16 x i32> noundef %a, <16 x i32> noundef %b, i32 noundef %as) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <16 x i32> @llvm.aie2.vaddsub32(<16 x i32> %a, <16 x i32> %b, i32 %as)
  ret <16 x i32> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_neg_gtz_v16int32Dv16_iRj(<16 x i32> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vneg.gtz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_neg_v16int32Dv16_i(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vneg.gtz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_sub_lt_v16int32Dv16_iS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.lt32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_sub_lt_v16int32Dv16_iS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_sub_ge_v16int32Dv16_iS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.ge32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_sub_ge_v16int32Dv16_iS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vsub.ge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z24test_maxdiff_lt_v16int32Dv16_iS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z24test_maxdiff_lt_v16int32Dv16_iS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z21test_maxdiff_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z21test_maxdiff_v16int32Dv16_iS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_min_ge_v16int32Dv16_iS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_min_ge_v16int32Dv16_iS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_min_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_min_v16int32Dv16_iS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_max_lt_v16int32Dv16_iS_Rj(<16 x i32> noundef %a, <16 x i32> noundef %b, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z20test_max_lt_v16int32Dv16_iS_bRj(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_max_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_max_v16int32Dv16_iS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_band_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %and.i = and <16 x i32> %b, %a
  ret <16 x i32> %and.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_bor_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %or.i = or <16 x i32> %b, %a
  ret <16 x i32> %or.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z22test_bneg_ltz_v16int32Dv16_iRj(<16 x i32> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z22test_bneg_ltz_v16int32Dv16_ibRj(<16 x i32> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  %spec.select.i = select i1 %sgn, i32 %1, i32 -1
  store i32 %spec.select.i, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_bneg_v16int32Dv16_i(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z18test_bxor_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %b)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  %and.i.i = and <16 x i32> %1, %a
  %2 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %3 = extractvalue { <16 x i32>, i32 } %2, 0
  %and.i7.i = and <16 x i32> %3, %b
  %or.i.i = or <16 x i32> %and.i7.i, %and.i.i
  ret <16 x i32> %or.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_abs_gtz_v16int32Dv16_iRj(<16 x i32> noundef %a, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef <16 x i32> @_Z21test_abs_gtz_v16int32Dv16_ibRj(<16 x i32> noundef %a, i1 noundef zeroext %sgn, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #1 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 %conv.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  store i32 %1, ptr %cmp, align 4
  %2 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_abs_v16int32Dv16_i(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_abs_v16int32Dv16_ib(<16 x i32> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 0
  ret <16 x i32> %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_lt_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %a, <16 x i32> %b, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_ge_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %a, <16 x i32> %b, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_le_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %b, <16 x i32> %a, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_gt_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %b, <16 x i32> %a, i32 1)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_lt_v16int32Dv16_iS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_ge_v16int32Dv16_iS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %a, <16 x i32> %b, i32 %conv.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_le_v16int32Dv16_iS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vge32(<16 x i32> %b, <16 x i32> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_gt_v16int32Dv16_iS_b(<16 x i32> noundef %a, <16 x i32> noundef %b, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call noundef i32 @llvm.aie2.vlt32(<16 x i32> %b, <16 x i32> %a, i32 %conv.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ltz_v16int32Dv16_i(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_ltz_v16int32Dv16_ib(<16 x i32> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32> %a)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  %spec.select.i.i = select i1 %sgn, i32 %1, i32 -1
  ret i32 %spec.select.i.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gtz_v16int32Dv16_i(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 1)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_gtz_v16int32Dv16_ib(<16 x i32> noundef %a, i1 noundef zeroext %sgn) local_unnamed_addr #0 {
entry:
  %conv.i.i = zext i1 %sgn to i32
  %0 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %a, i32 %conv.i.i)
  %1 = extractvalue { <16 x i32>, i32 } %0, 1
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z17test_eqz_v16int32Dv16_i(<16 x i32> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.veqz32(<16 x i32> %a)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_eq_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i = sub <16 x i32> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz32(<16 x i32> %sub.i.i)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z16test_ne_v16int32Dv16_iS_(<16 x i32> noundef %a, <16 x i32> noundef %b) local_unnamed_addr #0 {
entry:
  %sub.i.i.i = sub <16 x i32> %a, %b
  %0 = tail call noundef i32 @llvm.aie2.veqz32(<16 x i32> %sub.i.i.i)
  %not.i = xor i32 %0, -1
  ret i32 %not.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x i32> @_Z17test_sel_v16int32Dv16_iS_j(<16 x i32> noundef %a, <16 x i32> noundef %b, i32 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %a, <16 x i32> %b, i32 %s)
  ret <16 x i32> %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <32 x bfloat> @_Z20test_sel_v32bfloat16Dv32_u6__bf16S_j(<32 x bfloat> noundef %a, <32 x bfloat> noundef %b, i32 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = bitcast <32 x bfloat> %a to <32 x i16>
  %1 = bitcast <32 x bfloat> %b to <32 x i16>
  %2 = tail call <32 x i16> @llvm.aie2.vsel16(<32 x i16> %0, <32 x i16> %1, i32 %s)
  %3 = bitcast <32 x i16> %2 to <32 x bfloat>
  ret <32 x bfloat> %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x float> @_Z17test_sel_v16floatDv16_fS_j(<16 x float> noundef %a, <16 x float> noundef %b, i32 noundef %s) local_unnamed_addr #0 {
entry:
  %0 = bitcast <16 x float> %a to <16 x i32>
  %1 = bitcast <16 x float> %b to <16 x i32>
  %2 = tail call <16 x i32> @llvm.aie2.vsel32(<16 x i32> %0, <16 x i32> %1, i32 %s)
  %3 = bitcast <16 x i32> %2 to <16 x float>
  ret <16 x float> %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z19test_lt_v32bfloat16Dv32_u6__bf16S_(<32 x bfloat> noundef %a, <32 x bfloat> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %a, <32 x bfloat> %b)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z19test_ge_v32bfloat16Dv32_u6__bf16S_(<32 x bfloat> noundef %a, <32 x bfloat> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %a, <32 x bfloat> %b)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z19test_le_v32bfloat16Dv32_u6__bf16S_(<32 x bfloat> noundef %a, <32 x bfloat> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %b, <32 x bfloat> %a)
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z19test_gt_v32bfloat16Dv32_u6__bf16S_(<32 x bfloat> noundef %a, <32 x bfloat> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %b, <32 x bfloat> %a)
  ret i32 %0
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z20test_ltz_v32bfloat16Dv32_u6__bf16(<32 x bfloat> noundef %a) local_unnamed_addr #2 {
entry:
  %0 = tail call noundef <32 x i16> @llvm.aie2.vbroadcast16.I512(i32 32768)
  %1 = bitcast <32 x i16> %0 to <32 x bfloat>
  %2 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %a, <32 x bfloat> %1)
  ret i32 %2
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z20test_gtz_v32bfloat16Dv32_u6__bf16(<32 x bfloat> noundef %a) local_unnamed_addr #2 {
entry:
  %0 = tail call noundef <32 x i16> @llvm.aie2.vbroadcast16.I512(i32 0)
  %1 = bitcast <32 x i16> %0 to <32 x bfloat>
  %2 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %1, <32 x bfloat> %a)
  ret i32 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z20test_eqz_v32bfloat16Dv32_u6__bf16(<32 x bfloat> noundef %a) local_unnamed_addr #0 {
entry:
  %0 = bitcast <32 x bfloat> %a to <32 x i16>
  %1 = tail call noundef i32 @llvm.aie2.veqz16(<32 x i16> %0)
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z19test_eq_v32bfloat16Dv32_u6__bf16S_(<32 x bfloat> noundef %a, <32 x bfloat> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %b, <32 x bfloat> %a)
  %1 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %a, <32 x bfloat> %b)
  %and.i = and i32 %1, %0
  ret i32 %and.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @_Z19test_ne_v32bfloat16Dv32_u6__bf16S_(<32 x bfloat> noundef %a, <32 x bfloat> noundef %b) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %a, <32 x bfloat> %b)
  %1 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %b, <32 x bfloat> %a)
  %or.i = or i32 %1, %0
  ret i32 %or.i
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef i32 @_Z7test_ltDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v1 to <8 x i64>
  %2 = bitcast <16 x float> %v2 to <8 x i64>
  %3 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %1, <8 x i64> %2, i32 28)
  %4 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %3)
  %5 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %4, i32 0)
  %6 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %5, <32 x bfloat> %0)
  ret i32 %6
}

; Function Attrs: mustprogress nofree nounwind memory(argmem: write, inaccessiblemem: read)
define dso_local noundef <16 x float> @_Z11test_max_ltDv16_fS_Rj(<16 x float> noundef %v1, <16 x float> noundef %v2, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #4 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v1 to <8 x i64>
  %2 = bitcast <16 x float> %v2 to <8 x i64>
  %3 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %1, <8 x i64> %2, i32 28)
  %4 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %3)
  %5 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %4, i32 0)
  %6 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %5, <32 x bfloat> %0)
  store i32 %6, ptr %cmp, align 4, !tbaa !6
  %7 = bitcast <16 x float> %v1 to <16 x i32>
  %8 = bitcast <16 x float> %v2 to <16 x i32>
  %9 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %7, <16 x i32> %8, i32 %6)
  %10 = bitcast <16 x i32> %9 to <16 x float>
  ret <16 x float> %10
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef <16 x float> @_Z8test_maxDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v1 to <8 x i64>
  %2 = bitcast <16 x float> %v2 to <8 x i64>
  %3 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %1, <8 x i64> %2, i32 28)
  %4 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %3)
  %5 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %4, i32 0)
  %6 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %5, <32 x bfloat> %0)
  %7 = bitcast <16 x float> %v1 to <16 x i32>
  %8 = bitcast <16 x float> %v2 to <16 x i32>
  %9 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %7, <16 x i32> %8, i32 %6)
  %10 = bitcast <16 x i32> %9 to <16 x float>
  ret <16 x float> %10
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef i32 @_Z7test_geDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v1 to <8 x i64>
  %2 = bitcast <16 x float> %v2 to <8 x i64>
  %3 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %1, <8 x i64> %2, i32 28)
  %4 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %3)
  %5 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %4, i32 0)
  %6 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %5, <32 x bfloat> %0)
  %and.i = and i32 %6, 65535
  ret i32 %and.i
}

; Function Attrs: mustprogress nofree nounwind memory(argmem: write, inaccessiblemem: read)
define dso_local noundef <16 x float> @_Z11test_min_geDv16_fS_Rj(<16 x float> noundef %v1, <16 x float> noundef %v2, ptr nocapture nonnull writeonly align 4 dereferenceable(4) %cmp) local_unnamed_addr #4 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v1 to <8 x i64>
  %2 = bitcast <16 x float> %v2 to <8 x i64>
  %3 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %1, <8 x i64> %2, i32 28)
  %4 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %3)
  %5 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %4, i32 0)
  %6 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %5, <32 x bfloat> %0)
  %and.i.i = and i32 %6, 65535
  store i32 %and.i.i, ptr %cmp, align 4, !tbaa !6
  %7 = bitcast <16 x float> %v1 to <16 x i32>
  %8 = bitcast <16 x float> %v2 to <16 x i32>
  %9 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %7, <16 x i32> %8, i32 %and.i.i)
  %10 = bitcast <16 x i32> %9 to <16 x float>
  ret <16 x float> %10
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef <16 x float> @_Z8test_minDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v1 to <8 x i64>
  %2 = bitcast <16 x float> %v2 to <8 x i64>
  %3 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %1, <8 x i64> %2, i32 28)
  %4 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %3)
  %5 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %4, i32 0)
  %6 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %5, <32 x bfloat> %0)
  %and.i.i = and i32 %6, 65535
  %7 = bitcast <16 x float> %v1 to <16 x i32>
  %8 = bitcast <16 x float> %v2 to <16 x i32>
  %9 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %7, <16 x i32> %8, i32 %and.i.i)
  %10 = bitcast <16 x i32> %9 to <16 x float>
  ret <16 x float> %10
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef i32 @_Z7test_gtDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v1 to <8 x i64>
  %2 = bitcast <16 x float> %v2 to <8 x i64>
  %3 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %1, <8 x i64> %2, i32 28)
  %4 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %3)
  %5 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %4, i32 0)
  %6 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %0, <32 x bfloat> %5)
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef <16 x float> @_Z8test_absDv16_f(<16 x float> noundef %v1) local_unnamed_addr #0 {
entry:
  %0 = bitcast <16 x float> %v1 to <16 x i32>
  %1 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %0, i32 1)
  %2 = extractvalue { <16 x i32>, i32 } %1, 0
  %3 = bitcast <16 x i32> %2 to <16 x float>
  ret <16 x float> %3
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef <16 x float> @_Z12test_min_absDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = bitcast <16 x float> %v2 to <16 x i32>
  %1 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %0, i32 1)
  %2 = extractvalue { <16 x i32>, i32 } %1, 0
  %3 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %4 = bitcast <16 x float> %v1 to <8 x i64>
  %5 = bitcast <16 x i32> %2 to <8 x i64>
  %6 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %4, <8 x i64> %5, i32 28)
  %7 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %6)
  %8 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %3, <16 x bfloat> %7, i32 0)
  %9 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %8, <32 x bfloat> %3)
  %and.i.i = and i32 %9, 65535
  %10 = bitcast <16 x float> %v1 to <16 x i32>
  %11 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %10, <16 x i32> %0, i32 %and.i.i)
  %12 = bitcast <16 x i32> %11 to <16 x float>
  ret <16 x float> %12
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef <16 x float> @_Z12test_max_absDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = bitcast <16 x float> %v2 to <16 x i32>
  %1 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %0, i32 1)
  %2 = extractvalue { <16 x i32>, i32 } %1, 0
  %3 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %4 = bitcast <16 x float> %v1 to <8 x i64>
  %5 = bitcast <16 x i32> %2 to <8 x i64>
  %6 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %4, <8 x i64> %5, i32 28)
  %7 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %6)
  %8 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %3, <16 x bfloat> %7, i32 0)
  %9 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %8, <32 x bfloat> %3)
  %10 = bitcast <16 x float> %v1 to <16 x i32>
  %11 = tail call noundef <16 x i32> @llvm.aie2.vsel32(<16 x i32> %10, <16 x i32> %0, i32 %9)
  %12 = bitcast <16 x i32> %11 to <16 x float>
  ret <16 x float> %12
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef i32 @_Z11test_ge_absDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v2 to <16 x i32>
  %2 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %1, i32 1)
  %3 = extractvalue { <16 x i32>, i32 } %2, 0
  %4 = bitcast <16 x float> %v1 to <8 x i64>
  %5 = bitcast <16 x i32> %3 to <8 x i64>
  %6 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %4, <8 x i64> %5, i32 28)
  %7 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %6)
  %8 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %7, i32 0)
  %9 = tail call noundef i32 @llvm.aie2.vgebf16(<32 x bfloat> %8, <32 x bfloat> %0)
  %and.i = and i32 %9, 65535
  ret i32 %and.i
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: read)
define dso_local noundef i32 @_Z11test_lt_absDv16_fS_(<16 x float> noundef %v1, <16 x float> noundef %v2) local_unnamed_addr #3 {
entry:
  %0 = tail call noundef <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat 0xR0000)
  %1 = bitcast <16 x float> %v2 to <16 x i32>
  %2 = tail call { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32> %1, i32 1)
  %3 = extractvalue { <16 x i32>, i32 } %2, 0
  %4 = bitcast <16 x float> %v1 to <8 x i64>
  %5 = bitcast <16 x i32> %3 to <8 x i64>
  %6 = tail call noundef <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64> %4, <8 x i64> %5, i32 28)
  %7 = tail call noundef <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64> %6)
  %8 = tail call noundef <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat> %0, <16 x bfloat> %7, i32 0)
  %9 = tail call noundef i32 @llvm.aie2.vltbf16(<32 x bfloat> %8, <32 x bfloat> %0)
  ret i32 %9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <64 x i8> @llvm.aie2.vaddsub8(<64 x i8>, <64 x i8>, <2 x i32>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vneg.gtz8(<64 x i8>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.lt8(<64 x i8>, <64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vsub.ge8(<64 x i8>, <64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vmaxdiff.lt8(<64 x i8>, <64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vmin.ge8(<64 x i8>, <64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vmax.lt8(<64 x i8>, <64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vbneg.ltz8(<64 x i8>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <64 x i8>, <2 x i32> } @llvm.aie2.vabs.gtz8(<64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @llvm.aie2.vlt8(<64 x i8>, <64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @llvm.aie2.vge8(<64 x i8>, <64 x i8>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i32> @llvm.aie2.veqz8(<64 x i8>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <64 x i8> @llvm.aie2.vsel8(<64 x i8>, <64 x i8>, <2 x i32>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <32 x i16> @llvm.aie2.vaddsub16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vneg.gtz16(<32 x i16>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vsub.lt16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vsub.ge16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vmaxdiff.lt16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vmin.ge16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vmax.lt16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vbneg.ltz16(<32 x i16>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <32 x i16>, i32 } @llvm.aie2.vabs.gtz16(<32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.vlt16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.vge16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.veqz16(<32 x i16>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <32 x i16> @llvm.aie2.vsel16(<32 x i16>, <32 x i16>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i32> @llvm.aie2.vaddsub32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vneg.gtz32(<16 x i32>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vsub.lt32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vsub.ge32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vmaxdiff.lt32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vmin.ge32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vmax.lt32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vbneg.ltz32(<16 x i32>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare { <16 x i32>, i32 } @llvm.aie2.vabs.gtz32(<16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.vlt32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.vge32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.veqz32(<16 x i32>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i32> @llvm.aie2.vsel32(<16 x i32>, <16 x i32>, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.vltbf16(<32 x bfloat>, <32 x bfloat>) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aie2.vgebf16(<32 x bfloat>, <32 x bfloat>) #5

; Function Attrs: nofree nosync nounwind memory(none)
declare <32 x i16> @llvm.aie2.vbroadcast16.I512(i32) #6

; Function Attrs: nofree nosync nounwind memory(none)
declare <32 x bfloat> @llvm.aie2.vbroadcast16.bf512(bfloat) #6

; Function Attrs: nofree nosync nounwind memory(none)
declare <32 x bfloat> @llvm.aie2.upd.bf512.bf256(<32 x bfloat>, <16 x bfloat>, i32) #6

; Function Attrs: nofree nounwind memory(inaccessiblemem: read)
declare <16 x bfloat> @llvm.aie2.v16accfloat.to.v16bf16(<8 x i64>) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: read)
declare <8 x i64> @llvm.aie2.sub.accfloat(<8 x i64>, <8 x i64>, i32) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { mustprogress nofree nounwind memory(argmem: write, inaccessiblemem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { nofree nosync nounwind memory(none) }
attributes #7 = { nofree nounwind memory(inaccessiblemem: read) }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: read) }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 19.0.0 (https://github.com/Xilinx/llvm-aie 4c793d4a14cb8fa4dfbb6cf7d2c5305103e7d69e)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
