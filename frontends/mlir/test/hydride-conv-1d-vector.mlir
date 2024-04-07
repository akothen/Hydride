module {
  func.func @depthwise_conv_1d_nw_tensor(%arg0: tensor<1x113x96xi32>, %arg1: tensor<3x96xi32>) {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = linalg.init_tensor [1, 56, 96] : tensor<1x56x96xi32>
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0], %c0_i32 {in_bounds = [true, true, true]} : tensor<1x113x96xi32>, vector<1x113x96xi32>
    %2 = vector.transfer_read %arg1[%c0, %c0], %c0_i32 {in_bounds = [true, true]} : tensor<3x96xi32>, vector<3x96xi32>
    %3 = vector.transfer_read %0[%c0, %c0, %c0], %c0_i32 {in_bounds = [true, true, true]} : tensor<1x56x96xi32>, vector<1x56x96xi32>
    %4 = vector.extract_strided_slice %1 {offsets = [0, 0, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %5 = vector.extract_strided_slice %1 {offsets = [0, 2, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %6 = vector.extract_strided_slice %1 {offsets = [0, 4, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %7 = vector.extract_strided_slice %1 {offsets = [0, 6, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %8 = vector.extract_strided_slice %1 {offsets = [0, 8, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %9 = vector.extract_strided_slice %1 {offsets = [0, 10, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %10 = vector.extract_strided_slice %1 {offsets = [0, 12, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %11 = vector.extract_strided_slice %1 {offsets = [0, 14, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %12 = vector.extract_strided_slice %1 {offsets = [0, 16, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %13 = vector.extract_strided_slice %1 {offsets = [0, 18, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %14 = vector.extract_strided_slice %1 {offsets = [0, 20, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %15 = vector.extract_strided_slice %1 {offsets = [0, 22, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %16 = vector.extract_strided_slice %1 {offsets = [0, 24, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %17 = vector.extract_strided_slice %1 {offsets = [0, 26, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %18 = vector.extract_strided_slice %1 {offsets = [0, 28, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %19 = vector.extract_strided_slice %1 {offsets = [0, 30, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %20 = vector.extract_strided_slice %1 {offsets = [0, 32, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %21 = vector.extract_strided_slice %1 {offsets = [0, 34, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %22 = vector.extract_strided_slice %1 {offsets = [0, 36, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %23 = vector.extract_strided_slice %1 {offsets = [0, 38, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %24 = vector.extract_strided_slice %1 {offsets = [0, 40, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %25 = vector.extract_strided_slice %1 {offsets = [0, 42, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %26 = vector.extract_strided_slice %1 {offsets = [0, 44, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %27 = vector.extract_strided_slice %1 {offsets = [0, 46, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %28 = vector.extract_strided_slice %1 {offsets = [0, 48, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %29 = vector.extract_strided_slice %1 {offsets = [0, 50, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %30 = vector.extract_strided_slice %1 {offsets = [0, 52, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %31 = vector.extract_strided_slice %1 {offsets = [0, 54, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %32 = vector.extract_strided_slice %1 {offsets = [0, 56, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %33 = vector.extract_strided_slice %1 {offsets = [0, 58, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %34 = vector.extract_strided_slice %1 {offsets = [0, 60, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %35 = vector.extract_strided_slice %1 {offsets = [0, 62, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %36 = vector.extract_strided_slice %1 {offsets = [0, 64, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %37 = vector.extract_strided_slice %1 {offsets = [0, 66, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %38 = vector.extract_strided_slice %1 {offsets = [0, 68, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %39 = vector.extract_strided_slice %1 {offsets = [0, 70, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %40 = vector.extract_strided_slice %1 {offsets = [0, 72, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %41 = vector.extract_strided_slice %1 {offsets = [0, 74, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %42 = vector.extract_strided_slice %1 {offsets = [0, 76, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %43 = vector.extract_strided_slice %1 {offsets = [0, 78, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %44 = vector.extract_strided_slice %1 {offsets = [0, 80, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %45 = vector.extract_strided_slice %1 {offsets = [0, 82, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %46 = vector.extract_strided_slice %1 {offsets = [0, 84, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %47 = vector.extract_strided_slice %1 {offsets = [0, 86, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %48 = vector.extract_strided_slice %1 {offsets = [0, 88, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %49 = vector.extract_strided_slice %1 {offsets = [0, 90, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %50 = vector.extract_strided_slice %1 {offsets = [0, 92, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %51 = vector.extract_strided_slice %1 {offsets = [0, 94, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %52 = vector.extract_strided_slice %1 {offsets = [0, 96, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %53 = vector.extract_strided_slice %1 {offsets = [0, 98, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %54 = vector.extract_strided_slice %1 {offsets = [0, 100, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %55 = vector.extract_strided_slice %1 {offsets = [0, 102, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %56 = vector.extract_strided_slice %1 {offsets = [0, 104, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %57 = vector.extract_strided_slice %1 {offsets = [0, 106, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %58 = vector.extract_strided_slice %1 {offsets = [0, 108, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %59 = vector.extract_strided_slice %1 {offsets = [0, 110, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %60 = vector.extract_strided_slice %1 {offsets = [0, 1, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %61 = vector.extract_strided_slice %1 {offsets = [0, 3, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %62 = vector.extract_strided_slice %1 {offsets = [0, 5, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %63 = vector.extract_strided_slice %1 {offsets = [0, 7, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %64 = vector.extract_strided_slice %1 {offsets = [0, 9, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %65 = vector.extract_strided_slice %1 {offsets = [0, 11, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %66 = vector.extract_strided_slice %1 {offsets = [0, 13, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %67 = vector.extract_strided_slice %1 {offsets = [0, 15, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %68 = vector.extract_strided_slice %1 {offsets = [0, 17, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %69 = vector.extract_strided_slice %1 {offsets = [0, 19, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %70 = vector.extract_strided_slice %1 {offsets = [0, 21, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %71 = vector.extract_strided_slice %1 {offsets = [0, 23, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %72 = vector.extract_strided_slice %1 {offsets = [0, 25, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %73 = vector.extract_strided_slice %1 {offsets = [0, 27, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %74 = vector.extract_strided_slice %1 {offsets = [0, 29, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %75 = vector.extract_strided_slice %1 {offsets = [0, 31, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %76 = vector.extract_strided_slice %1 {offsets = [0, 33, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %77 = vector.extract_strided_slice %1 {offsets = [0, 35, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %78 = vector.extract_strided_slice %1 {offsets = [0, 37, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %79 = vector.extract_strided_slice %1 {offsets = [0, 39, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %80 = vector.extract_strided_slice %1 {offsets = [0, 41, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %81 = vector.extract_strided_slice %1 {offsets = [0, 43, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %82 = vector.extract_strided_slice %1 {offsets = [0, 45, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %83 = vector.extract_strided_slice %1 {offsets = [0, 47, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %84 = vector.extract_strided_slice %1 {offsets = [0, 49, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %85 = vector.extract_strided_slice %1 {offsets = [0, 51, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %86 = vector.extract_strided_slice %1 {offsets = [0, 53, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %87 = vector.extract_strided_slice %1 {offsets = [0, 55, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %88 = vector.extract_strided_slice %1 {offsets = [0, 57, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %89 = vector.extract_strided_slice %1 {offsets = [0, 59, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %90 = vector.extract_strided_slice %1 {offsets = [0, 61, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %91 = vector.extract_strided_slice %1 {offsets = [0, 63, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %92 = vector.extract_strided_slice %1 {offsets = [0, 65, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %93 = vector.extract_strided_slice %1 {offsets = [0, 67, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %94 = vector.extract_strided_slice %1 {offsets = [0, 69, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %95 = vector.extract_strided_slice %1 {offsets = [0, 71, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %96 = vector.extract_strided_slice %1 {offsets = [0, 73, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %97 = vector.extract_strided_slice %1 {offsets = [0, 75, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %98 = vector.extract_strided_slice %1 {offsets = [0, 77, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %99 = vector.extract_strided_slice %1 {offsets = [0, 79, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %100 = vector.extract_strided_slice %1 {offsets = [0, 81, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %101 = vector.extract_strided_slice %1 {offsets = [0, 83, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %102 = vector.extract_strided_slice %1 {offsets = [0, 85, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %103 = vector.extract_strided_slice %1 {offsets = [0, 87, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %104 = vector.extract_strided_slice %1 {offsets = [0, 89, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %105 = vector.extract_strided_slice %1 {offsets = [0, 91, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %106 = vector.extract_strided_slice %1 {offsets = [0, 93, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %107 = vector.extract_strided_slice %1 {offsets = [0, 95, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %108 = vector.extract_strided_slice %1 {offsets = [0, 97, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %109 = vector.extract_strided_slice %1 {offsets = [0, 99, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %110 = vector.extract_strided_slice %1 {offsets = [0, 101, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %111 = vector.extract_strided_slice %1 {offsets = [0, 103, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %112 = vector.extract_strided_slice %1 {offsets = [0, 105, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %113 = vector.extract_strided_slice %1 {offsets = [0, 107, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %114 = vector.extract_strided_slice %1 {offsets = [0, 109, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %115 = vector.extract_strided_slice %1 {offsets = [0, 111, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %116 = vector.extract_strided_slice %1 {offsets = [0, 2, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %117 = vector.extract_strided_slice %1 {offsets = [0, 4, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %118 = vector.extract_strided_slice %1 {offsets = [0, 6, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %119 = vector.extract_strided_slice %1 {offsets = [0, 8, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %120 = vector.extract_strided_slice %1 {offsets = [0, 10, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %121 = vector.extract_strided_slice %1 {offsets = [0, 12, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %122 = vector.extract_strided_slice %1 {offsets = [0, 14, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %123 = vector.extract_strided_slice %1 {offsets = [0, 16, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %124 = vector.extract_strided_slice %1 {offsets = [0, 18, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %125 = vector.extract_strided_slice %1 {offsets = [0, 20, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %126 = vector.extract_strided_slice %1 {offsets = [0, 22, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %127 = vector.extract_strided_slice %1 {offsets = [0, 24, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %128 = vector.extract_strided_slice %1 {offsets = [0, 26, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %129 = vector.extract_strided_slice %1 {offsets = [0, 28, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %130 = vector.extract_strided_slice %1 {offsets = [0, 30, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %131 = vector.extract_strided_slice %1 {offsets = [0, 32, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %132 = vector.extract_strided_slice %1 {offsets = [0, 34, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %133 = vector.extract_strided_slice %1 {offsets = [0, 36, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %134 = vector.extract_strided_slice %1 {offsets = [0, 38, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %135 = vector.extract_strided_slice %1 {offsets = [0, 40, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %136 = vector.extract_strided_slice %1 {offsets = [0, 42, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %137 = vector.extract_strided_slice %1 {offsets = [0, 44, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %138 = vector.extract_strided_slice %1 {offsets = [0, 46, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %139 = vector.extract_strided_slice %1 {offsets = [0, 48, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %140 = vector.extract_strided_slice %1 {offsets = [0, 50, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %141 = vector.extract_strided_slice %1 {offsets = [0, 52, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %142 = vector.extract_strided_slice %1 {offsets = [0, 54, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %143 = vector.extract_strided_slice %1 {offsets = [0, 56, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %144 = vector.extract_strided_slice %1 {offsets = [0, 58, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %145 = vector.extract_strided_slice %1 {offsets = [0, 60, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %146 = vector.extract_strided_slice %1 {offsets = [0, 62, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %147 = vector.extract_strided_slice %1 {offsets = [0, 64, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %148 = vector.extract_strided_slice %1 {offsets = [0, 66, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %149 = vector.extract_strided_slice %1 {offsets = [0, 68, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %150 = vector.extract_strided_slice %1 {offsets = [0, 70, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %151 = vector.extract_strided_slice %1 {offsets = [0, 72, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %152 = vector.extract_strided_slice %1 {offsets = [0, 74, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %153 = vector.extract_strided_slice %1 {offsets = [0, 76, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %154 = vector.extract_strided_slice %1 {offsets = [0, 78, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %155 = vector.extract_strided_slice %1 {offsets = [0, 80, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %156 = vector.extract_strided_slice %1 {offsets = [0, 82, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %157 = vector.extract_strided_slice %1 {offsets = [0, 84, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %158 = vector.extract_strided_slice %1 {offsets = [0, 86, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %159 = vector.extract_strided_slice %1 {offsets = [0, 88, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %160 = vector.extract_strided_slice %1 {offsets = [0, 90, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %161 = vector.extract_strided_slice %1 {offsets = [0, 92, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %162 = vector.extract_strided_slice %1 {offsets = [0, 94, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %163 = vector.extract_strided_slice %1 {offsets = [0, 96, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %164 = vector.extract_strided_slice %1 {offsets = [0, 98, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %165 = vector.extract_strided_slice %1 {offsets = [0, 100, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %166 = vector.extract_strided_slice %1 {offsets = [0, 102, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %167 = vector.extract_strided_slice %1 {offsets = [0, 104, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %168 = vector.extract_strided_slice %1 {offsets = [0, 106, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %169 = vector.extract_strided_slice %1 {offsets = [0, 108, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %170 = vector.extract_strided_slice %1 {offsets = [0, 110, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %171 = vector.extract_strided_slice %1 {offsets = [0, 112, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x113x96xi32> to vector<1x1x96xi32>
    %172 = vector.extract %2[0] : vector<3x96xi32>
    %173 = vector.extract %2[1] : vector<3x96xi32>
    %174 = vector.extract %2[2] : vector<3x96xi32>
    %175 = vector.extract_strided_slice %3 {offsets = [0, 0, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %176 = vector.extract_strided_slice %3 {offsets = [0, 1, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %177 = vector.extract_strided_slice %3 {offsets = [0, 2, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %178 = vector.extract_strided_slice %3 {offsets = [0, 3, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %179 = vector.extract_strided_slice %3 {offsets = [0, 4, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %180 = vector.extract_strided_slice %3 {offsets = [0, 5, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %181 = vector.extract_strided_slice %3 {offsets = [0, 6, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %182 = vector.extract_strided_slice %3 {offsets = [0, 7, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %183 = vector.extract_strided_slice %3 {offsets = [0, 8, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %184 = vector.extract_strided_slice %3 {offsets = [0, 9, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %185 = vector.extract_strided_slice %3 {offsets = [0, 10, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %186 = vector.extract_strided_slice %3 {offsets = [0, 11, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %187 = vector.extract_strided_slice %3 {offsets = [0, 12, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %188 = vector.extract_strided_slice %3 {offsets = [0, 13, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %189 = vector.extract_strided_slice %3 {offsets = [0, 14, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %190 = vector.extract_strided_slice %3 {offsets = [0, 15, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %191 = vector.extract_strided_slice %3 {offsets = [0, 16, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %192 = vector.extract_strided_slice %3 {offsets = [0, 17, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %193 = vector.extract_strided_slice %3 {offsets = [0, 18, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %194 = vector.extract_strided_slice %3 {offsets = [0, 19, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %195 = vector.extract_strided_slice %3 {offsets = [0, 20, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %196 = vector.extract_strided_slice %3 {offsets = [0, 21, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %197 = vector.extract_strided_slice %3 {offsets = [0, 22, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %198 = vector.extract_strided_slice %3 {offsets = [0, 23, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %199 = vector.extract_strided_slice %3 {offsets = [0, 24, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %200 = vector.extract_strided_slice %3 {offsets = [0, 25, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %201 = vector.extract_strided_slice %3 {offsets = [0, 26, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %202 = vector.extract_strided_slice %3 {offsets = [0, 27, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %203 = vector.extract_strided_slice %3 {offsets = [0, 28, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %204 = vector.extract_strided_slice %3 {offsets = [0, 29, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %205 = vector.extract_strided_slice %3 {offsets = [0, 30, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %206 = vector.extract_strided_slice %3 {offsets = [0, 31, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %207 = vector.extract_strided_slice %3 {offsets = [0, 32, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %208 = vector.extract_strided_slice %3 {offsets = [0, 33, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %209 = vector.extract_strided_slice %3 {offsets = [0, 34, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %210 = vector.extract_strided_slice %3 {offsets = [0, 35, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %211 = vector.extract_strided_slice %3 {offsets = [0, 36, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %212 = vector.extract_strided_slice %3 {offsets = [0, 37, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %213 = vector.extract_strided_slice %3 {offsets = [0, 38, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %214 = vector.extract_strided_slice %3 {offsets = [0, 39, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %215 = vector.extract_strided_slice %3 {offsets = [0, 40, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %216 = vector.extract_strided_slice %3 {offsets = [0, 41, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %217 = vector.extract_strided_slice %3 {offsets = [0, 42, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %218 = vector.extract_strided_slice %3 {offsets = [0, 43, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %219 = vector.extract_strided_slice %3 {offsets = [0, 44, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %220 = vector.extract_strided_slice %3 {offsets = [0, 45, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %221 = vector.extract_strided_slice %3 {offsets = [0, 46, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %222 = vector.extract_strided_slice %3 {offsets = [0, 47, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %223 = vector.extract_strided_slice %3 {offsets = [0, 48, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %224 = vector.extract_strided_slice %3 {offsets = [0, 49, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %225 = vector.extract_strided_slice %3 {offsets = [0, 50, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %226 = vector.extract_strided_slice %3 {offsets = [0, 51, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %227 = vector.extract_strided_slice %3 {offsets = [0, 52, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %228 = vector.extract_strided_slice %3 {offsets = [0, 53, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %229 = vector.extract_strided_slice %3 {offsets = [0, 54, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %230 = vector.extract_strided_slice %3 {offsets = [0, 55, 0], sizes = [1, 1, 96], strides = [1, 1, 1]} : vector<1x56x96xi32> to vector<1x1x96xi32>
    %231 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %232 = vector.fma %4, %231, %175 : vector<1x1x96xi32>
    %233 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %234 = vector.fma %5, %233, %176 : vector<1x1x96xi32>
    %235 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %236 = vector.fma %6, %235, %177 : vector<1x1x96xi32>
    %237 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %238 = vector.fma %7, %237, %178 : vector<1x1x96xi32>
    %239 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %240 = vector.fma %8, %239, %179 : vector<1x1x96xi32>
    %241 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %242 = vector.fma %9, %241, %180 : vector<1x1x96xi32>
    %243 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %244 = vector.fma %10, %243, %181 : vector<1x1x96xi32>
    %245 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %246 = vector.fma %11, %245, %182 : vector<1x1x96xi32>
    %247 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %248 = vector.fma %12, %247, %183 : vector<1x1x96xi32>
    %249 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %250 = vector.fma %13, %249, %184 : vector<1x1x96xi32>
    %251 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %252 = vector.fma %14, %251, %185 : vector<1x1x96xi32>
    %253 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %254 = vector.fma %15, %253, %186 : vector<1x1x96xi32>
    %255 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %256 = vector.fma %16, %255, %187 : vector<1x1x96xi32>
    %257 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %258 = vector.fma %17, %257, %188 : vector<1x1x96xi32>
    %259 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %260 = vector.fma %18, %259, %189 : vector<1x1x96xi32>
    %261 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %262 = vector.fma %19, %261, %190 : vector<1x1x96xi32>
    %263 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %264 = vector.fma %20, %263, %191 : vector<1x1x96xi32>
    %265 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %266 = vector.fma %21, %265, %192 : vector<1x1x96xi32>
    %267 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %268 = vector.fma %22, %267, %193 : vector<1x1x96xi32>
    %269 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %270 = vector.fma %23, %269, %194 : vector<1x1x96xi32>
    %271 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %272 = vector.fma %24, %271, %195 : vector<1x1x96xi32>
    %273 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %274 = vector.fma %25, %273, %196 : vector<1x1x96xi32>
    %275 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %276 = vector.fma %26, %275, %197 : vector<1x1x96xi32>
    %277 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %278 = vector.fma %27, %277, %198 : vector<1x1x96xi32>
    %279 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %280 = vector.fma %28, %279, %199 : vector<1x1x96xi32>
    %281 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %282 = vector.fma %29, %281, %200 : vector<1x1x96xi32>
    %283 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %284 = vector.fma %30, %283, %201 : vector<1x1x96xi32>
    %285 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %286 = vector.fma %31, %285, %202 : vector<1x1x96xi32>
    %287 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %288 = vector.fma %32, %287, %203 : vector<1x1x96xi32>
    %289 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %290 = vector.fma %33, %289, %204 : vector<1x1x96xi32>
    %291 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %292 = vector.fma %34, %291, %205 : vector<1x1x96xi32>
    %293 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %294 = vector.fma %35, %293, %206 : vector<1x1x96xi32>
    %295 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %296 = vector.fma %36, %295, %207 : vector<1x1x96xi32>
    %297 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %298 = vector.fma %37, %297, %208 : vector<1x1x96xi32>
    %299 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %300 = vector.fma %38, %299, %209 : vector<1x1x96xi32>
    %301 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %302 = vector.fma %39, %301, %210 : vector<1x1x96xi32>
    %303 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %304 = vector.fma %40, %303, %211 : vector<1x1x96xi32>
    %305 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %306 = vector.fma %41, %305, %212 : vector<1x1x96xi32>
    %307 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %308 = vector.fma %42, %307, %213 : vector<1x1x96xi32>
    %309 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %310 = vector.fma %43, %309, %214 : vector<1x1x96xi32>
    %311 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %312 = vector.fma %44, %311, %215 : vector<1x1x96xi32>
    %313 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %314 = vector.fma %45, %313, %216 : vector<1x1x96xi32>
    %315 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %316 = vector.fma %46, %315, %217 : vector<1x1x96xi32>
    %317 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %318 = vector.fma %47, %317, %218 : vector<1x1x96xi32>
    %319 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %320 = vector.fma %48, %319, %219 : vector<1x1x96xi32>
    %321 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %322 = vector.fma %49, %321, %220 : vector<1x1x96xi32>
    %323 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %324 = vector.fma %50, %323, %221 : vector<1x1x96xi32>
    %325 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %326 = vector.fma %51, %325, %222 : vector<1x1x96xi32>
    %327 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %328 = vector.fma %52, %327, %223 : vector<1x1x96xi32>
    %329 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %330 = vector.fma %53, %329, %224 : vector<1x1x96xi32>
    %331 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %332 = vector.fma %54, %331, %225 : vector<1x1x96xi32>
    %333 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %334 = vector.fma %55, %333, %226 : vector<1x1x96xi32>
    %335 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %336 = vector.fma %56, %335, %227 : vector<1x1x96xi32>
    %337 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %338 = vector.fma %57, %337, %228 : vector<1x1x96xi32>
    %339 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %340 = vector.fma %58, %339, %229 : vector<1x1x96xi32>
    %341 = vector.broadcast %172 : vector<96xi32> to vector<1x1x96xi32>
    %342 = vector.fma %59, %341, %230 : vector<1x1x96xi32>
    %343 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %344 = vector.fma %60, %343, %232 : vector<1x1x96xi32>
    %345 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %346 = vector.fma %61, %345, %234 : vector<1x1x96xi32>
    %347 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %348 = vector.fma %62, %347, %236 : vector<1x1x96xi32>
    %349 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %350 = vector.fma %63, %349, %238 : vector<1x1x96xi32>
    %351 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %352 = vector.fma %64, %351, %240 : vector<1x1x96xi32>
    %353 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %354 = vector.fma %65, %353, %242 : vector<1x1x96xi32>
    %355 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %356 = vector.fma %66, %355, %244 : vector<1x1x96xi32>
    %357 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %358 = vector.fma %67, %357, %246 : vector<1x1x96xi32>
    %359 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %360 = vector.fma %68, %359, %248 : vector<1x1x96xi32>
    %361 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %362 = vector.fma %69, %361, %250 : vector<1x1x96xi32>
    %363 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %364 = vector.fma %70, %363, %252 : vector<1x1x96xi32>
    %365 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %366 = vector.fma %71, %365, %254 : vector<1x1x96xi32>
    %367 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %368 = vector.fma %72, %367, %256 : vector<1x1x96xi32>
    %369 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %370 = vector.fma %73, %369, %258 : vector<1x1x96xi32>
    %371 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %372 = vector.fma %74, %371, %260 : vector<1x1x96xi32>
    %373 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %374 = vector.fma %75, %373, %262 : vector<1x1x96xi32>
    %375 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %376 = vector.fma %76, %375, %264 : vector<1x1x96xi32>
    %377 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %378 = vector.fma %77, %377, %266 : vector<1x1x96xi32>
    %379 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %380 = vector.fma %78, %379, %268 : vector<1x1x96xi32>
    %381 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %382 = vector.fma %79, %381, %270 : vector<1x1x96xi32>
    %383 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %384 = vector.fma %80, %383, %272 : vector<1x1x96xi32>
    %385 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %386 = vector.fma %81, %385, %274 : vector<1x1x96xi32>
    %387 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %388 = vector.fma %82, %387, %276 : vector<1x1x96xi32>
    %389 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %390 = vector.fma %83, %389, %278 : vector<1x1x96xi32>
    %391 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %392 = vector.fma %84, %391, %280 : vector<1x1x96xi32>
    %393 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %394 = vector.fma %85, %393, %282 : vector<1x1x96xi32>
    %395 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %396 = vector.fma %86, %395, %284 : vector<1x1x96xi32>
    %397 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %398 = vector.fma %87, %397, %286 : vector<1x1x96xi32>
    %399 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %400 = vector.fma %88, %399, %288 : vector<1x1x96xi32>
    %401 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %402 = vector.fma %89, %401, %290 : vector<1x1x96xi32>
    %403 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %404 = vector.fma %90, %403, %292 : vector<1x1x96xi32>
    %405 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %406 = vector.fma %91, %405, %294 : vector<1x1x96xi32>
    %407 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %408 = vector.fma %92, %407, %296 : vector<1x1x96xi32>
    %409 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %410 = vector.fma %93, %409, %298 : vector<1x1x96xi32>
    %411 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %412 = vector.fma %94, %411, %300 : vector<1x1x96xi32>
    %413 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %414 = vector.fma %95, %413, %302 : vector<1x1x96xi32>
    %415 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %416 = vector.fma %96, %415, %304 : vector<1x1x96xi32>
    %417 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %418 = vector.fma %97, %417, %306 : vector<1x1x96xi32>
    %419 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %420 = vector.fma %98, %419, %308 : vector<1x1x96xi32>
    %421 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %422 = vector.fma %99, %421, %310 : vector<1x1x96xi32>
    %423 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %424 = vector.fma %100, %423, %312 : vector<1x1x96xi32>
    %425 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %426 = vector.fma %101, %425, %314 : vector<1x1x96xi32>
    %427 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %428 = vector.fma %102, %427, %316 : vector<1x1x96xi32>
    %429 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %430 = vector.fma %103, %429, %318 : vector<1x1x96xi32>
    %431 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %432 = vector.fma %104, %431, %320 : vector<1x1x96xi32>
    %433 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %434 = vector.fma %105, %433, %322 : vector<1x1x96xi32>
    %435 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %436 = vector.fma %106, %435, %324 : vector<1x1x96xi32>
    %437 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %438 = vector.fma %107, %437, %326 : vector<1x1x96xi32>
    %439 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %440 = vector.fma %108, %439, %328 : vector<1x1x96xi32>
    %441 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %442 = vector.fma %109, %441, %330 : vector<1x1x96xi32>
    %443 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %444 = vector.fma %110, %443, %332 : vector<1x1x96xi32>
    %445 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %446 = vector.fma %111, %445, %334 : vector<1x1x96xi32>
    %447 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %448 = vector.fma %112, %447, %336 : vector<1x1x96xi32>
    %449 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %450 = vector.fma %113, %449, %338 : vector<1x1x96xi32>
    %451 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %452 = vector.fma %114, %451, %340 : vector<1x1x96xi32>
    %453 = vector.broadcast %173 : vector<96xi32> to vector<1x1x96xi32>
    %454 = vector.fma %115, %453, %342 : vector<1x1x96xi32>
    %455 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %456 = vector.fma %116, %455, %344 : vector<1x1x96xi32>
    %457 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %458 = vector.fma %117, %457, %346 : vector<1x1x96xi32>
    %459 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %460 = vector.fma %118, %459, %348 : vector<1x1x96xi32>
    %461 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %462 = vector.fma %119, %461, %350 : vector<1x1x96xi32>
    %463 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %464 = vector.fma %120, %463, %352 : vector<1x1x96xi32>
    %465 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %466 = vector.fma %121, %465, %354 : vector<1x1x96xi32>
    %467 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %468 = vector.fma %122, %467, %356 : vector<1x1x96xi32>
    %469 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %470 = vector.fma %123, %469, %358 : vector<1x1x96xi32>
    %471 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %472 = vector.fma %124, %471, %360 : vector<1x1x96xi32>
    %473 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %474 = vector.fma %125, %473, %362 : vector<1x1x96xi32>
    %475 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %476 = vector.fma %126, %475, %364 : vector<1x1x96xi32>
    %477 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %478 = vector.fma %127, %477, %366 : vector<1x1x96xi32>
    %479 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %480 = vector.fma %128, %479, %368 : vector<1x1x96xi32>
    %481 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %482 = vector.fma %129, %481, %370 : vector<1x1x96xi32>
    %483 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %484 = vector.fma %130, %483, %372 : vector<1x1x96xi32>
    %485 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %486 = vector.fma %131, %485, %374 : vector<1x1x96xi32>
    %487 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %488 = vector.fma %132, %487, %376 : vector<1x1x96xi32>
    %489 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %490 = vector.fma %133, %489, %378 : vector<1x1x96xi32>
    %491 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %492 = vector.fma %134, %491, %380 : vector<1x1x96xi32>
    %493 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %494 = vector.fma %135, %493, %382 : vector<1x1x96xi32>
    %495 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %496 = vector.fma %136, %495, %384 : vector<1x1x96xi32>
    %497 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %498 = vector.fma %137, %497, %386 : vector<1x1x96xi32>
    %499 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %500 = vector.fma %138, %499, %388 : vector<1x1x96xi32>
    %501 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %502 = vector.fma %139, %501, %390 : vector<1x1x96xi32>
    %503 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %504 = vector.fma %140, %503, %392 : vector<1x1x96xi32>
    %505 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %506 = vector.fma %141, %505, %394 : vector<1x1x96xi32>
    %507 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %508 = vector.fma %142, %507, %396 : vector<1x1x96xi32>
    %509 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %510 = vector.fma %143, %509, %398 : vector<1x1x96xi32>
    %511 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %512 = vector.fma %144, %511, %400 : vector<1x1x96xi32>
    %513 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %514 = vector.fma %145, %513, %402 : vector<1x1x96xi32>
    %515 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %516 = vector.fma %146, %515, %404 : vector<1x1x96xi32>
    %517 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %518 = vector.fma %147, %517, %406 : vector<1x1x96xi32>
    %519 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %520 = vector.fma %148, %519, %408 : vector<1x1x96xi32>
    %521 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %522 = vector.fma %149, %521, %410 : vector<1x1x96xi32>
    %523 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %524 = vector.fma %150, %523, %412 : vector<1x1x96xi32>
    %525 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %526 = vector.fma %151, %525, %414 : vector<1x1x96xi32>
    %527 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %528 = vector.fma %152, %527, %416 : vector<1x1x96xi32>
    %529 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %530 = vector.fma %153, %529, %418 : vector<1x1x96xi32>
    %531 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %532 = vector.fma %154, %531, %420 : vector<1x1x96xi32>
    %533 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %534 = vector.fma %155, %533, %422 : vector<1x1x96xi32>
    %535 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %536 = vector.fma %156, %535, %424 : vector<1x1x96xi32>
    %537 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %538 = vector.fma %157, %537, %426 : vector<1x1x96xi32>
    %539 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %540 = vector.fma %158, %539, %428 : vector<1x1x96xi32>
    %541 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %542 = vector.fma %159, %541, %430 : vector<1x1x96xi32>
    %543 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %544 = vector.fma %160, %543, %432 : vector<1x1x96xi32>
    %545 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %546 = vector.fma %161, %545, %434 : vector<1x1x96xi32>
    %547 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %548 = vector.fma %162, %547, %436 : vector<1x1x96xi32>
    %549 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %550 = vector.fma %163, %549, %438 : vector<1x1x96xi32>
    %551 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %552 = vector.fma %164, %551, %440 : vector<1x1x96xi32>
    %553 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %554 = vector.fma %165, %553, %442 : vector<1x1x96xi32>
    %555 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %556 = vector.fma %166, %555, %444 : vector<1x1x96xi32>
    %557 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %558 = vector.fma %167, %557, %446 : vector<1x1x96xi32>
    %559 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %560 = vector.fma %168, %559, %448 : vector<1x1x96xi32>
    %561 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %562 = vector.fma %169, %561, %450 : vector<1x1x96xi32>
    %563 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %564 = vector.fma %170, %563, %452 : vector<1x1x96xi32>
    %565 = vector.broadcast %174 : vector<96xi32> to vector<1x1x96xi32>
    %566 = vector.fma %171, %565, %454 : vector<1x1x96xi32>
    %567 = vector.insert_strided_slice %456, %3 {offsets = [0, 0, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %568 = vector.insert_strided_slice %458, %567 {offsets = [0, 1, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %569 = vector.insert_strided_slice %460, %568 {offsets = [0, 2, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %570 = vector.insert_strided_slice %462, %569 {offsets = [0, 3, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %571 = vector.insert_strided_slice %464, %570 {offsets = [0, 4, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %572 = vector.insert_strided_slice %466, %571 {offsets = [0, 5, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %573 = vector.insert_strided_slice %468, %572 {offsets = [0, 6, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %574 = vector.insert_strided_slice %470, %573 {offsets = [0, 7, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %575 = vector.insert_strided_slice %472, %574 {offsets = [0, 8, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %576 = vector.insert_strided_slice %474, %575 {offsets = [0, 9, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %577 = vector.insert_strided_slice %476, %576 {offsets = [0, 10, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %578 = vector.insert_strided_slice %478, %577 {offsets = [0, 11, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %579 = vector.insert_strided_slice %480, %578 {offsets = [0, 12, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %580 = vector.insert_strided_slice %482, %579 {offsets = [0, 13, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %581 = vector.insert_strided_slice %484, %580 {offsets = [0, 14, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %582 = vector.insert_strided_slice %486, %581 {offsets = [0, 15, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %583 = vector.insert_strided_slice %488, %582 {offsets = [0, 16, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %584 = vector.insert_strided_slice %490, %583 {offsets = [0, 17, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %585 = vector.insert_strided_slice %492, %584 {offsets = [0, 18, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %586 = vector.insert_strided_slice %494, %585 {offsets = [0, 19, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %587 = vector.insert_strided_slice %496, %586 {offsets = [0, 20, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %588 = vector.insert_strided_slice %498, %587 {offsets = [0, 21, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %589 = vector.insert_strided_slice %500, %588 {offsets = [0, 22, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %590 = vector.insert_strided_slice %502, %589 {offsets = [0, 23, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %591 = vector.insert_strided_slice %504, %590 {offsets = [0, 24, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %592 = vector.insert_strided_slice %506, %591 {offsets = [0, 25, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %593 = vector.insert_strided_slice %508, %592 {offsets = [0, 26, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %594 = vector.insert_strided_slice %510, %593 {offsets = [0, 27, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %595 = vector.insert_strided_slice %512, %594 {offsets = [0, 28, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %596 = vector.insert_strided_slice %514, %595 {offsets = [0, 29, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %597 = vector.insert_strided_slice %516, %596 {offsets = [0, 30, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %598 = vector.insert_strided_slice %518, %597 {offsets = [0, 31, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %599 = vector.insert_strided_slice %520, %598 {offsets = [0, 32, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %600 = vector.insert_strided_slice %522, %599 {offsets = [0, 33, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %601 = vector.insert_strided_slice %524, %600 {offsets = [0, 34, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %602 = vector.insert_strided_slice %526, %601 {offsets = [0, 35, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %603 = vector.insert_strided_slice %528, %602 {offsets = [0, 36, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %604 = vector.insert_strided_slice %530, %603 {offsets = [0, 37, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %605 = vector.insert_strided_slice %532, %604 {offsets = [0, 38, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %606 = vector.insert_strided_slice %534, %605 {offsets = [0, 39, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %607 = vector.insert_strided_slice %536, %606 {offsets = [0, 40, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %608 = vector.insert_strided_slice %538, %607 {offsets = [0, 41, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %609 = vector.insert_strided_slice %540, %608 {offsets = [0, 42, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %610 = vector.insert_strided_slice %542, %609 {offsets = [0, 43, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %611 = vector.insert_strided_slice %544, %610 {offsets = [0, 44, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %612 = vector.insert_strided_slice %546, %611 {offsets = [0, 45, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %613 = vector.insert_strided_slice %548, %612 {offsets = [0, 46, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %614 = vector.insert_strided_slice %550, %613 {offsets = [0, 47, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %615 = vector.insert_strided_slice %552, %614 {offsets = [0, 48, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %616 = vector.insert_strided_slice %554, %615 {offsets = [0, 49, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %617 = vector.insert_strided_slice %556, %616 {offsets = [0, 50, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %618 = vector.insert_strided_slice %558, %617 {offsets = [0, 51, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %619 = vector.insert_strided_slice %560, %618 {offsets = [0, 52, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %620 = vector.insert_strided_slice %562, %619 {offsets = [0, 53, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %621 = vector.insert_strided_slice %564, %620 {offsets = [0, 54, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %622 = vector.insert_strided_slice %566, %621 {offsets = [0, 55, 0], strides = [1, 1, 1]} : vector<1x1x96xi32> into vector<1x56x96xi32>
    %623 = vector.transfer_write %622, %0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x56x96xi32>, tensor<1x56x96xi32>
    return
  }
}

