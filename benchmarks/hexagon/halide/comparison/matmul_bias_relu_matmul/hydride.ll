; ModuleID = 'matmul_bias_relu_matmul_hvx128'
source_filename = "/home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/src/runtime/qurt_allocator.cpp"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon-unknown--elf"

%struct.halide_parallel_task_t = type { i32 (i8*, i32, i32, i8*, i8*)*, i8*, i8*, %struct.halide_semaphore_acquire_t*, i32, i32, i32, i32, i8 }
%struct.halide_semaphore_acquire_t = type { %struct.halide_semaphore_t*, i32 }
%struct.halide_semaphore_t = type { [2 x i64] }
%struct.halide_mutex_array = type { %struct.halide_mutex* }
%struct.halide_mutex = type { [1 x i32] }
%struct.halide_device_allocation_pool = type { i32 (i8*)*, %struct.halide_device_allocation_pool* }
%struct.halide_filter_argument_t = type { i8*, i32, i32, %struct.halide_type_t, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, i64** }
%struct.halide_type_t = type { i8, i8, i16 }
%struct.halide_scalar_value_t = type { %union.anon }
%union.anon = type { i64 }
%struct.halide_filter_metadata_t = type { i32, i32, %struct.halide_filter_argument_t*, i8*, i8* }
%struct.halide_thread = type opaque
%struct.halide_buffer_t = type { i64, %struct.halide_device_interface_t*, i8*, i64, %struct.halide_type_t, i32, %struct.halide_dimension_t*, i8* }
%struct.halide_device_interface_t = type { i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, void (i8*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, i32*, i32*)*, %struct.halide_device_interface_impl_t* }
%struct.halide_device_interface_impl_t = type { void ()*, void ()*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*)* }
%struct.halide_dimension_t = type { i32, i32, i32, i32 }
%"struct.Halide::Runtime::Internal::device_copy" = type { i64, i64, i64, [16 x i64], [16 x i64], [16 x i64], i64 }
%"struct.Halide::Runtime::Internal::CpuFeatures" = type { [2 x i64], [2 x i64] }

@_ZN6Halide7Runtime8Internal11buf_is_usedE = linkonce global [10 x i32] zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal7mem_bufE = linkonce local_unnamed_addr global [10 x i8*] zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal13custom_mallocE = linkonce local_unnamed_addr global i8* (i8*, i32)* @halide_default_malloc, align 4
@_ZN6Halide7Runtime8Internal11custom_freeE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_free, align 4
@.str = private unnamed_addr constant [45 x i8] c"custom allocators not supported on Hexagon.\0A\00", align 1
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv, i8* null }]
@_ZN6Halide7Runtime8Internal14custom_do_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_default_do_task, align 4
@_ZN6Halide7Runtime8Internal19custom_do_loop_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* @halide_default_do_loop_task, align 4
@_ZN6Halide7Runtime8Internal17custom_do_par_forE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_default_do_par_for, align 4
@_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE = linkonce local_unnamed_addr global i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* @halide_default_do_parallel_tasks, align 4
@.str.1 = private unnamed_addr constant [67 x i8] c"halide_default_do_parallel_tasks not implemented on this platform.\00", align 1
@_ZN6Halide7Runtime8Internal21custom_semaphore_initE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_init, align 4
@.str.1.2 = private unnamed_addr constant [64 x i8] c"halide_default_semaphore_init not implemented on this platform.\00", align 1
@_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE = linkonce local_unnamed_addr global i1 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_try_acquire, align 4
@.str.3 = private unnamed_addr constant [71 x i8] c"halide_default_semaphore_try_acquire not implemented on this platform.\00", align 1
@_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_release, align 4
@.str.2 = private unnamed_addr constant [67 x i8] c"halide_default_semaphore_release not implemented on this platform.\00", align 1
@_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE = linkonce global %struct.halide_mutex_array zeroinitializer, align 4
@.str.4 = private unnamed_addr constant [54 x i8] c"halide_spawn_thread not implemented on this platform.\00", align 1
@.str.5 = private unnamed_addr constant [53 x i8] c"halide_join_thread not implemented on this platform.\00", align 1
@.str.6 = private unnamed_addr constant [69 x i8] c"halide_set_num_threads: only supports a value of 1 on this platform.\00", align 1
@_ZN6Halide7Runtime8Internal17halide_gpu_deviceE = linkonce local_unnamed_addr global i32 0, align 4
@_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE = linkonce global i8 0, align 1
@_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"HL_GPU_DEVICE\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"<nullptr>\00", align 1
@.str.1.9 = private unnamed_addr constant [5 x i8] c"-nan\00", align 1
@.str.2.10 = private unnamed_addr constant [4 x i8] c"nan\00", align 1
@.str.3.11 = private unnamed_addr constant [5 x i8] c"-inf\00", align 1
@.str.4.12 = private unnamed_addr constant [4 x i8] c"inf\00", align 1
@.str.5.13 = private unnamed_addr constant [14 x i8] c"-0.000000e+00\00", align 1
@.str.6.14 = private unnamed_addr constant [13 x i8] c"0.000000e+00\00", align 1
@.str.7.15 = private unnamed_addr constant [10 x i8] c"-0.000000\00", align 1
@.str.8.16 = private unnamed_addr constant [9 x i8] c"0.000000\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"e+\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"e-\00", align 1
@.str.13 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str.18 = private unnamed_addr constant [14 x i8] c"bad_type_code\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"handle\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"uint\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.20 = private unnamed_addr constant [8 x i8] c"nullptr\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"buffer(\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c", {\00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE = linkonce local_unnamed_addr global i8 1, align 1
@_ZN6Halide7Runtime8Internal21allocation_pools_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal23device_allocation_poolsE = linkonce local_unnamed_addr global %struct.halide_device_allocation_pool* null, align 4
@_ZN6Halide7Runtime8Internal17device_copy_mutexE = linkonce global %struct.halide_mutex zeroinitializer, align 4
@.str.6.17 = private unnamed_addr constant [20 x i8] c"halide_copy_to_host\00", align 1
@.str.7.18 = private unnamed_addr constant [22 x i8] c"halide_copy_to_device\00", align 1
@.str.9.19 = private unnamed_addr constant [61 x i8] c"halide_copy_to_device does not support switching interfaces\0A\00", align 1
@.str.17.20 = private unnamed_addr constant [21 x i8] c"halide_device_malloc\00", align 1
@.str.20.21 = private unnamed_addr constant [59 x i8] c"halide_device_malloc doesn't support switching interfaces\0A\00", align 1
@.str.16.22 = private unnamed_addr constant [19 x i8] c"halide_device_sync\00", align 1
@.str.21.23 = private unnamed_addr constant [19 x i8] c"halide_device_free\00", align 1
@.str.22.24 = private unnamed_addr constant [157 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/src/runtime/device_interface.cpp:252 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.23.25 = private unnamed_addr constant [30 x i8] c"halide_device_and_host_malloc\00", align 1
@.str.25.26 = private unnamed_addr constant [68 x i8] c"halide_device_and_host_malloc doesn't support switching interfaces\0A\00", align 1
@.str.26 = private unnamed_addr constant [42 x i8] c"allocating host and device memory failed\0A\00", align 1
@.str.27 = private unnamed_addr constant [28 x i8] c"halide_device_and_host_free\00", align 1
@.str.28 = private unnamed_addr constant [157 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/src/runtime/device_interface.cpp:317 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.29 = private unnamed_addr constant [38 x i8] c"halide_default_device_and_host_malloc\00", align 1
@.str.30 = private unnamed_addr constant [36 x i8] c"halide_default_device_and_host_free\00", align 1
@.str.31 = private unnamed_addr constant [26 x i8] c"halide_device_wrap_native\00", align 1
@.str.32 = private unnamed_addr constant [64 x i8] c"halide_device_wrap_native doesn't support switching interfaces\0A\00", align 1
@.str.33 = private unnamed_addr constant [28 x i8] c"halide_device_detach_native\00", align 1
@.str.34 = private unnamed_addr constant [157 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/src/runtime/device_interface.cpp:403 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.35 = private unnamed_addr constant [36 x i8] c"halide_default_device_detach_native\00", align 1
@.str.41 = private unnamed_addr constant [64 x i8] c"halide_buffer_copy does not support switching device interfaces\00", align 1
@.str.58 = private unnamed_addr constant [44 x i8] c"device_interface does not support cropping\0A\00", align 1
@.str.59 = private unnamed_addr constant [43 x i8] c"device_interface does not support slicing\0A\00", align 1
@.str.60 = private unnamed_addr constant [52 x i8] c"destination buffer already has a device allocation\0A\00", align 1
@.str.61 = private unnamed_addr constant [48 x i8] c"src and dst must have identical dimensionality\0A\00", align 1
@.str.64 = private unnamed_addr constant [52 x i8] c"dst must have exactly one fewer dimension than src\0A\00", align 1
@.str.36 = private unnamed_addr constant [41 x i8] c"Bounds inference call to external stage \00", align 1
@.str.1.37 = private unnamed_addr constant [27 x i8] c" returned non-zero value: \00", align 1
@.str.2.38 = private unnamed_addr constant [24 x i8] c"Call to external stage \00", align 1
@.str.3.39 = private unnamed_addr constant [18 x i8] c"Bounds given for \00", align 1
@.str.4.40 = private unnamed_addr constant [5 x i8] c" in \00", align 1
@.str.5.41 = private unnamed_addr constant [8 x i8] c" (from \00", align 1
@.str.6.42 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@.str.7.43 = private unnamed_addr constant [38 x i8] c") do not cover required region (from \00", align 1
@.str.8.44 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.9.45 = private unnamed_addr constant [11 x i8] c" has type \00", align 1
@.str.10.46 = private unnamed_addr constant [38 x i8] c" but type of the buffer passed in is \00", align 1
@.str.11.47 = private unnamed_addr constant [31 x i8] c" requires a buffer of exactly \00", align 1
@.str.12.48 = private unnamed_addr constant [43 x i8] c" dimensions, but the buffer passed in has \00", align 1
@.str.13.49 = private unnamed_addr constant [12 x i8] c" dimensions\00", align 1
@.str.14.50 = private unnamed_addr constant [17 x i8] c" is accessed at \00", align 1
@.str.15.51 = private unnamed_addr constant [28 x i8] c", which is before the min (\00", align 1
@.str.16.52 = private unnamed_addr constant [16 x i8] c") in dimension \00", align 1
@.str.17.53 = private unnamed_addr constant [28 x i8] c", which is beyond the max (\00", align 1
@.str.18.54 = private unnamed_addr constant [29 x i8] c"Total allocation for buffer \00", align 1
@.str.19.55 = private unnamed_addr constant [5 x i8] c" is \00", align 1
@.str.20.56 = private unnamed_addr constant [37 x i8] c", which exceeds the maximum size of \00", align 1
@.str.21.57 = private unnamed_addr constant [24 x i8] c"The extents for buffer \00", align 1
@.str.22.58 = private unnamed_addr constant [12 x i8] c" dimension \00", align 1
@.str.23.59 = private unnamed_addr constant [15 x i8] c" is negative (\00", align 1
@.str.24.60 = private unnamed_addr constant [31 x i8] c"Product of extents for buffer \00", align 1
@.str.25.61 = private unnamed_addr constant [29 x i8] c"Applying the constraints on \00", align 1
@.str.26.62 = private unnamed_addr constant [54 x i8] c" to the required region made it smaller in dimension \00", align 1
@.str.27.63 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.28.64 = private unnamed_addr constant [16 x i8] c"Required size: \00", align 1
@.str.29.65 = private unnamed_addr constant [19 x i8] c"Constrained size: \00", align 1
@.str.30.66 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.31.67 = private unnamed_addr constant [22 x i8] c"Constraint violated: \00", align 1
@.str.32.68 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.33.69 = private unnamed_addr constant [6 x i8] c") == \00", align 1
@.str.34.70 = private unnamed_addr constant [11 x i8] c"Parameter \00", align 1
@.str.35.71 = private unnamed_addr constant [23 x i8] c" but must be at least \00", align 1
@.str.36.72 = private unnamed_addr constant [22 x i8] c" but must be at most \00", align 1
@.str.37 = private unnamed_addr constant [47 x i8] c"Out of memory (halide_malloc returned nullptr)\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"Buffer argument \00", align 1
@.str.39 = private unnamed_addr constant [12 x i8] c" is nullptr\00", align 1
@.str.40 = private unnamed_addr constant [25 x i8] c"Failed to dump function \00", align 1
@.str.41.73 = private unnamed_addr constant [10 x i8] c" to file \00", align 1
@.str.42 = private unnamed_addr constant [13 x i8] c" with error \00", align 1
@.str.43 = private unnamed_addr constant [21 x i8] c"The host pointer of \00", align 1
@.str.44 = private unnamed_addr constant [22 x i8] c" is not aligned to a \00", align 1
@.str.45 = private unnamed_addr constant [17 x i8] c" bytes boundary.\00", align 1
@.str.46 = private unnamed_addr constant [12 x i8] c"The buffer \00", align 1
@.str.47 = private unnamed_addr constant [53 x i8] c" is dirty on device, but this pipeline was compiled \00", align 1
@.str.48 = private unnamed_addr constant [43 x i8] c"with no support for device to host copies.\00", align 1
@.str.49 = private unnamed_addr constant [55 x i8] c" is null, but the pipeline will access it on the host.\00", align 1
@.str.50 = private unnamed_addr constant [30 x i8] c"The folded storage dimension \00", align 1
@.str.51 = private unnamed_addr constant [5 x i8] c" of \00", align 1
@.str.52 = private unnamed_addr constant [36 x i8] c" was accessed out of order by loop \00", align 1
@.str.53 = private unnamed_addr constant [23 x i8] c"Cannot fold dimension \00", align 1
@.str.54 = private unnamed_addr constant [36 x i8] c" because an extern stage accesses [\00", align 1
@.str.55 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.56 = private unnamed_addr constant [3 x i8] c"],\00", align 1
@.str.57 = private unnamed_addr constant [47 x i8] c" which is outside the range currently valid: [\00", align 1
@.str.58.74 = private unnamed_addr constant [3 x i8] c"].\00", align 1
@.str.59.75 = private unnamed_addr constant [47 x i8] c" which wraps around the boundary of the fold, \00", align 1
@.str.60.76 = private unnamed_addr constant [30 x i8] c"which occurs at multiples of \00", align 1
@.str.61.77 = private unnamed_addr constant [18 x i8] c"The fold factor (\00", align 1
@.str.62 = private unnamed_addr constant [16 x i8] c") of dimension \00", align 1
@.str.63 = private unnamed_addr constant [61 x i8] c" is too small to store the required region accessed by loop \00", align 1
@.str.64.78 = private unnamed_addr constant [3 x i8] c").\00", align 1
@.str.65 = private unnamed_addr constant [22 x i8] c"Requirement Failed: (\00", align 1
@.str.66 = private unnamed_addr constant [3 x i8] c") \00", align 1
@.str.67 = private unnamed_addr constant [59 x i8] c"A schedule specialized with specialize_fail() was chosen: \00", align 1
@.str.68 = private unnamed_addr constant [55 x i8] c"Buffer has a non-zero device but no device interface.\0A\00", align 1
@.str.69 = private unnamed_addr constant [57 x i8] c"Buffer has a non-null device_interface but device is 0.\0A\00", align 1
@.str.70 = private unnamed_addr constant [49 x i8] c"Buffer has both host and device dirty bits set.\0A\00", align 1
@.str.71 = private unnamed_addr constant [26 x i8] c"Buffer pointer passed to \00", align 1
@.str.72 = private unnamed_addr constant [11 x i8] c" is null.\0A\00", align 1
@.str.73 = private unnamed_addr constant [32 x i8] c"The explicit allocation bound (\00", align 1
@.str.74 = private unnamed_addr constant [45 x i8] c" is too small to store the required region (\00", align 1
@.str.75 = private unnamed_addr constant [77 x i8] c"Buffer could not be cropped (runtime error or unimplemented device option).\0A\00", align 1
@.str.4.91 = private unnamed_addr constant [22 x i8] c"qurt_hvx_lock failed\0A\00", align 1
@.str.7.92 = private unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@.str.6.93 = private unnamed_addr constant [24 x i8] c"qurt_hvx_unlock failed\0A\00", align 1
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 4
@_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE = linkonce global [4 x i64] zeroinitializer, align 8
@.str.94 = private unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@0 = private constant [6 x i64*] zeroinitializer
@str = private constant [2 x i8] c"A\00", align 32
@1 = private constant [6 x i64*] zeroinitializer
@str.102 = private constant [2 x i8] c"B\00", align 32
@2 = private constant [6 x i64*] zeroinitializer
@str.103 = private constant [2 x i8] c"C\00", align 32
@3 = private constant [2 x i64*] zeroinitializer
@str.104 = private constant [5 x i8] c"bias\00", align 32
@4 = private constant [6 x i64*] zeroinitializer
@str.105 = private constant [7 x i8] c"output\00", align 32
@5 = private constant [5 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0), i32 1, i32 3, %struct.halide_type_t { i8 0, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([6 x i64*], [6 x i64*]* @0, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.102, i32 0, i32 0), i32 1, i32 3, %struct.halide_type_t { i8 0, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([6 x i64*], [6 x i64*]* @1, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.103, i32 0, i32 0), i32 1, i32 3, %struct.halide_type_t { i8 0, i8 16, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([6 x i64*], [6 x i64*]* @2, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.104, i32 0, i32 0), i32 1, i32 1, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([2 x i64*], [2 x i64*]* @3, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.105, i32 0, i32 0), i32 2, i32 3, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([6 x i64*], [6 x i64*]* @4, i32 0, i32 0) }]
@str.106 = private constant [63 x i8] c"hexagon-32-noos-hvx-hvx_128-hvx_v66-no_asserts-no_bounds_query\00", align 128
@str.107 = private constant [31 x i8] c"matmul_bias_relu_matmul_hvx128\00", align 32
@matmul_bias_relu_matmul_hvx128_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 5, %struct.halide_filter_argument_t* getelementptr inbounds ([5 x %struct.halide_filter_argument_t], [5 x %struct.halide_filter_argument_t]* @5, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @str.106, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str.107, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0)], align 4

; Function Attrs: nounwind mustprogress
define linkonce i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 %alignment, i32 %size) local_unnamed_addr #0 {
entry:
  %add = add i32 %alignment, -1
  %sub = add i32 %add, %size
  %neg = sub i32 0, %alignment
  %and = and i32 %sub, %neg
  %add2 = add i32 %and, %alignment
  %call = tail call i8* @malloc(i32 %add2) #14
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %0 = ptrtoint i8* %call to i32
  %add3 = add i32 %alignment, 3
  %sub5 = add i32 %add3, %0
  %and8 = and i32 %sub5, %neg
  %1 = inttoptr i32 %and8 to i8*
  %2 = inttoptr i32 %and8 to i8**
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 -1
  store i8* %call, i8** %arrayidx, align 4, !tbaa !10
  br label %cleanup

cleanup:                                          ; preds = %if.end, %entry
  %retval.0 = phi i8* [ %1, %if.end ], [ null, %entry ]
  ret i8* %retval.0
}

declare i8* @malloc(i32) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %ptr) local_unnamed_addr #0 {
entry:
  %tobool.not = icmp eq i8* %ptr, null
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8, i8* %ptr, i32 -4
  %0 = bitcast i8* %arrayidx to i8**
  %1 = load i8*, i8** %0, align 4, !tbaa !10
  tail call void @free(i8* %1) #14
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @free(i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv() #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 0), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %0) #15
  %1 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 1), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %1) #15
  %2 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 2), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %2) #15
  %3 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 3), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %3) #15
  %4 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 4), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %4) #15
  %5 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 5), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %5) #15
  %6 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 6), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %6) #15
  %7 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 7), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %7) #15
  %8 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 8), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %8) #15
  %9 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 9), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %9) #15
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_default_malloc(i8* %user_context, i32 %x) #0 {
entry:
  %cmp = icmp ult i32 %x, 65537
  br i1 %cmp, label %for.body.preheader, label %if.end9

for.body.preheader:                               ; preds = %entry
  %0 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 0), i32 0, i32 1 seq_cst seq_cst
  %cmp2 = extractvalue { i32, i1 } %0, 1
  br i1 %cmp2, label %for.body.preheader.if.then3_crit_edge, label %for.inc

for.body.preheader.if.then3_crit_edge:            ; preds = %for.body.preheader
  %arrayidx.0 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 0
  br label %if.then3

if.then3:                                         ; preds = %for.inc.8.if.then3_crit_edge, %for.inc.7.if.then3_crit_edge, %for.inc.6.if.then3_crit_edge, %for.inc.5.if.then3_crit_edge, %for.inc.4.if.then3_crit_edge, %for.inc.3.if.then3_crit_edge, %for.inc.2.if.then3_crit_edge, %for.inc.1.if.then3_crit_edge, %for.inc.if.then3_crit_edge, %for.body.preheader.if.then3_crit_edge
  %arrayidx.phi = phi i8** [ %arrayidx.0, %for.body.preheader.if.then3_crit_edge ], [ %arrayidx.1, %for.inc.if.then3_crit_edge ], [ %arrayidx.2, %for.inc.1.if.then3_crit_edge ], [ %arrayidx.3, %for.inc.2.if.then3_crit_edge ], [ %arrayidx.4, %for.inc.3.if.then3_crit_edge ], [ %arrayidx.5, %for.inc.4.if.then3_crit_edge ], [ %arrayidx.6, %for.inc.5.if.then3_crit_edge ], [ %arrayidx.7, %for.inc.6.if.then3_crit_edge ], [ %arrayidx.8, %for.inc.7.if.then3_crit_edge ], [ %arrayidx.9, %for.inc.8.if.then3_crit_edge ]
  %1 = load i8*, i8** %arrayidx.phi, align 4, !tbaa !10
  %cmp4 = icmp eq i8* %1, null
  br i1 %cmp4, label %if.then5, label %cleanup11

if.then5:                                         ; preds = %if.then3
  %call = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 65536) #15
  store i8* %call, i8** %arrayidx.phi, align 4, !tbaa !10
  br label %cleanup11

for.inc:                                          ; preds = %for.body.preheader
  %2 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 1), i32 0, i32 1 seq_cst seq_cst
  %cmp2.1 = extractvalue { i32, i1 } %2, 1
  br i1 %cmp2.1, label %for.inc.if.then3_crit_edge, label %for.inc.1

for.inc.if.then3_crit_edge:                       ; preds = %for.inc
  %arrayidx.1 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 1
  br label %if.then3

if.end9:                                          ; preds = %for.inc.8, %entry
  %call10 = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 %x) #15
  br label %cleanup11

cleanup11:                                        ; preds = %if.end9, %if.then5, %if.then3
  %retval.1 = phi i8* [ %call10, %if.end9 ], [ %1, %if.then3 ], [ %call, %if.then5 ]
  ret i8* %retval.1

for.inc.1:                                        ; preds = %for.inc
  %3 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 2), i32 0, i32 1 seq_cst seq_cst
  %cmp2.2 = extractvalue { i32, i1 } %3, 1
  br i1 %cmp2.2, label %for.inc.1.if.then3_crit_edge, label %for.inc.2

for.inc.1.if.then3_crit_edge:                     ; preds = %for.inc.1
  %arrayidx.2 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 2
  br label %if.then3

for.inc.2:                                        ; preds = %for.inc.1
  %4 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 3), i32 0, i32 1 seq_cst seq_cst
  %cmp2.3 = extractvalue { i32, i1 } %4, 1
  br i1 %cmp2.3, label %for.inc.2.if.then3_crit_edge, label %for.inc.3

for.inc.2.if.then3_crit_edge:                     ; preds = %for.inc.2
  %arrayidx.3 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 3
  br label %if.then3

for.inc.3:                                        ; preds = %for.inc.2
  %5 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 4), i32 0, i32 1 seq_cst seq_cst
  %cmp2.4 = extractvalue { i32, i1 } %5, 1
  br i1 %cmp2.4, label %for.inc.3.if.then3_crit_edge, label %for.inc.4

for.inc.3.if.then3_crit_edge:                     ; preds = %for.inc.3
  %arrayidx.4 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 4
  br label %if.then3

for.inc.4:                                        ; preds = %for.inc.3
  %6 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 5), i32 0, i32 1 seq_cst seq_cst
  %cmp2.5 = extractvalue { i32, i1 } %6, 1
  br i1 %cmp2.5, label %for.inc.4.if.then3_crit_edge, label %for.inc.5

for.inc.4.if.then3_crit_edge:                     ; preds = %for.inc.4
  %arrayidx.5 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 5
  br label %if.then3

for.inc.5:                                        ; preds = %for.inc.4
  %7 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 6), i32 0, i32 1 seq_cst seq_cst
  %cmp2.6 = extractvalue { i32, i1 } %7, 1
  br i1 %cmp2.6, label %for.inc.5.if.then3_crit_edge, label %for.inc.6

for.inc.5.if.then3_crit_edge:                     ; preds = %for.inc.5
  %arrayidx.6 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 6
  br label %if.then3

for.inc.6:                                        ; preds = %for.inc.5
  %8 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 7), i32 0, i32 1 seq_cst seq_cst
  %cmp2.7 = extractvalue { i32, i1 } %8, 1
  br i1 %cmp2.7, label %for.inc.6.if.then3_crit_edge, label %for.inc.7

for.inc.6.if.then3_crit_edge:                     ; preds = %for.inc.6
  %arrayidx.7 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 7
  br label %if.then3

for.inc.7:                                        ; preds = %for.inc.6
  %9 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 8), i32 0, i32 1 seq_cst seq_cst
  %cmp2.8 = extractvalue { i32, i1 } %9, 1
  br i1 %cmp2.8, label %for.inc.7.if.then3_crit_edge, label %for.inc.8

for.inc.7.if.then3_crit_edge:                     ; preds = %for.inc.7
  %arrayidx.8 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 8
  br label %if.then3

for.inc.8:                                        ; preds = %for.inc.7
  %10 = cmpxchg i32* getelementptr inbounds ([10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 9), i32 0, i32 1 seq_cst seq_cst
  %cmp2.9 = extractvalue { i32, i1 } %10, 1
  br i1 %cmp2.9, label %for.inc.8.if.then3_crit_edge, label %if.end9

for.inc.8.if.then3_crit_edge:                     ; preds = %for.inc.8
  %arrayidx.9 = getelementptr inbounds [10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 9
  br label %if.then3
}

; Function Attrs: nounwind mustprogress
define weak void @halide_default_free(i8* %user_context, i8* %ptr) #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 0), align 4, !tbaa !10
  %cmp1 = icmp eq i8* %0, %ptr
  br i1 %cmp1, label %entry.if.then_crit_edge, label %for.inc

entry.if.then_crit_edge:                          ; preds = %entry
  %arrayidx2.0 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 0
  br label %if.then

if.then:                                          ; preds = %for.inc.8.if.then_crit_edge, %for.inc.7.if.then_crit_edge, %for.inc.6.if.then_crit_edge, %for.inc.5.if.then_crit_edge, %for.inc.4.if.then_crit_edge, %for.inc.3.if.then_crit_edge, %for.inc.2.if.then_crit_edge, %for.inc.1.if.then_crit_edge, %for.inc.if.then_crit_edge, %entry.if.then_crit_edge
  %arrayidx2.phi = phi i32* [ %arrayidx2.0, %entry.if.then_crit_edge ], [ %arrayidx2.1, %for.inc.if.then_crit_edge ], [ %arrayidx2.2, %for.inc.1.if.then_crit_edge ], [ %arrayidx2.3, %for.inc.2.if.then_crit_edge ], [ %arrayidx2.4, %for.inc.3.if.then_crit_edge ], [ %arrayidx2.5, %for.inc.4.if.then_crit_edge ], [ %arrayidx2.6, %for.inc.5.if.then_crit_edge ], [ %arrayidx2.7, %for.inc.6.if.then_crit_edge ], [ %arrayidx2.8, %for.inc.7.if.then_crit_edge ], [ %arrayidx2.9, %for.inc.8.if.then_crit_edge ]
  store i32 0, i32* %arrayidx2.phi, align 4, !tbaa !14
  br label %return

for.inc:                                          ; preds = %entry
  %1 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 1), align 4, !tbaa !10
  %cmp1.1 = icmp eq i8* %1, %ptr
  br i1 %cmp1.1, label %for.inc.if.then_crit_edge, label %for.inc.1

for.inc.if.then_crit_edge:                        ; preds = %for.inc
  %arrayidx2.1 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 1
  br label %if.then

return:                                           ; preds = %for.inc.9, %if.then
  ret void

for.inc.1:                                        ; preds = %for.inc
  %2 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 2), align 4, !tbaa !10
  %cmp1.2 = icmp eq i8* %2, %ptr
  br i1 %cmp1.2, label %for.inc.1.if.then_crit_edge, label %for.inc.2

for.inc.1.if.then_crit_edge:                      ; preds = %for.inc.1
  %arrayidx2.2 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 2
  br label %if.then

for.inc.2:                                        ; preds = %for.inc.1
  %3 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 3), align 4, !tbaa !10
  %cmp1.3 = icmp eq i8* %3, %ptr
  br i1 %cmp1.3, label %for.inc.2.if.then_crit_edge, label %for.inc.3

for.inc.2.if.then_crit_edge:                      ; preds = %for.inc.2
  %arrayidx2.3 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 3
  br label %if.then

for.inc.3:                                        ; preds = %for.inc.2
  %4 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 4), align 4, !tbaa !10
  %cmp1.4 = icmp eq i8* %4, %ptr
  br i1 %cmp1.4, label %for.inc.3.if.then_crit_edge, label %for.inc.4

for.inc.3.if.then_crit_edge:                      ; preds = %for.inc.3
  %arrayidx2.4 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 4
  br label %if.then

for.inc.4:                                        ; preds = %for.inc.3
  %5 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 5), align 4, !tbaa !10
  %cmp1.5 = icmp eq i8* %5, %ptr
  br i1 %cmp1.5, label %for.inc.4.if.then_crit_edge, label %for.inc.5

for.inc.4.if.then_crit_edge:                      ; preds = %for.inc.4
  %arrayidx2.5 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 5
  br label %if.then

for.inc.5:                                        ; preds = %for.inc.4
  %6 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 6), align 4, !tbaa !10
  %cmp1.6 = icmp eq i8* %6, %ptr
  br i1 %cmp1.6, label %for.inc.5.if.then_crit_edge, label %for.inc.6

for.inc.5.if.then_crit_edge:                      ; preds = %for.inc.5
  %arrayidx2.6 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 6
  br label %if.then

for.inc.6:                                        ; preds = %for.inc.5
  %7 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 7), align 4, !tbaa !10
  %cmp1.7 = icmp eq i8* %7, %ptr
  br i1 %cmp1.7, label %for.inc.6.if.then_crit_edge, label %for.inc.7

for.inc.6.if.then_crit_edge:                      ; preds = %for.inc.6
  %arrayidx2.7 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 7
  br label %if.then

for.inc.7:                                        ; preds = %for.inc.6
  %8 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 8), align 4, !tbaa !10
  %cmp1.8 = icmp eq i8* %8, %ptr
  br i1 %cmp1.8, label %for.inc.7.if.then_crit_edge, label %for.inc.8

for.inc.7.if.then_crit_edge:                      ; preds = %for.inc.7
  %arrayidx2.8 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 8
  br label %if.then

for.inc.8:                                        ; preds = %for.inc.7
  %9 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 9), align 4, !tbaa !10
  %cmp1.9 = icmp eq i8* %9, %ptr
  br i1 %cmp1.9, label %for.inc.8.if.then_crit_edge, label %for.inc.9

for.inc.8.if.then_crit_edge:                      ; preds = %for.inc.8
  %arrayidx2.9 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZN6Halide7Runtime8Internal11buf_is_usedE, i32 0, i32 9
  br label %if.then

for.inc.9:                                        ; preds = %for.inc.8
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %ptr) #15
  br label %return
}

; Function Attrs: nounwind mustprogress
define weak i8* (i8*, i32)* @halide_set_custom_malloc(i8* (i8*, i32)* %user_malloc) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0)) #14
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !10
  store i8* (i8*, i32)* %user_malloc, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !10
  ret i8* (i8*, i32)* %0
}

declare void @halide_print(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void (i8*, i8*)* @halide_set_custom_free(void (i8*, i8*)* %user_free) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0)) #14
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !10
  store void (i8*, i8*)* %user_free, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !10
  ret void (i8*, i8*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_malloc(i8* %user_context, i32 %x) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @halide_default_malloc(i8* %user_context, i32 %x) #15
  ret i8* %call
}

; Function Attrs: nounwind mustprogress
define weak void @halide_free(i8* %user_context, i8* %ptr) local_unnamed_addr #0 {
entry:
  tail call void @halide_default_free(i8* %user_context, i8* %ptr) #15
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %idx, i8* %closure) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_par_for(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #0 {
entry:
  %add = add nsw i32 %size, %min
  %cmp11 = icmp sgt i32 %size, 0
  br i1 %cmp11, label %for.body, label %cleanup1

for.cond:                                         ; preds = %for.body
  %cmp = icmp slt i32 %inc, %add
  br i1 %cmp, label %for.body, label %cleanup1, !llvm.loop !16

for.body:                                         ; preds = %entry, %for.cond
  %x.012 = phi i32 [ %inc, %for.cond ], [ %min, %entry ]
  %call = tail call i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %x.012, i8* %closure) #15
  %tobool.not = icmp eq i32 %call, 0
  %inc = add nsw i32 %x.012, 1
  br i1 %tobool.not, label %for.cond, label %cleanup1

cleanup1:                                         ; preds = %for.body, %for.cond, %entry
  %spec.select = phi i32 [ 0, %entry ], [ %call, %for.body ], [ 0, %for.cond ]
  ret i32 %spec.select
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.1, i32 0, i32 0)) #14
  ret i32 -1
}

declare void @halide_error(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1.2, i32 0, i32 0)) #14
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i32 0, i32 0)) #14
  ret i1 false
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.2, i32 0, i32 0)) #14
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %f, i8* %closure) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)) #14
  ret %struct.halide_thread* null
}

; Function Attrs: nounwind mustprogress
define weak void @halide_join_thread(%struct.halide_thread* %thread_arg) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.5, i32 0, i32 0)) #14
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_mutex_lock(%struct.halide_mutex* %mutex) local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_mutex_unlock(%struct.halide_mutex* %mutex) local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak %struct.halide_mutex_array* @halide_mutex_array_create(i32 %sz) local_unnamed_addr #2 {
entry:
  ret %struct.halide_mutex_array* @_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_mutex_array_destroy(i8* %user_context, i8* %array) local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_mutex_array_lock(%struct.halide_mutex_array* %array, i32 %entry1) local_unnamed_addr #2 {
entry:
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_mutex_array_unlock(%struct.halide_mutex_array* %array, i32 %entry1) local_unnamed_addr #2 {
entry:
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_shutdown_thread_pool() local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_set_num_threads(i32 %n) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp eq i32 %n, 1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.6, i32 0, i32 0)) #14
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 1
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_set_custom_do_task(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f) local_unnamed_addr #2 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 4, !tbaa !10
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 4, !tbaa !10
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_set_custom_do_par_for(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f) local_unnamed_addr #2 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 4, !tbaa !10
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 4, !tbaa !10
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_par_for(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 4, !tbaa !10
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 4, !tbaa !10
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 4, !tbaa !10
  %call = tail call zeroext i1 %0(%struct.halide_semaphore_t* %sema, i32 %count) #14
  ret i1 %call
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_gpu_device(i32 %d) local_unnamed_addr #2 {
entry:
  store i32 %d, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !14
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !18
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_get_gpu_device(i8* %user_context) local_unnamed_addr #4 {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i, %entry
  %0 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, i8 1 acquire
  %tobool.not.i = icmp eq i8 %0, 0
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit, label %while.cond.i, !llvm.loop !20

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit: ; preds = %while.cond.i
  %1 = load i8, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !18, !range !21
  %tobool.not = icmp eq i8 %1, 0
  br i1 %tobool.not, label %if.then, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge: ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %.pre = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !14
  br label %if.end4

if.then:                                          ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i32 0, i32 0)) #14
  %tobool1.not = icmp eq i8* %call, null
  br i1 %tobool1.not, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call3 = tail call i32 @atoi(i8* nonnull %call) #14
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %storemerge = phi i32 [ %call3, %if.then2 ], [ -1, %if.then ]
  store i32 %storemerge, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !14
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !18
  br label %if.end4

if.end4:                                          ; preds = %if.end, %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge
  %2 = phi i32 [ %.pre, %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge ], [ %storemerge, %if.end ]
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE release, align 1
  ret i32 %2
}

declare i8* @getenv(i8*) local_unnamed_addr #1

declare i32 @atoi(i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i8* @halide_string_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #4 {
entry:
  %cmp.not = icmp ult i8* %dst, %end
  br i1 %cmp.not, label %if.end, label %return

if.end:                                           ; preds = %entry
  %tobool.not = icmp eq i8* %arg, null
  %spec.select = select i1 %tobool.not, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0), i8* %arg
  br label %if.end5

if.then4:                                         ; preds = %if.end8
  store i8 0, i8* %dst.addr.023, align 1, !tbaa !22
  br label %return

if.end5:                                          ; preds = %if.end8, %if.end
  %arg.addr.124 = phi i8* [ %spec.select, %if.end ], [ %incdec.ptr9, %if.end8 ]
  %dst.addr.023 = phi i8* [ %dst, %if.end ], [ %incdec.ptr, %if.end8 ]
  %0 = load i8, i8* %arg.addr.124, align 1, !tbaa !22
  store i8 %0, i8* %dst.addr.023, align 1, !tbaa !22
  %cmp6 = icmp eq i8 %0, 0
  br i1 %cmp6, label %return, label %if.end8

if.end8:                                          ; preds = %if.end5
  %incdec.ptr = getelementptr inbounds i8, i8* %dst.addr.023, i32 1
  %incdec.ptr9 = getelementptr inbounds i8, i8* %arg.addr.124, i32 1
  %cmp3 = icmp eq i8* %incdec.ptr, %end
  br i1 %cmp3, label %if.then4, label %if.end5

return:                                           ; preds = %if.end5, %if.then4, %entry
  %retval.0 = phi i8* [ %end, %if.then4 ], [ %dst, %entry ], [ %dst.addr.023, %if.end5 ]
  ret i8* %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_uint64_to_string(i8* %dst, i8* %end, i64 %arg, i32 %min_digits) local_unnamed_addr #0 {
entry:
  %buf = alloca [32 x i8], align 1
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #11
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 31
  store i8 0, i8* %arrayidx, align 1, !tbaa !22
  %add.ptr = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i32 0, i32 30
  %cmp13 = icmp sgt i32 %min_digits, 0
  %tobool14 = icmp ne i64 %arg, 0
  %1 = or i1 %tobool14, %cmp13
  br i1 %1, label %entry.for.body_crit_edge, label %for.cond.cleanup

entry.for.body_crit_edge:                         ; preds = %entry
  %inc.1 = add nuw nsw i32 0, 1
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %digits.0.lcssa = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.body ]
  %incdec.ptr1 = getelementptr inbounds i8, i8* %digits.0.lcssa, i32 1
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #15
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #11
  ret i8* %call

for.body:                                         ; preds = %entry.for.body_crit_edge, %for.body.for.body_crit_edge
  %arg.addr.017 = phi i64 [ %div, %for.body.for.body_crit_edge ], [ %arg, %entry.for.body_crit_edge ]
  %digits.016 = phi i8* [ %incdec.ptr, %for.body.for.body_crit_edge ], [ %add.ptr, %entry.for.body_crit_edge ]
  %inc.phi = phi i32 [ %inc.0, %for.body.for.body_crit_edge ], [ %inc.1, %entry.for.body_crit_edge ]
  %div = udiv i64 %arg.addr.017, 10
  %mul.neg = mul i64 %div, -10
  %sub = add i64 %mul.neg, %arg.addr.017
  %2 = trunc i64 %sub to i8
  %conv = add i8 %2, 48
  store i8 %conv, i8* %digits.016, align 1, !tbaa !22
  %incdec.ptr = getelementptr inbounds i8, i8* %digits.016, i32 -1
  %cmp = icmp slt i32 %inc.phi, %min_digits
  %3 = icmp ugt i64 %arg.addr.017, 9
  %4 = or i1 %3, %cmp
  br i1 %4, label %for.body.for.body_crit_edge, label %for.cond.cleanup, !llvm.loop !23

for.body.for.body_crit_edge:                      ; preds = %for.body
  %inc.0 = add nuw nsw i32 %inc.phi, 1
  br label %for.body
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind mustprogress
define weak i8* @halide_int64_to_string(i8* %dst, i8* %end, i64 %arg, i32 %min_digits) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i64 %arg, 0
  %cmp1 = icmp ult i8* %dst, %end
  %or.cond = and i1 %cmp1, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8, i8* %dst, i32 1
  store i8 45, i8* %dst, align 1, !tbaa !22
  %sub = sub nsw i64 0, %arg
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arg.addr.0 = phi i64 [ %sub, %if.then ], [ %arg, %entry ]
  %dst.addr.0 = phi i8* [ %incdec.ptr, %if.then ], [ %dst, %entry ]
  %call = tail call i8* @halide_uint64_to_string(i8* %dst.addr.0, i8* %end, i64 %arg.addr.0, i32 %min_digits) #15
  ret i8* %call
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_double_to_string(i8* %dst, i8* %end, double %arg, i32 %scientific) local_unnamed_addr #0 {
entry:
  %arg.addr = alloca double, align 8
  %bits = alloca i64, align 8
  %buf = alloca [512 x i8], align 1
  store double %arg, double* %arg.addr, align 8, !tbaa !24
  %0 = bitcast i64* %bits to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #11
  store i64 0, i64* %bits, align 8, !tbaa !26
  %1 = bitcast double* %arg.addr to i8*
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %1, i32 8) #14
  %2 = load i64, i64* %bits, align 8, !tbaa !26
  %and = and i64 %2, 4503599627370495
  %shr = lshr i64 %2, 52
  %3 = trunc i64 %shr to i32
  %conv = and i32 %3, 2047
  %cmp = icmp eq i32 %conv, 2047
  br i1 %cmp, label %if.then, label %if.else15

if.then:                                          ; preds = %entry
  %tobool.not = icmp eq i64 %and, 0
  %tobool10.not = icmp sgt i64 %2, -1
  br i1 %tobool.not, label %if.else9, label %if.then4

if.then4:                                         ; preds = %if.then
  br i1 %tobool10.not, label %if.else, label %if.then6

if.then6:                                         ; preds = %if.then4
  %call7 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.9, i32 0, i32 0)) #15
  br label %cleanup147

if.else:                                          ; preds = %if.then4
  %call8 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2.10, i32 0, i32 0)) #15
  br label %cleanup147

if.else9:                                         ; preds = %if.then
  br i1 %tobool10.not, label %if.else13, label %if.then11

if.then11:                                        ; preds = %if.else9
  %call12 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.11, i32 0, i32 0)) #15
  br label %cleanup147

if.else13:                                        ; preds = %if.else9
  %call14 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4.12, i32 0, i32 0)) #15
  br label %cleanup147

if.else15:                                        ; preds = %entry
  %cmp16 = icmp eq i32 %conv, 0
  %cmp17 = icmp eq i64 %and, 0
  %or.cond = and i1 %cmp17, %cmp16
  br i1 %or.cond, label %if.then18, label %if.end32

if.then18:                                        ; preds = %if.else15
  %tobool19.not = icmp eq i32 %scientific, 0
  %tobool27.not = icmp sgt i64 %2, -1
  br i1 %tobool19.not, label %if.else26, label %if.then20

if.then20:                                        ; preds = %if.then18
  br i1 %tobool27.not, label %if.else24, label %if.then22

if.then22:                                        ; preds = %if.then20
  %call23 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5.13, i32 0, i32 0)) #15
  br label %cleanup147

if.else24:                                        ; preds = %if.then20
  %call25 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6.14, i32 0, i32 0)) #15
  br label %cleanup147

if.else26:                                        ; preds = %if.then18
  br i1 %tobool27.not, label %if.else30, label %if.then28

if.then28:                                        ; preds = %if.else26
  %call29 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7.15, i32 0, i32 0)) #15
  br label %cleanup147

if.else30:                                        ; preds = %if.else26
  %call31 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8.16, i32 0, i32 0)) #15
  br label %cleanup147

if.end32:                                         ; preds = %if.else15
  %tobool33.not = icmp sgt i64 %2, -1
  br i1 %tobool33.not, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.end32
  %call35 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0)) #15
  %4 = load double, double* %arg.addr, align 8, !tbaa !24
  %fneg = fneg double %4
  store double %fneg, double* %arg.addr, align 8, !tbaa !24
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.end32
  %dst.addr.0 = phi i8* [ %call35, %if.then34 ], [ %dst, %if.end32 ]
  %tobool37.not = icmp eq i32 %scientific, 0
  br i1 %tobool37.not, label %if.else61, label %while.condthread-pre-split

while.condthread-pre-split:                       ; preds = %if.end36
  %.pr = load double, double* %arg.addr, align 8, !tbaa !24
  %cmp39276 = fcmp olt double %.pr, 1.000000e+00
  br i1 %cmp39276, label %while.condthread-pre-split.while.body_crit_edge, label %while.cond40thread-pre-split

while.condthread-pre-split.while.body_crit_edge:  ; preds = %while.condthread-pre-split
  %dec.1 = add nsw i32 0, -1
  br label %while.body

while.body:                                       ; preds = %while.condthread-pre-split.while.body_crit_edge, %while.body.while.body_crit_edge
  %dec.phi = phi i32 [ %dec.0, %while.body.while.body_crit_edge ], [ %dec.1, %while.condthread-pre-split.while.body_crit_edge ]
  %5 = phi double [ %mul, %while.body.while.body_crit_edge ], [ %.pr, %while.condthread-pre-split.while.body_crit_edge ]
  %mul = fmul double %5, 1.000000e+01
  %cmp39 = fcmp olt double %mul, 1.000000e+00
  br i1 %cmp39, label %while.body.while.body_crit_edge, label %while.cond.while.cond40thread-pre-split_crit_edge, !llvm.loop !28

while.body.while.body_crit_edge:                  ; preds = %while.body
  %dec.0 = add nsw i32 %dec.phi, -1
  br label %while.body

while.cond.while.cond40thread-pre-split_crit_edge: ; preds = %while.body
  store double %mul, double* %arg.addr, align 8, !tbaa !24
  br label %while.cond40thread-pre-split

while.cond40thread-pre-split:                     ; preds = %while.cond.while.cond40thread-pre-split_crit_edge, %while.condthread-pre-split
  %.pr260 = phi double [ %mul, %while.cond.while.cond40thread-pre-split_crit_edge ], [ %.pr, %while.condthread-pre-split ]
  %exponent_base_10.0.lcssa = phi i32 [ %dec.phi, %while.cond.while.cond40thread-pre-split_crit_edge ], [ 0, %while.condthread-pre-split ]
  %cmp41272 = fcmp ult double %.pr260, 1.000000e+01
  br i1 %cmp41272, label %while.end43, label %while.body42

while.body42:                                     ; preds = %while.cond40thread-pre-split, %while.body42
  %exponent_base_10.1273 = phi i32 [ %inc, %while.body42 ], [ %exponent_base_10.0.lcssa, %while.cond40thread-pre-split ]
  %6 = phi double [ %div, %while.body42 ], [ %.pr260, %while.cond40thread-pre-split ]
  %div = fdiv double %6, 1.000000e+01
  %inc = add nsw i32 %exponent_base_10.1273, 1
  %cmp41 = fcmp ult double %div, 1.000000e+01
  br i1 %cmp41, label %while.cond40.while.end43_crit_edge, label %while.body42, !llvm.loop !29

while.cond40.while.end43_crit_edge:               ; preds = %while.body42
  store double %div, double* %arg.addr, align 8, !tbaa !24
  br label %while.end43

while.end43:                                      ; preds = %while.cond40.while.end43_crit_edge, %while.cond40thread-pre-split
  %.lcssa = phi double [ %div, %while.cond40.while.end43_crit_edge ], [ %.pr260, %while.cond40thread-pre-split ]
  %exponent_base_10.1.lcssa = phi i32 [ %inc, %while.cond40.while.end43_crit_edge ], [ %exponent_base_10.0.lcssa, %while.cond40thread-pre-split ]
  %mul44 = fmul double %.lcssa, 1.000000e+06
  %add = fadd double %mul44, 5.000000e-01
  %conv45 = fptoui double %add to i64
  %div46 = udiv i64 %conv45, 1000000
  %mul47.neg = mul i64 %div46, -1000000
  %sub48 = add i64 %mul47.neg, %conv45
  %call49 = call i8* @halide_int64_to_string(i8* %dst.addr.0, i8* %end, i64 %div46, i32 1) #15
  %call50 = call i8* @halide_string_to_string(i8* %call49, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #15
  %call51 = call i8* @halide_int64_to_string(i8* %call50, i8* %end, i64 %sub48, i32 6) #15
  %cmp52 = icmp sgt i32 %exponent_base_10.1.lcssa, -1
  br i1 %cmp52, label %if.then53, label %if.else55

if.then53:                                        ; preds = %while.end43
  %call54 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0)) #15
  br label %if.end58

if.else55:                                        ; preds = %while.end43
  %call56 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0)) #15
  %sub57 = sub nsw i32 0, %exponent_base_10.1.lcssa
  br label %if.end58

if.end58:                                         ; preds = %if.else55, %if.then53
  %exponent_base_10.2 = phi i32 [ %exponent_base_10.1.lcssa, %if.then53 ], [ %sub57, %if.else55 ]
  %dst.addr.1 = phi i8* [ %call54, %if.then53 ], [ %call56, %if.else55 ]
  %conv59261 = zext i32 %exponent_base_10.2 to i64
  %call60 = call i8* @halide_int64_to_string(i8* %dst.addr.1, i8* %end, i64 %conv59261, i32 2) #15
  br label %cleanup147

if.else61:                                        ; preds = %if.end36
  br i1 %cmp16, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.else61
  %call64 = call i8* @halide_double_to_string(i8* %dst.addr.0, i8* %end, double 0.000000e+00, i32 0) #15
  br label %cleanup147

if.end65:                                         ; preds = %if.else61
  %add67 = or i64 %and, 4503599627370496
  %sub69 = add nsw i32 %conv, -1075
  %cmp70 = icmp ult i32 %conv, 1075
  br i1 %cmp70, label %if.then71, label %if.end104

if.then71:                                        ; preds = %if.end65
  %cmp72 = icmp ult i32 %conv, 1023
  br i1 %cmp72, label %if.end83, label %if.else75

if.else75:                                        ; preds = %if.then71
  %sub76 = sub nuw nsw i32 1075, %conv
  %sh_prom = zext i32 %sub76 to i64
  %shr77 = lshr i64 %add67, %sh_prom
  %shl80 = shl i64 %shr77, %sh_prom
  %sub81 = sub i64 %add67, %shl80
  br label %if.end83

if.end83:                                         ; preds = %if.else75, %if.then71
  %integer_part.0 = phi i64 [ %shr77, %if.else75 ], [ 0, %if.then71 ]
  %f.0.in = phi i64 [ %sub81, %if.else75 ], [ %add67, %if.then71 ]
  %f.0 = uitofp i64 %f.0.in to double
  %conv84257 = zext i32 %sub69 to i64
  %shl85 = shl i64 %conv84257, 52
  %add87 = add i64 %shl85, 4696837146684686336
  %7 = bitcast i64 %add87 to double
  %mul89 = fmul double %7, %f.0
  %add90 = fadd double %mul89, 5.000000e-01
  %conv91 = fptoui double %add90 to i64
  %conv92 = uitofp i64 %conv91 to double
  %cmp93 = fcmp oeq double %add90, %conv92
  %and95 = and i64 %conv91, 1
  %tobool96.not = icmp ne i64 %and95, 0
  %not.or.cond258 = and i1 %cmp93, %tobool96.not
  %dec98 = sext i1 %not.or.cond258 to i64
  %fractional_part.0 = add i64 %dec98, %conv91
  %cmp100 = icmp eq i64 %fractional_part.0, 1000000
  %inc102 = zext i1 %cmp100 to i64
  %spec.select = add nuw i64 %integer_part.0, %inc102
  %spec.select259 = select i1 %cmp100, i64 0, i64 %fractional_part.0
  br label %if.end104

if.end104:                                        ; preds = %if.end83, %if.end65
  %integer_part.2 = phi i64 [ %spec.select, %if.end83 ], [ %add67, %if.end65 ]
  %integer_exponent.0 = phi i32 [ 0, %if.end83 ], [ %sub69, %if.end65 ]
  %fractional_part.2 = phi i64 [ %spec.select259, %if.end83 ], [ 0, %if.end65 ]
  %8 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %8) #11
  %add.ptr = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 512
  %add.ptr105 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i32 0, i32 480
  %call108 = call i8* @halide_int64_to_string(i8* nonnull %add.ptr105, i8* nonnull %add.ptr, i64 %integer_part.2, i32 1) #15
  %cmp109267 = icmp sgt i32 %integer_exponent.0, 0
  br i1 %cmp109267, label %for.cond111.preheader.preheader, label %for.cond.cleanup

for.cond111.preheader.preheader:                  ; preds = %if.end104
  %9 = add nsw i32 %integer_exponent.0, -1
  %xtraiter = and i32 %integer_exponent.0, 3
  %10 = icmp ult i32 %9, 3
  br i1 %10, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.cond111.preheader.preheader.new

for.cond111.preheader.preheader.new:              ; preds = %for.cond111.preheader.preheader
  %unroll_iter = and i32 %integer_exponent.0, -4
  br label %for.cond111.preheader

for.cond111.preheader:                            ; preds = %if.end137.3, %for.cond111.preheader.preheader.new
  %int_part_ptr.0268 = phi i8* [ %add.ptr105, %for.cond111.preheader.preheader.new ], [ %int_part_ptr.1.3, %if.end137.3 ]
  %niter = phi i32 [ %unroll_iter, %for.cond111.preheader.preheader.new ], [ %niter.nsub.3, %if.end137.3 ]
  %add.ptr112 = getelementptr inbounds i8, i8* %int_part_ptr.0268, i32 -1
  %cmp113.not263 = icmp eq i8* %call108, %int_part_ptr.0268
  br i1 %cmp113.not263, label %if.end137, label %for.body115

for.cond.cleanup.loopexit.unr-lcssa:              ; preds = %if.end137.3, %for.cond111.preheader.preheader
  %int_part_ptr.1.lcssa.ph = phi i8* [ undef, %for.cond111.preheader.preheader ], [ %int_part_ptr.1.3, %if.end137.3 ]
  %int_part_ptr.0268.unr = phi i8* [ %add.ptr105, %for.cond111.preheader.preheader ], [ %int_part_ptr.1.3, %if.end137.3 ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup, label %for.cond111.preheader.epil

for.cond111.preheader.epil:                       ; preds = %for.cond.cleanup.loopexit.unr-lcssa, %if.end137.epil
  %int_part_ptr.0268.epil = phi i8* [ %int_part_ptr.1.epil, %if.end137.epil ], [ %int_part_ptr.0268.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %epil.iter = phi i32 [ %epil.iter.sub, %if.end137.epil ], [ %xtraiter, %for.cond.cleanup.loopexit.unr-lcssa ]
  %add.ptr112.epil = getelementptr inbounds i8, i8* %int_part_ptr.0268.epil, i32 -1
  %cmp113.not263.epil = icmp eq i8* %call108, %int_part_ptr.0268.epil
  br i1 %cmp113.not263.epil, label %if.end137.epil, label %for.body115.epil

for.body115.epil:                                 ; preds = %for.cond111.preheader.epil, %for.body115.epil
  %p.0265.pn.epil = phi i8* [ %p.0265.epil, %for.body115.epil ], [ %call108, %for.cond111.preheader.epil ]
  %carry.0264.epil = phi i8 [ %carry.1.epil, %for.body115.epil ], [ 0, %for.cond111.preheader.epil ]
  %p.0265.epil = getelementptr inbounds i8, i8* %p.0265.pn.epil, i32 -1
  %11 = load i8, i8* %p.0265.epil, align 1, !tbaa !22
  %sub117.epil = shl i8 %11, 1
  %mul120.epil = add i8 %sub117.epil, -96
  %add121.epil = or i8 %mul120.epil, %carry.0264.epil
  %cmp124.epil = icmp sgt i8 %add121.epil, 9
  %sub127.epil = add i8 %add121.epil, -10
  %carry.1.epil = zext i1 %cmp124.epil to i8
  %new_digit.0.epil = select i1 %cmp124.epil, i8 %sub127.epil, i8 %add121.epil
  %add132.epil = add i8 %new_digit.0.epil, 48
  store i8 %add132.epil, i8* %p.0265.epil, align 1, !tbaa !22
  %cmp113.not.epil = icmp eq i8* %p.0265.epil, %int_part_ptr.0268.epil
  br i1 %cmp113.not.epil, label %for.cond.cleanup114.epil, label %for.body115.epil, !llvm.loop !30

for.cond.cleanup114.epil:                         ; preds = %for.body115.epil
  br i1 %cmp124.epil, label %if.then135.epil, label %if.end137.epil

if.then135.epil:                                  ; preds = %for.cond.cleanup114.epil
  store i8 49, i8* %add.ptr112.epil, align 1, !tbaa !22
  br label %if.end137.epil

if.end137.epil:                                   ; preds = %if.then135.epil, %for.cond.cleanup114.epil, %for.cond111.preheader.epil
  %int_part_ptr.1.epil = phi i8* [ %add.ptr112.epil, %if.then135.epil ], [ %int_part_ptr.0268.epil, %for.cond.cleanup114.epil ], [ %call108, %for.cond111.preheader.epil ]
  %epil.iter.sub = add i32 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup, label %for.cond111.preheader.epil, !llvm.loop !31

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit.unr-lcssa, %if.end137.epil, %if.end104
  %int_part_ptr.0.lcssa = phi i8* [ %add.ptr105, %if.end104 ], [ %int_part_ptr.1.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %int_part_ptr.1.epil, %if.end137.epil ]
  %call141 = call i8* @halide_string_to_string(i8* %dst.addr.0, i8* %end, i8* %int_part_ptr.0.lcssa) #15
  %call142 = call i8* @halide_string_to_string(i8* %call141, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #15
  %call143 = call i8* @halide_int64_to_string(i8* %call142, i8* %end, i64 %fractional_part.2, i32 6) #15
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %8) #11
  br label %cleanup147

for.cond.cleanup114:                              ; preds = %for.body115
  br i1 %cmp124, label %if.then135, label %if.end137

for.body115:                                      ; preds = %for.cond111.preheader, %for.body115
  %p.0265.pn = phi i8* [ %p.0265, %for.body115 ], [ %call108, %for.cond111.preheader ]
  %carry.0264 = phi i8 [ %carry.1, %for.body115 ], [ 0, %for.cond111.preheader ]
  %p.0265 = getelementptr inbounds i8, i8* %p.0265.pn, i32 -1
  %12 = load i8, i8* %p.0265, align 1, !tbaa !22
  %sub117 = shl i8 %12, 1
  %mul120 = add i8 %sub117, -96
  %add121 = or i8 %mul120, %carry.0264
  %cmp124 = icmp sgt i8 %add121, 9
  %sub127 = add i8 %add121, -10
  %carry.1 = zext i1 %cmp124 to i8
  %new_digit.0 = select i1 %cmp124, i8 %sub127, i8 %add121
  %add132 = add i8 %new_digit.0, 48
  store i8 %add132, i8* %p.0265, align 1, !tbaa !22
  %cmp113.not = icmp eq i8* %p.0265, %int_part_ptr.0268
  br i1 %cmp113.not, label %for.cond.cleanup114, label %for.body115, !llvm.loop !30

if.then135:                                       ; preds = %for.cond.cleanup114
  store i8 49, i8* %add.ptr112, align 1, !tbaa !22
  br label %if.end137

if.end137:                                        ; preds = %if.then135, %for.cond.cleanup114, %for.cond111.preheader
  %int_part_ptr.1 = phi i8* [ %add.ptr112, %if.then135 ], [ %int_part_ptr.0268, %for.cond.cleanup114 ], [ %call108, %for.cond111.preheader ]
  %add.ptr112.1 = getelementptr inbounds i8, i8* %int_part_ptr.1, i32 -1
  %cmp113.not263.1 = icmp eq i8* %call108, %int_part_ptr.1
  br i1 %cmp113.not263.1, label %if.end137.1, label %for.body115.1

cleanup147:                                       ; preds = %for.cond.cleanup, %if.then63, %if.end58, %if.else30, %if.then28, %if.else24, %if.then22, %if.else13, %if.then11, %if.else, %if.then6
  %retval.1 = phi i8* [ %call7, %if.then6 ], [ %call8, %if.else ], [ %call12, %if.then11 ], [ %call14, %if.else13 ], [ %call23, %if.then22 ], [ %call25, %if.else24 ], [ %call29, %if.then28 ], [ %call31, %if.else30 ], [ %call64, %if.then63 ], [ %call60, %if.end58 ], [ %call143, %for.cond.cleanup ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #11
  ret i8* %retval.1

for.body115.1:                                    ; preds = %if.end137, %for.body115.1
  %p.0265.pn.1 = phi i8* [ %p.0265.1, %for.body115.1 ], [ %call108, %if.end137 ]
  %carry.0264.1 = phi i8 [ %carry.1.1, %for.body115.1 ], [ 0, %if.end137 ]
  %p.0265.1 = getelementptr inbounds i8, i8* %p.0265.pn.1, i32 -1
  %13 = load i8, i8* %p.0265.1, align 1, !tbaa !22
  %sub117.1 = shl i8 %13, 1
  %mul120.1 = add i8 %sub117.1, -96
  %add121.1 = or i8 %mul120.1, %carry.0264.1
  %cmp124.1 = icmp sgt i8 %add121.1, 9
  %sub127.1 = add i8 %add121.1, -10
  %carry.1.1 = zext i1 %cmp124.1 to i8
  %new_digit.0.1 = select i1 %cmp124.1, i8 %sub127.1, i8 %add121.1
  %add132.1 = add i8 %new_digit.0.1, 48
  store i8 %add132.1, i8* %p.0265.1, align 1, !tbaa !22
  %cmp113.not.1 = icmp eq i8* %p.0265.1, %int_part_ptr.1
  br i1 %cmp113.not.1, label %for.cond.cleanup114.1, label %for.body115.1, !llvm.loop !30

for.cond.cleanup114.1:                            ; preds = %for.body115.1
  br i1 %cmp124.1, label %if.then135.1, label %if.end137.1

if.then135.1:                                     ; preds = %for.cond.cleanup114.1
  store i8 49, i8* %add.ptr112.1, align 1, !tbaa !22
  br label %if.end137.1

if.end137.1:                                      ; preds = %if.then135.1, %for.cond.cleanup114.1, %if.end137
  %int_part_ptr.1.1 = phi i8* [ %add.ptr112.1, %if.then135.1 ], [ %int_part_ptr.1, %for.cond.cleanup114.1 ], [ %call108, %if.end137 ]
  %add.ptr112.2 = getelementptr inbounds i8, i8* %int_part_ptr.1.1, i32 -1
  %cmp113.not263.2 = icmp eq i8* %call108, %int_part_ptr.1.1
  br i1 %cmp113.not263.2, label %if.end137.2, label %for.body115.2

for.body115.2:                                    ; preds = %if.end137.1, %for.body115.2
  %p.0265.pn.2 = phi i8* [ %p.0265.2, %for.body115.2 ], [ %call108, %if.end137.1 ]
  %carry.0264.2 = phi i8 [ %carry.1.2, %for.body115.2 ], [ 0, %if.end137.1 ]
  %p.0265.2 = getelementptr inbounds i8, i8* %p.0265.pn.2, i32 -1
  %14 = load i8, i8* %p.0265.2, align 1, !tbaa !22
  %sub117.2 = shl i8 %14, 1
  %mul120.2 = add i8 %sub117.2, -96
  %add121.2 = or i8 %mul120.2, %carry.0264.2
  %cmp124.2 = icmp sgt i8 %add121.2, 9
  %sub127.2 = add i8 %add121.2, -10
  %carry.1.2 = zext i1 %cmp124.2 to i8
  %new_digit.0.2 = select i1 %cmp124.2, i8 %sub127.2, i8 %add121.2
  %add132.2 = add i8 %new_digit.0.2, 48
  store i8 %add132.2, i8* %p.0265.2, align 1, !tbaa !22
  %cmp113.not.2 = icmp eq i8* %p.0265.2, %int_part_ptr.1.1
  br i1 %cmp113.not.2, label %for.cond.cleanup114.2, label %for.body115.2, !llvm.loop !30

for.cond.cleanup114.2:                            ; preds = %for.body115.2
  br i1 %cmp124.2, label %if.then135.2, label %if.end137.2

if.then135.2:                                     ; preds = %for.cond.cleanup114.2
  store i8 49, i8* %add.ptr112.2, align 1, !tbaa !22
  br label %if.end137.2

if.end137.2:                                      ; preds = %if.then135.2, %for.cond.cleanup114.2, %if.end137.1
  %int_part_ptr.1.2 = phi i8* [ %add.ptr112.2, %if.then135.2 ], [ %int_part_ptr.1.1, %for.cond.cleanup114.2 ], [ %call108, %if.end137.1 ]
  %add.ptr112.3 = getelementptr inbounds i8, i8* %int_part_ptr.1.2, i32 -1
  %cmp113.not263.3 = icmp eq i8* %call108, %int_part_ptr.1.2
  br i1 %cmp113.not263.3, label %if.end137.3, label %for.body115.3

for.body115.3:                                    ; preds = %if.end137.2, %for.body115.3
  %p.0265.pn.3 = phi i8* [ %p.0265.3, %for.body115.3 ], [ %call108, %if.end137.2 ]
  %carry.0264.3 = phi i8 [ %carry.1.3, %for.body115.3 ], [ 0, %if.end137.2 ]
  %p.0265.3 = getelementptr inbounds i8, i8* %p.0265.pn.3, i32 -1
  %15 = load i8, i8* %p.0265.3, align 1, !tbaa !22
  %sub117.3 = shl i8 %15, 1
  %mul120.3 = add i8 %sub117.3, -96
  %add121.3 = or i8 %mul120.3, %carry.0264.3
  %cmp124.3 = icmp sgt i8 %add121.3, 9
  %sub127.3 = add i8 %add121.3, -10
  %carry.1.3 = zext i1 %cmp124.3 to i8
  %new_digit.0.3 = select i1 %cmp124.3, i8 %sub127.3, i8 %add121.3
  %add132.3 = add i8 %new_digit.0.3, 48
  store i8 %add132.3, i8* %p.0265.3, align 1, !tbaa !22
  %cmp113.not.3 = icmp eq i8* %p.0265.3, %int_part_ptr.1.2
  br i1 %cmp113.not.3, label %for.cond.cleanup114.3, label %for.body115.3, !llvm.loop !30

for.cond.cleanup114.3:                            ; preds = %for.body115.3
  br i1 %cmp124.3, label %if.then135.3, label %if.end137.3

if.then135.3:                                     ; preds = %for.cond.cleanup114.3
  store i8 49, i8* %add.ptr112.3, align 1, !tbaa !22
  br label %if.end137.3

if.end137.3:                                      ; preds = %if.then135.3, %for.cond.cleanup114.3, %if.end137.2
  %int_part_ptr.1.3 = phi i8* [ %add.ptr112.3, %if.then135.3 ], [ %int_part_ptr.1.2, %for.cond.cleanup114.3 ], [ %call108, %if.end137.2 ]
  %niter.nsub.3 = add i32 %niter, -4
  %niter.ncmp.3 = icmp eq i32 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.cond111.preheader, !llvm.loop !33
}

declare i8* @memcpy(i8*, i8*, i32) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i8* @halide_pointer_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #0 {
entry:
  %buf = alloca [20 x i8], align 1
  %0 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %0) #11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(20) %0, i8 0, i32 20, i1 false)
  %add.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 18
  %1 = ptrtoint i8* %arg to i32
  %idxprom = and i32 %1, 15
  %arrayidx = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %idxprom
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !22
  %incdec.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 17
  store i8 %2, i8* %add.ptr, align 1, !tbaa !22
  %3 = lshr i32 %1, 4
  %tobool.not = icmp eq i32 %3, 0
  br i1 %tobool.not, label %cleanup, label %for.cond

for.cond:                                         ; preds = %entry
  %idxprom.1 = and i32 %3, 15
  %arrayidx.1 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %idxprom.1
  %4 = load i8, i8* %arrayidx.1, align 1, !tbaa !22
  %incdec.ptr.1 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 16
  store i8 %4, i8* %incdec.ptr, align 1, !tbaa !22
  %5 = lshr i32 %1, 8
  %tobool.not.1 = icmp eq i32 %5, 0
  br i1 %tobool.not.1, label %cleanup, label %for.cond.1

cleanup:                                          ; preds = %for.cond.6, %for.cond.5, %for.cond.4, %for.cond.3, %for.cond.2, %for.cond.1, %for.cond, %entry
  %buf_ptr.016.lcssa = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.cond ], [ %incdec.ptr.1, %for.cond.1 ], [ %incdec.ptr.2, %for.cond.2 ], [ %incdec.ptr.3, %for.cond.3 ], [ %incdec.ptr.4, %for.cond.4 ], [ %incdec.ptr.5, %for.cond.5 ], [ %incdec.ptr.6, %for.cond.6 ]
  %incdec.ptr.lcssa = phi i8* [ %incdec.ptr, %entry ], [ %incdec.ptr.1, %for.cond ], [ %incdec.ptr.2, %for.cond.1 ], [ %incdec.ptr.3, %for.cond.2 ], [ %incdec.ptr.4, %for.cond.3 ], [ %incdec.ptr.5, %for.cond.4 ], [ %incdec.ptr.6, %for.cond.5 ], [ %incdec.ptr.7, %for.cond.6 ]
  %incdec.ptr1 = getelementptr inbounds i8, i8* %buf_ptr.016.lcssa, i32 -2
  store i8 120, i8* %incdec.ptr.lcssa, align 1, !tbaa !22
  store i8 48, i8* %incdec.ptr1, align 1, !tbaa !22
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #15
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %0) #11
  ret i8* %call

for.cond.1:                                       ; preds = %for.cond
  %idxprom.2 = and i32 %5, 15
  %arrayidx.2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %idxprom.2
  %6 = load i8, i8* %arrayidx.2, align 1, !tbaa !22
  %incdec.ptr.2 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 15
  store i8 %6, i8* %incdec.ptr.1, align 1, !tbaa !22
  %7 = lshr i32 %1, 12
  %tobool.not.2 = icmp eq i32 %7, 0
  br i1 %tobool.not.2, label %cleanup, label %for.cond.2

for.cond.2:                                       ; preds = %for.cond.1
  %idxprom.3 = and i32 %7, 15
  %arrayidx.3 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %idxprom.3
  %8 = load i8, i8* %arrayidx.3, align 1, !tbaa !22
  %incdec.ptr.3 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 14
  store i8 %8, i8* %incdec.ptr.2, align 1, !tbaa !22
  %9 = lshr i32 %1, 16
  %tobool.not.3 = icmp eq i32 %9, 0
  br i1 %tobool.not.3, label %cleanup, label %for.cond.3

for.cond.3:                                       ; preds = %for.cond.2
  %idxprom.4 = and i32 %9, 15
  %arrayidx.4 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %idxprom.4
  %10 = load i8, i8* %arrayidx.4, align 1, !tbaa !22
  %incdec.ptr.4 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 13
  store i8 %10, i8* %incdec.ptr.3, align 1, !tbaa !22
  %11 = lshr i32 %1, 20
  %tobool.not.4 = icmp eq i32 %11, 0
  br i1 %tobool.not.4, label %cleanup, label %for.cond.4

for.cond.4:                                       ; preds = %for.cond.3
  %idxprom.5 = and i32 %11, 15
  %arrayidx.5 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %idxprom.5
  %12 = load i8, i8* %arrayidx.5, align 1, !tbaa !22
  %incdec.ptr.5 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 12
  store i8 %12, i8* %incdec.ptr.4, align 1, !tbaa !22
  %13 = lshr i32 %1, 24
  %tobool.not.5 = icmp eq i32 %13, 0
  br i1 %tobool.not.5, label %cleanup, label %for.cond.5

for.cond.5:                                       ; preds = %for.cond.4
  %idxprom.6 = and i32 %13, 15
  %arrayidx.6 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %idxprom.6
  %14 = load i8, i8* %arrayidx.6, align 1, !tbaa !22
  %incdec.ptr.6 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 11
  store i8 %14, i8* %incdec.ptr.5, align 1, !tbaa !22
  %15 = lshr i32 %1, 28
  %tobool.not.6 = icmp eq i32 %15, 0
  br i1 %tobool.not.6, label %cleanup, label %for.cond.6

for.cond.6:                                       ; preds = %for.cond.5
  %arrayidx.7 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13, i32 0, i32 %15
  %16 = load i8, i8* %arrayidx.7, align 1, !tbaa !22
  %incdec.ptr.7 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 10
  store i8 %16, i8* %incdec.ptr.6, align 1, !tbaa !22
  br label %cleanup
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #5

; Function Attrs: nounwind mustprogress
define weak i8* @halide_type_to_string(i8* %dst, i8* %end, %struct.halide_type_t* %t) local_unnamed_addr #0 {
entry:
  %code = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 0
  %0 = load i8, i8* %code, align 2, !tbaa !34
  %1 = icmp ult i8 %0, 4
  br i1 %1, label %switch.lookup, label %sw.epilog

switch.lookup:                                    ; preds = %entry
  %2 = sext i8 %0 to i32
  %switch.gep = getelementptr inbounds [4 x i8*], [4 x i8*]* @switch.table.halide_type_to_string, i32 0, i32 %2
  %switch.load = load i8*, i8** %switch.gep, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %switch.lookup
  %code_name.0 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i32 0, i32 0), %entry ]
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %code_name.0) #15
  %bits = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 1
  %3 = load i8, i8* %bits, align 1, !tbaa !38
  %conv4 = zext i8 %3 to i64
  %call5 = tail call i8* @halide_uint64_to_string(i8* %call, i8* %end, i64 %conv4, i32 1) #15
  %lanes = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 2
  %4 = load i16, i16* %lanes, align 2, !tbaa !39
  %cmp.not = icmp eq i16 %4, 1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %sw.epilog
  %call7 = tail call i8* @halide_string_to_string(i8* %call5, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0)) #15
  %5 = load i16, i16* %lanes, align 2, !tbaa !39
  %conv9 = zext i16 %5 to i64
  %call10 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %conv9, i32 1) #15
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.epilog
  %dst.addr.0 = phi i8* [ %call10, %if.then ], [ %call5, %sw.epilog ]
  ret i8* %dst.addr.0
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_buffer_to_string(i8* %dst, i8* %end, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #15
  br label %return

if.end:                                           ; preds = %entry
  %call1 = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0)) #15
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %call2 = tail call i8* @halide_uint64_to_string(i8* %call1, i8* %end, i64 %0, i32 1) #15
  %call3 = tail call i8* @halide_string_to_string(i8* %call2, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = bitcast %struct.halide_device_interface_t** %device_interface to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !42
  %call4 = tail call i8* @halide_pointer_to_string(i8* %call3, i8* %end, i8* %2) #15
  %call5 = tail call i8* @halide_string_to_string(i8* %call4, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %3 = load i8*, i8** %host, align 4, !tbaa !43
  %call6 = tail call i8* @halide_pointer_to_string(i8* %call5, i8* %end, i8* %3) #15
  %call7 = tail call i8* @halide_string_to_string(i8* %call6, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %flags = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %4 = load i64, i64* %flags, align 8, !tbaa !44
  %call8 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %4, i32 1) #15
  %call9 = tail call i8* @halide_string_to_string(i8* %call8, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %type = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 4
  %call10 = tail call i8* @halide_type_to_string(i8* %call9, i8* %end, %struct.halide_type_t* nonnull %type) #15
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 5
  %5 = load i32, i32* %dimensions, align 4, !tbaa !45
  %cmp1177 = icmp sgt i32 %5, 0
  br i1 %cmp1177, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 6
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %dst.addr.0.lcssa = phi i8* [ %call10, %if.end ], [ %call24, %for.body ]
  %call25 = tail call i8* @halide_string_to_string(i8* %dst.addr.0.lcssa, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #15
  br label %return

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.079 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %dst.addr.078 = phi i8* [ %call10, %for.body.lr.ph ], [ %call24, %for.body ]
  %call12 = tail call i8* @halide_string_to_string(i8* %dst.addr.078, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0)) #15
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 %i.079, i32 0
  %7 = load i32, i32* %min, align 4, !tbaa !47
  %conv = sext i32 %7 to i64
  %call13 = tail call i8* @halide_int64_to_string(i8* %call12, i8* %end, i64 %conv, i32 1) #15
  %call14 = tail call i8* @halide_string_to_string(i8* %call13, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %extent = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i32 %i.079, i32 1
  %9 = load i32, i32* %extent, align 4, !tbaa !49
  %conv17 = sext i32 %9 to i64
  %call18 = tail call i8* @halide_int64_to_string(i8* %call14, i8* %end, i64 %conv17, i32 1) #15
  %call19 = tail call i8* @halide_string_to_string(i8* %call18, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %10 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %10, i32 %i.079, i32 2
  %11 = load i32, i32* %stride, align 4, !tbaa !50
  %conv22 = sext i32 %11 to i64
  %call23 = tail call i8* @halide_int64_to_string(i8* %call19, i8* %end, i64 %conv22, i32 1) #15
  %call24 = tail call i8* @halide_string_to_string(i8* %call23, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.24, i32 0, i32 0)) #15
  %inc = add nuw nsw i32 %i.079, 1
  %12 = load i32, i32* %dimensions, align 4, !tbaa !45
  %cmp11 = icmp slt i32 %inc, %12
  br i1 %cmp11, label %for.body, label %for.cond.cleanup, !llvm.loop !51

return:                                           ; preds = %for.cond.cleanup, %if.then
  %retval.0 = phi i8* [ %call, %if.then ], [ %call25, %for.cond.cleanup ]
  ret i8* %retval.0
}

; Function Attrs: alwaysinline nounwind willreturn mustprogress
define weak i32 @halide_malloc_alignment() local_unnamed_addr #6 {
entry:
  ret i32 128
}

; Function Attrs: nounwind
define weak i32 @halide_reuse_device_allocations(i8* %user_context, i1 zeroext %flag) local_unnamed_addr #4 {
entry:
  %frombool = zext i1 %flag to i8
  store i8 %frombool, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !18
  br i1 %flag, label %if.end5, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #14
  %p.014 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  %cmp.not15 = icmp eq %struct.halide_device_allocation_pool* %p.014, null
  br i1 %cmp.not15, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.then
  %err.0.lcssa = phi i32 [ 0, %if.then ], [ %spec.select, %for.body ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #14
  br label %if.end5

for.body:                                         ; preds = %if.then, %for.body
  %p.017 = phi %struct.halide_device_allocation_pool* [ %p.0, %for.body ], [ %p.014, %if.then ]
  %err.016 = phi i32 [ %spec.select, %for.body ], [ 0, %if.then ]
  %release_unused = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i32 0, i32 0
  %0 = load i32 (i8*)*, i32 (i8*)** %release_unused, align 4, !tbaa !52
  %call = tail call i32 %0(i8* %user_context) #14
  %tobool3.not = icmp eq i32 %call, 0
  %spec.select = select i1 %tobool3.not, i32 %err.016, i32 %call
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i32 0, i32 1
  %p.0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** %next, align 4, !tbaa !10
  %cmp.not = icmp eq %struct.halide_device_allocation_pool* %p.0, null
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body, !llvm.loop !54

if.end5:                                          ; preds = %for.cond.cleanup, %entry
  %err.2 = phi i32 [ 0, %entry ], [ %err.0.lcssa, %for.cond.cleanup ]
  ret i32 %err.2
}

; Function Attrs: nounwind willreturn mustprogress
define weak zeroext i1 @halide_can_reuse_device_allocations(i8* %user_context) local_unnamed_addr #2 {
entry:
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !18, !range !21
  %tobool = icmp ne i8 %0, 0
  ret i1 %tobool
}

; Function Attrs: nounwind willreturn
define weak void @halide_register_device_allocation_pool(%struct.halide_device_allocation_pool* %pool) local_unnamed_addr #7 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #14
  %0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %pool, i32 0, i32 1
  store %struct.halide_device_allocation_pool* %0, %struct.halide_device_allocation_pool** %next, align 4, !tbaa !55
  store %struct.halide_device_allocation_pool* %pool, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #14
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %d, i64 %src_off, i64 %dst_off) local_unnamed_addr #0 {
entry:
  %cmp39 = icmp sgt i32 %d, -1
  br i1 %cmp39, label %land.rhs, label %while.end

land.rhs:                                         ; preds = %entry, %while.body
  %d.addr.040 = phi i32 [ %dec, %while.body ], [ %d, %entry ]
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d.addr.040
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !26
  %cmp1 = icmp eq i64 %0, 1
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %land.rhs
  %dec = add nsw i32 %d.addr.040, -1
  %cmp = icmp sgt i32 %d.addr.040, 0
  br i1 %cmp, label %land.rhs, label %if.then, !llvm.loop !56

while.end:                                        ; preds = %land.rhs, %entry
  %d.addr.0.lcssa = phi i32 [ %d, %entry ], [ %d.addr.040, %land.rhs ]
  %cmp2 = icmp eq i32 %d.addr.0.lcssa, -1
  br i1 %cmp2, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %while.end
  %arrayidx7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 3, i32 %d.addr.0.lcssa
  %1 = load i64, i64* %arrayidx7, align 8, !tbaa !26
  %cmp835.not = icmp eq i64 %1, 0
  br i1 %cmp835.not, label %if.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %sub = add nsw i32 %d.addr.0.lcssa, -1
  %arrayidx9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 4, i32 %d.addr.0.lcssa
  %arrayidx11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 5, i32 %d.addr.0.lcssa
  %inc.0 = add nuw i64 0, 1
  br label %for.body

if.then:                                          ; preds = %while.body, %while.end
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 0
  %2 = load i64, i64* %src, align 8, !tbaa !57
  %add = add i64 %2, %src_off
  %conv = trunc i64 %add to i32
  %3 = inttoptr i32 %conv to i8*
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 1
  %4 = load i64, i64* %dst, align 8, !tbaa !59
  %add3 = add i64 %4, %dst_off
  %conv4 = trunc i64 %add3 to i32
  %5 = inttoptr i32 %conv4 to i8*
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 6
  %6 = load i64, i64* %chunk_size, align 8, !tbaa !60
  %conv5 = trunc i64 %6 to i32
  %call = tail call i8* @memcpy(i8* %5, i8* %3, i32 %conv5) #14
  br label %if.end

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %inc.phi = phi i64 [ %inc.0, %for.body.lr.ph ], [ %inc.1, %for.body.for.body_crit_edge ]
  %src_off.addr.037 = phi i64 [ %src_off, %for.body.lr.ph ], [ %add10, %for.body.for.body_crit_edge ]
  %dst_off.addr.036 = phi i64 [ %dst_off, %for.body.lr.ph ], [ %add12, %for.body.for.body_crit_edge ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %sub, i64 %src_off.addr.037, i64 %dst_off.addr.036) #15
  %7 = load i64, i64* %arrayidx9, align 8, !tbaa !26
  %add10 = add i64 %7, %src_off.addr.037
  %8 = load i64, i64* %arrayidx11, align 8, !tbaa !26
  %add12 = add i64 %8, %dst_off.addr.036
  %9 = load i64, i64* %arrayidx7, align 8, !tbaa !26
  %cmp8 = icmp ult i64 %inc.phi, %9
  br i1 %cmp8, label %for.body.for.body_crit_edge, label %if.end, !llvm.loop !61

for.body.for.body_crit_edge:                      ; preds = %for.body
  %inc.1 = add nuw i64 %inc.phi, 1
  br label %for.body

if.end:                                           ; preds = %for.body, %if.then, %for.cond.preheader
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i8* %user_context) local_unnamed_addr #0 {
entry:
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 0
  %0 = load i64, i64* %src, align 8, !tbaa !57
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 1
  %1 = load i64, i64* %dst, align 8, !tbaa !59
  %cmp.not = icmp eq i64 %0, %1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i32 0, i32 2
  %2 = load i64, i64* %src_begin, align 8, !tbaa !62
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 15, i64 %2, i64 0) #15
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* noalias sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %agg.result, %struct.halide_buffer_t* %src, i1 zeroext %src_host, %struct.halide_buffer_t* %dst, i1 zeroext %dst_host) local_unnamed_addr #0 {
entry:
  %c = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %0 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %0) #11
  br i1 %src_host, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 2
  %1 = load i8*, i8** %host, align 4, !tbaa !43
  %2 = ptrtoint i8* %1 to i32
  %3 = zext i32 %2 to i64
  br label %cond.end

cond.false:                                       ; preds = %entry
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %4 = load i64, i64* %device, align 8, !tbaa !40
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %3, %cond.true ], [ %4, %cond.false ]
  %src2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 0
  store i64 %cond, i64* %src2, align 8, !tbaa !57
  br i1 %dst_host, label %cond.true4, label %cond.false6

cond.true4:                                       ; preds = %cond.end
  %host5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 2
  %5 = load i8*, i8** %host5, align 4, !tbaa !43
  %6 = ptrtoint i8* %5 to i32
  %7 = zext i32 %6 to i64
  br label %cond.end8

cond.false6:                                      ; preds = %cond.end
  %device7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %8 = load i64, i64* %device7, align 8, !tbaa !40
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true4
  %cond9 = phi i64 [ %7, %cond.true4 ], [ %8, %cond.false6 ]
  %dst10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 1
  store i64 %cond9, i64* %dst10, align 8, !tbaa !59
  %bits.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 4, i32 1
  %9 = load i8, i8* %bits.i, align 1, !tbaa !38
  %conv.i = zext i8 %9 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %conv = zext i32 %div.i to i64
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 6
  store i64 %conv, i64* %chunk_size, align 8, !tbaa !60
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 0
  store i64 1, i64* %arrayidx, align 8, !tbaa !26
  %arrayidx11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 0
  store i64 0, i64* %arrayidx11, align 8, !tbaa !26
  %arrayidx12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 0
  store i64 0, i64* %arrayidx12, align 8, !tbaa !26
  %arrayidx.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 1
  store i64 1, i64* %arrayidx.1, align 8, !tbaa !26
  %arrayidx11.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 1
  store i64 0, i64* %arrayidx11.1, align 8, !tbaa !26
  %arrayidx12.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 1
  store i64 0, i64* %arrayidx12.1, align 8, !tbaa !26
  %arrayidx.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 2
  store i64 1, i64* %arrayidx.2, align 8, !tbaa !26
  %arrayidx11.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 2
  store i64 0, i64* %arrayidx11.2, align 8, !tbaa !26
  %arrayidx12.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 2
  store i64 0, i64* %arrayidx12.2, align 8, !tbaa !26
  %arrayidx.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 3
  store i64 1, i64* %arrayidx.3, align 8, !tbaa !26
  %arrayidx11.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 3
  store i64 0, i64* %arrayidx11.3, align 8, !tbaa !26
  %arrayidx12.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 3
  store i64 0, i64* %arrayidx12.3, align 8, !tbaa !26
  %arrayidx.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 4
  store i64 1, i64* %arrayidx.4, align 8, !tbaa !26
  %arrayidx11.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 4
  store i64 0, i64* %arrayidx11.4, align 8, !tbaa !26
  %arrayidx12.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 4
  store i64 0, i64* %arrayidx12.4, align 8, !tbaa !26
  %arrayidx.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 5
  store i64 1, i64* %arrayidx.5, align 8, !tbaa !26
  %arrayidx11.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 5
  store i64 0, i64* %arrayidx11.5, align 8, !tbaa !26
  %arrayidx12.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 5
  store i64 0, i64* %arrayidx12.5, align 8, !tbaa !26
  %arrayidx.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 6
  store i64 1, i64* %arrayidx.6, align 8, !tbaa !26
  %arrayidx11.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 6
  store i64 0, i64* %arrayidx11.6, align 8, !tbaa !26
  %arrayidx12.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 6
  store i64 0, i64* %arrayidx12.6, align 8, !tbaa !26
  %arrayidx.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 7
  store i64 1, i64* %arrayidx.7, align 8, !tbaa !26
  %arrayidx11.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 7
  store i64 0, i64* %arrayidx11.7, align 8, !tbaa !26
  %arrayidx12.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 7
  store i64 0, i64* %arrayidx12.7, align 8, !tbaa !26
  %arrayidx.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 8
  store i64 1, i64* %arrayidx.8, align 8, !tbaa !26
  %arrayidx11.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 8
  store i64 0, i64* %arrayidx11.8, align 8, !tbaa !26
  %arrayidx12.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 8
  store i64 0, i64* %arrayidx12.8, align 8, !tbaa !26
  %arrayidx.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 9
  store i64 1, i64* %arrayidx.9, align 8, !tbaa !26
  %arrayidx11.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 9
  store i64 0, i64* %arrayidx11.9, align 8, !tbaa !26
  %arrayidx12.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 9
  store i64 0, i64* %arrayidx12.9, align 8, !tbaa !26
  %arrayidx.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 10
  store i64 1, i64* %arrayidx.10, align 8, !tbaa !26
  %arrayidx11.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 10
  store i64 0, i64* %arrayidx11.10, align 8, !tbaa !26
  %arrayidx12.10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 10
  store i64 0, i64* %arrayidx12.10, align 8, !tbaa !26
  %arrayidx.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 11
  store i64 1, i64* %arrayidx.11, align 8, !tbaa !26
  %arrayidx11.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 11
  store i64 0, i64* %arrayidx11.11, align 8, !tbaa !26
  %arrayidx12.11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 11
  store i64 0, i64* %arrayidx12.11, align 8, !tbaa !26
  %arrayidx.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 12
  store i64 1, i64* %arrayidx.12, align 8, !tbaa !26
  %arrayidx11.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 12
  store i64 0, i64* %arrayidx11.12, align 8, !tbaa !26
  %arrayidx12.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 12
  store i64 0, i64* %arrayidx12.12, align 8, !tbaa !26
  %arrayidx.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 13
  store i64 1, i64* %arrayidx.13, align 8, !tbaa !26
  %arrayidx11.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 13
  store i64 0, i64* %arrayidx11.13, align 8, !tbaa !26
  %arrayidx12.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 13
  store i64 0, i64* %arrayidx12.13, align 8, !tbaa !26
  %arrayidx.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 14
  store i64 1, i64* %arrayidx.14, align 8, !tbaa !26
  %arrayidx11.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 14
  store i64 0, i64* %arrayidx11.14, align 8, !tbaa !26
  %arrayidx12.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 14
  store i64 0, i64* %arrayidx12.14, align 8, !tbaa !26
  %arrayidx.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 15
  store i64 1, i64* %arrayidx.15, align 8, !tbaa !26
  %arrayidx11.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 15
  store i64 0, i64* %arrayidx11.15, align 8, !tbaa !26
  %arrayidx12.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 15
  store i64 0, i64* %arrayidx12.15, align 8, !tbaa !26
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 2
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %10 = load i32, i32* %dimensions, align 4, !tbaa !45
  %cmp15248 = icmp sgt i32 %10, 0
  br i1 %cmp15248, label %for.body17.lr.ph, label %for.cond.cleanup16

for.body17.lr.ph:                                 ; preds = %cond.end8
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 6
  %11 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %dim20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 6
  %12 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim20, align 8, !tbaa !46
  %13 = add i32 %10, -1
  %xtraiter = and i32 %10, 7
  %14 = icmp ult i32 %13, 7
  br i1 %14, label %for.cond.cleanup16.loopexit.unr-lcssa, label %for.body17.lr.ph.new

for.body17.lr.ph.new:                             ; preds = %for.body17.lr.ph
  %unroll_iter = and i32 %10, -8
  br label %for.body17

for.cond.cleanup16.loopexit.unr-lcssa:            ; preds = %for.body17, %for.body17.lr.ph
  %add.lcssa.ph = phi i64 [ undef, %for.body17.lr.ph ], [ %add.7, %for.body17 ]
  %.unr = phi i64 [ 0, %for.body17.lr.ph ], [ %add.7, %for.body17 ]
  %i13.0249.unr = phi i32 [ 0, %for.body17.lr.ph ], [ %inc28.7, %for.body17 ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup16, label %for.body17.epil

for.body17.epil:                                  ; preds = %for.cond.cleanup16.loopexit.unr-lcssa, %for.body17.epil
  %15 = phi i64 [ %add.epil, %for.body17.epil ], [ %.unr, %for.cond.cleanup16.loopexit.unr-lcssa ]
  %i13.0249.epil = phi i32 [ %inc28.epil, %for.body17.epil ], [ %i13.0249.unr, %for.cond.cleanup16.loopexit.unr-lcssa ]
  %epil.iter = phi i32 [ %epil.iter.sub, %for.body17.epil ], [ %xtraiter, %for.cond.cleanup16.loopexit.unr-lcssa ]
  %stride.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %i13.0249.epil, i32 2
  %16 = load i32, i32* %stride.epil, align 4, !tbaa !50
  %conv19.epil = sext i32 %16 to i64
  %min.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %i13.0249.epil, i32 0
  %17 = load i32, i32* %min.epil, align 4, !tbaa !47
  %min24.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %i13.0249.epil, i32 0
  %18 = load i32, i32* %min24.epil, align 4, !tbaa !47
  %sub.epil = sub nsw i32 %17, %18
  %conv25.epil = sext i32 %sub.epil to i64
  %mul.epil = mul nsw i64 %conv25.epil, %conv19.epil
  %add.epil = add i64 %mul.epil, %15
  %inc28.epil = add nuw nsw i32 %i13.0249.epil, 1
  %epil.iter.sub = add i32 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup16, label %for.body17.epil, !llvm.loop !63

for.cond.cleanup16:                               ; preds = %for.cond.cleanup16.loopexit.unr-lcssa, %for.body17.epil, %cond.end8
  %19 = phi i64 [ 0, %cond.end8 ], [ %add.lcssa.ph, %for.cond.cleanup16.loopexit.unr-lcssa ], [ %add.epil, %for.body17.epil ]
  %mul32 = mul i64 %19, %conv
  store i64 %mul32, i64* %src_begin, align 8, !tbaa !62
  %dimensions34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %20 = load i32, i32* %dimensions34, align 4, !tbaa !45
  %cmp35.not = icmp eq i32 %10, %20
  br i1 %cmp35.not, label %lor.lhs.false, label %if.then

for.body17:                                       ; preds = %for.body17, %for.body17.lr.ph.new
  %21 = phi i64 [ 0, %for.body17.lr.ph.new ], [ %add.7, %for.body17 ]
  %i13.0249 = phi i32 [ 0, %for.body17.lr.ph.new ], [ %inc28.7, %for.body17 ]
  %niter = phi i32 [ %unroll_iter, %for.body17.lr.ph.new ], [ %niter.nsub.7, %for.body17 ]
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %i13.0249, i32 2
  %22 = load i32, i32* %stride, align 4, !tbaa !50
  %conv19 = sext i32 %22 to i64
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %i13.0249, i32 0
  %23 = load i32, i32* %min, align 4, !tbaa !47
  %min24 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %i13.0249, i32 0
  %24 = load i32, i32* %min24, align 4, !tbaa !47
  %sub = sub nsw i32 %23, %24
  %conv25 = sext i32 %sub to i64
  %mul = mul nsw i64 %conv25, %conv19
  %add = add i64 %mul, %21
  %inc28 = or i32 %i13.0249, 1
  %stride.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28, i32 2
  %25 = load i32, i32* %stride.1, align 4, !tbaa !50
  %conv19.1 = sext i32 %25 to i64
  %min.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %inc28, i32 0
  %26 = load i32, i32* %min.1, align 4, !tbaa !47
  %min24.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28, i32 0
  %27 = load i32, i32* %min24.1, align 4, !tbaa !47
  %sub.1 = sub nsw i32 %26, %27
  %conv25.1 = sext i32 %sub.1 to i64
  %mul.1 = mul nsw i64 %conv25.1, %conv19.1
  %add.1 = add i64 %mul.1, %add
  %inc28.1 = or i32 %i13.0249, 2
  %stride.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.1, i32 2
  %28 = load i32, i32* %stride.2, align 4, !tbaa !50
  %conv19.2 = sext i32 %28 to i64
  %min.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %inc28.1, i32 0
  %29 = load i32, i32* %min.2, align 4, !tbaa !47
  %min24.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.1, i32 0
  %30 = load i32, i32* %min24.2, align 4, !tbaa !47
  %sub.2 = sub nsw i32 %29, %30
  %conv25.2 = sext i32 %sub.2 to i64
  %mul.2 = mul nsw i64 %conv25.2, %conv19.2
  %add.2 = add i64 %mul.2, %add.1
  %inc28.2 = or i32 %i13.0249, 3
  %stride.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.2, i32 2
  %31 = load i32, i32* %stride.3, align 4, !tbaa !50
  %conv19.3 = sext i32 %31 to i64
  %min.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %inc28.2, i32 0
  %32 = load i32, i32* %min.3, align 4, !tbaa !47
  %min24.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.2, i32 0
  %33 = load i32, i32* %min24.3, align 4, !tbaa !47
  %sub.3 = sub nsw i32 %32, %33
  %conv25.3 = sext i32 %sub.3 to i64
  %mul.3 = mul nsw i64 %conv25.3, %conv19.3
  %add.3 = add i64 %mul.3, %add.2
  %inc28.3 = or i32 %i13.0249, 4
  %stride.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.3, i32 2
  %34 = load i32, i32* %stride.4, align 4, !tbaa !50
  %conv19.4 = sext i32 %34 to i64
  %min.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %inc28.3, i32 0
  %35 = load i32, i32* %min.4, align 4, !tbaa !47
  %min24.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.3, i32 0
  %36 = load i32, i32* %min24.4, align 4, !tbaa !47
  %sub.4 = sub nsw i32 %35, %36
  %conv25.4 = sext i32 %sub.4 to i64
  %mul.4 = mul nsw i64 %conv25.4, %conv19.4
  %add.4 = add i64 %mul.4, %add.3
  %inc28.4 = or i32 %i13.0249, 5
  %stride.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.4, i32 2
  %37 = load i32, i32* %stride.5, align 4, !tbaa !50
  %conv19.5 = sext i32 %37 to i64
  %min.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %inc28.4, i32 0
  %38 = load i32, i32* %min.5, align 4, !tbaa !47
  %min24.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.4, i32 0
  %39 = load i32, i32* %min24.5, align 4, !tbaa !47
  %sub.5 = sub nsw i32 %38, %39
  %conv25.5 = sext i32 %sub.5 to i64
  %mul.5 = mul nsw i64 %conv25.5, %conv19.5
  %add.5 = add i64 %mul.5, %add.4
  %inc28.5 = or i32 %i13.0249, 6
  %stride.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.5, i32 2
  %40 = load i32, i32* %stride.6, align 4, !tbaa !50
  %conv19.6 = sext i32 %40 to i64
  %min.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %inc28.5, i32 0
  %41 = load i32, i32* %min.6, align 4, !tbaa !47
  %min24.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.5, i32 0
  %42 = load i32, i32* %min24.6, align 4, !tbaa !47
  %sub.6 = sub nsw i32 %41, %42
  %conv25.6 = sext i32 %sub.6 to i64
  %mul.6 = mul nsw i64 %conv25.6, %conv19.6
  %add.6 = add i64 %mul.6, %add.5
  %inc28.6 = or i32 %i13.0249, 7
  %stride.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.6, i32 2
  %43 = load i32, i32* %stride.7, align 4, !tbaa !50
  %conv19.7 = sext i32 %43 to i64
  %min.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 %inc28.6, i32 0
  %44 = load i32, i32* %min.7, align 4, !tbaa !47
  %min24.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i32 %inc28.6, i32 0
  %45 = load i32, i32* %min24.7, align 4, !tbaa !47
  %sub.7 = sub nsw i32 %44, %45
  %conv25.7 = sext i32 %sub.7 to i64
  %mul.7 = mul nsw i64 %conv25.7, %conv19.7
  %add.7 = add i64 %mul.7, %add.6
  %inc28.7 = add nuw nsw i32 %i13.0249, 8
  %niter.nsub.7 = add i32 %niter, -8
  %niter.ncmp.7 = icmp eq i32 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %for.cond.cleanup16.loopexit.unr-lcssa, label %for.body17, !llvm.loop !64

lor.lhs.false:                                    ; preds = %for.cond.cleanup16
  %bits.i229 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 4, i32 1
  %46 = load i8, i8* %bits.i229, align 1, !tbaa !38
  %conv.i230 = zext i8 %46 to i32
  %add.i231 = add nuw nsw i32 %conv.i230, 7
  %div.i232 = lshr i32 %add.i231, 3
  %cmp40.not = icmp ne i32 %div.i, %div.i232
  %cmp43 = icmp sgt i32 %10, 16
  %or.cond237 = or i1 %cmp43, %cmp40.not
  br i1 %or.cond237, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.cond.cleanup16
  %47 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i32(i8* nonnull align 8 dereferenceable(416) %47, i8 0, i32 416, i1 false)
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %cmp45 = icmp eq i32 %div.i, 0
  br i1 %cmp45, label %if.then46, label %for.cond49.preheader

for.cond49.preheader:                             ; preds = %if.end
  br i1 %cmp15248, label %for.body53.lr.ph, label %while.end

for.body53.lr.ph:                                 ; preds = %for.cond49.preheader
  %dim55 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 6
  %48 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim55, align 8, !tbaa !46
  %dim64 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 6
  %49 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim64, align 8, !tbaa !46
  br label %for.body53

if.then46:                                        ; preds = %if.end
  %50 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i32(i8* nonnull align 8 dereferenceable(416) %50, i8 0, i32 416, i1 false)
  br label %cleanup

while.cond.preheader:                             ; preds = %for.cond.cleanup86
  %.pre = load i64, i64* %chunk_size, align 8, !tbaa !60
  %.pre253 = load i64, i64* %arrayidx11, align 8, !tbaa !26
  %cmp121239 = icmp eq i64 %.pre, %.pre253
  br i1 %cmp121239, label %land.rhs.lr.ph, label %while.end

land.rhs.lr.ph:                                   ; preds = %while.cond.preheader
  %.pre254 = load i64, i64* %arrayidx12, align 8, !tbaa !26
  br label %land.rhs

for.body53:                                       ; preds = %for.cond.cleanup86, %for.body53.lr.ph
  %i48.0246 = phi i32 [ 0, %for.body53.lr.ph ], [ %inc116, %for.cond.cleanup86 ]
  %stride57 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %48, i32 %i48.0246, i32 2
  %51 = load i32, i32* %stride57, align 4, !tbaa !50
  %conv58 = sext i32 %51 to i64
  %mul62 = mul nsw i64 %conv58, %conv
  %stride66 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %49, i32 %i48.0246, i32 2
  %52 = load i32, i32* %stride66, align 4, !tbaa !50
  %conv67 = sext i32 %52 to i64
  %mul71 = mul nsw i64 %conv67, %conv
  %cmp73240.not = icmp eq i32 %i48.0246, 0
  br i1 %cmp73240.not, label %for.end83, label %for.body74.lr.ph

for.body74.lr.ph:                                 ; preds = %for.body53
  %cmp78.not = icmp eq i64 %mul62, 0
  br i1 %cmp78.not, label %for.end83, label %for.body74.us

for.body74.us:                                    ; preds = %for.body74.lr.ph, %for.inc81.us
  %insert.0241.us = phi i32 [ %inc82.us, %for.inc81.us ], [ 0, %for.body74.lr.ph ]
  %arrayidx76.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %insert.0241.us
  %53 = load i64, i64* %arrayidx76.us, align 8, !tbaa !26
  %cmp77.us = icmp ult i64 %mul62, %53
  br i1 %cmp77.us, label %for.end83, label %for.inc81.us

for.inc81.us:                                     ; preds = %for.body74.us
  %inc82.us = add nuw nsw i32 %insert.0241.us, 1
  %exitcond2.not = icmp eq i32 %inc82.us, %i48.0246
  br i1 %exitcond2.not, label %for.end83, label %for.body74.us, !llvm.loop !65

for.end83:                                        ; preds = %for.inc81.us, %for.body74.us, %for.body74.lr.ph, %for.body53
  %insert.0.lcssa = phi i32 [ 0, %for.body53 ], [ %i48.0246, %for.body74.lr.ph ], [ %i48.0246, %for.inc81.us ], [ %insert.0241.us, %for.body74.us ]
  %cmp85243 = icmp ugt i32 %i48.0246, %insert.0.lcssa
  br i1 %cmp85243, label %for.body87.preheader, label %for.cond.cleanup86

for.body87.preheader:                             ; preds = %for.end83
  %54 = sub i32 %i48.0246, %insert.0.lcssa
  %55 = xor i32 %insert.0.lcssa, -1
  %56 = add i32 %i48.0246, %55
  %xtraiter5 = and i32 %54, 7
  %lcmp.mod6.not = icmp eq i32 %xtraiter5, 0
  br i1 %lcmp.mod6.not, label %for.body87.prol.loopexit, label %for.body87.prol

for.body87.prol:                                  ; preds = %for.body87.preheader, %for.body87.prol
  %j.0244.prol = phi i32 [ %sub89.prol, %for.body87.prol ], [ %i48.0246, %for.body87.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body87.prol ], [ %xtraiter5, %for.body87.preheader ]
  %sub89.prol = add nsw i32 %j.0244.prol, -1
  %arrayidx90.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.prol
  %57 = load i64, i64* %arrayidx90.prol, align 8, !tbaa !26
  %arrayidx92.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %j.0244.prol
  store i64 %57, i64* %arrayidx92.prol, align 8, !tbaa !26
  %arrayidx95.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.prol
  %58 = load i64, i64* %arrayidx95.prol, align 8, !tbaa !26
  %arrayidx97.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %j.0244.prol
  store i64 %58, i64* %arrayidx97.prol, align 8, !tbaa !26
  %arrayidx100.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.prol
  %59 = load i64, i64* %arrayidx100.prol, align 8, !tbaa !26
  %arrayidx102.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %j.0244.prol
  store i64 %59, i64* %arrayidx102.prol, align 8, !tbaa !26
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %for.body87.prol.loopexit, label %for.body87.prol, !llvm.loop !66

for.body87.prol.loopexit:                         ; preds = %for.body87.prol, %for.body87.preheader
  %j.0244.unr = phi i32 [ %i48.0246, %for.body87.preheader ], [ %sub89.prol, %for.body87.prol ]
  %60 = icmp ult i32 %56, 7
  br i1 %60, label %for.cond.cleanup86, label %for.body87

for.cond.cleanup86:                               ; preds = %for.body87.prol.loopexit, %for.body87, %for.end83
  %extent107 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %48, i32 %i48.0246, i32 1
  %61 = load i32, i32* %extent107, align 4, !tbaa !49
  %conv108 = sext i32 %61 to i64
  %arrayidx110 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %insert.0.lcssa
  store i64 %conv108, i64* %arrayidx110, align 8, !tbaa !26
  %arrayidx112 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %insert.0.lcssa
  store i64 %mul62, i64* %arrayidx112, align 8, !tbaa !26
  %arrayidx114 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %insert.0.lcssa
  store i64 %mul71, i64* %arrayidx114, align 8, !tbaa !26
  %inc116 = add nuw nsw i32 %i48.0246, 1
  %exitcond3.not = icmp eq i32 %inc116, %10
  br i1 %exitcond3.not, label %while.cond.preheader, label %for.body53, !llvm.loop !67

for.body87:                                       ; preds = %for.body87.prol.loopexit, %for.body87
  %j.0244 = phi i32 [ %sub89.7, %for.body87 ], [ %j.0244.unr, %for.body87.prol.loopexit ]
  %sub89 = add nsw i32 %j.0244, -1
  %arrayidx90 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89
  %62 = load i64, i64* %arrayidx90, align 8, !tbaa !26
  %arrayidx92 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %j.0244
  store i64 %62, i64* %arrayidx92, align 8, !tbaa !26
  %arrayidx95 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89
  %63 = load i64, i64* %arrayidx95, align 8, !tbaa !26
  %arrayidx97 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %j.0244
  store i64 %63, i64* %arrayidx97, align 8, !tbaa !26
  %arrayidx100 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89
  %64 = load i64, i64* %arrayidx100, align 8, !tbaa !26
  %arrayidx102 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %j.0244
  store i64 %64, i64* %arrayidx102, align 8, !tbaa !26
  %sub89.1 = add nsw i32 %j.0244, -2
  %arrayidx90.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.1
  %65 = load i64, i64* %arrayidx90.1, align 8, !tbaa !26
  %arrayidx92.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89
  store i64 %65, i64* %arrayidx92.1, align 8, !tbaa !26
  %arrayidx95.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.1
  %66 = load i64, i64* %arrayidx95.1, align 8, !tbaa !26
  %arrayidx97.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89
  store i64 %66, i64* %arrayidx97.1, align 8, !tbaa !26
  %arrayidx100.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.1
  %67 = load i64, i64* %arrayidx100.1, align 8, !tbaa !26
  %arrayidx102.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89
  store i64 %67, i64* %arrayidx102.1, align 8, !tbaa !26
  %sub89.2 = add nsw i32 %j.0244, -3
  %arrayidx90.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.2
  %68 = load i64, i64* %arrayidx90.2, align 8, !tbaa !26
  %arrayidx92.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.1
  store i64 %68, i64* %arrayidx92.2, align 8, !tbaa !26
  %arrayidx95.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.2
  %69 = load i64, i64* %arrayidx95.2, align 8, !tbaa !26
  %arrayidx97.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.1
  store i64 %69, i64* %arrayidx97.2, align 8, !tbaa !26
  %arrayidx100.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.2
  %70 = load i64, i64* %arrayidx100.2, align 8, !tbaa !26
  %arrayidx102.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.1
  store i64 %70, i64* %arrayidx102.2, align 8, !tbaa !26
  %sub89.3 = add nsw i32 %j.0244, -4
  %arrayidx90.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.3
  %71 = load i64, i64* %arrayidx90.3, align 8, !tbaa !26
  %arrayidx92.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.2
  store i64 %71, i64* %arrayidx92.3, align 8, !tbaa !26
  %arrayidx95.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.3
  %72 = load i64, i64* %arrayidx95.3, align 8, !tbaa !26
  %arrayidx97.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.2
  store i64 %72, i64* %arrayidx97.3, align 8, !tbaa !26
  %arrayidx100.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.3
  %73 = load i64, i64* %arrayidx100.3, align 8, !tbaa !26
  %arrayidx102.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.2
  store i64 %73, i64* %arrayidx102.3, align 8, !tbaa !26
  %sub89.4 = add nsw i32 %j.0244, -5
  %arrayidx90.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.4
  %74 = load i64, i64* %arrayidx90.4, align 8, !tbaa !26
  %arrayidx92.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.3
  store i64 %74, i64* %arrayidx92.4, align 8, !tbaa !26
  %arrayidx95.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.4
  %75 = load i64, i64* %arrayidx95.4, align 8, !tbaa !26
  %arrayidx97.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.3
  store i64 %75, i64* %arrayidx97.4, align 8, !tbaa !26
  %arrayidx100.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.4
  %76 = load i64, i64* %arrayidx100.4, align 8, !tbaa !26
  %arrayidx102.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.3
  store i64 %76, i64* %arrayidx102.4, align 8, !tbaa !26
  %sub89.5 = add nsw i32 %j.0244, -6
  %arrayidx90.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.5
  %77 = load i64, i64* %arrayidx90.5, align 8, !tbaa !26
  %arrayidx92.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.4
  store i64 %77, i64* %arrayidx92.5, align 8, !tbaa !26
  %arrayidx95.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.5
  %78 = load i64, i64* %arrayidx95.5, align 8, !tbaa !26
  %arrayidx97.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.4
  store i64 %78, i64* %arrayidx97.5, align 8, !tbaa !26
  %arrayidx100.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.5
  %79 = load i64, i64* %arrayidx100.5, align 8, !tbaa !26
  %arrayidx102.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.4
  store i64 %79, i64* %arrayidx102.5, align 8, !tbaa !26
  %sub89.6 = add nsw i32 %j.0244, -7
  %arrayidx90.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.6
  %80 = load i64, i64* %arrayidx90.6, align 8, !tbaa !26
  %arrayidx92.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.5
  store i64 %80, i64* %arrayidx92.6, align 8, !tbaa !26
  %arrayidx95.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.6
  %81 = load i64, i64* %arrayidx95.6, align 8, !tbaa !26
  %arrayidx97.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.5
  store i64 %81, i64* %arrayidx97.6, align 8, !tbaa !26
  %arrayidx100.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.6
  %82 = load i64, i64* %arrayidx100.6, align 8, !tbaa !26
  %arrayidx102.6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.5
  store i64 %82, i64* %arrayidx102.6, align 8, !tbaa !26
  %sub89.7 = add nsw i32 %j.0244, -8
  %arrayidx90.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.7
  %83 = load i64, i64* %arrayidx90.7, align 8, !tbaa !26
  %arrayidx92.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 3, i32 %sub89.6
  store i64 %83, i64* %arrayidx92.7, align 8, !tbaa !26
  %arrayidx95.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.7
  %84 = load i64, i64* %arrayidx95.7, align 8, !tbaa !26
  %arrayidx97.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 5, i32 %sub89.6
  store i64 %84, i64* %arrayidx97.7, align 8, !tbaa !26
  %arrayidx100.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.7
  %85 = load i64, i64* %arrayidx100.7, align 8, !tbaa !26
  %arrayidx102.7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i32 0, i32 4, i32 %sub89.6
  store i64 %85, i64* %arrayidx102.7, align 8, !tbaa !26
  %cmp85.7 = icmp sgt i32 %sub89.7, %insert.0.lcssa
  br i1 %cmp85.7, label %for.body87, label %for.cond.cleanup86, !llvm.loop !68

land.rhs:                                         ; preds = %while.body, %land.rhs.lr.ph
  %86 = phi i64 [ %.pre254, %land.rhs.lr.ph ], [ %91, %while.body ]
  %87 = phi i64 [ %.pre, %land.rhs.lr.ph ], [ %mul129, %while.body ]
  %cmp125 = icmp eq i64 %87, %86
  br i1 %cmp125, label %while.body, label %while.end

while.body:                                       ; preds = %land.rhs
  %88 = load i64, i64* %arrayidx, align 8, !tbaa !26
  %mul129 = mul i64 %88, %86
  store i64 %mul129, i64* %chunk_size, align 8, !tbaa !60
  %89 = load i64, i64* %arrayidx.1, align 8, !tbaa !26
  store i64 %89, i64* %arrayidx, align 8, !tbaa !26
  %90 = load i64, i64* %arrayidx11.1, align 8, !tbaa !26
  store i64 %90, i64* %arrayidx11, align 8, !tbaa !26
  %91 = load i64, i64* %arrayidx12.1, align 8, !tbaa !26
  store i64 %91, i64* %arrayidx12, align 8, !tbaa !26
  %92 = load i64, i64* %arrayidx.2, align 8, !tbaa !26
  store i64 %92, i64* %arrayidx.1, align 8, !tbaa !26
  %93 = load i64, i64* %arrayidx11.2, align 8, !tbaa !26
  store i64 %93, i64* %arrayidx11.1, align 8, !tbaa !26
  %94 = load i64, i64* %arrayidx12.2, align 8, !tbaa !26
  store i64 %94, i64* %arrayidx12.1, align 8, !tbaa !26
  %95 = load i64, i64* %arrayidx.3, align 8, !tbaa !26
  store i64 %95, i64* %arrayidx.2, align 8, !tbaa !26
  %96 = load i64, i64* %arrayidx11.3, align 8, !tbaa !26
  store i64 %96, i64* %arrayidx11.2, align 8, !tbaa !26
  %97 = load i64, i64* %arrayidx12.3, align 8, !tbaa !26
  store i64 %97, i64* %arrayidx12.2, align 8, !tbaa !26
  %98 = load i64, i64* %arrayidx.4, align 8, !tbaa !26
  store i64 %98, i64* %arrayidx.3, align 8, !tbaa !26
  %99 = load i64, i64* %arrayidx11.4, align 8, !tbaa !26
  store i64 %99, i64* %arrayidx11.3, align 8, !tbaa !26
  %100 = load i64, i64* %arrayidx12.4, align 8, !tbaa !26
  store i64 %100, i64* %arrayidx12.3, align 8, !tbaa !26
  %101 = load i64, i64* %arrayidx.5, align 8, !tbaa !26
  store i64 %101, i64* %arrayidx.4, align 8, !tbaa !26
  %102 = load i64, i64* %arrayidx11.5, align 8, !tbaa !26
  store i64 %102, i64* %arrayidx11.4, align 8, !tbaa !26
  %103 = load i64, i64* %arrayidx12.5, align 8, !tbaa !26
  store i64 %103, i64* %arrayidx12.4, align 8, !tbaa !26
  %104 = load i64, i64* %arrayidx.6, align 8, !tbaa !26
  store i64 %104, i64* %arrayidx.5, align 8, !tbaa !26
  %105 = load i64, i64* %arrayidx11.6, align 8, !tbaa !26
  store i64 %105, i64* %arrayidx11.5, align 8, !tbaa !26
  %106 = load i64, i64* %arrayidx12.6, align 8, !tbaa !26
  store i64 %106, i64* %arrayidx12.5, align 8, !tbaa !26
  %107 = load i64, i64* %arrayidx.7, align 8, !tbaa !26
  store i64 %107, i64* %arrayidx.6, align 8, !tbaa !26
  %108 = load i64, i64* %arrayidx11.7, align 8, !tbaa !26
  store i64 %108, i64* %arrayidx11.6, align 8, !tbaa !26
  %109 = load i64, i64* %arrayidx12.7, align 8, !tbaa !26
  store i64 %109, i64* %arrayidx12.6, align 8, !tbaa !26
  %110 = load i64, i64* %arrayidx.8, align 8, !tbaa !26
  store i64 %110, i64* %arrayidx.7, align 8, !tbaa !26
  %111 = load i64, i64* %arrayidx11.8, align 8, !tbaa !26
  store i64 %111, i64* %arrayidx11.7, align 8, !tbaa !26
  %112 = load i64, i64* %arrayidx12.8, align 8, !tbaa !26
  store i64 %112, i64* %arrayidx12.7, align 8, !tbaa !26
  %113 = load i64, i64* %arrayidx.9, align 8, !tbaa !26
  store i64 %113, i64* %arrayidx.8, align 8, !tbaa !26
  %114 = load i64, i64* %arrayidx11.9, align 8, !tbaa !26
  store i64 %114, i64* %arrayidx11.8, align 8, !tbaa !26
  %115 = load i64, i64* %arrayidx12.9, align 8, !tbaa !26
  store i64 %115, i64* %arrayidx12.8, align 8, !tbaa !26
  %116 = load i64, i64* %arrayidx.10, align 8, !tbaa !26
  store i64 %116, i64* %arrayidx.9, align 8, !tbaa !26
  %117 = load i64, i64* %arrayidx11.10, align 8, !tbaa !26
  store i64 %117, i64* %arrayidx11.9, align 8, !tbaa !26
  %118 = load i64, i64* %arrayidx12.10, align 8, !tbaa !26
  store i64 %118, i64* %arrayidx12.9, align 8, !tbaa !26
  %119 = load i64, i64* %arrayidx.11, align 8, !tbaa !26
  store i64 %119, i64* %arrayidx.10, align 8, !tbaa !26
  %120 = load i64, i64* %arrayidx11.11, align 8, !tbaa !26
  store i64 %120, i64* %arrayidx11.10, align 8, !tbaa !26
  %121 = load i64, i64* %arrayidx12.11, align 8, !tbaa !26
  store i64 %121, i64* %arrayidx12.10, align 8, !tbaa !26
  %122 = load i64, i64* %arrayidx.12, align 8, !tbaa !26
  store i64 %122, i64* %arrayidx.11, align 8, !tbaa !26
  %123 = load i64, i64* %arrayidx11.12, align 8, !tbaa !26
  store i64 %123, i64* %arrayidx11.11, align 8, !tbaa !26
  %124 = load i64, i64* %arrayidx12.12, align 8, !tbaa !26
  store i64 %124, i64* %arrayidx12.11, align 8, !tbaa !26
  %125 = load i64, i64* %arrayidx.13, align 8, !tbaa !26
  store i64 %125, i64* %arrayidx.12, align 8, !tbaa !26
  %126 = load i64, i64* %arrayidx11.13, align 8, !tbaa !26
  store i64 %126, i64* %arrayidx11.12, align 8, !tbaa !26
  %127 = load i64, i64* %arrayidx12.13, align 8, !tbaa !26
  store i64 %127, i64* %arrayidx12.12, align 8, !tbaa !26
  %128 = load i64, i64* %arrayidx.14, align 8, !tbaa !26
  store i64 %128, i64* %arrayidx.13, align 8, !tbaa !26
  %129 = load i64, i64* %arrayidx11.14, align 8, !tbaa !26
  store i64 %129, i64* %arrayidx11.13, align 8, !tbaa !26
  %130 = load i64, i64* %arrayidx12.14, align 8, !tbaa !26
  store i64 %130, i64* %arrayidx12.13, align 8, !tbaa !26
  %131 = load i64, i64* %arrayidx.15, align 8, !tbaa !26
  store i64 %131, i64* %arrayidx.14, align 8, !tbaa !26
  %132 = load i64, i64* %arrayidx11.15, align 8, !tbaa !26
  store i64 %132, i64* %arrayidx11.14, align 8, !tbaa !26
  %133 = load i64, i64* %arrayidx12.15, align 8, !tbaa !26
  store i64 %133, i64* %arrayidx12.14, align 8, !tbaa !26
  store i64 1, i64* %arrayidx.15, align 8, !tbaa !26
  store i64 0, i64* %arrayidx11.15, align 8, !tbaa !26
  store i64 0, i64* %arrayidx12.15, align 8, !tbaa !26
  %cmp121 = icmp eq i64 %mul129, %90
  br i1 %cmp121, label %land.rhs, label %while.end, !llvm.loop !69

while.end:                                        ; preds = %while.body, %land.rhs, %while.cond.preheader, %for.cond49.preheader
  %134 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(416) %134, i8* nonnull align 8 dereferenceable(416) %0, i32 416, i1 false), !tbaa.struct !70
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.then46, %if.then
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %0) #11
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %0 = load i64, i64* %flags.i.i, align 8, !tbaa !44
  %and.i.i = and i64 %0, 2
  %cmp.i.i.not = icmp eq i64 %and.i.i, 0
  br i1 %cmp.i.i.not, label %return, label %if.end

if.end:                                           ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %and.i.i46 = and i64 %0, 1
  %cmp.i.i47.not = icmp eq i64 %and.i.i46, 0
  br i1 %cmp.i.i47.not, label %if.end9, label %return

if.end9:                                          ; preds = %if.end
  %cmp = icmp eq %struct.halide_device_interface_t* %1, null
  br i1 %cmp, label %return, label %if.end15

if.end15:                                         ; preds = %if.end9
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %copy_to_host = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 6
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_host, align 4, !tbaa !73
  %call16 = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %cmp17.not = icmp eq i32 %call16, 0
  br i1 %cmp17.not, label %if.end23, label %return

if.end23:                                         ; preds = %if.end15
  %4 = load i64, i64* %flags.i.i, align 8, !tbaa !44
  %and.i.i44 = and i64 %4, -3
  store i64 %and.i.i44, i64* %flags.i.i, align 8, !tbaa !44
  %call24 = tail call i32 @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  br label %return

return:                                           ; preds = %if.end23, %if.end15, %if.end9, %if.end, %entry
  %retval.2 = phi i32 [ 0, %entry ], [ 0, %if.end23 ], [ -14, %if.end ], [ -19, %if.end9 ], [ -14, %if.end15 ]
  ret i32 %retval.2
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_release(i8* %user_context, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_release = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 5
  %1 = load i32 (i8*)*, i32 (i8*)** %device_release, align 4, !tbaa !75
  %call = tail call i32 %1(i8* %user_context) #14
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6.17, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  br label %cleanup

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) #15
  br label %cleanup

cleanup:                                          ; preds = %if.end16.i.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.18, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %if.end, label %cleanup

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i
  %cmp1 = icmp eq %struct.halide_device_interface_t* %device_interface, null
  br i1 %cmp1, label %if.then2, label %if.end11

if.then2:                                         ; preds = %if.end
  %device_interface5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface5, align 8, !tbaa !42
  %cmp6 = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.then2
  %call8 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %cleanup

if.end11:                                         ; preds = %if.then2, %if.end
  %device_interface.addr.0 = phi %struct.halide_device_interface_t* [ %device_interface, %if.end ], [ %4, %if.then2 ]
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %5 = load i64, i64* %device, align 8, !tbaa !40
  %tobool.not = icmp eq i64 %5, 0
  br i1 %tobool.not, label %if.then18, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end11
  %device_interface12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface12, align 8, !tbaa !42
  %cmp13.not = icmp eq %struct.halide_device_interface_t* %6, %device_interface.addr.0
  br i1 %cmp13.not, label %if.end27, label %if.then14

if.then14:                                        ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9.19, i32 0, i32 0)) #14
  br label %cleanup

if.then18:                                        ; preds = %if.end11
  %call19 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* nonnull %device_interface.addr.0) #15
  %cmp20.not = icmp eq i32 %call19, 0
  br i1 %cmp20.not, label %if.end27, label %cleanup

if.end27:                                         ; preds = %if.then18, %land.lhs.true
  %flags.i.i97 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %7 = load i64, i64* %flags.i.i97, align 8, !tbaa !44
  %and.i.i98 = and i64 %7, 1
  %cmp.i.i99.not = icmp eq i64 %and.i.i98, 0
  br i1 %cmp.i.i99.not, label %cleanup, label %if.then29

if.then29:                                        ; preds = %if.end27
  %and.i.i96 = and i64 %7, 2
  %cmp.i.i.not = icmp eq i64 %and.i.i96, 0
  br i1 %cmp.i.i.not, label %if.else, label %cleanup

if.else:                                          ; preds = %if.then29
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface.addr.0, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %copy_to_device = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 7
  %9 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_device, align 4, !tbaa !76
  %call44 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %cmp45 = icmp eq i32 %call44, 0
  br i1 %cmp45, label %if.then46, label %cleanup

if.then46:                                        ; preds = %if.else
  %10 = load i64, i64* %flags.i.i97, align 8, !tbaa !44
  %and.i.i = and i64 %10, -2
  store i64 %and.i.i, i64* %flags.i.i97, align 8, !tbaa !44
  br label %cleanup

cleanup:                                          ; preds = %if.then46, %if.else, %if.then29, %if.end27, %if.then18, %if.then14, %if.then7, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %call8, %if.then7 ], [ -42, %if.then14 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.then46 ], [ %call19, %if.then18 ], [ -15, %if.then29 ], [ -15, %if.else ], [ 0, %if.end27 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17.20, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp4.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp5.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = or i1 %cmp4.not, %cmp5.not
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.21, i32 0, i32 0)) #14
  br label %cleanup12

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 2
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_malloc, align 4, !tbaa !78
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #14
  %tobool.not = icmp eq i32 %call9, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -16
  ret i32 %spec.select

cleanup12:                                        ; preds = %if.then6, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then6 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  %call = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) #15
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_sync(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16.22, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup8

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %cleanup8

if.end5:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_sync = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 4
  %6 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_sync, align 4, !tbaa !80
  %call6 = tail call i32 %6(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %tobool.not = icmp eq i32 %call6, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -17
  ret i32 %spec.select

cleanup8:                                         ; preds = %if.then3, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call4, %if.then3 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.23, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %if.end11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 3
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_free, align 4, !tbaa !81
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #14
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.22.24, i32 0, i32 0)) #14
  tail call void @abort() #14
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -18
  ret i32 %spec.select

if.end11:                                         ; preds = %if.end
  %flags3.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %12 = load i64, i64* %flags3.i.i, align 8, !tbaa !44
  %and.i.i = and i64 %12, -3
  store i64 %and.i.i, i64* %flags3.i.i, align 8, !tbaa !44
  br label %cleanup12

cleanup12:                                        ; preds = %if.end11, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end11 ]
  ret i32 %retval.1
}

declare void @abort() local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_device_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %0) #15
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.25, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup14

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp4.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp5.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = or i1 %cmp4.not, %cmp5.not
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.26, i32 0, i32 0)) #14
  br label %cleanup14

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_and_host_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 8
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_malloc, align 4, !tbaa !82
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #14
  %cmp11.not = icmp eq i32 %call9, 0
  br i1 %cmp11.not, label %cleanup14, label %if.then12

if.then12:                                        ; preds = %if.end7
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26, i32 0, i32 0)) #14
  br label %cleanup14

cleanup14:                                        ; preds = %if.then12, %if.end7, %if.then6, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then6 ], [ -16, %if.then12 ], [ 0, %if.end7 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup18

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %if.else11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_and_host_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 9
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_free, align 4, !tbaa !83
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #14
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.28, i32 0, i32 0)) #14
  tail call void @abort() #14
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -18
  ret i32 %spec.select

if.else11:                                        ; preds = %if.end
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %12 = load i8*, i8** %host, align 4, !tbaa !43
  %tobool12.not = icmp eq i8* %12, null
  br i1 %tobool12.not, label %if.end17, label %if.then13

if.then13:                                        ; preds = %if.else11
  tail call void @halide_free(i8* %user_context, i8* nonnull %12) #14
  store i8* null, i8** %host, align 4, !tbaa !43
  br label %if.end17

if.end17:                                         ; preds = %if.then13, %if.else11
  %flags3.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %13 = load i64, i64* %flags3.i.i, align 8, !tbaa !44
  %and.i.i = and i64 %13, -3
  store i64 %and.i.i, i64* %flags3.i.i, align 8, !tbaa !44
  br label %cleanup18

cleanup18:                                        ; preds = %if.end17, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end17 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %if.end, label %cleanup13

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i
  %dimensions.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 5
  %4 = load i32, i32* %dimensions.i.i, align 4, !tbaa !45
  %cmp16.i.i = icmp sgt i32 %4, 0
  br i1 %cmp16.i.i, label %for.body.lr.ph.i.i, label %if.end._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge

if.end._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge: ; preds = %if.end
  %sub.i.0 = sub nsw i32 1, 0
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.lr.ph.i.i:                               ; preds = %if.end
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 6
  %5 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8, !tbaa !46
  %6 = add i32 %4, -1
  %xtraiter = and i32 %4, 7
  %7 = icmp ult i32 %6, 7
  br i1 %7, label %for.body.i11.i.preheader.unr-lcssa, label %for.body.lr.ph.i.i.new

for.body.lr.ph.i.i.new:                           ; preds = %for.body.lr.ph.i.i
  %unroll_iter = and i32 %4, -8
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %if.end.i.i.7, %for.body.lr.ph.i.i.new
  %index.019.i.i = phi i32 [ 0, %for.body.lr.ph.i.i.new ], [ %index.1.i.i.7, %if.end.i.i.7 ]
  %i.017.i.i = phi i32 [ 0, %for.body.lr.ph.i.i.new ], [ %inc.i.i.7, %if.end.i.i.7 ]
  %niter = phi i32 [ %unroll_iter, %for.body.lr.ph.i.i.new ], [ %niter.nsub.7, %if.end.i.i.7 ]
  %stride2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.017.i.i, i32 2
  %8 = load i32, i32* %stride2.i.i, align 4, !tbaa !50
  %cmp3.i.i = icmp sgt i32 %8, 0
  br i1 %cmp3.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.017.i.i, i32 1
  %9 = load i32, i32* %extent.i.i, align 4, !tbaa !49
  %sub.i.i = add nsw i32 %9, -1
  %mul.i.i = mul nsw i32 %sub.i.i, %8
  %add.i.i = add nsw i32 %mul.i.i, %index.019.i.i
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i32 [ %add.i.i, %if.then.i.i ], [ %index.019.i.i, %for.body.i.i ]
  %inc.i.i = or i32 %i.017.i.i, 1
  %stride2.i.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i, i32 2
  %10 = load i32, i32* %stride2.i.i.1, align 4, !tbaa !50
  %cmp3.i.i.1 = icmp sgt i32 %10, 0
  br i1 %cmp3.i.i.1, label %if.then.i.i.1, label %if.end.i.i.1

for.body.i11.i.preheader.unr-lcssa:               ; preds = %if.end.i.i.7, %for.body.lr.ph.i.i
  %index.1.i.i.lcssa.ph = phi i32 [ undef, %for.body.lr.ph.i.i ], [ %index.1.i.i.7, %if.end.i.i.7 ]
  %index.019.i.i.unr = phi i32 [ 0, %for.body.lr.ph.i.i ], [ %index.1.i.i.7, %if.end.i.i.7 ]
  %i.017.i.i.unr = phi i32 [ 0, %for.body.lr.ph.i.i ], [ %inc.i.i.7, %if.end.i.i.7 ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.i11.i.preheader, label %for.body.i.i.epil

for.body.i.i.epil:                                ; preds = %for.body.i11.i.preheader.unr-lcssa, %if.end.i.i.epil
  %index.019.i.i.epil = phi i32 [ %index.1.i.i.epil, %if.end.i.i.epil ], [ %index.019.i.i.unr, %for.body.i11.i.preheader.unr-lcssa ]
  %i.017.i.i.epil = phi i32 [ %inc.i.i.epil, %if.end.i.i.epil ], [ %i.017.i.i.unr, %for.body.i11.i.preheader.unr-lcssa ]
  %epil.iter = phi i32 [ %epil.iter.sub, %if.end.i.i.epil ], [ %xtraiter, %for.body.i11.i.preheader.unr-lcssa ]
  %stride2.i.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.017.i.i.epil, i32 2
  %11 = load i32, i32* %stride2.i.i.epil, align 4, !tbaa !50
  %cmp3.i.i.epil = icmp sgt i32 %11, 0
  br i1 %cmp3.i.i.epil, label %if.then.i.i.epil, label %if.end.i.i.epil

if.then.i.i.epil:                                 ; preds = %for.body.i.i.epil
  %extent.i.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.017.i.i.epil, i32 1
  %12 = load i32, i32* %extent.i.i.epil, align 4, !tbaa !49
  %sub.i.i.epil = add nsw i32 %12, -1
  %mul.i.i.epil = mul nsw i32 %sub.i.i.epil, %11
  %add.i.i.epil = add nsw i32 %mul.i.i.epil, %index.019.i.i.epil
  br label %if.end.i.i.epil

if.end.i.i.epil:                                  ; preds = %if.then.i.i.epil, %for.body.i.i.epil
  %index.1.i.i.epil = phi i32 [ %add.i.i.epil, %if.then.i.i.epil ], [ %index.019.i.i.epil, %for.body.i.i.epil ]
  %inc.i.i.epil = add nuw nsw i32 %i.017.i.i.epil, 1
  %epil.iter.sub = add i32 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.body.i11.i.preheader, label %for.body.i.i.epil, !llvm.loop !84

for.body.i11.i.preheader:                         ; preds = %if.end.i.i.epil, %for.body.i11.i.preheader.unr-lcssa
  %index.1.i.i.lcssa = phi i32 [ %index.1.i.i.lcssa.ph, %for.body.i11.i.preheader.unr-lcssa ], [ %index.1.i.i.epil, %if.end.i.i.epil ]
  %13 = add i32 %4, -1
  %xtraiter5 = and i32 %4, 7
  %14 = icmp ult i32 %13, 7
  br i1 %14, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa, label %for.body.i11.i.preheader.new

for.body.i11.i.preheader.new:                     ; preds = %for.body.i11.i.preheader
  %unroll_iter9 = and i32 %4, -8
  br label %for.body.i11.i

for.body.i11.i:                                   ; preds = %if.end.i20.i.7, %for.body.i11.i.preheader.new
  %index.017.i.i = phi i32 [ 0, %for.body.i11.i.preheader.new ], [ %index.1.i17.i.7, %if.end.i20.i.7 ]
  %i.015.i.i = phi i32 [ 0, %for.body.i11.i.preheader.new ], [ %inc.i18.i.7, %if.end.i20.i.7 ]
  %niter10 = phi i32 [ %unroll_iter9, %for.body.i11.i.preheader.new ], [ %niter10.nsub.7, %if.end.i20.i.7 ]
  %stride2.i9.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.015.i.i, i32 2
  %15 = load i32, i32* %stride2.i9.i, align 4, !tbaa !50
  %cmp3.i10.i = icmp slt i32 %15, 0
  br i1 %cmp3.i10.i, label %if.then.i16.i, label %if.end.i20.i

if.then.i16.i:                                    ; preds = %for.body.i11.i
  %extent.i12.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.015.i.i, i32 1
  %16 = load i32, i32* %extent.i12.i, align 4, !tbaa !49
  %sub.i13.i = add nsw i32 %16, -1
  %mul.i14.i = mul nsw i32 %sub.i13.i, %15
  %add.i15.i = add nsw i32 %mul.i14.i, %index.017.i.i
  br label %if.end.i20.i

if.end.i20.i:                                     ; preds = %if.then.i16.i, %for.body.i11.i
  %index.1.i17.i = phi i32 [ %add.i15.i, %if.then.i16.i ], [ %index.017.i.i, %for.body.i11.i ]
  %inc.i18.i = or i32 %i.015.i.i, 1
  %stride2.i9.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i, i32 2
  %17 = load i32, i32* %stride2.i9.i.1, align 4, !tbaa !50
  %cmp3.i10.i.1 = icmp slt i32 %17, 0
  br i1 %cmp3.i10.i.1, label %if.then.i16.i.1, label %if.end.i20.i.1

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa: ; preds = %if.end.i20.i.7, %for.body.i11.i.preheader
  %index.1.i17.i.lcssa.ph = phi i32 [ undef, %for.body.i11.i.preheader ], [ %index.1.i17.i.7, %if.end.i20.i.7 ]
  %index.017.i.i.unr = phi i32 [ 0, %for.body.i11.i.preheader ], [ %index.1.i17.i.7, %if.end.i20.i.7 ]
  %i.015.i.i.unr = phi i32 [ 0, %for.body.i11.i.preheader ], [ %inc.i18.i.7, %if.end.i20.i.7 ]
  %lcmp.mod7.not = icmp eq i32 %xtraiter5, 0
  br i1 %lcmp.mod7.not, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i11.i.epil

for.body.i11.i.epil:                              ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa, %if.end.i20.i.epil
  %index.017.i.i.epil = phi i32 [ %index.1.i17.i.epil, %if.end.i20.i.epil ], [ %index.017.i.i.unr, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ]
  %i.015.i.i.epil = phi i32 [ %inc.i18.i.epil, %if.end.i20.i.epil ], [ %i.015.i.i.unr, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ]
  %epil.iter6 = phi i32 [ %epil.iter6.sub, %if.end.i20.i.epil ], [ %xtraiter5, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ]
  %stride2.i9.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.015.i.i.epil, i32 2
  %18 = load i32, i32* %stride2.i9.i.epil, align 4, !tbaa !50
  %cmp3.i10.i.epil = icmp slt i32 %18, 0
  br i1 %cmp3.i10.i.epil, label %if.then.i16.i.epil, label %if.end.i20.i.epil

if.then.i16.i.epil:                               ; preds = %for.body.i11.i.epil
  %extent.i12.i.epil = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %i.015.i.i.epil, i32 1
  %19 = load i32, i32* %extent.i12.i.epil, align 4, !tbaa !49
  %sub.i13.i.epil = add nsw i32 %19, -1
  %mul.i14.i.epil = mul nsw i32 %sub.i13.i.epil, %18
  %add.i15.i.epil = add nsw i32 %mul.i14.i.epil, %index.017.i.i.epil
  br label %if.end.i20.i.epil

if.end.i20.i.epil:                                ; preds = %if.then.i16.i.epil, %for.body.i11.i.epil
  %index.1.i17.i.epil = phi i32 [ %add.i15.i.epil, %if.then.i16.i.epil ], [ %index.017.i.i.epil, %for.body.i11.i.epil ]
  %inc.i18.i.epil = add nuw nsw i32 %i.015.i.i.epil, 1
  %epil.iter6.sub = add i32 %epil.iter6, -1
  %epil.iter6.cmp.not = icmp eq i32 %epil.iter6.sub, 0
  br i1 %epil.iter6.cmp.not, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i11.i.epil, !llvm.loop !85

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %if.end.i20.i.epil, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
  %index.1.i17.i.lcssa = phi i32 [ %index.1.i17.i.lcssa.ph, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa ], [ %index.1.i17.i.epil, %if.end.i20.i.epil ]
  %add6.i.i = add nsw i32 %index.1.i.i.lcssa, 1
  %sub.i.1 = sub nsw i32 %add6.i.i, %index.1.i17.i.lcssa
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %if.end._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
  %sub.i.phi = phi i32 [ %sub.i.0, %if.end._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge ], [ %sub.i.1, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %bits.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 4, i32 1
  %20 = load i8, i8* %bits.i.i, align 1, !tbaa !38
  %conv.i.i = zext i8 %20 to i32
  %add.i4.i = add nuw nsw i32 %conv.i.i, 7
  %div.i.i = lshr i32 %add.i4.i, 3
  %mul.i = mul i32 %div.i.i, %sub.i.phi
  %call2 = tail call i8* @halide_malloc(i8* %user_context, i32 %mul.i) #14
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  store i8* %call2, i8** %host, align 4, !tbaa !43
  %cmp4 = icmp eq i8* %call2, null
  br i1 %cmp4, label %cleanup13, label %if.end6

if.end6:                                          ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %call7 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* %device_interface) #15
  %cmp8.not = icmp eq i32 %call7, 0
  br i1 %cmp8.not, label %cleanup13, label %if.then9

if.then9:                                         ; preds = %if.end6
  %21 = load i8*, i8** %host, align 4, !tbaa !43
  tail call void @halide_free(i8* %user_context, i8* %21) #14
  store i8* null, i8** %host, align 4, !tbaa !43
  br label %cleanup13

cleanup13:                                        ; preds = %if.then9, %if.end6, %_ZNK15halide_buffer_t13size_in_bytesEv.exit, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -1, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ], [ %call7, %if.then9 ], [ 0, %if.end6 ]
  ret i32 %retval.1

if.then.i.i.1:                                    ; preds = %if.end.i.i
  %extent.i.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i, i32 1
  %22 = load i32, i32* %extent.i.i.1, align 4, !tbaa !49
  %sub.i.i.1 = add nsw i32 %22, -1
  %mul.i.i.1 = mul nsw i32 %sub.i.i.1, %10
  %add.i.i.1 = add nsw i32 %mul.i.i.1, %index.1.i.i
  br label %if.end.i.i.1

if.end.i.i.1:                                     ; preds = %if.then.i.i.1, %if.end.i.i
  %index.1.i.i.1 = phi i32 [ %add.i.i.1, %if.then.i.i.1 ], [ %index.1.i.i, %if.end.i.i ]
  %inc.i.i.1 = or i32 %i.017.i.i, 2
  %stride2.i.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.1, i32 2
  %23 = load i32, i32* %stride2.i.i.2, align 4, !tbaa !50
  %cmp3.i.i.2 = icmp sgt i32 %23, 0
  br i1 %cmp3.i.i.2, label %if.then.i.i.2, label %if.end.i.i.2

if.then.i.i.2:                                    ; preds = %if.end.i.i.1
  %extent.i.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.1, i32 1
  %24 = load i32, i32* %extent.i.i.2, align 4, !tbaa !49
  %sub.i.i.2 = add nsw i32 %24, -1
  %mul.i.i.2 = mul nsw i32 %sub.i.i.2, %23
  %add.i.i.2 = add nsw i32 %mul.i.i.2, %index.1.i.i.1
  br label %if.end.i.i.2

if.end.i.i.2:                                     ; preds = %if.then.i.i.2, %if.end.i.i.1
  %index.1.i.i.2 = phi i32 [ %add.i.i.2, %if.then.i.i.2 ], [ %index.1.i.i.1, %if.end.i.i.1 ]
  %inc.i.i.2 = or i32 %i.017.i.i, 3
  %stride2.i.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.2, i32 2
  %25 = load i32, i32* %stride2.i.i.3, align 4, !tbaa !50
  %cmp3.i.i.3 = icmp sgt i32 %25, 0
  br i1 %cmp3.i.i.3, label %if.then.i.i.3, label %if.end.i.i.3

if.then.i.i.3:                                    ; preds = %if.end.i.i.2
  %extent.i.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.2, i32 1
  %26 = load i32, i32* %extent.i.i.3, align 4, !tbaa !49
  %sub.i.i.3 = add nsw i32 %26, -1
  %mul.i.i.3 = mul nsw i32 %sub.i.i.3, %25
  %add.i.i.3 = add nsw i32 %mul.i.i.3, %index.1.i.i.2
  br label %if.end.i.i.3

if.end.i.i.3:                                     ; preds = %if.then.i.i.3, %if.end.i.i.2
  %index.1.i.i.3 = phi i32 [ %add.i.i.3, %if.then.i.i.3 ], [ %index.1.i.i.2, %if.end.i.i.2 ]
  %inc.i.i.3 = or i32 %i.017.i.i, 4
  %stride2.i.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.3, i32 2
  %27 = load i32, i32* %stride2.i.i.4, align 4, !tbaa !50
  %cmp3.i.i.4 = icmp sgt i32 %27, 0
  br i1 %cmp3.i.i.4, label %if.then.i.i.4, label %if.end.i.i.4

if.then.i.i.4:                                    ; preds = %if.end.i.i.3
  %extent.i.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.3, i32 1
  %28 = load i32, i32* %extent.i.i.4, align 4, !tbaa !49
  %sub.i.i.4 = add nsw i32 %28, -1
  %mul.i.i.4 = mul nsw i32 %sub.i.i.4, %27
  %add.i.i.4 = add nsw i32 %mul.i.i.4, %index.1.i.i.3
  br label %if.end.i.i.4

if.end.i.i.4:                                     ; preds = %if.then.i.i.4, %if.end.i.i.3
  %index.1.i.i.4 = phi i32 [ %add.i.i.4, %if.then.i.i.4 ], [ %index.1.i.i.3, %if.end.i.i.3 ]
  %inc.i.i.4 = or i32 %i.017.i.i, 5
  %stride2.i.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.4, i32 2
  %29 = load i32, i32* %stride2.i.i.5, align 4, !tbaa !50
  %cmp3.i.i.5 = icmp sgt i32 %29, 0
  br i1 %cmp3.i.i.5, label %if.then.i.i.5, label %if.end.i.i.5

if.then.i.i.5:                                    ; preds = %if.end.i.i.4
  %extent.i.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.4, i32 1
  %30 = load i32, i32* %extent.i.i.5, align 4, !tbaa !49
  %sub.i.i.5 = add nsw i32 %30, -1
  %mul.i.i.5 = mul nsw i32 %sub.i.i.5, %29
  %add.i.i.5 = add nsw i32 %mul.i.i.5, %index.1.i.i.4
  br label %if.end.i.i.5

if.end.i.i.5:                                     ; preds = %if.then.i.i.5, %if.end.i.i.4
  %index.1.i.i.5 = phi i32 [ %add.i.i.5, %if.then.i.i.5 ], [ %index.1.i.i.4, %if.end.i.i.4 ]
  %inc.i.i.5 = or i32 %i.017.i.i, 6
  %stride2.i.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.5, i32 2
  %31 = load i32, i32* %stride2.i.i.6, align 4, !tbaa !50
  %cmp3.i.i.6 = icmp sgt i32 %31, 0
  br i1 %cmp3.i.i.6, label %if.then.i.i.6, label %if.end.i.i.6

if.then.i.i.6:                                    ; preds = %if.end.i.i.5
  %extent.i.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.5, i32 1
  %32 = load i32, i32* %extent.i.i.6, align 4, !tbaa !49
  %sub.i.i.6 = add nsw i32 %32, -1
  %mul.i.i.6 = mul nsw i32 %sub.i.i.6, %31
  %add.i.i.6 = add nsw i32 %mul.i.i.6, %index.1.i.i.5
  br label %if.end.i.i.6

if.end.i.i.6:                                     ; preds = %if.then.i.i.6, %if.end.i.i.5
  %index.1.i.i.6 = phi i32 [ %add.i.i.6, %if.then.i.i.6 ], [ %index.1.i.i.5, %if.end.i.i.5 ]
  %inc.i.i.6 = or i32 %i.017.i.i, 7
  %stride2.i.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.6, i32 2
  %33 = load i32, i32* %stride2.i.i.7, align 4, !tbaa !50
  %cmp3.i.i.7 = icmp sgt i32 %33, 0
  br i1 %cmp3.i.i.7, label %if.then.i.i.7, label %if.end.i.i.7

if.then.i.i.7:                                    ; preds = %if.end.i.i.6
  %extent.i.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i.i.6, i32 1
  %34 = load i32, i32* %extent.i.i.7, align 4, !tbaa !49
  %sub.i.i.7 = add nsw i32 %34, -1
  %mul.i.i.7 = mul nsw i32 %sub.i.i.7, %33
  %add.i.i.7 = add nsw i32 %mul.i.i.7, %index.1.i.i.6
  br label %if.end.i.i.7

if.end.i.i.7:                                     ; preds = %if.then.i.i.7, %if.end.i.i.6
  %index.1.i.i.7 = phi i32 [ %add.i.i.7, %if.then.i.i.7 ], [ %index.1.i.i.6, %if.end.i.i.6 ]
  %inc.i.i.7 = add nuw nsw i32 %i.017.i.i, 8
  %niter.nsub.7 = add i32 %niter, -8
  %niter.ncmp.7 = icmp eq i32 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %for.body.i11.i.preheader.unr-lcssa, label %for.body.i.i, !llvm.loop !86

if.then.i16.i.1:                                  ; preds = %if.end.i20.i
  %extent.i12.i.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i, i32 1
  %35 = load i32, i32* %extent.i12.i.1, align 4, !tbaa !49
  %sub.i13.i.1 = add nsw i32 %35, -1
  %mul.i14.i.1 = mul nsw i32 %sub.i13.i.1, %17
  %add.i15.i.1 = add nsw i32 %mul.i14.i.1, %index.1.i17.i
  br label %if.end.i20.i.1

if.end.i20.i.1:                                   ; preds = %if.then.i16.i.1, %if.end.i20.i
  %index.1.i17.i.1 = phi i32 [ %add.i15.i.1, %if.then.i16.i.1 ], [ %index.1.i17.i, %if.end.i20.i ]
  %inc.i18.i.1 = or i32 %i.015.i.i, 2
  %stride2.i9.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.1, i32 2
  %36 = load i32, i32* %stride2.i9.i.2, align 4, !tbaa !50
  %cmp3.i10.i.2 = icmp slt i32 %36, 0
  br i1 %cmp3.i10.i.2, label %if.then.i16.i.2, label %if.end.i20.i.2

if.then.i16.i.2:                                  ; preds = %if.end.i20.i.1
  %extent.i12.i.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.1, i32 1
  %37 = load i32, i32* %extent.i12.i.2, align 4, !tbaa !49
  %sub.i13.i.2 = add nsw i32 %37, -1
  %mul.i14.i.2 = mul nsw i32 %sub.i13.i.2, %36
  %add.i15.i.2 = add nsw i32 %mul.i14.i.2, %index.1.i17.i.1
  br label %if.end.i20.i.2

if.end.i20.i.2:                                   ; preds = %if.then.i16.i.2, %if.end.i20.i.1
  %index.1.i17.i.2 = phi i32 [ %add.i15.i.2, %if.then.i16.i.2 ], [ %index.1.i17.i.1, %if.end.i20.i.1 ]
  %inc.i18.i.2 = or i32 %i.015.i.i, 3
  %stride2.i9.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.2, i32 2
  %38 = load i32, i32* %stride2.i9.i.3, align 4, !tbaa !50
  %cmp3.i10.i.3 = icmp slt i32 %38, 0
  br i1 %cmp3.i10.i.3, label %if.then.i16.i.3, label %if.end.i20.i.3

if.then.i16.i.3:                                  ; preds = %if.end.i20.i.2
  %extent.i12.i.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.2, i32 1
  %39 = load i32, i32* %extent.i12.i.3, align 4, !tbaa !49
  %sub.i13.i.3 = add nsw i32 %39, -1
  %mul.i14.i.3 = mul nsw i32 %sub.i13.i.3, %38
  %add.i15.i.3 = add nsw i32 %mul.i14.i.3, %index.1.i17.i.2
  br label %if.end.i20.i.3

if.end.i20.i.3:                                   ; preds = %if.then.i16.i.3, %if.end.i20.i.2
  %index.1.i17.i.3 = phi i32 [ %add.i15.i.3, %if.then.i16.i.3 ], [ %index.1.i17.i.2, %if.end.i20.i.2 ]
  %inc.i18.i.3 = or i32 %i.015.i.i, 4
  %stride2.i9.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.3, i32 2
  %40 = load i32, i32* %stride2.i9.i.4, align 4, !tbaa !50
  %cmp3.i10.i.4 = icmp slt i32 %40, 0
  br i1 %cmp3.i10.i.4, label %if.then.i16.i.4, label %if.end.i20.i.4

if.then.i16.i.4:                                  ; preds = %if.end.i20.i.3
  %extent.i12.i.4 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.3, i32 1
  %41 = load i32, i32* %extent.i12.i.4, align 4, !tbaa !49
  %sub.i13.i.4 = add nsw i32 %41, -1
  %mul.i14.i.4 = mul nsw i32 %sub.i13.i.4, %40
  %add.i15.i.4 = add nsw i32 %mul.i14.i.4, %index.1.i17.i.3
  br label %if.end.i20.i.4

if.end.i20.i.4:                                   ; preds = %if.then.i16.i.4, %if.end.i20.i.3
  %index.1.i17.i.4 = phi i32 [ %add.i15.i.4, %if.then.i16.i.4 ], [ %index.1.i17.i.3, %if.end.i20.i.3 ]
  %inc.i18.i.4 = or i32 %i.015.i.i, 5
  %stride2.i9.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.4, i32 2
  %42 = load i32, i32* %stride2.i9.i.5, align 4, !tbaa !50
  %cmp3.i10.i.5 = icmp slt i32 %42, 0
  br i1 %cmp3.i10.i.5, label %if.then.i16.i.5, label %if.end.i20.i.5

if.then.i16.i.5:                                  ; preds = %if.end.i20.i.4
  %extent.i12.i.5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.4, i32 1
  %43 = load i32, i32* %extent.i12.i.5, align 4, !tbaa !49
  %sub.i13.i.5 = add nsw i32 %43, -1
  %mul.i14.i.5 = mul nsw i32 %sub.i13.i.5, %42
  %add.i15.i.5 = add nsw i32 %mul.i14.i.5, %index.1.i17.i.4
  br label %if.end.i20.i.5

if.end.i20.i.5:                                   ; preds = %if.then.i16.i.5, %if.end.i20.i.4
  %index.1.i17.i.5 = phi i32 [ %add.i15.i.5, %if.then.i16.i.5 ], [ %index.1.i17.i.4, %if.end.i20.i.4 ]
  %inc.i18.i.5 = or i32 %i.015.i.i, 6
  %stride2.i9.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.5, i32 2
  %44 = load i32, i32* %stride2.i9.i.6, align 4, !tbaa !50
  %cmp3.i10.i.6 = icmp slt i32 %44, 0
  br i1 %cmp3.i10.i.6, label %if.then.i16.i.6, label %if.end.i20.i.6

if.then.i16.i.6:                                  ; preds = %if.end.i20.i.5
  %extent.i12.i.6 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.5, i32 1
  %45 = load i32, i32* %extent.i12.i.6, align 4, !tbaa !49
  %sub.i13.i.6 = add nsw i32 %45, -1
  %mul.i14.i.6 = mul nsw i32 %sub.i13.i.6, %44
  %add.i15.i.6 = add nsw i32 %mul.i14.i.6, %index.1.i17.i.5
  br label %if.end.i20.i.6

if.end.i20.i.6:                                   ; preds = %if.then.i16.i.6, %if.end.i20.i.5
  %index.1.i17.i.6 = phi i32 [ %add.i15.i.6, %if.then.i16.i.6 ], [ %index.1.i17.i.5, %if.end.i20.i.5 ]
  %inc.i18.i.6 = or i32 %i.015.i.i, 7
  %stride2.i9.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.6, i32 2
  %46 = load i32, i32* %stride2.i9.i.7, align 4, !tbaa !50
  %cmp3.i10.i.7 = icmp slt i32 %46, 0
  br i1 %cmp3.i10.i.7, label %if.then.i16.i.7, label %if.end.i20.i.7

if.then.i16.i.7:                                  ; preds = %if.end.i20.i.6
  %extent.i12.i.7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i32 %inc.i18.i.6, i32 1
  %47 = load i32, i32* %extent.i12.i.7, align 4, !tbaa !49
  %sub.i13.i.7 = add nsw i32 %47, -1
  %mul.i14.i.7 = mul nsw i32 %sub.i13.i.7, %46
  %add.i15.i.7 = add nsw i32 %mul.i14.i.7, %index.1.i17.i.6
  br label %if.end.i20.i.7

if.end.i20.i.7:                                   ; preds = %if.then.i16.i.7, %if.end.i20.i.6
  %index.1.i17.i.7 = phi i32 [ %add.i15.i.7, %if.then.i16.i.7 ], [ %index.1.i17.i.6, %if.end.i20.i.6 ]
  %inc.i18.i.7 = add nuw nsw i32 %i.015.i.i, 8
  %niter10.nsub.7 = add i32 %niter10, -8
  %niter10.ncmp.7 = icmp eq i32 %niter10.nsub.7, 0
  br i1 %niter10.ncmp.7, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa, label %for.body.i11.i, !llvm.loop !87
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  br label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) #15
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %if.end16.i.split
  %phi.call = phi i32 [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %4 = load i8*, i8** %host, align 4, !tbaa !43
  %tobool.not = icmp eq i8* %4, null
  br i1 %tobool.not, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @halide_free(i8* %user_context, i8* nonnull %4) #14
  store i8* null, i8** %host, align 4, !tbaa !43
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %flags3.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %5 = load i64, i64* %flags3.i.i, align 8, !tbaa !44
  %and.i.i18 = and i64 %5, -4
  store i64 %and.i.i18, i64* %flags3.i.i, align 8, !tbaa !44
  br label %cleanup

cleanup:                                          ; preds = %if.end5, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %phi.call, %if.end5 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_wrap_native(i8* %user_context, %struct.halide_buffer_t* %buf, i64 %handle, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp3.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = or i1 %cmp2.not, %cmp3.not
  br i1 %or.cond, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32, i32 0, i32 0)) #14
  br label %cleanup12

if.end5:                                          ; preds = %if.end
  %device_interface1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  store %struct.halide_device_interface_t* %device_interface, %struct.halide_device_interface_t** %device_interface1, align 8, !tbaa !42
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %wrap_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 14
  %8 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %wrap_native, align 4, !tbaa !88
  %call8 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, i64 %handle) #14
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #14
  %tobool.not = icmp eq i32 %call8, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -16
  ret i32 %spec.select

cleanup12:                                        ; preds = %if.then4, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -42, %if.then4 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_detach_native(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %cleanup, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %detach_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 15
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %detach_native, align 4, !tbaa !89
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #14
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.34, i32 0, i32 0)) #14
  tail call void @abort() #14
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -33
  ret i32 %spec.select

cleanup:                                          ; preds = %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_wrap_native(i8* %user_context, %struct.halide_buffer_t* %buf, i64 %handle) local_unnamed_addr #0 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %cmp.not = icmp eq i64 %0, 0
  br i1 %cmp.not, label %if.end, label %return

if.end:                                           ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 0
  %3 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %3() #14
  store i64 %handle, i64* %device, align 8, !tbaa !40
  br label %return

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ 0, %if.end ], [ -32, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_detach_native(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.35, i32 0, i32 0)) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !42
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !40
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #14
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %.pre = load i64, i64* %device.phi.trans.insert, align 8, !tbaa !40
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi i64 [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %1, %if.end16.i ]
  %cmp1 = icmp eq i64 %4, 0
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %5 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i32 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i32 0, i32 1
  %7 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %7() #14
  store i64 0, i64* %device, align 8, !tbaa !40
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  br label %cleanup

cleanup:                                          ; preds = %if.end3, %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ 0, %if.end3 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_and_host_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %0) #15
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_device_host_nop_free(i8* %user_context, i8* %obj) local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_default_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #2 {
entry:
  ret i32 -39
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  %c = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %tobool.not = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool.not, label %if.end13, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %tobool1.not = icmp eq %struct.halide_device_interface_t* %0, null
  %cmp.not = icmp eq %struct.halide_device_interface_t* %0, %dst_device_interface
  %or.cond = or i1 %tobool1.not, %cmp.not
  br i1 %or.cond, label %land.lhs.true5, label %if.then

if.then:                                          ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.41, i32 0, i32 0)) #14
  br label %cleanup143

land.lhs.true5:                                   ; preds = %land.lhs.true
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device, align 8, !tbaa !40
  %tobool6.not = icmp eq i64 %1, 0
  br i1 %tobool6.not, label %if.then7, label %if.end13

if.then7:                                         ; preds = %land.lhs.true5
  %call = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #15
  %tobool10.not = icmp eq i32 %call, 0
  br i1 %tobool10.not, label %if.end13, label %cleanup143

if.end13:                                         ; preds = %if.then7, %land.lhs.true5, %entry
  %device14 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %2 = load i64, i64* %device14, align 8, !tbaa !40
  %cmp15.not = icmp eq i64 %2, 0
  %host22.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 2
  %.pre = load i8*, i8** %host22.phi.trans.insert, align 4, !tbaa !43
  %cmp23.not = icmp eq i8* %.pre, null
  br i1 %cmp15.not, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.thread264

land.end.thread264:                               ; preds = %land.rhs
  %flags.i.i243 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %3 = load i64, i64* %flags.i.i243, align 8, !tbaa !44
  %and.i.i244 = and i64 %3, 1
  %cmp.i.i.not = icmp ne i64 %and.i.i244, 0
  br label %land.rhs26

land.end:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.land.rhs26_crit_edge

land.end.land.rhs26_crit_edge:                    ; preds = %land.end
  %flags.i.i247.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %.pre1 = load i64, i64* %flags.i.i247.phi.trans.insert, align 8, !tbaa !44
  br label %land.rhs26

land.rhs26:                                       ; preds = %land.end.land.rhs26_crit_edge, %land.end.thread264
  %4 = phi i64 [ %3, %land.end.thread264 ], [ %.pre1, %land.end.land.rhs26_crit_edge ]
  %5 = phi i1 [ %cmp.i.i.not, %land.end.thread264 ], [ true, %land.end.land.rhs26_crit_edge ]
  %and.i.i248 = and i64 %4, 2
  %cmp.i.i249.not = icmp eq i64 %and.i.i248, 0
  br i1 %cmp.i.i249.not, label %land.end32, label %lor.rhs28

lor.rhs28:                                        ; preds = %land.rhs26
  %device_interface29 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface29, align 8, !tbaa !42
  %cmp30 = icmp ne %struct.halide_device_interface_t* %6, null
  br label %land.end32

land.end32:                                       ; preds = %lor.rhs28, %land.rhs26, %land.end, %land.rhs
  %cmp23.not263 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ false, %lor.rhs28 ], [ true, %land.rhs ]
  %7 = phi i1 [ true, %land.end ], [ %5, %land.rhs26 ], [ %5, %lor.rhs28 ], [ false, %land.rhs ]
  %8 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ %cmp30, %lor.rhs28 ], [ true, %land.rhs ]
  %host34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 2
  %9 = load i8*, i8** %host34, align 4, !tbaa !43
  %cmp35.not = icmp eq i8* %9, null
  %cmp20.not = xor i1 %tobool.not, true
  %10 = and i1 %tobool.not, %cmp35.not
  br i1 %10, label %cleanup143, label %if.end41

if.end41:                                         ; preds = %land.end32
  %brmerge229 = or i1 %tobool.not, %7
  br i1 %brmerge229, label %if.then51, label %if.end49

if.end49:                                         ; preds = %if.end41
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %11 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %buffer_copy = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %11, i32 0, i32 10
  %12 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy, align 4, !tbaa !90
  %call48 = tail call i32 %12(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #14
  %cmp50 = icmp eq i32 %call48, -42
  br i1 %cmp50, label %if.then51, label %if.end117

if.then51:                                        ; preds = %if.end49, %if.end41
  %brmerge231.demorgan = and i1 %cmp23.not263, %cmp35.not
  br i1 %brmerge231.demorgan, label %cleanup143, label %if.end58

if.end58:                                         ; preds = %if.then51
  %brmerge234 = or i1 %8, %cmp20.not
  br i1 %brmerge234, label %if.else, label %if.end117.thread258

if.end117.thread258:                              ; preds = %if.end58
  %13 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %13) #11
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %c, %struct.halide_buffer_t* nonnull %src, i1 zeroext true, %struct.halide_buffer_t* nonnull %dst, i1 zeroext true) #15
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %c, i8* %user_context) #15
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %13) #11
  br label %land.lhs.true126

if.else:                                          ; preds = %if.end58
  %brmerge237 = or i1 %7, %cmp20.not
  br i1 %brmerge237, label %if.else81, label %if.then66

if.then66:                                        ; preds = %if.else
  %device_interface69 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %14 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface69, align 8, !tbaa !42
  %impl70 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %14, i32 0, i32 15
  %15 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl70, align 4, !tbaa !71
  %buffer_copy71 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %15, i32 0, i32 10
  %16 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy71, align 4, !tbaa !90
  %call72 = tail call i32 %16(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #14
  %cmp73 = icmp eq i32 %call72, -42
  br i1 %cmp73, label %if.then74, label %if.end117

if.then74:                                        ; preds = %if.then66
  %call75 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #15
  %tobool76.not = icmp eq i32 %call75, 0
  br i1 %tobool76.not, label %if.then77, label %cleanup143

if.then77:                                        ; preds = %if.then74
  %call78 = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #15
  br label %if.end117

if.else81:                                        ; preds = %if.else
  %brmerge239 = or i1 %7, %cmp35.not
  br i1 %brmerge239, label %if.else98, label %if.then85

if.then85:                                        ; preds = %if.else81
  %device_interface90 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %17 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface90, align 8, !tbaa !42
  %impl91 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %17, i32 0, i32 15
  %18 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl91, align 4, !tbaa !71
  %buffer_copy92 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %18, i32 0, i32 10
  %19 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy92, align 4, !tbaa !90
  %call93 = tail call i32 %19(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #14
  %cmp94 = icmp eq i32 %call93, 0
  br i1 %cmp94, label %if.then95, label %cleanup143

if.then95:                                        ; preds = %if.then85
  %flags.i.i245 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %20 = load i64, i64* %flags.i.i245, align 8, !tbaa !44
  %or.i.i246 = or i64 %20, 1
  store i64 %or.i.i246, i64* %flags.i.i245, align 8, !tbaa !44
  %call96 = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* %dst_device_interface) #15
  br label %if.end117

if.else98:                                        ; preds = %if.else81
  br i1 %tobool.not, label %cleanup143, label %if.then100

if.then100:                                       ; preds = %if.else98
  %call103 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #15
  %cmp104 = icmp eq i32 %call103, 0
  br i1 %cmp104, label %if.then105, label %cleanup143

if.then105:                                       ; preds = %if.then100
  %impl106 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %21 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl106, align 4, !tbaa !71
  %buffer_copy107 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %21, i32 0, i32 10
  %22 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy107, align 4, !tbaa !90
  %call108 = tail call i32 %22(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #14
  br label %if.end117

if.end117:                                        ; preds = %if.then105, %if.then95, %if.then77, %if.then66, %if.end49
  %err.1 = phi i32 [ %call78, %if.then77 ], [ %call72, %if.then66 ], [ %call96, %if.then95 ], [ %call108, %if.then105 ], [ %call48, %if.end49 ]
  %cond = icmp eq i32 %err.1, 0
  br i1 %cond, label %land.lhs.true126, label %cleanup143

land.lhs.true126:                                 ; preds = %if.end117, %if.end117.thread258
  %cmp127.not.old = icmp eq %struct.halide_buffer_t* %dst, %src
  br i1 %cmp127.not.old, label %cleanup143, label %if.then128

if.then128:                                       ; preds = %land.lhs.true126
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %23 = load i64, i64* %flags.i.i, align 8, !tbaa !44
  %or.i.i = and i64 %23, -4
  br i1 %tobool.not, label %if.else133, label %if.then130

if.then130:                                       ; preds = %if.then128
  %or.i.i242 = or i64 %or.i.i, 2
  store i64 %or.i.i242, i64* %flags.i.i, align 8, !tbaa !44
  br label %cleanup143

if.else133:                                       ; preds = %if.then128
  %and.i.i251 = or i64 %or.i.i, 1
  store i64 %and.i.i251, i64* %flags.i.i, align 8, !tbaa !44
  br label %cleanup143

cleanup143:                                       ; preds = %if.else133, %if.then130, %land.lhs.true126, %if.end117, %if.then100, %if.else98, %if.then85, %if.then74, %if.then51, %land.end32, %if.then7, %if.then
  %retval.1 = phi i32 [ -42, %if.then ], [ %call, %if.then7 ], [ -34, %land.end32 ], [ 0, %if.then130 ], [ 0, %if.else133 ], [ 0, %land.lhs.true126 ], [ -42, %if.then51 ], [ %err.1, %if.end117 ], [ -42, %if.else98 ], [ %call103, %if.then100 ], [ %call93, %if.then85 ], [ %call75, %if.then74 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  %tobool.not = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 0
  %1 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %1() #14
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %2 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %tobool11.not = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %tobool11.not, label %if.end16, label %if.then12

if.then12:                                        ; preds = %if.end
  %impl14 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i32 0, i32 15
  %3 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl14, align 4, !tbaa !71
  %use_module15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %3, i32 0, i32 0
  %4 = load void ()*, void ()** %use_module15, align 4, !tbaa !77
  tail call void %4() #14
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end
  %call = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) #15
  br i1 %tobool.not, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.end16
  %impl19 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl19, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 1
  %6 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %6() #14
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end16
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %tobool22.not = icmp eq %struct.halide_device_interface_t* %7, null
  br i1 %tobool22.not, label %if.end27, label %if.then23

if.then23:                                        ; preds = %if.end20
  %impl25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl25, align 4, !tbaa !71
  %release_module26 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 1
  %9 = load void ()*, void ()** %release_module26, align 4, !tbaa !79
  tail call void %9() #14
  br label %if.end27

if.end27:                                         ; preds = %if.then23, %if.end20
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #14
  ret i32 -40
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i32 0, i32 0)) #14
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !40
  %tobool2.not = icmp eq i64 %1, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #14
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !45
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !45
  %cmp.not = icmp eq i32 %2, %3
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i32 0, i32 0)) #14
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !71
  %device_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 11
  %9 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %device_crop, align 4, !tbaa !91
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_buffer_t* nonnull %dst) #14
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !40
  %tobool2.not = icmp eq i64 %1, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #14
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !45
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !45
  %add = add nsw i32 %3, 1
  %cmp.not = icmp eq i32 %2, %add
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i32 0, i32 0)) #14
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #14
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !71
  %device_slice = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 12
  %9 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %device_slice, align 4, !tbaa !92
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* nonnull %dst) #14
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %return, label %if.end

if.end:                                           ; preds = %entry
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #14
  br label %return

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ -40, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #4 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %return, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_release_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 13
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_release_crop, align 4, !tbaa !93
  %call = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  store i64 0, i64* %device, align 8, !tbaa !40
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i32 0, i32 1
  %5 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %5() #14
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #14
  br label %return

return:                                           ; preds = %if.then, %entry
  %retval.0 = phi i32 [ %call, %if.then ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind willreturn mustprogress
define weak float @halide_float16_bits_to_float(i16 zeroext %bits) local_unnamed_addr #2 {
entry:
  %conv = zext i16 %bits to i32
  %and2 = and i32 %conv, 1023
  %and4 = lshr i32 %conv, 10
  %0 = and i32 %and4, 31
  %cmp = icmp eq i32 %0, 0
  %cmp5 = icmp ne i32 %and2, 0
  %or.cond = and i1 %cmp5, %cmp
  br i1 %or.cond, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = tail call i32 @llvm.ctlz.i32(i32 %and2, i1 true), !range !94
  %sub6 = xor i32 %1, 31
  %shl7 = shl nuw i32 1, %sub6
  %neg = xor i32 %shl7, -1
  %and8 = and i32 %and2, %neg
  %sub9 = sub nsw i32 23, %sub6
  %shl10 = shl i32 %and8, %sub9
  %add11.neg = mul nsw i32 %1, -8388608
  %shl12 = add i32 %add11.neg, 1124073472
  br label %if.end28

if.else:                                          ; preds = %entry
  %shl14 = shl nuw nsw i32 %and2, 13
  br i1 %cmp, label %if.end28, label %if.else18

if.else18:                                        ; preds = %if.else
  %cmp19 = icmp eq i32 %0, 31
  br i1 %cmp19, label %if.end28, label %if.else21

if.else21:                                        ; preds = %if.else18
  %add22 = shl nuw nsw i32 %0, 23
  %phi.bo = add nuw nsw i32 %add22, 939524096
  br label %if.end28

if.end28:                                         ; preds = %if.else21, %if.else18, %if.else, %if.then
  %shl14.sink = phi i32 [ %shl12, %if.then ], [ %shl14, %if.else18 ], [ %shl14, %if.else ], [ %shl14, %if.else21 ]
  %reEncodedExponent15.0.sink = phi i32 [ %shl10, %if.then ], [ 2139095040, %if.else18 ], [ 0, %if.else ], [ %phi.bo, %if.else21 ]
  %bits.signext = sext i16 %bits to i32
  %shl = and i32 %bits.signext, -2147483648
  %or25 = or i32 %shl14.sink, %shl
  %or26 = or i32 %or25, %reEncodedExponent15.0.sink
  %result.sroa.0.0 = bitcast i32 %or26 to float
  ret float %result.sroa.0.0
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #8

; Function Attrs: nounwind willreturn mustprogress
define weak double @halide_float16_bits_to_double(i16 zeroext %bits) local_unnamed_addr #2 {
entry:
  %call = tail call float @halide_float16_bits_to_float(i16 zeroext %bits) #15
  %conv = fpext float %call to double
  ret double %conv
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #14
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.37, i32 0, i32 0)) #14
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i16 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.38, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.38, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #14
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.37, i32 0, i32 0)) #14
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i16 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %min_bound, i32 %max_bound, i32 %min_required, i32 %max_required) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i151 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.39, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i152 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.39, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i151, %entry.split ], [ %call.i152, %if.then6.i ]
  %ref.tmp.sroa.34.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.34.0, i8* %var_name) #14
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.40, i32 0, i32 0)) #14
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.34.0, i8* %func_name) #14
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.41, i32 0, i32 0)) #14
  %conv.i = sext i32 %min_bound to i64
  %call.i30 = tail call i8* @halide_int64_to_string(i8* %call.i27, i8* %ref.tmp.sroa.34.0, i64 %conv.i, i32 1) #14
  %call.i33 = tail call i8* @halide_string_to_string(i8* %call.i30, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #14
  %conv.i36 = sext i32 %max_bound to i64
  %call.i37 = tail call i8* @halide_int64_to_string(i8* %call.i33, i8* %ref.tmp.sroa.34.0, i64 %conv.i36, i32 1) #14
  %call.i40 = tail call i8* @halide_string_to_string(i8* %call.i37, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.43, i32 0, i32 0)) #14
  %conv.i43 = sext i32 %min_required to i64
  %call.i44 = tail call i8* @halide_int64_to_string(i8* %call.i40, i8* %ref.tmp.sroa.34.0, i64 %conv.i43, i32 1) #14
  %call.i47 = tail call i8* @halide_string_to_string(i8* %call.i44, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #14
  %conv.i50 = sext i32 %max_required to i64
  %call.i51 = tail call i8* @halide_int64_to_string(i8* %call.i47, i8* %ref.tmp.sroa.34.0, i64 %conv.i50, i32 1) #14
  %call.i54 = tail call i8* @halide_string_to_string(i8* %call.i51, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i54 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -2
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_type(i8* %user_context, i8* %func_name, i32 %type_given_bits, i32 %correct_type_bits) local_unnamed_addr #4 {
entry:
  %type_given_bits.addr = alloca i32, align 4
  %correct_type_bits.addr = alloca i32, align 4
  %correct_type = alloca %struct.halide_type_t, align 2
  %type_given = alloca %struct.halide_type_t, align 2
  store i32 %type_given_bits, i32* %type_given_bits.addr, align 4, !tbaa !14
  store i32 %correct_type_bits, i32* %correct_type_bits.addr, align 4, !tbaa !14
  %0 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #11
  store i8 0, i8* %0, align 2, !tbaa !34
  %bits.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 1
  store i8 0, i8* %bits.i, align 1, !tbaa !38
  %lanes.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i32 0, i32 2
  store i16 0, i16* %lanes.i, align 2, !tbaa !39
  %1 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #11
  store i8 0, i8* %1, align 2, !tbaa !34
  %bits.i8 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 1
  store i8 0, i8* %bits.i8, align 1, !tbaa !38
  %lanes.i9 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i32 0, i32 2
  store i16 0, i16* %lanes.i9, align 2, !tbaa !39
  %2 = bitcast i32* %correct_type_bits.addr to i8*
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %2, i32 4) #14
  %3 = bitcast i32* %type_given_bits.addr to i8*
  %call1 = call i8* @memcpy(i8* nonnull %1, i8* nonnull %3, i32 4) #14
  %call.i = call i8* @malloc(i32 1024) #14
  %tobool.not.i12 = icmp eq i8* %call.i, null
  br i1 %tobool.not.i12, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i151 = call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i152 = call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i151, %entry.split ], [ %call.i152, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i18 = call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.45, i32 0, i32 0)) #14
  %call.i21 = call i8* @halide_type_to_string(i8* %call.i18, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %correct_type) #14
  %call.i24 = call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.46, i32 0, i32 0)) #14
  %call.i27 = call i8* @halide_type_to_string(i8* %call.i24, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %type_given) #14
  br i1 %tobool.not.i12, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i27 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  call void @free(i8* %call.i) #14
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %user_context, i8* %func_name, i32 %dimensions_given, i32 %correct_dimensions) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.47, i32 0, i32 0)) #14
  %conv.i = sext i32 %correct_dimensions to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #14
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.48, i32 0, i32 0)) #14
  %conv.i20 = sext i32 %dimensions_given to i64
  %call.i21 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i64 %conv.i20, i32 1) #14
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.49, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i24 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %user_context, i8* %func_name, i32 %dimension, i32 %min_touched, i32 %max_touched, i32 %min_valid, i32 %max_valid) local_unnamed_addr #4 {
entry:
  %cmp = icmp slt i32 %min_touched, %min_valid
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i271 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i272 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then.split, %if.then6.i
  %phi.call = phi i8* [ %call.i271, %if.then.split ], [ %call.i272, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i30 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.50, i32 0, i32 0)) #14
  %conv.i = sext i32 %min_touched to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i30, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #14
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.51, i32 0, i32 0)) #14
  %conv.i39 = sext i32 %min_valid to i64
  %call.i40 = tail call i8* @halide_int64_to_string(i8* %call.i36, i8* %ref.tmp.sroa.22.0, i64 %conv.i39, i32 1) #14
  %call.i43 = tail call i8* @halide_string_to_string(i8* %call.i40, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.52, i32 0, i32 0)) #14
  %conv.i46 = sext i32 %dimension to i64
  %call.i47 = tail call i8* @halide_int64_to_string(i8* %call.i43, i8* %ref.tmp.sroa.22.0, i64 %conv.i46, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %if.end17.sink.split

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i47 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %if.end17.sink.split

if.else:                                          ; preds = %entry
  %cmp7 = icmp sgt i32 %max_touched, %max_valid
  br i1 %cmp7, label %if.then8, label %if.end17

if.then8:                                         ; preds = %if.else
  %call.i53 = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i56 = icmp eq i8* %call.i53, null
  br i1 %tobool.not.i56, label %if.then8.split, label %if.then6.i59

if.then8.split:                                   ; preds = %if.then8
  %call.i653 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

if.then6.i59:                                     ; preds = %if.then8
  %add.ptr.i57 = getelementptr inbounds i8, i8* %call.i53, i32 1023
  store i8 0, i8* %add.ptr.i57, align 1, !tbaa !22
  %call.i654 = tail call i8* @halide_string_to_string(i8* nonnull %call.i53, i8* nonnull %add.ptr.i57, i8* %func_name) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62: ; preds = %if.then8.split, %if.then6.i59
  %phi.call5 = phi i8* [ %call.i653, %if.then8.split ], [ %call.i654, %if.then6.i59 ]
  %ref.tmp9.sroa.22.0 = phi i8* [ null, %if.then8.split ], [ %add.ptr.i57, %if.then6.i59 ]
  %call.i68 = tail call i8* @halide_string_to_string(i8* %phi.call5, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.50, i32 0, i32 0)) #14
  %conv.i71 = sext i32 %max_touched to i64
  %call.i72 = tail call i8* @halide_int64_to_string(i8* %call.i68, i8* %ref.tmp9.sroa.22.0, i64 %conv.i71, i32 1) #14
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i72, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.53, i32 0, i32 0)) #14
  %conv.i78 = sext i32 %max_valid to i64
  %call.i79 = tail call i8* @halide_int64_to_string(i8* %call.i75, i8* %ref.tmp9.sroa.22.0, i64 %conv.i78, i32 1) #14
  %call.i82 = tail call i8* @halide_string_to_string(i8* %call.i79, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.52, i32 0, i32 0)) #14
  %conv.i85 = sext i32 %dimension to i64
  %call.i86 = tail call i8* @halide_int64_to_string(i8* %call.i82, i8* %ref.tmp9.sroa.22.0, i64 %conv.i85, i32 1) #14
  br i1 %tobool.not.i56, label %if.then.i90, label %if.else.i101

if.then.i90:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %if.end17.sink.split

if.else.i101:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
  %sub.ptr.lhs.cast.i.i95 = ptrtoint i8* %call.i86 to i32
  %sub.ptr.rhs.cast.i.i96 = ptrtoint i8* %call.i53 to i32
  %sub.ptr.sub.i.i97 = sub i32 1, %sub.ptr.rhs.cast.i.i96
  %add.i.i98 = add i32 %sub.ptr.sub.i.i97, %sub.ptr.lhs.cast.i.i95
  %conv.i.i99 = sext i32 %add.i.i98 to i64
  %call.i.i100 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i53, i64 %conv.i.i99) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i53) #14
  br label %if.end17.sink.split

if.end17.sink.split:                              ; preds = %if.else.i101, %if.then.i90, %if.else.i, %if.then.i
  %call.i53.sink = phi i8* [ %call.i, %if.else.i ], [ null, %if.then.i ], [ %call.i53, %if.else.i101 ], [ null, %if.then.i90 ]
  tail call void @free(i8* %call.i53.sink) #14
  br label %if.end17

if.end17:                                         ; preds = %if.end17.sink.split, %if.else
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %user_context, i8* %buffer_name, i64 %allocation_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.54, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.54, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %allocation_size, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.56, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.57, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.57, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %buffer_name) #14
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.58, i32 0, i32 0)) #14
  %conv.i = sext i32 %dimension to i64
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #14
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.59, i32 0, i32 0)) #14
  %conv.i24 = sext i32 %extent to i64
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i64 %conv.i24, i32 1) #14
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i28 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %user_context, i8* %buffer_name, i64 %actual_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.60, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.60, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %actual_size, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.56, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %constrained_min, i32 %constrained_extent, i32 %required_min, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %add = add i32 %required_min, -1
  %sub = add i32 %add, %required_extent
  %add1 = add i32 %constrained_min, -1
  %sub2 = add i32 %add1, %constrained_extent
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i231 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.61, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i232 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.61, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i231, %entry.split ], [ %call.i232, %if.then6.i ]
  %ref.tmp.sroa.38.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i26 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.38.0, i8* %buffer_name) #14
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.62, i32 0, i32 0)) #14
  %conv.i = sext i32 %dimension to i64
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.38.0, i64 %conv.i, i32 1) #14
  %call.i35 = tail call i8* @halide_string_to_string(i8* %call.i32, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.63, i32 0, i32 0)) #14
  %call.i38 = tail call i8* @halide_string_to_string(i8* %call.i35, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.64, i32 0, i32 0)) #14
  %conv.i41 = sext i32 %required_min to i64
  %call.i42 = tail call i8* @halide_int64_to_string(i8* %call.i38, i8* %ref.tmp.sroa.38.0, i64 %conv.i41, i32 1) #14
  %call.i45 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #14
  %conv.i48 = sext i32 %sub to i64
  %call.i49 = tail call i8* @halide_int64_to_string(i8* %call.i45, i8* %ref.tmp.sroa.38.0, i64 %conv.i48, i32 1) #14
  %call.i52 = tail call i8* @halide_string_to_string(i8* %call.i49, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.63, i32 0, i32 0)) #14
  %call.i55 = tail call i8* @halide_string_to_string(i8* %call.i52, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.65, i32 0, i32 0)) #14
  %conv.i58 = sext i32 %constrained_min to i64
  %call.i59 = tail call i8* @halide_int64_to_string(i8* %call.i55, i8* %ref.tmp.sroa.38.0, i64 %conv.i58, i32 1) #14
  %call.i62 = tail call i8* @halide_string_to_string(i8* %call.i59, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #14
  %conv.i65 = sext i32 %sub2 to i64
  %call.i66 = tail call i8* @halide_int64_to_string(i8* %call.i62, i8* %ref.tmp.sroa.38.0, i64 %conv.i65, i32 1) #14
  %call.i69 = tail call i8* @halide_string_to_string(i8* %call.i66, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i69 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %user_context, i8* %var, i32 %val, i8* %constrained_var, i32 %constrained_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.67, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.67, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i8* %var) #14
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #14
  %conv.i = sext i32 %val to i64
  %call.i20 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #14
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.69, i32 0, i32 0)) #14
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %constrained_var) #14
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #14
  %conv.i32 = sext i32 %constrained_val to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #14
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i36 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %user_context, i8* %param_name, double %val, double %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %min_val, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %user_context, i8* %param_name, double %val, double %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #14
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %max_val, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -10
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_error_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.37, i32 0, i32 0)) #14
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %user_context, i8* %buffer_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %buffer_name) #14
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %user_context, i8* %func, i8* %filename, i32 %error_code) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %func) #14
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41.73, i32 0, i32 0)) #14
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* %filename) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42, i32 0, i32 0)) #14
  %conv.i = sext i32 %error_code to i64
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %user_context, i8* %func, i32 %alignment) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* %func) #14
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i32 0, i32 0)) #14
  %conv.i = sext i32 %alignment to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.18.0, i64 %conv.i, i32 1) #14
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.45, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i19 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_dirty_with_no_device_support(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %func) #14
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.47, i32 0, i32 0)) #14
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.48, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i15 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -44
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %func) #14
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %user_context, i8* %func_name, i8* %var_name, i8* %loop_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %var_name) #14
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #14
  %call.i18 = tail call i8* @halide_string_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i8* %func_name) #14
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i32 0, i32 0)) #14
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i8* %loop_name) #14
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i27 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -25
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_extern_fold(i8* %user_context, i8* %func_name, i32 %dim, i32 %min, i32 %extent, i32 %valid_min, i32 %fold_factor) local_unnamed_addr #4 {
entry:
  %cmp = icmp slt i32 %min, %valid_min
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %add = add nsw i32 %extent, %min
  %add1 = add nsw i32 %fold_factor, %valid_min
  %cmp2 = icmp sgt i32 %add, %add1
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i521 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i522 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then.split, %if.then6.i
  %phi.call = phi i8* [ %call.i521, %if.then.split ], [ %call.i522, %if.then6.i ]
  %ref.tmp.sroa.36.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %dim to i64
  %call.i55 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.36.0, i64 %conv.i, i32 1) #14
  %call.i58 = tail call i8* @halide_string_to_string(i8* %call.i55, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #14
  %call.i61 = tail call i8* @halide_string_to_string(i8* %call.i58, i8* %ref.tmp.sroa.36.0, i8* %func_name) #14
  %call.i64 = tail call i8* @halide_string_to_string(i8* %call.i61, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #14
  %conv.i67 = sext i32 %min to i64
  %call.i68 = tail call i8* @halide_int64_to_string(i8* %call.i64, i8* %ref.tmp.sroa.36.0, i64 %conv.i67, i32 1) #14
  %call.i71 = tail call i8* @halide_string_to_string(i8* %call.i68, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %add9 = add nsw i32 %extent, %min
  %sub = add nsw i32 %add9, -1
  %conv.i74 = sext i32 %sub to i64
  %call.i75 = tail call i8* @halide_int64_to_string(i8* %call.i71, i8* %ref.tmp.sroa.36.0, i64 %conv.i74, i32 1) #14
  %call.i78 = tail call i8* @halide_string_to_string(i8* %call.i75, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #14
  %call.i81 = tail call i8* @halide_string_to_string(i8* %call.i78, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57, i32 0, i32 0)) #14
  %conv.i84 = sext i32 %valid_min to i64
  %call.i85 = tail call i8* @halide_int64_to_string(i8* %call.i81, i8* %ref.tmp.sroa.36.0, i64 %conv.i84, i32 1) #14
  %call.i88 = tail call i8* @halide_string_to_string(i8* %call.i85, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %add15 = add nsw i32 %fold_factor, %valid_min
  %sub16 = add nsw i32 %add15, -1
  %conv.i91 = sext i32 %sub16 to i64
  %call.i92 = tail call i8* @halide_int64_to_string(i8* %call.i88, i8* %ref.tmp.sroa.36.0, i64 %conv.i91, i32 1) #14
  %call.i95 = tail call i8* @halide_string_to_string(i8* %call.i92, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.74, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %if.end

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i95 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %call.i101 = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i104 = icmp eq i8* %call.i101, null
  br i1 %tobool.not.i104, label %if.else.split, label %if.then6.i107

if.else.split:                                    ; preds = %if.else
  %call.i1133 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

if.then6.i107:                                    ; preds = %if.else
  %add.ptr.i105 = getelementptr inbounds i8, i8* %call.i101, i32 1023
  store i8 0, i8* %add.ptr.i105, align 1, !tbaa !22
  %call.i1134 = tail call i8* @halide_string_to_string(i8* nonnull %call.i101, i8* nonnull %add.ptr.i105, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110: ; preds = %if.else.split, %if.then6.i107
  %phi.call5 = phi i8* [ %call.i1133, %if.else.split ], [ %call.i1134, %if.then6.i107 ]
  %ref.tmp19.sroa.34.0 = phi i8* [ null, %if.else.split ], [ %add.ptr.i105, %if.then6.i107 ]
  %conv.i116 = sext i32 %dim to i64
  %call.i117 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %ref.tmp19.sroa.34.0, i64 %conv.i116, i32 1) #14
  %call.i120 = tail call i8* @halide_string_to_string(i8* %call.i117, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #14
  %call.i123 = tail call i8* @halide_string_to_string(i8* %call.i120, i8* %ref.tmp19.sroa.34.0, i8* %func_name) #14
  %call.i126 = tail call i8* @halide_string_to_string(i8* %call.i123, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #14
  %conv.i129 = sext i32 %min to i64
  %call.i130 = tail call i8* @halide_int64_to_string(i8* %call.i126, i8* %ref.tmp19.sroa.34.0, i64 %conv.i129, i32 1) #14
  %call.i133 = tail call i8* @halide_string_to_string(i8* %call.i130, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %sub28 = add nsw i32 %add, -1
  %conv.i136 = sext i32 %sub28 to i64
  %call.i137 = tail call i8* @halide_int64_to_string(i8* %call.i133, i8* %ref.tmp19.sroa.34.0, i64 %conv.i136, i32 1) #14
  %call.i140 = tail call i8* @halide_string_to_string(i8* %call.i137, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #14
  %call.i143 = tail call i8* @halide_string_to_string(i8* %call.i140, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.75, i32 0, i32 0)) #14
  %call.i146 = tail call i8* @halide_string_to_string(i8* %call.i143, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.76, i32 0, i32 0)) #14
  %conv.i149 = sext i32 %fold_factor to i64
  %call.i150 = tail call i8* @halide_int64_to_string(i8* %call.i146, i8* %ref.tmp19.sroa.34.0, i64 %conv.i149, i32 1) #14
  %call.i153 = tail call i8* @halide_string_to_string(i8* %call.i150, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #14
  br i1 %tobool.not.i104, label %if.then.i157, label %if.else.i168

if.then.i157:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %if.end

if.else.i168:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
  %sub.ptr.lhs.cast.i.i162 = ptrtoint i8* %call.i153 to i32
  %sub.ptr.rhs.cast.i.i163 = ptrtoint i8* %call.i101 to i32
  %sub.ptr.sub.i.i164 = sub i32 1, %sub.ptr.rhs.cast.i.i163
  %add.i.i165 = add i32 %sub.ptr.sub.i.i164, %sub.ptr.lhs.cast.i.i162
  %conv.i.i166 = sext i32 %add.i.i165 to i64
  %call.i.i167 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i101, i64 %conv.i.i166) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i101) #14
  br label %if.end

if.end:                                           ; preds = %if.else.i168, %if.then.i157, %if.else.i, %if.then.i
  %call.i101.sink = phi i8* [ %call.i, %if.else.i ], [ null, %if.then.i ], [ %call.i101, %if.else.i168 ], [ null, %if.then.i157 ]
  tail call void @free(i8* %call.i101.sink) #14
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %fold_factor, i8* %loop_name, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i131 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.77, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i132 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.77, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i131, %entry.split ], [ %call.i132, %if.then6.i ]
  %ref.tmp.sroa.30.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %fold_factor to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.30.0, i64 %conv.i, i32 1) #14
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i32 0, i32 0)) #14
  %call.i22 = tail call i8* @halide_string_to_string(i8* %call.i19, i8* %ref.tmp.sroa.30.0, i8* %var_name) #14
  %call.i25 = tail call i8* @halide_string_to_string(i8* %call.i22, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #14
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.30.0, i8* %func_name) #14
  %call.i31 = tail call i8* @halide_string_to_string(i8* %call.i28, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i32 0, i32 0)) #14
  %call.i34 = tail call i8* @halide_string_to_string(i8* %call.i31, i8* %ref.tmp.sroa.30.0, i8* %loop_name) #14
  %call.i37 = tail call i8* @halide_string_to_string(i8* %call.i34, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #14
  %conv.i40 = sext i32 %required_extent to i64
  %call.i41 = tail call i8* @halide_int64_to_string(i8* %call.i37, i8* %ref.tmp.sroa.30.0, i64 %conv.i40, i32 1) #14
  %call.i44 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.78, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i44 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %user_context, i8* %condition, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %condition) #14
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0)) #14
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* %message) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i15 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %user_context, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i41 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #14
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* null, i8* %message) #14
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i42 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #14
  %call.i7 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* nonnull %add.ptr.i, i8* %message) #14
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i7 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #14
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #14
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #14
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #14
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #14
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #14
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %user_context, i8* %routine) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %routine) #14
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -38
}

; Function Attrs: nounwind
define weak i32 @halide_error_storage_bound_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %provided_size, i32 %required_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %provided_size to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #14
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i32 0, i32 0)) #14
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i8* %var_name) #14
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #14
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %func_name) #14
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.74, i32 0, i32 0)) #14
  %conv.i32 = sext i32 %required_size to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #14
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.78, i32 0, i32 0)) #14
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i36 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -45
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_crop_failed(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i32 0, i32 0)) #14
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i32 0, i32 0)) #14
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #14
  ret i32 -41
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* %ptr, i64 %len) local_unnamed_addr #2 {
entry:
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_check_memory_is_initialized(i8* %user_context, i8* %ptr, i64 %len, i8* %name) local_unnamed_addr #2 {
entry:
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_check_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* %b, i8* %buf_name) local_unnamed_addr #2 {
entry:
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* %b) local_unnamed_addr #2 {
entry:
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_msan_annotate_buffer_is_initialized_as_destructor(i8* %user_context, i8* %b) local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_lock(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call = tail call i32 @qurt_hvx_lock(i32 1) #14
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i17 = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i19 = icmp eq i8* %call.i17, null
  br i1 %tobool.not.i19, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call.i30 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.91, i32 0, i32 0)) #14
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i17, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i17, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.91, i32 0, i32 0)) #14
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i17 to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i17, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i17) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i17) #14
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_lock(i32) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_unlock(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call = tail call i32 @qurt_hvx_unlock() #14
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i13 = tail call i8* @malloc(i32 1024) #14
  %tobool.not.i15 = icmp eq i8* %call.i13, null
  br i1 %tobool.not.i15, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call.i26 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.93, i32 0, i32 0)) #14
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i13, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i13, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.93, i32 0, i32 0)) #14
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i13 to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i13, i64 %conv.i.i) #14
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i13) #14
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i13) #14
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_unlock() local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_qurt_hvx_unlock_as_destructor(i8* %user_context, i8* %0) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @halide_qurt_hvx_unlock(i8* %user_context) #15
  ret void
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32>, <32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind mustprogress
define weak i8* @halide_vtcm_malloc(i8* %user_context, i32 %size) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @HAP_request_VTCM(i32 %size, i32 1) #14
  ret i8* %call
}

declare i8* @HAP_request_VTCM(i32, i32) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_vtcm_free(i8* %user_context, i8* %addr) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @HAP_release_VTCM(i8* %addr) #14
  ret void
}

declare i32 @HAP_release_VTCM(i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_default_can_use_target_features(i32 %count, i64* %features) #4 {
entry:
  %tmp = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #14
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18, !range !21
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #11
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %tmp) #14
  %call = call i8* @memcpy(i8* bitcast ([4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE to i8*), i8* nonnull %1, i32 32) #14
  store i8 1, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #14
  %cmp.not = icmp eq i32 %count, 2
  br i1 %cmp.not, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.94, i32 0, i32 0)) #14
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %2 = load i64, i64* %features, align 8, !tbaa !26
  %3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 0), align 8, !tbaa !26
  %and = and i64 %3, %2
  %cmp5.not = icmp eq i64 %and, 0
  br i1 %cmp5.not, label %for.inc.critedge, label %if.then6

if.then6:                                         ; preds = %if.end2
  %4 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 2), align 8, !tbaa !26
  %and8 = and i64 %4, %and
  %cmp9.not = icmp eq i64 %and8, %and
  br i1 %cmp9.not, label %for.inc.critedge, label %cleanup13

for.inc.critedge:                                 ; preds = %if.then6, %if.end2
  %arrayidx.1 = getelementptr inbounds i64, i64* %features, i32 1
  %5 = load i64, i64* %arrayidx.1, align 8, !tbaa !26
  %6 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 1), align 8, !tbaa !26
  %and.1 = and i64 %6, %5
  %cmp5.not.1 = icmp eq i64 %and.1, 0
  br i1 %cmp5.not.1, label %for.inc.critedge.1, label %if.then6.1

cleanup13:                                        ; preds = %for.inc.critedge.1, %if.then6.1, %if.then6
  %cmp3.lcssa = phi i32 [ 0, %if.then6 ], [ 0, %if.then6.1 ], [ 1, %for.inc.critedge.1 ]
  ret i32 %cmp3.lcssa

if.then6.1:                                       ; preds = %for.inc.critedge
  %7 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i32 0, i32 3), align 8, !tbaa !26
  %and8.1 = and i64 %7, %and.1
  %cmp9.not.1 = icmp eq i64 %and8.1, %and.1
  br i1 %cmp9.not.1, label %for.inc.critedge.1, label %cleanup13

for.inc.critedge.1:                               ; preds = %if.then6.1, %for.inc.critedge
  br label %cleanup13
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i32, i64*)* @halide_set_custom_can_use_target_features(i32 (i32, i64*)* %fn) local_unnamed_addr #2 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 4, !tbaa !10
  store i32 (i32, i64*)* %fn, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 4, !tbaa !10
  ret i32 (i32, i64*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_can_use_target_features(i32 %count, i64* %features) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 4, !tbaa !10
  %call = tail call i32 %0(i32 %count, i64* %features) #14
  ret i32 %call
}

; Function Attrs: nounwind willreturn
define linkonce void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* noalias sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %agg.result) local_unnamed_addr #7 {
entry:
  %arrayidx.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 0, i32 0
  store i64 0, i64* %arrayidx.i, align 8, !tbaa !26
  %arrayidx2.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 1, i32 0
  store i64 0, i64* %arrayidx2.i, align 8, !tbaa !26
  %arrayidx.1.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 0, i32 1
  store i64 0, i64* %arrayidx.1.i, align 8, !tbaa !26
  %arrayidx2.1.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i32 0, i32 1, i32 1
  store i64 0, i64* %arrayidx2.1.i, align 8, !tbaa !26
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_use_jit_module() local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_release_jit_module() local_unnamed_addr #2 {
entry:
  ret void
}

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vsh.128B(<32 x i32>) #9

; Function Attrs: nounwind
define i32 @matmul_bias_relu_matmul_hvx128(%struct.halide_buffer_t* noalias nocapture readonly %A.buffer, %struct.halide_buffer_t* noalias nocapture readonly %B.buffer, %struct.halide_buffer_t* noalias nocapture readonly %C.buffer, %struct.halide_buffer_t* noalias nocapture readonly %bias.buffer, %struct.halide_buffer_t* noalias nocapture readonly %output.buffer) local_unnamed_addr #10 {
entry:
  %matrix_mul14 = alloca [1024 x i32], align 128
  %hvx_lock_result = tail call i32 @halide_qurt_hvx_lock(i8* null) #11
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 2
  %0 = bitcast i8** %host.i to i16**
  %1 = load i16*, i16** %0, align 4, !tbaa !43
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i32 0, i32 6
  %2 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !46
  %stride.i13 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i32 1, i32 2
  %3 = load i32, i32* %stride.i13, align 4, !tbaa !50
  %stride.i17 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i32 2, i32 2
  %4 = load i32, i32* %stride.i17, align 4, !tbaa !50
  %host.i18 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 2
  %5 = bitcast i8** %host.i18 to i16**
  %6 = load i16*, i16** %5, align 4, !tbaa !43
  %dim.i19 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i32 0, i32 6
  %7 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i19, align 8, !tbaa !46
  %min.i20 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 0, i32 0
  %8 = load i32, i32* %min.i20, align 4, !tbaa !47
  %min.i24 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 1, i32 0
  %9 = load i32, i32* %min.i24, align 4, !tbaa !47
  %stride.i26 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 1, i32 2
  %10 = load i32, i32* %stride.i26, align 4, !tbaa !50
  %min.i28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 2, i32 0
  %11 = load i32, i32* %min.i28, align 4, !tbaa !47
  %stride.i30 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i32 2, i32 2
  %12 = load i32, i32* %stride.i30, align 4, !tbaa !50
  %host.i31 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %C.buffer, i32 0, i32 2
  %13 = bitcast i8** %host.i31 to i16**
  %14 = load i16*, i16** %13, align 4, !tbaa !43
  %dim.i32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %C.buffer, i32 0, i32 6
  %15 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i32, align 8, !tbaa !46
  %stride.i39 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %15, i32 1, i32 2
  %16 = load i32, i32* %stride.i39, align 4, !tbaa !50
  %stride.i43 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %15, i32 2, i32 2
  %17 = load i32, i32* %stride.i43, align 4, !tbaa !50
  %host.i44 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %bias.buffer, i32 0, i32 2
  %18 = bitcast i8** %host.i44 to i32**
  %19 = load i32*, i32** %18, align 4, !tbaa !43
  %host.i49 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 2
  %20 = bitcast i8** %host.i49 to i32**
  %21 = load i32*, i32** %20, align 4, !tbaa !43
  %dim.i50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 6
  %22 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i50, align 8, !tbaa !46
  %min.i51 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 0, i32 0
  %23 = load i32, i32* %min.i51, align 4, !tbaa !47
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 0, i32 1
  %24 = load i32, i32* %extent.i, align 4, !tbaa !49
  %min.i56 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 1, i32 0
  %25 = load i32, i32* %min.i56, align 4, !tbaa !47
  %extent.i58 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 1, i32 1
  %26 = load i32, i32* %extent.i58, align 4, !tbaa !49
  %stride.i60 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 1, i32 2
  %27 = load i32, i32* %stride.i60, align 4, !tbaa !50
  %min.i62 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 2, i32 0
  %28 = load i32, i32* %min.i62, align 4, !tbaa !47
  %extent.i64 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 2, i32 1
  %29 = load i32, i32* %extent.i64, align 4, !tbaa !49
  %stride.i66 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i32 2, i32 2
  %30 = load i32, i32* %stride.i66, align 4, !tbaa !50
  %31 = mul nsw i32 %10, 192
  %32 = mul i32 %11, %12
  %33 = mul i32 %9, %10
  %34 = shl nsw i32 %10, 7
  %35 = shl nsw i32 %10, 6
  %36 = icmp sgt i32 %24, 0
  br i1 %36, label %"for output.s0.c.rebased.preheader", label %call_destructor.exit, !prof !95

"for output.s0.c.rebased.preheader":              ; preds = %entry
  %dim.i45 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %bias.buffer, i32 0, i32 6
  %37 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i45, align 8, !tbaa !46
  %min.i46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %37, i32 0, i32 0
  %38 = load i32, i32* %min.i46, align 4, !tbaa !47
  %min.i41 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %15, i32 2, i32 0
  %39 = load i32, i32* %min.i41, align 4, !tbaa !47
  %min.i37 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %15, i32 1, i32 0
  %40 = load i32, i32* %min.i37, align 4, !tbaa !47
  %min.i33 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %15, i32 0, i32 0
  %41 = load i32, i32* %min.i33, align 4, !tbaa !47
  %min.i15 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i32 2, i32 0
  %42 = load i32, i32* %min.i15, align 4, !tbaa !47
  %min.i11 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i32 1, i32 0
  %43 = load i32, i32* %min.i11, align 4, !tbaa !47
  %min.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %2, i32 0, i32 0
  %44 = load i32, i32* %min.i, align 4, !tbaa !47
  %45 = add nsw i32 %29, 3
  %46 = ashr i32 %45, 2
  %47 = icmp sgt i32 %29, 0
  %b2 = add nsw i32 %29, -4
  %.neg98 = mul i32 %27, %25
  %.neg99 = mul i32 %30, %28
  %reass.add104 = add i32 %.neg99, %.neg98
  %.neg101 = mul i32 %4, %42
  %.neg102 = mul i32 %3, %43
  %reass.add = add i32 %.neg101, %.neg102
  %48 = add i32 %reass.add, %44
  %49 = sub i32 %23, %48
  %50 = add nsw i32 %26, 63
  %51 = ashr i32 %50, 6
  %b10 = add nsw i32 %26, -64
  %52 = bitcast [1024 x i32]* %matrix_mul14 to <32 x i32>*
  %53 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 32
  %54 = bitcast i32* %53 to <32 x i32>*
  %55 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 64
  %56 = bitcast i32* %55 to <32 x i32>*
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 96
  %58 = bitcast i32* %57 to <32 x i32>*
  %59 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 128
  %60 = bitcast i32* %59 to <32 x i32>*
  %61 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 160
  %62 = bitcast i32* %61 to <32 x i32>*
  %63 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 192
  %64 = bitcast i32* %63 to <32 x i32>*
  %65 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 224
  %66 = bitcast i32* %65 to <32 x i32>*
  %67 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 256
  %68 = bitcast i32* %67 to <32 x i32>*
  %69 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 288
  %70 = bitcast i32* %69 to <32 x i32>*
  %71 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 320
  %72 = bitcast i32* %71 to <32 x i32>*
  %73 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 352
  %74 = bitcast i32* %73 to <32 x i32>*
  %75 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 384
  %76 = bitcast i32* %75 to <32 x i32>*
  %77 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 416
  %78 = bitcast i32* %77 to <32 x i32>*
  %79 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 448
  %80 = bitcast i32* %79 to <32 x i32>*
  %81 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 480
  %82 = bitcast i32* %81 to <32 x i32>*
  %83 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 512
  %84 = bitcast i32* %83 to <32 x i32>*
  %85 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 544
  %86 = bitcast i32* %85 to <32 x i32>*
  %87 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 576
  %88 = bitcast i32* %87 to <32 x i32>*
  %89 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 608
  %90 = bitcast i32* %89 to <32 x i32>*
  %91 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 640
  %92 = bitcast i32* %91 to <32 x i32>*
  %93 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 672
  %94 = bitcast i32* %93 to <32 x i32>*
  %95 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 704
  %96 = bitcast i32* %95 to <32 x i32>*
  %97 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 736
  %98 = bitcast i32* %97 to <32 x i32>*
  %99 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 768
  %100 = bitcast i32* %99 to <32 x i32>*
  %101 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 800
  %102 = bitcast i32* %101 to <32 x i32>*
  %103 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 832
  %104 = bitcast i32* %103 to <32 x i32>*
  %105 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 864
  %106 = bitcast i32* %105 to <32 x i32>*
  %107 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 896
  %108 = bitcast i32* %107 to <32 x i32>*
  %109 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 928
  %110 = bitcast i32* %109 to <32 x i32>*
  %111 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 960
  %112 = bitcast i32* %111 to <32 x i32>*
  %113 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 992
  %114 = bitcast i32* %113 to <32 x i32>*
  %115 = insertelement <64 x i32> undef, i32 %10, i32 0
  %116 = shufflevector <64 x i32> %115, <64 x i32> undef, <64 x i32> zeroinitializer
  %117 = sub i32 %23, %41
  %118 = insertelement <64 x i32> undef, i32 %16, i32 0
  %119 = shufflevector <64 x i32> %118, <64 x i32> undef, <64 x i32> zeroinitializer
  %120 = sub i32 %23, %38
  %121 = icmp sgt i32 %26, 0
  %or.cond = and i1 %47, %121
  br i1 %or.cond, label %"for output.s0.c.rebased.preheader.split.us.split.us", label %call_destructor.exit, !prof !96

"for output.s0.c.rebased.preheader.split.us.split.us": ; preds = %"for output.s0.c.rebased.preheader"
  %122 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> zeroinitializer)
  %123 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> zeroinitializer)
  %124 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %116)
  %125 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>)
  %ab1.i.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %124, <32 x i32> %125) #11
  %ab.i.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i.us.us.us, <32 x i32> %124, <32 x i32> %125) #11
  %126 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %127 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>)
  %ab1.i67.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %126, <32 x i32> %127) #11
  %ab.i68.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i67.us.us.us, <32 x i32> %126, <32 x i32> %127) #11
  %128 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %ab.i68.us.us.us, <32 x i32> %ab.i.us.us.us)
  %129 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %119)
  %ab1.i69.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %129, <32 x i32> %125) #11
  %ab.i70.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i69.us.us.us, <32 x i32> %129, <32 x i32> %125) #11
  %130 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %119)
  %ab1.i71.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %130, <32 x i32> %127) #11
  %ab.i72.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i71.us.us.us, <32 x i32> %130, <32 x i32> %127) #11
  %131 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %ab.i72.us.us.us, <32 x i32> %ab.i70.us.us.us)
  %132 = add i32 %8, %33
  br label %"for output.s0.c.rebased.us.us"

"for output.s0.c.rebased.us.us":                  ; preds = %"end for output.s0.y.y.loopexit.split.us.us.us", %"for output.s0.c.rebased.preheader.split.us.split.us"
  %output.s0.c.rebased.us.us = phi i32 [ %2178, %"end for output.s0.y.y.loopexit.split.us.us.us" ], [ 0, %"for output.s0.c.rebased.preheader.split.us.split.us" ]
  %133 = sub i32 %output.s0.c.rebased.us.us, %reass.add104
  %134 = add i32 %49, %output.s0.c.rebased.us.us
  %135 = add i32 %117, %output.s0.c.rebased.us.us
  %136 = add nsw i32 %120, %output.s0.c.rebased.us.us
  %137 = getelementptr inbounds i32, i32* %19, i32 %136
  br label %"for output.s0.y.y.us.us.us"

"for output.s0.y.y.us.us.us":                     ; preds = %"end for output.s0.x.x.loopexit.us.us.us", %"for output.s0.c.rebased.us.us"
  %output.s0.y.y.us.us.us = phi i32 [ %2177, %"end for output.s0.x.x.loopexit.us.us.us" ], [ 0, %"for output.s0.c.rebased.us.us" ]
  %a0.us.us.us = shl nsw i32 %output.s0.y.y.us.us.us, 2
  %138 = icmp slt i32 %a0.us.us.us, %b2
  %139 = select i1 %138, i32 %a0.us.us.us, i32 %b2
  %140 = add nsw i32 %139, %28
  %141 = add nsw i32 %140, 3
  %142 = mul nsw i32 %141, %30
  %t151.us.us.us = add nsw i32 %142, %133
  %143 = mul nsw i32 %141, %4
  %144 = add nsw i32 %140, 2
  %145 = mul nsw i32 %144, %30
  %t150.us.us.us = add nsw i32 %145, %133
  %146 = mul nsw i32 %144, %4
  %147 = add nsw i32 %140, 1
  %148 = mul nsw i32 %147, %30
  %t149.us.us.us = add nsw i32 %148, %133
  %149 = mul nsw i32 %147, %4
  %150 = mul nsw i32 %140, %30
  %t148.us.us.us = add nsw i32 %150, %133
  %151 = mul nsw i32 %140, %4
  br label %"for output.s0.x.x.us.us.us"

"for output.s0.x.x.us.us.us":                     ; preds = %"consume matrix_mul2.us.us.us", %"for output.s0.y.y.us.us.us"
  %output.s0.x.x.us.us.us = phi i32 [ %2176, %"consume matrix_mul2.us.us.us" ], [ 0, %"for output.s0.y.y.us.us.us" ]
  %a8.us.us.us = shl nsw i32 %output.s0.x.x.us.us.us, 6
  %152 = icmp slt i32 %a8.us.us.us, %b10
  store <32 x i32> %122, <32 x i32>* %52, align 128, !tbaa !97
  store <32 x i32> %123, <32 x i32>* %54, align 128, !tbaa !106
  store <32 x i32> %122, <32 x i32>* %56, align 128, !tbaa !108
  store <32 x i32> %123, <32 x i32>* %58, align 128, !tbaa !111
  store <32 x i32> %122, <32 x i32>* %60, align 128, !tbaa !113
  store <32 x i32> %123, <32 x i32>* %62, align 128, !tbaa !117
  store <32 x i32> %122, <32 x i32>* %64, align 128, !tbaa !119
  store <32 x i32> %123, <32 x i32>* %66, align 128, !tbaa !122
  store <32 x i32> %122, <32 x i32>* %68, align 128, !tbaa !124
  store <32 x i32> %123, <32 x i32>* %70, align 128, !tbaa !129
  store <32 x i32> %122, <32 x i32>* %72, align 128, !tbaa !131
  store <32 x i32> %123, <32 x i32>* %74, align 128, !tbaa !134
  store <32 x i32> %122, <32 x i32>* %76, align 128, !tbaa !136
  store <32 x i32> %123, <32 x i32>* %78, align 128, !tbaa !140
  store <32 x i32> %122, <32 x i32>* %80, align 128, !tbaa !142
  store <32 x i32> %123, <32 x i32>* %82, align 128, !tbaa !145
  store <32 x i32> %122, <32 x i32>* %84, align 128, !tbaa !147
  store <32 x i32> %123, <32 x i32>* %86, align 128, !tbaa !153
  store <32 x i32> %122, <32 x i32>* %88, align 128, !tbaa !155
  store <32 x i32> %123, <32 x i32>* %90, align 128, !tbaa !158
  store <32 x i32> %122, <32 x i32>* %92, align 128, !tbaa !160
  store <32 x i32> %123, <32 x i32>* %94, align 128, !tbaa !164
  store <32 x i32> %122, <32 x i32>* %96, align 128, !tbaa !166
  store <32 x i32> %123, <32 x i32>* %98, align 128, !tbaa !169
  store <32 x i32> %122, <32 x i32>* %100, align 128, !tbaa !171
  store <32 x i32> %123, <32 x i32>* %102, align 128, !tbaa !176
  store <32 x i32> %122, <32 x i32>* %104, align 128, !tbaa !178
  store <32 x i32> %123, <32 x i32>* %106, align 128, !tbaa !181
  store <32 x i32> %122, <32 x i32>* %108, align 128, !tbaa !183
  store <32 x i32> %123, <32 x i32>* %110, align 128, !tbaa !187
  store <32 x i32> %122, <32 x i32>* %112, align 128, !tbaa !189
  store <32 x i32> %123, <32 x i32>* %114, align 128, !tbaa !192
  br label %"for matrix_mul1.s1.r14$x.us.us.us"

"for matrix_mul1.s1.r14$x.us.us.us":              ; preds = %"for matrix_mul1.s1.r14$x.us.us.us", %"for output.s0.x.x.us.us.us"
  %"matrix_mul1.s1.r14$x.us.us.us" = phi i32 [ 0, %"for output.s0.x.x.us.us.us" ], [ %1335, %"for matrix_mul1.s1.r14$x.us.us.us" ]
  %153 = mul nsw i32 %"matrix_mul1.s1.r14$x.us.us.us", %12
  %154 = add i32 %153, %output.s0.c.rebased.us.us
  %t126.s.us.us.us = sub i32 %154, %8
  %155 = sub i32 %t126.s.us.us.us, %33
  %156 = sub i32 %155, %32
  %157 = add i32 %156, %23
  %158 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %157) #11
  %159 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %158, <32 x i32> %158) #11
  %160 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %128, <64 x i32> %159) #11
  %161 = extractelement <64 x i32> %160, i32 0
  %162 = getelementptr inbounds i16, i16* %6, i32 %161
  %163 = load i16, i16* %162, align 2, !tbaa !194
  %164 = insertelement <64 x i16> undef, i16 %163, i32 0
  %165 = extractelement <64 x i32> %160, i32 1
  %166 = getelementptr inbounds i16, i16* %6, i32 %165
  %167 = load i16, i16* %166, align 2, !tbaa !194
  %168 = insertelement <64 x i16> %164, i16 %167, i32 1
  %169 = extractelement <64 x i32> %160, i32 2
  %170 = getelementptr inbounds i16, i16* %6, i32 %169
  %171 = load i16, i16* %170, align 2, !tbaa !194
  %172 = insertelement <64 x i16> %168, i16 %171, i32 2
  %173 = extractelement <64 x i32> %160, i32 3
  %174 = getelementptr inbounds i16, i16* %6, i32 %173
  %175 = load i16, i16* %174, align 2, !tbaa !194
  %176 = insertelement <64 x i16> %172, i16 %175, i32 3
  %177 = extractelement <64 x i32> %160, i32 4
  %178 = getelementptr inbounds i16, i16* %6, i32 %177
  %179 = load i16, i16* %178, align 2, !tbaa !194
  %180 = insertelement <64 x i16> %176, i16 %179, i32 4
  %181 = extractelement <64 x i32> %160, i32 5
  %182 = getelementptr inbounds i16, i16* %6, i32 %181
  %183 = load i16, i16* %182, align 2, !tbaa !194
  %184 = insertelement <64 x i16> %180, i16 %183, i32 5
  %185 = extractelement <64 x i32> %160, i32 6
  %186 = getelementptr inbounds i16, i16* %6, i32 %185
  %187 = load i16, i16* %186, align 2, !tbaa !194
  %188 = insertelement <64 x i16> %184, i16 %187, i32 6
  %189 = extractelement <64 x i32> %160, i32 7
  %190 = getelementptr inbounds i16, i16* %6, i32 %189
  %191 = load i16, i16* %190, align 2, !tbaa !194
  %192 = insertelement <64 x i16> %188, i16 %191, i32 7
  %193 = extractelement <64 x i32> %160, i32 8
  %194 = getelementptr inbounds i16, i16* %6, i32 %193
  %195 = load i16, i16* %194, align 2, !tbaa !194
  %196 = insertelement <64 x i16> %192, i16 %195, i32 8
  %197 = extractelement <64 x i32> %160, i32 9
  %198 = getelementptr inbounds i16, i16* %6, i32 %197
  %199 = load i16, i16* %198, align 2, !tbaa !194
  %200 = insertelement <64 x i16> %196, i16 %199, i32 9
  %201 = extractelement <64 x i32> %160, i32 10
  %202 = getelementptr inbounds i16, i16* %6, i32 %201
  %203 = load i16, i16* %202, align 2, !tbaa !194
  %204 = insertelement <64 x i16> %200, i16 %203, i32 10
  %205 = extractelement <64 x i32> %160, i32 11
  %206 = getelementptr inbounds i16, i16* %6, i32 %205
  %207 = load i16, i16* %206, align 2, !tbaa !194
  %208 = insertelement <64 x i16> %204, i16 %207, i32 11
  %209 = extractelement <64 x i32> %160, i32 12
  %210 = getelementptr inbounds i16, i16* %6, i32 %209
  %211 = load i16, i16* %210, align 2, !tbaa !194
  %212 = insertelement <64 x i16> %208, i16 %211, i32 12
  %213 = extractelement <64 x i32> %160, i32 13
  %214 = getelementptr inbounds i16, i16* %6, i32 %213
  %215 = load i16, i16* %214, align 2, !tbaa !194
  %216 = insertelement <64 x i16> %212, i16 %215, i32 13
  %217 = extractelement <64 x i32> %160, i32 14
  %218 = getelementptr inbounds i16, i16* %6, i32 %217
  %219 = load i16, i16* %218, align 2, !tbaa !194
  %220 = insertelement <64 x i16> %216, i16 %219, i32 14
  %221 = extractelement <64 x i32> %160, i32 15
  %222 = getelementptr inbounds i16, i16* %6, i32 %221
  %223 = load i16, i16* %222, align 2, !tbaa !194
  %224 = insertelement <64 x i16> %220, i16 %223, i32 15
  %225 = extractelement <64 x i32> %160, i32 16
  %226 = getelementptr inbounds i16, i16* %6, i32 %225
  %227 = load i16, i16* %226, align 2, !tbaa !194
  %228 = insertelement <64 x i16> %224, i16 %227, i32 16
  %229 = extractelement <64 x i32> %160, i32 17
  %230 = getelementptr inbounds i16, i16* %6, i32 %229
  %231 = load i16, i16* %230, align 2, !tbaa !194
  %232 = insertelement <64 x i16> %228, i16 %231, i32 17
  %233 = extractelement <64 x i32> %160, i32 18
  %234 = getelementptr inbounds i16, i16* %6, i32 %233
  %235 = load i16, i16* %234, align 2, !tbaa !194
  %236 = insertelement <64 x i16> %232, i16 %235, i32 18
  %237 = extractelement <64 x i32> %160, i32 19
  %238 = getelementptr inbounds i16, i16* %6, i32 %237
  %239 = load i16, i16* %238, align 2, !tbaa !194
  %240 = insertelement <64 x i16> %236, i16 %239, i32 19
  %241 = extractelement <64 x i32> %160, i32 20
  %242 = getelementptr inbounds i16, i16* %6, i32 %241
  %243 = load i16, i16* %242, align 2, !tbaa !194
  %244 = insertelement <64 x i16> %240, i16 %243, i32 20
  %245 = extractelement <64 x i32> %160, i32 21
  %246 = getelementptr inbounds i16, i16* %6, i32 %245
  %247 = load i16, i16* %246, align 2, !tbaa !194
  %248 = insertelement <64 x i16> %244, i16 %247, i32 21
  %249 = extractelement <64 x i32> %160, i32 22
  %250 = getelementptr inbounds i16, i16* %6, i32 %249
  %251 = load i16, i16* %250, align 2, !tbaa !194
  %252 = insertelement <64 x i16> %248, i16 %251, i32 22
  %253 = extractelement <64 x i32> %160, i32 23
  %254 = getelementptr inbounds i16, i16* %6, i32 %253
  %255 = load i16, i16* %254, align 2, !tbaa !194
  %256 = insertelement <64 x i16> %252, i16 %255, i32 23
  %257 = extractelement <64 x i32> %160, i32 24
  %258 = getelementptr inbounds i16, i16* %6, i32 %257
  %259 = load i16, i16* %258, align 2, !tbaa !194
  %260 = insertelement <64 x i16> %256, i16 %259, i32 24
  %261 = extractelement <64 x i32> %160, i32 25
  %262 = getelementptr inbounds i16, i16* %6, i32 %261
  %263 = load i16, i16* %262, align 2, !tbaa !194
  %264 = insertelement <64 x i16> %260, i16 %263, i32 25
  %265 = extractelement <64 x i32> %160, i32 26
  %266 = getelementptr inbounds i16, i16* %6, i32 %265
  %267 = load i16, i16* %266, align 2, !tbaa !194
  %268 = insertelement <64 x i16> %264, i16 %267, i32 26
  %269 = extractelement <64 x i32> %160, i32 27
  %270 = getelementptr inbounds i16, i16* %6, i32 %269
  %271 = load i16, i16* %270, align 2, !tbaa !194
  %272 = insertelement <64 x i16> %268, i16 %271, i32 27
  %273 = extractelement <64 x i32> %160, i32 28
  %274 = getelementptr inbounds i16, i16* %6, i32 %273
  %275 = load i16, i16* %274, align 2, !tbaa !194
  %276 = insertelement <64 x i16> %272, i16 %275, i32 28
  %277 = extractelement <64 x i32> %160, i32 29
  %278 = getelementptr inbounds i16, i16* %6, i32 %277
  %279 = load i16, i16* %278, align 2, !tbaa !194
  %280 = insertelement <64 x i16> %276, i16 %279, i32 29
  %281 = extractelement <64 x i32> %160, i32 30
  %282 = getelementptr inbounds i16, i16* %6, i32 %281
  %283 = load i16, i16* %282, align 2, !tbaa !194
  %284 = insertelement <64 x i16> %280, i16 %283, i32 30
  %285 = extractelement <64 x i32> %160, i32 31
  %286 = getelementptr inbounds i16, i16* %6, i32 %285
  %287 = load i16, i16* %286, align 2, !tbaa !194
  %288 = insertelement <64 x i16> %284, i16 %287, i32 31
  %289 = extractelement <64 x i32> %160, i32 32
  %290 = getelementptr inbounds i16, i16* %6, i32 %289
  %291 = load i16, i16* %290, align 2, !tbaa !194
  %292 = insertelement <64 x i16> %288, i16 %291, i32 32
  %293 = extractelement <64 x i32> %160, i32 33
  %294 = getelementptr inbounds i16, i16* %6, i32 %293
  %295 = load i16, i16* %294, align 2, !tbaa !194
  %296 = insertelement <64 x i16> %292, i16 %295, i32 33
  %297 = extractelement <64 x i32> %160, i32 34
  %298 = getelementptr inbounds i16, i16* %6, i32 %297
  %299 = load i16, i16* %298, align 2, !tbaa !194
  %300 = insertelement <64 x i16> %296, i16 %299, i32 34
  %301 = extractelement <64 x i32> %160, i32 35
  %302 = getelementptr inbounds i16, i16* %6, i32 %301
  %303 = load i16, i16* %302, align 2, !tbaa !194
  %304 = insertelement <64 x i16> %300, i16 %303, i32 35
  %305 = extractelement <64 x i32> %160, i32 36
  %306 = getelementptr inbounds i16, i16* %6, i32 %305
  %307 = load i16, i16* %306, align 2, !tbaa !194
  %308 = insertelement <64 x i16> %304, i16 %307, i32 36
  %309 = extractelement <64 x i32> %160, i32 37
  %310 = getelementptr inbounds i16, i16* %6, i32 %309
  %311 = load i16, i16* %310, align 2, !tbaa !194
  %312 = insertelement <64 x i16> %308, i16 %311, i32 37
  %313 = extractelement <64 x i32> %160, i32 38
  %314 = getelementptr inbounds i16, i16* %6, i32 %313
  %315 = load i16, i16* %314, align 2, !tbaa !194
  %316 = insertelement <64 x i16> %312, i16 %315, i32 38
  %317 = extractelement <64 x i32> %160, i32 39
  %318 = getelementptr inbounds i16, i16* %6, i32 %317
  %319 = load i16, i16* %318, align 2, !tbaa !194
  %320 = insertelement <64 x i16> %316, i16 %319, i32 39
  %321 = extractelement <64 x i32> %160, i32 40
  %322 = getelementptr inbounds i16, i16* %6, i32 %321
  %323 = load i16, i16* %322, align 2, !tbaa !194
  %324 = insertelement <64 x i16> %320, i16 %323, i32 40
  %325 = extractelement <64 x i32> %160, i32 41
  %326 = getelementptr inbounds i16, i16* %6, i32 %325
  %327 = load i16, i16* %326, align 2, !tbaa !194
  %328 = insertelement <64 x i16> %324, i16 %327, i32 41
  %329 = extractelement <64 x i32> %160, i32 42
  %330 = getelementptr inbounds i16, i16* %6, i32 %329
  %331 = load i16, i16* %330, align 2, !tbaa !194
  %332 = insertelement <64 x i16> %328, i16 %331, i32 42
  %333 = extractelement <64 x i32> %160, i32 43
  %334 = getelementptr inbounds i16, i16* %6, i32 %333
  %335 = load i16, i16* %334, align 2, !tbaa !194
  %336 = insertelement <64 x i16> %332, i16 %335, i32 43
  %337 = extractelement <64 x i32> %160, i32 44
  %338 = getelementptr inbounds i16, i16* %6, i32 %337
  %339 = load i16, i16* %338, align 2, !tbaa !194
  %340 = insertelement <64 x i16> %336, i16 %339, i32 44
  %341 = extractelement <64 x i32> %160, i32 45
  %342 = getelementptr inbounds i16, i16* %6, i32 %341
  %343 = load i16, i16* %342, align 2, !tbaa !194
  %344 = insertelement <64 x i16> %340, i16 %343, i32 45
  %345 = extractelement <64 x i32> %160, i32 46
  %346 = getelementptr inbounds i16, i16* %6, i32 %345
  %347 = load i16, i16* %346, align 2, !tbaa !194
  %348 = insertelement <64 x i16> %344, i16 %347, i32 46
  %349 = extractelement <64 x i32> %160, i32 47
  %350 = getelementptr inbounds i16, i16* %6, i32 %349
  %351 = load i16, i16* %350, align 2, !tbaa !194
  %352 = insertelement <64 x i16> %348, i16 %351, i32 47
  %353 = extractelement <64 x i32> %160, i32 48
  %354 = getelementptr inbounds i16, i16* %6, i32 %353
  %355 = load i16, i16* %354, align 2, !tbaa !194
  %356 = insertelement <64 x i16> %352, i16 %355, i32 48
  %357 = extractelement <64 x i32> %160, i32 49
  %358 = getelementptr inbounds i16, i16* %6, i32 %357
  %359 = load i16, i16* %358, align 2, !tbaa !194
  %360 = insertelement <64 x i16> %356, i16 %359, i32 49
  %361 = extractelement <64 x i32> %160, i32 50
  %362 = getelementptr inbounds i16, i16* %6, i32 %361
  %363 = load i16, i16* %362, align 2, !tbaa !194
  %364 = insertelement <64 x i16> %360, i16 %363, i32 50
  %365 = extractelement <64 x i32> %160, i32 51
  %366 = getelementptr inbounds i16, i16* %6, i32 %365
  %367 = load i16, i16* %366, align 2, !tbaa !194
  %368 = insertelement <64 x i16> %364, i16 %367, i32 51
  %369 = extractelement <64 x i32> %160, i32 52
  %370 = getelementptr inbounds i16, i16* %6, i32 %369
  %371 = load i16, i16* %370, align 2, !tbaa !194
  %372 = insertelement <64 x i16> %368, i16 %371, i32 52
  %373 = extractelement <64 x i32> %160, i32 53
  %374 = getelementptr inbounds i16, i16* %6, i32 %373
  %375 = load i16, i16* %374, align 2, !tbaa !194
  %376 = insertelement <64 x i16> %372, i16 %375, i32 53
  %377 = extractelement <64 x i32> %160, i32 54
  %378 = getelementptr inbounds i16, i16* %6, i32 %377
  %379 = load i16, i16* %378, align 2, !tbaa !194
  %380 = insertelement <64 x i16> %376, i16 %379, i32 54
  %381 = extractelement <64 x i32> %160, i32 55
  %382 = getelementptr inbounds i16, i16* %6, i32 %381
  %383 = load i16, i16* %382, align 2, !tbaa !194
  %384 = insertelement <64 x i16> %380, i16 %383, i32 55
  %385 = extractelement <64 x i32> %160, i32 56
  %386 = getelementptr inbounds i16, i16* %6, i32 %385
  %387 = load i16, i16* %386, align 2, !tbaa !194
  %388 = insertelement <64 x i16> %384, i16 %387, i32 56
  %389 = extractelement <64 x i32> %160, i32 57
  %390 = getelementptr inbounds i16, i16* %6, i32 %389
  %391 = load i16, i16* %390, align 2, !tbaa !194
  %392 = insertelement <64 x i16> %388, i16 %391, i32 57
  %393 = extractelement <64 x i32> %160, i32 58
  %394 = getelementptr inbounds i16, i16* %6, i32 %393
  %395 = load i16, i16* %394, align 2, !tbaa !194
  %396 = insertelement <64 x i16> %392, i16 %395, i32 58
  %397 = extractelement <64 x i32> %160, i32 59
  %398 = getelementptr inbounds i16, i16* %6, i32 %397
  %399 = load i16, i16* %398, align 2, !tbaa !194
  %400 = insertelement <64 x i16> %396, i16 %399, i32 59
  %401 = extractelement <64 x i32> %160, i32 60
  %402 = getelementptr inbounds i16, i16* %6, i32 %401
  %403 = load i16, i16* %402, align 2, !tbaa !194
  %404 = insertelement <64 x i16> %400, i16 %403, i32 60
  %405 = extractelement <64 x i32> %160, i32 61
  %406 = getelementptr inbounds i16, i16* %6, i32 %405
  %407 = load i16, i16* %406, align 2, !tbaa !194
  %408 = insertelement <64 x i16> %404, i16 %407, i32 61
  %409 = extractelement <64 x i32> %160, i32 62
  %410 = getelementptr inbounds i16, i16* %6, i32 %409
  %411 = load i16, i16* %410, align 2, !tbaa !194
  %412 = insertelement <64 x i16> %408, i16 %411, i32 62
  %413 = extractelement <64 x i32> %160, i32 63
  %414 = getelementptr inbounds i16, i16* %6, i32 %413
  %415 = load i16, i16* %414, align 2, !tbaa !194
  %416 = insertelement <64 x i16> %412, i16 %415, i32 63
  %417 = mul nsw i32 %"matrix_mul1.s1.r14$x.us.us.us", %3
  %t144.us.us.us = add i32 %417, %134
  %418 = add i32 %t144.us.us.us, %151
  %419 = getelementptr inbounds i16, i16* %1, i32 %418
  %420 = load i16, i16* %419, align 2, !tbaa !196
  %421 = load <32 x i32>, <32 x i32>* %52, align 128, !tbaa !97
  %422 = load <32 x i32>, <32 x i32>* %54, align 128, !tbaa !106
  %423 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %422, <32 x i32> %421)
  %424 = bitcast <64 x i16> %416 to <32 x i32>
  %425 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %424) #11
  %426 = zext i16 %420 to i32
  %427 = shl nuw i32 %426, 16
  %428 = or i32 %427, %426
  %429 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %423, <32 x i32> %425, i32 %428) #11
  %430 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %429)
  store <32 x i32> %430, <32 x i32>* %52, align 128, !tbaa !97
  %431 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %429)
  store <32 x i32> %431, <32 x i32>* %54, align 128, !tbaa !106
  %432 = add i32 %154, %35
  %433 = sub i32 %432, %132
  %434 = sub i32 %433, %32
  %435 = add i32 %434, %23
  %436 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %435) #11
  %437 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %436) #11
  %438 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %128, <64 x i32> %437) #11
  %439 = extractelement <64 x i32> %438, i32 0
  %440 = getelementptr inbounds i16, i16* %6, i32 %439
  %441 = load i16, i16* %440, align 2, !tbaa !194
  %442 = insertelement <64 x i16> undef, i16 %441, i32 0
  %443 = extractelement <64 x i32> %438, i32 1
  %444 = getelementptr inbounds i16, i16* %6, i32 %443
  %445 = load i16, i16* %444, align 2, !tbaa !194
  %446 = insertelement <64 x i16> %442, i16 %445, i32 1
  %447 = extractelement <64 x i32> %438, i32 2
  %448 = getelementptr inbounds i16, i16* %6, i32 %447
  %449 = load i16, i16* %448, align 2, !tbaa !194
  %450 = insertelement <64 x i16> %446, i16 %449, i32 2
  %451 = extractelement <64 x i32> %438, i32 3
  %452 = getelementptr inbounds i16, i16* %6, i32 %451
  %453 = load i16, i16* %452, align 2, !tbaa !194
  %454 = insertelement <64 x i16> %450, i16 %453, i32 3
  %455 = extractelement <64 x i32> %438, i32 4
  %456 = getelementptr inbounds i16, i16* %6, i32 %455
  %457 = load i16, i16* %456, align 2, !tbaa !194
  %458 = insertelement <64 x i16> %454, i16 %457, i32 4
  %459 = extractelement <64 x i32> %438, i32 5
  %460 = getelementptr inbounds i16, i16* %6, i32 %459
  %461 = load i16, i16* %460, align 2, !tbaa !194
  %462 = insertelement <64 x i16> %458, i16 %461, i32 5
  %463 = extractelement <64 x i32> %438, i32 6
  %464 = getelementptr inbounds i16, i16* %6, i32 %463
  %465 = load i16, i16* %464, align 2, !tbaa !194
  %466 = insertelement <64 x i16> %462, i16 %465, i32 6
  %467 = extractelement <64 x i32> %438, i32 7
  %468 = getelementptr inbounds i16, i16* %6, i32 %467
  %469 = load i16, i16* %468, align 2, !tbaa !194
  %470 = insertelement <64 x i16> %466, i16 %469, i32 7
  %471 = extractelement <64 x i32> %438, i32 8
  %472 = getelementptr inbounds i16, i16* %6, i32 %471
  %473 = load i16, i16* %472, align 2, !tbaa !194
  %474 = insertelement <64 x i16> %470, i16 %473, i32 8
  %475 = extractelement <64 x i32> %438, i32 9
  %476 = getelementptr inbounds i16, i16* %6, i32 %475
  %477 = load i16, i16* %476, align 2, !tbaa !194
  %478 = insertelement <64 x i16> %474, i16 %477, i32 9
  %479 = extractelement <64 x i32> %438, i32 10
  %480 = getelementptr inbounds i16, i16* %6, i32 %479
  %481 = load i16, i16* %480, align 2, !tbaa !194
  %482 = insertelement <64 x i16> %478, i16 %481, i32 10
  %483 = extractelement <64 x i32> %438, i32 11
  %484 = getelementptr inbounds i16, i16* %6, i32 %483
  %485 = load i16, i16* %484, align 2, !tbaa !194
  %486 = insertelement <64 x i16> %482, i16 %485, i32 11
  %487 = extractelement <64 x i32> %438, i32 12
  %488 = getelementptr inbounds i16, i16* %6, i32 %487
  %489 = load i16, i16* %488, align 2, !tbaa !194
  %490 = insertelement <64 x i16> %486, i16 %489, i32 12
  %491 = extractelement <64 x i32> %438, i32 13
  %492 = getelementptr inbounds i16, i16* %6, i32 %491
  %493 = load i16, i16* %492, align 2, !tbaa !194
  %494 = insertelement <64 x i16> %490, i16 %493, i32 13
  %495 = extractelement <64 x i32> %438, i32 14
  %496 = getelementptr inbounds i16, i16* %6, i32 %495
  %497 = load i16, i16* %496, align 2, !tbaa !194
  %498 = insertelement <64 x i16> %494, i16 %497, i32 14
  %499 = extractelement <64 x i32> %438, i32 15
  %500 = getelementptr inbounds i16, i16* %6, i32 %499
  %501 = load i16, i16* %500, align 2, !tbaa !194
  %502 = insertelement <64 x i16> %498, i16 %501, i32 15
  %503 = extractelement <64 x i32> %438, i32 16
  %504 = getelementptr inbounds i16, i16* %6, i32 %503
  %505 = load i16, i16* %504, align 2, !tbaa !194
  %506 = insertelement <64 x i16> %502, i16 %505, i32 16
  %507 = extractelement <64 x i32> %438, i32 17
  %508 = getelementptr inbounds i16, i16* %6, i32 %507
  %509 = load i16, i16* %508, align 2, !tbaa !194
  %510 = insertelement <64 x i16> %506, i16 %509, i32 17
  %511 = extractelement <64 x i32> %438, i32 18
  %512 = getelementptr inbounds i16, i16* %6, i32 %511
  %513 = load i16, i16* %512, align 2, !tbaa !194
  %514 = insertelement <64 x i16> %510, i16 %513, i32 18
  %515 = extractelement <64 x i32> %438, i32 19
  %516 = getelementptr inbounds i16, i16* %6, i32 %515
  %517 = load i16, i16* %516, align 2, !tbaa !194
  %518 = insertelement <64 x i16> %514, i16 %517, i32 19
  %519 = extractelement <64 x i32> %438, i32 20
  %520 = getelementptr inbounds i16, i16* %6, i32 %519
  %521 = load i16, i16* %520, align 2, !tbaa !194
  %522 = insertelement <64 x i16> %518, i16 %521, i32 20
  %523 = extractelement <64 x i32> %438, i32 21
  %524 = getelementptr inbounds i16, i16* %6, i32 %523
  %525 = load i16, i16* %524, align 2, !tbaa !194
  %526 = insertelement <64 x i16> %522, i16 %525, i32 21
  %527 = extractelement <64 x i32> %438, i32 22
  %528 = getelementptr inbounds i16, i16* %6, i32 %527
  %529 = load i16, i16* %528, align 2, !tbaa !194
  %530 = insertelement <64 x i16> %526, i16 %529, i32 22
  %531 = extractelement <64 x i32> %438, i32 23
  %532 = getelementptr inbounds i16, i16* %6, i32 %531
  %533 = load i16, i16* %532, align 2, !tbaa !194
  %534 = insertelement <64 x i16> %530, i16 %533, i32 23
  %535 = extractelement <64 x i32> %438, i32 24
  %536 = getelementptr inbounds i16, i16* %6, i32 %535
  %537 = load i16, i16* %536, align 2, !tbaa !194
  %538 = insertelement <64 x i16> %534, i16 %537, i32 24
  %539 = extractelement <64 x i32> %438, i32 25
  %540 = getelementptr inbounds i16, i16* %6, i32 %539
  %541 = load i16, i16* %540, align 2, !tbaa !194
  %542 = insertelement <64 x i16> %538, i16 %541, i32 25
  %543 = extractelement <64 x i32> %438, i32 26
  %544 = getelementptr inbounds i16, i16* %6, i32 %543
  %545 = load i16, i16* %544, align 2, !tbaa !194
  %546 = insertelement <64 x i16> %542, i16 %545, i32 26
  %547 = extractelement <64 x i32> %438, i32 27
  %548 = getelementptr inbounds i16, i16* %6, i32 %547
  %549 = load i16, i16* %548, align 2, !tbaa !194
  %550 = insertelement <64 x i16> %546, i16 %549, i32 27
  %551 = extractelement <64 x i32> %438, i32 28
  %552 = getelementptr inbounds i16, i16* %6, i32 %551
  %553 = load i16, i16* %552, align 2, !tbaa !194
  %554 = insertelement <64 x i16> %550, i16 %553, i32 28
  %555 = extractelement <64 x i32> %438, i32 29
  %556 = getelementptr inbounds i16, i16* %6, i32 %555
  %557 = load i16, i16* %556, align 2, !tbaa !194
  %558 = insertelement <64 x i16> %554, i16 %557, i32 29
  %559 = extractelement <64 x i32> %438, i32 30
  %560 = getelementptr inbounds i16, i16* %6, i32 %559
  %561 = load i16, i16* %560, align 2, !tbaa !194
  %562 = insertelement <64 x i16> %558, i16 %561, i32 30
  %563 = extractelement <64 x i32> %438, i32 31
  %564 = getelementptr inbounds i16, i16* %6, i32 %563
  %565 = load i16, i16* %564, align 2, !tbaa !194
  %566 = insertelement <64 x i16> %562, i16 %565, i32 31
  %567 = extractelement <64 x i32> %438, i32 32
  %568 = getelementptr inbounds i16, i16* %6, i32 %567
  %569 = load i16, i16* %568, align 2, !tbaa !194
  %570 = insertelement <64 x i16> %566, i16 %569, i32 32
  %571 = extractelement <64 x i32> %438, i32 33
  %572 = getelementptr inbounds i16, i16* %6, i32 %571
  %573 = load i16, i16* %572, align 2, !tbaa !194
  %574 = insertelement <64 x i16> %570, i16 %573, i32 33
  %575 = extractelement <64 x i32> %438, i32 34
  %576 = getelementptr inbounds i16, i16* %6, i32 %575
  %577 = load i16, i16* %576, align 2, !tbaa !194
  %578 = insertelement <64 x i16> %574, i16 %577, i32 34
  %579 = extractelement <64 x i32> %438, i32 35
  %580 = getelementptr inbounds i16, i16* %6, i32 %579
  %581 = load i16, i16* %580, align 2, !tbaa !194
  %582 = insertelement <64 x i16> %578, i16 %581, i32 35
  %583 = extractelement <64 x i32> %438, i32 36
  %584 = getelementptr inbounds i16, i16* %6, i32 %583
  %585 = load i16, i16* %584, align 2, !tbaa !194
  %586 = insertelement <64 x i16> %582, i16 %585, i32 36
  %587 = extractelement <64 x i32> %438, i32 37
  %588 = getelementptr inbounds i16, i16* %6, i32 %587
  %589 = load i16, i16* %588, align 2, !tbaa !194
  %590 = insertelement <64 x i16> %586, i16 %589, i32 37
  %591 = extractelement <64 x i32> %438, i32 38
  %592 = getelementptr inbounds i16, i16* %6, i32 %591
  %593 = load i16, i16* %592, align 2, !tbaa !194
  %594 = insertelement <64 x i16> %590, i16 %593, i32 38
  %595 = extractelement <64 x i32> %438, i32 39
  %596 = getelementptr inbounds i16, i16* %6, i32 %595
  %597 = load i16, i16* %596, align 2, !tbaa !194
  %598 = insertelement <64 x i16> %594, i16 %597, i32 39
  %599 = extractelement <64 x i32> %438, i32 40
  %600 = getelementptr inbounds i16, i16* %6, i32 %599
  %601 = load i16, i16* %600, align 2, !tbaa !194
  %602 = insertelement <64 x i16> %598, i16 %601, i32 40
  %603 = extractelement <64 x i32> %438, i32 41
  %604 = getelementptr inbounds i16, i16* %6, i32 %603
  %605 = load i16, i16* %604, align 2, !tbaa !194
  %606 = insertelement <64 x i16> %602, i16 %605, i32 41
  %607 = extractelement <64 x i32> %438, i32 42
  %608 = getelementptr inbounds i16, i16* %6, i32 %607
  %609 = load i16, i16* %608, align 2, !tbaa !194
  %610 = insertelement <64 x i16> %606, i16 %609, i32 42
  %611 = extractelement <64 x i32> %438, i32 43
  %612 = getelementptr inbounds i16, i16* %6, i32 %611
  %613 = load i16, i16* %612, align 2, !tbaa !194
  %614 = insertelement <64 x i16> %610, i16 %613, i32 43
  %615 = extractelement <64 x i32> %438, i32 44
  %616 = getelementptr inbounds i16, i16* %6, i32 %615
  %617 = load i16, i16* %616, align 2, !tbaa !194
  %618 = insertelement <64 x i16> %614, i16 %617, i32 44
  %619 = extractelement <64 x i32> %438, i32 45
  %620 = getelementptr inbounds i16, i16* %6, i32 %619
  %621 = load i16, i16* %620, align 2, !tbaa !194
  %622 = insertelement <64 x i16> %618, i16 %621, i32 45
  %623 = extractelement <64 x i32> %438, i32 46
  %624 = getelementptr inbounds i16, i16* %6, i32 %623
  %625 = load i16, i16* %624, align 2, !tbaa !194
  %626 = insertelement <64 x i16> %622, i16 %625, i32 46
  %627 = extractelement <64 x i32> %438, i32 47
  %628 = getelementptr inbounds i16, i16* %6, i32 %627
  %629 = load i16, i16* %628, align 2, !tbaa !194
  %630 = insertelement <64 x i16> %626, i16 %629, i32 47
  %631 = extractelement <64 x i32> %438, i32 48
  %632 = getelementptr inbounds i16, i16* %6, i32 %631
  %633 = load i16, i16* %632, align 2, !tbaa !194
  %634 = insertelement <64 x i16> %630, i16 %633, i32 48
  %635 = extractelement <64 x i32> %438, i32 49
  %636 = getelementptr inbounds i16, i16* %6, i32 %635
  %637 = load i16, i16* %636, align 2, !tbaa !194
  %638 = insertelement <64 x i16> %634, i16 %637, i32 49
  %639 = extractelement <64 x i32> %438, i32 50
  %640 = getelementptr inbounds i16, i16* %6, i32 %639
  %641 = load i16, i16* %640, align 2, !tbaa !194
  %642 = insertelement <64 x i16> %638, i16 %641, i32 50
  %643 = extractelement <64 x i32> %438, i32 51
  %644 = getelementptr inbounds i16, i16* %6, i32 %643
  %645 = load i16, i16* %644, align 2, !tbaa !194
  %646 = insertelement <64 x i16> %642, i16 %645, i32 51
  %647 = extractelement <64 x i32> %438, i32 52
  %648 = getelementptr inbounds i16, i16* %6, i32 %647
  %649 = load i16, i16* %648, align 2, !tbaa !194
  %650 = insertelement <64 x i16> %646, i16 %649, i32 52
  %651 = extractelement <64 x i32> %438, i32 53
  %652 = getelementptr inbounds i16, i16* %6, i32 %651
  %653 = load i16, i16* %652, align 2, !tbaa !194
  %654 = insertelement <64 x i16> %650, i16 %653, i32 53
  %655 = extractelement <64 x i32> %438, i32 54
  %656 = getelementptr inbounds i16, i16* %6, i32 %655
  %657 = load i16, i16* %656, align 2, !tbaa !194
  %658 = insertelement <64 x i16> %654, i16 %657, i32 54
  %659 = extractelement <64 x i32> %438, i32 55
  %660 = getelementptr inbounds i16, i16* %6, i32 %659
  %661 = load i16, i16* %660, align 2, !tbaa !194
  %662 = insertelement <64 x i16> %658, i16 %661, i32 55
  %663 = extractelement <64 x i32> %438, i32 56
  %664 = getelementptr inbounds i16, i16* %6, i32 %663
  %665 = load i16, i16* %664, align 2, !tbaa !194
  %666 = insertelement <64 x i16> %662, i16 %665, i32 56
  %667 = extractelement <64 x i32> %438, i32 57
  %668 = getelementptr inbounds i16, i16* %6, i32 %667
  %669 = load i16, i16* %668, align 2, !tbaa !194
  %670 = insertelement <64 x i16> %666, i16 %669, i32 57
  %671 = extractelement <64 x i32> %438, i32 58
  %672 = getelementptr inbounds i16, i16* %6, i32 %671
  %673 = load i16, i16* %672, align 2, !tbaa !194
  %674 = insertelement <64 x i16> %670, i16 %673, i32 58
  %675 = extractelement <64 x i32> %438, i32 59
  %676 = getelementptr inbounds i16, i16* %6, i32 %675
  %677 = load i16, i16* %676, align 2, !tbaa !194
  %678 = insertelement <64 x i16> %674, i16 %677, i32 59
  %679 = extractelement <64 x i32> %438, i32 60
  %680 = getelementptr inbounds i16, i16* %6, i32 %679
  %681 = load i16, i16* %680, align 2, !tbaa !194
  %682 = insertelement <64 x i16> %678, i16 %681, i32 60
  %683 = extractelement <64 x i32> %438, i32 61
  %684 = getelementptr inbounds i16, i16* %6, i32 %683
  %685 = load i16, i16* %684, align 2, !tbaa !194
  %686 = insertelement <64 x i16> %682, i16 %685, i32 61
  %687 = extractelement <64 x i32> %438, i32 62
  %688 = getelementptr inbounds i16, i16* %6, i32 %687
  %689 = load i16, i16* %688, align 2, !tbaa !194
  %690 = insertelement <64 x i16> %686, i16 %689, i32 62
  %691 = extractelement <64 x i32> %438, i32 63
  %692 = getelementptr inbounds i16, i16* %6, i32 %691
  %693 = load i16, i16* %692, align 2, !tbaa !194
  %694 = insertelement <64 x i16> %690, i16 %693, i32 63
  %695 = load <32 x i32>, <32 x i32>* %56, align 128, !tbaa !108
  %696 = load <32 x i32>, <32 x i32>* %58, align 128, !tbaa !111
  %697 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %696, <32 x i32> %695)
  %698 = bitcast <64 x i16> %694 to <32 x i32>
  %699 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %698) #11
  %700 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %697, <32 x i32> %699, i32 %428) #11
  %701 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %700)
  store <32 x i32> %701, <32 x i32>* %56, align 128, !tbaa !108
  %702 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %700)
  store <32 x i32> %702, <32 x i32>* %58, align 128, !tbaa !111
  %703 = add i32 %154, %34
  %704 = sub i32 %703, %132
  %705 = sub i32 %704, %32
  %706 = add i32 %705, %23
  %707 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %706) #11
  %708 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %707, <32 x i32> %707) #11
  %709 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %128, <64 x i32> %708) #11
  %710 = extractelement <64 x i32> %709, i32 0
  %711 = getelementptr inbounds i16, i16* %6, i32 %710
  %712 = load i16, i16* %711, align 2, !tbaa !194
  %713 = insertelement <64 x i16> undef, i16 %712, i32 0
  %714 = extractelement <64 x i32> %709, i32 1
  %715 = getelementptr inbounds i16, i16* %6, i32 %714
  %716 = load i16, i16* %715, align 2, !tbaa !194
  %717 = insertelement <64 x i16> %713, i16 %716, i32 1
  %718 = extractelement <64 x i32> %709, i32 2
  %719 = getelementptr inbounds i16, i16* %6, i32 %718
  %720 = load i16, i16* %719, align 2, !tbaa !194
  %721 = insertelement <64 x i16> %717, i16 %720, i32 2
  %722 = extractelement <64 x i32> %709, i32 3
  %723 = getelementptr inbounds i16, i16* %6, i32 %722
  %724 = load i16, i16* %723, align 2, !tbaa !194
  %725 = insertelement <64 x i16> %721, i16 %724, i32 3
  %726 = extractelement <64 x i32> %709, i32 4
  %727 = getelementptr inbounds i16, i16* %6, i32 %726
  %728 = load i16, i16* %727, align 2, !tbaa !194
  %729 = insertelement <64 x i16> %725, i16 %728, i32 4
  %730 = extractelement <64 x i32> %709, i32 5
  %731 = getelementptr inbounds i16, i16* %6, i32 %730
  %732 = load i16, i16* %731, align 2, !tbaa !194
  %733 = insertelement <64 x i16> %729, i16 %732, i32 5
  %734 = extractelement <64 x i32> %709, i32 6
  %735 = getelementptr inbounds i16, i16* %6, i32 %734
  %736 = load i16, i16* %735, align 2, !tbaa !194
  %737 = insertelement <64 x i16> %733, i16 %736, i32 6
  %738 = extractelement <64 x i32> %709, i32 7
  %739 = getelementptr inbounds i16, i16* %6, i32 %738
  %740 = load i16, i16* %739, align 2, !tbaa !194
  %741 = insertelement <64 x i16> %737, i16 %740, i32 7
  %742 = extractelement <64 x i32> %709, i32 8
  %743 = getelementptr inbounds i16, i16* %6, i32 %742
  %744 = load i16, i16* %743, align 2, !tbaa !194
  %745 = insertelement <64 x i16> %741, i16 %744, i32 8
  %746 = extractelement <64 x i32> %709, i32 9
  %747 = getelementptr inbounds i16, i16* %6, i32 %746
  %748 = load i16, i16* %747, align 2, !tbaa !194
  %749 = insertelement <64 x i16> %745, i16 %748, i32 9
  %750 = extractelement <64 x i32> %709, i32 10
  %751 = getelementptr inbounds i16, i16* %6, i32 %750
  %752 = load i16, i16* %751, align 2, !tbaa !194
  %753 = insertelement <64 x i16> %749, i16 %752, i32 10
  %754 = extractelement <64 x i32> %709, i32 11
  %755 = getelementptr inbounds i16, i16* %6, i32 %754
  %756 = load i16, i16* %755, align 2, !tbaa !194
  %757 = insertelement <64 x i16> %753, i16 %756, i32 11
  %758 = extractelement <64 x i32> %709, i32 12
  %759 = getelementptr inbounds i16, i16* %6, i32 %758
  %760 = load i16, i16* %759, align 2, !tbaa !194
  %761 = insertelement <64 x i16> %757, i16 %760, i32 12
  %762 = extractelement <64 x i32> %709, i32 13
  %763 = getelementptr inbounds i16, i16* %6, i32 %762
  %764 = load i16, i16* %763, align 2, !tbaa !194
  %765 = insertelement <64 x i16> %761, i16 %764, i32 13
  %766 = extractelement <64 x i32> %709, i32 14
  %767 = getelementptr inbounds i16, i16* %6, i32 %766
  %768 = load i16, i16* %767, align 2, !tbaa !194
  %769 = insertelement <64 x i16> %765, i16 %768, i32 14
  %770 = extractelement <64 x i32> %709, i32 15
  %771 = getelementptr inbounds i16, i16* %6, i32 %770
  %772 = load i16, i16* %771, align 2, !tbaa !194
  %773 = insertelement <64 x i16> %769, i16 %772, i32 15
  %774 = extractelement <64 x i32> %709, i32 16
  %775 = getelementptr inbounds i16, i16* %6, i32 %774
  %776 = load i16, i16* %775, align 2, !tbaa !194
  %777 = insertelement <64 x i16> %773, i16 %776, i32 16
  %778 = extractelement <64 x i32> %709, i32 17
  %779 = getelementptr inbounds i16, i16* %6, i32 %778
  %780 = load i16, i16* %779, align 2, !tbaa !194
  %781 = insertelement <64 x i16> %777, i16 %780, i32 17
  %782 = extractelement <64 x i32> %709, i32 18
  %783 = getelementptr inbounds i16, i16* %6, i32 %782
  %784 = load i16, i16* %783, align 2, !tbaa !194
  %785 = insertelement <64 x i16> %781, i16 %784, i32 18
  %786 = extractelement <64 x i32> %709, i32 19
  %787 = getelementptr inbounds i16, i16* %6, i32 %786
  %788 = load i16, i16* %787, align 2, !tbaa !194
  %789 = insertelement <64 x i16> %785, i16 %788, i32 19
  %790 = extractelement <64 x i32> %709, i32 20
  %791 = getelementptr inbounds i16, i16* %6, i32 %790
  %792 = load i16, i16* %791, align 2, !tbaa !194
  %793 = insertelement <64 x i16> %789, i16 %792, i32 20
  %794 = extractelement <64 x i32> %709, i32 21
  %795 = getelementptr inbounds i16, i16* %6, i32 %794
  %796 = load i16, i16* %795, align 2, !tbaa !194
  %797 = insertelement <64 x i16> %793, i16 %796, i32 21
  %798 = extractelement <64 x i32> %709, i32 22
  %799 = getelementptr inbounds i16, i16* %6, i32 %798
  %800 = load i16, i16* %799, align 2, !tbaa !194
  %801 = insertelement <64 x i16> %797, i16 %800, i32 22
  %802 = extractelement <64 x i32> %709, i32 23
  %803 = getelementptr inbounds i16, i16* %6, i32 %802
  %804 = load i16, i16* %803, align 2, !tbaa !194
  %805 = insertelement <64 x i16> %801, i16 %804, i32 23
  %806 = extractelement <64 x i32> %709, i32 24
  %807 = getelementptr inbounds i16, i16* %6, i32 %806
  %808 = load i16, i16* %807, align 2, !tbaa !194
  %809 = insertelement <64 x i16> %805, i16 %808, i32 24
  %810 = extractelement <64 x i32> %709, i32 25
  %811 = getelementptr inbounds i16, i16* %6, i32 %810
  %812 = load i16, i16* %811, align 2, !tbaa !194
  %813 = insertelement <64 x i16> %809, i16 %812, i32 25
  %814 = extractelement <64 x i32> %709, i32 26
  %815 = getelementptr inbounds i16, i16* %6, i32 %814
  %816 = load i16, i16* %815, align 2, !tbaa !194
  %817 = insertelement <64 x i16> %813, i16 %816, i32 26
  %818 = extractelement <64 x i32> %709, i32 27
  %819 = getelementptr inbounds i16, i16* %6, i32 %818
  %820 = load i16, i16* %819, align 2, !tbaa !194
  %821 = insertelement <64 x i16> %817, i16 %820, i32 27
  %822 = extractelement <64 x i32> %709, i32 28
  %823 = getelementptr inbounds i16, i16* %6, i32 %822
  %824 = load i16, i16* %823, align 2, !tbaa !194
  %825 = insertelement <64 x i16> %821, i16 %824, i32 28
  %826 = extractelement <64 x i32> %709, i32 29
  %827 = getelementptr inbounds i16, i16* %6, i32 %826
  %828 = load i16, i16* %827, align 2, !tbaa !194
  %829 = insertelement <64 x i16> %825, i16 %828, i32 29
  %830 = extractelement <64 x i32> %709, i32 30
  %831 = getelementptr inbounds i16, i16* %6, i32 %830
  %832 = load i16, i16* %831, align 2, !tbaa !194
  %833 = insertelement <64 x i16> %829, i16 %832, i32 30
  %834 = extractelement <64 x i32> %709, i32 31
  %835 = getelementptr inbounds i16, i16* %6, i32 %834
  %836 = load i16, i16* %835, align 2, !tbaa !194
  %837 = insertelement <64 x i16> %833, i16 %836, i32 31
  %838 = extractelement <64 x i32> %709, i32 32
  %839 = getelementptr inbounds i16, i16* %6, i32 %838
  %840 = load i16, i16* %839, align 2, !tbaa !194
  %841 = insertelement <64 x i16> %837, i16 %840, i32 32
  %842 = extractelement <64 x i32> %709, i32 33
  %843 = getelementptr inbounds i16, i16* %6, i32 %842
  %844 = load i16, i16* %843, align 2, !tbaa !194
  %845 = insertelement <64 x i16> %841, i16 %844, i32 33
  %846 = extractelement <64 x i32> %709, i32 34
  %847 = getelementptr inbounds i16, i16* %6, i32 %846
  %848 = load i16, i16* %847, align 2, !tbaa !194
  %849 = insertelement <64 x i16> %845, i16 %848, i32 34
  %850 = extractelement <64 x i32> %709, i32 35
  %851 = getelementptr inbounds i16, i16* %6, i32 %850
  %852 = load i16, i16* %851, align 2, !tbaa !194
  %853 = insertelement <64 x i16> %849, i16 %852, i32 35
  %854 = extractelement <64 x i32> %709, i32 36
  %855 = getelementptr inbounds i16, i16* %6, i32 %854
  %856 = load i16, i16* %855, align 2, !tbaa !194
  %857 = insertelement <64 x i16> %853, i16 %856, i32 36
  %858 = extractelement <64 x i32> %709, i32 37
  %859 = getelementptr inbounds i16, i16* %6, i32 %858
  %860 = load i16, i16* %859, align 2, !tbaa !194
  %861 = insertelement <64 x i16> %857, i16 %860, i32 37
  %862 = extractelement <64 x i32> %709, i32 38
  %863 = getelementptr inbounds i16, i16* %6, i32 %862
  %864 = load i16, i16* %863, align 2, !tbaa !194
  %865 = insertelement <64 x i16> %861, i16 %864, i32 38
  %866 = extractelement <64 x i32> %709, i32 39
  %867 = getelementptr inbounds i16, i16* %6, i32 %866
  %868 = load i16, i16* %867, align 2, !tbaa !194
  %869 = insertelement <64 x i16> %865, i16 %868, i32 39
  %870 = extractelement <64 x i32> %709, i32 40
  %871 = getelementptr inbounds i16, i16* %6, i32 %870
  %872 = load i16, i16* %871, align 2, !tbaa !194
  %873 = insertelement <64 x i16> %869, i16 %872, i32 40
  %874 = extractelement <64 x i32> %709, i32 41
  %875 = getelementptr inbounds i16, i16* %6, i32 %874
  %876 = load i16, i16* %875, align 2, !tbaa !194
  %877 = insertelement <64 x i16> %873, i16 %876, i32 41
  %878 = extractelement <64 x i32> %709, i32 42
  %879 = getelementptr inbounds i16, i16* %6, i32 %878
  %880 = load i16, i16* %879, align 2, !tbaa !194
  %881 = insertelement <64 x i16> %877, i16 %880, i32 42
  %882 = extractelement <64 x i32> %709, i32 43
  %883 = getelementptr inbounds i16, i16* %6, i32 %882
  %884 = load i16, i16* %883, align 2, !tbaa !194
  %885 = insertelement <64 x i16> %881, i16 %884, i32 43
  %886 = extractelement <64 x i32> %709, i32 44
  %887 = getelementptr inbounds i16, i16* %6, i32 %886
  %888 = load i16, i16* %887, align 2, !tbaa !194
  %889 = insertelement <64 x i16> %885, i16 %888, i32 44
  %890 = extractelement <64 x i32> %709, i32 45
  %891 = getelementptr inbounds i16, i16* %6, i32 %890
  %892 = load i16, i16* %891, align 2, !tbaa !194
  %893 = insertelement <64 x i16> %889, i16 %892, i32 45
  %894 = extractelement <64 x i32> %709, i32 46
  %895 = getelementptr inbounds i16, i16* %6, i32 %894
  %896 = load i16, i16* %895, align 2, !tbaa !194
  %897 = insertelement <64 x i16> %893, i16 %896, i32 46
  %898 = extractelement <64 x i32> %709, i32 47
  %899 = getelementptr inbounds i16, i16* %6, i32 %898
  %900 = load i16, i16* %899, align 2, !tbaa !194
  %901 = insertelement <64 x i16> %897, i16 %900, i32 47
  %902 = extractelement <64 x i32> %709, i32 48
  %903 = getelementptr inbounds i16, i16* %6, i32 %902
  %904 = load i16, i16* %903, align 2, !tbaa !194
  %905 = insertelement <64 x i16> %901, i16 %904, i32 48
  %906 = extractelement <64 x i32> %709, i32 49
  %907 = getelementptr inbounds i16, i16* %6, i32 %906
  %908 = load i16, i16* %907, align 2, !tbaa !194
  %909 = insertelement <64 x i16> %905, i16 %908, i32 49
  %910 = extractelement <64 x i32> %709, i32 50
  %911 = getelementptr inbounds i16, i16* %6, i32 %910
  %912 = load i16, i16* %911, align 2, !tbaa !194
  %913 = insertelement <64 x i16> %909, i16 %912, i32 50
  %914 = extractelement <64 x i32> %709, i32 51
  %915 = getelementptr inbounds i16, i16* %6, i32 %914
  %916 = load i16, i16* %915, align 2, !tbaa !194
  %917 = insertelement <64 x i16> %913, i16 %916, i32 51
  %918 = extractelement <64 x i32> %709, i32 52
  %919 = getelementptr inbounds i16, i16* %6, i32 %918
  %920 = load i16, i16* %919, align 2, !tbaa !194
  %921 = insertelement <64 x i16> %917, i16 %920, i32 52
  %922 = extractelement <64 x i32> %709, i32 53
  %923 = getelementptr inbounds i16, i16* %6, i32 %922
  %924 = load i16, i16* %923, align 2, !tbaa !194
  %925 = insertelement <64 x i16> %921, i16 %924, i32 53
  %926 = extractelement <64 x i32> %709, i32 54
  %927 = getelementptr inbounds i16, i16* %6, i32 %926
  %928 = load i16, i16* %927, align 2, !tbaa !194
  %929 = insertelement <64 x i16> %925, i16 %928, i32 54
  %930 = extractelement <64 x i32> %709, i32 55
  %931 = getelementptr inbounds i16, i16* %6, i32 %930
  %932 = load i16, i16* %931, align 2, !tbaa !194
  %933 = insertelement <64 x i16> %929, i16 %932, i32 55
  %934 = extractelement <64 x i32> %709, i32 56
  %935 = getelementptr inbounds i16, i16* %6, i32 %934
  %936 = load i16, i16* %935, align 2, !tbaa !194
  %937 = insertelement <64 x i16> %933, i16 %936, i32 56
  %938 = extractelement <64 x i32> %709, i32 57
  %939 = getelementptr inbounds i16, i16* %6, i32 %938
  %940 = load i16, i16* %939, align 2, !tbaa !194
  %941 = insertelement <64 x i16> %937, i16 %940, i32 57
  %942 = extractelement <64 x i32> %709, i32 58
  %943 = getelementptr inbounds i16, i16* %6, i32 %942
  %944 = load i16, i16* %943, align 2, !tbaa !194
  %945 = insertelement <64 x i16> %941, i16 %944, i32 58
  %946 = extractelement <64 x i32> %709, i32 59
  %947 = getelementptr inbounds i16, i16* %6, i32 %946
  %948 = load i16, i16* %947, align 2, !tbaa !194
  %949 = insertelement <64 x i16> %945, i16 %948, i32 59
  %950 = extractelement <64 x i32> %709, i32 60
  %951 = getelementptr inbounds i16, i16* %6, i32 %950
  %952 = load i16, i16* %951, align 2, !tbaa !194
  %953 = insertelement <64 x i16> %949, i16 %952, i32 60
  %954 = extractelement <64 x i32> %709, i32 61
  %955 = getelementptr inbounds i16, i16* %6, i32 %954
  %956 = load i16, i16* %955, align 2, !tbaa !194
  %957 = insertelement <64 x i16> %953, i16 %956, i32 61
  %958 = extractelement <64 x i32> %709, i32 62
  %959 = getelementptr inbounds i16, i16* %6, i32 %958
  %960 = load i16, i16* %959, align 2, !tbaa !194
  %961 = insertelement <64 x i16> %957, i16 %960, i32 62
  %962 = extractelement <64 x i32> %709, i32 63
  %963 = getelementptr inbounds i16, i16* %6, i32 %962
  %964 = load i16, i16* %963, align 2, !tbaa !194
  %965 = insertelement <64 x i16> %961, i16 %964, i32 63
  %966 = load <32 x i32>, <32 x i32>* %60, align 128, !tbaa !113
  %967 = load <32 x i32>, <32 x i32>* %62, align 128, !tbaa !117
  %968 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %967, <32 x i32> %966)
  %969 = bitcast <64 x i16> %965 to <32 x i32>
  %970 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %969) #11
  %971 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %968, <32 x i32> %970, i32 %428) #11
  %972 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %971)
  store <32 x i32> %972, <32 x i32>* %60, align 128, !tbaa !113
  %973 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %971)
  store <32 x i32> %973, <32 x i32>* %62, align 128, !tbaa !117
  %974 = add i32 %154, %31
  %975 = sub i32 %974, %132
  %976 = sub i32 %975, %32
  %977 = add i32 %976, %23
  %978 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %977) #11
  %979 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %978, <32 x i32> %978) #11
  %980 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %128, <64 x i32> %979) #11
  %981 = extractelement <64 x i32> %980, i32 0
  %982 = getelementptr inbounds i16, i16* %6, i32 %981
  %983 = load i16, i16* %982, align 2, !tbaa !194
  %984 = insertelement <64 x i16> undef, i16 %983, i32 0
  %985 = extractelement <64 x i32> %980, i32 1
  %986 = getelementptr inbounds i16, i16* %6, i32 %985
  %987 = load i16, i16* %986, align 2, !tbaa !194
  %988 = insertelement <64 x i16> %984, i16 %987, i32 1
  %989 = extractelement <64 x i32> %980, i32 2
  %990 = getelementptr inbounds i16, i16* %6, i32 %989
  %991 = load i16, i16* %990, align 2, !tbaa !194
  %992 = insertelement <64 x i16> %988, i16 %991, i32 2
  %993 = extractelement <64 x i32> %980, i32 3
  %994 = getelementptr inbounds i16, i16* %6, i32 %993
  %995 = load i16, i16* %994, align 2, !tbaa !194
  %996 = insertelement <64 x i16> %992, i16 %995, i32 3
  %997 = extractelement <64 x i32> %980, i32 4
  %998 = getelementptr inbounds i16, i16* %6, i32 %997
  %999 = load i16, i16* %998, align 2, !tbaa !194
  %1000 = insertelement <64 x i16> %996, i16 %999, i32 4
  %1001 = extractelement <64 x i32> %980, i32 5
  %1002 = getelementptr inbounds i16, i16* %6, i32 %1001
  %1003 = load i16, i16* %1002, align 2, !tbaa !194
  %1004 = insertelement <64 x i16> %1000, i16 %1003, i32 5
  %1005 = extractelement <64 x i32> %980, i32 6
  %1006 = getelementptr inbounds i16, i16* %6, i32 %1005
  %1007 = load i16, i16* %1006, align 2, !tbaa !194
  %1008 = insertelement <64 x i16> %1004, i16 %1007, i32 6
  %1009 = extractelement <64 x i32> %980, i32 7
  %1010 = getelementptr inbounds i16, i16* %6, i32 %1009
  %1011 = load i16, i16* %1010, align 2, !tbaa !194
  %1012 = insertelement <64 x i16> %1008, i16 %1011, i32 7
  %1013 = extractelement <64 x i32> %980, i32 8
  %1014 = getelementptr inbounds i16, i16* %6, i32 %1013
  %1015 = load i16, i16* %1014, align 2, !tbaa !194
  %1016 = insertelement <64 x i16> %1012, i16 %1015, i32 8
  %1017 = extractelement <64 x i32> %980, i32 9
  %1018 = getelementptr inbounds i16, i16* %6, i32 %1017
  %1019 = load i16, i16* %1018, align 2, !tbaa !194
  %1020 = insertelement <64 x i16> %1016, i16 %1019, i32 9
  %1021 = extractelement <64 x i32> %980, i32 10
  %1022 = getelementptr inbounds i16, i16* %6, i32 %1021
  %1023 = load i16, i16* %1022, align 2, !tbaa !194
  %1024 = insertelement <64 x i16> %1020, i16 %1023, i32 10
  %1025 = extractelement <64 x i32> %980, i32 11
  %1026 = getelementptr inbounds i16, i16* %6, i32 %1025
  %1027 = load i16, i16* %1026, align 2, !tbaa !194
  %1028 = insertelement <64 x i16> %1024, i16 %1027, i32 11
  %1029 = extractelement <64 x i32> %980, i32 12
  %1030 = getelementptr inbounds i16, i16* %6, i32 %1029
  %1031 = load i16, i16* %1030, align 2, !tbaa !194
  %1032 = insertelement <64 x i16> %1028, i16 %1031, i32 12
  %1033 = extractelement <64 x i32> %980, i32 13
  %1034 = getelementptr inbounds i16, i16* %6, i32 %1033
  %1035 = load i16, i16* %1034, align 2, !tbaa !194
  %1036 = insertelement <64 x i16> %1032, i16 %1035, i32 13
  %1037 = extractelement <64 x i32> %980, i32 14
  %1038 = getelementptr inbounds i16, i16* %6, i32 %1037
  %1039 = load i16, i16* %1038, align 2, !tbaa !194
  %1040 = insertelement <64 x i16> %1036, i16 %1039, i32 14
  %1041 = extractelement <64 x i32> %980, i32 15
  %1042 = getelementptr inbounds i16, i16* %6, i32 %1041
  %1043 = load i16, i16* %1042, align 2, !tbaa !194
  %1044 = insertelement <64 x i16> %1040, i16 %1043, i32 15
  %1045 = extractelement <64 x i32> %980, i32 16
  %1046 = getelementptr inbounds i16, i16* %6, i32 %1045
  %1047 = load i16, i16* %1046, align 2, !tbaa !194
  %1048 = insertelement <64 x i16> %1044, i16 %1047, i32 16
  %1049 = extractelement <64 x i32> %980, i32 17
  %1050 = getelementptr inbounds i16, i16* %6, i32 %1049
  %1051 = load i16, i16* %1050, align 2, !tbaa !194
  %1052 = insertelement <64 x i16> %1048, i16 %1051, i32 17
  %1053 = extractelement <64 x i32> %980, i32 18
  %1054 = getelementptr inbounds i16, i16* %6, i32 %1053
  %1055 = load i16, i16* %1054, align 2, !tbaa !194
  %1056 = insertelement <64 x i16> %1052, i16 %1055, i32 18
  %1057 = extractelement <64 x i32> %980, i32 19
  %1058 = getelementptr inbounds i16, i16* %6, i32 %1057
  %1059 = load i16, i16* %1058, align 2, !tbaa !194
  %1060 = insertelement <64 x i16> %1056, i16 %1059, i32 19
  %1061 = extractelement <64 x i32> %980, i32 20
  %1062 = getelementptr inbounds i16, i16* %6, i32 %1061
  %1063 = load i16, i16* %1062, align 2, !tbaa !194
  %1064 = insertelement <64 x i16> %1060, i16 %1063, i32 20
  %1065 = extractelement <64 x i32> %980, i32 21
  %1066 = getelementptr inbounds i16, i16* %6, i32 %1065
  %1067 = load i16, i16* %1066, align 2, !tbaa !194
  %1068 = insertelement <64 x i16> %1064, i16 %1067, i32 21
  %1069 = extractelement <64 x i32> %980, i32 22
  %1070 = getelementptr inbounds i16, i16* %6, i32 %1069
  %1071 = load i16, i16* %1070, align 2, !tbaa !194
  %1072 = insertelement <64 x i16> %1068, i16 %1071, i32 22
  %1073 = extractelement <64 x i32> %980, i32 23
  %1074 = getelementptr inbounds i16, i16* %6, i32 %1073
  %1075 = load i16, i16* %1074, align 2, !tbaa !194
  %1076 = insertelement <64 x i16> %1072, i16 %1075, i32 23
  %1077 = extractelement <64 x i32> %980, i32 24
  %1078 = getelementptr inbounds i16, i16* %6, i32 %1077
  %1079 = load i16, i16* %1078, align 2, !tbaa !194
  %1080 = insertelement <64 x i16> %1076, i16 %1079, i32 24
  %1081 = extractelement <64 x i32> %980, i32 25
  %1082 = getelementptr inbounds i16, i16* %6, i32 %1081
  %1083 = load i16, i16* %1082, align 2, !tbaa !194
  %1084 = insertelement <64 x i16> %1080, i16 %1083, i32 25
  %1085 = extractelement <64 x i32> %980, i32 26
  %1086 = getelementptr inbounds i16, i16* %6, i32 %1085
  %1087 = load i16, i16* %1086, align 2, !tbaa !194
  %1088 = insertelement <64 x i16> %1084, i16 %1087, i32 26
  %1089 = extractelement <64 x i32> %980, i32 27
  %1090 = getelementptr inbounds i16, i16* %6, i32 %1089
  %1091 = load i16, i16* %1090, align 2, !tbaa !194
  %1092 = insertelement <64 x i16> %1088, i16 %1091, i32 27
  %1093 = extractelement <64 x i32> %980, i32 28
  %1094 = getelementptr inbounds i16, i16* %6, i32 %1093
  %1095 = load i16, i16* %1094, align 2, !tbaa !194
  %1096 = insertelement <64 x i16> %1092, i16 %1095, i32 28
  %1097 = extractelement <64 x i32> %980, i32 29
  %1098 = getelementptr inbounds i16, i16* %6, i32 %1097
  %1099 = load i16, i16* %1098, align 2, !tbaa !194
  %1100 = insertelement <64 x i16> %1096, i16 %1099, i32 29
  %1101 = extractelement <64 x i32> %980, i32 30
  %1102 = getelementptr inbounds i16, i16* %6, i32 %1101
  %1103 = load i16, i16* %1102, align 2, !tbaa !194
  %1104 = insertelement <64 x i16> %1100, i16 %1103, i32 30
  %1105 = extractelement <64 x i32> %980, i32 31
  %1106 = getelementptr inbounds i16, i16* %6, i32 %1105
  %1107 = load i16, i16* %1106, align 2, !tbaa !194
  %1108 = insertelement <64 x i16> %1104, i16 %1107, i32 31
  %1109 = extractelement <64 x i32> %980, i32 32
  %1110 = getelementptr inbounds i16, i16* %6, i32 %1109
  %1111 = load i16, i16* %1110, align 2, !tbaa !194
  %1112 = insertelement <64 x i16> %1108, i16 %1111, i32 32
  %1113 = extractelement <64 x i32> %980, i32 33
  %1114 = getelementptr inbounds i16, i16* %6, i32 %1113
  %1115 = load i16, i16* %1114, align 2, !tbaa !194
  %1116 = insertelement <64 x i16> %1112, i16 %1115, i32 33
  %1117 = extractelement <64 x i32> %980, i32 34
  %1118 = getelementptr inbounds i16, i16* %6, i32 %1117
  %1119 = load i16, i16* %1118, align 2, !tbaa !194
  %1120 = insertelement <64 x i16> %1116, i16 %1119, i32 34
  %1121 = extractelement <64 x i32> %980, i32 35
  %1122 = getelementptr inbounds i16, i16* %6, i32 %1121
  %1123 = load i16, i16* %1122, align 2, !tbaa !194
  %1124 = insertelement <64 x i16> %1120, i16 %1123, i32 35
  %1125 = extractelement <64 x i32> %980, i32 36
  %1126 = getelementptr inbounds i16, i16* %6, i32 %1125
  %1127 = load i16, i16* %1126, align 2, !tbaa !194
  %1128 = insertelement <64 x i16> %1124, i16 %1127, i32 36
  %1129 = extractelement <64 x i32> %980, i32 37
  %1130 = getelementptr inbounds i16, i16* %6, i32 %1129
  %1131 = load i16, i16* %1130, align 2, !tbaa !194
  %1132 = insertelement <64 x i16> %1128, i16 %1131, i32 37
  %1133 = extractelement <64 x i32> %980, i32 38
  %1134 = getelementptr inbounds i16, i16* %6, i32 %1133
  %1135 = load i16, i16* %1134, align 2, !tbaa !194
  %1136 = insertelement <64 x i16> %1132, i16 %1135, i32 38
  %1137 = extractelement <64 x i32> %980, i32 39
  %1138 = getelementptr inbounds i16, i16* %6, i32 %1137
  %1139 = load i16, i16* %1138, align 2, !tbaa !194
  %1140 = insertelement <64 x i16> %1136, i16 %1139, i32 39
  %1141 = extractelement <64 x i32> %980, i32 40
  %1142 = getelementptr inbounds i16, i16* %6, i32 %1141
  %1143 = load i16, i16* %1142, align 2, !tbaa !194
  %1144 = insertelement <64 x i16> %1140, i16 %1143, i32 40
  %1145 = extractelement <64 x i32> %980, i32 41
  %1146 = getelementptr inbounds i16, i16* %6, i32 %1145
  %1147 = load i16, i16* %1146, align 2, !tbaa !194
  %1148 = insertelement <64 x i16> %1144, i16 %1147, i32 41
  %1149 = extractelement <64 x i32> %980, i32 42
  %1150 = getelementptr inbounds i16, i16* %6, i32 %1149
  %1151 = load i16, i16* %1150, align 2, !tbaa !194
  %1152 = insertelement <64 x i16> %1148, i16 %1151, i32 42
  %1153 = extractelement <64 x i32> %980, i32 43
  %1154 = getelementptr inbounds i16, i16* %6, i32 %1153
  %1155 = load i16, i16* %1154, align 2, !tbaa !194
  %1156 = insertelement <64 x i16> %1152, i16 %1155, i32 43
  %1157 = extractelement <64 x i32> %980, i32 44
  %1158 = getelementptr inbounds i16, i16* %6, i32 %1157
  %1159 = load i16, i16* %1158, align 2, !tbaa !194
  %1160 = insertelement <64 x i16> %1156, i16 %1159, i32 44
  %1161 = extractelement <64 x i32> %980, i32 45
  %1162 = getelementptr inbounds i16, i16* %6, i32 %1161
  %1163 = load i16, i16* %1162, align 2, !tbaa !194
  %1164 = insertelement <64 x i16> %1160, i16 %1163, i32 45
  %1165 = extractelement <64 x i32> %980, i32 46
  %1166 = getelementptr inbounds i16, i16* %6, i32 %1165
  %1167 = load i16, i16* %1166, align 2, !tbaa !194
  %1168 = insertelement <64 x i16> %1164, i16 %1167, i32 46
  %1169 = extractelement <64 x i32> %980, i32 47
  %1170 = getelementptr inbounds i16, i16* %6, i32 %1169
  %1171 = load i16, i16* %1170, align 2, !tbaa !194
  %1172 = insertelement <64 x i16> %1168, i16 %1171, i32 47
  %1173 = extractelement <64 x i32> %980, i32 48
  %1174 = getelementptr inbounds i16, i16* %6, i32 %1173
  %1175 = load i16, i16* %1174, align 2, !tbaa !194
  %1176 = insertelement <64 x i16> %1172, i16 %1175, i32 48
  %1177 = extractelement <64 x i32> %980, i32 49
  %1178 = getelementptr inbounds i16, i16* %6, i32 %1177
  %1179 = load i16, i16* %1178, align 2, !tbaa !194
  %1180 = insertelement <64 x i16> %1176, i16 %1179, i32 49
  %1181 = extractelement <64 x i32> %980, i32 50
  %1182 = getelementptr inbounds i16, i16* %6, i32 %1181
  %1183 = load i16, i16* %1182, align 2, !tbaa !194
  %1184 = insertelement <64 x i16> %1180, i16 %1183, i32 50
  %1185 = extractelement <64 x i32> %980, i32 51
  %1186 = getelementptr inbounds i16, i16* %6, i32 %1185
  %1187 = load i16, i16* %1186, align 2, !tbaa !194
  %1188 = insertelement <64 x i16> %1184, i16 %1187, i32 51
  %1189 = extractelement <64 x i32> %980, i32 52
  %1190 = getelementptr inbounds i16, i16* %6, i32 %1189
  %1191 = load i16, i16* %1190, align 2, !tbaa !194
  %1192 = insertelement <64 x i16> %1188, i16 %1191, i32 52
  %1193 = extractelement <64 x i32> %980, i32 53
  %1194 = getelementptr inbounds i16, i16* %6, i32 %1193
  %1195 = load i16, i16* %1194, align 2, !tbaa !194
  %1196 = insertelement <64 x i16> %1192, i16 %1195, i32 53
  %1197 = extractelement <64 x i32> %980, i32 54
  %1198 = getelementptr inbounds i16, i16* %6, i32 %1197
  %1199 = load i16, i16* %1198, align 2, !tbaa !194
  %1200 = insertelement <64 x i16> %1196, i16 %1199, i32 54
  %1201 = extractelement <64 x i32> %980, i32 55
  %1202 = getelementptr inbounds i16, i16* %6, i32 %1201
  %1203 = load i16, i16* %1202, align 2, !tbaa !194
  %1204 = insertelement <64 x i16> %1200, i16 %1203, i32 55
  %1205 = extractelement <64 x i32> %980, i32 56
  %1206 = getelementptr inbounds i16, i16* %6, i32 %1205
  %1207 = load i16, i16* %1206, align 2, !tbaa !194
  %1208 = insertelement <64 x i16> %1204, i16 %1207, i32 56
  %1209 = extractelement <64 x i32> %980, i32 57
  %1210 = getelementptr inbounds i16, i16* %6, i32 %1209
  %1211 = load i16, i16* %1210, align 2, !tbaa !194
  %1212 = insertelement <64 x i16> %1208, i16 %1211, i32 57
  %1213 = extractelement <64 x i32> %980, i32 58
  %1214 = getelementptr inbounds i16, i16* %6, i32 %1213
  %1215 = load i16, i16* %1214, align 2, !tbaa !194
  %1216 = insertelement <64 x i16> %1212, i16 %1215, i32 58
  %1217 = extractelement <64 x i32> %980, i32 59
  %1218 = getelementptr inbounds i16, i16* %6, i32 %1217
  %1219 = load i16, i16* %1218, align 2, !tbaa !194
  %1220 = insertelement <64 x i16> %1216, i16 %1219, i32 59
  %1221 = extractelement <64 x i32> %980, i32 60
  %1222 = getelementptr inbounds i16, i16* %6, i32 %1221
  %1223 = load i16, i16* %1222, align 2, !tbaa !194
  %1224 = insertelement <64 x i16> %1220, i16 %1223, i32 60
  %1225 = extractelement <64 x i32> %980, i32 61
  %1226 = getelementptr inbounds i16, i16* %6, i32 %1225
  %1227 = load i16, i16* %1226, align 2, !tbaa !194
  %1228 = insertelement <64 x i16> %1224, i16 %1227, i32 61
  %1229 = extractelement <64 x i32> %980, i32 62
  %1230 = getelementptr inbounds i16, i16* %6, i32 %1229
  %1231 = load i16, i16* %1230, align 2, !tbaa !194
  %1232 = insertelement <64 x i16> %1228, i16 %1231, i32 62
  %1233 = extractelement <64 x i32> %980, i32 63
  %1234 = getelementptr inbounds i16, i16* %6, i32 %1233
  %1235 = load i16, i16* %1234, align 2, !tbaa !194
  %1236 = insertelement <64 x i16> %1232, i16 %1235, i32 63
  %1237 = load <32 x i32>, <32 x i32>* %64, align 128, !tbaa !119
  %1238 = load <32 x i32>, <32 x i32>* %66, align 128, !tbaa !122
  %1239 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1238, <32 x i32> %1237)
  %1240 = bitcast <64 x i16> %1236 to <32 x i32>
  %1241 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %1240) #11
  %1242 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1239, <32 x i32> %1241, i32 %428) #11
  %1243 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1242)
  store <32 x i32> %1243, <32 x i32>* %64, align 128, !tbaa !119
  %1244 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1242)
  store <32 x i32> %1244, <32 x i32>* %66, align 128, !tbaa !122
  %1245 = add i32 %t144.us.us.us, %149
  %1246 = getelementptr inbounds i16, i16* %1, i32 %1245
  %1247 = load i16, i16* %1246, align 2, !tbaa !196
  %1248 = load <32 x i32>, <32 x i32>* %68, align 128, !tbaa !124
  %1249 = load <32 x i32>, <32 x i32>* %70, align 128, !tbaa !129
  %1250 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1249, <32 x i32> %1248)
  %1251 = zext i16 %1247 to i32
  %1252 = shl nuw i32 %1251, 16
  %1253 = or i32 %1252, %1251
  %1254 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1250, <32 x i32> %425, i32 %1253) #11
  %1255 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1254)
  store <32 x i32> %1255, <32 x i32>* %68, align 128, !tbaa !124
  %1256 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1254)
  store <32 x i32> %1256, <32 x i32>* %70, align 128, !tbaa !129
  %1257 = load <32 x i32>, <32 x i32>* %72, align 128, !tbaa !131
  %1258 = load <32 x i32>, <32 x i32>* %74, align 128, !tbaa !134
  %1259 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1258, <32 x i32> %1257)
  %1260 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1259, <32 x i32> %699, i32 %1253) #11
  %1261 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1260)
  store <32 x i32> %1261, <32 x i32>* %72, align 128, !tbaa !131
  %1262 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1260)
  store <32 x i32> %1262, <32 x i32>* %74, align 128, !tbaa !134
  %1263 = load <32 x i32>, <32 x i32>* %76, align 128, !tbaa !136
  %1264 = load <32 x i32>, <32 x i32>* %78, align 128, !tbaa !140
  %1265 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1264, <32 x i32> %1263)
  %1266 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1265, <32 x i32> %970, i32 %1253) #11
  %1267 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1266)
  store <32 x i32> %1267, <32 x i32>* %76, align 128, !tbaa !136
  %1268 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1266)
  store <32 x i32> %1268, <32 x i32>* %78, align 128, !tbaa !140
  %1269 = load <32 x i32>, <32 x i32>* %80, align 128, !tbaa !142
  %1270 = load <32 x i32>, <32 x i32>* %82, align 128, !tbaa !145
  %1271 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1270, <32 x i32> %1269)
  %1272 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1271, <32 x i32> %1241, i32 %1253) #11
  %1273 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1272)
  store <32 x i32> %1273, <32 x i32>* %80, align 128, !tbaa !142
  %1274 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1272)
  store <32 x i32> %1274, <32 x i32>* %82, align 128, !tbaa !145
  %1275 = add i32 %t144.us.us.us, %146
  %1276 = getelementptr inbounds i16, i16* %1, i32 %1275
  %1277 = load i16, i16* %1276, align 2, !tbaa !196
  %1278 = load <32 x i32>, <32 x i32>* %84, align 128, !tbaa !147
  %1279 = load <32 x i32>, <32 x i32>* %86, align 128, !tbaa !153
  %1280 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1279, <32 x i32> %1278)
  %1281 = zext i16 %1277 to i32
  %1282 = shl nuw i32 %1281, 16
  %1283 = or i32 %1282, %1281
  %1284 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1280, <32 x i32> %425, i32 %1283) #11
  %1285 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1284)
  store <32 x i32> %1285, <32 x i32>* %84, align 128, !tbaa !147
  %1286 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1284)
  store <32 x i32> %1286, <32 x i32>* %86, align 128, !tbaa !153
  %1287 = load <32 x i32>, <32 x i32>* %88, align 128, !tbaa !155
  %1288 = load <32 x i32>, <32 x i32>* %90, align 128, !tbaa !158
  %1289 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1288, <32 x i32> %1287)
  %1290 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1289, <32 x i32> %699, i32 %1283) #11
  %1291 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1290)
  store <32 x i32> %1291, <32 x i32>* %88, align 128, !tbaa !155
  %1292 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1290)
  store <32 x i32> %1292, <32 x i32>* %90, align 128, !tbaa !158
  %1293 = load <32 x i32>, <32 x i32>* %92, align 128, !tbaa !160
  %1294 = load <32 x i32>, <32 x i32>* %94, align 128, !tbaa !164
  %1295 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1294, <32 x i32> %1293)
  %1296 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1295, <32 x i32> %970, i32 %1283) #11
  %1297 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1296)
  store <32 x i32> %1297, <32 x i32>* %92, align 128, !tbaa !160
  %1298 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1296)
  store <32 x i32> %1298, <32 x i32>* %94, align 128, !tbaa !164
  %1299 = load <32 x i32>, <32 x i32>* %96, align 128, !tbaa !166
  %1300 = load <32 x i32>, <32 x i32>* %98, align 128, !tbaa !169
  %1301 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1300, <32 x i32> %1299)
  %1302 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1301, <32 x i32> %1241, i32 %1283) #11
  %1303 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1302)
  store <32 x i32> %1303, <32 x i32>* %96, align 128, !tbaa !166
  %1304 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1302)
  store <32 x i32> %1304, <32 x i32>* %98, align 128, !tbaa !169
  %1305 = add i32 %t144.us.us.us, %143
  %1306 = getelementptr inbounds i16, i16* %1, i32 %1305
  %1307 = load i16, i16* %1306, align 2, !tbaa !196
  %1308 = load <32 x i32>, <32 x i32>* %100, align 128, !tbaa !171
  %1309 = load <32 x i32>, <32 x i32>* %102, align 128, !tbaa !176
  %1310 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1309, <32 x i32> %1308)
  %1311 = zext i16 %1307 to i32
  %1312 = shl nuw i32 %1311, 16
  %1313 = or i32 %1312, %1311
  %1314 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1310, <32 x i32> %425, i32 %1313) #11
  %1315 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1314)
  store <32 x i32> %1315, <32 x i32>* %100, align 128, !tbaa !171
  %1316 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1314)
  store <32 x i32> %1316, <32 x i32>* %102, align 128, !tbaa !176
  %1317 = load <32 x i32>, <32 x i32>* %104, align 128, !tbaa !178
  %1318 = load <32 x i32>, <32 x i32>* %106, align 128, !tbaa !181
  %1319 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1318, <32 x i32> %1317)
  %1320 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1319, <32 x i32> %699, i32 %1313) #11
  %1321 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1320)
  store <32 x i32> %1321, <32 x i32>* %104, align 128, !tbaa !178
  %1322 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1320)
  store <32 x i32> %1322, <32 x i32>* %106, align 128, !tbaa !181
  %1323 = load <32 x i32>, <32 x i32>* %108, align 128, !tbaa !183
  %1324 = load <32 x i32>, <32 x i32>* %110, align 128, !tbaa !187
  %1325 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1324, <32 x i32> %1323)
  %1326 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1325, <32 x i32> %970, i32 %1313) #11
  %1327 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1326)
  store <32 x i32> %1327, <32 x i32>* %108, align 128, !tbaa !183
  %1328 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1326)
  store <32 x i32> %1328, <32 x i32>* %110, align 128, !tbaa !187
  %1329 = load <32 x i32>, <32 x i32>* %112, align 128, !tbaa !189
  %1330 = load <32 x i32>, <32 x i32>* %114, align 128, !tbaa !192
  %1331 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1330, <32 x i32> %1329)
  %1332 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %1331, <32 x i32> %1241, i32 %1313) #11
  %1333 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1332)
  store <32 x i32> %1333, <32 x i32>* %112, align 128, !tbaa !189
  %1334 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1332)
  store <32 x i32> %1334, <32 x i32>* %114, align 128, !tbaa !192
  %1335 = add nuw nsw i32 %"matrix_mul1.s1.r14$x.us.us.us", 1
  %.not6.us.us.us = icmp eq i32 %1335, 256
  br i1 %.not6.us.us.us, label %"produce matrix_mul2.us.us.us", label %"for matrix_mul1.s1.r14$x.us.us.us"

"produce matrix_mul2.us.us.us":                   ; preds = %"for matrix_mul1.s1.r14$x.us.us.us"
  %output.s0.x.xi.base.s.us.us.us = select i1 %152, i32 %a8.us.us.us, i32 %b10
  %1336 = add nsw i32 %output.s0.x.xi.base.s.us.us.us, %25
  %reass.add112.us.us.us = sub i32 %1336, %40
  %reass.mul113.us.us.us = mul i32 %reass.add112.us.us.us, %16
  %1337 = load i32, i32* %137, align 4, !tbaa !198
  br label %"for matrix_mul2.s1.r14$x.us.us.us"

"for matrix_mul2.s1.r14$x.us.us.us":              ; preds = %"for matrix_mul2.s1.r14$x.us.us.us", %"produce matrix_mul2.us.us.us"
  %matrix_mul23.sroa.28.0.us.us.us = phi <32 x i32> [ %123, %"produce matrix_mul2.us.us.us" ], [ %1653, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %matrix_mul23.sroa.24.0.us.us.us = phi <32 x i32> [ %122, %"produce matrix_mul2.us.us.us" ], [ %1652, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %matrix_mul23.sroa.20.0.us.us.us = phi <32 x i32> [ %123, %"produce matrix_mul2.us.us.us" ], [ %1640, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %matrix_mul23.sroa.16.0.us.us.us = phi <32 x i32> [ %122, %"produce matrix_mul2.us.us.us" ], [ %1639, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %matrix_mul23.sroa.12.0.us.us.us = phi <32 x i32> [ %123, %"produce matrix_mul2.us.us.us" ], [ %1627, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %matrix_mul23.sroa.8.0.us.us.us = phi <32 x i32> [ %122, %"produce matrix_mul2.us.us.us" ], [ %1626, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %matrix_mul23.sroa.4.0.us.us.us = phi <32 x i32> [ %123, %"produce matrix_mul2.us.us.us" ], [ %1614, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %matrix_mul23.sroa.0.0.us.us.us = phi <32 x i32> [ %122, %"produce matrix_mul2.us.us.us" ], [ %1613, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %"matrix_mul2.s1.r14$x.us.us.us" = phi i32 [ 0, %"produce matrix_mul2.us.us.us" ], [ %1654, %"for matrix_mul2.s1.r14$x.us.us.us" ]
  %1338 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %matrix_mul23.sroa.4.0.us.us.us, <32 x i32> %matrix_mul23.sroa.0.0.us.us.us)
  %reass.add110.us.us.us = sub i32 %"matrix_mul2.s1.r14$x.us.us.us", %39
  %reass.mul111.us.us.us = mul i32 %reass.add110.us.us.us, %17
  %t156.us.us.us = add i32 %135, %reass.mul111.us.us.us
  %1339 = add i32 %t156.us.us.us, %reass.mul113.us.us.us
  %1340 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %1339) #11
  %1341 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1340, <32 x i32> %1340) #11
  %1342 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %131, <64 x i32> %1341) #11
  %1343 = extractelement <64 x i32> %1342, i32 0
  %1344 = getelementptr inbounds i16, i16* %14, i32 %1343
  %1345 = load i16, i16* %1344, align 2, !tbaa !200
  %1346 = insertelement <64 x i16> undef, i16 %1345, i32 0
  %1347 = extractelement <64 x i32> %1342, i32 1
  %1348 = getelementptr inbounds i16, i16* %14, i32 %1347
  %1349 = load i16, i16* %1348, align 2, !tbaa !200
  %1350 = insertelement <64 x i16> %1346, i16 %1349, i32 1
  %1351 = extractelement <64 x i32> %1342, i32 2
  %1352 = getelementptr inbounds i16, i16* %14, i32 %1351
  %1353 = load i16, i16* %1352, align 2, !tbaa !200
  %1354 = insertelement <64 x i16> %1350, i16 %1353, i32 2
  %1355 = extractelement <64 x i32> %1342, i32 3
  %1356 = getelementptr inbounds i16, i16* %14, i32 %1355
  %1357 = load i16, i16* %1356, align 2, !tbaa !200
  %1358 = insertelement <64 x i16> %1354, i16 %1357, i32 3
  %1359 = extractelement <64 x i32> %1342, i32 4
  %1360 = getelementptr inbounds i16, i16* %14, i32 %1359
  %1361 = load i16, i16* %1360, align 2, !tbaa !200
  %1362 = insertelement <64 x i16> %1358, i16 %1361, i32 4
  %1363 = extractelement <64 x i32> %1342, i32 5
  %1364 = getelementptr inbounds i16, i16* %14, i32 %1363
  %1365 = load i16, i16* %1364, align 2, !tbaa !200
  %1366 = insertelement <64 x i16> %1362, i16 %1365, i32 5
  %1367 = extractelement <64 x i32> %1342, i32 6
  %1368 = getelementptr inbounds i16, i16* %14, i32 %1367
  %1369 = load i16, i16* %1368, align 2, !tbaa !200
  %1370 = insertelement <64 x i16> %1366, i16 %1369, i32 6
  %1371 = extractelement <64 x i32> %1342, i32 7
  %1372 = getelementptr inbounds i16, i16* %14, i32 %1371
  %1373 = load i16, i16* %1372, align 2, !tbaa !200
  %1374 = insertelement <64 x i16> %1370, i16 %1373, i32 7
  %1375 = extractelement <64 x i32> %1342, i32 8
  %1376 = getelementptr inbounds i16, i16* %14, i32 %1375
  %1377 = load i16, i16* %1376, align 2, !tbaa !200
  %1378 = insertelement <64 x i16> %1374, i16 %1377, i32 8
  %1379 = extractelement <64 x i32> %1342, i32 9
  %1380 = getelementptr inbounds i16, i16* %14, i32 %1379
  %1381 = load i16, i16* %1380, align 2, !tbaa !200
  %1382 = insertelement <64 x i16> %1378, i16 %1381, i32 9
  %1383 = extractelement <64 x i32> %1342, i32 10
  %1384 = getelementptr inbounds i16, i16* %14, i32 %1383
  %1385 = load i16, i16* %1384, align 2, !tbaa !200
  %1386 = insertelement <64 x i16> %1382, i16 %1385, i32 10
  %1387 = extractelement <64 x i32> %1342, i32 11
  %1388 = getelementptr inbounds i16, i16* %14, i32 %1387
  %1389 = load i16, i16* %1388, align 2, !tbaa !200
  %1390 = insertelement <64 x i16> %1386, i16 %1389, i32 11
  %1391 = extractelement <64 x i32> %1342, i32 12
  %1392 = getelementptr inbounds i16, i16* %14, i32 %1391
  %1393 = load i16, i16* %1392, align 2, !tbaa !200
  %1394 = insertelement <64 x i16> %1390, i16 %1393, i32 12
  %1395 = extractelement <64 x i32> %1342, i32 13
  %1396 = getelementptr inbounds i16, i16* %14, i32 %1395
  %1397 = load i16, i16* %1396, align 2, !tbaa !200
  %1398 = insertelement <64 x i16> %1394, i16 %1397, i32 13
  %1399 = extractelement <64 x i32> %1342, i32 14
  %1400 = getelementptr inbounds i16, i16* %14, i32 %1399
  %1401 = load i16, i16* %1400, align 2, !tbaa !200
  %1402 = insertelement <64 x i16> %1398, i16 %1401, i32 14
  %1403 = extractelement <64 x i32> %1342, i32 15
  %1404 = getelementptr inbounds i16, i16* %14, i32 %1403
  %1405 = load i16, i16* %1404, align 2, !tbaa !200
  %1406 = insertelement <64 x i16> %1402, i16 %1405, i32 15
  %1407 = extractelement <64 x i32> %1342, i32 16
  %1408 = getelementptr inbounds i16, i16* %14, i32 %1407
  %1409 = load i16, i16* %1408, align 2, !tbaa !200
  %1410 = insertelement <64 x i16> %1406, i16 %1409, i32 16
  %1411 = extractelement <64 x i32> %1342, i32 17
  %1412 = getelementptr inbounds i16, i16* %14, i32 %1411
  %1413 = load i16, i16* %1412, align 2, !tbaa !200
  %1414 = insertelement <64 x i16> %1410, i16 %1413, i32 17
  %1415 = extractelement <64 x i32> %1342, i32 18
  %1416 = getelementptr inbounds i16, i16* %14, i32 %1415
  %1417 = load i16, i16* %1416, align 2, !tbaa !200
  %1418 = insertelement <64 x i16> %1414, i16 %1417, i32 18
  %1419 = extractelement <64 x i32> %1342, i32 19
  %1420 = getelementptr inbounds i16, i16* %14, i32 %1419
  %1421 = load i16, i16* %1420, align 2, !tbaa !200
  %1422 = insertelement <64 x i16> %1418, i16 %1421, i32 19
  %1423 = extractelement <64 x i32> %1342, i32 20
  %1424 = getelementptr inbounds i16, i16* %14, i32 %1423
  %1425 = load i16, i16* %1424, align 2, !tbaa !200
  %1426 = insertelement <64 x i16> %1422, i16 %1425, i32 20
  %1427 = extractelement <64 x i32> %1342, i32 21
  %1428 = getelementptr inbounds i16, i16* %14, i32 %1427
  %1429 = load i16, i16* %1428, align 2, !tbaa !200
  %1430 = insertelement <64 x i16> %1426, i16 %1429, i32 21
  %1431 = extractelement <64 x i32> %1342, i32 22
  %1432 = getelementptr inbounds i16, i16* %14, i32 %1431
  %1433 = load i16, i16* %1432, align 2, !tbaa !200
  %1434 = insertelement <64 x i16> %1430, i16 %1433, i32 22
  %1435 = extractelement <64 x i32> %1342, i32 23
  %1436 = getelementptr inbounds i16, i16* %14, i32 %1435
  %1437 = load i16, i16* %1436, align 2, !tbaa !200
  %1438 = insertelement <64 x i16> %1434, i16 %1437, i32 23
  %1439 = extractelement <64 x i32> %1342, i32 24
  %1440 = getelementptr inbounds i16, i16* %14, i32 %1439
  %1441 = load i16, i16* %1440, align 2, !tbaa !200
  %1442 = insertelement <64 x i16> %1438, i16 %1441, i32 24
  %1443 = extractelement <64 x i32> %1342, i32 25
  %1444 = getelementptr inbounds i16, i16* %14, i32 %1443
  %1445 = load i16, i16* %1444, align 2, !tbaa !200
  %1446 = insertelement <64 x i16> %1442, i16 %1445, i32 25
  %1447 = extractelement <64 x i32> %1342, i32 26
  %1448 = getelementptr inbounds i16, i16* %14, i32 %1447
  %1449 = load i16, i16* %1448, align 2, !tbaa !200
  %1450 = insertelement <64 x i16> %1446, i16 %1449, i32 26
  %1451 = extractelement <64 x i32> %1342, i32 27
  %1452 = getelementptr inbounds i16, i16* %14, i32 %1451
  %1453 = load i16, i16* %1452, align 2, !tbaa !200
  %1454 = insertelement <64 x i16> %1450, i16 %1453, i32 27
  %1455 = extractelement <64 x i32> %1342, i32 28
  %1456 = getelementptr inbounds i16, i16* %14, i32 %1455
  %1457 = load i16, i16* %1456, align 2, !tbaa !200
  %1458 = insertelement <64 x i16> %1454, i16 %1457, i32 28
  %1459 = extractelement <64 x i32> %1342, i32 29
  %1460 = getelementptr inbounds i16, i16* %14, i32 %1459
  %1461 = load i16, i16* %1460, align 2, !tbaa !200
  %1462 = insertelement <64 x i16> %1458, i16 %1461, i32 29
  %1463 = extractelement <64 x i32> %1342, i32 30
  %1464 = getelementptr inbounds i16, i16* %14, i32 %1463
  %1465 = load i16, i16* %1464, align 2, !tbaa !200
  %1466 = insertelement <64 x i16> %1462, i16 %1465, i32 30
  %1467 = extractelement <64 x i32> %1342, i32 31
  %1468 = getelementptr inbounds i16, i16* %14, i32 %1467
  %1469 = load i16, i16* %1468, align 2, !tbaa !200
  %1470 = insertelement <64 x i16> %1466, i16 %1469, i32 31
  %1471 = extractelement <64 x i32> %1342, i32 32
  %1472 = getelementptr inbounds i16, i16* %14, i32 %1471
  %1473 = load i16, i16* %1472, align 2, !tbaa !200
  %1474 = insertelement <64 x i16> %1470, i16 %1473, i32 32
  %1475 = extractelement <64 x i32> %1342, i32 33
  %1476 = getelementptr inbounds i16, i16* %14, i32 %1475
  %1477 = load i16, i16* %1476, align 2, !tbaa !200
  %1478 = insertelement <64 x i16> %1474, i16 %1477, i32 33
  %1479 = extractelement <64 x i32> %1342, i32 34
  %1480 = getelementptr inbounds i16, i16* %14, i32 %1479
  %1481 = load i16, i16* %1480, align 2, !tbaa !200
  %1482 = insertelement <64 x i16> %1478, i16 %1481, i32 34
  %1483 = extractelement <64 x i32> %1342, i32 35
  %1484 = getelementptr inbounds i16, i16* %14, i32 %1483
  %1485 = load i16, i16* %1484, align 2, !tbaa !200
  %1486 = insertelement <64 x i16> %1482, i16 %1485, i32 35
  %1487 = extractelement <64 x i32> %1342, i32 36
  %1488 = getelementptr inbounds i16, i16* %14, i32 %1487
  %1489 = load i16, i16* %1488, align 2, !tbaa !200
  %1490 = insertelement <64 x i16> %1486, i16 %1489, i32 36
  %1491 = extractelement <64 x i32> %1342, i32 37
  %1492 = getelementptr inbounds i16, i16* %14, i32 %1491
  %1493 = load i16, i16* %1492, align 2, !tbaa !200
  %1494 = insertelement <64 x i16> %1490, i16 %1493, i32 37
  %1495 = extractelement <64 x i32> %1342, i32 38
  %1496 = getelementptr inbounds i16, i16* %14, i32 %1495
  %1497 = load i16, i16* %1496, align 2, !tbaa !200
  %1498 = insertelement <64 x i16> %1494, i16 %1497, i32 38
  %1499 = extractelement <64 x i32> %1342, i32 39
  %1500 = getelementptr inbounds i16, i16* %14, i32 %1499
  %1501 = load i16, i16* %1500, align 2, !tbaa !200
  %1502 = insertelement <64 x i16> %1498, i16 %1501, i32 39
  %1503 = extractelement <64 x i32> %1342, i32 40
  %1504 = getelementptr inbounds i16, i16* %14, i32 %1503
  %1505 = load i16, i16* %1504, align 2, !tbaa !200
  %1506 = insertelement <64 x i16> %1502, i16 %1505, i32 40
  %1507 = extractelement <64 x i32> %1342, i32 41
  %1508 = getelementptr inbounds i16, i16* %14, i32 %1507
  %1509 = load i16, i16* %1508, align 2, !tbaa !200
  %1510 = insertelement <64 x i16> %1506, i16 %1509, i32 41
  %1511 = extractelement <64 x i32> %1342, i32 42
  %1512 = getelementptr inbounds i16, i16* %14, i32 %1511
  %1513 = load i16, i16* %1512, align 2, !tbaa !200
  %1514 = insertelement <64 x i16> %1510, i16 %1513, i32 42
  %1515 = extractelement <64 x i32> %1342, i32 43
  %1516 = getelementptr inbounds i16, i16* %14, i32 %1515
  %1517 = load i16, i16* %1516, align 2, !tbaa !200
  %1518 = insertelement <64 x i16> %1514, i16 %1517, i32 43
  %1519 = extractelement <64 x i32> %1342, i32 44
  %1520 = getelementptr inbounds i16, i16* %14, i32 %1519
  %1521 = load i16, i16* %1520, align 2, !tbaa !200
  %1522 = insertelement <64 x i16> %1518, i16 %1521, i32 44
  %1523 = extractelement <64 x i32> %1342, i32 45
  %1524 = getelementptr inbounds i16, i16* %14, i32 %1523
  %1525 = load i16, i16* %1524, align 2, !tbaa !200
  %1526 = insertelement <64 x i16> %1522, i16 %1525, i32 45
  %1527 = extractelement <64 x i32> %1342, i32 46
  %1528 = getelementptr inbounds i16, i16* %14, i32 %1527
  %1529 = load i16, i16* %1528, align 2, !tbaa !200
  %1530 = insertelement <64 x i16> %1526, i16 %1529, i32 46
  %1531 = extractelement <64 x i32> %1342, i32 47
  %1532 = getelementptr inbounds i16, i16* %14, i32 %1531
  %1533 = load i16, i16* %1532, align 2, !tbaa !200
  %1534 = insertelement <64 x i16> %1530, i16 %1533, i32 47
  %1535 = extractelement <64 x i32> %1342, i32 48
  %1536 = getelementptr inbounds i16, i16* %14, i32 %1535
  %1537 = load i16, i16* %1536, align 2, !tbaa !200
  %1538 = insertelement <64 x i16> %1534, i16 %1537, i32 48
  %1539 = extractelement <64 x i32> %1342, i32 49
  %1540 = getelementptr inbounds i16, i16* %14, i32 %1539
  %1541 = load i16, i16* %1540, align 2, !tbaa !200
  %1542 = insertelement <64 x i16> %1538, i16 %1541, i32 49
  %1543 = extractelement <64 x i32> %1342, i32 50
  %1544 = getelementptr inbounds i16, i16* %14, i32 %1543
  %1545 = load i16, i16* %1544, align 2, !tbaa !200
  %1546 = insertelement <64 x i16> %1542, i16 %1545, i32 50
  %1547 = extractelement <64 x i32> %1342, i32 51
  %1548 = getelementptr inbounds i16, i16* %14, i32 %1547
  %1549 = load i16, i16* %1548, align 2, !tbaa !200
  %1550 = insertelement <64 x i16> %1546, i16 %1549, i32 51
  %1551 = extractelement <64 x i32> %1342, i32 52
  %1552 = getelementptr inbounds i16, i16* %14, i32 %1551
  %1553 = load i16, i16* %1552, align 2, !tbaa !200
  %1554 = insertelement <64 x i16> %1550, i16 %1553, i32 52
  %1555 = extractelement <64 x i32> %1342, i32 53
  %1556 = getelementptr inbounds i16, i16* %14, i32 %1555
  %1557 = load i16, i16* %1556, align 2, !tbaa !200
  %1558 = insertelement <64 x i16> %1554, i16 %1557, i32 53
  %1559 = extractelement <64 x i32> %1342, i32 54
  %1560 = getelementptr inbounds i16, i16* %14, i32 %1559
  %1561 = load i16, i16* %1560, align 2, !tbaa !200
  %1562 = insertelement <64 x i16> %1558, i16 %1561, i32 54
  %1563 = extractelement <64 x i32> %1342, i32 55
  %1564 = getelementptr inbounds i16, i16* %14, i32 %1563
  %1565 = load i16, i16* %1564, align 2, !tbaa !200
  %1566 = insertelement <64 x i16> %1562, i16 %1565, i32 55
  %1567 = extractelement <64 x i32> %1342, i32 56
  %1568 = getelementptr inbounds i16, i16* %14, i32 %1567
  %1569 = load i16, i16* %1568, align 2, !tbaa !200
  %1570 = insertelement <64 x i16> %1566, i16 %1569, i32 56
  %1571 = extractelement <64 x i32> %1342, i32 57
  %1572 = getelementptr inbounds i16, i16* %14, i32 %1571
  %1573 = load i16, i16* %1572, align 2, !tbaa !200
  %1574 = insertelement <64 x i16> %1570, i16 %1573, i32 57
  %1575 = extractelement <64 x i32> %1342, i32 58
  %1576 = getelementptr inbounds i16, i16* %14, i32 %1575
  %1577 = load i16, i16* %1576, align 2, !tbaa !200
  %1578 = insertelement <64 x i16> %1574, i16 %1577, i32 58
  %1579 = extractelement <64 x i32> %1342, i32 59
  %1580 = getelementptr inbounds i16, i16* %14, i32 %1579
  %1581 = load i16, i16* %1580, align 2, !tbaa !200
  %1582 = insertelement <64 x i16> %1578, i16 %1581, i32 59
  %1583 = extractelement <64 x i32> %1342, i32 60
  %1584 = getelementptr inbounds i16, i16* %14, i32 %1583
  %1585 = load i16, i16* %1584, align 2, !tbaa !200
  %1586 = insertelement <64 x i16> %1582, i16 %1585, i32 60
  %1587 = extractelement <64 x i32> %1342, i32 61
  %1588 = getelementptr inbounds i16, i16* %14, i32 %1587
  %1589 = load i16, i16* %1588, align 2, !tbaa !200
  %1590 = insertelement <64 x i16> %1586, i16 %1589, i32 61
  %1591 = extractelement <64 x i32> %1342, i32 62
  %1592 = getelementptr inbounds i16, i16* %14, i32 %1591
  %1593 = load i16, i16* %1592, align 2, !tbaa !200
  %1594 = insertelement <64 x i16> %1590, i16 %1593, i32 62
  %1595 = extractelement <64 x i32> %1342, i32 63
  %1596 = getelementptr inbounds i16, i16* %14, i32 %1595
  %1597 = load i16, i16* %1596, align 2, !tbaa !200
  %1598 = insertelement <64 x i16> %1594, i16 %1597, i32 63
  %1599 = bitcast <64 x i16> %1598 to <32 x i32>
  %1600 = tail call <64 x i32> @llvm.hexagon.V6.vsh.128B(<32 x i32> %1599) #11
  %1601 = getelementptr inbounds [1024 x i32], [1024 x i32]* %matrix_mul14, i32 0, i32 %"matrix_mul2.s1.r14$x.us.us.us"
  %1602 = load i32, i32* %1601, align 4, !tbaa !202
  %a10.us.us.us = add nsw i32 %1602, %1337
  %1603 = icmp sgt i32 %a10.us.us.us, 0
  %1604 = select i1 %1603, i32 %a10.us.us.us, i32 0
  %1605 = insertelement <64 x i32> undef, i32 %1604, i32 0
  %1606 = shufflevector <64 x i32> %1605, <64 x i32> undef, <64 x i32> zeroinitializer
  %1607 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1600)
  %1608 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1606)
  %ab1.i73.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1607, <32 x i32> %1608) #11
  %ab.i74.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i73.us.us.us, <32 x i32> %1607, <32 x i32> %1608) #11
  %1609 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1600)
  %1610 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1606)
  %ab1.i75.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1609, <32 x i32> %1610) #11
  %ab.i76.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i75.us.us.us, <32 x i32> %1609, <32 x i32> %1610) #11
  %1611 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %ab.i76.us.us.us, <32 x i32> %ab.i74.us.us.us)
  %1612 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %1611, <64 x i32> %1338) #11
  %1613 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1612)
  %1614 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1612)
  %1615 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %matrix_mul23.sroa.12.0.us.us.us, <32 x i32> %matrix_mul23.sroa.8.0.us.us.us)
  %1616 = getelementptr inbounds i32, i32* %1601, i32 256
  %1617 = load i32, i32* %1616, align 4, !tbaa !202
  %a11.us.us.us = add nsw i32 %1617, %1337
  %1618 = icmp sgt i32 %a11.us.us.us, 0
  %1619 = select i1 %1618, i32 %a11.us.us.us, i32 0
  %1620 = insertelement <64 x i32> undef, i32 %1619, i32 0
  %1621 = shufflevector <64 x i32> %1620, <64 x i32> undef, <64 x i32> zeroinitializer
  %1622 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1621)
  %ab1.i77.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1607, <32 x i32> %1622) #11
  %ab.i78.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i77.us.us.us, <32 x i32> %1607, <32 x i32> %1622) #11
  %1623 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1621)
  %ab1.i79.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1609, <32 x i32> %1623) #11
  %ab.i80.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i79.us.us.us, <32 x i32> %1609, <32 x i32> %1623) #11
  %1624 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %ab.i80.us.us.us, <32 x i32> %ab.i78.us.us.us)
  %1625 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %1624, <64 x i32> %1615) #11
  %1626 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1625)
  %1627 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1625)
  %1628 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %matrix_mul23.sroa.20.0.us.us.us, <32 x i32> %matrix_mul23.sroa.16.0.us.us.us)
  %1629 = getelementptr inbounds i32, i32* %1601, i32 512
  %1630 = load i32, i32* %1629, align 4, !tbaa !202
  %a12.us.us.us = add nsw i32 %1630, %1337
  %1631 = icmp sgt i32 %a12.us.us.us, 0
  %1632 = select i1 %1631, i32 %a12.us.us.us, i32 0
  %1633 = insertelement <64 x i32> undef, i32 %1632, i32 0
  %1634 = shufflevector <64 x i32> %1633, <64 x i32> undef, <64 x i32> zeroinitializer
  %1635 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1634)
  %ab1.i81.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1607, <32 x i32> %1635) #11
  %ab.i82.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i81.us.us.us, <32 x i32> %1607, <32 x i32> %1635) #11
  %1636 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1634)
  %ab1.i83.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1609, <32 x i32> %1636) #11
  %ab.i84.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i83.us.us.us, <32 x i32> %1609, <32 x i32> %1636) #11
  %1637 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %ab.i84.us.us.us, <32 x i32> %ab.i82.us.us.us)
  %1638 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %1637, <64 x i32> %1628) #11
  %1639 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1638)
  %1640 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1638)
  %1641 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %matrix_mul23.sroa.28.0.us.us.us, <32 x i32> %matrix_mul23.sroa.24.0.us.us.us)
  %1642 = getelementptr inbounds i32, i32* %1601, i32 768
  %1643 = load i32, i32* %1642, align 4, !tbaa !202
  %a13.us.us.us = add nsw i32 %1643, %1337
  %1644 = icmp sgt i32 %a13.us.us.us, 0
  %1645 = select i1 %1644, i32 %a13.us.us.us, i32 0
  %1646 = insertelement <64 x i32> undef, i32 %1645, i32 0
  %1647 = shufflevector <64 x i32> %1646, <64 x i32> undef, <64 x i32> zeroinitializer
  %1648 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1647)
  %ab1.i85.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1607, <32 x i32> %1648) #11
  %ab.i86.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i85.us.us.us, <32 x i32> %1607, <32 x i32> %1648) #11
  %1649 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1647)
  %ab1.i87.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyieoh.128B(<32 x i32> %1609, <32 x i32> %1649) #11
  %ab.i88.us.us.us = tail call <32 x i32> @llvm.hexagon.V6.vmpyiewuh.acc.128B(<32 x i32> %ab1.i87.us.us.us, <32 x i32> %1609, <32 x i32> %1649) #11
  %1650 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %ab.i88.us.us.us, <32 x i32> %ab.i86.us.us.us)
  %1651 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %1650, <64 x i32> %1641) #11
  %1652 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1651)
  %1653 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1651)
  %1654 = add nuw nsw i32 %"matrix_mul2.s1.r14$x.us.us.us", 1
  %.not7.us.us.us = icmp eq i32 %1654, 256
  br i1 %.not7.us.us.us, label %"consume matrix_mul2.us.us.us", label %"for matrix_mul2.s1.r14$x.us.us.us"

"consume matrix_mul2.us.us.us":                   ; preds = %"for matrix_mul2.s1.r14$x.us.us.us"
  %1655 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1614, <32 x i32> %1613)
  %1656 = mul nsw i32 %1336, %27
  %1657 = add nsw i32 %t148.us.us.us, %1656
  %1658 = getelementptr inbounds i32, i32* %21, i32 %1657
  %1659 = extractelement <64 x i32> %1655, i32 0
  store i32 %1659, i32* %1658, align 4, !tbaa !203
  %1660 = getelementptr inbounds i32, i32* %1658, i32 %27
  %1661 = extractelement <64 x i32> %1655, i32 1
  store i32 %1661, i32* %1660, align 4, !tbaa !203
  %1662 = getelementptr inbounds i32, i32* %1660, i32 %27
  %1663 = extractelement <64 x i32> %1655, i32 2
  store i32 %1663, i32* %1662, align 4, !tbaa !203
  %1664 = getelementptr inbounds i32, i32* %1662, i32 %27
  %1665 = extractelement <64 x i32> %1655, i32 3
  store i32 %1665, i32* %1664, align 4, !tbaa !203
  %1666 = getelementptr inbounds i32, i32* %1664, i32 %27
  %1667 = extractelement <64 x i32> %1655, i32 4
  store i32 %1667, i32* %1666, align 4, !tbaa !203
  %1668 = getelementptr inbounds i32, i32* %1666, i32 %27
  %1669 = extractelement <64 x i32> %1655, i32 5
  store i32 %1669, i32* %1668, align 4, !tbaa !203
  %1670 = getelementptr inbounds i32, i32* %1668, i32 %27
  %1671 = extractelement <64 x i32> %1655, i32 6
  store i32 %1671, i32* %1670, align 4, !tbaa !203
  %1672 = getelementptr inbounds i32, i32* %1670, i32 %27
  %1673 = extractelement <64 x i32> %1655, i32 7
  store i32 %1673, i32* %1672, align 4, !tbaa !203
  %1674 = getelementptr inbounds i32, i32* %1672, i32 %27
  %1675 = extractelement <64 x i32> %1655, i32 8
  store i32 %1675, i32* %1674, align 4, !tbaa !203
  %1676 = getelementptr inbounds i32, i32* %1674, i32 %27
  %1677 = extractelement <64 x i32> %1655, i32 9
  store i32 %1677, i32* %1676, align 4, !tbaa !203
  %1678 = getelementptr inbounds i32, i32* %1676, i32 %27
  %1679 = extractelement <64 x i32> %1655, i32 10
  store i32 %1679, i32* %1678, align 4, !tbaa !203
  %1680 = getelementptr inbounds i32, i32* %1678, i32 %27
  %1681 = extractelement <64 x i32> %1655, i32 11
  store i32 %1681, i32* %1680, align 4, !tbaa !203
  %1682 = getelementptr inbounds i32, i32* %1680, i32 %27
  %1683 = extractelement <64 x i32> %1655, i32 12
  store i32 %1683, i32* %1682, align 4, !tbaa !203
  %1684 = getelementptr inbounds i32, i32* %1682, i32 %27
  %1685 = extractelement <64 x i32> %1655, i32 13
  store i32 %1685, i32* %1684, align 4, !tbaa !203
  %1686 = getelementptr inbounds i32, i32* %1684, i32 %27
  %1687 = extractelement <64 x i32> %1655, i32 14
  store i32 %1687, i32* %1686, align 4, !tbaa !203
  %1688 = getelementptr inbounds i32, i32* %1686, i32 %27
  %1689 = extractelement <64 x i32> %1655, i32 15
  store i32 %1689, i32* %1688, align 4, !tbaa !203
  %1690 = getelementptr inbounds i32, i32* %1688, i32 %27
  %1691 = extractelement <64 x i32> %1655, i32 16
  store i32 %1691, i32* %1690, align 4, !tbaa !203
  %1692 = getelementptr inbounds i32, i32* %1690, i32 %27
  %1693 = extractelement <64 x i32> %1655, i32 17
  store i32 %1693, i32* %1692, align 4, !tbaa !203
  %1694 = getelementptr inbounds i32, i32* %1692, i32 %27
  %1695 = extractelement <64 x i32> %1655, i32 18
  store i32 %1695, i32* %1694, align 4, !tbaa !203
  %1696 = getelementptr inbounds i32, i32* %1694, i32 %27
  %1697 = extractelement <64 x i32> %1655, i32 19
  store i32 %1697, i32* %1696, align 4, !tbaa !203
  %1698 = getelementptr inbounds i32, i32* %1696, i32 %27
  %1699 = extractelement <64 x i32> %1655, i32 20
  store i32 %1699, i32* %1698, align 4, !tbaa !203
  %1700 = getelementptr inbounds i32, i32* %1698, i32 %27
  %1701 = extractelement <64 x i32> %1655, i32 21
  store i32 %1701, i32* %1700, align 4, !tbaa !203
  %1702 = getelementptr inbounds i32, i32* %1700, i32 %27
  %1703 = extractelement <64 x i32> %1655, i32 22
  store i32 %1703, i32* %1702, align 4, !tbaa !203
  %1704 = getelementptr inbounds i32, i32* %1702, i32 %27
  %1705 = extractelement <64 x i32> %1655, i32 23
  store i32 %1705, i32* %1704, align 4, !tbaa !203
  %1706 = getelementptr inbounds i32, i32* %1704, i32 %27
  %1707 = extractelement <64 x i32> %1655, i32 24
  store i32 %1707, i32* %1706, align 4, !tbaa !203
  %1708 = getelementptr inbounds i32, i32* %1706, i32 %27
  %1709 = extractelement <64 x i32> %1655, i32 25
  store i32 %1709, i32* %1708, align 4, !tbaa !203
  %1710 = getelementptr inbounds i32, i32* %1708, i32 %27
  %1711 = extractelement <64 x i32> %1655, i32 26
  store i32 %1711, i32* %1710, align 4, !tbaa !203
  %1712 = getelementptr inbounds i32, i32* %1710, i32 %27
  %1713 = extractelement <64 x i32> %1655, i32 27
  store i32 %1713, i32* %1712, align 4, !tbaa !203
  %1714 = getelementptr inbounds i32, i32* %1712, i32 %27
  %1715 = extractelement <64 x i32> %1655, i32 28
  store i32 %1715, i32* %1714, align 4, !tbaa !203
  %1716 = getelementptr inbounds i32, i32* %1714, i32 %27
  %1717 = extractelement <64 x i32> %1655, i32 29
  store i32 %1717, i32* %1716, align 4, !tbaa !203
  %1718 = getelementptr inbounds i32, i32* %1716, i32 %27
  %1719 = extractelement <64 x i32> %1655, i32 30
  store i32 %1719, i32* %1718, align 4, !tbaa !203
  %1720 = getelementptr inbounds i32, i32* %1718, i32 %27
  %1721 = extractelement <64 x i32> %1655, i32 31
  store i32 %1721, i32* %1720, align 4, !tbaa !203
  %1722 = getelementptr inbounds i32, i32* %1720, i32 %27
  %1723 = extractelement <64 x i32> %1655, i32 32
  store i32 %1723, i32* %1722, align 4, !tbaa !203
  %1724 = getelementptr inbounds i32, i32* %1722, i32 %27
  %1725 = extractelement <64 x i32> %1655, i32 33
  store i32 %1725, i32* %1724, align 4, !tbaa !203
  %1726 = getelementptr inbounds i32, i32* %1724, i32 %27
  %1727 = extractelement <64 x i32> %1655, i32 34
  store i32 %1727, i32* %1726, align 4, !tbaa !203
  %1728 = getelementptr inbounds i32, i32* %1726, i32 %27
  %1729 = extractelement <64 x i32> %1655, i32 35
  store i32 %1729, i32* %1728, align 4, !tbaa !203
  %1730 = getelementptr inbounds i32, i32* %1728, i32 %27
  %1731 = extractelement <64 x i32> %1655, i32 36
  store i32 %1731, i32* %1730, align 4, !tbaa !203
  %1732 = getelementptr inbounds i32, i32* %1730, i32 %27
  %1733 = extractelement <64 x i32> %1655, i32 37
  store i32 %1733, i32* %1732, align 4, !tbaa !203
  %1734 = getelementptr inbounds i32, i32* %1732, i32 %27
  %1735 = extractelement <64 x i32> %1655, i32 38
  store i32 %1735, i32* %1734, align 4, !tbaa !203
  %1736 = getelementptr inbounds i32, i32* %1734, i32 %27
  %1737 = extractelement <64 x i32> %1655, i32 39
  store i32 %1737, i32* %1736, align 4, !tbaa !203
  %1738 = getelementptr inbounds i32, i32* %1736, i32 %27
  %1739 = extractelement <64 x i32> %1655, i32 40
  store i32 %1739, i32* %1738, align 4, !tbaa !203
  %1740 = getelementptr inbounds i32, i32* %1738, i32 %27
  %1741 = extractelement <64 x i32> %1655, i32 41
  store i32 %1741, i32* %1740, align 4, !tbaa !203
  %1742 = getelementptr inbounds i32, i32* %1740, i32 %27
  %1743 = extractelement <64 x i32> %1655, i32 42
  store i32 %1743, i32* %1742, align 4, !tbaa !203
  %1744 = getelementptr inbounds i32, i32* %1742, i32 %27
  %1745 = extractelement <64 x i32> %1655, i32 43
  store i32 %1745, i32* %1744, align 4, !tbaa !203
  %1746 = getelementptr inbounds i32, i32* %1744, i32 %27
  %1747 = extractelement <64 x i32> %1655, i32 44
  store i32 %1747, i32* %1746, align 4, !tbaa !203
  %1748 = getelementptr inbounds i32, i32* %1746, i32 %27
  %1749 = extractelement <64 x i32> %1655, i32 45
  store i32 %1749, i32* %1748, align 4, !tbaa !203
  %1750 = getelementptr inbounds i32, i32* %1748, i32 %27
  %1751 = extractelement <64 x i32> %1655, i32 46
  store i32 %1751, i32* %1750, align 4, !tbaa !203
  %1752 = getelementptr inbounds i32, i32* %1750, i32 %27
  %1753 = extractelement <64 x i32> %1655, i32 47
  store i32 %1753, i32* %1752, align 4, !tbaa !203
  %1754 = getelementptr inbounds i32, i32* %1752, i32 %27
  %1755 = extractelement <64 x i32> %1655, i32 48
  store i32 %1755, i32* %1754, align 4, !tbaa !203
  %1756 = getelementptr inbounds i32, i32* %1754, i32 %27
  %1757 = extractelement <64 x i32> %1655, i32 49
  store i32 %1757, i32* %1756, align 4, !tbaa !203
  %1758 = getelementptr inbounds i32, i32* %1756, i32 %27
  %1759 = extractelement <64 x i32> %1655, i32 50
  store i32 %1759, i32* %1758, align 4, !tbaa !203
  %1760 = getelementptr inbounds i32, i32* %1758, i32 %27
  %1761 = extractelement <64 x i32> %1655, i32 51
  store i32 %1761, i32* %1760, align 4, !tbaa !203
  %1762 = getelementptr inbounds i32, i32* %1760, i32 %27
  %1763 = extractelement <64 x i32> %1655, i32 52
  store i32 %1763, i32* %1762, align 4, !tbaa !203
  %1764 = getelementptr inbounds i32, i32* %1762, i32 %27
  %1765 = extractelement <64 x i32> %1655, i32 53
  store i32 %1765, i32* %1764, align 4, !tbaa !203
  %1766 = getelementptr inbounds i32, i32* %1764, i32 %27
  %1767 = extractelement <64 x i32> %1655, i32 54
  store i32 %1767, i32* %1766, align 4, !tbaa !203
  %1768 = getelementptr inbounds i32, i32* %1766, i32 %27
  %1769 = extractelement <64 x i32> %1655, i32 55
  store i32 %1769, i32* %1768, align 4, !tbaa !203
  %1770 = getelementptr inbounds i32, i32* %1768, i32 %27
  %1771 = extractelement <64 x i32> %1655, i32 56
  store i32 %1771, i32* %1770, align 4, !tbaa !203
  %1772 = getelementptr inbounds i32, i32* %1770, i32 %27
  %1773 = extractelement <64 x i32> %1655, i32 57
  store i32 %1773, i32* %1772, align 4, !tbaa !203
  %1774 = getelementptr inbounds i32, i32* %1772, i32 %27
  %1775 = extractelement <64 x i32> %1655, i32 58
  store i32 %1775, i32* %1774, align 4, !tbaa !203
  %1776 = getelementptr inbounds i32, i32* %1774, i32 %27
  %1777 = extractelement <64 x i32> %1655, i32 59
  store i32 %1777, i32* %1776, align 4, !tbaa !203
  %1778 = getelementptr inbounds i32, i32* %1776, i32 %27
  %1779 = extractelement <64 x i32> %1655, i32 60
  store i32 %1779, i32* %1778, align 4, !tbaa !203
  %1780 = getelementptr inbounds i32, i32* %1778, i32 %27
  %1781 = extractelement <64 x i32> %1655, i32 61
  store i32 %1781, i32* %1780, align 4, !tbaa !203
  %1782 = getelementptr inbounds i32, i32* %1780, i32 %27
  %1783 = extractelement <64 x i32> %1655, i32 62
  store i32 %1783, i32* %1782, align 4, !tbaa !203
  %1784 = getelementptr inbounds i32, i32* %1782, i32 %27
  %1785 = extractelement <64 x i32> %1655, i32 63
  store i32 %1785, i32* %1784, align 4, !tbaa !203
  %1786 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1627, <32 x i32> %1626)
  %1787 = add nsw i32 %t149.us.us.us, %1656
  %1788 = getelementptr inbounds i32, i32* %21, i32 %1787
  %1789 = extractelement <64 x i32> %1786, i32 0
  store i32 %1789, i32* %1788, align 4, !tbaa !203
  %1790 = getelementptr inbounds i32, i32* %1788, i32 %27
  %1791 = extractelement <64 x i32> %1786, i32 1
  store i32 %1791, i32* %1790, align 4, !tbaa !203
  %1792 = getelementptr inbounds i32, i32* %1790, i32 %27
  %1793 = extractelement <64 x i32> %1786, i32 2
  store i32 %1793, i32* %1792, align 4, !tbaa !203
  %1794 = getelementptr inbounds i32, i32* %1792, i32 %27
  %1795 = extractelement <64 x i32> %1786, i32 3
  store i32 %1795, i32* %1794, align 4, !tbaa !203
  %1796 = getelementptr inbounds i32, i32* %1794, i32 %27
  %1797 = extractelement <64 x i32> %1786, i32 4
  store i32 %1797, i32* %1796, align 4, !tbaa !203
  %1798 = getelementptr inbounds i32, i32* %1796, i32 %27
  %1799 = extractelement <64 x i32> %1786, i32 5
  store i32 %1799, i32* %1798, align 4, !tbaa !203
  %1800 = getelementptr inbounds i32, i32* %1798, i32 %27
  %1801 = extractelement <64 x i32> %1786, i32 6
  store i32 %1801, i32* %1800, align 4, !tbaa !203
  %1802 = getelementptr inbounds i32, i32* %1800, i32 %27
  %1803 = extractelement <64 x i32> %1786, i32 7
  store i32 %1803, i32* %1802, align 4, !tbaa !203
  %1804 = getelementptr inbounds i32, i32* %1802, i32 %27
  %1805 = extractelement <64 x i32> %1786, i32 8
  store i32 %1805, i32* %1804, align 4, !tbaa !203
  %1806 = getelementptr inbounds i32, i32* %1804, i32 %27
  %1807 = extractelement <64 x i32> %1786, i32 9
  store i32 %1807, i32* %1806, align 4, !tbaa !203
  %1808 = getelementptr inbounds i32, i32* %1806, i32 %27
  %1809 = extractelement <64 x i32> %1786, i32 10
  store i32 %1809, i32* %1808, align 4, !tbaa !203
  %1810 = getelementptr inbounds i32, i32* %1808, i32 %27
  %1811 = extractelement <64 x i32> %1786, i32 11
  store i32 %1811, i32* %1810, align 4, !tbaa !203
  %1812 = getelementptr inbounds i32, i32* %1810, i32 %27
  %1813 = extractelement <64 x i32> %1786, i32 12
  store i32 %1813, i32* %1812, align 4, !tbaa !203
  %1814 = getelementptr inbounds i32, i32* %1812, i32 %27
  %1815 = extractelement <64 x i32> %1786, i32 13
  store i32 %1815, i32* %1814, align 4, !tbaa !203
  %1816 = getelementptr inbounds i32, i32* %1814, i32 %27
  %1817 = extractelement <64 x i32> %1786, i32 14
  store i32 %1817, i32* %1816, align 4, !tbaa !203
  %1818 = getelementptr inbounds i32, i32* %1816, i32 %27
  %1819 = extractelement <64 x i32> %1786, i32 15
  store i32 %1819, i32* %1818, align 4, !tbaa !203
  %1820 = getelementptr inbounds i32, i32* %1818, i32 %27
  %1821 = extractelement <64 x i32> %1786, i32 16
  store i32 %1821, i32* %1820, align 4, !tbaa !203
  %1822 = getelementptr inbounds i32, i32* %1820, i32 %27
  %1823 = extractelement <64 x i32> %1786, i32 17
  store i32 %1823, i32* %1822, align 4, !tbaa !203
  %1824 = getelementptr inbounds i32, i32* %1822, i32 %27
  %1825 = extractelement <64 x i32> %1786, i32 18
  store i32 %1825, i32* %1824, align 4, !tbaa !203
  %1826 = getelementptr inbounds i32, i32* %1824, i32 %27
  %1827 = extractelement <64 x i32> %1786, i32 19
  store i32 %1827, i32* %1826, align 4, !tbaa !203
  %1828 = getelementptr inbounds i32, i32* %1826, i32 %27
  %1829 = extractelement <64 x i32> %1786, i32 20
  store i32 %1829, i32* %1828, align 4, !tbaa !203
  %1830 = getelementptr inbounds i32, i32* %1828, i32 %27
  %1831 = extractelement <64 x i32> %1786, i32 21
  store i32 %1831, i32* %1830, align 4, !tbaa !203
  %1832 = getelementptr inbounds i32, i32* %1830, i32 %27
  %1833 = extractelement <64 x i32> %1786, i32 22
  store i32 %1833, i32* %1832, align 4, !tbaa !203
  %1834 = getelementptr inbounds i32, i32* %1832, i32 %27
  %1835 = extractelement <64 x i32> %1786, i32 23
  store i32 %1835, i32* %1834, align 4, !tbaa !203
  %1836 = getelementptr inbounds i32, i32* %1834, i32 %27
  %1837 = extractelement <64 x i32> %1786, i32 24
  store i32 %1837, i32* %1836, align 4, !tbaa !203
  %1838 = getelementptr inbounds i32, i32* %1836, i32 %27
  %1839 = extractelement <64 x i32> %1786, i32 25
  store i32 %1839, i32* %1838, align 4, !tbaa !203
  %1840 = getelementptr inbounds i32, i32* %1838, i32 %27
  %1841 = extractelement <64 x i32> %1786, i32 26
  store i32 %1841, i32* %1840, align 4, !tbaa !203
  %1842 = getelementptr inbounds i32, i32* %1840, i32 %27
  %1843 = extractelement <64 x i32> %1786, i32 27
  store i32 %1843, i32* %1842, align 4, !tbaa !203
  %1844 = getelementptr inbounds i32, i32* %1842, i32 %27
  %1845 = extractelement <64 x i32> %1786, i32 28
  store i32 %1845, i32* %1844, align 4, !tbaa !203
  %1846 = getelementptr inbounds i32, i32* %1844, i32 %27
  %1847 = extractelement <64 x i32> %1786, i32 29
  store i32 %1847, i32* %1846, align 4, !tbaa !203
  %1848 = getelementptr inbounds i32, i32* %1846, i32 %27
  %1849 = extractelement <64 x i32> %1786, i32 30
  store i32 %1849, i32* %1848, align 4, !tbaa !203
  %1850 = getelementptr inbounds i32, i32* %1848, i32 %27
  %1851 = extractelement <64 x i32> %1786, i32 31
  store i32 %1851, i32* %1850, align 4, !tbaa !203
  %1852 = getelementptr inbounds i32, i32* %1850, i32 %27
  %1853 = extractelement <64 x i32> %1786, i32 32
  store i32 %1853, i32* %1852, align 4, !tbaa !203
  %1854 = getelementptr inbounds i32, i32* %1852, i32 %27
  %1855 = extractelement <64 x i32> %1786, i32 33
  store i32 %1855, i32* %1854, align 4, !tbaa !203
  %1856 = getelementptr inbounds i32, i32* %1854, i32 %27
  %1857 = extractelement <64 x i32> %1786, i32 34
  store i32 %1857, i32* %1856, align 4, !tbaa !203
  %1858 = getelementptr inbounds i32, i32* %1856, i32 %27
  %1859 = extractelement <64 x i32> %1786, i32 35
  store i32 %1859, i32* %1858, align 4, !tbaa !203
  %1860 = getelementptr inbounds i32, i32* %1858, i32 %27
  %1861 = extractelement <64 x i32> %1786, i32 36
  store i32 %1861, i32* %1860, align 4, !tbaa !203
  %1862 = getelementptr inbounds i32, i32* %1860, i32 %27
  %1863 = extractelement <64 x i32> %1786, i32 37
  store i32 %1863, i32* %1862, align 4, !tbaa !203
  %1864 = getelementptr inbounds i32, i32* %1862, i32 %27
  %1865 = extractelement <64 x i32> %1786, i32 38
  store i32 %1865, i32* %1864, align 4, !tbaa !203
  %1866 = getelementptr inbounds i32, i32* %1864, i32 %27
  %1867 = extractelement <64 x i32> %1786, i32 39
  store i32 %1867, i32* %1866, align 4, !tbaa !203
  %1868 = getelementptr inbounds i32, i32* %1866, i32 %27
  %1869 = extractelement <64 x i32> %1786, i32 40
  store i32 %1869, i32* %1868, align 4, !tbaa !203
  %1870 = getelementptr inbounds i32, i32* %1868, i32 %27
  %1871 = extractelement <64 x i32> %1786, i32 41
  store i32 %1871, i32* %1870, align 4, !tbaa !203
  %1872 = getelementptr inbounds i32, i32* %1870, i32 %27
  %1873 = extractelement <64 x i32> %1786, i32 42
  store i32 %1873, i32* %1872, align 4, !tbaa !203
  %1874 = getelementptr inbounds i32, i32* %1872, i32 %27
  %1875 = extractelement <64 x i32> %1786, i32 43
  store i32 %1875, i32* %1874, align 4, !tbaa !203
  %1876 = getelementptr inbounds i32, i32* %1874, i32 %27
  %1877 = extractelement <64 x i32> %1786, i32 44
  store i32 %1877, i32* %1876, align 4, !tbaa !203
  %1878 = getelementptr inbounds i32, i32* %1876, i32 %27
  %1879 = extractelement <64 x i32> %1786, i32 45
  store i32 %1879, i32* %1878, align 4, !tbaa !203
  %1880 = getelementptr inbounds i32, i32* %1878, i32 %27
  %1881 = extractelement <64 x i32> %1786, i32 46
  store i32 %1881, i32* %1880, align 4, !tbaa !203
  %1882 = getelementptr inbounds i32, i32* %1880, i32 %27
  %1883 = extractelement <64 x i32> %1786, i32 47
  store i32 %1883, i32* %1882, align 4, !tbaa !203
  %1884 = getelementptr inbounds i32, i32* %1882, i32 %27
  %1885 = extractelement <64 x i32> %1786, i32 48
  store i32 %1885, i32* %1884, align 4, !tbaa !203
  %1886 = getelementptr inbounds i32, i32* %1884, i32 %27
  %1887 = extractelement <64 x i32> %1786, i32 49
  store i32 %1887, i32* %1886, align 4, !tbaa !203
  %1888 = getelementptr inbounds i32, i32* %1886, i32 %27
  %1889 = extractelement <64 x i32> %1786, i32 50
  store i32 %1889, i32* %1888, align 4, !tbaa !203
  %1890 = getelementptr inbounds i32, i32* %1888, i32 %27
  %1891 = extractelement <64 x i32> %1786, i32 51
  store i32 %1891, i32* %1890, align 4, !tbaa !203
  %1892 = getelementptr inbounds i32, i32* %1890, i32 %27
  %1893 = extractelement <64 x i32> %1786, i32 52
  store i32 %1893, i32* %1892, align 4, !tbaa !203
  %1894 = getelementptr inbounds i32, i32* %1892, i32 %27
  %1895 = extractelement <64 x i32> %1786, i32 53
  store i32 %1895, i32* %1894, align 4, !tbaa !203
  %1896 = getelementptr inbounds i32, i32* %1894, i32 %27
  %1897 = extractelement <64 x i32> %1786, i32 54
  store i32 %1897, i32* %1896, align 4, !tbaa !203
  %1898 = getelementptr inbounds i32, i32* %1896, i32 %27
  %1899 = extractelement <64 x i32> %1786, i32 55
  store i32 %1899, i32* %1898, align 4, !tbaa !203
  %1900 = getelementptr inbounds i32, i32* %1898, i32 %27
  %1901 = extractelement <64 x i32> %1786, i32 56
  store i32 %1901, i32* %1900, align 4, !tbaa !203
  %1902 = getelementptr inbounds i32, i32* %1900, i32 %27
  %1903 = extractelement <64 x i32> %1786, i32 57
  store i32 %1903, i32* %1902, align 4, !tbaa !203
  %1904 = getelementptr inbounds i32, i32* %1902, i32 %27
  %1905 = extractelement <64 x i32> %1786, i32 58
  store i32 %1905, i32* %1904, align 4, !tbaa !203
  %1906 = getelementptr inbounds i32, i32* %1904, i32 %27
  %1907 = extractelement <64 x i32> %1786, i32 59
  store i32 %1907, i32* %1906, align 4, !tbaa !203
  %1908 = getelementptr inbounds i32, i32* %1906, i32 %27
  %1909 = extractelement <64 x i32> %1786, i32 60
  store i32 %1909, i32* %1908, align 4, !tbaa !203
  %1910 = getelementptr inbounds i32, i32* %1908, i32 %27
  %1911 = extractelement <64 x i32> %1786, i32 61
  store i32 %1911, i32* %1910, align 4, !tbaa !203
  %1912 = getelementptr inbounds i32, i32* %1910, i32 %27
  %1913 = extractelement <64 x i32> %1786, i32 62
  store i32 %1913, i32* %1912, align 4, !tbaa !203
  %1914 = getelementptr inbounds i32, i32* %1912, i32 %27
  %1915 = extractelement <64 x i32> %1786, i32 63
  store i32 %1915, i32* %1914, align 4, !tbaa !203
  %1916 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1640, <32 x i32> %1639)
  %1917 = add nsw i32 %t150.us.us.us, %1656
  %1918 = getelementptr inbounds i32, i32* %21, i32 %1917
  %1919 = extractelement <64 x i32> %1916, i32 0
  store i32 %1919, i32* %1918, align 4, !tbaa !203
  %1920 = getelementptr inbounds i32, i32* %1918, i32 %27
  %1921 = extractelement <64 x i32> %1916, i32 1
  store i32 %1921, i32* %1920, align 4, !tbaa !203
  %1922 = getelementptr inbounds i32, i32* %1920, i32 %27
  %1923 = extractelement <64 x i32> %1916, i32 2
  store i32 %1923, i32* %1922, align 4, !tbaa !203
  %1924 = getelementptr inbounds i32, i32* %1922, i32 %27
  %1925 = extractelement <64 x i32> %1916, i32 3
  store i32 %1925, i32* %1924, align 4, !tbaa !203
  %1926 = getelementptr inbounds i32, i32* %1924, i32 %27
  %1927 = extractelement <64 x i32> %1916, i32 4
  store i32 %1927, i32* %1926, align 4, !tbaa !203
  %1928 = getelementptr inbounds i32, i32* %1926, i32 %27
  %1929 = extractelement <64 x i32> %1916, i32 5
  store i32 %1929, i32* %1928, align 4, !tbaa !203
  %1930 = getelementptr inbounds i32, i32* %1928, i32 %27
  %1931 = extractelement <64 x i32> %1916, i32 6
  store i32 %1931, i32* %1930, align 4, !tbaa !203
  %1932 = getelementptr inbounds i32, i32* %1930, i32 %27
  %1933 = extractelement <64 x i32> %1916, i32 7
  store i32 %1933, i32* %1932, align 4, !tbaa !203
  %1934 = getelementptr inbounds i32, i32* %1932, i32 %27
  %1935 = extractelement <64 x i32> %1916, i32 8
  store i32 %1935, i32* %1934, align 4, !tbaa !203
  %1936 = getelementptr inbounds i32, i32* %1934, i32 %27
  %1937 = extractelement <64 x i32> %1916, i32 9
  store i32 %1937, i32* %1936, align 4, !tbaa !203
  %1938 = getelementptr inbounds i32, i32* %1936, i32 %27
  %1939 = extractelement <64 x i32> %1916, i32 10
  store i32 %1939, i32* %1938, align 4, !tbaa !203
  %1940 = getelementptr inbounds i32, i32* %1938, i32 %27
  %1941 = extractelement <64 x i32> %1916, i32 11
  store i32 %1941, i32* %1940, align 4, !tbaa !203
  %1942 = getelementptr inbounds i32, i32* %1940, i32 %27
  %1943 = extractelement <64 x i32> %1916, i32 12
  store i32 %1943, i32* %1942, align 4, !tbaa !203
  %1944 = getelementptr inbounds i32, i32* %1942, i32 %27
  %1945 = extractelement <64 x i32> %1916, i32 13
  store i32 %1945, i32* %1944, align 4, !tbaa !203
  %1946 = getelementptr inbounds i32, i32* %1944, i32 %27
  %1947 = extractelement <64 x i32> %1916, i32 14
  store i32 %1947, i32* %1946, align 4, !tbaa !203
  %1948 = getelementptr inbounds i32, i32* %1946, i32 %27
  %1949 = extractelement <64 x i32> %1916, i32 15
  store i32 %1949, i32* %1948, align 4, !tbaa !203
  %1950 = getelementptr inbounds i32, i32* %1948, i32 %27
  %1951 = extractelement <64 x i32> %1916, i32 16
  store i32 %1951, i32* %1950, align 4, !tbaa !203
  %1952 = getelementptr inbounds i32, i32* %1950, i32 %27
  %1953 = extractelement <64 x i32> %1916, i32 17
  store i32 %1953, i32* %1952, align 4, !tbaa !203
  %1954 = getelementptr inbounds i32, i32* %1952, i32 %27
  %1955 = extractelement <64 x i32> %1916, i32 18
  store i32 %1955, i32* %1954, align 4, !tbaa !203
  %1956 = getelementptr inbounds i32, i32* %1954, i32 %27
  %1957 = extractelement <64 x i32> %1916, i32 19
  store i32 %1957, i32* %1956, align 4, !tbaa !203
  %1958 = getelementptr inbounds i32, i32* %1956, i32 %27
  %1959 = extractelement <64 x i32> %1916, i32 20
  store i32 %1959, i32* %1958, align 4, !tbaa !203
  %1960 = getelementptr inbounds i32, i32* %1958, i32 %27
  %1961 = extractelement <64 x i32> %1916, i32 21
  store i32 %1961, i32* %1960, align 4, !tbaa !203
  %1962 = getelementptr inbounds i32, i32* %1960, i32 %27
  %1963 = extractelement <64 x i32> %1916, i32 22
  store i32 %1963, i32* %1962, align 4, !tbaa !203
  %1964 = getelementptr inbounds i32, i32* %1962, i32 %27
  %1965 = extractelement <64 x i32> %1916, i32 23
  store i32 %1965, i32* %1964, align 4, !tbaa !203
  %1966 = getelementptr inbounds i32, i32* %1964, i32 %27
  %1967 = extractelement <64 x i32> %1916, i32 24
  store i32 %1967, i32* %1966, align 4, !tbaa !203
  %1968 = getelementptr inbounds i32, i32* %1966, i32 %27
  %1969 = extractelement <64 x i32> %1916, i32 25
  store i32 %1969, i32* %1968, align 4, !tbaa !203
  %1970 = getelementptr inbounds i32, i32* %1968, i32 %27
  %1971 = extractelement <64 x i32> %1916, i32 26
  store i32 %1971, i32* %1970, align 4, !tbaa !203
  %1972 = getelementptr inbounds i32, i32* %1970, i32 %27
  %1973 = extractelement <64 x i32> %1916, i32 27
  store i32 %1973, i32* %1972, align 4, !tbaa !203
  %1974 = getelementptr inbounds i32, i32* %1972, i32 %27
  %1975 = extractelement <64 x i32> %1916, i32 28
  store i32 %1975, i32* %1974, align 4, !tbaa !203
  %1976 = getelementptr inbounds i32, i32* %1974, i32 %27
  %1977 = extractelement <64 x i32> %1916, i32 29
  store i32 %1977, i32* %1976, align 4, !tbaa !203
  %1978 = getelementptr inbounds i32, i32* %1976, i32 %27
  %1979 = extractelement <64 x i32> %1916, i32 30
  store i32 %1979, i32* %1978, align 4, !tbaa !203
  %1980 = getelementptr inbounds i32, i32* %1978, i32 %27
  %1981 = extractelement <64 x i32> %1916, i32 31
  store i32 %1981, i32* %1980, align 4, !tbaa !203
  %1982 = getelementptr inbounds i32, i32* %1980, i32 %27
  %1983 = extractelement <64 x i32> %1916, i32 32
  store i32 %1983, i32* %1982, align 4, !tbaa !203
  %1984 = getelementptr inbounds i32, i32* %1982, i32 %27
  %1985 = extractelement <64 x i32> %1916, i32 33
  store i32 %1985, i32* %1984, align 4, !tbaa !203
  %1986 = getelementptr inbounds i32, i32* %1984, i32 %27
  %1987 = extractelement <64 x i32> %1916, i32 34
  store i32 %1987, i32* %1986, align 4, !tbaa !203
  %1988 = getelementptr inbounds i32, i32* %1986, i32 %27
  %1989 = extractelement <64 x i32> %1916, i32 35
  store i32 %1989, i32* %1988, align 4, !tbaa !203
  %1990 = getelementptr inbounds i32, i32* %1988, i32 %27
  %1991 = extractelement <64 x i32> %1916, i32 36
  store i32 %1991, i32* %1990, align 4, !tbaa !203
  %1992 = getelementptr inbounds i32, i32* %1990, i32 %27
  %1993 = extractelement <64 x i32> %1916, i32 37
  store i32 %1993, i32* %1992, align 4, !tbaa !203
  %1994 = getelementptr inbounds i32, i32* %1992, i32 %27
  %1995 = extractelement <64 x i32> %1916, i32 38
  store i32 %1995, i32* %1994, align 4, !tbaa !203
  %1996 = getelementptr inbounds i32, i32* %1994, i32 %27
  %1997 = extractelement <64 x i32> %1916, i32 39
  store i32 %1997, i32* %1996, align 4, !tbaa !203
  %1998 = getelementptr inbounds i32, i32* %1996, i32 %27
  %1999 = extractelement <64 x i32> %1916, i32 40
  store i32 %1999, i32* %1998, align 4, !tbaa !203
  %2000 = getelementptr inbounds i32, i32* %1998, i32 %27
  %2001 = extractelement <64 x i32> %1916, i32 41
  store i32 %2001, i32* %2000, align 4, !tbaa !203
  %2002 = getelementptr inbounds i32, i32* %2000, i32 %27
  %2003 = extractelement <64 x i32> %1916, i32 42
  store i32 %2003, i32* %2002, align 4, !tbaa !203
  %2004 = getelementptr inbounds i32, i32* %2002, i32 %27
  %2005 = extractelement <64 x i32> %1916, i32 43
  store i32 %2005, i32* %2004, align 4, !tbaa !203
  %2006 = getelementptr inbounds i32, i32* %2004, i32 %27
  %2007 = extractelement <64 x i32> %1916, i32 44
  store i32 %2007, i32* %2006, align 4, !tbaa !203
  %2008 = getelementptr inbounds i32, i32* %2006, i32 %27
  %2009 = extractelement <64 x i32> %1916, i32 45
  store i32 %2009, i32* %2008, align 4, !tbaa !203
  %2010 = getelementptr inbounds i32, i32* %2008, i32 %27
  %2011 = extractelement <64 x i32> %1916, i32 46
  store i32 %2011, i32* %2010, align 4, !tbaa !203
  %2012 = getelementptr inbounds i32, i32* %2010, i32 %27
  %2013 = extractelement <64 x i32> %1916, i32 47
  store i32 %2013, i32* %2012, align 4, !tbaa !203
  %2014 = getelementptr inbounds i32, i32* %2012, i32 %27
  %2015 = extractelement <64 x i32> %1916, i32 48
  store i32 %2015, i32* %2014, align 4, !tbaa !203
  %2016 = getelementptr inbounds i32, i32* %2014, i32 %27
  %2017 = extractelement <64 x i32> %1916, i32 49
  store i32 %2017, i32* %2016, align 4, !tbaa !203
  %2018 = getelementptr inbounds i32, i32* %2016, i32 %27
  %2019 = extractelement <64 x i32> %1916, i32 50
  store i32 %2019, i32* %2018, align 4, !tbaa !203
  %2020 = getelementptr inbounds i32, i32* %2018, i32 %27
  %2021 = extractelement <64 x i32> %1916, i32 51
  store i32 %2021, i32* %2020, align 4, !tbaa !203
  %2022 = getelementptr inbounds i32, i32* %2020, i32 %27
  %2023 = extractelement <64 x i32> %1916, i32 52
  store i32 %2023, i32* %2022, align 4, !tbaa !203
  %2024 = getelementptr inbounds i32, i32* %2022, i32 %27
  %2025 = extractelement <64 x i32> %1916, i32 53
  store i32 %2025, i32* %2024, align 4, !tbaa !203
  %2026 = getelementptr inbounds i32, i32* %2024, i32 %27
  %2027 = extractelement <64 x i32> %1916, i32 54
  store i32 %2027, i32* %2026, align 4, !tbaa !203
  %2028 = getelementptr inbounds i32, i32* %2026, i32 %27
  %2029 = extractelement <64 x i32> %1916, i32 55
  store i32 %2029, i32* %2028, align 4, !tbaa !203
  %2030 = getelementptr inbounds i32, i32* %2028, i32 %27
  %2031 = extractelement <64 x i32> %1916, i32 56
  store i32 %2031, i32* %2030, align 4, !tbaa !203
  %2032 = getelementptr inbounds i32, i32* %2030, i32 %27
  %2033 = extractelement <64 x i32> %1916, i32 57
  store i32 %2033, i32* %2032, align 4, !tbaa !203
  %2034 = getelementptr inbounds i32, i32* %2032, i32 %27
  %2035 = extractelement <64 x i32> %1916, i32 58
  store i32 %2035, i32* %2034, align 4, !tbaa !203
  %2036 = getelementptr inbounds i32, i32* %2034, i32 %27
  %2037 = extractelement <64 x i32> %1916, i32 59
  store i32 %2037, i32* %2036, align 4, !tbaa !203
  %2038 = getelementptr inbounds i32, i32* %2036, i32 %27
  %2039 = extractelement <64 x i32> %1916, i32 60
  store i32 %2039, i32* %2038, align 4, !tbaa !203
  %2040 = getelementptr inbounds i32, i32* %2038, i32 %27
  %2041 = extractelement <64 x i32> %1916, i32 61
  store i32 %2041, i32* %2040, align 4, !tbaa !203
  %2042 = getelementptr inbounds i32, i32* %2040, i32 %27
  %2043 = extractelement <64 x i32> %1916, i32 62
  store i32 %2043, i32* %2042, align 4, !tbaa !203
  %2044 = getelementptr inbounds i32, i32* %2042, i32 %27
  %2045 = extractelement <64 x i32> %1916, i32 63
  store i32 %2045, i32* %2044, align 4, !tbaa !203
  %2046 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1653, <32 x i32> %1652)
  %2047 = add nsw i32 %t151.us.us.us, %1656
  %2048 = getelementptr inbounds i32, i32* %21, i32 %2047
  %2049 = extractelement <64 x i32> %2046, i32 0
  store i32 %2049, i32* %2048, align 4, !tbaa !203
  %2050 = getelementptr inbounds i32, i32* %2048, i32 %27
  %2051 = extractelement <64 x i32> %2046, i32 1
  store i32 %2051, i32* %2050, align 4, !tbaa !203
  %2052 = getelementptr inbounds i32, i32* %2050, i32 %27
  %2053 = extractelement <64 x i32> %2046, i32 2
  store i32 %2053, i32* %2052, align 4, !tbaa !203
  %2054 = getelementptr inbounds i32, i32* %2052, i32 %27
  %2055 = extractelement <64 x i32> %2046, i32 3
  store i32 %2055, i32* %2054, align 4, !tbaa !203
  %2056 = getelementptr inbounds i32, i32* %2054, i32 %27
  %2057 = extractelement <64 x i32> %2046, i32 4
  store i32 %2057, i32* %2056, align 4, !tbaa !203
  %2058 = getelementptr inbounds i32, i32* %2056, i32 %27
  %2059 = extractelement <64 x i32> %2046, i32 5
  store i32 %2059, i32* %2058, align 4, !tbaa !203
  %2060 = getelementptr inbounds i32, i32* %2058, i32 %27
  %2061 = extractelement <64 x i32> %2046, i32 6
  store i32 %2061, i32* %2060, align 4, !tbaa !203
  %2062 = getelementptr inbounds i32, i32* %2060, i32 %27
  %2063 = extractelement <64 x i32> %2046, i32 7
  store i32 %2063, i32* %2062, align 4, !tbaa !203
  %2064 = getelementptr inbounds i32, i32* %2062, i32 %27
  %2065 = extractelement <64 x i32> %2046, i32 8
  store i32 %2065, i32* %2064, align 4, !tbaa !203
  %2066 = getelementptr inbounds i32, i32* %2064, i32 %27
  %2067 = extractelement <64 x i32> %2046, i32 9
  store i32 %2067, i32* %2066, align 4, !tbaa !203
  %2068 = getelementptr inbounds i32, i32* %2066, i32 %27
  %2069 = extractelement <64 x i32> %2046, i32 10
  store i32 %2069, i32* %2068, align 4, !tbaa !203
  %2070 = getelementptr inbounds i32, i32* %2068, i32 %27
  %2071 = extractelement <64 x i32> %2046, i32 11
  store i32 %2071, i32* %2070, align 4, !tbaa !203
  %2072 = getelementptr inbounds i32, i32* %2070, i32 %27
  %2073 = extractelement <64 x i32> %2046, i32 12
  store i32 %2073, i32* %2072, align 4, !tbaa !203
  %2074 = getelementptr inbounds i32, i32* %2072, i32 %27
  %2075 = extractelement <64 x i32> %2046, i32 13
  store i32 %2075, i32* %2074, align 4, !tbaa !203
  %2076 = getelementptr inbounds i32, i32* %2074, i32 %27
  %2077 = extractelement <64 x i32> %2046, i32 14
  store i32 %2077, i32* %2076, align 4, !tbaa !203
  %2078 = getelementptr inbounds i32, i32* %2076, i32 %27
  %2079 = extractelement <64 x i32> %2046, i32 15
  store i32 %2079, i32* %2078, align 4, !tbaa !203
  %2080 = getelementptr inbounds i32, i32* %2078, i32 %27
  %2081 = extractelement <64 x i32> %2046, i32 16
  store i32 %2081, i32* %2080, align 4, !tbaa !203
  %2082 = getelementptr inbounds i32, i32* %2080, i32 %27
  %2083 = extractelement <64 x i32> %2046, i32 17
  store i32 %2083, i32* %2082, align 4, !tbaa !203
  %2084 = getelementptr inbounds i32, i32* %2082, i32 %27
  %2085 = extractelement <64 x i32> %2046, i32 18
  store i32 %2085, i32* %2084, align 4, !tbaa !203
  %2086 = getelementptr inbounds i32, i32* %2084, i32 %27
  %2087 = extractelement <64 x i32> %2046, i32 19
  store i32 %2087, i32* %2086, align 4, !tbaa !203
  %2088 = getelementptr inbounds i32, i32* %2086, i32 %27
  %2089 = extractelement <64 x i32> %2046, i32 20
  store i32 %2089, i32* %2088, align 4, !tbaa !203
  %2090 = getelementptr inbounds i32, i32* %2088, i32 %27
  %2091 = extractelement <64 x i32> %2046, i32 21
  store i32 %2091, i32* %2090, align 4, !tbaa !203
  %2092 = getelementptr inbounds i32, i32* %2090, i32 %27
  %2093 = extractelement <64 x i32> %2046, i32 22
  store i32 %2093, i32* %2092, align 4, !tbaa !203
  %2094 = getelementptr inbounds i32, i32* %2092, i32 %27
  %2095 = extractelement <64 x i32> %2046, i32 23
  store i32 %2095, i32* %2094, align 4, !tbaa !203
  %2096 = getelementptr inbounds i32, i32* %2094, i32 %27
  %2097 = extractelement <64 x i32> %2046, i32 24
  store i32 %2097, i32* %2096, align 4, !tbaa !203
  %2098 = getelementptr inbounds i32, i32* %2096, i32 %27
  %2099 = extractelement <64 x i32> %2046, i32 25
  store i32 %2099, i32* %2098, align 4, !tbaa !203
  %2100 = getelementptr inbounds i32, i32* %2098, i32 %27
  %2101 = extractelement <64 x i32> %2046, i32 26
  store i32 %2101, i32* %2100, align 4, !tbaa !203
  %2102 = getelementptr inbounds i32, i32* %2100, i32 %27
  %2103 = extractelement <64 x i32> %2046, i32 27
  store i32 %2103, i32* %2102, align 4, !tbaa !203
  %2104 = getelementptr inbounds i32, i32* %2102, i32 %27
  %2105 = extractelement <64 x i32> %2046, i32 28
  store i32 %2105, i32* %2104, align 4, !tbaa !203
  %2106 = getelementptr inbounds i32, i32* %2104, i32 %27
  %2107 = extractelement <64 x i32> %2046, i32 29
  store i32 %2107, i32* %2106, align 4, !tbaa !203
  %2108 = getelementptr inbounds i32, i32* %2106, i32 %27
  %2109 = extractelement <64 x i32> %2046, i32 30
  store i32 %2109, i32* %2108, align 4, !tbaa !203
  %2110 = getelementptr inbounds i32, i32* %2108, i32 %27
  %2111 = extractelement <64 x i32> %2046, i32 31
  store i32 %2111, i32* %2110, align 4, !tbaa !203
  %2112 = getelementptr inbounds i32, i32* %2110, i32 %27
  %2113 = extractelement <64 x i32> %2046, i32 32
  store i32 %2113, i32* %2112, align 4, !tbaa !203
  %2114 = getelementptr inbounds i32, i32* %2112, i32 %27
  %2115 = extractelement <64 x i32> %2046, i32 33
  store i32 %2115, i32* %2114, align 4, !tbaa !203
  %2116 = getelementptr inbounds i32, i32* %2114, i32 %27
  %2117 = extractelement <64 x i32> %2046, i32 34
  store i32 %2117, i32* %2116, align 4, !tbaa !203
  %2118 = getelementptr inbounds i32, i32* %2116, i32 %27
  %2119 = extractelement <64 x i32> %2046, i32 35
  store i32 %2119, i32* %2118, align 4, !tbaa !203
  %2120 = getelementptr inbounds i32, i32* %2118, i32 %27
  %2121 = extractelement <64 x i32> %2046, i32 36
  store i32 %2121, i32* %2120, align 4, !tbaa !203
  %2122 = getelementptr inbounds i32, i32* %2120, i32 %27
  %2123 = extractelement <64 x i32> %2046, i32 37
  store i32 %2123, i32* %2122, align 4, !tbaa !203
  %2124 = getelementptr inbounds i32, i32* %2122, i32 %27
  %2125 = extractelement <64 x i32> %2046, i32 38
  store i32 %2125, i32* %2124, align 4, !tbaa !203
  %2126 = getelementptr inbounds i32, i32* %2124, i32 %27
  %2127 = extractelement <64 x i32> %2046, i32 39
  store i32 %2127, i32* %2126, align 4, !tbaa !203
  %2128 = getelementptr inbounds i32, i32* %2126, i32 %27
  %2129 = extractelement <64 x i32> %2046, i32 40
  store i32 %2129, i32* %2128, align 4, !tbaa !203
  %2130 = getelementptr inbounds i32, i32* %2128, i32 %27
  %2131 = extractelement <64 x i32> %2046, i32 41
  store i32 %2131, i32* %2130, align 4, !tbaa !203
  %2132 = getelementptr inbounds i32, i32* %2130, i32 %27
  %2133 = extractelement <64 x i32> %2046, i32 42
  store i32 %2133, i32* %2132, align 4, !tbaa !203
  %2134 = getelementptr inbounds i32, i32* %2132, i32 %27
  %2135 = extractelement <64 x i32> %2046, i32 43
  store i32 %2135, i32* %2134, align 4, !tbaa !203
  %2136 = getelementptr inbounds i32, i32* %2134, i32 %27
  %2137 = extractelement <64 x i32> %2046, i32 44
  store i32 %2137, i32* %2136, align 4, !tbaa !203
  %2138 = getelementptr inbounds i32, i32* %2136, i32 %27
  %2139 = extractelement <64 x i32> %2046, i32 45
  store i32 %2139, i32* %2138, align 4, !tbaa !203
  %2140 = getelementptr inbounds i32, i32* %2138, i32 %27
  %2141 = extractelement <64 x i32> %2046, i32 46
  store i32 %2141, i32* %2140, align 4, !tbaa !203
  %2142 = getelementptr inbounds i32, i32* %2140, i32 %27
  %2143 = extractelement <64 x i32> %2046, i32 47
  store i32 %2143, i32* %2142, align 4, !tbaa !203
  %2144 = getelementptr inbounds i32, i32* %2142, i32 %27
  %2145 = extractelement <64 x i32> %2046, i32 48
  store i32 %2145, i32* %2144, align 4, !tbaa !203
  %2146 = getelementptr inbounds i32, i32* %2144, i32 %27
  %2147 = extractelement <64 x i32> %2046, i32 49
  store i32 %2147, i32* %2146, align 4, !tbaa !203
  %2148 = getelementptr inbounds i32, i32* %2146, i32 %27
  %2149 = extractelement <64 x i32> %2046, i32 50
  store i32 %2149, i32* %2148, align 4, !tbaa !203
  %2150 = getelementptr inbounds i32, i32* %2148, i32 %27
  %2151 = extractelement <64 x i32> %2046, i32 51
  store i32 %2151, i32* %2150, align 4, !tbaa !203
  %2152 = getelementptr inbounds i32, i32* %2150, i32 %27
  %2153 = extractelement <64 x i32> %2046, i32 52
  store i32 %2153, i32* %2152, align 4, !tbaa !203
  %2154 = getelementptr inbounds i32, i32* %2152, i32 %27
  %2155 = extractelement <64 x i32> %2046, i32 53
  store i32 %2155, i32* %2154, align 4, !tbaa !203
  %2156 = getelementptr inbounds i32, i32* %2154, i32 %27
  %2157 = extractelement <64 x i32> %2046, i32 54
  store i32 %2157, i32* %2156, align 4, !tbaa !203
  %2158 = getelementptr inbounds i32, i32* %2156, i32 %27
  %2159 = extractelement <64 x i32> %2046, i32 55
  store i32 %2159, i32* %2158, align 4, !tbaa !203
  %2160 = getelementptr inbounds i32, i32* %2158, i32 %27
  %2161 = extractelement <64 x i32> %2046, i32 56
  store i32 %2161, i32* %2160, align 4, !tbaa !203
  %2162 = getelementptr inbounds i32, i32* %2160, i32 %27
  %2163 = extractelement <64 x i32> %2046, i32 57
  store i32 %2163, i32* %2162, align 4, !tbaa !203
  %2164 = getelementptr inbounds i32, i32* %2162, i32 %27
  %2165 = extractelement <64 x i32> %2046, i32 58
  store i32 %2165, i32* %2164, align 4, !tbaa !203
  %2166 = getelementptr inbounds i32, i32* %2164, i32 %27
  %2167 = extractelement <64 x i32> %2046, i32 59
  store i32 %2167, i32* %2166, align 4, !tbaa !203
  %2168 = getelementptr inbounds i32, i32* %2166, i32 %27
  %2169 = extractelement <64 x i32> %2046, i32 60
  store i32 %2169, i32* %2168, align 4, !tbaa !203
  %2170 = getelementptr inbounds i32, i32* %2168, i32 %27
  %2171 = extractelement <64 x i32> %2046, i32 61
  store i32 %2171, i32* %2170, align 4, !tbaa !203
  %2172 = getelementptr inbounds i32, i32* %2170, i32 %27
  %2173 = extractelement <64 x i32> %2046, i32 62
  store i32 %2173, i32* %2172, align 4, !tbaa !203
  %2174 = getelementptr inbounds i32, i32* %2172, i32 %27
  %2175 = extractelement <64 x i32> %2046, i32 63
  store i32 %2175, i32* %2174, align 4, !tbaa !203
  %2176 = add nuw nsw i32 %output.s0.x.x.us.us.us, 1
  %.not8.us.us.us = icmp eq i32 %2176, %51
  br i1 %.not8.us.us.us, label %"end for output.s0.x.x.loopexit.us.us.us", label %"for output.s0.x.x.us.us.us"

"end for output.s0.x.x.loopexit.us.us.us":        ; preds = %"consume matrix_mul2.us.us.us"
  %2177 = add nuw nsw i32 %output.s0.y.y.us.us.us, 1
  %.not5.us.us.us = icmp eq i32 %2177, %46
  br i1 %.not5.us.us.us, label %"end for output.s0.y.y.loopexit.split.us.us.us", label %"for output.s0.y.y.us.us.us"

"end for output.s0.y.y.loopexit.split.us.us.us":  ; preds = %"end for output.s0.x.x.loopexit.us.us.us"
  %2178 = add nuw nsw i32 %output.s0.c.rebased.us.us, 1
  %.not.us.us = icmp eq i32 %2178, %24
  br i1 %.not.us.us, label %call_destructor.exit, label %"for output.s0.c.rebased.us.us"

call_destructor.exit:                             ; preds = %"end for output.s0.y.y.loopexit.split.us.us.us", %"for output.s0.c.rebased.preheader", %entry
  tail call void @halide_qurt_hvx_unlock_as_destructor(i8* null, i8* nonnull inttoptr (i32 1 to i8*)) #14
  ret i32 0
}

; Function Attrs: nounwind
define i32 @matmul_bias_relu_matmul_hvx128_argv(i8** nocapture readonly %0) local_unnamed_addr #11 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 4
  %3 = getelementptr i8*, i8** %0, i32 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 4
  %6 = getelementptr i8*, i8** %0, i32 2
  %7 = bitcast i8** %6 to %struct.halide_buffer_t**
  %8 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %7, align 4
  %9 = getelementptr i8*, i8** %0, i32 3
  %10 = bitcast i8** %9 to %struct.halide_buffer_t**
  %11 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %10, align 4
  %12 = getelementptr i8*, i8** %0, i32 4
  %13 = bitcast i8** %12 to %struct.halide_buffer_t**
  %14 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %13, align 4
  %15 = tail call i32 @matmul_bias_relu_matmul_hvx128(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5, %struct.halide_buffer_t* %8, %struct.halide_buffer_t* %11, %struct.halide_buffer_t* %14) #16
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @matmul_bias_relu_matmul_hvx128_metadata() local_unnamed_addr #12 {
entry:
  ret %struct.halide_filter_metadata_t* @matmul_bias_relu_matmul_hvx128_metadata_storage
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.0(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32>, <32 x i32>, i32) #9

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.1(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32>, <64 x i32>) #9

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.2(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.3(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.4(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.5(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.6(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.7(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.8(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.9(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.10(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.11(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.12(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.13(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.14(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.15(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.16(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.17(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.18(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.19(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.20(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.21(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.22(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.23(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.24(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.25(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.26(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.27(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.28(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.29(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.30(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i32> %arg.2) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %0)
  %2 = extractelement <1 x i16> %arg.1, i32 0
  %3 = zext i16 %2 to i32
  %4 = shl nuw i32 %3, 16
  %5 = or i32 %4, %3
  %6 = tail call <64 x i32> @llvm.hexagon.V6.vmpyh.acc.128B(<64 x i32> %arg.2, <32 x i32> %1, i32 %5)
  ret <64 x i32> %6
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.31(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.32(<64 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %arg)
  ret <64 x i32> %0
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.33(<64 x i16> %arg) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <64 x i32> @llvm.hexagon.V6.vsh.128B(<32 x i32> %0)
  ret <64 x i32> %1
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.34(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.35(<64 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %arg)
  ret <64 x i32> %0
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.36(<64 x i16> %arg) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <64 x i32> @llvm.hexagon.V6.vsh.128B(<32 x i32> %0)
  ret <64 x i32> %1
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.37(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.38(<64 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %arg)
  ret <64 x i32> %0
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.39(<64 x i16> %arg) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <64 x i32> @llvm.hexagon.V6.vsh.128B(<32 x i32> %0)
  ret <64 x i32> %1
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.40(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.41(<64 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %arg)
  ret <64 x i32> %0
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.42(<64 x i16> %arg) local_unnamed_addr #13 {
entry:
  %0 = bitcast <64 x i16> %arg to <32 x i32>
  %1 = tail call <64 x i32> @llvm.hexagon.V6.vsh.128B(<32 x i32> %0)
  ret <64 x i32> %1
}

; Function Attrs: nounwind readnone willreturn
define <64 x i32> @hydride.node.matmul_bias_relu_matmul_hvx_depth3.43(<1 x i32> %arg, <64 x i32> %arg.1) local_unnamed_addr #13 {
entry:
  %0 = extractelement <1 x i32> %arg, i32 0
  %1 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1, <32 x i32> %1)
  %3 = tail call <64 x i32> @llvm.hexagon.V6.vaddw.dv.128B(<64 x i32> %arg.1, <64 x i32> %2)
  ret <64 x i32> %3
}

attributes #0 = { nounwind mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { alwaysinline nounwind willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #9 = { nounwind readnone }
attributes #10 = { nounwind "reciprocal-estimates"="none" }
attributes #11 = { nounwind }
attributes #12 = { norecurse nounwind readnone willreturn }
attributes #13 = { nounwind readnone willreturn }
attributes #14 = { nobuiltin nounwind "no-builtins" }
attributes #15 = { nobuiltin "no-builtins" }
attributes #16 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, !"halide_use_soft_float_abi", i32 0}
!3 = !{i32 2, !"halide_mcpu", !"hexagonv66"}
!4 = !{i32 2, !"halide_mattrs", !"+hvx-length128b,+long-calls,+hvxv66"}
!5 = !{i32 2, !"halide_mabi", !""}
!6 = !{i32 2, !"halide_use_pic", i32 1}
!7 = !{i32 2, !"halide_use_large_code_model", i32 0}
!8 = !{i32 2, !"halide_per_instruction_fast_math_flags", i32 0}
!9 = !{!"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C++ TBAA"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !12, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"bool", !12, i64 0}
!20 = distinct !{!20, !17}
!21 = !{i8 0, i8 2}
!22 = !{!12, !12, i64 0}
!23 = distinct !{!23, !17}
!24 = !{!25, !25, i64 0}
!25 = !{!"double", !12, i64 0}
!26 = !{!27, !27, i64 0}
!27 = !{!"long long", !12, i64 0}
!28 = distinct !{!28, !17}
!29 = distinct !{!29, !17}
!30 = distinct !{!30, !17}
!31 = distinct !{!31, !32}
!32 = !{!"llvm.loop.unroll.disable"}
!33 = distinct !{!33, !17}
!34 = !{!35, !36, i64 0}
!35 = !{!"_ZTS13halide_type_t", !36, i64 0, !12, i64 1, !37, i64 2}
!36 = !{!"_ZTS18halide_type_code_t", !12, i64 0}
!37 = !{!"short", !12, i64 0}
!38 = !{!35, !12, i64 1}
!39 = !{!35, !37, i64 2}
!40 = !{!41, !27, i64 0}
!41 = !{!"_ZTS15halide_buffer_t", !27, i64 0, !11, i64 8, !11, i64 12, !27, i64 16, !35, i64 24, !15, i64 28, !11, i64 32, !11, i64 36}
!42 = !{!41, !11, i64 8}
!43 = !{!41, !11, i64 12}
!44 = !{!41, !27, i64 16}
!45 = !{!41, !15, i64 28}
!46 = !{!41, !11, i64 32}
!47 = !{!48, !15, i64 0}
!48 = !{!"_ZTS18halide_dimension_t", !15, i64 0, !15, i64 4, !15, i64 8, !15, i64 12}
!49 = !{!48, !15, i64 4}
!50 = !{!48, !15, i64 8}
!51 = distinct !{!51, !17}
!52 = !{!53, !11, i64 0}
!53 = !{!"_ZTS29halide_device_allocation_pool", !11, i64 0, !11, i64 4}
!54 = distinct !{!54, !17}
!55 = !{!53, !11, i64 4}
!56 = distinct !{!56, !17}
!57 = !{!58, !27, i64 0}
!58 = !{!"_ZTSN6Halide7Runtime8Internal11device_copyE", !27, i64 0, !27, i64 8, !27, i64 16, !12, i64 24, !12, i64 152, !12, i64 280, !27, i64 408}
!59 = !{!58, !27, i64 8}
!60 = !{!58, !27, i64 408}
!61 = distinct !{!61, !17}
!62 = !{!58, !27, i64 16}
!63 = distinct !{!63, !32}
!64 = distinct !{!64, !17}
!65 = distinct !{!65, !17}
!66 = distinct !{!66, !32}
!67 = distinct !{!67, !17}
!68 = distinct !{!68, !17}
!69 = distinct !{!69, !17}
!70 = !{i64 0, i64 8, !26, i64 8, i64 8, !26, i64 16, i64 8, !26, i64 24, i64 128, !22, i64 152, i64 128, !22, i64 280, i64 128, !22, i64 408, i64 8, !26}
!71 = !{!72, !11, i64 60}
!72 = !{!"_ZTS25halide_device_interface_t", !11, i64 0, !11, i64 4, !11, i64 8, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !11, i64 32, !11, i64 36, !11, i64 40, !11, i64 44, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60}
!73 = !{!74, !11, i64 24}
!74 = !{!"_ZTS30halide_device_interface_impl_t", !11, i64 0, !11, i64 4, !11, i64 8, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !11, i64 32, !11, i64 36, !11, i64 40, !11, i64 44, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60}
!75 = !{!74, !11, i64 20}
!76 = !{!74, !11, i64 28}
!77 = !{!74, !11, i64 0}
!78 = !{!74, !11, i64 8}
!79 = !{!74, !11, i64 4}
!80 = !{!74, !11, i64 16}
!81 = !{!74, !11, i64 12}
!82 = !{!74, !11, i64 32}
!83 = !{!74, !11, i64 36}
!84 = distinct !{!84, !32}
!85 = distinct !{!85, !32}
!86 = distinct !{!86, !17}
!87 = distinct !{!87, !17}
!88 = !{!74, !11, i64 56}
!89 = !{!74, !11, i64 60}
!90 = !{!74, !11, i64 40}
!91 = !{!74, !11, i64 44}
!92 = !{!74, !11, i64 48}
!93 = !{!74, !11, i64 52}
!94 = !{i32 22, i32 33}
!95 = !{!"branch_weights", i32 1073741824, i32 0}
!96 = !{!"branch_weights", i32 -2147483648, i32 0}
!97 = !{!98, !98, i64 0}
!98 = !{!"matrix_mul1.width32.base0", !99, i64 0}
!99 = !{!"matrix_mul1.width64.base0", !100, i64 0}
!100 = !{!"matrix_mul1.width128.base0", !101, i64 0}
!101 = !{!"matrix_mul1.width256.base0", !102, i64 0}
!102 = !{!"matrix_mul1.width512.base0", !103, i64 0}
!103 = !{!"matrix_mul1.width1024.base0", !104, i64 0}
!104 = !{!"matrix_mul1", !105, i64 0}
!105 = !{!"Halide buffer"}
!106 = !{!107, !107, i64 0}
!107 = !{!"matrix_mul1.width32.base32", !99, i64 0}
!108 = !{!109, !109, i64 0}
!109 = !{!"matrix_mul1.width32.base64", !110, i64 0}
!110 = !{!"matrix_mul1.width64.base64", !100, i64 0}
!111 = !{!112, !112, i64 0}
!112 = !{!"matrix_mul1.width32.base96", !110, i64 0}
!113 = !{!114, !114, i64 0}
!114 = !{!"matrix_mul1.width32.base128", !115, i64 0}
!115 = !{!"matrix_mul1.width64.base128", !116, i64 0}
!116 = !{!"matrix_mul1.width128.base128", !101, i64 0}
!117 = !{!118, !118, i64 0}
!118 = !{!"matrix_mul1.width32.base160", !115, i64 0}
!119 = !{!120, !120, i64 0}
!120 = !{!"matrix_mul1.width32.base192", !121, i64 0}
!121 = !{!"matrix_mul1.width64.base192", !116, i64 0}
!122 = !{!123, !123, i64 0}
!123 = !{!"matrix_mul1.width32.base224", !121, i64 0}
!124 = !{!125, !125, i64 0}
!125 = !{!"matrix_mul1.width32.base256", !126, i64 0}
!126 = !{!"matrix_mul1.width64.base256", !127, i64 0}
!127 = !{!"matrix_mul1.width128.base256", !128, i64 0}
!128 = !{!"matrix_mul1.width256.base256", !102, i64 0}
!129 = !{!130, !130, i64 0}
!130 = !{!"matrix_mul1.width32.base288", !126, i64 0}
!131 = !{!132, !132, i64 0}
!132 = !{!"matrix_mul1.width32.base320", !133, i64 0}
!133 = !{!"matrix_mul1.width64.base320", !127, i64 0}
!134 = !{!135, !135, i64 0}
!135 = !{!"matrix_mul1.width32.base352", !133, i64 0}
!136 = !{!137, !137, i64 0}
!137 = !{!"matrix_mul1.width32.base384", !138, i64 0}
!138 = !{!"matrix_mul1.width64.base384", !139, i64 0}
!139 = !{!"matrix_mul1.width128.base384", !128, i64 0}
!140 = !{!141, !141, i64 0}
!141 = !{!"matrix_mul1.width32.base416", !138, i64 0}
!142 = !{!143, !143, i64 0}
!143 = !{!"matrix_mul1.width32.base448", !144, i64 0}
!144 = !{!"matrix_mul1.width64.base448", !139, i64 0}
!145 = !{!146, !146, i64 0}
!146 = !{!"matrix_mul1.width32.base480", !144, i64 0}
!147 = !{!148, !148, i64 0}
!148 = !{!"matrix_mul1.width32.base512", !149, i64 0}
!149 = !{!"matrix_mul1.width64.base512", !150, i64 0}
!150 = !{!"matrix_mul1.width128.base512", !151, i64 0}
!151 = !{!"matrix_mul1.width256.base512", !152, i64 0}
!152 = !{!"matrix_mul1.width512.base512", !103, i64 0}
!153 = !{!154, !154, i64 0}
!154 = !{!"matrix_mul1.width32.base544", !149, i64 0}
!155 = !{!156, !156, i64 0}
!156 = !{!"matrix_mul1.width32.base576", !157, i64 0}
!157 = !{!"matrix_mul1.width64.base576", !150, i64 0}
!158 = !{!159, !159, i64 0}
!159 = !{!"matrix_mul1.width32.base608", !157, i64 0}
!160 = !{!161, !161, i64 0}
!161 = !{!"matrix_mul1.width32.base640", !162, i64 0}
!162 = !{!"matrix_mul1.width64.base640", !163, i64 0}
!163 = !{!"matrix_mul1.width128.base640", !151, i64 0}
!164 = !{!165, !165, i64 0}
!165 = !{!"matrix_mul1.width32.base672", !162, i64 0}
!166 = !{!167, !167, i64 0}
!167 = !{!"matrix_mul1.width32.base704", !168, i64 0}
!168 = !{!"matrix_mul1.width64.base704", !163, i64 0}
!169 = !{!170, !170, i64 0}
!170 = !{!"matrix_mul1.width32.base736", !168, i64 0}
!171 = !{!172, !172, i64 0}
!172 = !{!"matrix_mul1.width32.base768", !173, i64 0}
!173 = !{!"matrix_mul1.width64.base768", !174, i64 0}
!174 = !{!"matrix_mul1.width128.base768", !175, i64 0}
!175 = !{!"matrix_mul1.width256.base768", !152, i64 0}
!176 = !{!177, !177, i64 0}
!177 = !{!"matrix_mul1.width32.base800", !173, i64 0}
!178 = !{!179, !179, i64 0}
!179 = !{!"matrix_mul1.width32.base832", !180, i64 0}
!180 = !{!"matrix_mul1.width64.base832", !174, i64 0}
!181 = !{!182, !182, i64 0}
!182 = !{!"matrix_mul1.width32.base864", !180, i64 0}
!183 = !{!184, !184, i64 0}
!184 = !{!"matrix_mul1.width32.base896", !185, i64 0}
!185 = !{!"matrix_mul1.width64.base896", !186, i64 0}
!186 = !{!"matrix_mul1.width128.base896", !175, i64 0}
!187 = !{!188, !188, i64 0}
!188 = !{!"matrix_mul1.width32.base928", !185, i64 0}
!189 = !{!190, !190, i64 0}
!190 = !{!"matrix_mul1.width32.base960", !191, i64 0}
!191 = !{!"matrix_mul1.width64.base960", !186, i64 0}
!192 = !{!193, !193, i64 0}
!193 = !{!"matrix_mul1.width32.base992", !191, i64 0}
!194 = !{!195, !195, i64 0}
!195 = !{!"B", !105, i64 0}
!196 = !{!197, !197, i64 0}
!197 = !{!"A", !105, i64 0}
!198 = !{!199, !199, i64 0}
!199 = !{!"bias", !105, i64 0}
!200 = !{!201, !201, i64 0}
!201 = !{!"C", !105, i64 0}
!202 = !{!104, !104, i64 0}
!203 = !{!204, !204, i64 0}
!204 = !{!"output", !105, i64 0}
