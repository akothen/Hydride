; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

declare <8 x i8> @hydride.node.conv2d.0(<8 x i8>, <8 x i8>, <8 x i8>)

define void @conv2d(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr %7, ptr %8, i64 %9, i64 %10, i64 %11, ptr %12, ptr %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18) !dbg !3 {
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, ptr %1, 1, !dbg !9
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 %2, 2, !dbg !10
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 %3, 3, 0, !dbg !11
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 %5, 4, 0, !dbg !12
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 %4, 3, 1, !dbg !13
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 %6, 4, 1, !dbg !14
  %27 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %7, 0, !dbg !15
  %28 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %27, ptr %8, 1, !dbg !16
  %29 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %28, i64 %9, 2, !dbg !17
  %30 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %29, i64 %10, 3, 0, !dbg !18
  %31 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %30, i64 %11, 4, 0, !dbg !19
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %12, 0, !dbg !20
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, ptr %13, 1, !dbg !21
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, i64 %14, 2, !dbg !22
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, i64 %15, 3, 0, !dbg !23
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, i64 %17, 4, 0, !dbg !24
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, i64 %16, 3, 1, !dbg !25
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 %18, 4, 1, !dbg !26
  br label %39, !dbg !27

39:                                               ; preds = %96, %19
  %40 = phi i64 [ %97, %96 ], [ 0, %19 ]
  %41 = icmp slt i64 %40, 16, !dbg !28
  br i1 %41, label %42, label %98, !dbg !29

42:                                               ; preds = %39
  br label %43, !dbg !30

43:                                               ; preds = %94, %42
  %44 = phi i64 [ %95, %94 ], [ 0, %42 ]
  %45 = icmp slt i64 %44, 256, !dbg !31
  br i1 %45, label %46, label %96, !dbg !32

46:                                               ; preds = %43
  br label %47, !dbg !33

47:                                               ; preds = %92, %46
  %48 = phi i64 [ %93, %92 ], [ 0, %46 ]
  %49 = icmp slt i64 %48, 3, !dbg !34
  br i1 %49, label %50, label %94, !dbg !35

50:                                               ; preds = %47
  br label %51, !dbg !36

51:                                               ; preds = %54, %50
  %52 = phi i64 [ %91, %54 ], [ 0, %50 ]
  %53 = icmp slt i64 %52, 3, !dbg !37
  br i1 %53, label %54, label %92, !dbg !38

54:                                               ; preds = %51
  %55 = sub i64 256, %44, !dbg !39
  %56 = trunc i64 %55 to i32, !dbg !40
  %57 = insertelement <8 x i32> undef, i32 %56, i32 0, !dbg !41
  %58 = shufflevector <8 x i32> %57, <8 x i32> undef, <8 x i32> zeroinitializer, !dbg !42
  %59 = icmp sgt <8 x i32> %58, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !43
  %60 = mul i64 %40, 256, !dbg !44
  %61 = add i64 %60, %44, !dbg !45
  %62 = getelementptr i8, ptr %13, i64 %61, !dbg !46
  %63 = call <8 x i8> @llvm.masked.load.v8i8.p0(ptr %62, i32 1, <8 x i1> %59, <8 x i8> zeroinitializer), !dbg !47
  %64 = add i64 %40, %48, !dbg !48
  %65 = add i64 %44, %52, !dbg !49
  %66 = sub i64 288, %65, !dbg !50
  %67 = trunc i64 %66 to i32, !dbg !51
  %68 = insertelement <8 x i32> undef, i32 %67, i32 0, !dbg !52
  %69 = shufflevector <8 x i32> %68, <8 x i32> undef, <8 x i32> zeroinitializer, !dbg !53
  %70 = icmp sgt <8 x i32> %69, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !54
  %71 = mul i64 %64, 288, !dbg !55
  %72 = add i64 %71, %65, !dbg !56
  %73 = getelementptr i8, ptr %1, i64 %72, !dbg !57
  %74 = call <8 x i8> @llvm.masked.load.v8i8.p0(ptr %73, i32 1, <8 x i1> %70, <8 x i8> zeroinitializer), !dbg !58
  %75 = mul i64 %48, 16, !dbg !59
  %76 = mul i64 %52, 2, !dbg !60
  %77 = add i64 %75, %76, !dbg !61
  %78 = getelementptr i8, ptr %8, i64 %77, !dbg !62
  %79 = load i8, ptr %78, align 1, !dbg !63
  %80 = insertelement <8 x i8> undef, i8 %79, i32 0, !dbg !64
  %81 = shufflevector <8 x i8> %80, <8 x i8> undef, <8 x i32> zeroinitializer, !dbg !65
  %82 = call <8 x i8> @hydride.node.conv2d.0(<8 x i8> %63, <8 x i8> %74, <8 x i8> %81), !dbg !66
  %83 = sub i64 256, %44, !dbg !67
  %84 = trunc i64 %83 to i32, !dbg !68
  %85 = insertelement <8 x i32> undef, i32 %84, i32 0, !dbg !69
  %86 = shufflevector <8 x i32> %85, <8 x i32> undef, <8 x i32> zeroinitializer, !dbg !70
  %87 = icmp sgt <8 x i32> %86, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !71
  %88 = mul i64 %40, 256, !dbg !72
  %89 = add i64 %88, %44, !dbg !73
  %90 = getelementptr i8, ptr %13, i64 %89, !dbg !74
  call void @llvm.masked.store.v8i8.p0(<8 x i8> %82, ptr %90, i32 1, <8 x i1> %87), !dbg !75
  %91 = add i64 %52, 1, !dbg !76
  br label %51, !dbg !77

92:                                               ; preds = %51
  %93 = add i64 %48, 1, !dbg !78
  br label %47, !dbg !79

94:                                               ; preds = %47
  %95 = add i64 %44, 8, !dbg !80
  br label %43, !dbg !81

96:                                               ; preds = %43
  %97 = add i64 %40, 1, !dbg !82
  br label %39, !dbg !83

98:                                               ; preds = %39
  ret void, !dbg !84
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind readonly willreturn
declare <8 x i8> @llvm.masked.load.v8i8.p0(ptr, i32 immarg, <8 x i1>, <8 x i8>) #0

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.store.v8i8.p0(<8 x i8>, ptr, i32 immarg, <8 x i1>) #1

attributes #0 = { argmemonly nocallback nofree nosync nounwind readonly willreturn }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "conv2d", linkageName: "conv2d", scope: null, file: !4, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "6.mlir", directory: "/home/baronia3/llvm-project/mlir/test/Hydride")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 13, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 14, column: 11, scope: !8)
!10 = !DILocation(line: 15, column: 11, scope: !8)
!11 = !DILocation(line: 16, column: 11, scope: !8)
!12 = !DILocation(line: 17, column: 11, scope: !8)
!13 = !DILocation(line: 18, column: 11, scope: !8)
!14 = !DILocation(line: 19, column: 11, scope: !8)
!15 = !DILocation(line: 21, column: 11, scope: !8)
!16 = !DILocation(line: 22, column: 11, scope: !8)
!17 = !DILocation(line: 23, column: 11, scope: !8)
!18 = !DILocation(line: 24, column: 11, scope: !8)
!19 = !DILocation(line: 25, column: 11, scope: !8)
!20 = !DILocation(line: 27, column: 11, scope: !8)
!21 = !DILocation(line: 28, column: 11, scope: !8)
!22 = !DILocation(line: 29, column: 11, scope: !8)
!23 = !DILocation(line: 30, column: 11, scope: !8)
!24 = !DILocation(line: 31, column: 11, scope: !8)
!25 = !DILocation(line: 32, column: 11, scope: !8)
!26 = !DILocation(line: 33, column: 11, scope: !8)
!27 = !DILocation(line: 34, column: 5, scope: !8)
!28 = !DILocation(line: 36, column: 11, scope: !8)
!29 = !DILocation(line: 37, column: 5, scope: !8)
!30 = !DILocation(line: 39, column: 5, scope: !8)
!31 = !DILocation(line: 41, column: 11, scope: !8)
!32 = !DILocation(line: 42, column: 5, scope: !8)
!33 = !DILocation(line: 44, column: 5, scope: !8)
!34 = !DILocation(line: 46, column: 11, scope: !8)
!35 = !DILocation(line: 47, column: 5, scope: !8)
!36 = !DILocation(line: 49, column: 5, scope: !8)
!37 = !DILocation(line: 51, column: 11, scope: !8)
!38 = !DILocation(line: 52, column: 5, scope: !8)
!39 = !DILocation(line: 56, column: 11, scope: !8)
!40 = !DILocation(line: 58, column: 11, scope: !8)
!41 = !DILocation(line: 61, column: 11, scope: !8)
!42 = !DILocation(line: 62, column: 11, scope: !8)
!43 = !DILocation(line: 63, column: 11, scope: !8)
!44 = !DILocation(line: 66, column: 11, scope: !8)
!45 = !DILocation(line: 67, column: 11, scope: !8)
!46 = !DILocation(line: 68, column: 11, scope: !8)
!47 = !DILocation(line: 70, column: 11, scope: !8)
!48 = !DILocation(line: 71, column: 11, scope: !8)
!49 = !DILocation(line: 72, column: 11, scope: !8)
!50 = !DILocation(line: 75, column: 11, scope: !8)
!51 = !DILocation(line: 77, column: 11, scope: !8)
!52 = !DILocation(line: 80, column: 11, scope: !8)
!53 = !DILocation(line: 81, column: 11, scope: !8)
!54 = !DILocation(line: 82, column: 11, scope: !8)
!55 = !DILocation(line: 85, column: 11, scope: !8)
!56 = !DILocation(line: 86, column: 11, scope: !8)
!57 = !DILocation(line: 87, column: 11, scope: !8)
!58 = !DILocation(line: 89, column: 11, scope: !8)
!59 = !DILocation(line: 90, column: 11, scope: !8)
!60 = !DILocation(line: 91, column: 11, scope: !8)
!61 = !DILocation(line: 92, column: 11, scope: !8)
!62 = !DILocation(line: 93, column: 11, scope: !8)
!63 = !DILocation(line: 94, column: 11, scope: !8)
!64 = !DILocation(line: 97, column: 11, scope: !8)
!65 = !DILocation(line: 98, column: 11, scope: !8)
!66 = !DILocation(line: 99, column: 11, scope: !8)
!67 = !DILocation(line: 102, column: 11, scope: !8)
!68 = !DILocation(line: 104, column: 11, scope: !8)
!69 = !DILocation(line: 107, column: 11, scope: !8)
!70 = !DILocation(line: 108, column: 11, scope: !8)
!71 = !DILocation(line: 109, column: 11, scope: !8)
!72 = !DILocation(line: 111, column: 11, scope: !8)
!73 = !DILocation(line: 112, column: 11, scope: !8)
!74 = !DILocation(line: 113, column: 11, scope: !8)
!75 = !DILocation(line: 115, column: 5, scope: !8)
!76 = !DILocation(line: 116, column: 11, scope: !8)
!77 = !DILocation(line: 117, column: 5, scope: !8)
!78 = !DILocation(line: 119, column: 12, scope: !8)
!79 = !DILocation(line: 120, column: 5, scope: !8)
!80 = !DILocation(line: 122, column: 12, scope: !8)
!81 = !DILocation(line: 123, column: 5, scope: !8)
!82 = !DILocation(line: 125, column: 12, scope: !8)
!83 = !DILocation(line: 126, column: 5, scope: !8)
!84 = !DILocation(line: 128, column: 5, scope: !8)
