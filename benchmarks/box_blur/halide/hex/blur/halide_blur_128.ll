; ModuleID = 'bin/host/halide_blur_128.bc'
source_filename = "/local/mnt/workspace/bots/hexbotmaster_aus-05/halide-22/src/halide/src/runtime/qurt_allocator.cpp"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon-unknown--elf"

%struct.halide_mutex = type { [1 x i32] }
%struct.halide_filter_argument_t = type { i8*, i32, i32, %struct.halide_type_t, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t* }
%struct.halide_type_t = type { i8, i8, i16 }
%struct.halide_scalar_value_t = type { %union.anon }
%union.anon = type { i64 }
%struct.halide_filter_metadata_t = type { i32, i32, %struct.halide_filter_argument_t*, i8*, i8* }
%struct.halide_thread = type opaque
%struct.halide_buffer_t = type { i64, %struct.halide_device_interface_t*, i8*, i64, i64, i64, i64, %struct.halide_type_t, i32, %struct.halide_dimension_t*, i8* }
%struct.halide_device_interface_t = type { i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, void (i8*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, i32*, i32*)*, %struct.halide_device_interface_impl_t* }
%struct.halide_device_interface_impl_t = type { void ()*, void ()*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*)* }
%struct.halide_dimension_t = type { i32, i32, i32, i32 }
%"struct.Halide::Runtime::Internal::device_copy" = type { i64, i64, i64, [16 x i64], [16 x i64], [16 x i64], i64 }
%struct.buffer_t = type { i64, i8*, [4 x i32], [4 x i32], [4 x i32], i32, i8, i8, [6 x i8] }
%"struct.Halide::Runtime::Internal::old_dev_wrapper" = type { i64, %struct.halide_device_interface_t* }
%"struct.Halide::Runtime::Internal::CpuFeatures" = type { [1 x i64], [1 x i64] }
%closure_t = type { i32, i32, i32, i32, i32, i8*, i32, i32, i32, i32, i32, i1, i1, i1, i32, i32, i16*, %struct.halide_buffer_t*, i16*, %struct.halide_buffer_t* }

@malloc_tracing = linkonce local_unnamed_addr global i32 0, align 4
@_ZN6Halide7Runtime8Internal9mem_traceE = linkonce local_unnamed_addr global i32 0, align 4
@_ZN6Halide7Runtime8Internal6my_ptrE = linkonce local_unnamed_addr global [1000 x i8*] zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal8my_sizesE = linkonce local_unnamed_addr global [1000 x i32] zeroinitializer, align 4
@.str = private dso_local unnamed_addr constant [36 x i8] c"Malloc returned null in Qurt: size(\00", align 1
@.str.1 = private dso_local unnamed_addr constant [3 x i8] c")\0A\00", align 1
@.str.2 = private dso_local unnamed_addr constant [18 x i8] c"total_allocation(\00", align 1
@.str.3 = private dso_local unnamed_addr constant [14 x i8] c"Malloc: size(\00", align 1
@.str.4 = private dso_local unnamed_addr constant [21 x i8] c"), total_allocation(\00", align 1
@.str.5 = private dso_local unnamed_addr constant [7 x i8] c") ptr=\00", align 1
@.str.6 = private dso_local unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private dso_local unnamed_addr constant [12 x i8] c"Free: size(\00", align 1
@_ZN6Halide7Runtime8Internal11buf_is_usedE = linkonce global [10 x i32] zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal7mem_bufE = linkonce local_unnamed_addr global [10 x i8*] zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal13custom_mallocE = linkonce local_unnamed_addr global i8* (i8*, i32)* @halide_default_malloc, align 4
@_ZN6Halide7Runtime8Internal11custom_freeE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_free, align 4
@.str.8 = private dso_local unnamed_addr constant [45 x i8] c"custom allocators not supported on Hexagon.\0A\00", align 1
@.str.9 = private dso_local unnamed_addr constant [17 x i8] c"Buffer(?), size(\00", align 1
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv, i8* null }]
@_ZN6Halide7Runtime8Internal14custom_do_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_default_do_task, align 4
@_ZN6Halide7Runtime8Internal17custom_do_par_forE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_default_do_par_for, align 4
@.str.10 = private dso_local unnamed_addr constant [54 x i8] c"halide_spawn_thread not implemented on this platform.\00", align 1
@.str.1.11 = private dso_local unnamed_addr constant [38 x i8] c"halide_set_num_threads: must be >= 0.\00", align 1
@_ZN6Halide7Runtime8Internal17halide_gpu_deviceE = linkonce local_unnamed_addr global i32 0, align 4
@_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE = linkonce global i32 0, align 4
@_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@.str.12 = private dso_local unnamed_addr constant [14 x i8] c"HL_GPU_DEVICE\00", align 1
@.str.13 = private dso_local unnamed_addr constant [5 x i8] c"-nan\00", align 1
@.str.1.14 = private dso_local unnamed_addr constant [4 x i8] c"nan\00", align 1
@.str.2.15 = private dso_local unnamed_addr constant [5 x i8] c"-inf\00", align 1
@.str.3.16 = private dso_local unnamed_addr constant [4 x i8] c"inf\00", align 1
@.str.4.17 = private dso_local unnamed_addr constant [14 x i8] c"-0.000000e+00\00", align 1
@.str.5.18 = private dso_local unnamed_addr constant [13 x i8] c"0.000000e+00\00", align 1
@.str.6.19 = private dso_local unnamed_addr constant [10 x i8] c"-0.000000\00", align 1
@.str.7.20 = private dso_local unnamed_addr constant [9 x i8] c"0.000000\00", align 1
@.str.8.21 = private dso_local unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.10.23 = private dso_local unnamed_addr constant [3 x i8] c"e+\00", align 1
@.str.11 = private dso_local unnamed_addr constant [3 x i8] c"e-\00", align 1
@.str.12.24 = private dso_local unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str.17 = private dso_local unnamed_addr constant [14 x i8] c"bad_type_code\00", align 1
@.str.16 = private dso_local unnamed_addr constant [7 x i8] c"handle\00", align 1
@.str.15 = private dso_local unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.14 = private dso_local unnamed_addr constant [5 x i8] c"uint\00", align 1
@.str.13.25 = private dso_local unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.18 = private dso_local unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.19 = private dso_local unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.20 = private dso_local unnamed_addr constant [8 x i8] c"buffer(\00", align 1
@.str.22 = private dso_local unnamed_addr constant [4 x i8] c", {\00", align 1
@.str.23 = private dso_local unnamed_addr constant [2 x i8] c"}\00", align 1
@_ZN6Halide7Runtime8Internal17device_copy_mutexE = linkonce global %struct.halide_mutex zeroinitializer, align 4
@.str.9.26 = private dso_local unnamed_addr constant [20 x i8] c"halide_copy_to_host\00", align 1
@.str.10.27 = private dso_local unnamed_addr constant [22 x i8] c"halide_copy_to_device\00", align 1
@.str.12.28 = private dso_local unnamed_addr constant [61 x i8] c"halide_copy_to_device does not support switching interfaces\0A\00", align 1
@.str.18.29 = private dso_local unnamed_addr constant [21 x i8] c"halide_device_malloc\00", align 1
@.str.20.30 = private dso_local unnamed_addr constant [59 x i8] c"halide_device_malloc doesn't support switching interfaces\0A\00", align 1
@.str.17.31 = private dso_local unnamed_addr constant [19 x i8] c"halide_device_sync\00", align 1
@.str.21.32 = private dso_local unnamed_addr constant [19 x i8] c"halide_device_free\00", align 1
@.str.22.33 = private dso_local unnamed_addr constant [137 x i8] c"/local/mnt/workspace/bots/hexbotmaster_aus-05/halide-22/src/halide/src/runtime/device_interface.cpp:247 Assert failed: buf->device == 0\0A\00", align 1
@.str.23.34 = private dso_local unnamed_addr constant [30 x i8] c"halide_device_and_host_malloc\00", align 1
@.str.25 = private dso_local unnamed_addr constant [68 x i8] c"halide_device_and_host_malloc doesn't support switching interfaces\0A\00", align 1
@.str.26 = private dso_local unnamed_addr constant [42 x i8] c"allocating host and device memory failed\0A\00", align 1
@.str.27 = private dso_local unnamed_addr constant [28 x i8] c"halide_device_and_host_free\00", align 1
@.str.28 = private dso_local unnamed_addr constant [137 x i8] c"/local/mnt/workspace/bots/hexbotmaster_aus-05/halide-22/src/halide/src/runtime/device_interface.cpp:317 Assert failed: buf->device == 0\0A\00", align 1
@.str.29 = private dso_local unnamed_addr constant [38 x i8] c"halide_default_device_and_host_malloc\00", align 1
@.str.30 = private dso_local unnamed_addr constant [36 x i8] c"halide_default_device_and_host_free\00", align 1
@.str.31 = private dso_local unnamed_addr constant [26 x i8] c"halide_device_wrap_native\00", align 1
@.str.32 = private dso_local unnamed_addr constant [64 x i8] c"halide_device_wrap_native doesn't support switching interfaces\0A\00", align 1
@.str.33 = private dso_local unnamed_addr constant [28 x i8] c"halide_device_detach_native\00", align 1
@.str.34 = private dso_local unnamed_addr constant [137 x i8] c"/local/mnt/workspace/bots/hexbotmaster_aus-05/halide-22/src/halide/src/runtime/device_interface.cpp:404 Assert failed: buf->device == 0\0A\00", align 1
@.str.35 = private dso_local unnamed_addr constant [34 x i8] c"halide_default_device_wrap_native\00", align 1
@.str.36 = private dso_local unnamed_addr constant [36 x i8] c"halide_default_device_detach_native\00", align 1
@.str.42 = private dso_local unnamed_addr constant [64 x i8] c"halide_buffer_copy does not support switching device interfaces\00", align 1
@.str.58 = private dso_local unnamed_addr constant [44 x i8] c"device_interface does not support cropping\0A\00", align 1
@.str.59 = private dso_local unnamed_addr constant [43 x i8] c"device_interface does not support slicing\0A\00", align 1
@.str.60 = private dso_local unnamed_addr constant [52 x i8] c"destination buffer already has a device allocation\0A\00", align 1
@.str.61 = private dso_local unnamed_addr constant [48 x i8] c"src and dst must have identical dimensionality\0A\00", align 1
@.str.64 = private dso_local unnamed_addr constant [52 x i8] c"dst must have exactly one fewer dimension than src\0A\00", align 1
@halide_error_mask = linkonce local_unnamed_addr global i64 0, align 8
@.str.37 = private dso_local unnamed_addr constant [41 x i8] c"Bounds inference call to external stage \00", align 1
@.str.78 = private dso_local unnamed_addr constant [7 x i8] c"<NULL>\00", align 1
@.str.1.38 = private dso_local unnamed_addr constant [27 x i8] c" returned non-zero value: \00", align 1
@.str.2.39 = private dso_local unnamed_addr constant [24 x i8] c"Call to external stage \00", align 1
@.str.3.40 = private dso_local unnamed_addr constant [18 x i8] c"Bounds given for \00", align 1
@.str.4.41 = private dso_local unnamed_addr constant [5 x i8] c" in \00", align 1
@.str.5.42 = private dso_local unnamed_addr constant [8 x i8] c" (from \00", align 1
@.str.6.43 = private dso_local unnamed_addr constant [5 x i8] c" to \00", align 1
@.str.7.44 = private dso_local unnamed_addr constant [38 x i8] c") do not cover required region (from \00", align 1
@.str.9.46 = private dso_local unnamed_addr constant [11 x i8] c" has type \00", align 1
@.str.10.47 = private dso_local unnamed_addr constant [38 x i8] c" but type of the buffer passed in is \00", align 1
@.str.11.48 = private dso_local unnamed_addr constant [31 x i8] c" requires a buffer of exactly \00", align 1
@.str.12.49 = private dso_local unnamed_addr constant [43 x i8] c" dimensions, but the buffer passed in has \00", align 1
@.str.13.50 = private dso_local unnamed_addr constant [12 x i8] c" dimensions\00", align 1
@.str.14.51 = private dso_local unnamed_addr constant [17 x i8] c" is accessed at \00", align 1
@.str.15.52 = private dso_local unnamed_addr constant [28 x i8] c", which is before the min (\00", align 1
@.str.16.53 = private dso_local unnamed_addr constant [16 x i8] c") in dimension \00", align 1
@.str.17.54 = private dso_local unnamed_addr constant [28 x i8] c", which is beyond the max (\00", align 1
@.str.18.55 = private dso_local unnamed_addr constant [29 x i8] c"Total allocation for buffer \00", align 1
@.str.19.56 = private dso_local unnamed_addr constant [5 x i8] c" is \00", align 1
@.str.20.57 = private dso_local unnamed_addr constant [37 x i8] c", which exceeds the maximum size of \00", align 1
@.str.21.58 = private dso_local unnamed_addr constant [24 x i8] c"The extents for buffer \00", align 1
@.str.22.59 = private dso_local unnamed_addr constant [12 x i8] c" dimension \00", align 1
@.str.23.60 = private dso_local unnamed_addr constant [15 x i8] c" is negative (\00", align 1
@.str.24.61 = private dso_local unnamed_addr constant [31 x i8] c"Product of extents for buffer \00", align 1
@.str.25.62 = private dso_local unnamed_addr constant [29 x i8] c"Applying the constraints on \00", align 1
@.str.26.63 = private dso_local unnamed_addr constant [42 x i8] c" to the required region made it smaller. \00", align 1
@.str.27.64 = private dso_local unnamed_addr constant [16 x i8] c"Required size: \00", align 1
@.str.28.65 = private dso_local unnamed_addr constant [3 x i8] c". \00", align 1
@.str.29.66 = private dso_local unnamed_addr constant [19 x i8] c"Constrained size: \00", align 1
@.str.30.67 = private dso_local unnamed_addr constant [2 x i8] c".\00", align 1
@.str.31.68 = private dso_local unnamed_addr constant [22 x i8] c"Constraint violated: \00", align 1
@.str.32.69 = private dso_local unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.33.70 = private dso_local unnamed_addr constant [6 x i8] c") == \00", align 1
@.str.34.71 = private dso_local unnamed_addr constant [11 x i8] c"Parameter \00", align 1
@.str.35.72 = private dso_local unnamed_addr constant [23 x i8] c" but must be at least \00", align 1
@.str.36.73 = private dso_local unnamed_addr constant [22 x i8] c" but must be at most \00", align 1
@.str.37.74 = private dso_local unnamed_addr constant [44 x i8] c"Out of memory (halide_malloc returned NULL)\00", align 1
@.str.38 = private dso_local unnamed_addr constant [54 x i8] c"Out of VTCM memory (halide_vtcm_malloc returned NULL)\00", align 1
@.str.39 = private dso_local unnamed_addr constant [70 x i8] c"Out of LOCKED_CACHE memory (halide_locked_cache_malloc returned NULL)\00", align 1
@.str.40 = private dso_local unnamed_addr constant [54 x i8] c"Out of GPUShared memory (halide_malloc returned NULL)\00", align 1
@.str.41 = private dso_local unnamed_addr constant [17 x i8] c"Buffer argument \00", align 1
@.str.42.75 = private dso_local unnamed_addr constant [9 x i8] c" is NULL\00", align 1
@.str.43 = private dso_local unnamed_addr constant [25 x i8] c"Failed to dump function \00", align 1
@.str.44 = private dso_local unnamed_addr constant [10 x i8] c" to file \00", align 1
@.str.45 = private dso_local unnamed_addr constant [13 x i8] c" with error \00", align 1
@.str.46 = private dso_local unnamed_addr constant [51 x i8] c"Failed to upgrade buffer_t to halide_buffer_t for \00", align 1
@.str.47 = private dso_local unnamed_addr constant [3 x i8] c": \00", align 1
@.str.48 = private dso_local unnamed_addr constant [53 x i8] c"Failed to downgrade halide_buffer_t to buffer_t for \00", align 1
@.str.49 = private dso_local unnamed_addr constant [21 x i8] c"The host pointer of \00", align 1
@.str.50 = private dso_local unnamed_addr constant [22 x i8] c" is not aligned to a \00", align 1
@.str.51 = private dso_local unnamed_addr constant [17 x i8] c" bytes boundary.\00", align 1
@.str.52 = private dso_local unnamed_addr constant [55 x i8] c" is null, but the pipeline will access it on the host.\00", align 1
@.str.53 = private dso_local unnamed_addr constant [30 x i8] c"The folded storage dimension \00", align 1
@.str.54 = private dso_local unnamed_addr constant [5 x i8] c" of \00", align 1
@.str.55 = private dso_local unnamed_addr constant [36 x i8] c" was accessed out of order by loop \00", align 1
@.str.56 = private dso_local unnamed_addr constant [23 x i8] c"Cannot fold dimension \00", align 1
@.str.57 = private dso_local unnamed_addr constant [36 x i8] c" because an extern stage accesses [\00", align 1
@.str.58.76 = private dso_local unnamed_addr constant [3 x i8] c", \00", align 1
@.str.59.77 = private dso_local unnamed_addr constant [3 x i8] c"],\00", align 1
@.str.60.78 = private dso_local unnamed_addr constant [47 x i8] c" which is outside the range currently valid: [\00", align 1
@.str.61.79 = private dso_local unnamed_addr constant [3 x i8] c"].\00", align 1
@.str.62 = private dso_local unnamed_addr constant [47 x i8] c" which wraps around the boundary of the fold, \00", align 1
@.str.63 = private dso_local unnamed_addr constant [30 x i8] c"which occurs at multiples of \00", align 1
@.str.64.80 = private dso_local unnamed_addr constant [18 x i8] c"The fold factor (\00", align 1
@.str.65 = private dso_local unnamed_addr constant [16 x i8] c") of dimension \00", align 1
@.str.66 = private dso_local unnamed_addr constant [61 x i8] c" is too small to store the required region accessed by loop \00", align 1
@.str.67 = private dso_local unnamed_addr constant [3 x i8] c").\00", align 1
@.str.68 = private dso_local unnamed_addr constant [22 x i8] c"Requirement Failed: (\00", align 1
@.str.70 = private dso_local unnamed_addr constant [59 x i8] c"A schedule specialized with specialize_fail() was chosen: \00", align 1
@.str.71 = private dso_local unnamed_addr constant [55 x i8] c"Buffer has a non-zero device but no device interface.\0A\00", align 1
@.str.72 = private dso_local unnamed_addr constant [56 x i8] c"Buffer has a non-null devie_interface but device is 0.\0A\00", align 1
@.str.73 = private dso_local unnamed_addr constant [49 x i8] c"Buffer has both host and device dirty bits set.\0A\00", align 1
@.str.74 = private dso_local unnamed_addr constant [26 x i8] c"Buffer pointer passed to \00", align 1
@.str.75 = private dso_local unnamed_addr constant [11 x i8] c" is null.\0A\00", align 1
@.str.76 = private dso_local unnamed_addr constant [37 x i8] c"Integer division or modulo by zero.\0A\00", align 1
@.str.89 = private dso_local unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1.90 = private dso_local unnamed_addr constant [44 x i8] c"elem_size of buffer was not in [1, 2, 4, 8]\00", align 1
@.str.2.91 = private dso_local unnamed_addr constant [33 x i8] c"buffer has incorrect elem_size (\00", align 1
@.str.3.92 = private dso_local unnamed_addr constant [3 x i8] c") \00", align 1
@.str.4.93 = private dso_local unnamed_addr constant [20 x i8] c"for expected type (\00", align 1
@.str.5.94 = private dso_local unnamed_addr constant [2 x i8] c")\00", align 1
@.str.6.96 = private dso_local unnamed_addr constant [65 x i8] c"Internal error: buffer host mismatch in halide_upgrade_buffer_t.\00", align 1
@.str.7.97 = private dso_local unnamed_addr constant [37 x i8] c"buffer has more than four dimensions\00", align 1
@.str.102 = private dso_local unnamed_addr constant [34 x i8] c"HVX lock size must be 64 or 128.\0A\00", align 1
@.str.8.103 = private dso_local unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@.str.5.104 = private dso_local unnamed_addr constant [22 x i8] c"qurt_hvx_lock failed\0A\00", align 1
@.str.7.105 = private dso_local unnamed_addr constant [24 x i8] c"qurt_hvx_unlock failed\0A\00", align 1
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 4
@_ZZ38halide_default_can_use_target_featuresE11initialized = internal dso_local unnamed_addr global i1 false, align 1
@_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage = internal dso_local global [2 x i64] zeroinitializer, align 8
@.str.106 = private dso_local unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@str = private dso_local constant [6 x i8] c"input\00", align 32
@str.110 = private dso_local constant [7 x i8] c"blur_y\00", align 32
@0 = private dso_local constant [2 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.110, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 1, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null }]
@str.111 = private dso_local constant [51 x i8] c"hexagon-32-noos-hvx_128-no_asserts-no_bounds_query\00", align 128
@str.112 = private dso_local constant [16 x i8] c"halide_blur_128\00", align 32
@halide_blur_128_metadata_storage = private dso_local constant %struct.halide_filter_metadata_t { i32 0, i32 2, %struct.halide_filter_argument_t* getelementptr inbounds ([2 x %struct.halide_filter_argument_t], [2 x %struct.halide_filter_argument_t]* @0, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8], [51 x i8]* @str.111, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.112, i32 0, i32 0) }
@switch.table.halide_type_to_string = private dso_local unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13.25, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16, i32 0, i32 0)], align 4

; Function Attrs: nounwind
define linkonce i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %a) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @malloc(i32 16) #11
  %cmp49 = icmp eq i32 %a, 0
  br i1 %cmp49, label %for.body15.preheader, label %while.body

for.cond.preheader:                               ; preds = %while.body
  %div1 = lshr i32 %inc, 1
  %cmp247 = icmp eq i32 %div1, 0
  br i1 %cmp247, label %for.cond12.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  %arrayidx5.gep = getelementptr i8, i8* %call, i32 %i.050
  br label %for.body

while.body:                                       ; preds = %while.body, %entry
  %a.addr.051 = phi i32 [ %div, %while.body ], [ %a, %entry ]
  %arrayidx.phi = phi i8* [ %arrayidx.inc, %while.body ], [ %call, %entry ]
  %i.050 = phi i32 [ %inc, %while.body ], [ 0, %entry ]
  %div = udiv i32 %a.addr.051, 10
  %0 = mul i32 %div, -10
  %1 = add i32 %0, %a.addr.051
  %2 = trunc i32 %1 to i8
  %conv = or i8 %2, 48
  %inc = add nuw nsw i32 %i.050, 1
  store i8 %conv, i8* %arrayidx.phi, align 1, !tbaa !7
  %3 = icmp ult i32 %a.addr.051, 10
  %arrayidx.inc = getelementptr i8, i8* %arrayidx.phi, i32 1
  br i1 %3, label %for.cond.preheader, label %while.body

for.cond12.preheader:                             ; preds = %for.body, %for.cond.preheader
  %cmp1345 = icmp ult i32 %inc, 16
  br i1 %cmp1345, label %for.body15.preheader, label %for.cond.cleanup14

for.body15.preheader:                             ; preds = %for.cond12.preheader, %entry
  %j11.046.ph = phi i32 [ 0, %entry ], [ %inc, %for.cond12.preheader ]
  %scevgep = getelementptr i8, i8* %call, i32 %j11.046.ph
  %4 = add i32 %j11.046.ph, 1
  %5 = icmp ugt i32 %4, 16
  %umax = select i1 %5, i32 %4, i32 16
  %6 = sub i32 %umax, %j11.046.ph
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep, i8 0, i32 %6, i1 false)
  br label %for.cond.cleanup14

for.body:                                         ; preds = %for.body, %for.body.preheader
  %arrayidx3.phi = phi i8* [ %arrayidx3.inc, %for.body ], [ %call, %for.body.preheader ]
  %arrayidx5.phi = phi i8* [ %arrayidx5.inc, %for.body ], [ %arrayidx5.gep, %for.body.preheader ]
  %j.048 = phi i32 [ %inc10, %for.body ], [ 0, %for.body.preheader ]
  %7 = load i8, i8* %arrayidx3.phi, align 1, !tbaa !7
  %8 = load i8, i8* %arrayidx5.phi, align 1, !tbaa !7
  store i8 %8, i8* %arrayidx3.phi, align 1, !tbaa !7
  store i8 %7, i8* %arrayidx5.phi, align 1, !tbaa !7
  %inc10 = add nuw nsw i32 %j.048, 1
  %arrayidx3.inc = getelementptr i8, i8* %arrayidx3.phi, i32 1
  %exitcond = icmp eq i32 %inc10, %div1
  %arrayidx5.inc = getelementptr i8, i8* %arrayidx5.phi, i32 -1
  br i1 %exitcond, label %for.cond12.preheader, label %for.body

for.cond.cleanup14:                               ; preds = %for.body15.preheader, %for.cond12.preheader
  ret i8* %call
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #1

; Function Attrs: nounwind
define linkonce i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 %alignment, i32 %size) local_unnamed_addr #0 {
entry:
  %add = add i32 %alignment, -1
  %sub = add i32 %add, %size
  %neg = sub i32 0, %alignment
  %and = and i32 %sub, %neg
  %add2 = add i32 %and, %alignment
  %call = tail call i8* @malloc(i32 %add2) #11
  %cmp = icmp eq i8* %call, null
  %0 = load i32, i32* @malloc_tracing, align 4
  %tobool = icmp ne i32 %0, 0
  %or.cond = and i1 %cmp, %tobool
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0)) #11
  %call4 = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %add2) #12
  tail call void @halide_print(i8* null, i8* %call4) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0)) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0)) #11
  %1 = load i32, i32* @_ZN6Halide7Runtime8Internal9mem_traceE, align 4, !tbaa !10
  %call5 = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %1) #12
  tail call void @halide_print(i8* null, i8* %call5) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0)) #11
  br label %cleanup27

if.end:                                           ; preds = %entry
  %2 = ptrtoint i8* %call to i32
  %add6 = add i32 %alignment, 3
  %sub8 = add i32 %add6, %2
  %and11 = and i32 %sub8, %neg
  %3 = inttoptr i32 %and11 to i8*
  %4 = inttoptr i32 %and11 to i8**
  %arrayidx = getelementptr inbounds i8*, i8** %4, i32 -1
  store i8* %call, i8** %arrayidx, align 4, !tbaa !12
  %tobool12 = icmp eq i32 %0, 0
  br i1 %tobool12, label %cleanup27, label %for.body

for.body:                                         ; preds = %for.inc.24, %if.end
  %i.051 = phi i32 [ %inc.24, %for.inc.24 ], [ 0, %if.end ]
  %arrayidx15 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %i.051
  %5 = load i8*, i8** %arrayidx15, align 4, !tbaa !12
  %tobool16 = icmp eq i8* %5, null
  br i1 %tobool16, label %if.then17, label %for.inc

if.then17:                                        ; preds = %for.inc.23, %for.inc.22, %for.inc.21, %for.inc.20, %for.inc.19, %for.inc.18, %for.inc.17, %for.inc.16, %for.inc.15, %for.inc.14, %for.inc.13, %for.inc.12, %for.inc.11, %for.inc.10, %for.inc.9, %for.inc.8, %for.inc.7, %for.inc.6, %for.inc.5, %for.inc.4, %for.inc.3, %for.inc.2, %for.inc.1, %for.inc, %for.body
  %i.051.lcssa = phi i32 [ %i.051, %for.body ], [ %inc, %for.inc ], [ %inc.1, %for.inc.1 ], [ %inc.2, %for.inc.2 ], [ %inc.3, %for.inc.3 ], [ %inc.4, %for.inc.4 ], [ %inc.5, %for.inc.5 ], [ %inc.6, %for.inc.6 ], [ %inc.7, %for.inc.7 ], [ %inc.8, %for.inc.8 ], [ %inc.9, %for.inc.9 ], [ %inc.10, %for.inc.10 ], [ %inc.11, %for.inc.11 ], [ %inc.12, %for.inc.12 ], [ %inc.13, %for.inc.13 ], [ %inc.14, %for.inc.14 ], [ %inc.15, %for.inc.15 ], [ %inc.16, %for.inc.16 ], [ %inc.17, %for.inc.17 ], [ %inc.18, %for.inc.18 ], [ %inc.19, %for.inc.19 ], [ %inc.20, %for.inc.20 ], [ %inc.21, %for.inc.21 ], [ %inc.22, %for.inc.22 ], [ %inc.23, %for.inc.23 ]
  %arrayidx15.lcssa = phi i8** [ %arrayidx15, %for.body ], [ %arrayidx15.1, %for.inc ], [ %arrayidx15.2, %for.inc.1 ], [ %arrayidx15.3, %for.inc.2 ], [ %arrayidx15.4, %for.inc.3 ], [ %arrayidx15.5, %for.inc.4 ], [ %arrayidx15.6, %for.inc.5 ], [ %arrayidx15.7, %for.inc.6 ], [ %arrayidx15.8, %for.inc.7 ], [ %arrayidx15.9, %for.inc.8 ], [ %arrayidx15.10, %for.inc.9 ], [ %arrayidx15.11, %for.inc.10 ], [ %arrayidx15.12, %for.inc.11 ], [ %arrayidx15.13, %for.inc.12 ], [ %arrayidx15.14, %for.inc.13 ], [ %arrayidx15.15, %for.inc.14 ], [ %arrayidx15.16, %for.inc.15 ], [ %arrayidx15.17, %for.inc.16 ], [ %arrayidx15.18, %for.inc.17 ], [ %arrayidx15.19, %for.inc.18 ], [ %arrayidx15.20, %for.inc.19 ], [ %arrayidx15.21, %for.inc.20 ], [ %arrayidx15.22, %for.inc.21 ], [ %arrayidx15.23, %for.inc.22 ], [ %arrayidx15.24, %for.inc.23 ]
  store i8* %3, i8** %arrayidx15.lcssa, align 4, !tbaa !12
  %arrayidx19 = getelementptr inbounds [1000 x i32], [1000 x i32]* @_ZN6Halide7Runtime8Internal8my_sizesE, i32 0, i32 %i.051.lcssa
  store i32 %and, i32* %arrayidx19, align 4, !tbaa !10
  br label %cleanup

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.051, 1
  %arrayidx15.1 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc
  %6 = load i8*, i8** %arrayidx15.1, align 4, !tbaa !12
  %tobool16.1 = icmp eq i8* %6, null
  br i1 %tobool16.1, label %if.then17, label %for.inc.1

cleanup:                                          ; preds = %for.inc.24, %if.then17
  %7 = load i32, i32* @_ZN6Halide7Runtime8Internal9mem_traceE, align 4, !tbaa !10
  %add21 = add i32 %7, %and
  store i32 %add21, i32* @_ZN6Halide7Runtime8Internal9mem_traceE, align 4, !tbaa !10
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0)) #11
  %call22 = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %and) #12
  tail call void @halide_print(i8* null, i8* %call22) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)) #11
  %8 = load i32, i32* @_ZN6Halide7Runtime8Internal9mem_traceE, align 4, !tbaa !10
  %call23 = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %8) #12
  tail call void @halide_print(i8* null, i8* %call23) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0)) #11
  %call24 = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %and11) #12
  tail call void @halide_print(i8* null, i8* %call24) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)) #11
  br label %cleanup27

cleanup27:                                        ; preds = %cleanup, %if.end, %if.then
  %retval.0 = phi i8* [ null, %if.then ], [ %3, %cleanup ], [ %3, %if.end ]
  ret i8* %retval.0

for.inc.1:                                        ; preds = %for.inc
  %inc.1 = add nuw nsw i32 %i.051, 2
  %arrayidx15.2 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.1
  %9 = load i8*, i8** %arrayidx15.2, align 4, !tbaa !12
  %tobool16.2 = icmp eq i8* %9, null
  br i1 %tobool16.2, label %if.then17, label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1
  %inc.2 = add nuw nsw i32 %i.051, 3
  %arrayidx15.3 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.2
  %10 = load i8*, i8** %arrayidx15.3, align 4, !tbaa !12
  %tobool16.3 = icmp eq i8* %10, null
  br i1 %tobool16.3, label %if.then17, label %for.inc.3

for.inc.3:                                        ; preds = %for.inc.2
  %inc.3 = add nuw nsw i32 %i.051, 4
  %arrayidx15.4 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.3
  %11 = load i8*, i8** %arrayidx15.4, align 4, !tbaa !12
  %tobool16.4 = icmp eq i8* %11, null
  br i1 %tobool16.4, label %if.then17, label %for.inc.4

for.inc.4:                                        ; preds = %for.inc.3
  %inc.4 = add nuw nsw i32 %i.051, 5
  %arrayidx15.5 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.4
  %12 = load i8*, i8** %arrayidx15.5, align 4, !tbaa !12
  %tobool16.5 = icmp eq i8* %12, null
  br i1 %tobool16.5, label %if.then17, label %for.inc.5

for.inc.5:                                        ; preds = %for.inc.4
  %inc.5 = add nuw nsw i32 %i.051, 6
  %arrayidx15.6 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.5
  %13 = load i8*, i8** %arrayidx15.6, align 4, !tbaa !12
  %tobool16.6 = icmp eq i8* %13, null
  br i1 %tobool16.6, label %if.then17, label %for.inc.6

for.inc.6:                                        ; preds = %for.inc.5
  %inc.6 = add nuw nsw i32 %i.051, 7
  %arrayidx15.7 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.6
  %14 = load i8*, i8** %arrayidx15.7, align 4, !tbaa !12
  %tobool16.7 = icmp eq i8* %14, null
  br i1 %tobool16.7, label %if.then17, label %for.inc.7

for.inc.7:                                        ; preds = %for.inc.6
  %inc.7 = add nuw nsw i32 %i.051, 8
  %arrayidx15.8 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.7
  %15 = load i8*, i8** %arrayidx15.8, align 4, !tbaa !12
  %tobool16.8 = icmp eq i8* %15, null
  br i1 %tobool16.8, label %if.then17, label %for.inc.8

for.inc.8:                                        ; preds = %for.inc.7
  %inc.8 = add nuw nsw i32 %i.051, 9
  %arrayidx15.9 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.8
  %16 = load i8*, i8** %arrayidx15.9, align 4, !tbaa !12
  %tobool16.9 = icmp eq i8* %16, null
  br i1 %tobool16.9, label %if.then17, label %for.inc.9

for.inc.9:                                        ; preds = %for.inc.8
  %inc.9 = add nuw nsw i32 %i.051, 10
  %arrayidx15.10 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.9
  %17 = load i8*, i8** %arrayidx15.10, align 4, !tbaa !12
  %tobool16.10 = icmp eq i8* %17, null
  br i1 %tobool16.10, label %if.then17, label %for.inc.10

for.inc.10:                                       ; preds = %for.inc.9
  %inc.10 = add nuw nsw i32 %i.051, 11
  %arrayidx15.11 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.10
  %18 = load i8*, i8** %arrayidx15.11, align 4, !tbaa !12
  %tobool16.11 = icmp eq i8* %18, null
  br i1 %tobool16.11, label %if.then17, label %for.inc.11

for.inc.11:                                       ; preds = %for.inc.10
  %inc.11 = add nuw nsw i32 %i.051, 12
  %arrayidx15.12 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.11
  %19 = load i8*, i8** %arrayidx15.12, align 4, !tbaa !12
  %tobool16.12 = icmp eq i8* %19, null
  br i1 %tobool16.12, label %if.then17, label %for.inc.12

for.inc.12:                                       ; preds = %for.inc.11
  %inc.12 = add nuw nsw i32 %i.051, 13
  %arrayidx15.13 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.12
  %20 = load i8*, i8** %arrayidx15.13, align 4, !tbaa !12
  %tobool16.13 = icmp eq i8* %20, null
  br i1 %tobool16.13, label %if.then17, label %for.inc.13

for.inc.13:                                       ; preds = %for.inc.12
  %inc.13 = add nuw nsw i32 %i.051, 14
  %arrayidx15.14 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.13
  %21 = load i8*, i8** %arrayidx15.14, align 4, !tbaa !12
  %tobool16.14 = icmp eq i8* %21, null
  br i1 %tobool16.14, label %if.then17, label %for.inc.14

for.inc.14:                                       ; preds = %for.inc.13
  %inc.14 = add nuw nsw i32 %i.051, 15
  %arrayidx15.15 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.14
  %22 = load i8*, i8** %arrayidx15.15, align 4, !tbaa !12
  %tobool16.15 = icmp eq i8* %22, null
  br i1 %tobool16.15, label %if.then17, label %for.inc.15

for.inc.15:                                       ; preds = %for.inc.14
  %inc.15 = add nuw nsw i32 %i.051, 16
  %arrayidx15.16 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.15
  %23 = load i8*, i8** %arrayidx15.16, align 4, !tbaa !12
  %tobool16.16 = icmp eq i8* %23, null
  br i1 %tobool16.16, label %if.then17, label %for.inc.16

for.inc.16:                                       ; preds = %for.inc.15
  %inc.16 = add nuw nsw i32 %i.051, 17
  %arrayidx15.17 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.16
  %24 = load i8*, i8** %arrayidx15.17, align 4, !tbaa !12
  %tobool16.17 = icmp eq i8* %24, null
  br i1 %tobool16.17, label %if.then17, label %for.inc.17

for.inc.17:                                       ; preds = %for.inc.16
  %inc.17 = add nuw nsw i32 %i.051, 18
  %arrayidx15.18 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.17
  %25 = load i8*, i8** %arrayidx15.18, align 4, !tbaa !12
  %tobool16.18 = icmp eq i8* %25, null
  br i1 %tobool16.18, label %if.then17, label %for.inc.18

for.inc.18:                                       ; preds = %for.inc.17
  %inc.18 = add nuw nsw i32 %i.051, 19
  %arrayidx15.19 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.18
  %26 = load i8*, i8** %arrayidx15.19, align 4, !tbaa !12
  %tobool16.19 = icmp eq i8* %26, null
  br i1 %tobool16.19, label %if.then17, label %for.inc.19

for.inc.19:                                       ; preds = %for.inc.18
  %inc.19 = add nuw nsw i32 %i.051, 20
  %arrayidx15.20 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.19
  %27 = load i8*, i8** %arrayidx15.20, align 4, !tbaa !12
  %tobool16.20 = icmp eq i8* %27, null
  br i1 %tobool16.20, label %if.then17, label %for.inc.20

for.inc.20:                                       ; preds = %for.inc.19
  %inc.20 = add nuw nsw i32 %i.051, 21
  %arrayidx15.21 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.20
  %28 = load i8*, i8** %arrayidx15.21, align 4, !tbaa !12
  %tobool16.21 = icmp eq i8* %28, null
  br i1 %tobool16.21, label %if.then17, label %for.inc.21

for.inc.21:                                       ; preds = %for.inc.20
  %inc.21 = add nuw nsw i32 %i.051, 22
  %arrayidx15.22 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.21
  %29 = load i8*, i8** %arrayidx15.22, align 4, !tbaa !12
  %tobool16.22 = icmp eq i8* %29, null
  br i1 %tobool16.22, label %if.then17, label %for.inc.22

for.inc.22:                                       ; preds = %for.inc.21
  %inc.22 = add nuw nsw i32 %i.051, 23
  %arrayidx15.23 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.22
  %30 = load i8*, i8** %arrayidx15.23, align 4, !tbaa !12
  %tobool16.23 = icmp eq i8* %30, null
  br i1 %tobool16.23, label %if.then17, label %for.inc.23

for.inc.23:                                       ; preds = %for.inc.22
  %inc.23 = add nuw nsw i32 %i.051, 24
  %arrayidx15.24 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.23
  %31 = load i8*, i8** %arrayidx15.24, align 4, !tbaa !12
  %tobool16.24 = icmp eq i8* %31, null
  br i1 %tobool16.24, label %if.then17, label %for.inc.24

for.inc.24:                                       ; preds = %for.inc.23
  %inc.24 = add nuw nsw i32 %i.051, 25
  %cmp14.24 = icmp ult i32 %inc.24, 1000
  br i1 %cmp14.24, label %for.body, label %cleanup, !llvm.loop !14
}

declare extern_weak void @halide_print(i8*, i8*) local_unnamed_addr #2

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %ptr) local_unnamed_addr #0 {
entry:
  %tobool = icmp eq i8* %ptr, null
  br i1 %tobool, label %if.end12, label %if.then

if.then:                                          ; preds = %entry
  %0 = load i32, i32* @malloc_tracing, align 4, !tbaa !10
  %tobool1 = icmp eq i32 %0, 0
  br i1 %tobool1, label %if.end10, label %for.body

for.body:                                         ; preds = %for.inc.24, %if.then
  %i.024 = phi i32 [ %inc.24, %for.inc.24 ], [ 0, %if.then ]
  %arrayidx = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %i.024
  %1 = load i8*, i8** %arrayidx, align 4, !tbaa !12
  %cmp3 = icmp eq i8* %1, %ptr
  br i1 %cmp3, label %if.then4, label %for.inc

if.then4:                                         ; preds = %for.inc.23, %for.inc.22, %for.inc.21, %for.inc.20, %for.inc.19, %for.inc.18, %for.inc.17, %for.inc.16, %for.inc.15, %for.inc.14, %for.inc.13, %for.inc.12, %for.inc.11, %for.inc.10, %for.inc.9, %for.inc.8, %for.inc.7, %for.inc.6, %for.inc.5, %for.inc.4, %for.inc.3, %for.inc.2, %for.inc.1, %for.inc, %for.body
  %i.024.lcssa = phi i32 [ %i.024, %for.body ], [ %inc, %for.inc ], [ %inc.1, %for.inc.1 ], [ %inc.2, %for.inc.2 ], [ %inc.3, %for.inc.3 ], [ %inc.4, %for.inc.4 ], [ %inc.5, %for.inc.5 ], [ %inc.6, %for.inc.6 ], [ %inc.7, %for.inc.7 ], [ %inc.8, %for.inc.8 ], [ %inc.9, %for.inc.9 ], [ %inc.10, %for.inc.10 ], [ %inc.11, %for.inc.11 ], [ %inc.12, %for.inc.12 ], [ %inc.13, %for.inc.13 ], [ %inc.14, %for.inc.14 ], [ %inc.15, %for.inc.15 ], [ %inc.16, %for.inc.16 ], [ %inc.17, %for.inc.17 ], [ %inc.18, %for.inc.18 ], [ %inc.19, %for.inc.19 ], [ %inc.20, %for.inc.20 ], [ %inc.21, %for.inc.21 ], [ %inc.22, %for.inc.22 ], [ %inc.23, %for.inc.23 ]
  %arrayidx.lcssa = phi i8** [ %arrayidx, %for.body ], [ %arrayidx.1, %for.inc ], [ %arrayidx.2, %for.inc.1 ], [ %arrayidx.3, %for.inc.2 ], [ %arrayidx.4, %for.inc.3 ], [ %arrayidx.5, %for.inc.4 ], [ %arrayidx.6, %for.inc.5 ], [ %arrayidx.7, %for.inc.6 ], [ %arrayidx.8, %for.inc.7 ], [ %arrayidx.9, %for.inc.8 ], [ %arrayidx.10, %for.inc.9 ], [ %arrayidx.11, %for.inc.10 ], [ %arrayidx.12, %for.inc.11 ], [ %arrayidx.13, %for.inc.12 ], [ %arrayidx.14, %for.inc.13 ], [ %arrayidx.15, %for.inc.14 ], [ %arrayidx.16, %for.inc.15 ], [ %arrayidx.17, %for.inc.16 ], [ %arrayidx.18, %for.inc.17 ], [ %arrayidx.19, %for.inc.18 ], [ %arrayidx.20, %for.inc.19 ], [ %arrayidx.21, %for.inc.20 ], [ %arrayidx.22, %for.inc.21 ], [ %arrayidx.23, %for.inc.22 ], [ %arrayidx.24, %for.inc.23 ]
  %arrayidx5 = getelementptr inbounds [1000 x i32], [1000 x i32]* @_ZN6Halide7Runtime8Internal8my_sizesE, i32 0, i32 %i.024.lcssa
  %2 = load i32, i32* %arrayidx5, align 4, !tbaa !10
  store i8* null, i8** %arrayidx.lcssa, align 4, !tbaa !12
  store i32 0, i32* %arrayidx5, align 4, !tbaa !10
  br label %cleanup

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.024, 1
  %arrayidx.1 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc
  %3 = load i8*, i8** %arrayidx.1, align 4, !tbaa !12
  %cmp3.1 = icmp eq i8* %3, %ptr
  br i1 %cmp3.1, label %if.then4, label %for.inc.1

cleanup:                                          ; preds = %for.inc.24, %if.then4
  %allocation_size.0 = phi i32 [ %2, %if.then4 ], [ 0, %for.inc.24 ]
  %4 = load i32, i32* @_ZN6Halide7Runtime8Internal9mem_traceE, align 4, !tbaa !10
  %sub = sub i32 %4, %allocation_size.0
  store i32 %sub, i32* @_ZN6Halide7Runtime8Internal9mem_traceE, align 4, !tbaa !10
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0)) #11
  %call = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %allocation_size.0) #12
  tail call void @halide_print(i8* null, i8* %call) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)) #11
  %5 = load i32, i32* @_ZN6Halide7Runtime8Internal9mem_traceE, align 4, !tbaa !10
  %call8 = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %5) #12
  tail call void @halide_print(i8* null, i8* %call8) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0)) #11
  %6 = ptrtoint i8* %ptr to i32
  %call9 = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %6) #12
  tail call void @halide_print(i8* null, i8* %call9) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)) #11
  br label %if.end10

if.end10:                                         ; preds = %cleanup, %if.then
  %arrayidx11 = getelementptr inbounds i8, i8* %ptr, i32 -4
  %7 = bitcast i8* %arrayidx11 to i8**
  %8 = load i8*, i8** %7, align 4, !tbaa !12
  tail call void @free(i8* %8) #11
  br label %if.end12

if.end12:                                         ; preds = %if.end10, %entry
  ret void

for.inc.1:                                        ; preds = %for.inc
  %inc.1 = add nuw nsw i32 %i.024, 2
  %arrayidx.2 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.1
  %9 = load i8*, i8** %arrayidx.2, align 4, !tbaa !12
  %cmp3.2 = icmp eq i8* %9, %ptr
  br i1 %cmp3.2, label %if.then4, label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1
  %inc.2 = add nuw nsw i32 %i.024, 3
  %arrayidx.3 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.2
  %10 = load i8*, i8** %arrayidx.3, align 4, !tbaa !12
  %cmp3.3 = icmp eq i8* %10, %ptr
  br i1 %cmp3.3, label %if.then4, label %for.inc.3

for.inc.3:                                        ; preds = %for.inc.2
  %inc.3 = add nuw nsw i32 %i.024, 4
  %arrayidx.4 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.3
  %11 = load i8*, i8** %arrayidx.4, align 4, !tbaa !12
  %cmp3.4 = icmp eq i8* %11, %ptr
  br i1 %cmp3.4, label %if.then4, label %for.inc.4

for.inc.4:                                        ; preds = %for.inc.3
  %inc.4 = add nuw nsw i32 %i.024, 5
  %arrayidx.5 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.4
  %12 = load i8*, i8** %arrayidx.5, align 4, !tbaa !12
  %cmp3.5 = icmp eq i8* %12, %ptr
  br i1 %cmp3.5, label %if.then4, label %for.inc.5

for.inc.5:                                        ; preds = %for.inc.4
  %inc.5 = add nuw nsw i32 %i.024, 6
  %arrayidx.6 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.5
  %13 = load i8*, i8** %arrayidx.6, align 4, !tbaa !12
  %cmp3.6 = icmp eq i8* %13, %ptr
  br i1 %cmp3.6, label %if.then4, label %for.inc.6

for.inc.6:                                        ; preds = %for.inc.5
  %inc.6 = add nuw nsw i32 %i.024, 7
  %arrayidx.7 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.6
  %14 = load i8*, i8** %arrayidx.7, align 4, !tbaa !12
  %cmp3.7 = icmp eq i8* %14, %ptr
  br i1 %cmp3.7, label %if.then4, label %for.inc.7

for.inc.7:                                        ; preds = %for.inc.6
  %inc.7 = add nuw nsw i32 %i.024, 8
  %arrayidx.8 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.7
  %15 = load i8*, i8** %arrayidx.8, align 4, !tbaa !12
  %cmp3.8 = icmp eq i8* %15, %ptr
  br i1 %cmp3.8, label %if.then4, label %for.inc.8

for.inc.8:                                        ; preds = %for.inc.7
  %inc.8 = add nuw nsw i32 %i.024, 9
  %arrayidx.9 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.8
  %16 = load i8*, i8** %arrayidx.9, align 4, !tbaa !12
  %cmp3.9 = icmp eq i8* %16, %ptr
  br i1 %cmp3.9, label %if.then4, label %for.inc.9

for.inc.9:                                        ; preds = %for.inc.8
  %inc.9 = add nuw nsw i32 %i.024, 10
  %arrayidx.10 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.9
  %17 = load i8*, i8** %arrayidx.10, align 4, !tbaa !12
  %cmp3.10 = icmp eq i8* %17, %ptr
  br i1 %cmp3.10, label %if.then4, label %for.inc.10

for.inc.10:                                       ; preds = %for.inc.9
  %inc.10 = add nuw nsw i32 %i.024, 11
  %arrayidx.11 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.10
  %18 = load i8*, i8** %arrayidx.11, align 4, !tbaa !12
  %cmp3.11 = icmp eq i8* %18, %ptr
  br i1 %cmp3.11, label %if.then4, label %for.inc.11

for.inc.11:                                       ; preds = %for.inc.10
  %inc.11 = add nuw nsw i32 %i.024, 12
  %arrayidx.12 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.11
  %19 = load i8*, i8** %arrayidx.12, align 4, !tbaa !12
  %cmp3.12 = icmp eq i8* %19, %ptr
  br i1 %cmp3.12, label %if.then4, label %for.inc.12

for.inc.12:                                       ; preds = %for.inc.11
  %inc.12 = add nuw nsw i32 %i.024, 13
  %arrayidx.13 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.12
  %20 = load i8*, i8** %arrayidx.13, align 4, !tbaa !12
  %cmp3.13 = icmp eq i8* %20, %ptr
  br i1 %cmp3.13, label %if.then4, label %for.inc.13

for.inc.13:                                       ; preds = %for.inc.12
  %inc.13 = add nuw nsw i32 %i.024, 14
  %arrayidx.14 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.13
  %21 = load i8*, i8** %arrayidx.14, align 4, !tbaa !12
  %cmp3.14 = icmp eq i8* %21, %ptr
  br i1 %cmp3.14, label %if.then4, label %for.inc.14

for.inc.14:                                       ; preds = %for.inc.13
  %inc.14 = add nuw nsw i32 %i.024, 15
  %arrayidx.15 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.14
  %22 = load i8*, i8** %arrayidx.15, align 4, !tbaa !12
  %cmp3.15 = icmp eq i8* %22, %ptr
  br i1 %cmp3.15, label %if.then4, label %for.inc.15

for.inc.15:                                       ; preds = %for.inc.14
  %inc.15 = add nuw nsw i32 %i.024, 16
  %arrayidx.16 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.15
  %23 = load i8*, i8** %arrayidx.16, align 4, !tbaa !12
  %cmp3.16 = icmp eq i8* %23, %ptr
  br i1 %cmp3.16, label %if.then4, label %for.inc.16

for.inc.16:                                       ; preds = %for.inc.15
  %inc.16 = add nuw nsw i32 %i.024, 17
  %arrayidx.17 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.16
  %24 = load i8*, i8** %arrayidx.17, align 4, !tbaa !12
  %cmp3.17 = icmp eq i8* %24, %ptr
  br i1 %cmp3.17, label %if.then4, label %for.inc.17

for.inc.17:                                       ; preds = %for.inc.16
  %inc.17 = add nuw nsw i32 %i.024, 18
  %arrayidx.18 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.17
  %25 = load i8*, i8** %arrayidx.18, align 4, !tbaa !12
  %cmp3.18 = icmp eq i8* %25, %ptr
  br i1 %cmp3.18, label %if.then4, label %for.inc.18

for.inc.18:                                       ; preds = %for.inc.17
  %inc.18 = add nuw nsw i32 %i.024, 19
  %arrayidx.19 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.18
  %26 = load i8*, i8** %arrayidx.19, align 4, !tbaa !12
  %cmp3.19 = icmp eq i8* %26, %ptr
  br i1 %cmp3.19, label %if.then4, label %for.inc.19

for.inc.19:                                       ; preds = %for.inc.18
  %inc.19 = add nuw nsw i32 %i.024, 20
  %arrayidx.20 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.19
  %27 = load i8*, i8** %arrayidx.20, align 4, !tbaa !12
  %cmp3.20 = icmp eq i8* %27, %ptr
  br i1 %cmp3.20, label %if.then4, label %for.inc.20

for.inc.20:                                       ; preds = %for.inc.19
  %inc.20 = add nuw nsw i32 %i.024, 21
  %arrayidx.21 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.20
  %28 = load i8*, i8** %arrayidx.21, align 4, !tbaa !12
  %cmp3.21 = icmp eq i8* %28, %ptr
  br i1 %cmp3.21, label %if.then4, label %for.inc.21

for.inc.21:                                       ; preds = %for.inc.20
  %inc.21 = add nuw nsw i32 %i.024, 22
  %arrayidx.22 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.21
  %29 = load i8*, i8** %arrayidx.22, align 4, !tbaa !12
  %cmp3.22 = icmp eq i8* %29, %ptr
  br i1 %cmp3.22, label %if.then4, label %for.inc.22

for.inc.22:                                       ; preds = %for.inc.21
  %inc.22 = add nuw nsw i32 %i.024, 23
  %arrayidx.23 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.22
  %30 = load i8*, i8** %arrayidx.23, align 4, !tbaa !12
  %cmp3.23 = icmp eq i8* %30, %ptr
  br i1 %cmp3.23, label %if.then4, label %for.inc.23

for.inc.23:                                       ; preds = %for.inc.22
  %inc.23 = add nuw nsw i32 %i.024, 24
  %arrayidx.24 = getelementptr inbounds [1000 x i8*], [1000 x i8*]* @_ZN6Halide7Runtime8Internal6my_ptrE, i32 0, i32 %inc.23
  %31 = load i8*, i8** %arrayidx.24, align 4, !tbaa !12
  %cmp3.24 = icmp eq i8* %31, %ptr
  br i1 %cmp3.24, label %if.then4, label %for.inc.24

for.inc.24:                                       ; preds = %for.inc.23
  %inc.24 = add nuw nsw i32 %i.024, 25
  %cmp.24 = icmp ult i32 %inc.24, 1000
  br i1 %cmp.24, label %for.body, label %cleanup, !llvm.loop !16
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv() #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 0), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %0) #12
  %1 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 1), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %1) #12
  %2 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 2), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %2) #12
  %3 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 3), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %3) #12
  %4 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 4), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %4) #12
  %5 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 5), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %5) #12
  %6 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 6), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %6) #12
  %7 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 7), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %7) #12
  %8 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 8), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %8) #12
  %9 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 9), align 4, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %9) #12
  ret void
}

; Function Attrs: nounwind
define weak i8* @halide_default_malloc(i8* %user_context, i32 %x) #0 {
entry:
  %cmp = icmp ult i32 %x, 65537
  br i1 %cmp, label %for.body.preheader, label %if.end9

for.body.preheader:                               ; preds = %entry
  %0 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 0), i32 0, i32 1 seq_cst seq_cst
  %cmp2 = extractvalue { i32, i1 } %0, 1
  br i1 %cmp2, label %if.then3, label %for.inc

if.then3:                                         ; preds = %for.inc.8, %for.inc.7, %for.inc.6, %for.inc.5, %for.inc.4, %for.inc.3, %for.inc.2, %for.inc.1, %for.inc, %for.body.preheader
  %i.021.lcssa = phi i32 [ 0, %for.body.preheader ], [ 1, %for.inc ], [ 2, %for.inc.1 ], [ 3, %for.inc.2 ], [ 4, %for.inc.3 ], [ 5, %for.inc.4 ], [ 6, %for.inc.5 ], [ 7, %for.inc.6 ], [ 8, %for.inc.7 ], [ 9, %for.inc.8 ]
  %arrayidx = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 %i.021.lcssa
  %1 = load i8*, i8** %arrayidx, align 4, !tbaa !12
  %cmp4 = icmp eq i8* %1, null
  br i1 %cmp4, label %if.then5, label %cleanup11

if.then5:                                         ; preds = %if.then3
  %call = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 65536) #12
  store i8* %call, i8** %arrayidx, align 4, !tbaa !12
  br label %cleanup11

for.inc:                                          ; preds = %for.body.preheader
  %2 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 1), i32 0, i32 1 seq_cst seq_cst
  %cmp2.1 = extractvalue { i32, i1 } %2, 1
  br i1 %cmp2.1, label %if.then3, label %for.inc.1

if.end9:                                          ; preds = %for.inc.8, %entry
  %call10 = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 %x) #12
  br label %cleanup11

cleanup11:                                        ; preds = %if.end9, %if.then5, %if.then3
  %retval.1 = phi i8* [ %call10, %if.end9 ], [ %1, %if.then3 ], [ %call, %if.then5 ]
  ret i8* %retval.1

for.inc.1:                                        ; preds = %for.inc
  %3 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 2), i32 0, i32 1 seq_cst seq_cst
  %cmp2.2 = extractvalue { i32, i1 } %3, 1
  br i1 %cmp2.2, label %if.then3, label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1
  %4 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 3), i32 0, i32 1 seq_cst seq_cst
  %cmp2.3 = extractvalue { i32, i1 } %4, 1
  br i1 %cmp2.3, label %if.then3, label %for.inc.3

for.inc.3:                                        ; preds = %for.inc.2
  %5 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 4), i32 0, i32 1 seq_cst seq_cst
  %cmp2.4 = extractvalue { i32, i1 } %5, 1
  br i1 %cmp2.4, label %if.then3, label %for.inc.4

for.inc.4:                                        ; preds = %for.inc.3
  %6 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 5), i32 0, i32 1 seq_cst seq_cst
  %cmp2.5 = extractvalue { i32, i1 } %6, 1
  br i1 %cmp2.5, label %if.then3, label %for.inc.5

for.inc.5:                                        ; preds = %for.inc.4
  %7 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 6), i32 0, i32 1 seq_cst seq_cst
  %cmp2.6 = extractvalue { i32, i1 } %7, 1
  br i1 %cmp2.6, label %if.then3, label %for.inc.6

for.inc.6:                                        ; preds = %for.inc.5
  %8 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 7), i32 0, i32 1 seq_cst seq_cst
  %cmp2.7 = extractvalue { i32, i1 } %8, 1
  br i1 %cmp2.7, label %if.then3, label %for.inc.7

for.inc.7:                                        ; preds = %for.inc.6
  %9 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 8), i32 0, i32 1 seq_cst seq_cst
  %cmp2.8 = extractvalue { i32, i1 } %9, 1
  br i1 %cmp2.8, label %if.then3, label %for.inc.8

for.inc.8:                                        ; preds = %for.inc.7
  %10 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 9), i32 0, i32 1 seq_cst seq_cst
  %cmp2.9 = extractvalue { i32, i1 } %10, 1
  br i1 %cmp2.9, label %if.then3, label %if.end9
}

; Function Attrs: nounwind
define weak void @halide_default_free(i8* %user_context, i8* %ptr) #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 0), align 4, !tbaa !12
  %cmp1 = icmp eq i8* %0, %ptr
  br i1 %cmp1, label %cleanup, label %for.inc

for.inc:                                          ; preds = %entry
  %1 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 1), align 4, !tbaa !12
  %cmp1.1 = icmp eq i8* %1, %ptr
  br i1 %cmp1.1, label %cleanup, label %for.inc.1

cleanup:                                          ; preds = %for.inc.8, %for.inc.7, %for.inc.6, %for.inc.5, %for.inc.4, %for.inc.3, %for.inc.2, %for.inc.1, %for.inc, %entry
  %i.010.lcssa = phi i32 [ 0, %entry ], [ 1, %for.inc ], [ 2, %for.inc.1 ], [ 3, %for.inc.2 ], [ 4, %for.inc.3 ], [ 5, %for.inc.4 ], [ 6, %for.inc.5 ], [ 7, %for.inc.6 ], [ 8, %for.inc.7 ], [ 9, %for.inc.8 ]
  %arrayidx2 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 %i.010.lcssa
  store i32 0, i32* %arrayidx2, align 4, !tbaa !10
  br label %return

return:                                           ; preds = %for.inc.9, %cleanup
  ret void

for.inc.1:                                        ; preds = %for.inc
  %2 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 2), align 4, !tbaa !12
  %cmp1.2 = icmp eq i8* %2, %ptr
  br i1 %cmp1.2, label %cleanup, label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1
  %3 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 3), align 4, !tbaa !12
  %cmp1.3 = icmp eq i8* %3, %ptr
  br i1 %cmp1.3, label %cleanup, label %for.inc.3

for.inc.3:                                        ; preds = %for.inc.2
  %4 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 4), align 4, !tbaa !12
  %cmp1.4 = icmp eq i8* %4, %ptr
  br i1 %cmp1.4, label %cleanup, label %for.inc.4

for.inc.4:                                        ; preds = %for.inc.3
  %5 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 5), align 4, !tbaa !12
  %cmp1.5 = icmp eq i8* %5, %ptr
  br i1 %cmp1.5, label %cleanup, label %for.inc.5

for.inc.5:                                        ; preds = %for.inc.4
  %6 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 6), align 4, !tbaa !12
  %cmp1.6 = icmp eq i8* %6, %ptr
  br i1 %cmp1.6, label %cleanup, label %for.inc.6

for.inc.6:                                        ; preds = %for.inc.5
  %7 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 7), align 4, !tbaa !12
  %cmp1.7 = icmp eq i8* %7, %ptr
  br i1 %cmp1.7, label %cleanup, label %for.inc.7

for.inc.7:                                        ; preds = %for.inc.6
  %8 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 8), align 4, !tbaa !12
  %cmp1.8 = icmp eq i8* %8, %ptr
  br i1 %cmp1.8, label %cleanup, label %for.inc.8

for.inc.8:                                        ; preds = %for.inc.7
  %9 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 9), align 4, !tbaa !12
  %cmp1.9 = icmp eq i8* %9, %ptr
  br i1 %cmp1.9, label %cleanup, label %for.inc.9

for.inc.9:                                        ; preds = %for.inc.8
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %ptr) #12
  br label %return
}

; Function Attrs: nounwind
define weak i8* (i8*, i32)* @halide_set_custom_malloc(i8* (i8*, i32)* %user_malloc) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.8, i32 0, i32 0)) #11
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !12
  store i8* (i8*, i32)* %user_malloc, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !12
  ret i8* (i8*, i32)* %0
}

; Function Attrs: nounwind
define weak void (i8*, i8*)* @halide_set_custom_free(void (i8*, i8*)* %user_free) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.8, i32 0, i32 0)) #11
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !12
  store void (i8*, i8*)* %user_free, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !12
  ret void (i8*, i8*)* %0
}

; Function Attrs: nounwind
define weak noalias i8* @halide_malloc(i8* %user_context, i32 %x) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @malloc_tracing, align 4, !tbaa !10
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0)) #11
  %call = tail call i8* @_ZN6Halide7Runtime8Internal9to_stringEj(i32 %x) #12
  tail call void @halide_print(i8* null, i8* %call) #11
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0)) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call1 = tail call i8* @halide_default_malloc(i8* %user_context, i32 %x) #12
  ret i8* %call1
}

; Function Attrs: nounwind
define weak void @halide_free(i8* %user_context, i8* %ptr) local_unnamed_addr #0 {
entry:
  tail call void @halide_default_free(i8* %user_context, i8* %ptr) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_default_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %idx, i8* %closure) #11
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_default_do_par_for(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #0 {
entry:
  %add = add nsw i32 %size, %min
  %cmp14 = icmp sgt i32 %size, 0
  br i1 %cmp14, label %for.body, label %return

for.cond:                                         ; preds = %for.body
  %cmp = icmp slt i32 %inc, %add
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond, %entry
  %x.015 = phi i32 [ %inc, %for.cond ], [ %min, %entry ]
  %call = tail call i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %x.015, i8* %closure) #12
  %tobool = icmp eq i32 %call, 0
  %inc = add nsw i32 %x.015, 1
  br i1 %tobool, label %for.cond, label %return

return:                                           ; preds = %for.body, %for.cond, %entry
  %retval.3 = phi i32 [ 0, %entry ], [ 0, %for.cond ], [ %call, %for.body ]
  ret i32 %retval.3
}

; Function Attrs: nounwind
define weak i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 4, !tbaa !12
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #11
  ret i32 %call
}

; Function Attrs: nounwind
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %f, i8* %closure) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.10, i32 0, i32 0)) #11
  ret %struct.halide_thread* null
}

declare extern_weak void @halide_error(i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind
define weak void @halide_mutex_lock(%struct.halide_mutex* %mutex) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_mutex_unlock(%struct.halide_mutex* %mutex) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_shutdown_thread_pool() local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_set_num_threads(i32 %n) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %n, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1.11, i32 0, i32 0)) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 1
}

; Function Attrs: norecurse nounwind
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_set_custom_do_task(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f) local_unnamed_addr #3 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 4, !tbaa !12
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 4, !tbaa !12
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0
}

; Function Attrs: norecurse nounwind
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_set_custom_do_par_for(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f) local_unnamed_addr #3 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 4, !tbaa !12
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 4, !tbaa !12
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0
}

; Function Attrs: nounwind
define weak i32 @halide_do_par_for(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* noalias %closure) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 4, !tbaa !12
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #11
  ret i32 %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1) #4

; Function Attrs: norecurse nounwind
define weak void @halide_set_gpu_device(i32 %d) local_unnamed_addr #3 {
entry:
  store i32 %d, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !10
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !17
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_get_gpu_device(i8* %user_context) local_unnamed_addr #0 {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i, %entry
  %0 = atomicrmw xchg i32* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, i32 1 seq_cst
  %tobool.i = icmp eq i32 %0, 0
  br i1 %tobool.i, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit, label %while.cond.i

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit: ; preds = %while.cond.i
  %1 = load i8, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !17, !range !19
  %tobool = icmp eq i8 %1, 0
  br i1 %tobool, label %if.then, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit.if.end4_crit_edge

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit.if.end4_crit_edge: ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
  %.pre = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !10
  br label %if.end4

if.then:                                          ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.12, i32 0, i32 0)) #11
  %tobool1 = icmp eq i8* %call, null
  br i1 %tobool1, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call3 = tail call i32 @atoi(i8* nonnull %call) #11
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %storemerge = phi i32 [ %call3, %if.then2 ], [ -1, %if.then ]
  store i32 %storemerge, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !10
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !17
  br label %if.end4

if.end4:                                          ; preds = %if.end, %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit.if.end4_crit_edge
  %2 = phi i32 [ %.pre, %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit.if.end4_crit_edge ], [ %storemerge, %if.end ]
  store atomic i32 0, i32* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE release, align 4
  ret i32 %2
}

; Function Attrs: nounwind readonly
declare i8* @getenv(i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #5

; Function Attrs: norecurse nounwind
define weak i8* @halide_string_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #3 {
entry:
  %cmp = icmp ult i8* %dst, %end
  br i1 %cmp, label %if.end3, label %return

if.then2:                                         ; preds = %if.end6
  store i8 0, i8* %dst.addr.019, align 1, !tbaa !7
  br label %return

if.end3:                                          ; preds = %if.end6, %entry
  %arg.addr.020 = phi i8* [ %incdec.ptr7, %if.end6 ], [ %arg, %entry ]
  %dst.addr.019 = phi i8* [ %incdec.ptr, %if.end6 ], [ %dst, %entry ]
  %0 = load i8, i8* %arg.addr.020, align 1, !tbaa !7
  store i8 %0, i8* %dst.addr.019, align 1, !tbaa !7
  %cmp4 = icmp eq i8 %0, 0
  br i1 %cmp4, label %return, label %if.end6

if.end6:                                          ; preds = %if.end3
  %incdec.ptr = getelementptr inbounds i8, i8* %dst.addr.019, i32 1
  %incdec.ptr7 = getelementptr inbounds i8, i8* %arg.addr.020, i32 1
  %cmp1 = icmp eq i8* %incdec.ptr, %end
  br i1 %cmp1, label %if.then2, label %if.end3

return:                                           ; preds = %if.end3, %if.then2, %entry
  %retval.0 = phi i8* [ %end, %if.then2 ], [ %dst, %entry ], [ %dst.addr.019, %if.end3 ]
  ret i8* %retval.0
}

; Function Attrs: nounwind
define weak i8* @halide_uint64_to_string(i8* %dst, i8* %end, i64 %arg, i32 %min_digits) local_unnamed_addr #0 {
entry:
  %buf = alloca [32 x i8], align 1
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #9
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 31
  store i8 0, i8* %arrayidx, align 1, !tbaa !7
  %add.ptr = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 30
  %cmp13 = icmp sgt i32 %min_digits, 0
  %tobool14 = icmp ne i64 %arg, 0
  %1 = or i1 %tobool14, %cmp13
  br i1 %1, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %digits.0.lcssa = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.body ]
  %incdec.ptr1 = getelementptr inbounds i8, i8* %digits.0.lcssa, i32 1
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #12
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #9
  ret i8* %call

for.body:                                         ; preds = %for.body, %entry
  %arg.addr.017 = phi i64 [ %div, %for.body ], [ %arg, %entry ]
  %digits.016 = phi i8* [ %incdec.ptr, %for.body ], [ %add.ptr, %entry ]
  %i.015 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %div = udiv i64 %arg.addr.017, 10
  %2 = mul i64 %div, -10
  %sub = add i64 %2, %arg.addr.017
  %3 = trunc i64 %sub to i8
  %conv = add i8 %3, 48
  store i8 %conv, i8* %digits.016, align 1, !tbaa !7
  %incdec.ptr = getelementptr inbounds i8, i8* %digits.016, i32 -1
  %inc = add nuw nsw i32 %i.015, 1
  %cmp = icmp slt i32 %inc, %min_digits
  %4 = icmp ugt i64 %arg.addr.017, 9
  %5 = or i1 %4, %cmp
  br i1 %5, label %for.body, label %for.cond.cleanup
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #4

; Function Attrs: nounwind
define weak i8* @halide_int64_to_string(i8* %dst, i8* %end, i64 %arg, i32 %min_digits) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i64 %arg, 0
  %cmp1 = icmp ult i8* %dst, %end
  %or.cond = and i1 %cmp1, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8, i8* %dst, i32 1
  store i8 45, i8* %dst, align 1, !tbaa !7
  %sub = sub nsw i64 0, %arg
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arg.addr.0 = phi i64 [ %sub, %if.then ], [ %arg, %entry ]
  %dst.addr.0 = phi i8* [ %incdec.ptr, %if.then ], [ %dst, %entry ]
  %call = tail call i8* @halide_uint64_to_string(i8* %dst.addr.0, i8* %end, i64 %arg.addr.0, i32 %min_digits) #12
  ret i8* %call
}

; Function Attrs: nounwind
define weak i8* @halide_double_to_string(i8* %dst, i8* %end, double %arg, i32 %scientific) local_unnamed_addr #0 {
entry:
  %arg.addr = alloca double, align 8
  %bits = alloca i64, align 8
  %buf = alloca [512 x i8], align 1
  store double %arg, double* %arg.addr, align 8, !tbaa !20
  %0 = bitcast i64* %bits to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #9
  store i64 0, i64* %bits, align 8, !tbaa !22
  %1 = bitcast double* %arg.addr to i8*
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %1, i32 8) #11
  %2 = load i64, i64* %bits, align 8, !tbaa !22
  %and = and i64 %2, 4503599627370495
  %shr = lshr i64 %2, 52
  %3 = trunc i64 %shr to i32
  %conv = and i32 %3, 2047
  %shr2 = lshr i64 %2, 63
  %conv3 = trunc i64 %shr2 to i32
  %cmp = icmp eq i32 %conv, 2047
  br i1 %cmp, label %if.then, label %if.else15

if.then:                                          ; preds = %entry
  %tobool = icmp eq i64 %and, 0
  %tobool5 = icmp ne i32 %conv3, 0
  br i1 %tobool, label %if.else9, label %if.then4

if.then4:                                         ; preds = %if.then
  br i1 %tobool5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then4
  %call7 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0)) #12
  br label %cleanup148

if.else:                                          ; preds = %if.then4
  %call8 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.14, i32 0, i32 0)) #12
  br label %cleanup148

if.else9:                                         ; preds = %if.then
  br i1 %tobool5, label %if.then11, label %if.else13

if.then11:                                        ; preds = %if.else9
  %call12 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.15, i32 0, i32 0)) #12
  br label %cleanup148

if.else13:                                        ; preds = %if.else9
  %call14 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.16, i32 0, i32 0)) #12
  br label %cleanup148

if.else15:                                        ; preds = %entry
  %cmp16 = icmp eq i32 %conv, 0
  %cmp17 = icmp eq i64 %and, 0
  %or.cond = and i1 %cmp17, %cmp16
  br i1 %or.cond, label %if.then18, label %if.end32

if.then18:                                        ; preds = %if.else15
  %tobool19 = icmp eq i32 %scientific, 0
  %tobool21 = icmp ne i32 %conv3, 0
  br i1 %tobool19, label %if.else26, label %if.then20

if.then20:                                        ; preds = %if.then18
  br i1 %tobool21, label %if.then22, label %if.else24

if.then22:                                        ; preds = %if.then20
  %call23 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4.17, i32 0, i32 0)) #12
  br label %cleanup148

if.else24:                                        ; preds = %if.then20
  %call25 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5.18, i32 0, i32 0)) #12
  br label %cleanup148

if.else26:                                        ; preds = %if.then18
  br i1 %tobool21, label %if.then28, label %if.else30

if.then28:                                        ; preds = %if.else26
  %call29 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6.19, i32 0, i32 0)) #12
  br label %cleanup148

if.else30:                                        ; preds = %if.else26
  %call31 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7.20, i32 0, i32 0)) #12
  br label %cleanup148

if.end32:                                         ; preds = %if.else15
  %tobool33 = icmp eq i32 %conv3, 0
  br i1 %tobool33, label %if.end37, label %if.then34

if.then34:                                        ; preds = %if.end32
  %call35 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.21, i32 0, i32 0)) #12
  %sub36 = fsub double -0.000000e+00, %arg
  store double %sub36, double* %arg.addr, align 8, !tbaa !20
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %if.end32
  %.pr = phi double [ %sub36, %if.then34 ], [ %arg, %if.end32 ]
  %dst.addr.0 = phi i8* [ %call35, %if.then34 ], [ %dst, %if.end32 ]
  %tobool38 = icmp eq i32 %scientific, 0
  br i1 %tobool38, label %if.else62, label %if.then39

if.then39:                                        ; preds = %if.end37
  %cmp40262 = fcmp olt double %.pr, 1.000000e+00
  br i1 %cmp40262, label %while.body, label %while.cond41.preheader

while.cond.while.cond41.preheader_crit_edge:      ; preds = %while.body
  store double %mul, double* %arg.addr, align 8, !tbaa !20
  br label %while.cond41.preheader

while.cond41.preheader:                           ; preds = %while.cond.while.cond41.preheader_crit_edge, %if.then39
  %exponent_base_10.0.lcssa = phi i32 [ %dec, %while.cond.while.cond41.preheader_crit_edge ], [ 0, %if.then39 ]
  %4 = phi double [ %mul, %while.cond.while.cond41.preheader_crit_edge ], [ %.pr, %if.then39 ]
  %cmp42258 = fcmp ult double %4, 1.000000e+01
  br i1 %cmp42258, label %while.end44, label %while.body43

while.body:                                       ; preds = %while.body, %if.then39
  %5 = phi double [ %mul, %while.body ], [ %.pr, %if.then39 ]
  %exponent_base_10.0263 = phi i32 [ %dec, %while.body ], [ 0, %if.then39 ]
  %mul = fmul double %5, 1.000000e+01
  %dec = add nsw i32 %exponent_base_10.0263, -1
  %cmp40 = fcmp olt double %mul, 1.000000e+00
  br i1 %cmp40, label %while.body, label %while.cond.while.cond41.preheader_crit_edge

while.body43:                                     ; preds = %while.body43, %while.cond41.preheader
  %6 = phi double [ %div, %while.body43 ], [ %4, %while.cond41.preheader ]
  %exponent_base_10.1259 = phi i32 [ %inc, %while.body43 ], [ %exponent_base_10.0.lcssa, %while.cond41.preheader ]
  %div = fdiv double %6, 1.000000e+01
  %inc = add nsw i32 %exponent_base_10.1259, 1
  %cmp42 = fcmp ult double %div, 1.000000e+01
  br i1 %cmp42, label %while.cond41.while.end44_crit_edge, label %while.body43

while.cond41.while.end44_crit_edge:               ; preds = %while.body43
  store double %div, double* %arg.addr, align 8, !tbaa !20
  br label %while.end44

while.end44:                                      ; preds = %while.cond41.while.end44_crit_edge, %while.cond41.preheader
  %exponent_base_10.1.lcssa = phi i32 [ %inc, %while.cond41.while.end44_crit_edge ], [ %exponent_base_10.0.lcssa, %while.cond41.preheader ]
  %.lcssa = phi double [ %div, %while.cond41.while.end44_crit_edge ], [ %4, %while.cond41.preheader ]
  %mul45 = fmul double %.lcssa, 1.000000e+06
  %add = fadd double %mul45, 5.000000e-01
  %conv46 = fptoui double %add to i64
  %div47 = udiv i64 %conv46, 1000000
  %7 = mul i64 %div47, -1000000
  %sub49 = add i64 %7, %conv46
  %call50 = call i8* @halide_int64_to_string(i8* %dst.addr.0, i8* %end, i64 %div47, i32 1) #12
  %call51 = call i8* @halide_string_to_string(i8* %call50, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #12
  %call52 = call i8* @halide_int64_to_string(i8* %call51, i8* %end, i64 %sub49, i32 6) #12
  %cmp53 = icmp sgt i32 %exponent_base_10.1.lcssa, -1
  br i1 %cmp53, label %if.then54, label %if.else56

if.then54:                                        ; preds = %while.end44
  %call55 = call i8* @halide_string_to_string(i8* %call52, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10.23, i32 0, i32 0)) #12
  br label %if.end59

if.else56:                                        ; preds = %while.end44
  %call57 = call i8* @halide_string_to_string(i8* %call52, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0)) #12
  %sub58 = sub nsw i32 0, %exponent_base_10.1.lcssa
  br label %if.end59

if.end59:                                         ; preds = %if.else56, %if.then54
  %exponent_base_10.2 = phi i32 [ %exponent_base_10.1.lcssa, %if.then54 ], [ %sub58, %if.else56 ]
  %dst.addr.1 = phi i8* [ %call55, %if.then54 ], [ %call57, %if.else56 ]
  %conv60 = sext i32 %exponent_base_10.2 to i64
  %call61 = call i8* @halide_int64_to_string(i8* %dst.addr.1, i8* %end, i64 %conv60, i32 2) #12
  br label %cleanup148

if.else62:                                        ; preds = %if.end37
  br i1 %cmp16, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.else62
  %call65 = call i8* @halide_double_to_string(i8* %dst.addr.0, i8* %end, double 0.000000e+00, i32 0) #12
  br label %cleanup148

if.end66:                                         ; preds = %if.else62
  %add68 = or i64 %and, 4503599627370496
  %sub70 = add nsw i32 %conv, -1075
  %cmp71 = icmp ult i32 %conv, 1075
  br i1 %cmp71, label %if.then72, label %if.end105

if.then72:                                        ; preds = %if.end66
  %cmp73 = icmp ult i32 %conv, 1023
  br i1 %cmp73, label %if.end84, label %if.else76

if.else76:                                        ; preds = %if.then72
  %sub77 = sub nsw i32 1075, %conv
  %sh_prom = zext i32 %sub77 to i64
  %shr78 = lshr i64 %add68, %sh_prom
  %shl81 = shl i64 %shr78, %sh_prom
  %sub82 = sub i64 %add68, %shl81
  br label %if.end84

if.end84:                                         ; preds = %if.else76, %if.then72
  %integer_part.0 = phi i64 [ %shr78, %if.else76 ], [ 0, %if.then72 ]
  %f.0.in = phi i64 [ %sub82, %if.else76 ], [ %add68, %if.then72 ]
  %f.0 = uitofp i64 %f.0.in to double
  %conv85242 = zext i32 %sub70 to i64
  %shl86 = shl i64 %conv85242, 52
  %add88 = add i64 %shl86, 4696837146684686336
  %8 = bitcast i64 %add88 to double
  %mul90 = fmul double %8, %f.0
  %add91 = fadd double %mul90, 5.000000e-01
  %conv92 = fptoui double %add91 to i64
  %conv93 = uitofp i64 %conv92 to double
  %cmp94 = fcmp oeq double %add91, %conv93
  %and96 = and i64 %conv92, 1
  %tobool97 = icmp ne i64 %and96, 0
  %not.or.cond243 = and i1 %tobool97, %cmp94
  %dec99 = sext i1 %not.or.cond243 to i64
  %fractional_part.0 = add i64 %dec99, %conv92
  %cmp101 = icmp eq i64 %fractional_part.0, 1000000
  %inc103 = zext i1 %cmp101 to i64
  %spec.select = add i64 %integer_part.0, %inc103
  %spec.select244 = select i1 %cmp101, i64 0, i64 %fractional_part.0
  br label %if.end105

if.end105:                                        ; preds = %if.end84, %if.end66
  %integer_part.2 = phi i64 [ %add68, %if.end66 ], [ %spec.select, %if.end84 ]
  %integer_exponent.0 = phi i32 [ %sub70, %if.end66 ], [ 0, %if.end84 ]
  %fractional_part.2 = phi i64 [ 0, %if.end66 ], [ %spec.select244, %if.end84 ]
  %9 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %9) #9
  %add.ptr = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 512
  %add.ptr106 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 480
  %call109 = call i8* @halide_int64_to_string(i8* nonnull %add.ptr106, i8* nonnull %add.ptr, i64 %integer_part.2, i32 1) #12
  %cmp110253 = icmp sgt i32 %integer_exponent.0, 0
  br i1 %cmp110253, label %for.cond112.preheader, label %for.cond.cleanup

for.cond112.preheader:                            ; preds = %if.end138, %if.end105
  %i.0256 = phi i32 [ %inc140, %if.end138 ], [ 0, %if.end105 ]
  %int_part_ptr.0254 = phi i8* [ %int_part_ptr.1, %if.end138 ], [ %add.ptr106, %if.end105 ]
  %add.ptr113 = getelementptr inbounds i8, i8* %int_part_ptr.0254, i32 -1
  %cmp114249 = icmp eq i8* %call109, %int_part_ptr.0254
  br i1 %cmp114249, label %if.end138, label %for.body116

for.cond.cleanup:                                 ; preds = %if.end138, %if.end105
  %int_part_ptr.0.lcssa = phi i8* [ %add.ptr106, %if.end105 ], [ %int_part_ptr.1, %if.end138 ]
  %call142 = call i8* @halide_string_to_string(i8* %dst.addr.0, i8* %end, i8* %int_part_ptr.0.lcssa) #12
  %call143 = call i8* @halide_string_to_string(i8* %call142, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #12
  %call144 = call i8* @halide_int64_to_string(i8* %call143, i8* %end, i64 %fractional_part.2, i32 6) #12
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %9) #9
  br label %cleanup148

for.cond.cleanup115:                              ; preds = %for.body116
  br i1 %cmp125, label %if.then136, label %if.end138

for.body116:                                      ; preds = %for.body116, %for.cond112.preheader
  %p.0251.pn = phi i8* [ %p.0251, %for.body116 ], [ %call109, %for.cond112.preheader ]
  %carry.0250 = phi i8 [ %spec.select245, %for.body116 ], [ 0, %for.cond112.preheader ]
  %p.0251 = getelementptr inbounds i8, i8* %p.0251.pn, i32 -1
  %10 = load i8, i8* %p.0251, align 1, !tbaa !7
  %sub118 = shl i8 %10, 1
  %mul121 = add i8 %sub118, -96
  %add122 = or i8 %mul121, %carry.0250
  %cmp125 = icmp sgt i8 %add122, 9
  %sub128 = add i8 %add122, -10
  %spec.select245 = zext i1 %cmp125 to i8
  %spec.select246 = select i1 %cmp125, i8 %sub128, i8 %add122
  %add133 = add i8 %spec.select246, 48
  store i8 %add133, i8* %p.0251, align 1, !tbaa !7
  %cmp114 = icmp eq i8* %p.0251, %int_part_ptr.0254
  br i1 %cmp114, label %for.cond.cleanup115, label %for.body116

if.then136:                                       ; preds = %for.cond.cleanup115
  store i8 49, i8* %add.ptr113, align 1, !tbaa !7
  br label %if.end138

if.end138:                                        ; preds = %if.then136, %for.cond.cleanup115, %for.cond112.preheader
  %int_part_ptr.1 = phi i8* [ %add.ptr113, %if.then136 ], [ %int_part_ptr.0254, %for.cond.cleanup115 ], [ %call109, %for.cond112.preheader ]
  %inc140 = add nuw nsw i32 %i.0256, 1
  %exitcond = icmp eq i32 %inc140, %integer_exponent.0
  br i1 %exitcond, label %for.cond.cleanup, label %for.cond112.preheader

cleanup148:                                       ; preds = %for.cond.cleanup, %if.then64, %if.end59, %if.else30, %if.then28, %if.else24, %if.then22, %if.else13, %if.then11, %if.else, %if.then6
  %retval.1 = phi i8* [ %call7, %if.then6 ], [ %call8, %if.else ], [ %call12, %if.then11 ], [ %call14, %if.else13 ], [ %call23, %if.then22 ], [ %call25, %if.else24 ], [ %call29, %if.then28 ], [ %call31, %if.else30 ], [ %call65, %if.then64 ], [ %call61, %if.end59 ], [ %call144, %for.cond.cleanup ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #9
  ret i8* %retval.1
}

; Function Attrs: nounwind
declare i8* @memcpy(i8*, i8* nocapture readonly, i32) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i8* @halide_pointer_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #0 {
entry:
  %buf = alloca [20 x i8], align 1
  %0 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %0) #9
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %0, i8 0, i32 20, i1 false)
  %add.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 18
  %1 = ptrtoint i8* %arg to i32
  %2 = zext i32 %1 to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.018 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %bits.017 = phi i64 [ %2, %entry ], [ %shr, %for.body ]
  %buf_ptr.016 = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.body ]
  %3 = trunc i64 %bits.017 to i32
  %idxprom = and i32 %3, 15
  %arrayidx = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.24, i32 0, i32 %idxprom
  %4 = load i8, i8* %arrayidx, align 1, !tbaa !7
  %incdec.ptr = getelementptr inbounds i8, i8* %buf_ptr.016, i32 -1
  store i8 %4, i8* %buf_ptr.016, align 1, !tbaa !7
  %shr = lshr i64 %bits.017, 4
  %tobool = icmp ne i64 %shr, 0
  %inc = add nuw nsw i32 %i.018, 1
  %cmp = icmp ult i32 %inc, 16
  %or.cond = and i1 %cmp, %tobool
  br i1 %or.cond, label %for.body, label %cleanup

cleanup:                                          ; preds = %for.body
  %incdec.ptr1 = getelementptr inbounds i8, i8* %buf_ptr.016, i32 -2
  store i8 120, i8* %incdec.ptr, align 1, !tbaa !7
  store i8 48, i8* %incdec.ptr1, align 1, !tbaa !7
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #12
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %0) #9
  ret i8* %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1) #4

; Function Attrs: nounwind
define weak i8* @halide_type_to_string(i8* %dst, i8* %end, %struct.halide_type_t* %t) local_unnamed_addr #0 {
entry:
  %code = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 0
  %0 = load i8, i8* %code, align 2, !tbaa !24
  %1 = icmp ult i8 %0, 4
  br i1 %1, label %switch.lookup, label %sw.epilog

switch.lookup:                                    ; preds = %entry
  %2 = sext i8 %0 to i32
  %switch.gep = getelementptr inbounds [4 x i8*], [4 x i8*]* @switch.table.halide_type_to_string, i32 0, i32 %2
  %switch.load = load i8*, i8** %switch.gep, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %switch.lookup, %entry
  %code_name.0 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.17, i32 0, i32 0), %entry ]
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %code_name.0) #12
  %bits = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 1
  %3 = load i8, i8* %bits, align 1, !tbaa !27
  %conv4 = zext i8 %3 to i64
  %call5 = tail call i8* @halide_uint64_to_string(i8* %call, i8* %end, i64 %conv4, i32 1) #12
  %lanes = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 2
  %4 = load i16, i16* %lanes, align 2, !tbaa !28
  %cmp = icmp eq i16 %4, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %sw.epilog
  %call7 = tail call i8* @halide_string_to_string(i8* %call5, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i32 0, i32 0)) #12
  %5 = load i16, i16* %lanes, align 2, !tbaa !28
  %conv9 = zext i16 %5 to i64
  %call10 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %conv9, i32 1) #12
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.epilog
  %dst.addr.0 = phi i8* [ %call10, %if.then ], [ %call5, %sw.epilog ]
  ret i8* %dst.addr.0
}

; Function Attrs: nounwind
define weak i8* @halide_buffer_to_string(i8* %dst, i8* %end, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0)) #12
  br label %return

if.end:                                           ; preds = %entry
  %call1 = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #12
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !29
  %call2 = tail call i8* @halide_uint64_to_string(i8* %call1, i8* %end, i64 %0, i32 1) #12
  %call3 = tail call i8* @halide_string_to_string(i8* %call2, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #12
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = bitcast %struct.halide_device_interface_t** %device_interface to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !31
  %call4 = tail call i8* @halide_pointer_to_string(i8* %call3, i8* %end, i8* %2) #12
  %call5 = tail call i8* @halide_string_to_string(i8* %call4, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #12
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %3 = load i8*, i8** %host, align 4, !tbaa !32
  %call6 = tail call i8* @halide_pointer_to_string(i8* %call5, i8* %end, i8* %3) #12
  %call7 = tail call i8* @halide_string_to_string(i8* %call6, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #12
  %flags = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %4 = load i64, i64* %flags, align 8, !tbaa !33
  %call8 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %4, i32 1) #12
  %call9 = tail call i8* @halide_string_to_string(i8* %call8, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #12
  %type = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 7
  %call10 = tail call i8* @halide_type_to_string(i8* %call9, i8* %end, %struct.halide_type_t* nonnull %type) #12
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 8
  %5 = load i32, i32* %dimensions, align 4, !tbaa !34
  %cmp1175 = icmp sgt i32 %5, 0
  br i1 %cmp1175, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 9
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %dst.addr.0.lcssa = phi i8* [ %call10, %if.end ], [ %call24, %for.body ]
  %call25 = tail call i8* @halide_string_to_string(i8* %dst.addr.0.lcssa, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.94, i32 0, i32 0)) #12
  br label %return

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.077 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %dst.addr.076 = phi i8* [ %call10, %for.body.lr.ph ], [ %call24, %for.body ]
  %call12 = tail call i8* @halide_string_to_string(i8* %dst.addr.076, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0)) #12
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 %i.077, i32 0
  %7 = load i32, i32* %min, align 4, !tbaa !36
  %conv = sext i32 %7 to i64
  %call13 = tail call i8* @halide_int64_to_string(i8* %call12, i8* %end, i64 %conv, i32 1) #12
  %call14 = tail call i8* @halide_string_to_string(i8* %call13, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #12
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %extent = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i32 %i.077, i32 1
  %9 = load i32, i32* %extent, align 4, !tbaa !38
  %conv17 = sext i32 %9 to i64
  %call18 = tail call i8* @halide_int64_to_string(i8* %call14, i8* %end, i64 %conv17, i32 1) #12
  %call19 = tail call i8* @halide_string_to_string(i8* %call18, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #12
  %10 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %10, i32 %i.077, i32 2
  %11 = load i32, i32* %stride, align 4, !tbaa !39
  %conv22 = sext i32 %11 to i64
  %call23 = tail call i8* @halide_int64_to_string(i8* %call19, i8* %end, i64 %conv22, i32 1) #12
  %call24 = tail call i8* @halide_string_to_string(i8* %call23, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23, i32 0, i32 0)) #12
  %inc = add nuw nsw i32 %i.077, 1
  %12 = load i32, i32* %dimensions, align 4, !tbaa !34
  %cmp11 = icmp slt i32 %inc, %12
  br i1 %cmp11, label %for.body, label %for.cond.cleanup

return:                                           ; preds = %for.cond.cleanup, %if.then
  %retval.0 = phi i8* [ %call, %if.then ], [ %call25, %for.cond.cleanup ]
  ret i8* %retval.0
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* dereferenceable(416) %copy, i32 %d, i64 %src_off, i64 %dst_off) local_unnamed_addr #0 {
entry:
  %cmp41 = icmp sgt i32 %d, -1
  br i1 %cmp41, label %land.end, label %while.end

land.end:                                         ; preds = %while.body, %entry
  %d.addr.042 = phi i32 [ %dec, %while.body ], [ %d, %entry ]
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d.addr.042
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !22
  %cmp1 = icmp eq i64 %0, 1
  br i1 %cmp1, label %while.body, label %if.else

while.body:                                       ; preds = %land.end
  %dec = add nsw i32 %d.addr.042, -1
  %cmp = icmp sgt i32 %d.addr.042, 0
  br i1 %cmp, label %land.end, label %while.end

while.end:                                        ; preds = %while.body, %entry
  %d.addr.0.lcssa = phi i32 [ %d, %entry ], [ %dec, %while.body ]
  %cmp2 = icmp eq i32 %d.addr.0.lcssa, -1
  br i1 %cmp2, label %if.then, label %while.end.if.else_crit_edge

while.end.if.else_crit_edge:                      ; preds = %while.end
  %arrayidx7.phi.trans.insert = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d.addr.0.lcssa
  %.pre = load i64, i64* %arrayidx7.phi.trans.insert, align 8, !tbaa !22
  br label %if.else

if.then:                                          ; preds = %while.end
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 0
  %1 = load i64, i64* %src, align 8, !tbaa !40
  %add = add i64 %1, %src_off
  %conv = trunc i64 %add to i32
  %2 = inttoptr i32 %conv to i8*
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 1
  %3 = load i64, i64* %dst, align 8, !tbaa !42
  %add3 = add i64 %3, %dst_off
  %conv4 = trunc i64 %add3 to i32
  %4 = inttoptr i32 %conv4 to i8*
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 6
  %5 = load i64, i64* %chunk_size, align 8, !tbaa !43
  %conv5 = trunc i64 %5 to i32
  %call = tail call i8* @memcpy(i8* %4, i8* %2, i32 %conv5) #11
  br label %if.end

if.else:                                          ; preds = %while.end.if.else_crit_edge, %land.end
  %6 = phi i64 [ %.pre, %while.end.if.else_crit_edge ], [ %0, %land.end ]
  %d.addr.036 = phi i32 [ %d.addr.0.lcssa, %while.end.if.else_crit_edge ], [ %d.addr.042, %land.end ]
  %arrayidx7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d.addr.036
  %cmp837 = icmp eq i64 %6, 0
  br i1 %cmp837, label %if.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.else
  %sub = add nsw i32 %d.addr.036, -1
  %arrayidx9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 4, i32 %d.addr.036
  %arrayidx11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 5, i32 %d.addr.036
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.040 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %src_off.addr.039 = phi i64 [ %src_off, %for.body.lr.ph ], [ %add10, %for.body ]
  %dst_off.addr.038 = phi i64 [ %dst_off, %for.body.lr.ph ], [ %add12, %for.body ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %copy, i32 %sub, i64 %src_off.addr.039, i64 %dst_off.addr.038) #12
  %7 = load i64, i64* %arrayidx9, align 8, !tbaa !22
  %add10 = add i64 %7, %src_off.addr.039
  %8 = load i64, i64* %arrayidx11, align 8, !tbaa !22
  %add12 = add i64 %8, %dst_off.addr.038
  %inc = add nuw i64 %i.040, 1
  %9 = load i64, i64* %arrayidx7, align 8, !tbaa !22
  %cmp8 = icmp ult i64 %inc, %9
  br i1 %cmp8, label %for.body, label %if.end

if.end:                                           ; preds = %for.body, %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* dereferenceable(416) %copy, i8* %user_context) local_unnamed_addr #0 {
entry:
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 0
  %0 = load i64, i64* %src, align 8, !tbaa !40
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 1
  %1 = load i64, i64* %dst, align 8, !tbaa !42
  %cmp = icmp eq i64 %0, %1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 2
  %2 = load i64, i64* %src_begin, align 8, !tbaa !44
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %copy, i32 15, i64 %2, i64 0) #12
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* noalias sret %agg.result, %struct.halide_buffer_t* %src, i1 zeroext %src_host, %struct.halide_buffer_t* %dst, i1 zeroext %dst_host) local_unnamed_addr #0 {
entry:
  %c = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %0 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %0) #9
  br i1 %src_host, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 2
  %1 = bitcast i8** %host to i32*
  %2 = load i32, i32* %1, align 4, !tbaa !32
  %3 = zext i32 %2 to i64
  br label %cond.end

cond.false:                                       ; preds = %entry
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %4 = load i64, i64* %device, align 8, !tbaa !29
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %3, %cond.true ], [ %4, %cond.false ]
  %src2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 0
  store i64 %cond, i64* %src2, align 8, !tbaa !40
  br i1 %dst_host, label %cond.true4, label %cond.false6

cond.true4:                                       ; preds = %cond.end
  %host5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 2
  %5 = bitcast i8** %host5 to i32*
  %6 = load i32, i32* %5, align 4, !tbaa !32
  %7 = zext i32 %6 to i64
  br label %cond.end8

cond.false6:                                      ; preds = %cond.end
  %device7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %8 = load i64, i64* %device7, align 8, !tbaa !29
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true4
  %cond9 = phi i64 [ %7, %cond.true4 ], [ %8, %cond.false6 ]
  %dst10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 1
  store i64 %cond9, i64* %dst10, align 8, !tbaa !42
  %bits.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 7, i32 1
  %9 = load i8, i8* %bits.i, align 1, !tbaa !27
  %conv.i = zext i8 %9 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %10 = zext i32 %div.i to i64
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 6
  store i64 %10, i64* %chunk_size, align 8, !tbaa !43
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 0
  store i64 1, i64* %arrayidx, align 8, !tbaa !22
  %arrayidx11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 0
  store i64 0, i64* %arrayidx11, align 8, !tbaa !22
  %arrayidx12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 0
  store i64 0, i64* %arrayidx12, align 8, !tbaa !22
  %arrayidx.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 1
  store i64 1, i64* %arrayidx.1, align 8, !tbaa !22
  %arrayidx11.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 1
  store i64 0, i64* %arrayidx11.1, align 8, !tbaa !22
  %arrayidx12.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 1
  store i64 0, i64* %arrayidx12.1, align 8, !tbaa !22
  %arrayidx.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 2
  store i64 1, i64* %arrayidx.2, align 8, !tbaa !22
  %arrayidx11.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 2
  store i64 0, i64* %arrayidx11.2, align 8, !tbaa !22
  %arrayidx12.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 2
  store i64 0, i64* %arrayidx12.2, align 8, !tbaa !22
  %arrayidx.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 3
  store i64 1, i64* %arrayidx.3, align 8, !tbaa !22
  %arrayidx11.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 3
  store i64 0, i64* %arrayidx11.3, align 8, !tbaa !22
  %arrayidx12.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 3
  store i64 0, i64* %arrayidx12.3, align 8, !tbaa !22
  %arrayidx.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 4
  store i64 1, i64* %arrayidx.4, align 8, !tbaa !22
  %arrayidx11.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 4
  store i64 0, i64* %arrayidx11.4, align 8, !tbaa !22
  %arrayidx12.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 4
  store i64 0, i64* %arrayidx12.4, align 8, !tbaa !22
  %arrayidx.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 5
  store i64 1, i64* %arrayidx.5, align 8, !tbaa !22
  %arrayidx11.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 5
  store i64 0, i64* %arrayidx11.5, align 8, !tbaa !22
  %arrayidx12.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 5
  store i64 0, i64* %arrayidx12.5, align 8, !tbaa !22
  %arrayidx.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 6
  store i64 1, i64* %arrayidx.6, align 8, !tbaa !22
  %arrayidx11.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 6
  store i64 0, i64* %arrayidx11.6, align 8, !tbaa !22
  %arrayidx12.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 6
  store i64 0, i64* %arrayidx12.6, align 8, !tbaa !22
  %arrayidx.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 7
  store i64 1, i64* %arrayidx.7, align 8, !tbaa !22
  %arrayidx11.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 7
  store i64 0, i64* %arrayidx11.7, align 8, !tbaa !22
  %arrayidx12.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 7
  store i64 0, i64* %arrayidx12.7, align 8, !tbaa !22
  %arrayidx.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 8
  store i64 1, i64* %arrayidx.8, align 8, !tbaa !22
  %arrayidx11.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 8
  store i64 0, i64* %arrayidx11.8, align 8, !tbaa !22
  %arrayidx12.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 8
  store i64 0, i64* %arrayidx12.8, align 8, !tbaa !22
  %arrayidx.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 9
  store i64 1, i64* %arrayidx.9, align 8, !tbaa !22
  %arrayidx11.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 9
  store i64 0, i64* %arrayidx11.9, align 8, !tbaa !22
  %arrayidx12.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 9
  store i64 0, i64* %arrayidx12.9, align 8, !tbaa !22
  %arrayidx.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 10
  store i64 1, i64* %arrayidx.10, align 8, !tbaa !22
  %arrayidx11.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 10
  store i64 0, i64* %arrayidx11.10, align 8, !tbaa !22
  %arrayidx12.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 10
  store i64 0, i64* %arrayidx12.10, align 8, !tbaa !22
  %arrayidx.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 11
  store i64 1, i64* %arrayidx.11, align 8, !tbaa !22
  %arrayidx11.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 11
  store i64 0, i64* %arrayidx11.11, align 8, !tbaa !22
  %arrayidx12.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 11
  store i64 0, i64* %arrayidx12.11, align 8, !tbaa !22
  %arrayidx.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 12
  store i64 1, i64* %arrayidx.12, align 8, !tbaa !22
  %arrayidx11.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 12
  store i64 0, i64* %arrayidx11.12, align 8, !tbaa !22
  %arrayidx12.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 12
  store i64 0, i64* %arrayidx12.12, align 8, !tbaa !22
  %arrayidx.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 13
  store i64 1, i64* %arrayidx.13, align 8, !tbaa !22
  %arrayidx11.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 13
  store i64 0, i64* %arrayidx11.13, align 8, !tbaa !22
  %arrayidx12.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 13
  store i64 0, i64* %arrayidx12.13, align 8, !tbaa !22
  %arrayidx.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 14
  store i64 1, i64* %arrayidx.14, align 8, !tbaa !22
  %arrayidx11.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 14
  store i64 0, i64* %arrayidx11.14, align 8, !tbaa !22
  %arrayidx12.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 14
  store i64 0, i64* %arrayidx12.14, align 8, !tbaa !22
  %arrayidx.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 15
  store i64 1, i64* %arrayidx.15, align 8, !tbaa !22
  %arrayidx11.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 15
  store i64 0, i64* %arrayidx11.15, align 8, !tbaa !22
  %arrayidx12.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 15
  store i64 0, i64* %arrayidx12.15, align 8, !tbaa !22
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 2
  store i64 0, i64* %src_begin, align 8, !tbaa !44
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 8
  %11 = load i32, i32* %dimensions, align 4, !tbaa !34
  %cmp15251 = icmp sgt i32 %11, 0
  br i1 %cmp15251, label %for.body17.lr.ph, label %for.cond.cleanup16

for.body17.lr.ph:                                 ; preds = %cond.end8
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 9
  %12 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %dim19 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 9
  %13 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim19, align 8, !tbaa !35
  br label %for.body17

for.cond14.for.cond.cleanup16_crit_edge:          ; preds = %for.body17
  store i64 %add, i64* %src_begin, align 8, !tbaa !44
  br label %for.cond.cleanup16

for.cond.cleanup16:                               ; preds = %for.cond14.for.cond.cleanup16_crit_edge, %cond.end8
  %14 = phi i64 [ %add, %for.cond14.for.cond.cleanup16_crit_edge ], [ 0, %cond.end8 ]
  %mul31 = mul i64 %14, %10
  store i64 %mul31, i64* %src_begin, align 8, !tbaa !44
  %dimensions33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 8
  %15 = load i32, i32* %dimensions33, align 4, !tbaa !34
  %cmp34 = icmp eq i32 %11, %15
  br i1 %cmp34, label %lor.lhs.false, label %if.then

for.body17:                                       ; preds = %for.body17, %for.body17.lr.ph
  %16 = phi i64 [ 0, %for.body17.lr.ph ], [ %add, %for.body17 ]
  %i13.0252 = phi i32 [ 0, %for.body17.lr.ph ], [ %inc27, %for.body17 ]
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %i13.0252, i32 2
  %17 = load i32, i32* %stride, align 4, !tbaa !39
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 %i13.0252, i32 0
  %18 = load i32, i32* %min, align 4, !tbaa !36
  %min23 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %i13.0252, i32 0
  %19 = load i32, i32* %min23, align 4, !tbaa !36
  %sub = sub nsw i32 %18, %19
  %mul = mul nsw i32 %sub, %17
  %conv24 = sext i32 %mul to i64
  %add = add i64 %16, %conv24
  %inc27 = add nuw nsw i32 %i13.0252, 1
  %exitcond1 = icmp eq i32 %inc27, %11
  br i1 %exitcond1, label %for.cond14.for.cond.cleanup16_crit_edge, label %for.body17

lor.lhs.false:                                    ; preds = %for.cond.cleanup16
  %bits.i233 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 7, i32 1
  %20 = load i8, i8* %bits.i233, align 1, !tbaa !27
  %conv.i234 = zext i8 %20 to i32
  %add.i235 = add nuw nsw i32 %conv.i234, 7
  %cmp39.unshifted = xor i32 %add.i235, %add.i
  %cmp39 = icmp ugt i32 %cmp39.unshifted, 7
  %cmp42 = icmp sgt i32 %11, 16
  %or.cond241 = or i1 %cmp42, %cmp39
  br i1 %or.cond241, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.cond.cleanup16
  %21 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i32(i8* align 8 %21, i8 0, i32 416, i1 false)
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %cmp44 = icmp eq i32 %div.i, 0
  br i1 %cmp44, label %if.then45, label %for.cond48.preheader

for.cond48.preheader:                             ; preds = %if.end
  br i1 %cmp15251, label %for.body52.lr.ph, label %while.end

for.body52.lr.ph:                                 ; preds = %for.cond48.preheader
  %dim54 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 9
  %22 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim54, align 8, !tbaa !35
  %div.i232 = lshr i32 %add.i235, 3
  %dim62 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 9
  %23 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim62, align 8, !tbaa !35
  br label %for.body52

if.then45:                                        ; preds = %if.end
  %24 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i32(i8* align 8 %24, i8 0, i32 416, i1 false)
  br label %cleanup

while.cond.preheader:                             ; preds = %for.cond.cleanup83
  %.pre = load i64, i64* %chunk_size, align 8, !tbaa !43
  %.pre257 = load i64, i64* %arrayidx11, align 8, !tbaa !22
  %cmp125243 = icmp eq i64 %.pre, %.pre257
  br i1 %cmp125243, label %land.rhs.lr.ph, label %while.end

land.rhs.lr.ph:                                   ; preds = %while.cond.preheader
  %.pre258 = load i64, i64* %arrayidx12, align 8, !tbaa !22
  br label %land.rhs

for.body52:                                       ; preds = %for.cond.cleanup83, %for.body52.lr.ph
  %i47.0250 = phi i32 [ 0, %for.body52.lr.ph ], [ %inc120, %for.cond.cleanup83 ]
  %stride56 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 %i47.0250, i32 2
  %25 = load i32, i32* %stride56, align 4, !tbaa !39
  %mul59 = mul nsw i32 %25, %div.i232
  %conv60 = sext i32 %mul59 to i64
  %stride64 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %23, i32 %i47.0250, i32 2
  %26 = load i32, i32* %stride64, align 4, !tbaa !39
  %mul67 = mul nsw i32 %26, %div.i
  %conv68 = sext i32 %mul67 to i64
  %cmp70244 = icmp eq i32 %i47.0250, 0
  br i1 %cmp70244, label %for.end80, label %for.body71.lr.ph

for.body71.lr.ph:                                 ; preds = %for.body52
  %cmp75 = icmp eq i32 %mul59, 0
  br i1 %cmp75, label %for.end80, label %for.body71.us

for.body71.us:                                    ; preds = %for.inc78.us, %for.body71.lr.ph
  %insert.0245.us = phi i32 [ %inc79.us, %for.inc78.us ], [ 0, %for.body71.lr.ph ]
  %arrayidx73.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %insert.0245.us
  %27 = load i64, i64* %arrayidx73.us, align 8, !tbaa !22
  %cmp74.us = icmp ugt i64 %27, %conv60
  br i1 %cmp74.us, label %for.end80, label %for.inc78.us

for.inc78.us:                                     ; preds = %for.body71.us
  %inc79.us = add nuw nsw i32 %insert.0245.us, 1
  %cmp70.us = icmp ult i32 %inc79.us, %i47.0250
  br i1 %cmp70.us, label %for.body71.us, label %for.end80

for.end80:                                        ; preds = %for.inc78.us, %for.body71.us, %for.body71.lr.ph, %for.body52
  %insert.0.lcssa = phi i32 [ 0, %for.body52 ], [ %i47.0250, %for.body71.lr.ph ], [ %inc79.us, %for.inc78.us ], [ %insert.0245.us, %for.body71.us ]
  %cmp82247 = icmp ugt i32 %i47.0250, %insert.0.lcssa
  br i1 %cmp82247, label %for.body84, label %for.cond.cleanup83

for.cond.cleanup83:                               ; preds = %for.body84, %for.end80
  %extent104 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 %i47.0250, i32 1
  %28 = load i32, i32* %extent104, align 4, !tbaa !38
  %conv105 = sext i32 %28 to i64
  %arrayidx107 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %insert.0.lcssa
  store i64 %conv105, i64* %arrayidx107, align 8, !tbaa !22
  %arrayidx116 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %insert.0.lcssa
  store i64 %conv60, i64* %arrayidx116, align 8, !tbaa !22
  %arrayidx118 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %insert.0.lcssa
  store i64 %conv68, i64* %arrayidx118, align 8, !tbaa !22
  %inc120 = add nuw nsw i32 %i47.0250, 1
  %exitcond = icmp eq i32 %inc120, %11
  br i1 %exitcond, label %while.cond.preheader, label %for.body52

for.body84:                                       ; preds = %for.body84, %for.end80
  %j.0248 = phi i32 [ %sub86, %for.body84 ], [ %i47.0250, %for.end80 ]
  %sub86 = add nsw i32 %j.0248, -1
  %arrayidx87 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub86
  %29 = load i64, i64* %arrayidx87, align 8, !tbaa !22
  %arrayidx89 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %j.0248
  store i64 %29, i64* %arrayidx89, align 8, !tbaa !22
  %arrayidx92 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub86
  %30 = load i64, i64* %arrayidx92, align 8, !tbaa !22
  %arrayidx94 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %j.0248
  store i64 %30, i64* %arrayidx94, align 8, !tbaa !22
  %arrayidx97 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub86
  %31 = load i64, i64* %arrayidx97, align 8, !tbaa !22
  %arrayidx99 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %j.0248
  store i64 %31, i64* %arrayidx99, align 8, !tbaa !22
  %cmp82 = icmp sgt i32 %sub86, %insert.0.lcssa
  br i1 %cmp82, label %for.body84, label %for.cond.cleanup83

land.rhs:                                         ; preds = %while.body, %land.rhs.lr.ph
  %32 = phi i64 [ %.pre258, %land.rhs.lr.ph ], [ %37, %while.body ]
  %33 = phi i64 [ %.pre, %land.rhs.lr.ph ], [ %mul133, %while.body ]
  %cmp129 = icmp eq i64 %33, %32
  br i1 %cmp129, label %while.body, label %while.end

while.body:                                       ; preds = %land.rhs
  %34 = load i64, i64* %arrayidx, align 8, !tbaa !22
  %mul133 = mul i64 %34, %32
  store i64 %mul133, i64* %chunk_size, align 8, !tbaa !43
  %35 = load i64, i64* %arrayidx.1, align 8, !tbaa !22
  store i64 %35, i64* %arrayidx, align 8, !tbaa !22
  %36 = load i64, i64* %arrayidx11.1, align 8, !tbaa !22
  store i64 %36, i64* %arrayidx11, align 8, !tbaa !22
  %37 = load i64, i64* %arrayidx12.1, align 8, !tbaa !22
  store i64 %37, i64* %arrayidx12, align 8, !tbaa !22
  %38 = load i64, i64* %arrayidx.2, align 8, !tbaa !22
  store i64 %38, i64* %arrayidx.1, align 8, !tbaa !22
  %39 = load i64, i64* %arrayidx11.2, align 8, !tbaa !22
  store i64 %39, i64* %arrayidx11.1, align 8, !tbaa !22
  %40 = load i64, i64* %arrayidx12.2, align 8, !tbaa !22
  store i64 %40, i64* %arrayidx12.1, align 8, !tbaa !22
  %41 = load i64, i64* %arrayidx.3, align 8, !tbaa !22
  store i64 %41, i64* %arrayidx.2, align 8, !tbaa !22
  %42 = load i64, i64* %arrayidx11.3, align 8, !tbaa !22
  store i64 %42, i64* %arrayidx11.2, align 8, !tbaa !22
  %43 = load i64, i64* %arrayidx12.3, align 8, !tbaa !22
  store i64 %43, i64* %arrayidx12.2, align 8, !tbaa !22
  %44 = load i64, i64* %arrayidx.4, align 8, !tbaa !22
  store i64 %44, i64* %arrayidx.3, align 8, !tbaa !22
  %45 = load i64, i64* %arrayidx11.4, align 8, !tbaa !22
  store i64 %45, i64* %arrayidx11.3, align 8, !tbaa !22
  %46 = load i64, i64* %arrayidx12.4, align 8, !tbaa !22
  store i64 %46, i64* %arrayidx12.3, align 8, !tbaa !22
  %47 = load i64, i64* %arrayidx.5, align 8, !tbaa !22
  store i64 %47, i64* %arrayidx.4, align 8, !tbaa !22
  %48 = load i64, i64* %arrayidx11.5, align 8, !tbaa !22
  store i64 %48, i64* %arrayidx11.4, align 8, !tbaa !22
  %49 = load i64, i64* %arrayidx12.5, align 8, !tbaa !22
  store i64 %49, i64* %arrayidx12.4, align 8, !tbaa !22
  %50 = load i64, i64* %arrayidx.6, align 8, !tbaa !22
  store i64 %50, i64* %arrayidx.5, align 8, !tbaa !22
  %51 = load i64, i64* %arrayidx11.6, align 8, !tbaa !22
  store i64 %51, i64* %arrayidx11.5, align 8, !tbaa !22
  %52 = load i64, i64* %arrayidx12.6, align 8, !tbaa !22
  store i64 %52, i64* %arrayidx12.5, align 8, !tbaa !22
  %53 = load i64, i64* %arrayidx.7, align 8, !tbaa !22
  store i64 %53, i64* %arrayidx.6, align 8, !tbaa !22
  %54 = load i64, i64* %arrayidx11.7, align 8, !tbaa !22
  store i64 %54, i64* %arrayidx11.6, align 8, !tbaa !22
  %55 = load i64, i64* %arrayidx12.7, align 8, !tbaa !22
  store i64 %55, i64* %arrayidx12.6, align 8, !tbaa !22
  %56 = load i64, i64* %arrayidx.8, align 8, !tbaa !22
  store i64 %56, i64* %arrayidx.7, align 8, !tbaa !22
  %57 = load i64, i64* %arrayidx11.8, align 8, !tbaa !22
  store i64 %57, i64* %arrayidx11.7, align 8, !tbaa !22
  %58 = load i64, i64* %arrayidx12.8, align 8, !tbaa !22
  store i64 %58, i64* %arrayidx12.7, align 8, !tbaa !22
  %59 = load i64, i64* %arrayidx.9, align 8, !tbaa !22
  store i64 %59, i64* %arrayidx.8, align 8, !tbaa !22
  %60 = load i64, i64* %arrayidx11.9, align 8, !tbaa !22
  store i64 %60, i64* %arrayidx11.8, align 8, !tbaa !22
  %61 = load i64, i64* %arrayidx12.9, align 8, !tbaa !22
  store i64 %61, i64* %arrayidx12.8, align 8, !tbaa !22
  %62 = load i64, i64* %arrayidx.10, align 8, !tbaa !22
  store i64 %62, i64* %arrayidx.9, align 8, !tbaa !22
  %63 = load i64, i64* %arrayidx11.10, align 8, !tbaa !22
  store i64 %63, i64* %arrayidx11.9, align 8, !tbaa !22
  %64 = load i64, i64* %arrayidx12.10, align 8, !tbaa !22
  store i64 %64, i64* %arrayidx12.9, align 8, !tbaa !22
  %65 = load i64, i64* %arrayidx.11, align 8, !tbaa !22
  store i64 %65, i64* %arrayidx.10, align 8, !tbaa !22
  %66 = load i64, i64* %arrayidx11.11, align 8, !tbaa !22
  store i64 %66, i64* %arrayidx11.10, align 8, !tbaa !22
  %67 = load i64, i64* %arrayidx12.11, align 8, !tbaa !22
  store i64 %67, i64* %arrayidx12.10, align 8, !tbaa !22
  %68 = load i64, i64* %arrayidx.12, align 8, !tbaa !22
  store i64 %68, i64* %arrayidx.11, align 8, !tbaa !22
  %69 = load i64, i64* %arrayidx11.12, align 8, !tbaa !22
  store i64 %69, i64* %arrayidx11.11, align 8, !tbaa !22
  %70 = load i64, i64* %arrayidx12.12, align 8, !tbaa !22
  store i64 %70, i64* %arrayidx12.11, align 8, !tbaa !22
  %71 = load i64, i64* %arrayidx.13, align 8, !tbaa !22
  store i64 %71, i64* %arrayidx.12, align 8, !tbaa !22
  %72 = load i64, i64* %arrayidx11.13, align 8, !tbaa !22
  store i64 %72, i64* %arrayidx11.12, align 8, !tbaa !22
  %73 = load i64, i64* %arrayidx12.13, align 8, !tbaa !22
  store i64 %73, i64* %arrayidx12.12, align 8, !tbaa !22
  %74 = load i64, i64* %arrayidx.14, align 8, !tbaa !22
  store i64 %74, i64* %arrayidx.13, align 8, !tbaa !22
  %75 = load i64, i64* %arrayidx11.14, align 8, !tbaa !22
  store i64 %75, i64* %arrayidx11.13, align 8, !tbaa !22
  %76 = load i64, i64* %arrayidx12.14, align 8, !tbaa !22
  store i64 %76, i64* %arrayidx12.13, align 8, !tbaa !22
  %77 = load i64, i64* %arrayidx.15, align 8, !tbaa !22
  store i64 %77, i64* %arrayidx.14, align 8, !tbaa !22
  %78 = load i64, i64* %arrayidx11.15, align 8, !tbaa !22
  store i64 %78, i64* %arrayidx11.14, align 8, !tbaa !22
  %79 = load i64, i64* %arrayidx12.15, align 8, !tbaa !22
  store i64 %79, i64* %arrayidx12.14, align 8, !tbaa !22
  store i64 1, i64* %arrayidx.15, align 8, !tbaa !22
  store i64 0, i64* %arrayidx11.15, align 8, !tbaa !22
  store i64 0, i64* %arrayidx12.15, align 8, !tbaa !22
  %cmp125 = icmp eq i64 %mul133, %36
  br i1 %cmp125, label %land.rhs, label %while.end

while.end:                                        ; preds = %while.body, %land.rhs, %while.cond.preheader, %for.cond48.preheader
  %80 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 8 %80, i8* nonnull align 8 %0, i32 416, i1 false), !tbaa.struct !45
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.then45, %if.then
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %0) #9
  ret void
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %0 = load i64, i64* %flags.i.i, align 8, !tbaa !33
  %and.i.i = and i64 %0, 2
  %cmp.i.i = icmp eq i64 %and.i.i, 0
  br i1 %cmp.i.i, label %return, label %if.end

if.end:                                           ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %and.i.i46 = and i64 %0, 1
  %cmp.i.i47 = icmp eq i64 %and.i.i46, 0
  br i1 %cmp.i.i47, label %if.end9, label %return

if.end9:                                          ; preds = %if.end
  %cmp = icmp eq %struct.halide_device_interface_t* %1, null
  br i1 %cmp, label %return, label %if.end15

if.end15:                                         ; preds = %if.end9
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %copy_to_host = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 6
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_host, align 4, !tbaa !48
  %call16 = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.end23, label %return

if.end23:                                         ; preds = %if.end15
  %4 = load i64, i64* %flags.i.i, align 8, !tbaa !33
  %and.i.i44 = and i64 %4, -3
  store i64 %and.i.i44, i64* %flags.i.i, align 8, !tbaa !33
  tail call void @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  br label %return

return:                                           ; preds = %if.end23, %if.end15, %if.end9, %if.end, %entry
  %retval.2 = phi i32 [ 0, %entry ], [ 0, %if.end23 ], [ -14, %if.end ], [ -19, %if.end9 ], [ -14, %if.end15 ]
  ret i32 %retval.2
}

; Function Attrs: nounwind
define weak void @halide_device_release(i8* %user_context, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %device_release = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 5
  %1 = load i32 (i8*)*, i32 (i8*)** %device_release, align 4, !tbaa !50
  %call = tail call i32 %1(i8* %user_context) #11
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9.26, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  br label %cleanup

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) #12
  br label %cleanup

cleanup:                                          ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i.split
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %retval.0
}

; Function Attrs: nounwind
define linkonce i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10.27, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %if.end, label %cleanup

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i
  %cmp1 = icmp eq %struct.halide_device_interface_t* %device_interface, null
  br i1 %cmp1, label %if.then2, label %if.end11

if.then2:                                         ; preds = %if.end
  %device_interface5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %5 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface5, align 8, !tbaa !31
  %cmp6 = icmp eq %struct.halide_device_interface_t* %5, null
  br i1 %cmp6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.then2
  %call8 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %cleanup

if.end11:                                         ; preds = %if.then2, %if.end
  %device_interface.addr.0 = phi %struct.halide_device_interface_t* [ %device_interface, %if.end ], [ %5, %if.then2 ]
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %6 = load i64, i64* %device, align 8, !tbaa !29
  %tobool = icmp eq i64 %6, 0
  br i1 %tobool, label %if.then18, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end11
  %device_interface12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface12, align 8, !tbaa !31
  %cmp13 = icmp eq %struct.halide_device_interface_t* %7, %device_interface.addr.0
  br i1 %cmp13, label %if.end27, label %if.then14

if.then14:                                        ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.12.28, i32 0, i32 0)) #11
  br label %cleanup

if.then18:                                        ; preds = %if.end11
  %call19 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* nonnull %device_interface.addr.0) #12
  %cmp20 = icmp eq i32 %call19, 0
  br i1 %cmp20, label %if.end27, label %cleanup

if.end27:                                         ; preds = %if.then18, %land.lhs.true
  %flags.i.i85 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %8 = load i64, i64* %flags.i.i85, align 8, !tbaa !33
  %and.i.i86 = and i64 %8, 1
  %cmp.i.i87 = icmp eq i64 %and.i.i86, 0
  br i1 %cmp.i.i87, label %cleanup, label %if.then29

if.then29:                                        ; preds = %if.end27
  %and.i.i84 = and i64 %8, 2
  %cmp.i.i = icmp eq i64 %and.i.i84, 0
  br i1 %cmp.i.i, label %if.else, label %cleanup

if.else:                                          ; preds = %if.then29
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface.addr.0, i32 0, i32 15
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %copy_to_device = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 7
  %10 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_device, align 4, !tbaa !51
  %call40 = tail call i32 %10(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %cmp41 = icmp eq i32 %call40, 0
  br i1 %cmp41, label %if.then42, label %cleanup

if.then42:                                        ; preds = %if.else
  %11 = load i64, i64* %flags.i.i85, align 8, !tbaa !33
  %and.i.i = and i64 %11, -2
  store i64 %and.i.i, i64* %flags.i.i85, align 8, !tbaa !33
  br label %cleanup

cleanup:                                          ; preds = %if.then42, %if.else, %if.then29, %if.end27, %if.then18, %if.then14, %if.then7, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %call8, %if.then7 ], [ -42, %if.then14 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.then42 ], [ 0, %if.end27 ], [ %call19, %if.then18 ], [ -15, %if.then29 ], [ -15, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18.29, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp4 = icmp eq %struct.halide_device_interface_t* %5, null
  %cmp5 = icmp eq %struct.halide_device_interface_t* %5, %device_interface
  %or.cond = or i1 %cmp4, %cmp5
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.30, i32 0, i32 0)) #11
  br label %cleanup12

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 0
  %7 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %7() #11
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %device_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 2
  %9 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_malloc, align 4, !tbaa !53
  %call9 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i32 0, i32 1
  %11 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %11() #11
  %tobool = icmp eq i32 %call9, 0
  %selv = select i1 %tobool, i32 0, i32 -16
  br label %cleanup12

cleanup12:                                        ; preds = %if.end7, %if.then6, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then6 ], [ %selv, %if.end7 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %call = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) #12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_device_sync(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.17.31, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup8

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %5, null
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %cleanup8

if.end5:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %device_sync = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 4
  %7 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_sync, align 4, !tbaa !55
  %call6 = tail call i32 %7(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %tobool = icmp eq i32 %call6, 0
  %selv = select i1 %tobool, i32 0, i32 -17
  br label %cleanup8

cleanup8:                                         ; preds = %if.end5, %if.then3, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call4, %if.then3 ], [ %selv, %if.end5 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.32, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %5, null
  br i1 %cmp2, label %if.end11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 0
  %7 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %7() #11
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %device_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 3
  %9 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_free, align 4, !tbaa !56
  %call5 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i32 0, i32 1
  %11 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %11() #11
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %12 = load i64, i64* %device, align 8, !tbaa !29
  %cmp7 = icmp eq i64 %12, 0
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([137 x i8], [137 x i8]* @.str.22.33, i32 0, i32 0)) #11
  tail call void @abort() #11
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.then3
  %tobool = icmp eq i32 %call5, 0
  %selv = select i1 %tobool, i32 0, i32 -18
  br label %cleanup12

if.end11:                                         ; preds = %if.end
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %13 = load i64, i64* %flags.i.i, align 8, !tbaa !33
  %and.i.i = and i64 %13, -3
  store i64 %and.i.i, i64* %flags.i.i, align 8, !tbaa !33
  br label %cleanup12

cleanup12:                                        ; preds = %if.end11, %if.end9, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %selv, %if.end9 ], [ 0, %if.end11 ]
  ret i32 %retval.1
}

declare void @abort() local_unnamed_addr #2

; Function Attrs: nounwind
define weak void @halide_device_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %0) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.34, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup14

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %use_host_ptr_extension = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 4
  %cmp4 = icmp eq %struct.halide_device_interface_t* %5, null
  %cmp5 = icmp eq %struct.halide_device_interface_t* %5, %device_interface
  %or.cond = or i1 %cmp4, %cmp5
  %6 = bitcast i64* %use_host_ptr_extension to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %6, i8 0, i64 24, i1 false)
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25, i32 0, i32 0)) #11
  br label %cleanup14

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 0
  %8 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %8() #11
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %device_and_host_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 8
  %10 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_malloc, align 4, !tbaa !57
  %call9 = tail call i32 %10(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %11 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %11, i32 0, i32 1
  %12 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %12() #11
  %cmp11 = icmp eq i32 %call9, 0
  br i1 %cmp11, label %cleanup14, label %if.then12

if.then12:                                        ; preds = %if.end7
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26, i32 0, i32 0)) #11
  br label %cleanup14

cleanup14:                                        ; preds = %if.then12, %if.end7, %if.then6, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then6 ], [ -16, %if.then12 ], [ 0, %if.end7 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup18

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %5, null
  br i1 %cmp2, label %if.else11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 0
  %7 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %7() #11
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %device_and_host_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 9
  %9 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_free, align 4, !tbaa !58
  %call5 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i32 0, i32 1
  %11 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %11() #11
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %12 = load i64, i64* %device, align 8, !tbaa !29
  %cmp7 = icmp eq i64 %12, 0
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([137 x i8], [137 x i8]* @.str.28, i32 0, i32 0)) #11
  tail call void @abort() #11
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.then3
  %tobool = icmp eq i32 %call5, 0
  %selv = select i1 %tobool, i32 0, i32 -18
  br label %cleanup18

if.else11:                                        ; preds = %if.end
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %13 = load i8*, i8** %host, align 4, !tbaa !32
  %tobool12 = icmp eq i8* %13, null
  br i1 %tobool12, label %if.end17, label %if.then13

if.then13:                                        ; preds = %if.else11
  tail call void @halide_free(i8* %user_context, i8* nonnull %13) #11
  store i8* null, i8** %host, align 4, !tbaa !32
  br label %if.end17

if.end17:                                         ; preds = %if.then13, %if.else11
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %14 = load i64, i64* %flags.i.i, align 8, !tbaa !33
  %and.i.i = and i64 %14, -3
  store i64 %and.i.i, i64* %flags.i.i, align 8, !tbaa !33
  br label %cleanup18

cleanup18:                                        ; preds = %if.end17, %if.end9, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %selv, %if.end9 ], [ 0, %if.end17 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %if.end, label %cleanup13

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i
  %dimensions.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 8
  %5 = load i32, i32* %dimensions.i.i, align 4, !tbaa !34
  %cmp18.i.i = icmp sgt i32 %5, 0
  br i1 %cmp18.i.i, label %for.body.lr.ph.i.i, label %_ZNK15halide_buffer_t3endEv.exit.thread.i

_ZNK15halide_buffer_t3endEv.exit.thread.i:        ; preds = %if.end
  %bits.i.i27.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 7, i32 1
  %6 = load i8, i8* %bits.i.i27.i, align 1, !tbaa !27
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.lr.ph.i.i:                               ; preds = %if.end
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 9
  %7 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8, !tbaa !35
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.inc.i.i, %for.body.lr.ph.i.i
  %i.020.i.i = phi i32 [ 0, %for.body.lr.ph.i.i ], [ %inc.i.i, %for.inc.i.i ]
  %index.019.i.i = phi i32 [ 0, %for.body.lr.ph.i.i ], [ %index.1.i.i, %for.inc.i.i ]
  %stride.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 %i.020.i.i, i32 2
  %8 = load i32, i32* %stride.i.i, align 4, !tbaa !39
  %cmp2.i.i = icmp sgt i32 %8, 0
  br i1 %cmp2.i.i, label %if.then.i.i, label %for.inc.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 %i.020.i.i, i32 1
  %9 = load i32, i32* %extent.i.i, align 4, !tbaa !38
  %sub.i.i = add nsw i32 %9, -1
  %mul.i.i = mul nsw i32 %sub.i.i, %8
  %add.i.i = add nsw i32 %mul.i.i, %index.019.i.i
  br label %for.inc.i.i

for.inc.i.i:                                      ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i32 [ %add.i.i, %if.then.i.i ], [ %index.019.i.i, %for.body.i.i ]
  %inc.i.i = add nuw nsw i32 %i.020.i.i, 1
  %exitcond1 = icmp eq i32 %inc.i.i, %5
  br i1 %exitcond1, label %for.body.lr.ph.i5.i, label %for.body.i.i

for.body.lr.ph.i5.i:                              ; preds = %for.inc.i.i
  %bits.i.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 7, i32 1
  %10 = load i8, i8* %bits.i.i.i, align 1, !tbaa !27
  br label %for.body.i15.i

for.body.i15.i:                                   ; preds = %for.inc.i24.i, %for.body.lr.ph.i5.i
  %i.018.i.i = phi i32 [ 0, %for.body.lr.ph.i5.i ], [ %inc.i22.i, %for.inc.i24.i ]
  %index.017.i.i = phi i32 [ 0, %for.body.lr.ph.i5.i ], [ %index.1.i21.i, %for.inc.i24.i ]
  %stride.i13.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 %i.018.i.i, i32 2
  %11 = load i32, i32* %stride.i13.i, align 4, !tbaa !39
  %cmp2.i14.i = icmp slt i32 %11, 0
  br i1 %cmp2.i14.i, label %if.then.i20.i, label %for.inc.i24.i

if.then.i20.i:                                    ; preds = %for.body.i15.i
  %extent.i16.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 %i.018.i.i, i32 1
  %12 = load i32, i32* %extent.i16.i, align 4, !tbaa !38
  %sub.i17.i = add nsw i32 %12, -1
  %mul.i18.i = mul nsw i32 %sub.i17.i, %11
  %add.i19.i = add nsw i32 %mul.i18.i, %index.017.i.i
  br label %for.inc.i24.i

for.inc.i24.i:                                    ; preds = %if.then.i20.i, %for.body.i15.i
  %index.1.i21.i = phi i32 [ %add.i19.i, %if.then.i20.i ], [ %index.017.i.i, %for.body.i15.i ]
  %inc.i22.i = add nuw nsw i32 %i.018.i.i, 1
  %exitcond = icmp eq i32 %inc.i22.i, %5
  br i1 %exitcond, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i15.i

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %for.inc.i24.i
  %add8.i.i = add nsw i32 %index.1.i.i, 1
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, %_ZNK15halide_buffer_t3endEv.exit.thread.i
  %div.i.i32.i.in.in.in = phi i8 [ %6, %_ZNK15halide_buffer_t3endEv.exit.thread.i ], [ %10, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %add8.i31.i = phi i32 [ 1, %_ZNK15halide_buffer_t3endEv.exit.thread.i ], [ %add8.i.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %index.0.lcssa.i6.i = phi i32 [ 0, %_ZNK15halide_buffer_t3endEv.exit.thread.i ], [ %index.1.i21.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %div.i.i32.i.in.in = zext i8 %div.i.i32.i.in.in.in to i32
  %div.i.i32.i.in = add nuw nsw i32 %div.i.i32.i.in.in, 7
  %div.i.i32.i = lshr i32 %div.i.i32.i.in, 3
  %mul8.i25.i = sub i32 %add8.i31.i, %index.0.lcssa.i6.i
  %13 = mul i32 %mul8.i25.i, %div.i.i32.i
  %call2 = tail call i8* @halide_malloc(i8* %user_context, i32 %13) #11
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  store i8* %call2, i8** %host, align 4, !tbaa !32
  %cmp4 = icmp eq i8* %call2, null
  br i1 %cmp4, label %cleanup13, label %if.end6

if.end6:                                          ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %call7 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* %device_interface) #12
  %cmp8 = icmp eq i32 %call7, 0
  br i1 %cmp8, label %cleanup13, label %if.then9

if.then9:                                         ; preds = %if.end6
  %14 = load i8*, i8** %host, align 4, !tbaa !32
  tail call void @halide_free(i8* %user_context, i8* %14) #11
  store i8* null, i8** %host, align 4, !tbaa !32
  br label %cleanup13

cleanup13:                                        ; preds = %if.then9, %if.end6, %_ZNK15halide_buffer_t13size_in_bytesEv.exit, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -1, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ], [ %call7, %if.then9 ], [ 0, %if.end6 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #12
  br label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) #12
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %if.end16.i.split
  %phi.call = phi i32 [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %5 = load i8*, i8** %host, align 4, !tbaa !32
  %tobool = icmp eq i8* %5, null
  br i1 %tobool, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @halide_free(i8* %user_context, i8* nonnull %5) #11
  store i8* null, i8** %host, align 4, !tbaa !32
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %6 = load i64, i64* %flags.i.i, align 8, !tbaa !33
  %and.i.i19 = and i64 %6, -4
  store i64 %and.i.i19, i64* %flags.i.i, align 8, !tbaa !33
  br label %cleanup

cleanup:                                          ; preds = %if.end5, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %phi.call, %if.end5 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_wrap_native(i8* %user_context, %struct.halide_buffer_t* %buf, i64 %handle, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %5, null
  %cmp3 = icmp eq %struct.halide_device_interface_t* %5, %device_interface
  %or.cond = or i1 %cmp2, %cmp3
  br i1 %or.cond, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32, i32 0, i32 0)) #11
  br label %cleanup12

if.end5:                                          ; preds = %if.end
  %device_interface1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 0
  %7 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %7() #11
  store %struct.halide_device_interface_t* %device_interface, %struct.halide_device_interface_t** %device_interface1, align 8, !tbaa !31
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %wrap_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 14
  %9 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %wrap_native, align 4, !tbaa !59
  %call8 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, i64 %handle) #11
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i32 0, i32 1
  %11 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %11() #11
  %tobool = icmp eq i32 %call8, 0
  %selv = select i1 %tobool, i32 0, i32 -16
  br label %cleanup12

cleanup12:                                        ; preds = %if.end5, %if.then4, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then4 ], [ %selv, %if.end5 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_device_detach_native(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %5, null
  br i1 %cmp2, label %cleanup, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 0
  %7 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %7() #11
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %detach_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 15
  %9 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %detach_native, align 4, !tbaa !60
  %call5 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i32 0, i32 1
  %11 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %11() #11
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %12 = load i64, i64* %device, align 8, !tbaa !29
  %cmp7 = icmp eq i64 %12, 0
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([137 x i8], [137 x i8]* @.str.34, i32 0, i32 0)) #11
  tail call void @abort() #11
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.then3
  %tobool = icmp eq i32 %call5, 0
  %spec.select = select i1 %tobool, i32 0, i32 -33
  ret i32 %spec.select

cleanup:                                          ; preds = %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.2.i27 = phi i32 [ 0, %if.end ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ]
  ret i32 %retval.2.i27
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_wrap_native(i8* %user_context, %struct.halide_buffer_t* %buf, i64 %handle) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.35, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.phi.trans.insert, align 8, !tbaa !31
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 0
  %7 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %7() #11
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  store i64 %handle, i64* %device, align 8, !tbaa !29
  br label %cleanup

cleanup:                                          ; preds = %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ 0, %if.end ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_detach_native(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.36, i32 0, i32 0)) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !31
  %cmp4.i = icmp ne %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !29
  %cmp5.i = icmp ne i64 %1, 0
  %cmp5.not.i = xor i1 %cmp5.i, true
  %brmerge.i = or i1 %cmp4.i, %cmp5.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp4.not.i = xor i1 %cmp4.i, true
  %brmerge44.i = or i1 %cmp5.i, %cmp4.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !33
  %3 = and i64 %2, 3
  %4 = icmp eq i64 %3, 3
  br i1 %4, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #11
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp = icmp eq i32 %retval.2.i, 0
  br i1 %cmp, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %.pre = load i64, i64* %device.phi.trans.insert, align 8, !tbaa !29
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %5 = phi i64 [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %1, %if.end16.i ]
  %cmp1 = icmp eq i64 %5, 0
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %6, i32 0, i32 15
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 1
  %8 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %8() #11
  store i64 0, i64* %device, align 8, !tbaa !29
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  br label %cleanup

cleanup:                                          ; preds = %if.end3, %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ 0, %if.end3 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak void @halide_device_and_host_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %0) #12
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_device_host_nop_free(i8* %user_context, i8* %obj) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind
define weak i32 @halide_default_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #3 {
entry:
  ret i32 -39
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  %c = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %tobool = icmp ne %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %tobool1 = icmp eq %struct.halide_device_interface_t* %0, null
  %cmp = icmp eq %struct.halide_device_interface_t* %0, %dst_device_interface
  %or.cond = or i1 %tobool1, %cmp
  br i1 %or.cond, label %land.lhs.true5, label %if.then

if.then:                                          ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.42, i32 0, i32 0)) #11
  br label %cleanup135

land.lhs.true5:                                   ; preds = %land.lhs.true
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device, align 8, !tbaa !29
  %tobool6 = icmp eq i64 %1, 0
  br i1 %tobool6, label %if.then7, label %if.end13

if.then7:                                         ; preds = %land.lhs.true5
  %call = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #12
  %tobool10 = icmp eq i32 %call, 0
  br i1 %tobool10, label %if.end13, label %cleanup135

if.end13:                                         ; preds = %if.then7, %land.lhs.true5, %entry
  %device14 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %2 = load i64, i64* %device14, align 8, !tbaa !29
  %cmp15 = icmp eq i64 %2, 0
  %host22.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 2
  %.pre = load i8*, i8** %host22.phi.trans.insert, align 4, !tbaa !32
  br i1 %cmp15, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.end13
  %cmp16 = icmp eq i8* %.pre, null
  br i1 %cmp16, label %land.end.thread258, label %land.end.thread

land.end.thread258:                               ; preds = %land.rhs
  %cmp20259 = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br label %land.end32

land.end.thread:                                  ; preds = %land.rhs
  %flags.i.i241 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %3 = load i64, i64* %flags.i.i241, align 8, !tbaa !33
  %and.i.i242 = and i64 %3, 1
  %cmp.i.i = icmp ne i64 %and.i.i242, 0
  %cmp20252 = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br label %land.rhs26

land.end:                                         ; preds = %if.end13
  %cmp20 = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  %cmp23 = icmp eq i8* %.pre, null
  br i1 %cmp23, label %land.end32, label %land.end.land.rhs26_crit_edge

land.end.land.rhs26_crit_edge:                    ; preds = %land.end
  %flags.i.i246.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %.pre1 = load i64, i64* %flags.i.i246.phi.trans.insert, align 8, !tbaa !33
  br label %land.rhs26

land.rhs26:                                       ; preds = %land.end.land.rhs26_crit_edge, %land.end.thread
  %4 = phi i64 [ %3, %land.end.thread ], [ %.pre1, %land.end.land.rhs26_crit_edge ]
  %cmp20255 = phi i1 [ %cmp20252, %land.end.thread ], [ %cmp20, %land.end.land.rhs26_crit_edge ]
  %5 = phi i1 [ %cmp.i.i, %land.end.thread ], [ true, %land.end.land.rhs26_crit_edge ]
  %and.i.i247 = and i64 %4, 2
  %cmp.i.i248 = icmp eq i64 %and.i.i247, 0
  br i1 %cmp.i.i248, label %land.end32, label %lor.rhs28

lor.rhs28:                                        ; preds = %land.rhs26
  %device_interface29 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface29, align 8, !tbaa !31
  %cmp30 = icmp ne %struct.halide_device_interface_t* %6, null
  br label %land.end32

land.end32:                                       ; preds = %lor.rhs28, %land.rhs26, %land.end, %land.end.thread258
  %cmp23256 = phi i1 [ false, %land.end ], [ true, %land.rhs26 ], [ true, %lor.rhs28 ], [ false, %land.end.thread258 ]
  %cmp20254 = phi i1 [ %cmp20, %land.end ], [ %cmp20255, %land.rhs26 ], [ %cmp20255, %lor.rhs28 ], [ %cmp20259, %land.end.thread258 ]
  %7 = phi i1 [ true, %land.end ], [ %5, %land.rhs26 ], [ %5, %lor.rhs28 ], [ false, %land.end.thread258 ]
  %8 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ %cmp30, %lor.rhs28 ], [ true, %land.end.thread258 ]
  %host34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 2
  %9 = load i8*, i8** %host34, align 4, !tbaa !32
  %cmp35 = icmp ne i8* %9, null
  %cmp20.not = xor i1 %cmp20254, true
  %brmerge = or i1 %cmp35, %cmp20.not
  br i1 %brmerge, label %if.end41, label %cleanup135

if.end41:                                         ; preds = %land.end32
  %tobool.not = xor i1 %tobool, true
  %brmerge228 = or i1 %7, %tobool.not
  br i1 %brmerge228, label %if.then51, label %if.end49

if.end49:                                         ; preds = %if.end41
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %buffer_copy = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i32 0, i32 10
  %11 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy, align 4, !tbaa !61
  %call48 = tail call i32 %11(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #11
  %cmp50 = icmp eq i32 %call48, -42
  br i1 %cmp50, label %if.then51, label %if.end109

if.then51:                                        ; preds = %if.end49, %if.end41
  %brmerge229 = or i1 %cmp23256, %cmp35
  br i1 %brmerge229, label %if.end58, label %cleanup135

if.end58:                                         ; preds = %if.then51
  %brmerge232 = or i1 %8, %cmp20.not
  br i1 %brmerge232, label %if.else, label %if.end109.thread223

if.end109.thread223:                              ; preds = %if.end58
  %12 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %12) #9
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret %c, %struct.halide_buffer_t* nonnull %src, i1 zeroext true, %struct.halide_buffer_t* nonnull %dst, i1 zeroext true) #12
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %c, i8* %user_context) #12
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %12) #9
  br label %land.lhs.true118

if.else:                                          ; preds = %if.end58
  br i1 %cmp20254, label %if.then64, label %if.else79

if.then64:                                        ; preds = %if.else
  %device_interface67 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %13 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface67, align 8, !tbaa !31
  %impl68 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %13, i32 0, i32 15
  %14 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl68, align 4, !tbaa !46
  %buffer_copy69 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %14, i32 0, i32 10
  %15 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy69, align 4, !tbaa !61
  %call70 = tail call i32 %15(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #11
  %cmp71 = icmp eq i32 %call70, -42
  br i1 %cmp71, label %if.then72, label %if.end109

if.then72:                                        ; preds = %if.then64
  %call73 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #12
  %tobool74 = icmp eq i32 %call73, 0
  br i1 %tobool74, label %if.then75, label %cleanup135

if.then75:                                        ; preds = %if.then72
  %call76 = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #12
  br label %if.end109

if.else79:                                        ; preds = %if.else
  %cmp35.not = xor i1 %cmp35, true
  %brmerge234 = or i1 %7, %cmp35.not
  br i1 %brmerge234, label %if.else96, label %if.then83

if.then83:                                        ; preds = %if.else79
  %device_interface88 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %16 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface88, align 8, !tbaa !31
  %impl89 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %16, i32 0, i32 15
  %17 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl89, align 4, !tbaa !46
  %buffer_copy90 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %17, i32 0, i32 10
  %18 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy90, align 4, !tbaa !61
  %call91 = tail call i32 %18(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #11
  %cmp92 = icmp eq i32 %call91, 0
  br i1 %cmp92, label %if.then93, label %cleanup135

if.then93:                                        ; preds = %if.then83
  %flags.i.i243 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %19 = load i64, i64* %flags.i.i243, align 8, !tbaa !33
  %or.i.i244 = or i64 %19, 1
  store i64 %or.i.i244, i64* %flags.i.i243, align 8, !tbaa !33
  %call94 = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #12
  br label %if.end109

if.else96:                                        ; preds = %if.else79
  %call99 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #12
  %cmp100 = icmp eq i32 %call99, 0
  br i1 %cmp100, label %if.then101, label %cleanup135

if.then101:                                       ; preds = %if.else96
  %impl102 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %20 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl102, align 4, !tbaa !46
  %buffer_copy103 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %20, i32 0, i32 10
  %21 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy103, align 4, !tbaa !61
  %call104 = tail call i32 %21(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #11
  br label %if.end109

if.end109:                                        ; preds = %if.then101, %if.then93, %if.then75, %if.then64, %if.end49
  %err.1 = phi i32 [ %call76, %if.then75 ], [ %call70, %if.then64 ], [ %call94, %if.then93 ], [ %call104, %if.then101 ], [ %call48, %if.end49 ]
  %cmp110 = icmp eq i32 %err.1, 0
  br i1 %cmp110, label %land.lhs.true118, label %cleanup135

land.lhs.true118:                                 ; preds = %if.end109, %if.end109.thread223
  %cmp119 = icmp eq %struct.halide_buffer_t* %dst, %src
  br i1 %cmp119, label %cleanup135, label %if.then120

if.then120:                                       ; preds = %land.lhs.true118
  %flags.i.i238 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %22 = load i64, i64* %flags.i.i238, align 8, !tbaa !33
  %and.i.i240 = and i64 %22, -4
  %selv.v = select i1 %tobool, i64 2, i64 1
  %selv = or i64 %and.i.i240, %selv.v
  store i64 %selv, i64* %flags.i.i238, align 8, !tbaa !33
  br label %cleanup135

cleanup135:                                       ; preds = %if.then120, %land.lhs.true118, %if.end109, %if.else96, %if.then83, %if.then72, %if.then51, %land.end32, %if.then7, %if.then
  %retval.1 = phi i32 [ -42, %if.then ], [ %call, %if.then7 ], [ 0, %land.lhs.true118 ], [ -34, %land.end32 ], [ -42, %if.then51 ], [ %err.1, %if.end109 ], [ %call99, %if.else96 ], [ %call91, %if.then83 ], [ %call73, %if.then72 ], [ 0, %if.then120 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %tobool = icmp ne %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 0
  %1 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %1() #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %2 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %tobool11 = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %tobool11, label %if.end16, label %if.then12

if.then12:                                        ; preds = %if.end
  %impl14 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i32 0, i32 15
  %3 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl14, align 4, !tbaa !46
  %use_module15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %3, i32 0, i32 0
  %4 = load void ()*, void ()** %use_module15, align 4, !tbaa !52
  tail call void %4() #11
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end
  %call = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) #12
  br i1 %tobool, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.end16
  %impl19 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl19, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 1
  %6 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %6() #11
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end16
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %tobool22 = icmp eq %struct.halide_device_interface_t* %7, null
  br i1 %tobool22, label %if.end27, label %if.then23

if.then23:                                        ; preds = %if.end20
  %impl25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl25, align 4, !tbaa !46
  %release_module26 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 1
  %9 = load void ()*, void ()** %release_module26, align 4, !tbaa !54
  tail call void %9() #11
  br label %if.end27

if.end27:                                         ; preds = %if.then23, %if.end20
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #11
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i32 0, i32 0)) #11
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !29
  %tobool = icmp eq i64 %0, 0
  br i1 %tobool, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !29
  %tobool2 = icmp eq i64 %1, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #11
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 8
  %2 = load i32, i32* %dimensions, align 4, !tbaa !34
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 8
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !34
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i32 0, i32 0)) #11
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %6() #11
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !46
  %device_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 11
  %9 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %device_crop, align 4, !tbaa !62
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_buffer_t* nonnull %dst) #11
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !29
  %tobool = icmp eq i64 %0, 0
  br i1 %tobool, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !29
  %tobool2 = icmp eq i64 %1, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #11
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 8
  %2 = load i32, i32* %dimensions, align 4, !tbaa !34
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 8
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !34
  %add = add nsw i32 %3, 1
  %cmp = icmp eq i32 %2, %add
  br i1 %cmp, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i32 0, i32 0)) #11
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !52
  tail call void %6() #11
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !46
  %device_slice = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 12
  %9 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %device_slice, align 4, !tbaa !63
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* nonnull %dst) #11
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !29
  %tobool = icmp eq i64 %0, 0
  br i1 %tobool, label %return, label %if.end

if.end:                                           ; preds = %entry
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #11
  br label %return

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ -40, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !29
  %tobool = icmp eq i64 %0, 0
  br i1 %tobool, label %return, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %device_release_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 13
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_release_crop, align 4, !tbaa !64
  %call = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #11
  store i64 0, i64* %device, align 8, !tbaa !29
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !46
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i32 0, i32 1
  %5 = load void ()*, void ()** %release_module, align 4, !tbaa !54
  tail call void %5() #11
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !31
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #11
  br label %return

return:                                           ; preds = %if.then, %entry
  %retval.0 = phi i32 [ %call, %if.then ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak float @halide_float16_bits_to_float(i16 zeroext %bits) local_unnamed_addr #0 {
entry:
  %conv = zext i16 %bits to i32
  %and = shl nuw i32 %conv, 16
  %shl = and i32 %and, -2147483648
  %and2 = and i32 %conv, 1023
  %and4 = lshr i32 %conv, 10
  %0 = and i32 %and4, 31
  %cmp = icmp eq i32 %0, 0
  %cmp5 = icmp ne i32 %and2, 0
  %or.cond = and i1 %cmp5, %cmp
  br i1 %or.cond, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = tail call i32 @llvm.ctlz.i32(i32 %and2, i1 true), !range !65
  %sub6 = xor i32 %1, 31
  %shl7 = shl i32 1, %sub6
  %neg = xor i32 %shl7, -1
  %and8 = and i32 %and2, %neg
  %sub9 = sub nsw i32 23, %sub6
  %shl10 = shl i32 %and8, %sub9
  %add11 = shl nuw nsw i32 %sub6, 23
  %shl12 = add nuw nsw i32 %add11, 864026624
  br label %if.end28

if.else:                                          ; preds = %entry
  %shl14 = shl nuw nsw i32 %and2, 13
  br i1 %cmp, label %if.end28, label %if.else18

if.else18:                                        ; preds = %if.else
  %cmp19 = icmp eq i32 %0, 31
  %add22 = shl nuw nsw i32 %0, 23
  %add22.op = add nuw nsw i32 %add22, 939524096
  %phitmp = select i1 %cmp19, i32 2139095040, i32 %add22.op
  br label %if.end28

if.end28:                                         ; preds = %if.else18, %if.else, %if.then
  %shl14.sink = phi i32 [ %shl12, %if.then ], [ %shl14, %if.else ], [ %shl14, %if.else18 ]
  %reEncodedExponent15.0.sink = phi i32 [ %shl10, %if.then ], [ 0, %if.else ], [ %phitmp, %if.else18 ]
  %or25 = or i32 %shl14.sink, %shl
  %or26 = or i32 %or25, %reEncodedExponent15.0.sink
  %2 = bitcast i32 %or26 to float
  ret float %2
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.ctlz.i32(i32, i1) #6

; Function Attrs: nounwind
define weak double @halide_float16_bits_to_double(i16 zeroext %bits) local_unnamed_addr #0 {
entry:
  %call = tail call float @halide_float16_bits_to_float(i16 zeroext %bits) #12
  %conv = fpext float %call to double
  ret double %conv
}

; Function Attrs: norecurse nounwind
define weak i32 @halide_error_check_fault_and_return(i8* %user_context, i32 %err_code) local_unnamed_addr #3 {
entry:
  %sub = sub nsw i32 0, %err_code
  %shl = shl i32 1, %sub
  %conv = sext i32 %shl to i64
  %0 = load i64, i64* @halide_error_mask, align 8, !tbaa !22
  %and = and i64 %0, %conv
  %tobool = icmp eq i64 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store volatile i32 -559038737, i32* null, align 536870912, !tbaa !10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 %err_code
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.37, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.37, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.13.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %extern_stage_name, null
  br i1 %cmp.i, label %if.then.i11, label %if.else.i13

if.then.i11:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i13:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* nonnull %extern_stage_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i13, %if.then.i11
  %storemerge.i = phi i8* [ %call5.i12, %if.else.i13 ], [ %call.i10, %if.then.i11 ]
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.13.0, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.38, i32 0, i32 0)) #11
  %conv.i = sext i32 %result to i64
  %call.i21 = tail call i8* @halide_int64_to_string(i8* %call5.i16, i8* %ref.tmp.sroa.13.0, i64 %conv.i, i32 1) #11
  br i1 %tobool5.i, label %if.then.i24, label %if.else.i25

if.then.i24:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i25:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i21 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i25, %if.then.i24
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.39, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.39, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.13.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %extern_stage_name, null
  br i1 %cmp.i, label %if.then.i11, label %if.else.i13

if.then.i11:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i13:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* nonnull %extern_stage_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i13, %if.then.i11
  %storemerge.i = phi i8* [ %call5.i12, %if.else.i13 ], [ %call.i10, %if.then.i11 ]
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.13.0, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.38, i32 0, i32 0)) #11
  %conv.i = sext i32 %result to i64
  %call.i21 = tail call i8* @halide_int64_to_string(i8* %call5.i16, i8* %ref.tmp.sroa.13.0, i64 %conv.i, i32 1) #11
  br i1 %tobool5.i, label %if.then.i24, label %if.else.i25

if.then.i24:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i25:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i21 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i25, %if.then.i24
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %min_bound, i32 %max_bound, i32 %min_required, i32 %max_required) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.40, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.40, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %var_name, null
  br i1 %cmp.i, label %if.then.i21, label %if.else.i23

if.then.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i20 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i23:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i22 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* nonnull %var_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i23, %if.then.i21
  %storemerge.i = phi i8* [ %call5.i22, %if.else.i23 ], [ %call.i20, %if.then.i21 ]
  %call5.i26 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.41, i32 0, i32 0)) #11
  %cmp.i29 = icmp eq i8* %func_name, null
  br i1 %cmp.i29, label %if.then.i33, label %if.else.i35

if.then.i33:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i32 = tail call i8* @halide_string_to_string(i8* %call5.i26, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit37

if.else.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i34 = tail call i8* @halide_string_to_string(i8* %call5.i26, i8* %ref.tmp.sroa.22.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit37

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit37: ; preds = %if.else.i35, %if.then.i33
  %storemerge.i36 = phi i8* [ %call5.i34, %if.else.i35 ], [ %call.i32, %if.then.i33 ]
  %call5.i40 = tail call i8* @halide_string_to_string(i8* %storemerge.i36, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.42, i32 0, i32 0)) #11
  %conv.i = sext i32 %min_bound to i64
  %call.i45 = tail call i8* @halide_int64_to_string(i8* %call5.i40, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #11
  %call5.i48 = tail call i8* @halide_string_to_string(i8* %call.i45, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #11
  %conv.i53 = sext i32 %max_bound to i64
  %call.i54 = tail call i8* @halide_int64_to_string(i8* %call5.i48, i8* %ref.tmp.sroa.22.0, i64 %conv.i53, i32 1) #11
  %call5.i57 = tail call i8* @halide_string_to_string(i8* %call.i54, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.44, i32 0, i32 0)) #11
  %conv.i62 = sext i32 %min_required to i64
  %call.i63 = tail call i8* @halide_int64_to_string(i8* %call5.i57, i8* %ref.tmp.sroa.22.0, i64 %conv.i62, i32 1) #11
  %call5.i66 = tail call i8* @halide_string_to_string(i8* %call.i63, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #11
  %conv.i71 = sext i32 %max_required to i64
  %call.i72 = tail call i8* @halide_int64_to_string(i8* %call5.i66, i8* %ref.tmp.sroa.22.0, i64 %conv.i71, i32 1) #11
  %call5.i75 = tail call i8* @halide_string_to_string(i8* %call.i72, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.94, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i80, label %if.else.i81

if.then.i80:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit37
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i81:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit37
  %1 = ptrtoint i8* %call5.i75 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i81, %if.then.i80
  %call13 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -2) #12
  ret i32 %call13
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_type(i8* %user_context, i8* %func_name, i8 zeroext %code_given, i8 zeroext %correct_code, i8 zeroext %bits_given, i8 zeroext %correct_bits, i16 zeroext %lanes_given, i16 zeroext %correct_lanes) local_unnamed_addr #0 {
entry:
  %correct_type = alloca %struct.halide_type_t, align 2
  %type_given = alloca %struct.halide_type_t, align 2
  %0 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #9
  store i8 %correct_code, i8* %0, align 2, !tbaa !24
  %bits3.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 1
  store i8 %correct_bits, i8* %bits3.i, align 1, !tbaa !27
  %lanes4.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 2
  store i16 %correct_lanes, i16* %lanes4.i, align 2, !tbaa !28
  %1 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #9
  store i8 %code_given, i8* %1, align 2, !tbaa !24
  %bits3.i9 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 1
  store i8 %bits_given, i8* %bits3.i9, align 1, !tbaa !27
  %lanes4.i10 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 2
  store i16 %lanes_given, i16* %lanes4.i10, align 2, !tbaa !28
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %2 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit, label %if.then.i14

if.then.i14:                                      ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i14, %entry
  %ref.tmp.sroa.14.0 = phi i8* [ %add.ptr.i, %if.then.i14 ], [ null, %entry ]
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i20, label %if.else.i21

if.then.i20:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i = tail call i8* @halide_string_to_string(i8* %call.i, i8* %ref.tmp.sroa.14.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i21, %if.then.i20
  %storemerge.i = phi i8* [ %call5.i, %if.else.i21 ], [ %call.i19, %if.then.i20 ]
  %call5.i25 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.14.0, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.46, i32 0, i32 0)) #11
  %call.i31 = call i8* @halide_type_to_string(i8* %call5.i25, i8* %ref.tmp.sroa.14.0, %struct.halide_type_t* nonnull %correct_type) #11
  %call5.i34 = call i8* @halide_string_to_string(i8* %call.i31, i8* %ref.tmp.sroa.14.0, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.47, i32 0, i32 0)) #11
  %call.i40 = call i8* @halide_type_to_string(i8* %call5.i34, i8* %ref.tmp.sroa.14.0, %struct.halide_type_t* nonnull %type_given) #11
  br i1 %tobool5.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %3 = ptrtoint i8* %call.i40 to i32
  %sub.ptr.sub.i.i = sub i32 1, %2
  %add.i.i = add i32 %sub.ptr.sub.i.i, %3
  %conv.i.i = sext i32 %add.i.i to i64
  call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  %call6 = call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -3) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #9
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %user_context, i8* %func_name, i32 %dimensions_given, i32 %correct_dimensions) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry
  %ref.tmp.sroa.15.0 = phi i8* [ %add.ptr.i, %if.then.i ], [ null, %entry ]
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i11, label %if.else.i12

if.then.i11:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i10 = tail call i8* @halide_string_to_string(i8* %call.i, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i12:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i = tail call i8* @halide_string_to_string(i8* %call.i, i8* %ref.tmp.sroa.15.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i12, %if.then.i11
  %storemerge.i = phi i8* [ %call5.i, %if.else.i12 ], [ %call.i10, %if.then.i11 ]
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.48, i32 0, i32 0)) #11
  %conv.i = sext i32 %correct_dimensions to i64
  %call.i20 = tail call i8* @halide_int64_to_string(i8* %call5.i15, i8* %ref.tmp.sroa.15.0, i64 %conv.i, i32 1) #11
  %call5.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.49, i32 0, i32 0)) #11
  %conv.i28 = sext i32 %dimensions_given to i64
  %call.i29 = tail call i8* @halide_int64_to_string(i8* %call5.i23, i8* %ref.tmp.sroa.15.0, i64 %conv.i28, i32 1) #11
  %call5.i32 = tail call i8* @halide_string_to_string(i8* %call.i29, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.50, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i37, label %if.else.i38

if.then.i37:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i38:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i38, %if.then.i37
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -43) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %user_context, i8* %func_name, i32 %dimension, i32 %min_touched, i32 %max_touched, i32 %min_valid, i32 %max_valid) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %min_touched, %min_valid
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit, label %if.then.i

if.then.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %if.then
  %ref.tmp.sroa.16.0 = phi i8* [ %add.ptr.i, %if.then.i ], [ null, %if.then ]
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i30, label %if.else.i31

if.then.i30:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i = tail call i8* @halide_string_to_string(i8* %call.i, i8* %ref.tmp.sroa.16.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i31, %if.then.i30
  %storemerge.i = phi i8* [ %call5.i, %if.else.i31 ], [ %call.i29, %if.then.i30 ]
  %call5.i34 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.51, i32 0, i32 0)) #11
  %conv.i = sext i32 %min_touched to i64
  %call.i39 = tail call i8* @halide_int64_to_string(i8* %call5.i34, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #11
  %call5.i42 = tail call i8* @halide_string_to_string(i8* %call.i39, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.52, i32 0, i32 0)) #11
  %conv.i47 = sext i32 %min_valid to i64
  %call.i48 = tail call i8* @halide_int64_to_string(i8* %call5.i42, i8* %ref.tmp.sroa.16.0, i64 %conv.i47, i32 1) #11
  %call5.i51 = tail call i8* @halide_string_to_string(i8* %call.i48, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.53, i32 0, i32 0)) #11
  %conv.i56 = sext i32 %dimension to i64
  %call.i57 = tail call i8* @halide_int64_to_string(i8* %call5.i51, i8* %ref.tmp.sroa.16.0, i64 %conv.i56, i32 1) #11
  br i1 %tobool5.i, label %if.then.i60, label %if.else.i61

if.then.i60:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %if.end17

if.else.i61:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i57 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %if.end17

if.else:                                          ; preds = %entry
  %cmp7 = icmp sgt i32 %max_touched, %max_valid
  br i1 %cmp7, label %if.then8, label %if.end17

if.then8:                                         ; preds = %if.else
  %call.i65 = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %2 = ptrtoint i8* %call.i65 to i32
  %tobool5.i68 = icmp eq i8* %call.i65, null
  br i1 %tobool5.i68, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit75, label %if.then.i71

if.then.i71:                                      ; preds = %if.then8
  %add.ptr.i69 = getelementptr inbounds i8, i8* %call.i65, i32 1023
  store i8 0, i8* %add.ptr.i69, align 1, !tbaa !7
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit75

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit75: ; preds = %if.then.i71, %if.then8
  %ref.tmp9.sroa.16.0 = phi i8* [ %add.ptr.i69, %if.then.i71 ], [ null, %if.then8 ]
  %cmp.i76 = icmp eq i8* %func_name, null
  br i1 %cmp.i76, label %if.then.i80, label %if.else.i82

if.then.i80:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit75
  %call.i79 = tail call i8* @halide_string_to_string(i8* %call.i65, i8* %ref.tmp9.sroa.16.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit85

if.else.i82:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit75
  %call5.i81 = tail call i8* @halide_string_to_string(i8* %call.i65, i8* %ref.tmp9.sroa.16.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit85

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit85: ; preds = %if.else.i82, %if.then.i80
  %storemerge.i83 = phi i8* [ %call5.i81, %if.else.i82 ], [ %call.i79, %if.then.i80 ]
  %call5.i88 = tail call i8* @halide_string_to_string(i8* %storemerge.i83, i8* %ref.tmp9.sroa.16.0, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.51, i32 0, i32 0)) #11
  %conv.i94 = sext i32 %max_touched to i64
  %call.i95 = tail call i8* @halide_int64_to_string(i8* %call5.i88, i8* %ref.tmp9.sroa.16.0, i64 %conv.i94, i32 1) #11
  %call5.i98 = tail call i8* @halide_string_to_string(i8* %call.i95, i8* %ref.tmp9.sroa.16.0, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.54, i32 0, i32 0)) #11
  %conv.i104 = sext i32 %max_valid to i64
  %call.i105 = tail call i8* @halide_int64_to_string(i8* %call5.i98, i8* %ref.tmp9.sroa.16.0, i64 %conv.i104, i32 1) #11
  %call5.i108 = tail call i8* @halide_string_to_string(i8* %call.i105, i8* %ref.tmp9.sroa.16.0, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.53, i32 0, i32 0)) #11
  %conv.i114 = sext i32 %dimension to i64
  %call.i115 = tail call i8* @halide_int64_to_string(i8* %call5.i108, i8* %ref.tmp9.sroa.16.0, i64 %conv.i114, i32 1) #11
  br i1 %tobool5.i68, label %if.then.i119, label %if.else.i125

if.then.i119:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit85
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %if.end17

if.else.i125:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit85
  %3 = ptrtoint i8* %call.i115 to i32
  %sub.ptr.sub.i.i122 = sub i32 1, %2
  %add.i.i123 = add i32 %sub.ptr.sub.i.i122, %3
  %conv.i.i124 = sext i32 %add.i.i123 to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i65, i64 %conv.i.i124) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i65) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i65) #11
  br label %if.end17

if.end17:                                         ; preds = %if.else.i125, %if.then.i119, %if.else, %if.else.i61, %if.then.i60
  %call18 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -4) #12
  ret i32 %call18
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %user_context, i8* %buffer_name, i64 %allocation_size, i64 %max_size) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.55, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.55, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %buffer_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_uint64_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i64 %allocation_size, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.57, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_uint64_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, i64 %max_size, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -5) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %extent) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.58, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.58, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i15, label %if.else.i17

if.then.i15:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i17:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* nonnull %buffer_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i17, %if.then.i15
  %storemerge.i = phi i8* [ %call5.i16, %if.else.i17 ], [ %call.i14, %if.then.i15 ]
  %call5.i20 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.59, i32 0, i32 0)) #11
  %conv.i = sext i32 %dimension to i64
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call5.i20, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #11
  %call5.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.60, i32 0, i32 0)) #11
  %conv.i33 = sext i32 %extent to i64
  %call.i34 = tail call i8* @halide_int64_to_string(i8* %call5.i28, i8* %ref.tmp.sroa.16.0, i64 %conv.i33, i32 1) #11
  %call5.i37 = tail call i8* @halide_string_to_string(i8* %call.i34, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.94, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i42, label %if.else.i43

if.then.i42:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i43:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i37 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i43, %if.then.i42
  %call7 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -28) #12
  ret i32 %call7
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %user_context, i8* %buffer_name, i64 %actual_size, i64 %max_size) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.61, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.61, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %buffer_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_int64_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i64 %actual_size, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.57, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, i64 %max_size, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -6) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %constrained_min, i32 %constrained_extent, i32 %required_min, i32 %required_extent) local_unnamed_addr #0 {
entry:
  %add = add i32 %required_extent, -1
  %sub = add i32 %add, %required_min
  %sub2 = add i32 %add, %constrained_min
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.62, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.62, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i28, label %if.else.i30

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i27 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i30:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i29 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* nonnull %buffer_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i30, %if.then.i28
  %storemerge.i = phi i8* [ %call5.i29, %if.else.i30 ], [ %call.i27, %if.then.i28 ]
  %call5.i33 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26.63, i32 0, i32 0)) #11
  %call5.i38 = tail call i8* @halide_string_to_string(i8* %call5.i33, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.27.64, i32 0, i32 0)) #11
  %conv.i = sext i32 %required_min to i64
  %call.i43 = tail call i8* @halide_int64_to_string(i8* %call5.i38, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #11
  %call5.i46 = tail call i8* @halide_string_to_string(i8* %call.i43, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #11
  %conv.i51 = sext i32 %sub to i64
  %call.i52 = tail call i8* @halide_int64_to_string(i8* %call5.i46, i8* %ref.tmp.sroa.22.0, i64 %conv.i51, i32 1) #11
  %call5.i55 = tail call i8* @halide_string_to_string(i8* %call.i52, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28.65, i32 0, i32 0)) #11
  %call5.i60 = tail call i8* @halide_string_to_string(i8* %call5.i55, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.66, i32 0, i32 0)) #11
  %conv.i65 = sext i32 %constrained_min to i64
  %call.i66 = tail call i8* @halide_int64_to_string(i8* %call5.i60, i8* %ref.tmp.sroa.22.0, i64 %conv.i65, i32 1) #11
  %call5.i69 = tail call i8* @halide_string_to_string(i8* %call.i66, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #11
  %conv.i74 = sext i32 %sub2 to i64
  %call.i75 = tail call i8* @halide_int64_to_string(i8* %call5.i69, i8* %ref.tmp.sroa.22.0, i64 %conv.i74, i32 1) #11
  %call5.i78 = tail call i8* @halide_string_to_string(i8* %call.i75, i8* %ref.tmp.sroa.22.0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i83, label %if.else.i84

if.then.i83:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i84:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i78 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i84, %if.then.i83
  %call15 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -7) #12
  ret i32 %call15
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %user_context, i8* %var, i32 %val, i8* %constrained_var, i32 %constrained_val) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.68, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.68, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %var, null
  br i1 %cmp.i, label %if.then.i17, label %if.else.i19

if.then.i17:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i19:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* nonnull %var) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i19, %if.then.i17
  %storemerge.i = phi i8* [ %call5.i18, %if.else.i19 ], [ %call.i16, %if.then.i17 ]
  %call5.i22 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.18.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.69, i32 0, i32 0)) #11
  %conv.i = sext i32 %val to i64
  %call.i27 = tail call i8* @halide_int64_to_string(i8* %call5.i22, i8* %ref.tmp.sroa.18.0, i64 %conv.i, i32 1) #11
  %call5.i30 = tail call i8* @halide_string_to_string(i8* %call.i27, i8* %ref.tmp.sroa.18.0, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.70, i32 0, i32 0)) #11
  %cmp.i33 = icmp eq i8* %constrained_var, null
  br i1 %cmp.i33, label %if.then.i37, label %if.else.i39

if.then.i37:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call5.i30, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit41

if.else.i39:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i38 = tail call i8* @halide_string_to_string(i8* %call5.i30, i8* %ref.tmp.sroa.18.0, i8* nonnull %constrained_var) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit41

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit41: ; preds = %if.else.i39, %if.then.i37
  %storemerge.i40 = phi i8* [ %call5.i38, %if.else.i39 ], [ %call.i36, %if.then.i37 ]
  %call5.i44 = tail call i8* @halide_string_to_string(i8* %storemerge.i40, i8* %ref.tmp.sroa.18.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.69, i32 0, i32 0)) #11
  %conv.i49 = sext i32 %constrained_val to i64
  %call.i50 = tail call i8* @halide_int64_to_string(i8* %call5.i44, i8* %ref.tmp.sroa.18.0, i64 %conv.i49, i32 1) #11
  %call5.i53 = tail call i8* @halide_string_to_string(i8* %call.i50, i8* %ref.tmp.sroa.18.0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.94, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i58, label %if.else.i59

if.then.i58:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit41
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i59:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit41
  %1 = ptrtoint i8* %call5.i53 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i59, %if.then.i58
  %call9 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -8) #12
  ret i32 %call9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %param_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_int64_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i64 %val, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.72, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, i64 %min_val, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -9) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %param_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_uint64_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i64 %val, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.72, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_uint64_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, i64 %min_val, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -9) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %user_context, i8* %param_name, double %val, double %min_val) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %param_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_double_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, double %val, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.72, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_double_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, double %min_val, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -9) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %param_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_int64_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i64 %val, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.73, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, i64 %max_val, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -10) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %param_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_uint64_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i64 %val, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.73, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_uint64_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, i64 %max_val, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -10) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %user_context, i8* %param_name, double %val, double %max_val) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %param_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #11
  %call.i24 = tail call i8* @halide_double_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, double %val, i32 1) #11
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.73, i32 0, i32 0)) #11
  %call.i32 = tail call i8* @halide_double_to_string(i8* %call5.i27, i8* %ref.tmp.sroa.15.0, double %max_val, i32 1) #11
  br i1 %tobool5.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call.i32 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -10) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.37.74, i32 0, i32 0)) #11
  %call = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -11) #12
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_error_vtcm_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.38, i32 0, i32 0)) #11
  %call = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -45) #12
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_error_locked_cache_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.39, i32 0, i32 0)) #11
  %call = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -46) #12
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_error_gpu_shared_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.40, i32 0, i32 0)) #11
  %call = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -47) #12
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %user_context, i8* %buffer_name) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.41, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.41, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.12.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i11, label %if.else.i13

if.then.i11:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.12.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i13:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.12.0, i8* nonnull %buffer_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i13, %if.then.i11
  %storemerge.i = phi i8* [ %call5.i12, %if.else.i13 ], [ %call.i10, %if.then.i11 ]
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.12.0, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.42.75, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i21, label %if.else.i22

if.then.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i22:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i16 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i22, %if.then.i21
  %call3 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -12) #12
  ret i32 %call3
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %user_context, i8* %func, i8* %filename, i32 %error_code) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.43, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.43, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.15.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %func, null
  br i1 %cmp.i, label %if.then.i14, label %if.else.i16

if.then.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.15.0, i8* nonnull %func) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i16, %if.then.i14
  %storemerge.i = phi i8* [ %call5.i15, %if.else.i16 ], [ %call.i13, %if.then.i14 ]
  %call5.i19 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.44, i32 0, i32 0)) #11
  %cmp.i22 = icmp eq i8* %filename, null
  br i1 %cmp.i22, label %if.then.i26, label %if.else.i28

if.then.i26:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i25 = tail call i8* @halide_string_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit30

if.else.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call5.i19, i8* %ref.tmp.sroa.15.0, i8* nonnull %filename) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit30

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit30: ; preds = %if.else.i28, %if.then.i26
  %storemerge.i29 = phi i8* [ %call5.i27, %if.else.i28 ], [ %call.i25, %if.then.i26 ]
  %call5.i33 = tail call i8* @halide_string_to_string(i8* %storemerge.i29, i8* %ref.tmp.sroa.15.0, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.45, i32 0, i32 0)) #11
  %conv.i = sext i32 %error_code to i64
  %call.i38 = tail call i8* @halide_int64_to_string(i8* %call5.i33, i8* %ref.tmp.sroa.15.0, i64 %conv.i, i32 1) #11
  br i1 %tobool5.i, label %if.then.i41, label %if.else.i42

if.then.i41:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit30
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i42:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit30
  %1 = ptrtoint i8* %call.i38 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i42, %if.then.i41
  %call6 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -13) #12
  ret i32 %call6
}

; Function Attrs: nounwind
define weak i32 @halide_error_failed_to_upgrade_buffer_t(i8* %user_context, i8* %name, i8* %reason) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([51 x i8], [51 x i8]* @.str.46, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([51 x i8], [51 x i8]* @.str.46, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.13.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %name, null
  br i1 %cmp.i, label %if.then.i12, label %if.else.i14

if.then.i12:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* nonnull %name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i14, %if.then.i12
  %storemerge.i = phi i8* [ %call5.i13, %if.else.i14 ], [ %call.i11, %if.then.i12 ]
  %call5.i17 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.13.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.47, i32 0, i32 0)) #11
  %cmp.i20 = icmp eq i8* %reason, null
  br i1 %cmp.i20, label %if.then.i24, label %if.else.i26

if.then.i24:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call5.i17, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28

if.else.i26:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i25 = tail call i8* @halide_string_to_string(i8* %call5.i17, i8* %ref.tmp.sroa.13.0, i8* nonnull %reason) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28: ; preds = %if.else.i26, %if.then.i24
  %storemerge.i27 = phi i8* [ %call5.i25, %if.else.i26 ], [ %call.i23, %if.then.i24 ]
  br i1 %tobool5.i, label %if.then.i31, label %if.else.i32

if.then.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i32:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
  %1 = ptrtoint i8* %storemerge.i27 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i32, %if.then.i31
  %call4 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -29) #12
  ret i32 %call4
}

; Function Attrs: nounwind
define weak i32 @halide_error_failed_to_downgrade_buffer_t(i8* %user_context, i8* %name, i8* %reason) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.48, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.48, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.13.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %name, null
  br i1 %cmp.i, label %if.then.i12, label %if.else.i14

if.then.i12:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* nonnull %name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i14, %if.then.i12
  %storemerge.i = phi i8* [ %call5.i13, %if.else.i14 ], [ %call.i11, %if.then.i12 ]
  %call5.i17 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.13.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.47, i32 0, i32 0)) #11
  %cmp.i20 = icmp eq i8* %reason, null
  br i1 %cmp.i20, label %if.then.i24, label %if.else.i26

if.then.i24:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call5.i17, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28

if.else.i26:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i25 = tail call i8* @halide_string_to_string(i8* %call5.i17, i8* %ref.tmp.sroa.13.0, i8* nonnull %reason) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28: ; preds = %if.else.i26, %if.then.i24
  %storemerge.i27 = phi i8* [ %call5.i25, %if.else.i26 ], [ %call.i23, %if.then.i24 ]
  br i1 %tobool5.i, label %if.then.i31, label %if.else.i32

if.then.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i32:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
  %1 = ptrtoint i8* %storemerge.i27 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i32, %if.then.i31
  %call4 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -30) #12
  ret i32 %call4
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %user_context, i8* %func, i32 %alignment) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.49, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.49, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %func, null
  br i1 %cmp.i, label %if.then.i13, label %if.else.i15

if.then.i13:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i15:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* nonnull %func) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i15, %if.then.i13
  %storemerge.i = phi i8* [ %call5.i14, %if.else.i15 ], [ %call.i12, %if.then.i13 ]
  %call5.i18 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.14.0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.50, i32 0, i32 0)) #11
  %conv.i = sext i32 %alignment to i64
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call5.i18, i8* %ref.tmp.sroa.14.0, i64 %conv.i, i32 1) #11
  %call5.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.14.0, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.51, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i31, label %if.else.i32

if.then.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i32:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i26 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i32, %if.then.i31
  %call5 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -24) #12
  ret i32 %call5
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %user_context, i8* %func) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.49, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.49, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.12.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %func, null
  br i1 %cmp.i, label %if.then.i11, label %if.else.i13

if.then.i11:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.12.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i13:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.12.0, i8* nonnull %func) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i13, %if.then.i11
  %storemerge.i = phi i8* [ %call5.i12, %if.else.i13 ], [ %call.i10, %if.then.i11 ]
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.12.0, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.52, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i21, label %if.else.i22

if.then.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i22:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i16 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i22, %if.then.i21
  %call3 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -34) #12
  ret i32 %call3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %user_context, i8* %func_name, i8* %var_name, i8* %loop_name) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.53, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.53, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %var_name, null
  br i1 %cmp.i, label %if.then.i15, label %if.else.i17

if.then.i15:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i17:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* nonnull %var_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i17, %if.then.i15
  %storemerge.i = phi i8* [ %call5.i16, %if.else.i17 ], [ %call.i14, %if.then.i15 ]
  %call5.i20 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.54, i32 0, i32 0)) #11
  %cmp.i23 = icmp eq i8* %func_name, null
  br i1 %cmp.i23, label %if.then.i27, label %if.else.i29

if.then.i27:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call5.i20, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit31

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i28 = tail call i8* @halide_string_to_string(i8* %call5.i20, i8* %ref.tmp.sroa.16.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit31

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit31: ; preds = %if.else.i29, %if.then.i27
  %storemerge.i30 = phi i8* [ %call5.i28, %if.else.i29 ], [ %call.i26, %if.then.i27 ]
  %call5.i34 = tail call i8* @halide_string_to_string(i8* %storemerge.i30, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.55, i32 0, i32 0)) #11
  %cmp.i37 = icmp eq i8* %loop_name, null
  br i1 %cmp.i37, label %if.then.i41, label %if.else.i43

if.then.i41:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit31
  %call.i40 = tail call i8* @halide_string_to_string(i8* %call5.i34, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit45

if.else.i43:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit31
  %call5.i42 = tail call i8* @halide_string_to_string(i8* %call5.i34, i8* %ref.tmp.sroa.16.0, i8* nonnull %loop_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit45

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit45: ; preds = %if.else.i43, %if.then.i41
  %storemerge.i44 = phi i8* [ %call5.i42, %if.else.i43 ], [ %call.i40, %if.then.i41 ]
  %call5.i48 = tail call i8* @halide_string_to_string(i8* %storemerge.i44, i8* %ref.tmp.sroa.16.0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i53, label %if.else.i54

if.then.i53:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit45
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i54:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit45
  %1 = ptrtoint i8* %call5.i48 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i54, %if.then.i53
  %call7 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -25) #12
  ret i32 %call7
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_extern_fold(i8* %user_context, i8* %func_name, i32 %dim, i32 %min, i32 %extent, i32 %valid_min, i32 %fold_factor) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %min, %valid_min
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %add = add nsw i32 %extent, %min
  %add1 = add nsw i32 %fold_factor, %valid_min
  %cmp2 = icmp sgt i32 %add, %add1
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then.split, label %if.then.i

if.then.split:                                    ; preds = %if.then
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.56, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.56, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %if.then.split
  %phi.call = phi i8* [ %call5.i1, %if.then.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.23.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then.i ]
  %conv.i = sext i32 %dim to i64
  %call.i57 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.23.0, i64 %conv.i, i32 1) #11
  %call5.i60 = tail call i8* @halide_string_to_string(i8* %call.i57, i8* %ref.tmp.sroa.23.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.54, i32 0, i32 0)) #11
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i65, label %if.else.i67

if.then.i65:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i64 = tail call i8* @halide_string_to_string(i8* %call5.i60, i8* %ref.tmp.sroa.23.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i67:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i66 = tail call i8* @halide_string_to_string(i8* %call5.i60, i8* %ref.tmp.sroa.23.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i67, %if.then.i65
  %storemerge.i = phi i8* [ %call5.i66, %if.else.i67 ], [ %call.i64, %if.then.i65 ]
  %call5.i70 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.23.0, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.57, i32 0, i32 0)) #11
  %conv.i75 = sext i32 %min to i64
  %call.i76 = tail call i8* @halide_int64_to_string(i8* %call5.i70, i8* %ref.tmp.sroa.23.0, i64 %conv.i75, i32 1) #11
  %call5.i79 = tail call i8* @halide_string_to_string(i8* %call.i76, i8* %ref.tmp.sroa.23.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #11
  %add9 = add nsw i32 %extent, %min
  %sub = add nsw i32 %add9, -1
  %conv.i84 = sext i32 %sub to i64
  %call.i85 = tail call i8* @halide_int64_to_string(i8* %call5.i79, i8* %ref.tmp.sroa.23.0, i64 %conv.i84, i32 1) #11
  %call5.i88 = tail call i8* @halide_string_to_string(i8* %call.i85, i8* %ref.tmp.sroa.23.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.59.77, i32 0, i32 0)) #11
  %call5.i93 = tail call i8* @halide_string_to_string(i8* %call5.i88, i8* %ref.tmp.sroa.23.0, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.60.78, i32 0, i32 0)) #11
  %conv.i98 = sext i32 %valid_min to i64
  %call.i99 = tail call i8* @halide_int64_to_string(i8* %call5.i93, i8* %ref.tmp.sroa.23.0, i64 %conv.i98, i32 1) #11
  %call5.i102 = tail call i8* @halide_string_to_string(i8* %call.i99, i8* %ref.tmp.sroa.23.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #11
  %add15 = add nsw i32 %fold_factor, %valid_min
  %sub16 = add nsw i32 %add15, -1
  %conv.i107 = sext i32 %sub16 to i64
  %call.i108 = tail call i8* @halide_int64_to_string(i8* %call5.i102, i8* %ref.tmp.sroa.23.0, i64 %conv.i107, i32 1) #11
  %call5.i111 = tail call i8* @halide_string_to_string(i8* %call.i108, i8* %ref.tmp.sroa.23.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.61.79, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i116, label %if.else.i117

if.then.i116:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %if.end

if.else.i117:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i111 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %call.i121 = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %2 = ptrtoint i8* %call.i121 to i32
  %tobool5.i124 = icmp eq i8* %call.i121, null
  br i1 %tobool5.i124, label %if.else.split, label %if.then.i127

if.else.split:                                    ; preds = %if.else
  %call5.i1343 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.56, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit131

if.then.i127:                                     ; preds = %if.else
  %add.ptr.i125 = getelementptr inbounds i8, i8* %call.i121, i32 1023
  store i8 0, i8* %add.ptr.i125, align 1, !tbaa !7
  %call5.i1344 = tail call i8* @halide_string_to_string(i8* nonnull %call.i121, i8* nonnull %add.ptr.i125, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.56, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit131

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit131: ; preds = %if.then.i127, %if.else.split
  %phi.call5 = phi i8* [ %call5.i1343, %if.else.split ], [ %call5.i1344, %if.then.i127 ]
  %ref.tmp19.sroa.22.0 = phi i8* [ null, %if.else.split ], [ %add.ptr.i125, %if.then.i127 ]
  %conv.i140 = sext i32 %dim to i64
  %call.i141 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %ref.tmp19.sroa.22.0, i64 %conv.i140, i32 1) #11
  %call5.i144 = tail call i8* @halide_string_to_string(i8* %call.i141, i8* %ref.tmp19.sroa.22.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.54, i32 0, i32 0)) #11
  %cmp.i148 = icmp eq i8* %func_name, null
  br i1 %cmp.i148, label %if.then.i152, label %if.else.i154

if.then.i152:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit131
  %call.i151 = tail call i8* @halide_string_to_string(i8* %call5.i144, i8* %ref.tmp19.sroa.22.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit157

if.else.i154:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit131
  %call5.i153 = tail call i8* @halide_string_to_string(i8* %call5.i144, i8* %ref.tmp19.sroa.22.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit157

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit157: ; preds = %if.else.i154, %if.then.i152
  %storemerge.i155 = phi i8* [ %call5.i153, %if.else.i154 ], [ %call.i151, %if.then.i152 ]
  %call5.i160 = tail call i8* @halide_string_to_string(i8* %storemerge.i155, i8* %ref.tmp19.sroa.22.0, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.57, i32 0, i32 0)) #11
  %conv.i166 = sext i32 %min to i64
  %call.i167 = tail call i8* @halide_int64_to_string(i8* %call5.i160, i8* %ref.tmp19.sroa.22.0, i64 %conv.i166, i32 1) #11
  %call5.i170 = tail call i8* @halide_string_to_string(i8* %call.i167, i8* %ref.tmp19.sroa.22.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #11
  %sub28 = add nsw i32 %add, -1
  %conv.i176 = sext i32 %sub28 to i64
  %call.i177 = tail call i8* @halide_int64_to_string(i8* %call5.i170, i8* %ref.tmp19.sroa.22.0, i64 %conv.i176, i32 1) #11
  %call5.i180 = tail call i8* @halide_string_to_string(i8* %call.i177, i8* %ref.tmp19.sroa.22.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.59.77, i32 0, i32 0)) #11
  %call5.i186 = tail call i8* @halide_string_to_string(i8* %call5.i180, i8* %ref.tmp19.sroa.22.0, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.62, i32 0, i32 0)) #11
  %call5.i192 = tail call i8* @halide_string_to_string(i8* %call5.i186, i8* %ref.tmp19.sroa.22.0, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.63, i32 0, i32 0)) #11
  %conv.i198 = sext i32 %fold_factor to i64
  %call.i199 = tail call i8* @halide_int64_to_string(i8* %call5.i192, i8* %ref.tmp19.sroa.22.0, i64 %conv.i198, i32 1) #11
  %call5.i202 = tail call i8* @halide_string_to_string(i8* %call.i199, i8* %ref.tmp19.sroa.22.0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #11
  br i1 %tobool5.i124, label %if.then.i209, label %if.else.i215

if.then.i209:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit157
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %if.end

if.else.i215:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit157
  %3 = ptrtoint i8* %call5.i202 to i32
  %sub.ptr.sub.i.i212 = sub i32 1, %2
  %add.i.i213 = add i32 %sub.ptr.sub.i.i212, %3
  %conv.i.i214 = sext i32 %add.i.i213 to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i121, i64 %conv.i.i214) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i121) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i121) #11
  br label %if.end

if.end:                                           ; preds = %if.else.i215, %if.then.i209, %if.else.i117, %if.then.i116
  %call35 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -35) #12
  ret i32 %call35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %fold_factor, i8* %loop_name, i32 %required_extent) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.64.80, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.64.80, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %conv.i = sext i32 %fold_factor to i64
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #11
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.20.0, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.65, i32 0, i32 0)) #11
  %cmp.i = icmp eq i8* %var_name, null
  br i1 %cmp.i, label %if.then.i26, label %if.else.i28

if.then.i26:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i25 = tail call i8* @halide_string_to_string(i8* %call5.i21, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i27 = tail call i8* @halide_string_to_string(i8* %call5.i21, i8* %ref.tmp.sroa.20.0, i8* nonnull %var_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i28, %if.then.i26
  %storemerge.i = phi i8* [ %call5.i27, %if.else.i28 ], [ %call.i25, %if.then.i26 ]
  %call5.i31 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.20.0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.54, i32 0, i32 0)) #11
  %cmp.i34 = icmp eq i8* %func_name, null
  br i1 %cmp.i34, label %if.then.i38, label %if.else.i40

if.then.i38:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i37 = tail call i8* @halide_string_to_string(i8* %call5.i31, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit42

if.else.i40:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i39 = tail call i8* @halide_string_to_string(i8* %call5.i31, i8* %ref.tmp.sroa.20.0, i8* nonnull %func_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit42

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit42: ; preds = %if.else.i40, %if.then.i38
  %storemerge.i41 = phi i8* [ %call5.i39, %if.else.i40 ], [ %call.i37, %if.then.i38 ]
  %call5.i45 = tail call i8* @halide_string_to_string(i8* %storemerge.i41, i8* %ref.tmp.sroa.20.0, i8* nonnull getelementptr inbounds ([61 x i8], [61 x i8]* @.str.66, i32 0, i32 0)) #11
  %cmp.i48 = icmp eq i8* %loop_name, null
  br i1 %cmp.i48, label %if.then.i52, label %if.else.i54

if.then.i52:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit42
  %call.i51 = tail call i8* @halide_string_to_string(i8* %call5.i45, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit56

if.else.i54:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit42
  %call5.i53 = tail call i8* @halide_string_to_string(i8* %call5.i45, i8* %ref.tmp.sroa.20.0, i8* nonnull %loop_name) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit56

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit56: ; preds = %if.else.i54, %if.then.i52
  %storemerge.i55 = phi i8* [ %call5.i53, %if.else.i54 ], [ %call.i51, %if.then.i52 ]
  %call5.i59 = tail call i8* @halide_string_to_string(i8* %storemerge.i55, i8* %ref.tmp.sroa.20.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.69, i32 0, i32 0)) #11
  %conv.i64 = sext i32 %required_extent to i64
  %call.i65 = tail call i8* @halide_int64_to_string(i8* %call5.i59, i8* %ref.tmp.sroa.20.0, i64 %conv.i64, i32 1) #11
  %call5.i68 = tail call i8* @halide_string_to_string(i8* %call.i65, i8* %ref.tmp.sroa.20.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.67, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i73, label %if.else.i74

if.then.i73:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit56
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i74:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit56
  %1 = ptrtoint i8* %call5.i68 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i74, %if.then.i73
  %call11 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -26) #12
  ret i32 %call11
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %user_context, i8* %condition, i8* %message) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.68, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.68, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.13.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %condition, null
  br i1 %cmp.i, label %if.then.i12, label %if.else.i14

if.then.i12:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i14:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.13.0, i8* nonnull %condition) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i14, %if.then.i12
  %storemerge.i = phi i8* [ %call5.i13, %if.else.i14 ], [ %call.i11, %if.then.i12 ]
  %call5.i17 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.13.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3.92, i32 0, i32 0)) #11
  %cmp.i20 = icmp eq i8* %message, null
  br i1 %cmp.i20, label %if.then.i24, label %if.else.i26

if.then.i24:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call5.i17, i8* %ref.tmp.sroa.13.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28

if.else.i26:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i25 = tail call i8* @halide_string_to_string(i8* %call5.i17, i8* %ref.tmp.sroa.13.0, i8* nonnull %message) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28: ; preds = %if.else.i26, %if.then.i24
  %storemerge.i27 = phi i8* [ %call5.i25, %if.else.i26 ], [ %call.i23, %if.then.i24 ]
  br i1 %tobool5.i, label %if.then.i31, label %if.else.i32

if.then.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i32:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
  %1 = ptrtoint i8* %storemerge.i27 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i32, %if.then.i31
  %call4 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -27) #12
  ret i32 %call4
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %user_context, i8* %message) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.70, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.70, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.11.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %message, null
  br i1 %cmp.i, label %if.then.i10, label %if.else.i12

if.then.i10:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.11.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i12:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.11.0, i8* nonnull %message) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i12, %if.then.i10
  %storemerge.i = phi i8* [ %call5.i11, %if.else.i12 ], [ %call.i9, %if.then.i10 ]
  br i1 %tobool5.i, label %if.then.i15, label %if.else.i16

if.then.i15:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %storemerge.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i16, %if.then.i15
  %call2 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -31) #12
  ret i32 %call2
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %user_context) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then.i8, label %if.else.i9

if.then.i8:                                       ; preds = %entry
  %call5.i21 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.71, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i9:                                       ; preds = %entry
  %0 = ptrtoint i8* %call.i to i32
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.71, i32 0, i32 0)) #11
  %1 = ptrtoint i8* %call5.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i9, %if.then.i8
  %call1 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -19) #12
  ret i32 %call1
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %user_context) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then.i8, label %if.else.i9

if.then.i8:                                       ; preds = %entry
  %call5.i21 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([56 x i8], [56 x i8]* @.str.72, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i9:                                       ; preds = %entry
  %0 = ptrtoint i8* %call.i to i32
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([56 x i8], [56 x i8]* @.str.72, i32 0, i32 0)) #11
  %1 = ptrtoint i8* %call5.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i9, %if.then.i8
  %call1 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -36) #12
  ret i32 %call1
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %user_context) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then.i8, label %if.else.i9

if.then.i8:                                       ; preds = %entry
  %call5.i21 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.73, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i9:                                       ; preds = %entry
  %0 = ptrtoint i8* %call.i to i32
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.73, i32 0, i32 0)) #11
  %1 = ptrtoint i8* %call5.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i9, %if.then.i8
  %call1 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -37) #12
  ret i32 %call1
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %user_context, i8* %routine) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %0 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %entry.split, label %if.then.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.74, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.74, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.i, %entry.split
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then.i ]
  %ref.tmp.sroa.12.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then.i ]
  %cmp.i = icmp eq i8* %routine, null
  br i1 %cmp.i, label %if.then.i11, label %if.else.i13

if.then.i11:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.12.0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.78, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i13:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.12.0, i8* nonnull %routine) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i13, %if.then.i11
  %storemerge.i = phi i8* [ %call5.i12, %if.else.i13 ], [ %call.i10, %if.then.i11 ]
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %storemerge.i, i8* %ref.tmp.sroa.12.0, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.75, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i21, label %if.else.i22

if.then.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i22:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %1 = ptrtoint i8* %call5.i16 to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i22, %if.then.i21
  %call3 = tail call i32 @halide_error_check_fault_and_return(i8* %user_context, i32 -38) #12
  ret i32 %call3
}

; Function Attrs: nounwind
define weak i32 @halide_error_integer_division_by_zero(i8* %user_context) local_unnamed_addr #0 {
entry:
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then.i6, label %if.else.i7

if.then.i6:                                       ; preds = %entry
  %call5.i19 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.76, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i7:                                       ; preds = %entry
  %0 = ptrtoint i8* %call.i to i32
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.76, i32 0, i32 0)) #11
  %1 = ptrtoint i8* %call5.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i7, %if.then.i6
  ret i32 -44
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_buffer_t* %new_buf) local_unnamed_addr #0 {
entry:
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 8
  store i32 4, i32* %dimensions, align 4, !tbaa !34
  %arrayidx = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 2, i32 0
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %cmp1 = icmp eq i32 %0, 0
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.inc.2, %for.inc.1, %for.inc, %entry
  %i.038.lcssa = phi i32 [ 0, %entry ], [ 1, %for.inc ], [ 2, %for.inc.1 ], [ 3, %for.inc.2 ]
  store i32 %i.038.lcssa, i32* %dimensions, align 4, !tbaa !34
  br label %cleanup

for.inc:                                          ; preds = %entry
  %arrayidx.1 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 2, i32 1
  %1 = load i32, i32* %arrayidx.1, align 4, !tbaa !10
  %cmp1.1 = icmp eq i32 %1, 0
  br i1 %cmp1.1, label %if.then, label %for.inc.1

cleanup:                                          ; preds = %for.inc.2, %if.then
  %elem_size = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 5
  %2 = load i32, i32* %elem_size, align 4, !tbaa !66
  switch i32 %2, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb3
    i32 4, label %sw.bb6
    i32 8, label %sw.bb9
  ]

sw.bb:                                            ; preds = %cleanup
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 7, i32 0
  %4 = bitcast i8* %3 to i32*
  store i32 67585, i32* %4, align 8
  br label %return

sw.bb3:                                           ; preds = %cleanup
  %5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 7, i32 0
  %6 = bitcast i8* %5 to i32*
  store i32 69633, i32* %6, align 8
  br label %return

sw.bb6:                                           ; preds = %cleanup
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 7, i32 0
  %8 = bitcast i8* %7 to i32*
  store i32 73729, i32* %8, align 8
  br label %return

sw.bb9:                                           ; preds = %cleanup
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 7, i32 0
  %10 = bitcast i8* %9 to i32*
  store i32 81921, i32* %10, align 8
  br label %return

sw.default:                                       ; preds = %cleanup
  %call = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1.90, i32 0, i32 0)) #11
  br label %return

return:                                           ; preds = %sw.default, %sw.bb9, %sw.bb6, %sw.bb3, %sw.bb
  %retval.0 = phi i32 [ %call, %sw.default ], [ 0, %sw.bb9 ], [ 0, %sw.bb6 ], [ 0, %sw.bb3 ], [ 0, %sw.bb ]
  ret i32 %retval.0

for.inc.1:                                        ; preds = %for.inc
  %arrayidx.2 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 2, i32 2
  %11 = load i32, i32* %arrayidx.2, align 4, !tbaa !10
  %cmp1.2 = icmp eq i32 %11, 0
  br i1 %cmp1.2, label %if.then, label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1
  %arrayidx.3 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 2, i32 3
  %12 = load i32, i32* %arrayidx.3, align 4, !tbaa !10
  %cmp1.3 = icmp eq i32 %12, 0
  br i1 %cmp1.3, label %if.then, label %cleanup
}

; Function Attrs: nounwind
define weak i32 @halide_upgrade_buffer_t(i8* %user_context, i8* %name, %struct.buffer_t* %old_buf, %struct.halide_buffer_t* %new_buf, i32 %bounds_query_only) local_unnamed_addr #0 {
entry:
  %host = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 1
  %0 = load i8*, i8** %host, align 8, !tbaa !68
  %tobool = icmp eq i8* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %dev = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 0
  %1 = load i64, i64* %dev, align 8, !tbaa !69
  %tobool1 = icmp eq i64 %1, 0
  br i1 %tobool1, label %if.end22.thread, label %if.then

if.end22.thread:                                  ; preds = %lor.lhs.false
  %host24152 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 2
  store i8* null, i8** %host24152, align 4, !tbaa !32
  br label %if.end32

if.then:                                          ; preds = %lor.lhs.false, %entry
  %elem_size = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 5
  %2 = load i32, i32* %elem_size, align 4, !tbaa !66
  %type = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 7
  %bits.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 7, i32 1
  %3 = load i8, i8* %bits.i, align 1, !tbaa !27
  %conv.i = zext i8 %3 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %cmp = icmp eq i32 %2, %div.i
  br i1 %cmp, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %4 = ptrtoint i8* %call.i to i32
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then2.split, label %if.then.i92

if.then2.split:                                   ; preds = %if.then2
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.91, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit

if.then.i92:                                      ; preds = %if.then2
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.91, i32 0, i32 0)) #11
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit: ; preds = %if.then.i92, %if.then2.split
  %phi.call = phi i8* [ %call5.i1, %if.then2.split ], [ %call5.i2, %if.then.i92 ]
  %sstr.sroa.17.0 = phi i8* [ null, %if.then2.split ], [ %add.ptr.i, %if.then.i92 ]
  %5 = load i32, i32* %elem_size, align 4, !tbaa !66
  %conv.i101 = sext i32 %5 to i64
  %call.i102 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %sstr.sroa.17.0, i64 %conv.i101, i32 1) #11
  %call5.i105 = tail call i8* @halide_string_to_string(i8* %call.i102, i8* %sstr.sroa.17.0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3.92, i32 0, i32 0)) #11
  %call5.i110 = tail call i8* @halide_string_to_string(i8* %call5.i105, i8* %sstr.sroa.17.0, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4.93, i32 0, i32 0)) #11
  %call.i115 = tail call i8* @halide_type_to_string(i8* %call5.i110, i8* %sstr.sroa.17.0, %struct.halide_type_t* nonnull %type) #11
  %call5.i118 = tail call i8* @halide_string_to_string(i8* %call.i115, i8* %sstr.sroa.17.0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.94, i32 0, i32 0)) #11
  br i1 %tobool5.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
  %call12146 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %user_context, i8* %name, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %return

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
  %6 = ptrtoint i8* %call5.i118 to i32
  %sub.ptr.sub.i.i125 = sub i32 1, %4
  %add.i.i126 = add i32 %sub.ptr.sub.i.i125, %6
  %conv.i.i127 = sext i32 %add.i.i126 to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i127) #11
  %call12 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %user_context, i8* %name, i8* nonnull %call.i) #11
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i127) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %return

if.end:                                           ; preds = %if.then
  %tobool13 = icmp eq i32 %bounds_query_only, 0
  br i1 %tobool13, label %if.end22, label %if.then14

if.then14:                                        ; preds = %if.end
  %host15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 2
  %7 = load i8*, i8** %host15, align 4, !tbaa !32
  %cmp17 = icmp eq i8* %7, %0
  br i1 %cmp17, label %return, label %if.then18

if.then18:                                        ; preds = %if.then14
  %call19 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %user_context, i8* %name, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.6.96, i32 0, i32 0)) #11
  br label %return

if.end22:                                         ; preds = %if.end
  %dev25.phi.trans.insert = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 0
  %.pre = load i64, i64* %dev25.phi.trans.insert, align 8, !tbaa !69
  %host24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 2
  store i8* %0, i8** %host24, align 4, !tbaa !32
  %tobool26 = icmp eq i64 %.pre, 0
  br i1 %tobool26, label %if.end32, label %if.then27

if.then27:                                        ; preds = %if.end22
  %conv = trunc i64 %.pre to i32
  %8 = inttoptr i32 %conv to %"struct.Halide::Runtime::Internal::old_dev_wrapper"*
  %device = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %8, i32 0, i32 0
  %9 = load i64, i64* %device, align 8, !tbaa !70
  %interface = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %8, i32 0, i32 1
  %10 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %interface, align 8, !tbaa !72
  br label %if.end32

if.end32:                                         ; preds = %if.then27, %if.end22, %if.end22.thread
  %.sink151 = phi i64 [ %9, %if.then27 ], [ 0, %if.end22.thread ], [ 0, %if.end22 ]
  %.sink = phi %struct.halide_device_interface_t* [ %10, %if.then27 ], [ null, %if.end22.thread ], [ null, %if.end22 ]
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 0
  store i64 %.sink151, i64* %11, align 8
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 1
  store %struct.halide_device_interface_t* %.sink, %struct.halide_device_interface_t** %12, align 8
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 8
  %13 = load i32, i32* %dimensions, align 4, !tbaa !34
  %cmp33149 = icmp sgt i32 %13, 0
  br i1 %cmp33149, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end32
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 9
  %14 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end32
  %flags = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 3
  %host_dirty = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 6
  %15 = load i8, i8* %host_dirty, align 8, !tbaa !73, !range !19
  %16 = zext i8 %15 to i64
  %dev_dirty = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 7
  %17 = load i8, i8* %dev_dirty, align 1, !tbaa !74, !range !19
  %tobool45 = icmp eq i8 %17, 0
  %or.i.i = or i64 %16, 2
  %selv.i.i = select i1 %tobool45, i64 %16, i64 %or.i.i
  store i64 %selv.i.i, i64* %flags, align 8, !tbaa !33
  br label %return

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.0150 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 4, i32 %i.0150
  %18 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %min35 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 %i.0150, i32 0
  store i32 %18, i32* %min35, align 4, !tbaa !36
  %arrayidx36 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 2, i32 %i.0150
  %19 = load i32, i32* %arrayidx36, align 4, !tbaa !10
  %extent39 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 %i.0150, i32 1
  store i32 %19, i32* %extent39, align 4, !tbaa !38
  %arrayidx40 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 3, i32 %i.0150
  %20 = load i32, i32* %arrayidx40, align 4, !tbaa !10
  %stride43 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 %i.0150, i32 2
  store i32 %20, i32* %stride43, align 4, !tbaa !39
  %inc = add nuw nsw i32 %i.0150, 1
  %exitcond = icmp eq i32 %inc, %13
  br i1 %exitcond, label %for.cond.cleanup, label %for.body

return:                                           ; preds = %for.cond.cleanup, %if.then18, %if.then14, %if.else.i, %if.then.i
  %retval.0 = phi i32 [ %call19, %if.then18 ], [ 0, %for.cond.cleanup ], [ 0, %if.then14 ], [ %call12, %if.else.i ], [ %call12146, %if.then.i ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_downgrade_buffer_t(i8* %user_context, i8* %name, %struct.halide_buffer_t* %new_buf, %struct.buffer_t* %old_buf) local_unnamed_addr #0 {
entry:
  %0 = bitcast %struct.buffer_t* %old_buf to i8*
  %call = tail call i8* @memset(i8* %0, i32 0, i32 72) #11
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 8
  %1 = load i32, i32* %dimensions, align 4, !tbaa !34
  %cmp = icmp sgt i32 %1, 4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = tail call i32 @halide_error_failed_to_downgrade_buffer_t(i8* %user_context, i8* %name, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.7.97, i32 0, i32 0)) #11
  br label %return

if.end:                                           ; preds = %entry
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 2
  %2 = bitcast i8** %host to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !32
  %host2 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 1
  %4 = bitcast i8** %host2 to i32*
  store i32 %3, i32* %4, align 8, !tbaa !68
  %cmp440 = icmp sgt i32 %1, 0
  br i1 %cmp440, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 9
  %5 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %bits.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 7, i32 1
  %6 = load i8, i8* %bits.i, align 1, !tbaa !27
  %conv.i = zext i8 %6 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %elem_size = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 5
  store i32 %div.i, i32* %elem_size, align 4, !tbaa !66
  %call16 = tail call i32 @halide_downgrade_buffer_t_device_fields(i8* %user_context, i8* %name, %struct.halide_buffer_t* nonnull %new_buf, %struct.buffer_t* nonnull %old_buf) #12
  br label %return

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.041 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.041, i32 0
  %7 = load i32, i32* %min, align 4, !tbaa !36
  %arrayidx6 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 4, i32 %i.041
  store i32 %7, i32* %arrayidx6, align 4, !tbaa !10
  %extent = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.041, i32 1
  %8 = load i32, i32* %extent, align 4, !tbaa !38
  %arrayidx10 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 2, i32 %i.041
  store i32 %8, i32* %arrayidx10, align 4, !tbaa !10
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.041, i32 2
  %9 = load i32, i32* %stride, align 4, !tbaa !39
  %arrayidx14 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 3, i32 %i.041
  store i32 %9, i32* %arrayidx14, align 4, !tbaa !10
  %inc = add nuw nsw i32 %i.041, 1
  %10 = load i32, i32* %dimensions, align 4, !tbaa !34
  %cmp4 = icmp slt i32 %inc, %10
  br i1 %cmp4, label %for.body, label %for.cond.cleanup

return:                                           ; preds = %for.cond.cleanup, %if.then
  %retval.0 = phi i32 [ %call1, %if.then ], [ %call16, %for.cond.cleanup ]
  ret i32 %retval.0
}

declare i8* @memset(i8*, i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind
define weak i32 @halide_downgrade_buffer_t_device_fields(i8* %user_context, i8* %name, %struct.halide_buffer_t* %new_buf, %struct.buffer_t* %old_buf) local_unnamed_addr #0 {
entry:
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 3
  %0 = load i64, i64* %flags.i.i, align 8, !tbaa !33
  %host_dirty = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 6
  %1 = trunc i64 %0 to i8
  %2 = and i8 %1, 1
  store i8 %2, i8* %host_dirty, align 8, !tbaa !73
  %dev_dirty = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 7
  %and.i.i42 = lshr i64 %0, 1
  %3 = trunc i64 %and.i.i42 to i8
  %4 = and i8 %3, 1
  store i8 %4, i8* %dev_dirty, align 1, !tbaa !74
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 0
  %5 = load i64, i64* %device, align 8, !tbaa !29
  %tobool = icmp eq i64 %5, 0
  %dev = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %old_buf, i32 0, i32 0
  %6 = load i64, i64* %dev, align 8, !tbaa !69
  %tobool3 = icmp ne i64 %6, 0
  br i1 %tobool, label %if.else15, label %if.then

if.then:                                          ; preds = %entry
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %conv = trunc i64 %6 to i32
  %7 = inttoptr i32 %conv to %"struct.Halide::Runtime::Internal::old_dev_wrapper"*
  %device7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %7, i32 0, i32 0
  store i64 %5, i64* %device7, align 8, !tbaa !70
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 1
  %8 = bitcast %struct.halide_device_interface_t** %device_interface to i32*
  %9 = load i32, i32* %8, align 8, !tbaa !31
  %interface = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %7, i32 0, i32 1
  %10 = bitcast %struct.halide_device_interface_t** %interface to i32*
  store i32 %9, i32* %10, align 8, !tbaa !72
  br label %if.end23

if.else:                                          ; preds = %if.then
  %call9 = tail call i8* @malloc(i32 16) #11
  %11 = load i64, i64* %device, align 8, !tbaa !29
  %device11 = bitcast i8* %call9 to i64*
  store i64 %11, i64* %device11, align 8, !tbaa !70
  %device_interface12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 1
  %12 = bitcast %struct.halide_device_interface_t** %device_interface12 to i32*
  %13 = load i32, i32* %12, align 8, !tbaa !31
  %interface13 = getelementptr inbounds i8, i8* %call9, i32 8
  %14 = bitcast i8* %interface13 to i32*
  store i32 %13, i32* %14, align 8, !tbaa !72
  %15 = ptrtoint i8* %call9 to i32
  %16 = zext i32 %15 to i64
  store i64 %16, i64* %dev, align 8, !tbaa !69
  br label %if.end23

if.else15:                                        ; preds = %entry
  br i1 %tobool3, label %if.then18, label %if.end23

if.then18:                                        ; preds = %if.else15
  %conv20 = trunc i64 %6 to i32
  %17 = inttoptr i32 %conv20 to i8*
  tail call void @free(i8* %17) #11
  store i64 0, i64* %dev, align 8, !tbaa !69
  br label %if.end23

if.end23:                                         ; preds = %if.then18, %if.else15, %if.else, %if.then4
  ret i32 0
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host_legacy(i8* %user_context, %struct.buffer_t* %old_buf) local_unnamed_addr #0 {
entry:
  %new_buf = alloca %struct.halide_buffer_t, align 8
  %shape = alloca [4 x %struct.halide_dimension_t], align 4
  %0 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #9
  %1 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  %2 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %2, i8 0, i64 64, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #9
  %array.begin = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i32 0, i32 0
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 9
  %3 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %3, i8 0, i64 64, i1 false)
  store %struct.halide_dimension_t* %array.begin, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %call = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf) #12
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %lor.end, label %lor.end13

lor.end:                                          ; preds = %entry
  %call1 = call i32 @halide_upgrade_buffer_t(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf, i32 0) #12
  %tobool2 = icmp eq i32 %call1, 0
  br i1 %tobool2, label %lor.end7, label %lor.end13

lor.end7:                                         ; preds = %lor.end
  %call5 = call i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* nonnull %new_buf) #11
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %lor.rhs10, label %lor.end13

lor.rhs10:                                        ; preds = %lor.end7
  %call11 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.halide_buffer_t* nonnull %new_buf, %struct.buffer_t* %old_buf) #12
  %tobool12 = icmp ne i32 %call11, 0
  %phitmp = zext i1 %tobool12 to i32
  br label %lor.end13

lor.end13:                                        ; preds = %lor.rhs10, %lor.end7, %lor.end, %entry
  %4 = phi i32 [ 1, %lor.end7 ], [ %phitmp, %lor.rhs10 ], [ 1, %lor.end ], [ 1, %entry ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #9
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #9
  ret i32 %4
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #4

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device_legacy(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %new_buf = alloca %struct.halide_buffer_t, align 8
  %shape = alloca [4 x %struct.halide_dimension_t], align 4
  %0 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #9
  %1 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  %2 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %2, i8 0, i64 64, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #9
  %array.begin = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i32 0, i32 0
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 9
  %3 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %3, i8 0, i64 64, i1 false)
  store %struct.halide_dimension_t* %array.begin, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %call = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf) #12
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %lor.end, label %lor.end14

lor.end:                                          ; preds = %entry
  %call2 = call i32 @halide_upgrade_buffer_t(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf, i32 0) #12
  %tobool3 = icmp eq i32 %call2, 0
  br i1 %tobool3, label %lor.end8, label %lor.end14

lor.end8:                                         ; preds = %lor.end
  %call6 = call i32 @halide_copy_to_device(i8* %user_context, %struct.halide_buffer_t* nonnull %new_buf, %struct.halide_device_interface_t* %device_interface) #11
  %tobool7 = icmp eq i32 %call6, 0
  br i1 %tobool7, label %lor.rhs11, label %lor.end14

lor.rhs11:                                        ; preds = %lor.end8
  %call12 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.halide_buffer_t* nonnull %new_buf, %struct.buffer_t* %old_buf) #12
  %tobool13 = icmp ne i32 %call12, 0
  %phitmp = zext i1 %tobool13 to i32
  br label %lor.end14

lor.end14:                                        ; preds = %lor.rhs11, %lor.end8, %lor.end, %entry
  %4 = phi i32 [ 1, %lor.end8 ], [ %phitmp, %lor.rhs11 ], [ 1, %lor.end ], [ 1, %entry ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #9
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #9
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_device_sync_legacy(i8* %user_context, %struct.buffer_t* %old_buf) local_unnamed_addr #0 {
entry:
  %new_buf = alloca %struct.halide_buffer_t, align 8
  %shape = alloca [4 x %struct.halide_dimension_t], align 4
  %0 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #9
  %1 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  %2 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %2, i8 0, i64 64, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #9
  %array.begin = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i32 0, i32 0
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 9
  %3 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %3, i8 0, i64 64, i1 false)
  store %struct.halide_dimension_t* %array.begin, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %call = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf) #12
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %lor.end, label %lor.end13

lor.end:                                          ; preds = %entry
  %call1 = call i32 @halide_upgrade_buffer_t(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf, i32 0) #12
  %tobool2 = icmp eq i32 %call1, 0
  br i1 %tobool2, label %lor.end7, label %lor.end13

lor.end7:                                         ; preds = %lor.end
  %call5 = call i32 @halide_device_sync(i8* %user_context, %struct.halide_buffer_t* nonnull %new_buf) #11
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %lor.rhs10, label %lor.end13

lor.rhs10:                                        ; preds = %lor.end7
  %call11 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.halide_buffer_t* nonnull %new_buf, %struct.buffer_t* %old_buf) #12
  %tobool12 = icmp ne i32 %call11, 0
  %phitmp = zext i1 %tobool12 to i32
  br label %lor.end13

lor.end13:                                        ; preds = %lor.rhs10, %lor.end7, %lor.end, %entry
  %4 = phi i32 [ 1, %lor.end7 ], [ %phitmp, %lor.rhs10 ], [ 1, %lor.end ], [ 1, %entry ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #9
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #9
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_device_malloc_legacy(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %new_buf = alloca %struct.halide_buffer_t, align 8
  %shape = alloca [4 x %struct.halide_dimension_t], align 4
  %0 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #9
  %1 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  %2 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %2, i8 0, i64 64, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #9
  %array.begin = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i32 0, i32 0
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 9
  %3 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %3, i8 0, i64 64, i1 false)
  store %struct.halide_dimension_t* %array.begin, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %call = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf) #12
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %lor.end, label %lor.end14

lor.end:                                          ; preds = %entry
  %call2 = call i32 @halide_upgrade_buffer_t(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf, i32 0) #12
  %tobool3 = icmp eq i32 %call2, 0
  br i1 %tobool3, label %lor.end8, label %lor.end14

lor.end8:                                         ; preds = %lor.end
  %call6 = call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %new_buf, %struct.halide_device_interface_t* %device_interface) #11
  %tobool7 = icmp eq i32 %call6, 0
  br i1 %tobool7, label %lor.rhs11, label %lor.end14

lor.rhs11:                                        ; preds = %lor.end8
  %call12 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.halide_buffer_t* nonnull %new_buf, %struct.buffer_t* %old_buf) #12
  %tobool13 = icmp ne i32 %call12, 0
  %phitmp = zext i1 %tobool13 to i32
  br label %lor.end14

lor.end14:                                        ; preds = %lor.rhs11, %lor.end8, %lor.end, %entry
  %4 = phi i32 [ 1, %lor.end8 ], [ %phitmp, %lor.rhs11 ], [ 1, %lor.end ], [ 1, %entry ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #9
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #9
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_device_free_legacy(i8* %user_context, %struct.buffer_t* %old_buf) local_unnamed_addr #0 {
entry:
  %new_buf = alloca %struct.halide_buffer_t, align 8
  %shape = alloca [4 x %struct.halide_dimension_t], align 4
  %0 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #9
  %1 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  %2 = bitcast %struct.halide_buffer_t* %new_buf to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %2, i8 0, i64 64, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #9
  %array.begin = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i32 0, i32 0
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %new_buf, i32 0, i32 9
  %3 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 %3, i8 0, i64 64, i1 false)
  store %struct.halide_dimension_t* %array.begin, %struct.halide_dimension_t** %dim, align 8, !tbaa !35
  %call = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %user_context, %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf) #12
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %lor.end, label %lor.end13

lor.end:                                          ; preds = %entry
  %call1 = call i32 @halide_upgrade_buffer_t(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.buffer_t* %old_buf, %struct.halide_buffer_t* nonnull %new_buf, i32 0) #12
  %tobool2 = icmp eq i32 %call1, 0
  br i1 %tobool2, label %lor.end7, label %lor.end13

lor.end7:                                         ; preds = %lor.end
  %call5 = call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* nonnull %new_buf) #11
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %lor.rhs10, label %lor.end13

lor.rhs10:                                        ; preds = %lor.end7
  %call11 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %user_context, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.89, i32 0, i32 0), %struct.halide_buffer_t* nonnull %new_buf, %struct.buffer_t* %old_buf) #12
  %tobool12 = icmp ne i32 %call11, 0
  %phitmp = zext i1 %tobool12 to i32
  br label %lor.end13

lor.end13:                                        ; preds = %lor.rhs10, %lor.end7, %lor.end, %entry
  %4 = phi i32 [ 1, %lor.end7 ], [ %phitmp, %lor.rhs10 ], [ 1, %lor.end ], [ 1, %entry ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #9
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #9
  ret i32 %4
}

; Function Attrs: norecurse nounwind
define weak void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* %ptr, i64 %len) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* %b) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_msan_annotate_buffer_is_initialized_as_destructor(i8* %user_context, i8* %b) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_lock(i8* %user_context, i32 %size) local_unnamed_addr #0 {
entry:
  switch i32 %size, label %sw.default [
    i32 64, label %sw.epilog
    i32 128, label %sw.bb1
  ]

sw.bb1:                                           ; preds = %entry
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then.i25, label %if.else.i26

if.then.i25:                                      ; preds = %sw.default
  %call5.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([34 x i8], [34 x i8]* @.str.102, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %cleanup12

if.else.i26:                                      ; preds = %sw.default
  %0 = ptrtoint i8* %call.i to i32
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([34 x i8], [34 x i8]* @.str.102, i32 0, i32 0)) #11
  %1 = ptrtoint i8* %call5.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %cleanup12

sw.epilog:                                        ; preds = %sw.bb1, %entry
  %mode.0 = phi i32 [ 1, %sw.bb1 ], [ 0, %entry ]
  %call5 = tail call i32 @qurt_hvx_lock(i32 %mode.0) #11
  %cmp = icmp eq i32 %call5, 0
  br i1 %cmp, label %cleanup12, label %if.then

if.then:                                          ; preds = %sw.epilog
  %call.i50 = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %tobool5.i53 = icmp eq i8* %call.i50, null
  br i1 %tobool5.i53, label %if.then.i31, label %if.else.i37

if.then.i31:                                      ; preds = %if.then
  %call5.i4582 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.104, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %cleanup12

if.else.i37:                                      ; preds = %if.then
  %2 = ptrtoint i8* %call.i50 to i32
  %add.ptr.i54 = getelementptr inbounds i8, i8* %call.i50, i32 1023
  store i8 0, i8* %add.ptr.i54, align 1, !tbaa !7
  %call5.i45 = tail call i8* @halide_string_to_string(i8* nonnull %call.i50, i8* nonnull %add.ptr.i54, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.104, i32 0, i32 0)) #11
  %3 = ptrtoint i8* %call5.i45 to i32
  %sub.ptr.sub.i.i34 = sub i32 1, %2
  %add.i.i35 = add i32 %sub.ptr.sub.i.i34, %3
  %conv.i.i36 = sext i32 %add.i.i35 to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i50, i64 %conv.i.i36) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i50) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i50) #11
  br label %cleanup12

cleanup12:                                        ; preds = %if.else.i37, %if.then.i31, %sw.epilog, %if.else.i26, %if.then.i25
  %retval.1 = phi i32 [ 0, %sw.epilog ], [ -1, %if.else.i26 ], [ -1, %if.then.i25 ], [ -1, %if.else.i37 ], [ -1, %if.then.i31 ]
  ret i32 %retval.1
}

declare i32 @qurt_hvx_lock(i32) local_unnamed_addr #2

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_unlock(i8* %user_context) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @qurt_hvx_unlock() #11
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @halide_malloc(i8* %user_context, i32 1024) #11
  %tobool5.i = icmp eq i8* %call.i, null
  br i1 %tobool5.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call5.i31 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7.105, i32 0, i32 0)) #11
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.103, i32 0, i32 0)) #11
  tail call void @halide_free(i8* %user_context, i8* null) #11
  br label %cleanup

if.else.i:                                        ; preds = %if.then
  %0 = ptrtoint i8* %call.i to i32
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !7
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7.105, i32 0, i32 0)) #11
  %1 = ptrtoint i8* %call5.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %0
  %add.i.i = add i32 %sub.ptr.sub.i.i, %1
  %conv.i.i = sext i32 %add.i.i to i64
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #11
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #11
  tail call void @halide_free(i8* %user_context, i8* nonnull %call.i) #11
  br label %cleanup

cleanup:                                          ; preds = %if.else.i, %if.then.i, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ -1, %if.else.i ], [ -1, %if.then.i ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_unlock() local_unnamed_addr #2

; Function Attrs: nounwind
define weak void @halide_qurt_hvx_unlock_as_destructor(i8* %user_context, i8*) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @halide_qurt_hvx_unlock(i8* %user_context) #12
  ret void
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32>) #7

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32>) #7

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32) #7

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32>, <32 x i32>) #7

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32>, <32 x i32>) #7

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32>, <32 x i32>) #7

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32>, i32) #7

; Function Attrs: nounwind
define weak i32 @halide_default_can_use_target_features(i32 %count, i64* %features) #0 {
entry:
  %tmp = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  %.b30 = load i1, i1* @_ZZ38halide_default_can_use_target_featuresE11initialized, align 1
  br i1 %.b30, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %0 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #9
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret %tmp) #11
  %call = call i8* @memcpy(i8* bitcast ([2 x i64]* @_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage to i8*), i8* nonnull %0, i32 16) #11
  store i1 true, i1* @_ZZ38halide_default_can_use_target_featuresE11initialized, align 1
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #9
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %cmp = icmp eq i32 %count, 1
  br i1 %cmp, label %for.body, label %if.then1

if.then1:                                         ; preds = %if.end
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.106, i32 0, i32 0)) #11
  br label %for.body

for.body:                                         ; preds = %if.then1, %if.end
  %1 = load i64, i64* %features, align 8, !tbaa !22
  %2 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage, i32 0, i32 0), align 8, !tbaa !22
  %and = and i64 %2, %1
  %cmp5 = icmp eq i64 %and, 0
  br i1 %cmp5, label %for.inc, label %if.then6

if.then6:                                         ; preds = %for.body
  %3 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage, i32 0, i32 1), align 8, !tbaa !22
  %and8 = and i64 %3, %and
  %cmp9 = icmp eq i64 %and8, %and
  br i1 %cmp9, label %for.inc, label %cleanup15

for.inc:                                          ; preds = %if.then6, %for.body
  br label %cleanup15

cleanup15:                                        ; preds = %for.inc, %if.then6
  %retval.3 = phi i32 [ 0, %if.then6 ], [ 1, %for.inc ]
  ret i32 %retval.3
}

; Function Attrs: norecurse nounwind
define weak i32 (i32, i64*)* @halide_set_custom_can_use_target_features(i32 (i32, i64*)* %fn) local_unnamed_addr #3 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 4, !tbaa !12
  store i32 (i32, i64*)* %fn, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 4, !tbaa !12
  ret i32 (i32, i64*)* %0
}

; Function Attrs: nounwind
define weak i32 @halide_can_use_target_features(i32 %count, i64* %features) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 4, !tbaa !12
  %call = tail call i32 %0(i32 %count, i64* %features) #11
  ret i32 %call
}

; Function Attrs: norecurse nounwind
define linkonce void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* noalias sret %agg.result) local_unnamed_addr #3 {
entry:
  %0 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 16, i1 false)
  ret void
}

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32>, <64 x i32>) #7

; Function Attrs: nounwind
define i32 @halide_blur_128(%struct.halide_buffer_t* noalias %input.buffer, %struct.halide_buffer_t* noalias %blur_y.buffer) local_unnamed_addr #8 {
entry:
  %0 = alloca %closure_t, align 4
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %blur_y.buffer, i32 0, i32 2
  %1 = bitcast i8** %host.i to i32*
  %2 = load i32, i32* %1, align 4, !tbaa !32
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %blur_y.buffer, i32 0, i32 9
  %3 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !35
  %min.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %3, i32 0, i32 0
  %4 = load i32, i32* %min.i, align 4, !tbaa !36
  %extent.i21 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %3, i32 0, i32 1
  %5 = load i32, i32* %extent.i21, align 4, !tbaa !38
  %min.i17 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %3, i32 1, i32 0
  %6 = load i32, i32* %min.i17, align 4, !tbaa !36
  %extent.i15 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %3, i32 1, i32 1
  %7 = load i32, i32* %extent.i15, align 4, !tbaa !38
  %stride.i13 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %3, i32 1, i32 2
  %8 = load i32, i32* %stride.i13, align 4, !tbaa !39
  %host.i11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i32 0, i32 2
  %9 = bitcast i8** %host.i11 to i32*
  %10 = load i32, i32* %9, align 4, !tbaa !32
  %dim.i9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i32 0, i32 9
  %11 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i9, align 8, !tbaa !35
  %min.i10 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 0, i32 0
  %12 = load i32, i32* %min.i10, align 4, !tbaa !36
  %extent.i8 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 0, i32 1
  %13 = load i32, i32* %extent.i8, align 4, !tbaa !38
  %min.i4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 1, i32 0
  %14 = load i32, i32* %min.i4, align 4, !tbaa !36
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 1, i32 1
  %15 = load i32, i32* %extent.i, align 4, !tbaa !38
  %stride.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 1, i32 2
  %16 = load i32, i32* %stride.i, align 4, !tbaa !39
  %17 = icmp sgt i32 %5, 256
  %18 = select i1 %17, i32 %5, i32 256
  %a3 = ashr i32 %5, 8
  %19 = icmp sgt i32 %a3, 0
  %20 = select i1 %19, i32 %a3, i32 0
  %21 = add nsw i32 %5, 255
  %22 = ashr i32 %21, 8
  %t114 = icmp slt i32 %20, %22
  %23 = lshr i32 %18, 7
  %24 = add nuw nsw i32 %18, 127
  %25 = lshr i32 %24, 7
  %t110 = icmp ult i32 %23, %25
  %26 = add nsw i32 %18, -1
  %27 = and i32 %26, -128
  %28 = icmp slt i32 %5, 256
  %29 = select i1 %28, i32 %5, i32 256
  %30 = add nsw i32 %29, %4
  %b10 = add nsw i32 %27, %30
  %31 = add nsw i32 %12, 256
  %t122 = icmp sle i32 %31, %30
  %a8 = add nsw i32 %b10, -128
  %b9 = add nsw i32 %5, %4
  %32 = icmp slt i32 %a8, %b9
  %a7 = select i1 %32, i32 %a8, i32 %b9
  %a9 = add nsw i32 %b9, 128
  %33 = icmp slt i32 %a9, %b10
  %34 = select i1 %33, i32 %a9, i32 %b10
  %b8 = add nsw i32 %34, -127
  %35 = icmp sgt i32 %a7, %b8
  %36 = select i1 %35, i32 %a7, i32 %b8
  %t124.s = sub nsw i32 %36, %30
  %37 = add nsw i32 %7, 127
  %38 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 0
  store i32 %5, i32* %38, align 4
  %39 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 1
  store i32 %7, i32* %39, align 4
  %40 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 2
  store i32 %4, i32* %40, align 4
  %41 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 3
  store i32 %6, i32* %41, align 4
  %42 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 4
  store i32 %8, i32* %42, align 4
  %43 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 5
  %44 = bitcast i8** %43 to i32*
  store i32 %10, i32* %44, align 4
  %45 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 6
  store i32 %13, i32* %45, align 4
  %46 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 7
  store i32 %15, i32* %46, align 4
  %47 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 8
  store i32 %12, i32* %47, align 4
  %48 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 9
  store i32 %14, i32* %48, align 4
  %49 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 10
  store i32 %16, i32* %49, align 4
  %50 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 11
  store i1 %t110, i1* %50, align 4
  %51 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 12
  store i1 %t114, i1* %51, align 1
  %52 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 13
  store i1 %t122, i1* %52, align 2
  %53 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 14
  store i32 %t124.s, i32* %53, align 4
  %54 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 15
  store i32 %b10, i32* %54, align 4
  %55 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 16
  %56 = bitcast i16** %55 to i32*
  store i32 %2, i32* %56, align 4
  %57 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 17
  store %struct.halide_buffer_t* %blur_y.buffer, %struct.halide_buffer_t** %57, align 4
  %58 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 18
  %59 = bitcast i16** %58 to i32*
  store i32 %10, i32* %59, align 4
  %60 = getelementptr inbounds %closure_t, %closure_t* %0, i32 0, i32 19
  store %struct.halide_buffer_t* %input.buffer, %struct.halide_buffer_t** %60, align 4
  %61 = bitcast %closure_t* %0 to i8*
  %62 = ashr i32 %37, 7
  %63 = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @halide_blur_128.par_for.blur_y.s0.y.y, i32 0, i32 %62, i8* nonnull %61)
  ret i32 0
}

; Function Attrs: nounwind
define internal dso_local i32 @halide_blur_128.par_for.blur_y.s0.y.y(i8* %__user_context, i32 %blur_y.s0.y.y, i8* noalias nocapture readonly %closure) #8 {
entry:
  %0 = bitcast i8* %closure to i32*
  %a35 = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %closure, i32 4
  %2 = bitcast i8* %1 to i32*
  %b16 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %closure, i32 8
  %4 = bitcast i8* %3 to i32*
  %blur_y.min.0 = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %closure, i32 12
  %6 = bitcast i8* %5 to i32*
  %blur_y.min.1 = load i32, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %closure, i32 16
  %8 = bitcast i8* %7 to i32*
  %blur_y.stride.1 = load i32, i32* %8, align 4
  %9 = getelementptr inbounds i8, i8* %closure, i32 24
  %10 = bitcast i8* %9 to i32*
  %input.extent.0 = load i32, i32* %10, align 4
  %11 = getelementptr inbounds i8, i8* %closure, i32 28
  %12 = bitcast i8* %11 to i32*
  %input.extent.1 = load i32, i32* %12, align 4
  %13 = getelementptr inbounds i8, i8* %closure, i32 32
  %14 = bitcast i8* %13 to i32*
  %input.min.0 = load i32, i32* %14, align 4
  %15 = getelementptr inbounds i8, i8* %closure, i32 36
  %16 = bitcast i8* %15 to i32*
  %input.min.1 = load i32, i32* %16, align 4
  %17 = getelementptr inbounds i8, i8* %closure, i32 40
  %18 = bitcast i8* %17 to i32*
  %input.stride.1 = load i32, i32* %18, align 4
  %19 = getelementptr inbounds i8, i8* %closure, i32 44
  %20 = bitcast i8* %19 to i1*
  %t110 = load i1, i1* %20, align 1
  %21 = getelementptr inbounds i8, i8* %closure, i32 45
  %22 = bitcast i8* %21 to i1*
  %t114 = load i1, i1* %22, align 1
  %23 = getelementptr inbounds i8, i8* %closure, i32 46
  %24 = bitcast i8* %23 to i1*
  %t122 = load i1, i1* %24, align 1
  %25 = getelementptr inbounds i8, i8* %closure, i32 48
  %26 = bitcast i8* %25 to i32*
  %t124.s = load i32, i32* %26, align 4
  %27 = getelementptr inbounds i8, i8* %closure, i32 52
  %28 = bitcast i8* %27 to i32*
  %b15 = load i32, i32* %28, align 4
  %29 = getelementptr inbounds i8, i8* %closure, i32 56
  %30 = bitcast i8* %29 to i16**
  %blur_y = load i16*, i16** %30, align 4
  %31 = getelementptr inbounds i8, i8* %closure, i32 64
  %32 = bitcast i8* %31 to i16**
  %input1 = load i16*, i16** %32, align 4
  %hvx_lock_result = tail call i32 @halide_qurt_hvx_lock(i8* %__user_context, i32 128) #9
  %33 = shl nsw i32 %blur_y.s0.y.y, 7
  %a11 = add nsw i32 %33, 384
  %34 = icmp slt i32 %a11, %b16
  %t141.s = select i1 %34, i32 %a11, i32 %b16
  %a13 = add nsw i32 %b15, -128
  %b14 = add nsw i32 %blur_y.min.0, %a35
  %35 = icmp slt i32 %a13, %b14
  %a12 = select i1 %35, i32 %a13, i32 %b14
  %a14 = add nsw i32 %b14, 128
  %36 = icmp slt i32 %a14, %b15
  %37 = select i1 %36, i32 %a14, i32 %b15
  %b13 = add nsw i32 %37, -127
  %38 = icmp sgt i32 %a12, %b13
  %39 = select i1 %38, i32 %a12, i32 %b13
  %40 = add nsw i32 %input.min.0, %input.extent.0
  %41 = icmp slt i32 %39, %40
  %42 = and i1 %t122, %41
  %43 = add nsw i32 %input.min.1, 128
  %44 = add nsw i32 %blur_y.min.1, %t141.s
  %45 = icmp sle i32 %43, %44
  %46 = and i1 %45, %42
  %47 = add nsw i32 %44, 2
  %48 = add nsw i32 %input.min.1, %input.extent.1
  %49 = icmp sle i32 %47, %48
  %50 = and i1 %49, %46
  br i1 %50, label %true_bb, label %after_bb

true_bb:                                          ; preds = %entry
  %51 = add nsw i32 %44, -128
  %52 = icmp slt i32 %a35, 256
  %53 = select i1 %52, i32 %a35, i32 256
  %reass.add = sub i32 %51, %input.min.1
  %reass.mul = mul i32 %reass.add, %input.stride.1
  %54 = add i32 %blur_y.min.0, -256
  %55 = add i32 %54, %53
  %56 = sub i32 %55, %input.min.0
  %57 = add i32 %56, %reass.mul
  %58 = getelementptr inbounds i16, i16* %input1, i32 %57
  %59 = shl i32 %t124.s, 1
  %60 = add i32 %59, 514
  %61 = shl nsw i32 %input.stride.1, 1
  %62 = bitcast i16* %58 to i8*
  %conv9.i = zext i32 %61 to i64
  %shl.i = shl nuw i64 %conv9.i, 32
  %conv1.i = sext i32 %60 to i64
  %shl2.i = shl nsw i64 %conv1.i, 16
  %or.i = or i64 %shl.i, %shl2.i
  %or6.i = or i64 %or.i, 281474976710786
  tail call void asm sideeffect "l2fetch($0,$1)", "r,r"(i8* %62, i64 %or6.i) #9, !srcloc !75
  br label %after_bb

after_bb:                                         ; preds = %true_bb, %entry
  %b18 = add nsw i32 %b16, -128
  %63 = icmp slt i32 %33, %b18
  %blur_y.s0.y.yi.base.s = select i1 %63, i32 %33, i32 %b18
  %64 = icmp sgt i32 %a35, 256
  %65 = select i1 %64, i32 %a35, i32 256
  %66 = shl i32 %65, 3
  %67 = add i32 %66, 130
  %68 = tail call i8* @halide_malloc(i8* %__user_context, i32 %67)
  %blur_x = bitcast i8* %68 to i16*
  %69 = add nsw i32 %blur_y.s0.y.yi.base.s, %blur_y.min.1
  %a28 = ashr i32 %a35, 8
  %70 = icmp sgt i32 %a35, 255
  %71 = select i1 %70, i32 %a28, i32 0
  %72 = lshr i32 %65, 7
  %73 = icmp eq i32 %72, 0
  %74 = icmp slt i32 %a35, 256
  %75 = select i1 %74, i32 %a35, i32 256
  %76 = add i32 %75, %blur_y.min.0
  %blur_x.s0.x.v19.base.s = sub i32 %76, %input.min.0
  %77 = sub i32 %b14, %input.min.0
  br label %"for blur_y.s0.y.yi"

"for blur_y.s0.y.yi":                             ; preds = %after_bb7, %after_bb
  %blur_y.s0.y.yi = phi i32 [ 0, %after_bb ], [ %392, %after_bb7 ]
  %78 = icmp eq i32 %blur_y.s0.y.yi, 0
  %79 = add nsw i32 %blur_y.s0.y.yi, %69
  %80 = add nsw i32 %79, 2
  %blur_x.s0.y.min_2 = select i1 %78, i32 %69, i32 %80
  %81 = add i32 %79, 3
  %82 = icmp slt i32 %blur_x.s0.y.min_2, %81
  br i1 %82, label %"for blur_x.s0.y", label %"consume blur_x", !prof !76

"end for blur_y.s0.y.yi":                         ; preds = %after_bb7
  %tobool.i = icmp eq i8* %68, null
  br i1 %tobool.i, label %call_destructor.exit17, label %if.then.i

if.then.i:                                        ; preds = %"end for blur_y.s0.y.yi"
  tail call void @halide_free(i8* %__user_context, i8* nonnull %68) #11
  br label %call_destructor.exit17

call_destructor.exit17:                           ; preds = %if.then.i, %"end for blur_y.s0.y.yi"
  tail call void @halide_qurt_hvx_unlock_as_destructor(i8* %__user_context, i8* nonnull inttoptr (i32 1 to i8*)) #11
  ret i32 0

"for blur_x.s0.y":                                ; preds = %after_bb4, %"for blur_y.s0.y.yi"
  %blur_x.s0.y = phi i32 [ %184, %after_bb4 ], [ %blur_x.s0.y.min_2, %"for blur_y.s0.y.yi" ]
  %83 = and i32 %blur_x.s0.y, 3
  %t131 = mul nsw i32 %83, %65
  br i1 %73, label %"end for blur_x.s0.x.x", label %"for blur_x.s0.x.x.preheader", !prof !77

"for blur_x.s0.x.x.preheader":                    ; preds = %"for blur_x.s0.y"
  %reass.add22 = sub i32 %blur_x.s0.y, %input.min.1
  %reass.mul23 = mul i32 %reass.add22, %input.stride.1
  %84 = add i32 %blur_x.s0.x.v19.base.s, %reass.mul23
  %r_32.i13 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 -1431590229) #9
  br label %"for blur_x.s0.x.x"

"for blur_x.s0.x.x":                              ; preds = %"for blur_x.s0.x.x", %"for blur_x.s0.x.x.preheader"
  %blur_x.s0.x.x = phi i32 [ %133, %"for blur_x.s0.x.x" ], [ 0, %"for blur_x.s0.x.x.preheader" ]
  %85 = shl nsw i32 %blur_x.s0.x.x, 7
  %t143 = add i32 %84, %85
  %86 = add nsw i32 %t143, -254
  %87 = getelementptr inbounds i16, i16* %input1, i32 %86
  %88 = bitcast i16* %87 to <32 x i32>*
  %89 = load <32 x i32>, <32 x i32>* %88, align 2, !tbaa !78
  %90 = add nsw i32 %t143, -190
  %91 = getelementptr inbounds i16, i16* %input1, i32 %90
  %92 = bitcast i16* %91 to <32 x i32>*
  %93 = load <32 x i32>, <32 x i32>* %92, align 2, !tbaa !78
  %94 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %93, <32 x i32> %89)
  %95 = add nsw i32 %t143, -256
  %96 = getelementptr inbounds i16, i16* %input1, i32 %95
  %97 = bitcast i16* %96 to <32 x i32>*
  %98 = load <32 x i32>, <32 x i32>* %97, align 2, !tbaa !78
  %99 = add nsw i32 %t143, -192
  %100 = getelementptr inbounds i16, i16* %input1, i32 %99
  %101 = bitcast i16* %100 to <32 x i32>*
  %102 = load <32 x i32>, <32 x i32>* %101, align 2, !tbaa !78
  %103 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %98)
  %104 = add nsw i32 %t143, -255
  %105 = getelementptr inbounds i16, i16* %input1, i32 %104
  %106 = bitcast i16* %105 to <32 x i32>*
  %107 = load <32 x i32>, <32 x i32>* %106, align 2, !tbaa !78
  %108 = add nsw i32 %t143, -191
  %109 = getelementptr inbounds i16, i16* %input1, i32 %108
  %110 = bitcast i16* %109 to <32 x i32>*
  %111 = load <32 x i32>, <32 x i32>* %110, align 2, !tbaa !78
  %112 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %111, <32 x i32> %107)
  %113 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %103, <64 x i32> %112) #9
  %114 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %94, <64 x i32> %113) #9
  %115 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %114)
  %116 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %114)
  %117 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %116, <32 x i32> %r_32.i13) #9
  %118 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %115, <32 x i32> %r_32.i13) #9
  %119 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %117) #9
  %120 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %117) #9
  %121 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %120, <32 x i32> %119) #9
  %122 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %118) #9
  %123 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %118) #9
  %124 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %123, <32 x i32> %122) #9
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %121, i32 1) #9
  %126 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %124, i32 1) #9
  %127 = add nuw nsw i32 %85, %t131
  %128 = getelementptr inbounds i16, i16* %blur_x, i32 %127
  %129 = bitcast i16* %128 to <32 x i32>*
  store <32 x i32> %125, <32 x i32>* %129, align 2, !tbaa !81
  %130 = add nuw nsw i32 %127, 64
  %131 = getelementptr inbounds i16, i16* %blur_x, i32 %130
  %132 = bitcast i16* %131 to <32 x i32>*
  store <32 x i32> %126, <32 x i32>* %132, align 2, !tbaa !81
  %133 = add nuw nsw i32 %blur_x.s0.x.x, 1
  %134 = icmp eq i32 %133, %72
  br i1 %134, label %"end for blur_x.s0.x.x", label %"for blur_x.s0.x.x"

"end for blur_x.s0.x.x":                          ; preds = %"for blur_x.s0.x.x", %"for blur_x.s0.y"
  br i1 %t110, label %true_bb2, label %after_bb4

true_bb2:                                         ; preds = %"end for blur_x.s0.x.x"
  %reass.add26 = sub i32 %blur_x.s0.y, %input.min.1
  %reass.mul27 = mul i32 %reass.add26, %input.stride.1
  %t144 = add i32 %77, %reass.mul27
  %135 = add nsw i32 %t144, -126
  %136 = getelementptr inbounds i16, i16* %input1, i32 %135
  %137 = bitcast i16* %136 to <32 x i32>*
  %138 = load <32 x i32>, <32 x i32>* %137, align 2, !tbaa !78
  %139 = add nsw i32 %t144, -62
  %140 = getelementptr inbounds i16, i16* %input1, i32 %139
  %141 = bitcast i16* %140 to <32 x i32>*
  %142 = load <32 x i32>, <32 x i32>* %141, align 2, !tbaa !78
  %143 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %142, <32 x i32> %138)
  %144 = add nsw i32 %t144, -128
  %145 = getelementptr inbounds i16, i16* %input1, i32 %144
  %146 = bitcast i16* %145 to <32 x i32>*
  %147 = load <32 x i32>, <32 x i32>* %146, align 2, !tbaa !78
  %148 = add nsw i32 %t144, -64
  %149 = getelementptr inbounds i16, i16* %input1, i32 %148
  %150 = bitcast i16* %149 to <32 x i32>*
  %151 = load <32 x i32>, <32 x i32>* %150, align 2, !tbaa !78
  %152 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %151, <32 x i32> %147)
  %153 = add nsw i32 %t144, -127
  %154 = getelementptr inbounds i16, i16* %input1, i32 %153
  %155 = bitcast i16* %154 to <32 x i32>*
  %156 = load <32 x i32>, <32 x i32>* %155, align 2, !tbaa !78
  %157 = add nsw i32 %t144, -63
  %158 = getelementptr inbounds i16, i16* %input1, i32 %157
  %159 = bitcast i16* %158 to <32 x i32>*
  %160 = load <32 x i32>, <32 x i32>* %159, align 2, !tbaa !78
  %161 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %160, <32 x i32> %156)
  %162 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %152, <64 x i32> %161) #9
  %163 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %143, <64 x i32> %162) #9
  %r_32.i11 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 -1431590229) #9
  %164 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %163)
  %165 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %163)
  %166 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %165, <32 x i32> %r_32.i11) #9
  %167 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %164, <32 x i32> %r_32.i11) #9
  %168 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %166) #9
  %169 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %166) #9
  %170 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %169, <32 x i32> %168) #9
  %171 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %167) #9
  %172 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %167) #9
  %173 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %172, <32 x i32> %171) #9
  %174 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %170, i32 1) #9
  %175 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %173, i32 1) #9
  %176 = add nuw nsw i32 %83, 1
  %177 = mul nsw i32 %176, %65
  %178 = add nsw i32 %177, -128
  %179 = getelementptr inbounds i16, i16* %blur_x, i32 %178
  %180 = bitcast i16* %179 to <32 x i32>*
  store <32 x i32> %174, <32 x i32>* %180, align 2, !tbaa !81
  %181 = add nsw i32 %177, -64
  %182 = getelementptr inbounds i16, i16* %blur_x, i32 %181
  %183 = bitcast i16* %182 to <32 x i32>*
  store <32 x i32> %175, <32 x i32>* %183, align 2, !tbaa !81
  br label %after_bb4

after_bb4:                                        ; preds = %true_bb2, %"end for blur_x.s0.x.x"
  %184 = add nsw i32 %blur_x.s0.y, 1
  %185 = icmp eq i32 %184, %81
  br i1 %185, label %"consume blur_x", label %"for blur_x.s0.y"

"consume blur_x":                                 ; preds = %after_bb4, %"for blur_y.s0.y.yi"
  br i1 %70, label %"for blur_y.s0.x.x.preheader", label %"end for blur_y.s0.x.x", !prof !76

"for blur_y.s0.x.x.preheader":                    ; preds = %"consume blur_x"
  %186 = and i32 %80, 3
  %t146.s = mul nsw i32 %186, %65
  %187 = and i32 %79, 3
  %t147.s = mul nsw i32 %187, %65
  %188 = add nsw i32 %79, 1
  %189 = and i32 %188, 3
  %t148.s = mul nsw i32 %189, %65
  %r_32.i9 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 -1431590229) #9
  %reass.add30 = add i32 %blur_y.s0.y.yi, %blur_y.s0.y.yi.base.s
  %reass.mul31 = mul i32 %reass.add30, %blur_y.stride.1
  br label %"for blur_y.s0.x.x"

"for blur_y.s0.x.x":                              ; preds = %"for blur_y.s0.x.x", %"for blur_y.s0.x.x.preheader"
  %blur_y.s0.x.x = phi i32 [ %288, %"for blur_y.s0.x.x" ], [ 0, %"for blur_y.s0.x.x.preheader" ]
  %190 = shl nsw i32 %blur_y.s0.x.x, 8
  %t145 = sub nsw i32 %190, %75
  %191 = add nsw i32 %t145, %t146.s
  %192 = add nsw i32 %191, 256
  %193 = getelementptr inbounds i16, i16* %blur_x, i32 %192
  %194 = bitcast i16* %193 to <32 x i32>*
  %195 = load <32 x i32>, <32 x i32>* %194, align 2, !tbaa !81
  %196 = add nsw i32 %191, 320
  %197 = getelementptr inbounds i16, i16* %blur_x, i32 %196
  %198 = bitcast i16* %197 to <32 x i32>*
  %199 = load <32 x i32>, <32 x i32>* %198, align 2, !tbaa !81
  %200 = add nsw i32 %191, 384
  %201 = getelementptr inbounds i16, i16* %blur_x, i32 %200
  %202 = bitcast i16* %201 to <32 x i32>*
  %203 = load <32 x i32>, <32 x i32>* %202, align 2, !tbaa !81
  %204 = add nsw i32 %191, 448
  %205 = getelementptr inbounds i16, i16* %blur_x, i32 %204
  %206 = bitcast i16* %205 to <32 x i32>*
  %207 = load <32 x i32>, <32 x i32>* %206, align 2, !tbaa !81
  %208 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %199, <32 x i32> %195)
  %209 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %207, <32 x i32> %203)
  %210 = add nsw i32 %t145, %t147.s
  %211 = add nsw i32 %210, 256
  %212 = getelementptr inbounds i16, i16* %blur_x, i32 %211
  %213 = bitcast i16* %212 to <32 x i32>*
  %214 = load <32 x i32>, <32 x i32>* %213, align 2, !tbaa !81
  %215 = add nsw i32 %210, 320
  %216 = getelementptr inbounds i16, i16* %blur_x, i32 %215
  %217 = bitcast i16* %216 to <32 x i32>*
  %218 = load <32 x i32>, <32 x i32>* %217, align 2, !tbaa !81
  %219 = add nsw i32 %210, 384
  %220 = getelementptr inbounds i16, i16* %blur_x, i32 %219
  %221 = bitcast i16* %220 to <32 x i32>*
  %222 = load <32 x i32>, <32 x i32>* %221, align 2, !tbaa !81
  %223 = add nsw i32 %210, 448
  %224 = getelementptr inbounds i16, i16* %blur_x, i32 %223
  %225 = bitcast i16* %224 to <32 x i32>*
  %226 = load <32 x i32>, <32 x i32>* %225, align 2, !tbaa !81
  %227 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %218, <32 x i32> %214)
  %228 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %226, <32 x i32> %222)
  %229 = add nsw i32 %t145, %t148.s
  %230 = add nsw i32 %229, 256
  %231 = getelementptr inbounds i16, i16* %blur_x, i32 %230
  %232 = bitcast i16* %231 to <32 x i32>*
  %233 = load <32 x i32>, <32 x i32>* %232, align 2, !tbaa !81
  %234 = add nsw i32 %229, 320
  %235 = getelementptr inbounds i16, i16* %blur_x, i32 %234
  %236 = bitcast i16* %235 to <32 x i32>*
  %237 = load <32 x i32>, <32 x i32>* %236, align 2, !tbaa !81
  %238 = add nsw i32 %229, 384
  %239 = getelementptr inbounds i16, i16* %blur_x, i32 %238
  %240 = bitcast i16* %239 to <32 x i32>*
  %241 = load <32 x i32>, <32 x i32>* %240, align 2, !tbaa !81
  %242 = add nsw i32 %229, 448
  %243 = getelementptr inbounds i16, i16* %blur_x, i32 %242
  %244 = bitcast i16* %243 to <32 x i32>*
  %245 = load <32 x i32>, <32 x i32>* %244, align 2, !tbaa !81
  %246 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %237, <32 x i32> %233)
  %247 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %245, <32 x i32> %241)
  %248 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %227, <64 x i32> %246) #9
  %249 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %228, <64 x i32> %247) #9
  %250 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %208, <64 x i32> %248) #9
  %251 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %209, <64 x i32> %249) #9
  %252 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %250)
  %253 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %250)
  %254 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %253, <32 x i32> %r_32.i9) #9
  %255 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %252, <32 x i32> %r_32.i9) #9
  %256 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %251)
  %257 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %251)
  %258 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %257, <32 x i32> %r_32.i9) #9
  %259 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %256, <32 x i32> %r_32.i9) #9
  %260 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %254) #9
  %261 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %254) #9
  %262 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %261, <32 x i32> %260) #9
  %263 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %255) #9
  %264 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %255) #9
  %265 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %264, <32 x i32> %263) #9
  %266 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258) #9
  %267 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %258) #9
  %268 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %267, <32 x i32> %266) #9
  %269 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %259) #9
  %270 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %259) #9
  %271 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %270, <32 x i32> %269) #9
  %272 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %262, i32 1) #9
  %273 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %265, i32 1) #9
  %274 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %268, i32 1) #9
  %275 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %271, i32 1) #9
  %276 = add i32 %reass.mul31, %190
  %277 = getelementptr inbounds i16, i16* %blur_y, i32 %276
  %278 = bitcast i16* %277 to <32 x i32>*
  store <32 x i32> %272, <32 x i32>* %278, align 2, !tbaa !83
  %279 = add nsw i32 %276, 64
  %280 = getelementptr inbounds i16, i16* %blur_y, i32 %279
  %281 = bitcast i16* %280 to <32 x i32>*
  store <32 x i32> %273, <32 x i32>* %281, align 2, !tbaa !83
  %282 = add nsw i32 %276, 128
  %283 = getelementptr inbounds i16, i16* %blur_y, i32 %282
  %284 = bitcast i16* %283 to <32 x i32>*
  store <32 x i32> %274, <32 x i32>* %284, align 2, !tbaa !83
  %285 = add nsw i32 %276, 192
  %286 = getelementptr inbounds i16, i16* %blur_y, i32 %285
  %287 = bitcast i16* %286 to <32 x i32>*
  store <32 x i32> %275, <32 x i32>* %287, align 2, !tbaa !83
  %288 = add nuw nsw i32 %blur_y.s0.x.x, 1
  %289 = icmp eq i32 %288, %71
  br i1 %289, label %"end for blur_y.s0.x.x", label %"for blur_y.s0.x.x"

"end for blur_y.s0.x.x":                          ; preds = %"for blur_y.s0.x.x", %"consume blur_x"
  br i1 %t114, label %true_bb5, label %after_bb7

true_bb5:                                         ; preds = %"end for blur_y.s0.x.x"
  %290 = and i32 %80, 3
  %291 = add nuw nsw i32 %290, 1
  %t150 = mul nsw i32 %291, %65
  %292 = and i32 %79, 3
  %293 = add nuw nsw i32 %292, 1
  %t151 = mul nsw i32 %293, %65
  %294 = add nsw i32 %79, 1
  %295 = and i32 %294, 3
  %296 = add nuw nsw i32 %295, 1
  %t152 = mul nsw i32 %296, %65
  %297 = add nsw i32 %t150, -256
  %298 = getelementptr inbounds i16, i16* %blur_x, i32 %297
  %299 = bitcast i16* %298 to <32 x i32>*
  %300 = load <32 x i32>, <32 x i32>* %299, align 2, !tbaa !81
  %301 = add nsw i32 %t150, -192
  %302 = getelementptr inbounds i16, i16* %blur_x, i32 %301
  %303 = bitcast i16* %302 to <32 x i32>*
  %304 = load <32 x i32>, <32 x i32>* %303, align 2, !tbaa !81
  %305 = add nsw i32 %t150, -128
  %306 = getelementptr inbounds i16, i16* %blur_x, i32 %305
  %307 = bitcast i16* %306 to <32 x i32>*
  %308 = load <32 x i32>, <32 x i32>* %307, align 2, !tbaa !81
  %309 = add nsw i32 %t150, -64
  %310 = getelementptr inbounds i16, i16* %blur_x, i32 %309
  %311 = bitcast i16* %310 to <32 x i32>*
  %312 = load <32 x i32>, <32 x i32>* %311, align 2, !tbaa !81
  %313 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %300)
  %314 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %312, <32 x i32> %308)
  %315 = add nsw i32 %t151, -256
  %316 = getelementptr inbounds i16, i16* %blur_x, i32 %315
  %317 = bitcast i16* %316 to <32 x i32>*
  %318 = load <32 x i32>, <32 x i32>* %317, align 2, !tbaa !81
  %319 = add nsw i32 %t151, -192
  %320 = getelementptr inbounds i16, i16* %blur_x, i32 %319
  %321 = bitcast i16* %320 to <32 x i32>*
  %322 = load <32 x i32>, <32 x i32>* %321, align 2, !tbaa !81
  %323 = add nsw i32 %t151, -128
  %324 = getelementptr inbounds i16, i16* %blur_x, i32 %323
  %325 = bitcast i16* %324 to <32 x i32>*
  %326 = load <32 x i32>, <32 x i32>* %325, align 2, !tbaa !81
  %327 = add nsw i32 %t151, -64
  %328 = getelementptr inbounds i16, i16* %blur_x, i32 %327
  %329 = bitcast i16* %328 to <32 x i32>*
  %330 = load <32 x i32>, <32 x i32>* %329, align 2, !tbaa !81
  %331 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %318)
  %332 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %330, <32 x i32> %326)
  %333 = add nsw i32 %t152, -256
  %334 = getelementptr inbounds i16, i16* %blur_x, i32 %333
  %335 = bitcast i16* %334 to <32 x i32>*
  %336 = load <32 x i32>, <32 x i32>* %335, align 2, !tbaa !81
  %337 = add nsw i32 %t152, -192
  %338 = getelementptr inbounds i16, i16* %blur_x, i32 %337
  %339 = bitcast i16* %338 to <32 x i32>*
  %340 = load <32 x i32>, <32 x i32>* %339, align 2, !tbaa !81
  %341 = add nsw i32 %t152, -128
  %342 = getelementptr inbounds i16, i16* %blur_x, i32 %341
  %343 = bitcast i16* %342 to <32 x i32>*
  %344 = load <32 x i32>, <32 x i32>* %343, align 2, !tbaa !81
  %345 = add nsw i32 %t152, -64
  %346 = getelementptr inbounds i16, i16* %blur_x, i32 %345
  %347 = bitcast i16* %346 to <32 x i32>*
  %348 = load <32 x i32>, <32 x i32>* %347, align 2, !tbaa !81
  %349 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %340, <32 x i32> %336)
  %350 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %348, <32 x i32> %344)
  %351 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %331, <64 x i32> %349) #9
  %352 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %332, <64 x i32> %350) #9
  %353 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %313, <64 x i32> %351) #9
  %354 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %314, <64 x i32> %352) #9
  %r_32.i = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 -1431590229) #9
  %355 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %353)
  %356 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %353)
  %357 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %356, <32 x i32> %r_32.i) #9
  %358 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %355, <32 x i32> %r_32.i) #9
  %359 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %354)
  %360 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %354)
  %361 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %360, <32 x i32> %r_32.i) #9
  %362 = tail call <64 x i32> @llvm.hexagon.V6.vmpyuhv.128B(<32 x i32> %359, <32 x i32> %r_32.i) #9
  %363 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %357) #9
  %364 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %357) #9
  %365 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %364, <32 x i32> %363) #9
  %366 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %358) #9
  %367 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %358) #9
  %368 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %367, <32 x i32> %366) #9
  %369 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %361) #9
  %370 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %361) #9
  %371 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %370, <32 x i32> %369) #9
  %372 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %362) #9
  %373 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %362) #9
  %374 = tail call <32 x i32> @llvm.hexagon.V6.vshufoh.128B(<32 x i32> %373, <32 x i32> %372) #9
  %375 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %365, i32 1) #9
  %376 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %368, i32 1) #9
  %377 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %371, i32 1) #9
  %378 = tail call <32 x i32> @llvm.hexagon.V6.vlsrh.128B(<32 x i32> %374, i32 1) #9
  %reass.add34 = add i32 %blur_y.s0.y.yi, %blur_y.s0.y.yi.base.s
  %reass.mul35 = mul i32 %reass.add34, %blur_y.stride.1
  %379 = add i32 %a35, %reass.mul35
  %380 = add nsw i32 %379, -256
  %381 = getelementptr inbounds i16, i16* %blur_y, i32 %380
  %382 = bitcast i16* %381 to <32 x i32>*
  store <32 x i32> %375, <32 x i32>* %382, align 2, !tbaa !83
  %383 = add nsw i32 %379, -192
  %384 = getelementptr inbounds i16, i16* %blur_y, i32 %383
  %385 = bitcast i16* %384 to <32 x i32>*
  store <32 x i32> %376, <32 x i32>* %385, align 2, !tbaa !83
  %386 = add nsw i32 %379, -128
  %387 = getelementptr inbounds i16, i16* %blur_y, i32 %386
  %388 = bitcast i16* %387 to <32 x i32>*
  store <32 x i32> %377, <32 x i32>* %388, align 2, !tbaa !83
  %389 = add nsw i32 %379, -64
  %390 = getelementptr inbounds i16, i16* %blur_y, i32 %389
  %391 = bitcast i16* %390 to <32 x i32>*
  store <32 x i32> %378, <32 x i32>* %391, align 2, !tbaa !83
  br label %after_bb7

after_bb7:                                        ; preds = %true_bb5, %"end for blur_y.s0.x.x"
  %392 = add nuw nsw i32 %blur_y.s0.y.yi, 1
  %393 = icmp eq i32 %392, 128
  br i1 %393, label %"end for blur_y.s0.y.yi", label %"for blur_y.s0.y.yi"
}

; Function Attrs: nounwind
define i32 @halide_blur_128_argv(i8** nocapture readonly) local_unnamed_addr #9 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 4
  %3 = getelementptr i8*, i8** %0, i32 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 4
  %6 = tail call i32 @halide_blur_128(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5) #13
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone
define nonnull %struct.halide_filter_metadata_t* @halide_blur_128_metadata() local_unnamed_addr #10 {
entry:
  ret %struct.halide_filter_metadata_t* @halide_blur_128_metadata_storage
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone speculatable }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind "reciprocal-estimates"="none" }
attributes #9 = { nounwind }
attributes #10 = { norecurse nounwind readnone }
attributes #11 = { nobuiltin nounwind }
attributes #12 = { nobuiltin }
attributes #13 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, !"halide_use_soft_float_abi", i32 0}
!3 = !{i32 2, !"halide_mcpu", !"hexagonv60"}
!4 = !{i32 2, !"halide_mattrs", !"+hvx-length128b,+long-calls"}
!5 = !{i32 2, !"halide_per_instruction_fast_math_flags", i32 0}
!6 = !{!"Clang $LLVM_VERSION_MAJOR.$LLVM_VERSION_MINOR (based on LLVM 7.0.0)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !8, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
!17 = !{!18, !18, i64 0}
!18 = !{!"bool", !8, i64 0}
!19 = !{i8 0, i8 2}
!20 = !{!21, !21, i64 0}
!21 = !{!"double", !8, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"long long", !8, i64 0}
!24 = !{!25, !8, i64 0}
!25 = !{!"_ZTS13halide_type_t", !8, i64 0, !8, i64 1, !26, i64 2}
!26 = !{!"short", !8, i64 0}
!27 = !{!25, !8, i64 1}
!28 = !{!25, !26, i64 2}
!29 = !{!30, !23, i64 0}
!30 = !{!"_ZTS15halide_buffer_t", !23, i64 0, !13, i64 8, !13, i64 12, !23, i64 16, !23, i64 24, !23, i64 32, !23, i64 40, !25, i64 48, !11, i64 52, !13, i64 56, !13, i64 60}
!31 = !{!30, !13, i64 8}
!32 = !{!30, !13, i64 12}
!33 = !{!30, !23, i64 16}
!34 = !{!30, !11, i64 52}
!35 = !{!30, !13, i64 56}
!36 = !{!37, !11, i64 0}
!37 = !{!"_ZTS18halide_dimension_t", !11, i64 0, !11, i64 4, !11, i64 8, !11, i64 12}
!38 = !{!37, !11, i64 4}
!39 = !{!37, !11, i64 8}
!40 = !{!41, !23, i64 0}
!41 = !{!"_ZTSN6Halide7Runtime8Internal11device_copyE", !23, i64 0, !23, i64 8, !23, i64 16, !8, i64 24, !8, i64 152, !8, i64 280, !23, i64 408}
!42 = !{!41, !23, i64 8}
!43 = !{!41, !23, i64 408}
!44 = !{!41, !23, i64 16}
!45 = !{i64 0, i64 8, !22, i64 8, i64 8, !22, i64 16, i64 8, !22, i64 24, i64 128, !7, i64 152, i64 128, !7, i64 280, i64 128, !7, i64 408, i64 8, !22}
!46 = !{!47, !13, i64 60}
!47 = !{!"_ZTS25halide_device_interface_t", !13, i64 0, !13, i64 4, !13, i64 8, !13, i64 12, !13, i64 16, !13, i64 20, !13, i64 24, !13, i64 28, !13, i64 32, !13, i64 36, !13, i64 40, !13, i64 44, !13, i64 48, !13, i64 52, !13, i64 56, !13, i64 60}
!48 = !{!49, !13, i64 24}
!49 = !{!"_ZTS30halide_device_interface_impl_t", !13, i64 0, !13, i64 4, !13, i64 8, !13, i64 12, !13, i64 16, !13, i64 20, !13, i64 24, !13, i64 28, !13, i64 32, !13, i64 36, !13, i64 40, !13, i64 44, !13, i64 48, !13, i64 52, !13, i64 56, !13, i64 60}
!50 = !{!49, !13, i64 20}
!51 = !{!49, !13, i64 28}
!52 = !{!49, !13, i64 0}
!53 = !{!49, !13, i64 8}
!54 = !{!49, !13, i64 4}
!55 = !{!49, !13, i64 16}
!56 = !{!49, !13, i64 12}
!57 = !{!49, !13, i64 32}
!58 = !{!49, !13, i64 36}
!59 = !{!49, !13, i64 56}
!60 = !{!49, !13, i64 60}
!61 = !{!49, !13, i64 40}
!62 = !{!49, !13, i64 44}
!63 = !{!49, !13, i64 48}
!64 = !{!49, !13, i64 52}
!65 = !{i32 22, i32 33}
!66 = !{!67, !11, i64 60}
!67 = !{!"_ZTS8buffer_t", !23, i64 0, !13, i64 8, !8, i64 12, !8, i64 28, !8, i64 44, !11, i64 60, !18, i64 64, !18, i64 65, !8, i64 66}
!68 = !{!67, !13, i64 8}
!69 = !{!67, !23, i64 0}
!70 = !{!71, !23, i64 0}
!71 = !{!"_ZTSN6Halide7Runtime8Internal15old_dev_wrapperE", !23, i64 0, !13, i64 8}
!72 = !{!71, !13, i64 8}
!73 = !{!67, !18, i64 64}
!74 = !{!67, !18, i64 65}
!75 = !{i32 2204}
!76 = !{!"branch_weights", i32 1073741824, i32 0}
!77 = !{!"branch_weights", i32 0, i32 1073741824}
!78 = !{!79, !79, i64 0}
!79 = !{!"input", !80, i64 0}
!80 = !{!"Halide buffer"}
!81 = !{!82, !82, i64 0}
!82 = !{!"blur_x", !80, i64 0}
!83 = !{!84, !84, i64 0}
!84 = !{!"blur_y", !80, i64 0}