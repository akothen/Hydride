; ModuleID = 'max_pool_hvx128'
source_filename = "/home/akashk4/rake/rake-halide/src/runtime/qurt_allocator.cpp"
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
@.str.8 = private unnamed_addr constant [5 x i8] c"-nan\00", align 1
@.str.1.9 = private unnamed_addr constant [4 x i8] c"nan\00", align 1
@.str.2.10 = private unnamed_addr constant [5 x i8] c"-inf\00", align 1
@.str.3.11 = private unnamed_addr constant [4 x i8] c"inf\00", align 1
@.str.4.12 = private unnamed_addr constant [14 x i8] c"-0.000000e+00\00", align 1
@.str.5.13 = private unnamed_addr constant [13 x i8] c"0.000000e+00\00", align 1
@.str.6.14 = private unnamed_addr constant [10 x i8] c"-0.000000\00", align 1
@.str.7.15 = private unnamed_addr constant [9 x i8] c"0.000000\00", align 1
@.str.8.16 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"e+\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"e-\00", align 1
@.str.12 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str.17 = private unnamed_addr constant [14 x i8] c"bad_type_code\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"handle\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"uint\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"nullptr\00", align 1
@.str.20 = private unnamed_addr constant [8 x i8] c"buffer(\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c", {\00", align 1
@.str.23 = private unnamed_addr constant [2 x i8] c"}\00", align 1
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
@.str.22.24 = private unnamed_addr constant [101 x i8] c"/home/akashk4/rake/rake-halide/src/runtime/device_interface.cpp:252 Assert failed: buf->device == 0\0A\00", align 1
@.str.23.25 = private unnamed_addr constant [30 x i8] c"halide_device_and_host_malloc\00", align 1
@.str.25 = private unnamed_addr constant [68 x i8] c"halide_device_and_host_malloc doesn't support switching interfaces\0A\00", align 1
@.str.26 = private unnamed_addr constant [42 x i8] c"allocating host and device memory failed\0A\00", align 1
@.str.27 = private unnamed_addr constant [28 x i8] c"halide_device_and_host_free\00", align 1
@.str.28 = private unnamed_addr constant [101 x i8] c"/home/akashk4/rake/rake-halide/src/runtime/device_interface.cpp:317 Assert failed: buf->device == 0\0A\00", align 1
@.str.29 = private unnamed_addr constant [38 x i8] c"halide_default_device_and_host_malloc\00", align 1
@.str.30 = private unnamed_addr constant [36 x i8] c"halide_default_device_and_host_free\00", align 1
@.str.31 = private unnamed_addr constant [26 x i8] c"halide_device_wrap_native\00", align 1
@.str.32 = private unnamed_addr constant [64 x i8] c"halide_device_wrap_native doesn't support switching interfaces\0A\00", align 1
@.str.33 = private unnamed_addr constant [28 x i8] c"halide_device_detach_native\00", align 1
@.str.34 = private unnamed_addr constant [101 x i8] c"/home/akashk4/rake/rake-halide/src/runtime/device_interface.cpp:403 Assert failed: buf->device == 0\0A\00", align 1
@.str.35 = private unnamed_addr constant [34 x i8] c"halide_default_device_wrap_native\00", align 1
@.str.36 = private unnamed_addr constant [36 x i8] c"halide_default_device_detach_native\00", align 1
@.str.42 = private unnamed_addr constant [64 x i8] c"halide_buffer_copy does not support switching device interfaces\00", align 1
@.str.58 = private unnamed_addr constant [44 x i8] c"device_interface does not support cropping\0A\00", align 1
@.str.59 = private unnamed_addr constant [43 x i8] c"device_interface does not support slicing\0A\00", align 1
@.str.60 = private unnamed_addr constant [52 x i8] c"destination buffer already has a device allocation\0A\00", align 1
@.str.61 = private unnamed_addr constant [48 x i8] c"src and dst must have identical dimensionality\0A\00", align 1
@.str.64 = private unnamed_addr constant [52 x i8] c"dst must have exactly one fewer dimension than src\0A\00", align 1
@.str.37 = private unnamed_addr constant [41 x i8] c"Bounds inference call to external stage \00", align 1
@.str.74 = private unnamed_addr constant [10 x i8] c"<nullptr>\00", align 1
@.str.1.38 = private unnamed_addr constant [27 x i8] c" returned non-zero value: \00", align 1
@.str.2.39 = private unnamed_addr constant [24 x i8] c"Call to external stage \00", align 1
@.str.3.40 = private unnamed_addr constant [18 x i8] c"Bounds given for \00", align 1
@.str.4.41 = private unnamed_addr constant [5 x i8] c" in \00", align 1
@.str.5.42 = private unnamed_addr constant [8 x i8] c" (from \00", align 1
@.str.6.43 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@.str.7.44 = private unnamed_addr constant [38 x i8] c") do not cover required region (from \00", align 1
@.str.8.45 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.9.46 = private unnamed_addr constant [11 x i8] c" has type \00", align 1
@.str.10.47 = private unnamed_addr constant [38 x i8] c" but type of the buffer passed in is \00", align 1
@.str.11.48 = private unnamed_addr constant [31 x i8] c" requires a buffer of exactly \00", align 1
@.str.12.49 = private unnamed_addr constant [43 x i8] c" dimensions, but the buffer passed in has \00", align 1
@.str.13.50 = private unnamed_addr constant [12 x i8] c" dimensions\00", align 1
@.str.14.51 = private unnamed_addr constant [17 x i8] c" is accessed at \00", align 1
@.str.15.52 = private unnamed_addr constant [28 x i8] c", which is before the min (\00", align 1
@.str.16.53 = private unnamed_addr constant [16 x i8] c") in dimension \00", align 1
@.str.17.54 = private unnamed_addr constant [28 x i8] c", which is beyond the max (\00", align 1
@.str.18.55 = private unnamed_addr constant [29 x i8] c"Total allocation for buffer \00", align 1
@.str.19.56 = private unnamed_addr constant [5 x i8] c" is \00", align 1
@.str.20.57 = private unnamed_addr constant [37 x i8] c", which exceeds the maximum size of \00", align 1
@.str.21.58 = private unnamed_addr constant [24 x i8] c"The extents for buffer \00", align 1
@.str.22.59 = private unnamed_addr constant [12 x i8] c" dimension \00", align 1
@.str.23.60 = private unnamed_addr constant [15 x i8] c" is negative (\00", align 1
@.str.24.61 = private unnamed_addr constant [31 x i8] c"Product of extents for buffer \00", align 1
@.str.25.62 = private unnamed_addr constant [29 x i8] c"Applying the constraints on \00", align 1
@.str.26.63 = private unnamed_addr constant [54 x i8] c" to the required region made it smaller in dimension \00", align 1
@.str.27.64 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.28.65 = private unnamed_addr constant [16 x i8] c"Required size: \00", align 1
@.str.29.66 = private unnamed_addr constant [19 x i8] c"Constrained size: \00", align 1
@.str.30.67 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.31.68 = private unnamed_addr constant [22 x i8] c"Constraint violated: \00", align 1
@.str.32.69 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.33.70 = private unnamed_addr constant [6 x i8] c") == \00", align 1
@.str.34.71 = private unnamed_addr constant [11 x i8] c"Parameter \00", align 1
@.str.35.72 = private unnamed_addr constant [23 x i8] c" but must be at least \00", align 1
@.str.36.73 = private unnamed_addr constant [22 x i8] c" but must be at most \00", align 1
@.str.37.74 = private unnamed_addr constant [47 x i8] c"Out of memory (halide_malloc returned nullptr)\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"Buffer argument \00", align 1
@.str.39 = private unnamed_addr constant [12 x i8] c" is nullptr\00", align 1
@.str.40 = private unnamed_addr constant [25 x i8] c"Failed to dump function \00", align 1
@.str.41 = private unnamed_addr constant [10 x i8] c" to file \00", align 1
@.str.42.75 = private unnamed_addr constant [13 x i8] c" with error \00", align 1
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
@.str.58.76 = private unnamed_addr constant [3 x i8] c"].\00", align 1
@.str.59.77 = private unnamed_addr constant [47 x i8] c" which wraps around the boundary of the fold, \00", align 1
@.str.60.78 = private unnamed_addr constant [30 x i8] c"which occurs at multiples of \00", align 1
@.str.61.79 = private unnamed_addr constant [18 x i8] c"The fold factor (\00", align 1
@.str.62 = private unnamed_addr constant [16 x i8] c") of dimension \00", align 1
@.str.63 = private unnamed_addr constant [61 x i8] c" is too small to store the required region accessed by loop \00", align 1
@.str.64.80 = private unnamed_addr constant [3 x i8] c").\00", align 1
@.str.65 = private unnamed_addr constant [22 x i8] c"Requirement Failed: (\00", align 1
@.str.66 = private unnamed_addr constant [3 x i8] c") \00", align 1
@.str.67 = private unnamed_addr constant [59 x i8] c"A schedule specialized with specialize_fail() was chosen: \00", align 1
@.str.68 = private unnamed_addr constant [55 x i8] c"Buffer has a non-zero device but no device interface.\0A\00", align 1
@.str.69 = private unnamed_addr constant [57 x i8] c"Buffer has a non-null device_interface but device is 0.\0A\00", align 1
@.str.70 = private unnamed_addr constant [49 x i8] c"Buffer has both host and device dirty bits set.\0A\00", align 1
@.str.71 = private unnamed_addr constant [26 x i8] c"Buffer pointer passed to \00", align 1
@.str.72 = private unnamed_addr constant [11 x i8] c" is null.\0A\00", align 1
@.str.4.93 = private unnamed_addr constant [22 x i8] c"qurt_hvx_lock failed\0A\00", align 1
@.str.7.94 = private unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@.str.6.95 = private unnamed_addr constant [24 x i8] c"qurt_hvx_unlock failed\0A\00", align 1
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 4
@_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 4
@_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE = linkonce global [4 x i64] zeroinitializer, align 8
@.str.96 = private unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@0 = private constant [8 x i64*] zeroinitializer
@str = private constant [6 x i8] c"input\00", align 32
@str.104 = private constant [9 x i8] c"stride_x\00", align 32
@str.105 = private constant [9 x i8] c"stride_y\00", align 32
@str.106 = private constant [13 x i8] c"filter_width\00", align 32
@str.107 = private constant [14 x i8] c"filter_height\00", align 32
@str.108 = private constant [11 x i8] c"output_min\00", align 32
@str.109 = private constant [11 x i8] c"output_max\00", align 32
@1 = private constant [8 x i64*] zeroinitializer
@str.110 = private constant [7 x i8] c"output\00", align 32
@2 = private constant [8 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str, i32 0, i32 0), i32 1, i32 4, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([8 x i64*], [8 x i64*]* @0, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.104, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.105, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.106, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.107, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.108, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.109, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.110, i32 0, i32 0), i32 2, i32 4, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([8 x i64*], [8 x i64*]* @1, i32 0, i32 0) }]
@str.111 = private constant [63 x i8] c"hexagon-32-noos-hvx-hvx_128-hvx_v66-no_asserts-no_bounds_query\00", align 128
@str.112 = private constant [16 x i8] c"max_pool_hvx128\00", align 32
@max_pool_hvx128_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 8, %struct.halide_filter_argument_t* getelementptr inbounds ([8 x %struct.halide_filter_argument_t], [8 x %struct.halide_filter_argument_t]* @2, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @str.111, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.112, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16, i32 0, i32 0)], align 4

; Function Attrs: nounwind mustprogress
define linkonce i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 %alignment, i32 %size) local_unnamed_addr #0 {
entry:
  %add = add i32 %alignment, -1
  %sub = add i32 %add, %size
  %neg = sub i32 0, %alignment
  %and = and i32 %sub, %neg
  %add2 = add i32 %and, %alignment
  %call = tail call i8* @malloc(i32 %add2) #13
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
  tail call void @free(i8* %1) #13
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @free(i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv() #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 0), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %0) #14
  %1 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 1), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %1) #14
  %2 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 2), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %2) #14
  %3 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 3), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %3) #14
  %4 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 4), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %4) #14
  %5 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 5), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %5) #14
  %6 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 6), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %6) #14
  %7 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 7), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %7) #14
  %8 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 8), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %8) #14
  %9 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 9), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %9) #14
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
  %call = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 65536) #14
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
  %call10 = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 %x) #14
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
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %ptr) #14
  br label %return
}

; Function Attrs: nounwind mustprogress
define weak i8* (i8*, i32)* @halide_set_custom_malloc(i8* (i8*, i32)* %user_malloc) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0)) #13
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !10
  store i8* (i8*, i32)* %user_malloc, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !10
  ret i8* (i8*, i32)* %0
}

declare void @halide_print(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void (i8*, i8*)* @halide_set_custom_free(void (i8*, i8*)* %user_free) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0)) #13
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !10
  store void (i8*, i8*)* %user_free, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !10
  ret void (i8*, i8*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_malloc(i8* %user_context, i32 %x) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @halide_default_malloc(i8* %user_context, i32 %x) #14
  ret i8* %call
}

; Function Attrs: nounwind mustprogress
define weak void @halide_free(i8* %user_context, i8* %ptr) local_unnamed_addr #0 {
entry:
  tail call void @halide_default_free(i8* %user_context, i8* %ptr) #14
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %idx, i8* %closure) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #13
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
  %call = tail call i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %x.012, i8* %closure) #14
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
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.1, i32 0, i32 0)) #13
  ret i32 -1
}

declare void @halide_error(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1.2, i32 0, i32 0)) #13
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i32 0, i32 0)) #13
  ret i1 false
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.2, i32 0, i32 0)) #13
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %f, i8* %closure) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)) #13
  ret %struct.halide_thread* null
}

; Function Attrs: nounwind mustprogress
define weak void @halide_join_thread(%struct.halide_thread* %thread_arg) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.5, i32 0, i32 0)) #13
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
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.6, i32 0, i32 0)) #13
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
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 4, !tbaa !10
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 4, !tbaa !10
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 4, !tbaa !10
  %call = tail call zeroext i1 %0(%struct.halide_semaphore_t* %sema, i32 %count) #13
  ret i1 %call
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i8* @memcpy(i8*, i8*, i32) local_unnamed_addr #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

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
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i32 0, i32 0)) #13
  %tobool1.not = icmp eq i8* %call, null
  br i1 %tobool1.not, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call3 = tail call i32 @atoi(i8* nonnull %call) #13
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
  br i1 %cmp.not, label %if.end3, label %return

if.then2:                                         ; preds = %if.end6
  store i8 0, i8* %dst.addr.020, align 1, !tbaa !22
  br label %return

if.end3:                                          ; preds = %entry, %if.end6
  %arg.addr.021 = phi i8* [ %incdec.ptr7, %if.end6 ], [ %arg, %entry ]
  %dst.addr.020 = phi i8* [ %incdec.ptr, %if.end6 ], [ %dst, %entry ]
  %0 = load i8, i8* %arg.addr.021, align 1, !tbaa !22
  store i8 %0, i8* %dst.addr.020, align 1, !tbaa !22
  %cmp4 = icmp eq i8 %0, 0
  br i1 %cmp4, label %return, label %if.end6

if.end6:                                          ; preds = %if.end3
  %incdec.ptr = getelementptr inbounds i8, i8* %dst.addr.020, i32 1
  %incdec.ptr7 = getelementptr inbounds i8, i8* %arg.addr.021, i32 1
  %cmp1 = icmp eq i8* %incdec.ptr, %end
  br i1 %cmp1, label %if.then2, label %if.end3

return:                                           ; preds = %if.end3, %if.then2, %entry
  %retval.0 = phi i8* [ %end, %if.then2 ], [ %dst, %entry ], [ %dst.addr.020, %if.end3 ]
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
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #14
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
  %call = tail call i8* @halide_uint64_to_string(i8* %dst.addr.0, i8* %end, i64 %arg.addr.0, i32 %min_digits) #14
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
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %1, i32 8) #13
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
  %call7 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0)) #14
  br label %cleanup147

if.else:                                          ; preds = %if.then4
  %call8 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.9, i32 0, i32 0)) #14
  br label %cleanup147

if.else9:                                         ; preds = %if.then
  br i1 %tobool10.not, label %if.else13, label %if.then11

if.then11:                                        ; preds = %if.else9
  %call12 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.10, i32 0, i32 0)) #14
  br label %cleanup147

if.else13:                                        ; preds = %if.else9
  %call14 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.11, i32 0, i32 0)) #14
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
  %call23 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4.12, i32 0, i32 0)) #14
  br label %cleanup147

if.else24:                                        ; preds = %if.then20
  %call25 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5.13, i32 0, i32 0)) #14
  br label %cleanup147

if.else26:                                        ; preds = %if.then18
  br i1 %tobool27.not, label %if.else30, label %if.then28

if.then28:                                        ; preds = %if.else26
  %call29 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6.14, i32 0, i32 0)) #14
  br label %cleanup147

if.else30:                                        ; preds = %if.else26
  %call31 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7.15, i32 0, i32 0)) #14
  br label %cleanup147

if.end32:                                         ; preds = %if.else15
  %tobool33.not = icmp sgt i64 %2, -1
  br i1 %tobool33.not, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.end32
  %call35 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.16, i32 0, i32 0)) #14
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
  %call49 = call i8* @halide_int64_to_string(i8* %dst.addr.0, i8* %end, i64 %div46, i32 1) #14
  %call50 = call i8* @halide_string_to_string(i8* %call49, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #14
  %call51 = call i8* @halide_int64_to_string(i8* %call50, i8* %end, i64 %sub48, i32 6) #14
  %cmp52 = icmp sgt i32 %exponent_base_10.1.lcssa, -1
  br i1 %cmp52, label %if.then53, label %if.else55

if.then53:                                        ; preds = %while.end43
  %call54 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0)) #14
  br label %if.end58

if.else55:                                        ; preds = %while.end43
  %call56 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0)) #14
  %sub57 = sub nsw i32 0, %exponent_base_10.1.lcssa
  br label %if.end58

if.end58:                                         ; preds = %if.else55, %if.then53
  %exponent_base_10.2 = phi i32 [ %exponent_base_10.1.lcssa, %if.then53 ], [ %sub57, %if.else55 ]
  %dst.addr.1 = phi i8* [ %call54, %if.then53 ], [ %call56, %if.else55 ]
  %conv59261 = zext i32 %exponent_base_10.2 to i64
  %call60 = call i8* @halide_int64_to_string(i8* %dst.addr.1, i8* %end, i64 %conv59261, i32 2) #14
  br label %cleanup147

if.else61:                                        ; preds = %if.end36
  br i1 %cmp16, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.else61
  %call64 = call i8* @halide_double_to_string(i8* %dst.addr.0, i8* %end, double 0.000000e+00, i32 0) #14
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
  %call108 = call i8* @halide_int64_to_string(i8* nonnull %add.ptr105, i8* nonnull %add.ptr, i64 %integer_part.2, i32 1) #14
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
  %call141 = call i8* @halide_string_to_string(i8* %dst.addr.0, i8* %end, i8* %int_part_ptr.0.lcssa) #14
  %call142 = call i8* @halide_string_to_string(i8* %call141, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #14
  %call143 = call i8* @halide_int64_to_string(i8* %call142, i8* %end, i64 %fractional_part.2, i32 6) #14
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
  %arrayidx = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %idxprom
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !22
  %incdec.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 17
  store i8 %2, i8* %add.ptr, align 1, !tbaa !22
  %3 = lshr i32 %1, 4
  %tobool.not = icmp eq i32 %3, 0
  br i1 %tobool.not, label %cleanup, label %for.cond

for.cond:                                         ; preds = %entry
  %idxprom.1 = and i32 %3, 15
  %arrayidx.1 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %idxprom.1
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
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #14
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %0) #11
  ret i8* %call

for.cond.1:                                       ; preds = %for.cond
  %idxprom.2 = and i32 %5, 15
  %arrayidx.2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %idxprom.2
  %6 = load i8, i8* %arrayidx.2, align 1, !tbaa !22
  %incdec.ptr.2 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 15
  store i8 %6, i8* %incdec.ptr.1, align 1, !tbaa !22
  %7 = lshr i32 %1, 12
  %tobool.not.2 = icmp eq i32 %7, 0
  br i1 %tobool.not.2, label %cleanup, label %for.cond.2

for.cond.2:                                       ; preds = %for.cond.1
  %idxprom.3 = and i32 %7, 15
  %arrayidx.3 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %idxprom.3
  %8 = load i8, i8* %arrayidx.3, align 1, !tbaa !22
  %incdec.ptr.3 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 14
  store i8 %8, i8* %incdec.ptr.2, align 1, !tbaa !22
  %9 = lshr i32 %1, 16
  %tobool.not.3 = icmp eq i32 %9, 0
  br i1 %tobool.not.3, label %cleanup, label %for.cond.3

for.cond.3:                                       ; preds = %for.cond.2
  %idxprom.4 = and i32 %9, 15
  %arrayidx.4 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %idxprom.4
  %10 = load i8, i8* %arrayidx.4, align 1, !tbaa !22
  %incdec.ptr.4 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 13
  store i8 %10, i8* %incdec.ptr.3, align 1, !tbaa !22
  %11 = lshr i32 %1, 20
  %tobool.not.4 = icmp eq i32 %11, 0
  br i1 %tobool.not.4, label %cleanup, label %for.cond.4

for.cond.4:                                       ; preds = %for.cond.3
  %idxprom.5 = and i32 %11, 15
  %arrayidx.5 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %idxprom.5
  %12 = load i8, i8* %arrayidx.5, align 1, !tbaa !22
  %incdec.ptr.5 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 12
  store i8 %12, i8* %incdec.ptr.4, align 1, !tbaa !22
  %13 = lshr i32 %1, 24
  %tobool.not.5 = icmp eq i32 %13, 0
  br i1 %tobool.not.5, label %cleanup, label %for.cond.5

for.cond.5:                                       ; preds = %for.cond.4
  %idxprom.6 = and i32 %13, 15
  %arrayidx.6 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %idxprom.6
  %14 = load i8, i8* %arrayidx.6, align 1, !tbaa !22
  %incdec.ptr.6 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i32 0, i32 11
  store i8 %14, i8* %incdec.ptr.5, align 1, !tbaa !22
  %15 = lshr i32 %1, 28
  %tobool.not.6 = icmp eq i32 %15, 0
  br i1 %tobool.not.6, label %cleanup, label %for.cond.6

for.cond.6:                                       ; preds = %for.cond.5
  %arrayidx.7 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12, i32 0, i32 %15
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
  %code_name.0 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.17, i32 0, i32 0), %entry ]
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %code_name.0) #14
  %bits = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 1
  %3 = load i8, i8* %bits, align 1, !tbaa !38
  %conv4 = zext i8 %3 to i64
  %call5 = tail call i8* @halide_uint64_to_string(i8* %call, i8* %end, i64 %conv4, i32 1) #14
  %lanes = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 2
  %4 = load i16, i16* %lanes, align 2, !tbaa !39
  %cmp.not = icmp eq i16 %4, 1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %sw.epilog
  %call7 = tail call i8* @halide_string_to_string(i8* %call5, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i32 0, i32 0)) #14
  %5 = load i16, i16* %lanes, align 2, !tbaa !39
  %conv9 = zext i16 %5 to i64
  %call10 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %conv9, i32 1) #14
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
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19, i32 0, i32 0)) #14
  br label %return

if.end:                                           ; preds = %entry
  %call1 = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #14
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %call2 = tail call i8* @halide_uint64_to_string(i8* %call1, i8* %end, i64 %0, i32 1) #14
  %call3 = tail call i8* @halide_string_to_string(i8* %call2, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = bitcast %struct.halide_device_interface_t** %device_interface to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !42
  %call4 = tail call i8* @halide_pointer_to_string(i8* %call3, i8* %end, i8* %2) #14
  %call5 = tail call i8* @halide_string_to_string(i8* %call4, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %3 = load i8*, i8** %host, align 4, !tbaa !43
  %call6 = tail call i8* @halide_pointer_to_string(i8* %call5, i8* %end, i8* %3) #14
  %call7 = tail call i8* @halide_string_to_string(i8* %call6, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %flags = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %4 = load i64, i64* %flags, align 8, !tbaa !44
  %call8 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %4, i32 1) #14
  %call9 = tail call i8* @halide_string_to_string(i8* %call8, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %type = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 4
  %call10 = tail call i8* @halide_type_to_string(i8* %call9, i8* %end, %struct.halide_type_t* nonnull %type) #14
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 5
  %5 = load i32, i32* %dimensions, align 4, !tbaa !45
  %cmp1177 = icmp sgt i32 %5, 0
  br i1 %cmp1177, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 6
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %dst.addr.0.lcssa = phi i8* [ %call10, %if.end ], [ %call24, %for.body ]
  %call25 = tail call i8* @halide_string_to_string(i8* %dst.addr.0.lcssa, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.45, i32 0, i32 0)) #14
  br label %return

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.079 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %dst.addr.078 = phi i8* [ %call10, %for.body.lr.ph ], [ %call24, %for.body ]
  %call12 = tail call i8* @halide_string_to_string(i8* %dst.addr.078, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0)) #14
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 %i.079, i32 0
  %7 = load i32, i32* %min, align 4, !tbaa !47
  %conv = sext i32 %7 to i64
  %call13 = tail call i8* @halide_int64_to_string(i8* %call12, i8* %end, i64 %conv, i32 1) #14
  %call14 = tail call i8* @halide_string_to_string(i8* %call13, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %extent = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i32 %i.079, i32 1
  %9 = load i32, i32* %extent, align 4, !tbaa !49
  %conv17 = sext i32 %9 to i64
  %call18 = tail call i8* @halide_int64_to_string(i8* %call14, i8* %end, i64 %conv17, i32 1) #14
  %call19 = tail call i8* @halide_string_to_string(i8* %call18, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #14
  %10 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %10, i32 %i.079, i32 2
  %11 = load i32, i32* %stride, align 4, !tbaa !50
  %conv22 = sext i32 %11 to i64
  %call23 = tail call i8* @halide_int64_to_string(i8* %call19, i8* %end, i64 %conv22, i32 1) #14
  %call24 = tail call i8* @halide_string_to_string(i8* %call23, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23, i32 0, i32 0)) #14
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #13
  %p.014 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  %cmp.not15 = icmp eq %struct.halide_device_allocation_pool* %p.014, null
  br i1 %cmp.not15, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.then
  %err.0.lcssa = phi i32 [ 0, %if.then ], [ %spec.select, %for.body ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #13
  br label %if.end5

for.body:                                         ; preds = %if.then, %for.body
  %p.017 = phi %struct.halide_device_allocation_pool* [ %p.0, %for.body ], [ %p.014, %if.then ]
  %err.016 = phi i32 [ %spec.select, %for.body ], [ 0, %if.then ]
  %release_unused = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i32 0, i32 0
  %0 = load i32 (i8*)*, i32 (i8*)** %release_unused, align 4, !tbaa !52
  %call = tail call i32 %0(i8* %user_context) #13
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #13
  %0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %pool, i32 0, i32 1
  store %struct.halide_device_allocation_pool* %0, %struct.halide_device_allocation_pool** %next, align 4, !tbaa !55
  store %struct.halide_device_allocation_pool* %pool, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #13
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
  %call = tail call i8* @memcpy(i8* %5, i8* %3, i32 %conv5) #13
  br label %if.end

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %inc.phi = phi i64 [ %inc.0, %for.body.lr.ph ], [ %inc.1, %for.body.for.body_crit_edge ]
  %src_off.addr.037 = phi i64 [ %src_off, %for.body.lr.ph ], [ %add10, %for.body.for.body_crit_edge ]
  %dst_off.addr.036 = phi i64 [ %dst_off, %for.body.lr.ph ], [ %add12, %for.body.for.body_crit_edge ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %sub, i64 %src_off.addr.037, i64 %dst_off.addr.036) #14
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
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 15, i64 %2, i64 0) #14
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
  %call16 = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  %cmp17.not = icmp eq i32 %call16, 0
  br i1 %cmp17.not, label %if.end23, label %return

if.end23:                                         ; preds = %if.end15
  %4 = load i64, i64* %flags.i.i, align 8, !tbaa !44
  %and.i.i44 = and i64 %4, -3
  store i64 %and.i.i44, i64* %flags.i.i, align 8, !tbaa !44
  %call24 = tail call i32 @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
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
  %call = tail call i32 %1(i8* %user_context) #13
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6.17, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  br label %cleanup

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) #14
  br label %cleanup

cleanup:                                          ; preds = %if.end16.i.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.18, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  %call8 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9.19, i32 0, i32 0)) #13
  br label %cleanup

if.then18:                                        ; preds = %if.end11
  %call19 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* nonnull %device_interface.addr.0) #14
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
  %call44 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17.20, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.21, i32 0, i32 0)) #13
  br label %cleanup12

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #13
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 2
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_malloc, align 4, !tbaa !78
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #13
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  %call = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) #14
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_sync(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16.22, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  %call4 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %cleanup8

if.end5:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_sync = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 4
  %6 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_sync, align 4, !tbaa !80
  %call6 = tail call i32 %6(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.23, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  tail call void %6() #13
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 3
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_free, align 4, !tbaa !81
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #13
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([101 x i8], [101 x i8]* @.str.22.24, i32 0, i32 0)) #13
  tail call void @abort() #13
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
  %call = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %0) #14
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.25, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25, i32 0, i32 0)) #13
  br label %cleanup14

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #13
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_and_host_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 8
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_malloc, align 4, !tbaa !82
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #13
  %cmp11.not = icmp eq i32 %call9, 0
  br i1 %cmp11.not, label %cleanup14, label %if.then12

if.then12:                                        ; preds = %if.end7
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26, i32 0, i32 0)) #13
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  tail call void %6() #13
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_and_host_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 9
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_free, align 4, !tbaa !83
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #13
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([101 x i8], [101 x i8]* @.str.28, i32 0, i32 0)) #13
  tail call void @abort() #13
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
  tail call void @halide_free(i8* %user_context, i8* nonnull %12) #13
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  %call2 = tail call i8* @halide_malloc(i8* %user_context, i32 %mul.i) #13
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  store i8* %call2, i8** %host, align 4, !tbaa !43
  %cmp4 = icmp eq i8* %call2, null
  br i1 %cmp4, label %cleanup13, label %if.end6

if.end6:                                          ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %call7 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* %device_interface) #14
  %cmp8.not = icmp eq i32 %call7, 0
  br i1 %cmp8.not, label %cleanup13, label %if.then9

if.then9:                                         ; preds = %if.end6
  %21 = load i8*, i8** %host, align 4, !tbaa !43
  tail call void @halide_free(i8* %user_context, i8* %21) #13
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #14
  br label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) #14
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %if.end16.i.split
  %phi.call = phi i32 [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %4 = load i8*, i8** %host, align 4, !tbaa !43
  %tobool.not = icmp eq i8* %4, null
  br i1 %tobool.not, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @halide_free(i8* %user_context, i8* nonnull %4) #13
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32, i32 0, i32 0)) #13
  br label %cleanup12

if.end5:                                          ; preds = %if.end
  %device_interface1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #13
  store %struct.halide_device_interface_t* %device_interface, %struct.halide_device_interface_t** %device_interface1, align 8, !tbaa !42
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %wrap_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 14
  %8 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %wrap_native, align 4, !tbaa !88
  %call8 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, i64 %handle) #13
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #13
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  tail call void %6() #13
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %detach_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 15
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %detach_native, align 4, !tbaa !89
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #13
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([101 x i8], [101 x i8]* @.str.34, i32 0, i32 0)) #13
  tail call void @abort() #13
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
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.35, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.phi.trans.insert, align 8, !tbaa !42
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #13
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  store i64 %handle, i64* %device, align 8, !tbaa !40
  br label %cleanup

cleanup:                                          ; preds = %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ 0, %if.end ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_detach_native(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.36, i32 0, i32 0)) #13
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #13
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #13
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
  tail call void %7() #13
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
  %call = tail call i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %0) #14
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.42, i32 0, i32 0)) #13
  br label %cleanup135

land.lhs.true5:                                   ; preds = %land.lhs.true
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device, align 8, !tbaa !40
  %tobool6.not = icmp eq i64 %1, 0
  br i1 %tobool6.not, label %if.then7, label %if.end13

if.then7:                                         ; preds = %land.lhs.true5
  %call = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #14
  %tobool10.not = icmp eq i32 %call, 0
  br i1 %tobool10.not, label %if.end13, label %cleanup135

if.end13:                                         ; preds = %if.then7, %land.lhs.true5, %entry
  %device14 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 0
  %2 = load i64, i64* %device14, align 8, !tbaa !40
  %cmp15.not = icmp eq i64 %2, 0
  %host22.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 2
  %.pre = load i8*, i8** %host22.phi.trans.insert, align 4, !tbaa !43
  %cmp23.not = icmp eq i8* %.pre, null
  br i1 %cmp15.not, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.thread250

land.end.thread250:                               ; preds = %land.rhs
  %flags.i.i229 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %3 = load i64, i64* %flags.i.i229, align 8, !tbaa !44
  %and.i.i230 = and i64 %3, 1
  %cmp.i.i.not = icmp ne i64 %and.i.i230, 0
  br label %land.rhs26

land.end:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.land.rhs26_crit_edge

land.end.land.rhs26_crit_edge:                    ; preds = %land.end
  %flags.i.i233.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 3
  %.pre1 = load i64, i64* %flags.i.i233.phi.trans.insert, align 8, !tbaa !44
  br label %land.rhs26

land.rhs26:                                       ; preds = %land.end.land.rhs26_crit_edge, %land.end.thread250
  %4 = phi i64 [ %3, %land.end.thread250 ], [ %.pre1, %land.end.land.rhs26_crit_edge ]
  %5 = phi i1 [ %cmp.i.i.not, %land.end.thread250 ], [ true, %land.end.land.rhs26_crit_edge ]
  %and.i.i234 = and i64 %4, 2
  %cmp.i.i235.not = icmp eq i64 %and.i.i234, 0
  br i1 %cmp.i.i235.not, label %land.end32, label %lor.rhs28

lor.rhs28:                                        ; preds = %land.rhs26
  %device_interface29 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface29, align 8, !tbaa !42
  %cmp30 = icmp ne %struct.halide_device_interface_t* %6, null
  br label %land.end32

land.end32:                                       ; preds = %lor.rhs28, %land.rhs26, %land.end, %land.rhs
  %cmp23.not249 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ false, %lor.rhs28 ], [ true, %land.rhs ]
  %7 = phi i1 [ true, %land.end ], [ %5, %land.rhs26 ], [ %5, %lor.rhs28 ], [ false, %land.rhs ]
  %8 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ %cmp30, %lor.rhs28 ], [ true, %land.rhs ]
  %host34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 2
  %9 = load i8*, i8** %host34, align 4, !tbaa !43
  %cmp35.not = icmp eq i8* %9, null
  %cmp20.not = xor i1 %tobool.not, true
  %10 = and i1 %tobool.not, %cmp35.not
  br i1 %10, label %cleanup135, label %if.end41

if.end41:                                         ; preds = %land.end32
  %brmerge218 = or i1 %tobool.not, %7
  br i1 %brmerge218, label %if.then51, label %if.end49

if.end49:                                         ; preds = %if.end41
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %11 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %buffer_copy = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %11, i32 0, i32 10
  %12 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy, align 4, !tbaa !90
  %call48 = tail call i32 %12(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #13
  %cmp50 = icmp eq i32 %call48, -42
  br i1 %cmp50, label %if.then51, label %if.end109

if.then51:                                        ; preds = %if.end49, %if.end41
  %brmerge220.demorgan = and i1 %cmp23.not249, %cmp35.not
  br i1 %brmerge220.demorgan, label %cleanup135, label %if.end58

if.end58:                                         ; preds = %if.then51
  %brmerge223 = or i1 %8, %cmp20.not
  br i1 %brmerge223, label %if.else, label %if.end109.thread244

if.end109.thread244:                              ; preds = %if.end58
  %13 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %13) #11
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %c, %struct.halide_buffer_t* nonnull %src, i1 zeroext true, %struct.halide_buffer_t* nonnull %dst, i1 zeroext true) #14
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %c, i8* %user_context) #14
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %13) #11
  br label %land.lhs.true118

if.else:                                          ; preds = %if.end58
  br i1 %tobool.not, label %if.then64, label %if.else79

if.then64:                                        ; preds = %if.else
  %device_interface67 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %14 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface67, align 8, !tbaa !42
  %impl68 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %14, i32 0, i32 15
  %15 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl68, align 4, !tbaa !71
  %buffer_copy69 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %15, i32 0, i32 10
  %16 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy69, align 4, !tbaa !90
  %call70 = tail call i32 %16(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #13
  %cmp71 = icmp eq i32 %call70, -42
  br i1 %cmp71, label %if.then72, label %if.end109

if.then72:                                        ; preds = %if.then64
  %call73 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #14
  %tobool74.not = icmp eq i32 %call73, 0
  br i1 %tobool74.not, label %if.then75, label %cleanup135

if.then75:                                        ; preds = %if.then72
  %call76 = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #14
  br label %if.end109

if.else79:                                        ; preds = %if.else
  %brmerge225 = or i1 %7, %cmp35.not
  br i1 %brmerge225, label %if.else96, label %if.then83

if.then83:                                        ; preds = %if.else79
  %device_interface88 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %17 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface88, align 8, !tbaa !42
  %impl89 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %17, i32 0, i32 15
  %18 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl89, align 4, !tbaa !71
  %buffer_copy90 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %18, i32 0, i32 10
  %19 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy90, align 4, !tbaa !90
  %call91 = tail call i32 %19(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #13
  %cmp92 = icmp eq i32 %call91, 0
  br i1 %cmp92, label %if.then93, label %cleanup135

if.then93:                                        ; preds = %if.then83
  %flags.i.i231 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %20 = load i64, i64* %flags.i.i231, align 8, !tbaa !44
  %or.i.i232 = or i64 %20, 1
  store i64 %or.i.i232, i64* %flags.i.i231, align 8, !tbaa !44
  %call94 = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #14
  br label %if.end109

if.else96:                                        ; preds = %if.else79
  %call99 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #14
  %cmp100 = icmp eq i32 %call99, 0
  br i1 %cmp100, label %if.then101, label %cleanup135

if.then101:                                       ; preds = %if.else96
  %impl102 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %21 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl102, align 4, !tbaa !71
  %buffer_copy103 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %21, i32 0, i32 10
  %22 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy103, align 4, !tbaa !90
  %call104 = tail call i32 %22(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #13
  br label %if.end109

if.end109:                                        ; preds = %if.then101, %if.then93, %if.then75, %if.then64, %if.end49
  %err.1 = phi i32 [ %call76, %if.then75 ], [ %call70, %if.then64 ], [ %call94, %if.then93 ], [ %call104, %if.then101 ], [ %call48, %if.end49 ]
  %cond = icmp eq i32 %err.1, 0
  br i1 %cond, label %land.lhs.true118, label %cleanup135

land.lhs.true118:                                 ; preds = %if.end109, %if.end109.thread244
  %cmp119.not.old = icmp eq %struct.halide_buffer_t* %dst, %src
  br i1 %cmp119.not.old, label %cleanup135, label %if.then120

if.then120:                                       ; preds = %land.lhs.true118
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %23 = load i64, i64* %flags.i.i, align 8, !tbaa !44
  %or.i.i = and i64 %23, -4
  br i1 %tobool.not, label %if.else125, label %if.then122

if.then122:                                       ; preds = %if.then120
  %or.i.i228 = or i64 %or.i.i, 2
  store i64 %or.i.i228, i64* %flags.i.i, align 8, !tbaa !44
  br label %cleanup135

if.else125:                                       ; preds = %if.then120
  %and.i.i237 = or i64 %or.i.i, 1
  store i64 %and.i.i237, i64* %flags.i.i, align 8, !tbaa !44
  br label %cleanup135

cleanup135:                                       ; preds = %if.else125, %if.then122, %land.lhs.true118, %if.end109, %if.else96, %if.then83, %if.then72, %if.then51, %land.end32, %if.then7, %if.then
  %retval.1 = phi i32 [ -42, %if.then ], [ %call, %if.then7 ], [ -34, %land.end32 ], [ 0, %if.then122 ], [ 0, %if.else125 ], [ 0, %land.lhs.true118 ], [ -42, %if.then51 ], [ %err.1, %if.end109 ], [ %call99, %if.else96 ], [ %call91, %if.then83 ], [ %call73, %if.then72 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  %tobool.not = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 0
  %1 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %1() #13
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
  tail call void %4() #13
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end
  %call = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) #14
  br i1 %tobool.not, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.end16
  %impl19 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl19, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 1
  %6 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %6() #13
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
  tail call void %9() #13
  br label %if.end27

if.end27:                                         ; preds = %if.then23, %if.end20
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #13
  ret i32 -40
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i32 0, i32 0)) #13
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #13
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !45
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !45
  %cmp.not = icmp eq i32 %2, %3
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i32 0, i32 0)) #13
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #13
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !71
  %device_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 11
  %9 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %device_crop, align 4, !tbaa !91
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_buffer_t* nonnull %dst) #13
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i32 0, i32 0)) #13
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #13
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !71
  %device_slice = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 12
  %9 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %device_slice, align 4, !tbaa !92
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* nonnull %dst) #13
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #13
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_release_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 13
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_release_crop, align 4, !tbaa !93
  %call = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #13
  store i64 0, i64* %device, align 8, !tbaa !40
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i32 0, i32 1
  %5 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %5() #13
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #13
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
  %call = tail call float @halide_float16_bits_to_float(i16 zeroext %bits) #14
  %conv = fpext float %call to double
  ret double %conv
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.37, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.37, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %extern_stage_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i7 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %extern_stage_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i10, %if.else.i ], [ %call.i7, %if.then.i ]
  %call5.i13 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.38, i32 0, i32 0)) #13
  %conv.i = sext i32 %result to i64
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call5.i13, i8* %0, i64 %conv.i, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i20, label %if.else.i21

if.then.i20:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i17 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i21, %if.then.i20
  tail call void @free(i8* %call.i) #13
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.39, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.39, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %extern_stage_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i7 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %extern_stage_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i10, %if.else.i ], [ %call.i7, %if.then.i ]
  %call5.i13 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.38, i32 0, i32 0)) #13
  %conv.i = sext i32 %result to i64
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call5.i13, i8* %0, i64 %conv.i, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i20, label %if.else.i21

if.then.i20:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i17 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i21, %if.then.i20
  tail call void @free(i8* %call.i) #13
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %min_bound, i32 %max_bound, i32 %min_required, i32 %max_required) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.40, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.40, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %var_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %var_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i18, %if.else.i ], [ %call.i15, %if.then.i ]
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.41, i32 0, i32 0)) #13
  %cmp.i23 = icmp eq i8* %func_name, null
  br i1 %cmp.i23, label %if.then.i27, label %if.else.i31

if.then.i27:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call5.i21, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit32

if.else.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i30 = tail call i8* @halide_string_to_string(i8* %call5.i21, i8* %0, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit32

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit32: ; preds = %if.else.i31, %if.then.i27
  %storemerge74 = phi i8* [ %call5.i30, %if.else.i31 ], [ %call.i26, %if.then.i27 ]
  %call5.i35 = tail call i8* @halide_string_to_string(i8* %storemerge74, i8* %0, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.42, i32 0, i32 0)) #13
  %conv.i = sext i32 %min_bound to i64
  %call.i39 = tail call i8* @halide_int64_to_string(i8* %call5.i35, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i42 = tail call i8* @halide_string_to_string(i8* %call.i39, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #13
  %conv.i46 = sext i32 %max_bound to i64
  %call.i47 = tail call i8* @halide_int64_to_string(i8* %call5.i42, i8* %0, i64 %conv.i46, i32 1) #13
  %call5.i50 = tail call i8* @halide_string_to_string(i8* %call.i47, i8* %0, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.44, i32 0, i32 0)) #13
  %conv.i54 = sext i32 %min_required to i64
  %call.i55 = tail call i8* @halide_int64_to_string(i8* %call5.i50, i8* %0, i64 %conv.i54, i32 1) #13
  %call5.i58 = tail call i8* @halide_string_to_string(i8* %call.i55, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #13
  %conv.i62 = sext i32 %max_required to i64
  %call.i63 = tail call i8* @halide_int64_to_string(i8* %call5.i58, i8* %0, i64 %conv.i62, i32 1) #13
  %call5.i66 = tail call i8* @halide_string_to_string(i8* %call.i63, i8* %0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.45, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i70, label %if.else.i71

if.then.i70:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit32
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i71:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit32
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i66 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i71, %if.then.i70
  tail call void @free(i8* %call.i) #13
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
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %2, i32 4) #13
  %3 = bitcast i32* %type_given_bits.addr to i8*
  %call1 = call i8* @memcpy(i8* nonnull %1, i8* nonnull %3, i32 4) #13
  %call.i = call i8* @malloc(i32 1024) #13
  %tobool.not.i12 = icmp eq i8* %call.i, null
  br i1 %tobool.not.i12, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit, label %if.then6.i13

if.then6.i13:                                     ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i13, %entry
  %4 = phi i8* [ %add.ptr.i, %if.then6.i13 ], [ null, %entry ]
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i17, label %if.else.i18

if.then.i17:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i16 = call i8* @halide_string_to_string(i8* %call.i, i8* %4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i18:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i = call i8* @halide_string_to_string(i8* %call.i, i8* %4, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i18, %if.then.i17
  %storemerge = phi i8* [ %call5.i, %if.else.i18 ], [ %call.i16, %if.then.i17 ]
  %call5.i22 = call i8* @halide_string_to_string(i8* %storemerge, i8* %4, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.46, i32 0, i32 0)) #13
  %call.i27 = call i8* @halide_type_to_string(i8* %call5.i22, i8* %4, %struct.halide_type_t* nonnull %correct_type) #13
  %call5.i30 = call i8* @halide_string_to_string(i8* %call.i27, i8* %4, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.47, i32 0, i32 0)) #13
  %call.i35 = call i8* @halide_type_to_string(i8* %call5.i30, i8* %4, %struct.halide_type_t* nonnull %type_given) #13
  br i1 %tobool.not.i12, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %if.then6.i

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i35 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %if.then6.i

if.then6.i:                                       ; preds = %if.then.i, %if.else.i
  call void @free(i8* %call.i) #13
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %user_context, i8* %func_name, i32 %dimensions_given, i32 %correct_dimensions) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit, label %if.then6.i

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %entry
  %0 = phi i8* [ %add.ptr.i, %if.then6.i ], [ null, %entry ]
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %call.i, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i = tail call i8* @halide_string_to_string(i8* %call.i, i8* %0, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.48, i32 0, i32 0)) #13
  %conv.i = sext i32 %correct_dimensions to i64
  %call.i15 = tail call i8* @halide_int64_to_string(i8* %call5.i11, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i18 = tail call i8* @halide_string_to_string(i8* %call.i15, i8* %0, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.49, i32 0, i32 0)) #13
  %conv.i22 = sext i32 %dimensions_given to i64
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call5.i18, i8* %0, i64 %conv.i22, i32 1) #13
  %call5.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %0, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.50, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i30, label %if.else.i31

if.then.i30:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i26 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i31, %if.then.i30
  tail call void @free(i8* %call.i) #13
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %user_context, i8* %func_name, i32 %dimension, i32 %min_touched, i32 %max_touched, i32 %min_valid, i32 %max_valid) local_unnamed_addr #4 {
entry:
  %cmp = icmp slt i32 %min_touched, %min_valid
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then6.i, %if.then
  %0 = phi i8* [ %add.ptr.i, %if.then6.i ], [ null, %if.then ]
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i = tail call i8* @halide_string_to_string(i8* %call.i, i8* %0, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge130 = phi i8* [ %call5.i, %if.else.i ], [ %call.i27, %if.then.i ]
  %call5.i30 = tail call i8* @halide_string_to_string(i8* %storemerge130, i8* %0, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.51, i32 0, i32 0)) #13
  %conv.i = sext i32 %min_touched to i64
  %call.i34 = tail call i8* @halide_int64_to_string(i8* %call5.i30, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i37 = tail call i8* @halide_string_to_string(i8* %call.i34, i8* %0, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.52, i32 0, i32 0)) #13
  %conv.i41 = sext i32 %min_valid to i64
  %call.i42 = tail call i8* @halide_int64_to_string(i8* %call5.i37, i8* %0, i64 %conv.i41, i32 1) #13
  %call5.i45 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* %0, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.53, i32 0, i32 0)) #13
  %conv.i49 = sext i32 %dimension to i64
  %call.i50 = tail call i8* @halide_int64_to_string(i8* %call5.i45, i8* %0, i64 %conv.i49, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i53, label %if.else.i54

if.then.i53:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %if.end17.sink.split

if.else.i54:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i50 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %if.end17.sink.split

if.else:                                          ; preds = %entry
  %cmp7 = icmp sgt i32 %max_touched, %max_valid
  br i1 %cmp7, label %if.then8, label %if.end17

if.then8:                                         ; preds = %if.else
  %call.i59 = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i62 = icmp eq i8* %call.i59, null
  br i1 %tobool.not.i62, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit68, label %if.then6.i65

if.then6.i65:                                     ; preds = %if.then8
  %add.ptr.i63 = getelementptr inbounds i8, i8* %call.i59, i32 1023
  store i8 0, i8* %add.ptr.i63, align 1, !tbaa !22
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit68

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit68: ; preds = %if.then6.i65, %if.then8
  %1 = phi i8* [ %add.ptr.i63, %if.then6.i65 ], [ null, %if.then8 ]
  %cmp.i69 = icmp eq i8* %func_name, null
  br i1 %cmp.i69, label %if.then.i73, label %if.else.i77

if.then.i73:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit68
  %call.i72 = tail call i8* @halide_string_to_string(i8* %call.i59, i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit79

if.else.i77:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit68
  %call5.i76 = tail call i8* @halide_string_to_string(i8* %call.i59, i8* %1, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit79

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit79: ; preds = %if.else.i77, %if.then.i73
  %storemerge = phi i8* [ %call5.i76, %if.else.i77 ], [ %call.i72, %if.then.i73 ]
  %call5.i82 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %1, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.51, i32 0, i32 0)) #13
  %conv.i87 = sext i32 %max_touched to i64
  %call.i88 = tail call i8* @halide_int64_to_string(i8* %call5.i82, i8* %1, i64 %conv.i87, i32 1) #13
  %call5.i91 = tail call i8* @halide_string_to_string(i8* %call.i88, i8* %1, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.54, i32 0, i32 0)) #13
  %conv.i96 = sext i32 %max_valid to i64
  %call.i97 = tail call i8* @halide_int64_to_string(i8* %call5.i91, i8* %1, i64 %conv.i96, i32 1) #13
  %call5.i100 = tail call i8* @halide_string_to_string(i8* %call.i97, i8* %1, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.53, i32 0, i32 0)) #13
  %conv.i105 = sext i32 %dimension to i64
  %call.i106 = tail call i8* @halide_int64_to_string(i8* %call5.i100, i8* %1, i64 %conv.i105, i32 1) #13
  br i1 %tobool.not.i62, label %if.then.i110, label %if.else.i121

if.then.i110:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit79
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %if.end17.sink.split

if.else.i121:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit79
  %sub.ptr.lhs.cast.i.i115 = ptrtoint i8* %call.i106 to i32
  %sub.ptr.rhs.cast.i.i116 = ptrtoint i8* %call.i59 to i32
  %sub.ptr.sub.i.i117 = sub i32 1, %sub.ptr.rhs.cast.i.i116
  %add.i.i118 = add i32 %sub.ptr.sub.i.i117, %sub.ptr.lhs.cast.i.i115
  %conv.i.i119 = sext i32 %add.i.i118 to i64
  %call.i.i120 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i59, i64 %conv.i.i119) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i59) #13
  br label %if.end17.sink.split

if.end17.sink.split:                              ; preds = %if.else.i121, %if.then.i110, %if.else.i54, %if.then.i53
  %call.i59.sink = phi i8* [ null, %if.then.i53 ], [ %call.i, %if.else.i54 ], [ null, %if.then.i110 ], [ %call.i59, %if.else.i121 ]
  tail call void @free(i8* %call.i59.sink) #13
  br label %if.end17

if.end17:                                         ; preds = %if.end17.sink.split, %if.else
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %user_context, i8* %buffer_name, i64 %allocation_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.55, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.55, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %buffer_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_uint64_to_string(i8* %call5.i14, i8* %0, i64 %allocation_size, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.57, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_uint64_to_string(i8* %call5.i21, i8* %0, i64 %max_size, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.58, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.58, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %buffer_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i12, %if.else.i ], [ %call.i9, %if.then.i ]
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.59, i32 0, i32 0)) #13
  %conv.i = sext i32 %dimension to i64
  %call.i19 = tail call i8* @halide_int64_to_string(i8* %call5.i15, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i22 = tail call i8* @halide_string_to_string(i8* %call.i19, i8* %0, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.60, i32 0, i32 0)) #13
  %conv.i26 = sext i32 %extent to i64
  %call.i27 = tail call i8* @halide_int64_to_string(i8* %call5.i22, i8* %0, i64 %conv.i26, i32 1) #13
  %call5.i30 = tail call i8* @halide_string_to_string(i8* %call.i27, i8* %0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.45, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i34, label %if.else.i35

if.then.i34:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i30 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i35, %if.then.i34
  tail call void @free(i8* %call.i) #13
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %user_context, i8* %buffer_name, i64 %actual_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.61, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.61, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %buffer_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %call5.i14, i8* %0, i64 %actual_size, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.57, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call5.i21, i8* %0, i64 %max_size, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %constrained_min, i32 %constrained_extent, i32 %required_min, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %add = add i32 %required_min, -1
  %sub = add i32 %add, %required_extent
  %add1 = add i32 %constrained_min, -1
  %sub2 = add i32 %add1, %constrained_extent
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.62, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.62, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i23 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i26 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %buffer_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i26, %if.else.i ], [ %call.i23, %if.then.i ]
  %call5.i29 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.63, i32 0, i32 0)) #13
  %conv.i = sext i32 %dimension to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call5.i29, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.64, i32 0, i32 0)) #13
  %call5.i40 = tail call i8* @halide_string_to_string(i8* %call5.i36, i8* %0, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.65, i32 0, i32 0)) #13
  %conv.i44 = sext i32 %required_min to i64
  %call.i45 = tail call i8* @halide_int64_to_string(i8* %call5.i40, i8* %0, i64 %conv.i44, i32 1) #13
  %call5.i48 = tail call i8* @halide_string_to_string(i8* %call.i45, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #13
  %conv.i52 = sext i32 %sub to i64
  %call.i53 = tail call i8* @halide_int64_to_string(i8* %call5.i48, i8* %0, i64 %conv.i52, i32 1) #13
  %call5.i56 = tail call i8* @halide_string_to_string(i8* %call.i53, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.64, i32 0, i32 0)) #13
  %call5.i60 = tail call i8* @halide_string_to_string(i8* %call5.i56, i8* %0, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.66, i32 0, i32 0)) #13
  %conv.i64 = sext i32 %constrained_min to i64
  %call.i65 = tail call i8* @halide_int64_to_string(i8* %call5.i60, i8* %0, i64 %conv.i64, i32 1) #13
  %call5.i68 = tail call i8* @halide_string_to_string(i8* %call.i65, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.43, i32 0, i32 0)) #13
  %conv.i72 = sext i32 %sub2 to i64
  %call.i73 = tail call i8* @halide_int64_to_string(i8* %call5.i68, i8* %0, i64 %conv.i72, i32 1) #13
  %call5.i76 = tail call i8* @halide_string_to_string(i8* %call.i73, i8* %0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i80, label %if.else.i81

if.then.i80:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i81:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i76 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i81, %if.then.i80
  tail call void @free(i8* %call.i) #13
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %user_context, i8* %var, i32 %val, i8* %constrained_var, i32 %constrained_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.68, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.68, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %var, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %var) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i14, %if.else.i ], [ %call.i11, %if.then.i ]
  %call5.i17 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.69, i32 0, i32 0)) #13
  %conv.i = sext i32 %val to i64
  %call.i21 = tail call i8* @halide_int64_to_string(i8* %call5.i17, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %0, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.70, i32 0, i32 0)) #13
  %cmp.i26 = icmp eq i8* %constrained_var, null
  br i1 %cmp.i26, label %if.then.i30, label %if.else.i34

if.then.i30:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call5.i24, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35

if.else.i34:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i33 = tail call i8* @halide_string_to_string(i8* %call5.i24, i8* %0, i8* nonnull %constrained_var) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35: ; preds = %if.else.i34, %if.then.i30
  %storemerge54 = phi i8* [ %call5.i33, %if.else.i34 ], [ %call.i29, %if.then.i30 ]
  %call5.i38 = tail call i8* @halide_string_to_string(i8* %storemerge54, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.69, i32 0, i32 0)) #13
  %conv.i42 = sext i32 %constrained_val to i64
  %call.i43 = tail call i8* @halide_int64_to_string(i8* %call5.i38, i8* %0, i64 %conv.i42, i32 1) #13
  %call5.i46 = tail call i8* @halide_string_to_string(i8* %call.i43, i8* %0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.45, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i50, label %if.else.i51

if.then.i50:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i51:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i46 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i51, %if.then.i50
  tail call void @free(i8* %call.i) #13
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %param_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %call5.i14, i8* %0, i64 %val, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.72, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call5.i21, i8* %0, i64 %min_val, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %param_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_uint64_to_string(i8* %call5.i14, i8* %0, i64 %val, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.72, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_uint64_to_string(i8* %call5.i21, i8* %0, i64 %min_val, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %user_context, i8* %param_name, double %val, double %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %param_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_double_to_string(i8* %call5.i14, i8* %0, double %val, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.72, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_double_to_string(i8* %call5.i21, i8* %0, double %min_val, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %param_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %call5.i14, i8* %0, i64 %val, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.73, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call5.i21, i8* %0, i64 %max_val, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %param_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_uint64_to_string(i8* %call5.i14, i8* %0, i64 %val, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.73, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_uint64_to_string(i8* %call5.i21, i8* %0, i64 %max_val, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %user_context, i8* %param_name, double %val, double %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %param_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %param_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.56, i32 0, i32 0)) #13
  %call.i18 = tail call i8* @halide_double_to_string(i8* %call5.i14, i8* %0, double %val, i32 1) #13
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.73, i32 0, i32 0)) #13
  %call.i25 = tail call i8* @halide_double_to_string(i8* %call5.i21, i8* %0, double %max_val, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i28, label %if.else.i29

if.then.i28:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i29:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i25 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i29, %if.then.i28
  tail call void @free(i8* %call.i) #13
  ret i32 -10
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_error_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.37.74, i32 0, i32 0)) #13
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %user_context, i8* %buffer_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %ref.tmp.sroa.10.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %buffer_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i5 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* nonnull %buffer_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i8, %if.else.i ], [ %call.i5, %if.then.i ]
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %ref.tmp.sroa.10.0, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i15, label %if.else.i16

if.then.i15:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i16, %if.then.i15
  tail call void @free(i8* %call.i) #13
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %user_context, i8* %func, i8* %filename, i32 %error_code) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %func, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %func) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i11, %if.else.i ], [ %call.i8, %if.then.i ]
  %call5.i14 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i32 0, i32 0)) #13
  %cmp.i16 = icmp eq i8* %filename, null
  br i1 %cmp.i16, label %if.then.i20, label %if.else.i24

if.then.i20:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call5.i14, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit25

if.else.i24:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i23 = tail call i8* @halide_string_to_string(i8* %call5.i14, i8* %0, i8* nonnull %filename) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit25

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit25: ; preds = %if.else.i24, %if.then.i20
  %storemerge39 = phi i8* [ %call5.i23, %if.else.i24 ], [ %call.i19, %if.then.i20 ]
  %call5.i28 = tail call i8* @halide_string_to_string(i8* %storemerge39, i8* %0, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42.75, i32 0, i32 0)) #13
  %conv.i = sext i32 %error_code to i64
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call5.i28, i8* %0, i64 %conv.i, i32 1) #13
  br i1 %tobool.not.i, label %if.then.i35, label %if.else.i36

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit25
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i36:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit25
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i32 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i36, %if.then.i35
  tail call void @free(i8* %call.i) #13
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %user_context, i8* %func, i32 %alignment) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %func, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i7 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %func) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i10, %if.else.i ], [ %call.i7, %if.then.i ]
  %call5.i13 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i32 0, i32 0)) #13
  %conv.i = sext i32 %alignment to i64
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call5.i13, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %0, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.45, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i24, label %if.else.i25

if.then.i24:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i25:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i20 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i25, %if.then.i24
  tail call void @free(i8* %call.i) #13
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_dirty_with_no_device_support(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %func, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i6 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %func) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i9, %if.else.i ], [ %call.i6, %if.then.i ]
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.47, i32 0, i32 0)) #13
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %call5.i12, i8* %0, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.48, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i20, label %if.else.i21

if.then.i20:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i16 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i21, %if.then.i20
  tail call void @free(i8* %call.i) #13
  ret i32 -44
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %ref.tmp.sroa.10.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %func, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i5 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* nonnull %func) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i8, %if.else.i ], [ %call.i5, %if.then.i ]
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %ref.tmp.sroa.10.0, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i15, label %if.else.i16

if.then.i15:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i16, %if.then.i15
  tail call void @free(i8* %call.i) #13
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %user_context, i8* %func_name, i8* %var_name, i8* %loop_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %var_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %var_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i12, %if.else.i ], [ %call.i9, %if.then.i ]
  %call5.i15 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #13
  %cmp.i17 = icmp eq i8* %func_name, null
  br i1 %cmp.i17, label %if.then.i21, label %if.else.i25

if.then.i21:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call5.i15, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit26

if.else.i25:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i24 = tail call i8* @halide_string_to_string(i8* %call5.i15, i8* %0, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit26

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit26: ; preds = %if.else.i25, %if.then.i21
  %storemerge51 = phi i8* [ %call5.i24, %if.else.i25 ], [ %call.i20, %if.then.i21 ]
  %call5.i29 = tail call i8* @halide_string_to_string(i8* %storemerge51, i8* %0, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i32 0, i32 0)) #13
  %cmp.i31 = icmp eq i8* %loop_name, null
  br i1 %cmp.i31, label %if.then.i35, label %if.else.i39

if.then.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit26
  %call.i34 = tail call i8* @halide_string_to_string(i8* %call5.i29, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40

if.else.i39:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit26
  %call5.i38 = tail call i8* @halide_string_to_string(i8* %call5.i29, i8* %0, i8* nonnull %loop_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40: ; preds = %if.else.i39, %if.then.i35
  %storemerge52 = phi i8* [ %call5.i38, %if.else.i39 ], [ %call.i34, %if.then.i35 ]
  %call5.i43 = tail call i8* @halide_string_to_string(i8* %storemerge52, i8* %0, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i47, label %if.else.i48

if.then.i47:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i48:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i43 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i48, %if.then.i47
  tail call void @free(i8* %call.i) #13
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
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %if.then.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %if.then.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %dim to i64
  %call.i52 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i55 = tail call i8* @halide_string_to_string(i8* %call.i52, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #13
  %cmp.i = icmp eq i8* %func_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i58 = tail call i8* @halide_string_to_string(i8* %call5.i55, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i61 = tail call i8* @halide_string_to_string(i8* %call5.i55, i8* %0, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge210 = phi i8* [ %call5.i61, %if.else.i ], [ %call.i58, %if.then.i ]
  %call5.i64 = tail call i8* @halide_string_to_string(i8* %storemerge210, i8* %0, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #13
  %conv.i68 = sext i32 %min to i64
  %call.i69 = tail call i8* @halide_int64_to_string(i8* %call5.i64, i8* %0, i64 %conv.i68, i32 1) #13
  %call5.i72 = tail call i8* @halide_string_to_string(i8* %call.i69, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %add9 = add nsw i32 %extent, %min
  %sub = add nsw i32 %add9, -1
  %conv.i76 = sext i32 %sub to i64
  %call.i77 = tail call i8* @halide_int64_to_string(i8* %call5.i72, i8* %0, i64 %conv.i76, i32 1) #13
  %call5.i80 = tail call i8* @halide_string_to_string(i8* %call.i77, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #13
  %call5.i84 = tail call i8* @halide_string_to_string(i8* %call5.i80, i8* %0, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57, i32 0, i32 0)) #13
  %conv.i88 = sext i32 %valid_min to i64
  %call.i89 = tail call i8* @halide_int64_to_string(i8* %call5.i84, i8* %0, i64 %conv.i88, i32 1) #13
  %call5.i92 = tail call i8* @halide_string_to_string(i8* %call.i89, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %add15 = add nsw i32 %fold_factor, %valid_min
  %sub16 = add nsw i32 %add15, -1
  %conv.i96 = sext i32 %sub16 to i64
  %call.i97 = tail call i8* @halide_int64_to_string(i8* %call5.i92, i8* %0, i64 %conv.i96, i32 1) #13
  %call5.i100 = tail call i8* @halide_string_to_string(i8* %call.i97, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.76, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i104, label %if.else.i105

if.then.i104:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %if.end

if.else.i105:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i100 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %call.i110 = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i113 = icmp eq i8* %call.i110, null
  br i1 %tobool.not.i113, label %if.else.split, label %if.then6.i116

if.else.split:                                    ; preds = %if.else
  %call5.i1223 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit119

if.then6.i116:                                    ; preds = %if.else
  %add.ptr.i114 = getelementptr inbounds i8, i8* %call.i110, i32 1023
  store i8 0, i8* %add.ptr.i114, align 1, !tbaa !22
  %call5.i1224 = tail call i8* @halide_string_to_string(i8* nonnull %call.i110, i8* nonnull %add.ptr.i114, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit119

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit119: ; preds = %if.else.split, %if.then6.i116
  %phi.call5 = phi i8* [ %call5.i1223, %if.else.split ], [ %call5.i1224, %if.then6.i116 ]
  %1 = phi i8* [ null, %if.else.split ], [ %add.ptr.i114, %if.then6.i116 ]
  %conv.i127 = sext i32 %dim to i64
  %call.i128 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %1, i64 %conv.i127, i32 1) #13
  %call5.i131 = tail call i8* @halide_string_to_string(i8* %call.i128, i8* %1, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #13
  %cmp.i134 = icmp eq i8* %func_name, null
  br i1 %cmp.i134, label %if.then.i138, label %if.else.i142

if.then.i138:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit119
  %call.i137 = tail call i8* @halide_string_to_string(i8* %call5.i131, i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit144

if.else.i142:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit119
  %call5.i141 = tail call i8* @halide_string_to_string(i8* %call5.i131, i8* %1, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit144

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit144: ; preds = %if.else.i142, %if.then.i138
  %storemerge = phi i8* [ %call5.i141, %if.else.i142 ], [ %call.i137, %if.then.i138 ]
  %call5.i147 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %1, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #13
  %conv.i152 = sext i32 %min to i64
  %call.i153 = tail call i8* @halide_int64_to_string(i8* %call5.i147, i8* %1, i64 %conv.i152, i32 1) #13
  %call5.i156 = tail call i8* @halide_string_to_string(i8* %call.i153, i8* %1, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #13
  %sub28 = add nsw i32 %add, -1
  %conv.i161 = sext i32 %sub28 to i64
  %call.i162 = tail call i8* @halide_int64_to_string(i8* %call5.i156, i8* %1, i64 %conv.i161, i32 1) #13
  %call5.i165 = tail call i8* @halide_string_to_string(i8* %call.i162, i8* %1, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #13
  %call5.i170 = tail call i8* @halide_string_to_string(i8* %call5.i165, i8* %1, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.77, i32 0, i32 0)) #13
  %call5.i175 = tail call i8* @halide_string_to_string(i8* %call5.i170, i8* %1, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.78, i32 0, i32 0)) #13
  %conv.i180 = sext i32 %fold_factor to i64
  %call.i181 = tail call i8* @halide_int64_to_string(i8* %call5.i175, i8* %1, i64 %conv.i180, i32 1) #13
  %call5.i184 = tail call i8* @halide_string_to_string(i8* %call.i181, i8* %1, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.67, i32 0, i32 0)) #13
  br i1 %tobool.not.i113, label %if.then.i190, label %if.else.i201

if.then.i190:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit144
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %if.end

if.else.i201:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit144
  %sub.ptr.lhs.cast.i.i195 = ptrtoint i8* %call5.i184 to i32
  %sub.ptr.rhs.cast.i.i196 = ptrtoint i8* %call.i110 to i32
  %sub.ptr.sub.i.i197 = sub i32 1, %sub.ptr.rhs.cast.i.i196
  %add.i.i198 = add i32 %sub.ptr.sub.i.i197, %sub.ptr.lhs.cast.i.i195
  %conv.i.i199 = sext i32 %add.i.i198 to i64
  %call.i.i200 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i110, i64 %conv.i.i199) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i110) #13
  br label %if.end

if.end:                                           ; preds = %if.else.i201, %if.then.i190, %if.else.i105, %if.then.i104
  %call.i110.sink = phi i8* [ null, %if.then.i104 ], [ %call.i, %if.else.i105 ], [ null, %if.then.i190 ], [ %call.i110, %if.else.i201 ]
  tail call void @free(i8* %call.i110.sink) #13
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %fold_factor, i8* %loop_name, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.79, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.79, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %fold_factor to i64
  %call.i13 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %0, i64 %conv.i, i32 1) #13
  %call5.i16 = tail call i8* @halide_string_to_string(i8* %call.i13, i8* %0, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i32 0, i32 0)) #13
  %cmp.i = icmp eq i8* %var_name, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call5.i16, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i22 = tail call i8* @halide_string_to_string(i8* %call5.i16, i8* %0, i8* nonnull %var_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i22, %if.else.i ], [ %call.i19, %if.then.i ]
  %call5.i25 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #13
  %cmp.i27 = icmp eq i8* %func_name, null
  br i1 %cmp.i27, label %if.then.i31, label %if.else.i35

if.then.i31:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i30 = tail call i8* @halide_string_to_string(i8* %call5.i25, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit36

if.else.i35:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i34 = tail call i8* @halide_string_to_string(i8* %call5.i25, i8* %0, i8* nonnull %func_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit36

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit36: ; preds = %if.else.i35, %if.then.i31
  %storemerge69 = phi i8* [ %call5.i34, %if.else.i35 ], [ %call.i30, %if.then.i31 ]
  %call5.i39 = tail call i8* @halide_string_to_string(i8* %storemerge69, i8* %0, i8* nonnull getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i32 0, i32 0)) #13
  %cmp.i41 = icmp eq i8* %loop_name, null
  br i1 %cmp.i41, label %if.then.i45, label %if.else.i49

if.then.i45:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit36
  %call.i44 = tail call i8* @halide_string_to_string(i8* %call5.i39, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit50

if.else.i49:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit36
  %call5.i48 = tail call i8* @halide_string_to_string(i8* %call5.i39, i8* %0, i8* nonnull %loop_name) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit50

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit50: ; preds = %if.else.i49, %if.then.i45
  %storemerge70 = phi i8* [ %call5.i48, %if.else.i49 ], [ %call.i44, %if.then.i45 ]
  %call5.i53 = tail call i8* @halide_string_to_string(i8* %storemerge70, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.69, i32 0, i32 0)) #13
  %conv.i57 = sext i32 %required_extent to i64
  %call.i58 = tail call i8* @halide_int64_to_string(i8* %call5.i53, i8* %0, i64 %conv.i57, i32 1) #13
  %call5.i61 = tail call i8* @halide_string_to_string(i8* %call.i58, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.80, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i65, label %if.else.i66

if.then.i65:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit50
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i66:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit50
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i61 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i66, %if.then.i65
  tail call void @free(i8* %call.i) #13
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %user_context, i8* %condition, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %condition, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i6 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %0, i8* nonnull %condition) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i9, %if.else.i ], [ %call.i6, %if.then.i ]
  %call5.i12 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %0, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0)) #13
  %cmp.i14 = icmp eq i8* %message, null
  br i1 %cmp.i14, label %if.then.i18, label %if.else.i22

if.then.i18:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call5.i12, i8* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit23

if.else.i22:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %call5.i21 = tail call i8* @halide_string_to_string(i8* %call5.i12, i8* %0, i8* nonnull %message) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit23

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit23: ; preds = %if.else.i22, %if.then.i18
  %this.idx9.val.i = phi i8* [ %call5.i21, %if.else.i22 ], [ %call.i17, %if.then.i18 ]
  br i1 %tobool.not.i, label %if.then.i26, label %if.else.i27

if.then.i26:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit23
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i27:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit23
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %this.idx9.val.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i27, %if.then.i26
  tail call void @free(i8* %call.i) #13
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %user_context, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %ref.tmp.sroa.10.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %message, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i4 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i7 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* nonnull %message) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i7, %if.else.i ], [ %call.i4, %if.then.i ]
  br i1 %tobool.not.i, label %if.then.i10, label %if.else.i11

if.then.i10:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i11:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %storemerge to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i11, %if.then.i10
  tail call void @free(i8* %call.i) #13
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call5.i14 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #13
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #13
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #13
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call5.i14 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #13
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #13
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #13
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call5.i14 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #13
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #13
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #13
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %user_context, i8* %routine) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call5.i1 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i2 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call5.i1, %entry.split ], [ %call5.i2, %if.then6.i ]
  %ref.tmp.sroa.10.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %cmp.i = icmp eq i8* %routine, null
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call.i5 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
  %call5.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.10.0, i8* nonnull %routine) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit: ; preds = %if.else.i, %if.then.i
  %storemerge = phi i8* [ %call5.i8, %if.else.i ], [ %call.i5, %if.then.i ]
  %call5.i11 = tail call i8* @halide_string_to_string(i8* %storemerge, i8* %ref.tmp.sroa.10.0, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0)) #13
  br i1 %tobool.not.i, label %if.then.i15, label %if.else.i16

if.then.i15:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i16:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i16, %if.then.i15
  tail call void @free(i8* %call.i) #13
  ret i32 -38
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
  %call = tail call i32 @qurt_hvx_lock(i32 1) #13
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i19 = icmp eq i8* %call.i, null
  br i1 %tobool.not.i19, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call5.i30 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.93, i32 0, i32 0)) #13
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.93, i32 0, i32 0)) #13
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #13
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_lock(i32) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_unlock(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call = tail call i32 @qurt_hvx_unlock() #13
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i32 1024) #13
  %tobool.not.i15 = icmp eq i8* %call.i, null
  br i1 %tobool.not.i15, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call5.i26 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.95, i32 0, i32 0)) #13
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.94, i32 0, i32 0)) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call5.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.95, i32 0, i32 0)) #13
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call5.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #13
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #13
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #13
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_unlock() local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_qurt_hvx_unlock_as_destructor(i8* %user_context, i8* %0) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @halide_qurt_hvx_unlock(i8* %user_context) #14
  ret void
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32>) #9

; Function Attrs: nounwind mustprogress
define weak i8* @halide_vtcm_malloc(i8* %user_context, i32 %size) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @HAP_request_VTCM(i32 %size, i32 1) #13
  ret i8* %call
}

declare i8* @HAP_request_VTCM(i32, i32) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_vtcm_free(i8* %user_context, i8* %addr) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @HAP_release_VTCM(i8* %addr) #13
  ret void
}

declare i32 @HAP_release_VTCM(i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_default_can_use_target_features(i32 %count, i64* %features) #4 {
entry:
  %tmp = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #13
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18, !range !21
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #11
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %tmp) #13
  %call = call i8* @memcpy(i8* bitcast ([4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE to i8*), i8* nonnull %1, i32 32) #13
  store i8 1, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #13
  %cmp.not = icmp eq i32 %count, 2
  br i1 %cmp.not, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.96, i32 0, i32 0)) #13
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
  %call = tail call i32 %0(i32 %count, i64* %features) #13
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
declare <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind
define i32 @max_pool_hvx128(%struct.halide_buffer_t* noalias nocapture readonly %input.buffer, i32 %stride_x, i32 %stride_y, i32 %b45, i32 %b42, i8 %output_min, i8 %b54, %struct.halide_buffer_t* noalias nocapture readonly %output.buffer) local_unnamed_addr #10 {
entry:
  %hvx_lock_result = tail call i32 @halide_qurt_hvx_lock(i8* null) #11
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i32 0, i32 2
  %0 = load i8*, i8** %host.i, align 4, !tbaa !43
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i32 0, i32 6
  %1 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !46
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 0, i32 1
  %2 = load i32, i32* %extent.i, align 4, !tbaa !49
  %min.i108 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 1, i32 0
  %3 = load i32, i32* %min.i108, align 4, !tbaa !47
  %extent.i110 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 1, i32 1
  %4 = load i32, i32* %extent.i110, align 4, !tbaa !49
  %stride.i112 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 1, i32 2
  %5 = load i32, i32* %stride.i112, align 4, !tbaa !50
  %min.i114 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 2, i32 0
  %6 = load i32, i32* %min.i114, align 4, !tbaa !47
  %extent.i116 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 2, i32 1
  %7 = load i32, i32* %extent.i116, align 4, !tbaa !49
  %stride.i118 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 2, i32 2
  %8 = load i32, i32* %stride.i118, align 4, !tbaa !50
  %min.i120 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 3, i32 0
  %9 = load i32, i32* %min.i120, align 4, !tbaa !47
  %extent.i122 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 3, i32 1
  %10 = load i32, i32* %extent.i122, align 4, !tbaa !49
  %stride.i124 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 3, i32 2
  %11 = load i32, i32* %stride.i124, align 4, !tbaa !50
  %host.i125 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 2
  %12 = load i8*, i8** %host.i125, align 4, !tbaa !43
  %dim.i126 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 6
  %13 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i126, align 8, !tbaa !46
  %min.i133 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 1, i32 0
  %14 = load i32, i32* %min.i133, align 4, !tbaa !47
  %extent.i135 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 1, i32 1
  %15 = load i32, i32* %extent.i135, align 4, !tbaa !49
  %stride.i137 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 1, i32 2
  %16 = load i32, i32* %stride.i137, align 4, !tbaa !50
  %min.i139 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 2, i32 0
  %17 = load i32, i32* %min.i139, align 4, !tbaa !47
  %extent.i141 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 2, i32 1
  %18 = load i32, i32* %extent.i141, align 4, !tbaa !49
  %stride.i143 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 2, i32 2
  %19 = load i32, i32* %stride.i143, align 4, !tbaa !50
  %stride.i149 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %13, i32 3, i32 2
  %20 = load i32, i32* %stride.i149, align 4, !tbaa !50
  %21 = icmp sgt i32 %2, 511
  br i1 %21, label %then_bb, label %next_bb

call_destructor.exit:                             ; preds = %"end for output.s0.y.rebased49.loopexit.split.us.us.us.split.us.us", %"end for output.s0.y.rebased29.loopexit.split.us.us.us", %"end for output.s0.y.rebased7.loopexit.us", %"end for output.s0.y.rebased", %"for output.s0.b.rebased45.preheader", %"for output.s0.b.rebased25.preheader", %"for output.s0.b.rebased3.preheader", %next_bb24, %then_bb23, %then_bb1, %then_bb
  tail call void @halide_qurt_hvx_unlock_as_destructor(i8* null, i8* nonnull inttoptr (i32 1 to i8*)) #13
  ret i32 0

then_bb:                                          ; preds = %entry
  %22 = icmp sgt i32 %10, 0
  br i1 %22, label %"for output.s0.b.rebased.preheader", label %call_destructor.exit, !prof !95

"for output.s0.b.rebased.preheader":              ; preds = %then_bb
  %.neg240 = mul i32 %5, %3
  %.neg239 = mul i32 %8, %6
  %.neg238 = mul i32 %11, %9
  %.neg237 = mul i32 %16, %14
  %.neg236 = mul i32 %19, %17
  %.neg235 = mul i32 %20, %9
  %23 = icmp slt i32 %18, 1
  %24 = add nsw i32 %7, %6
  %25 = icmp slt i32 %15, 1
  %26 = add nsw i32 %4, %3
  %27 = add nuw nsw i32 %2, 511
  %28 = ashr i32 %27, 9
  %b8 = add nsw i32 %2, -512
  %29 = insertelement <512 x i8> undef, i8 %output_min, i32 0
  %30 = shufflevector <512 x i8> %29, <512 x i8> undef, <128 x i32> zeroinitializer
  %31 = bitcast <128 x i8> %30 to <32 x i32>
  %reass.add244 = add i32 %.neg239, %.neg240
  %reass.add245 = add i32 %reass.add244, %.neg238
  %32 = insertelement <128 x i8> undef, i8 %b54, i32 0
  %33 = shufflevector <128 x i8> %32, <128 x i8> undef, <128 x i32> zeroinitializer
  %34 = bitcast <128 x i8> %33 to <32 x i32>
  %reass.add247 = add i32 %.neg236, %.neg237
  %reass.add248 = add i32 %reass.add247, %.neg235
  %35 = add nsw i32 %28, -1
  %36 = add i32 %4, %3
  %37 = mul i32 %14, %stride_x
  %38 = sub i32 %36, %37
  %39 = sub i32 %3, %37
  %brmerge = or i1 %23, %25
  %xtraiter551 = and i32 %28, 7
  %40 = icmp ult i32 %35, 7
  %unroll_iter554 = and i32 %28, -8
  %lcmp.mod553.not = icmp eq i32 %xtraiter551, 0
  br label %"for output.s0.b.rebased"

next_bb:                                          ; preds = %entry
  %41 = icmp sgt i32 %2, 255
  br i1 %41, label %then_bb1, label %next_bb2

"for output.s0.b.rebased":                        ; preds = %"for output.s0.b.rebased.preheader", %"end for output.s0.y.rebased"
  %output.s0.b.rebased = phi i32 [ %301, %"end for output.s0.y.rebased" ], [ 0, %"for output.s0.b.rebased.preheader" ]
  %42 = add nsw i32 %output.s0.b.rebased, %9
  %43 = mul nsw i32 %42, %20
  %44 = mul nsw i32 %42, %11
  br i1 %brmerge, label %"end for output.s0.y.rebased", label %"for output.s0.y.rebased.us", !prof !96

"for output.s0.y.rebased.us":                     ; preds = %"for output.s0.b.rebased", %"end for output.s0.x.rebased.loopexit.us"
  %output.s0.y.rebased.us = phi i32 [ %56, %"end for output.s0.x.rebased.loopexit.us" ], [ 0, %"for output.s0.b.rebased" ]
  %45 = add nsw i32 %output.s0.y.rebased.us, %17
  %46 = mul nsw i32 %45, %stride_y
  %a0.us = sub i32 %24, %46
  %47 = icmp slt i32 %a0.us, %b42
  %b4.us = select i1 %47, i32 %a0.us, i32 %b42
  %a1.us = sub nsw i32 %6, %46
  %48 = icmp slt i32 %a1.us, %b42
  %a9.us = select i1 %48, i32 %a1.us, i32 %b42
  %49 = icmp sgt i32 %a9.us, %b4.us
  %a8.us = select i1 %49, i32 %a9.us, i32 %b4.us
  %50 = icmp sgt i32 %a9.us, 0
  %51 = select i1 %50, i32 %a9.us, i32 0
  %t244.us = add nsw i32 %51, %46
  %52 = mul nsw i32 %45, %19
  %53 = icmp sgt i32 %a8.us, 0
  %54 = select i1 %53, i32 %a8.us, i32 0
  %t250.us = sub nsw i32 %54, %51
  %55 = icmp sgt i32 %t250.us, 0
  %t232.us = add i32 %52, %43
  br label %"for output.s0.x.rebased.us.us"

"end for output.s0.x.rebased.loopexit.us":        ; preds = %"end for output.s0.c.c.loopexit.us.us"
  %56 = add nuw nsw i32 %output.s0.y.rebased.us, 1
  %.not100.us = icmp eq i32 %56, %18
  br i1 %.not100.us, label %"end for output.s0.y.rebased", label %"for output.s0.y.rebased.us"

"for output.s0.x.rebased.us.us":                  ; preds = %"for output.s0.y.rebased.us", %"end for output.s0.c.c.loopexit.us.us"
  %output.s0.x.rebased.us.us = phi i32 [ %181, %"end for output.s0.c.c.loopexit.us.us" ], [ 0, %"for output.s0.y.rebased.us" ]
  %57 = mul i32 %output.s0.x.rebased.us.us, %stride_x
  %58 = sub i32 %38, %57
  %59 = icmp sgt i32 %58, %b45
  %smin556 = select i1 %59, i32 %b45, i32 %58
  %60 = sub i32 %39, %57
  %61 = icmp sgt i32 %60, %b45
  %smin557 = select i1 %61, i32 %b45, i32 %60
  %62 = icmp sgt i32 %smin556, %smin557
  %smax558 = select i1 %62, i32 %smin556, i32 %smin557
  %63 = icmp sgt i32 %smax558, 0
  %smax559 = select i1 %63, i32 %smax558, i32 0
  %64 = icmp sgt i32 %smin557, 0
  %smax560 = select i1 %64, i32 %smin557, i32 0
  %65 = sub nsw i32 %smax559, %smax560
  %66 = xor i32 %smax560, -1
  %67 = add nsw i32 %smax559, %66
  %68 = add nsw i32 %output.s0.x.rebased.us.us, %14
  %69 = mul nsw i32 %68, %stride_x
  %a3.us.us = sub i32 %26, %69
  %70 = icmp slt i32 %a3.us.us, %b45
  %b9.us.us = select i1 %70, i32 %a3.us.us, i32 %b45
  %a4.us.us = sub nsw i32 %3, %69
  %71 = icmp slt i32 %a4.us.us, %b45
  %a12.us.us = select i1 %71, i32 %a4.us.us, i32 %b45
  %72 = mul nsw i32 %68, %16
  %73 = icmp sgt i32 %a12.us.us, %b9.us.us
  %a11.us.us = select i1 %73, i32 %a12.us.us, i32 %b9.us.us
  %74 = icmp sgt i32 %a12.us.us, 0
  %75 = select i1 %74, i32 %a12.us.us, i32 0
  %t254.us.us = add nsw i32 %75, %69
  %76 = icmp sgt i32 %a11.us.us, 0
  %77 = select i1 %76, i32 %a11.us.us, i32 0
  %78 = icmp sgt i32 %77, %75
  %79 = add i32 %t232.us, %72
  br i1 %55, label %"for output.s0.c.c.us.us.us.preheader", label %"for output.s0.c.c.preheader.split.us404.us", !prof !95

"for output.s0.c.c.us.us.us.preheader":           ; preds = %"for output.s0.x.rebased.us.us"
  %xtraiter561 = and i32 %65, 3
  %80 = icmp ult i32 %67, 3
  %unroll_iter568 = and i32 %65, -4
  %lcmp.mod563.not = icmp eq i32 %xtraiter561, 0
  br label %"for output.s0.c.c.us.us.us"

"for output.s0.c.c.us396.us":                     ; preds = %"for output.s0.c.c.preheader.split.us404.us", %"for output.s0.c.c.us396.us"
  %output.s0.c.c.us397.us = phi i32 [ %168, %"for output.s0.c.c.us396.us" ], [ 0, %"for output.s0.c.c.preheader.split.us404.us" ]
  %niter555 = phi i32 [ %niter555.nsub.7, %"for output.s0.c.c.us396.us" ], [ %unroll_iter554, %"for output.s0.c.c.preheader.split.us404.us" ]
  %a6.us398.us = shl nsw i32 %output.s0.c.c.us397.us, 9
  %81 = icmp slt i32 %a6.us398.us, %b8
  %output.s0.c.v2.base.s.us399.us = select i1 %81, i32 %a6.us398.us, i32 %b8
  %t246.us401.us = add i32 %79, %output.s0.c.v2.base.s.us399.us
  %82 = sub i32 %t246.us401.us, %reass.add248
  %83 = getelementptr inbounds i8, i8* %12, i32 %82
  %84 = bitcast i8* %83 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %84, align 1, !tbaa !97
  %85 = getelementptr inbounds i8, i8* %83, i32 128
  %86 = bitcast i8* %85 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %86, align 1, !tbaa !97
  %87 = getelementptr inbounds i8, i8* %83, i32 256
  %88 = bitcast i8* %87 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %88, align 1, !tbaa !97
  %89 = getelementptr inbounds i8, i8* %83, i32 384
  %90 = bitcast i8* %89 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %90, align 1, !tbaa !97
  %91 = shl i32 %output.s0.c.c.us397.us, 9
  %a6.us398.us.1 = or i32 %91, 512
  %92 = icmp slt i32 %a6.us398.us.1, %b8
  %output.s0.c.v2.base.s.us399.us.1 = select i1 %92, i32 %a6.us398.us.1, i32 %b8
  %t246.us401.us.1 = add i32 %79, %output.s0.c.v2.base.s.us399.us.1
  %93 = sub i32 %t246.us401.us.1, %reass.add248
  %94 = getelementptr inbounds i8, i8* %12, i32 %93
  %95 = bitcast i8* %94 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %95, align 1, !tbaa !97
  %96 = getelementptr inbounds i8, i8* %94, i32 128
  %97 = bitcast i8* %96 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %97, align 1, !tbaa !97
  %98 = getelementptr inbounds i8, i8* %94, i32 256
  %99 = bitcast i8* %98 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %99, align 1, !tbaa !97
  %100 = getelementptr inbounds i8, i8* %94, i32 384
  %101 = bitcast i8* %100 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %101, align 1, !tbaa !97
  %102 = shl i32 %output.s0.c.c.us397.us, 9
  %a6.us398.us.2 = or i32 %102, 1024
  %103 = icmp slt i32 %a6.us398.us.2, %b8
  %output.s0.c.v2.base.s.us399.us.2 = select i1 %103, i32 %a6.us398.us.2, i32 %b8
  %t246.us401.us.2 = add i32 %79, %output.s0.c.v2.base.s.us399.us.2
  %104 = sub i32 %t246.us401.us.2, %reass.add248
  %105 = getelementptr inbounds i8, i8* %12, i32 %104
  %106 = bitcast i8* %105 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %106, align 1, !tbaa !97
  %107 = getelementptr inbounds i8, i8* %105, i32 128
  %108 = bitcast i8* %107 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %108, align 1, !tbaa !97
  %109 = getelementptr inbounds i8, i8* %105, i32 256
  %110 = bitcast i8* %109 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %110, align 1, !tbaa !97
  %111 = getelementptr inbounds i8, i8* %105, i32 384
  %112 = bitcast i8* %111 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %112, align 1, !tbaa !97
  %113 = shl i32 %output.s0.c.c.us397.us, 9
  %a6.us398.us.3 = or i32 %113, 1536
  %114 = icmp slt i32 %a6.us398.us.3, %b8
  %output.s0.c.v2.base.s.us399.us.3 = select i1 %114, i32 %a6.us398.us.3, i32 %b8
  %t246.us401.us.3 = add i32 %79, %output.s0.c.v2.base.s.us399.us.3
  %115 = sub i32 %t246.us401.us.3, %reass.add248
  %116 = getelementptr inbounds i8, i8* %12, i32 %115
  %117 = bitcast i8* %116 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %117, align 1, !tbaa !97
  %118 = getelementptr inbounds i8, i8* %116, i32 128
  %119 = bitcast i8* %118 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %119, align 1, !tbaa !97
  %120 = getelementptr inbounds i8, i8* %116, i32 256
  %121 = bitcast i8* %120 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %121, align 1, !tbaa !97
  %122 = getelementptr inbounds i8, i8* %116, i32 384
  %123 = bitcast i8* %122 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %123, align 1, !tbaa !97
  %124 = shl i32 %output.s0.c.c.us397.us, 9
  %a6.us398.us.4 = or i32 %124, 2048
  %125 = icmp slt i32 %a6.us398.us.4, %b8
  %output.s0.c.v2.base.s.us399.us.4 = select i1 %125, i32 %a6.us398.us.4, i32 %b8
  %t246.us401.us.4 = add i32 %79, %output.s0.c.v2.base.s.us399.us.4
  %126 = sub i32 %t246.us401.us.4, %reass.add248
  %127 = getelementptr inbounds i8, i8* %12, i32 %126
  %128 = bitcast i8* %127 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %128, align 1, !tbaa !97
  %129 = getelementptr inbounds i8, i8* %127, i32 128
  %130 = bitcast i8* %129 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %130, align 1, !tbaa !97
  %131 = getelementptr inbounds i8, i8* %127, i32 256
  %132 = bitcast i8* %131 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %132, align 1, !tbaa !97
  %133 = getelementptr inbounds i8, i8* %127, i32 384
  %134 = bitcast i8* %133 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %134, align 1, !tbaa !97
  %135 = shl i32 %output.s0.c.c.us397.us, 9
  %a6.us398.us.5 = or i32 %135, 2560
  %136 = icmp slt i32 %a6.us398.us.5, %b8
  %output.s0.c.v2.base.s.us399.us.5 = select i1 %136, i32 %a6.us398.us.5, i32 %b8
  %t246.us401.us.5 = add i32 %79, %output.s0.c.v2.base.s.us399.us.5
  %137 = sub i32 %t246.us401.us.5, %reass.add248
  %138 = getelementptr inbounds i8, i8* %12, i32 %137
  %139 = bitcast i8* %138 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %139, align 1, !tbaa !97
  %140 = getelementptr inbounds i8, i8* %138, i32 128
  %141 = bitcast i8* %140 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %141, align 1, !tbaa !97
  %142 = getelementptr inbounds i8, i8* %138, i32 256
  %143 = bitcast i8* %142 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %143, align 1, !tbaa !97
  %144 = getelementptr inbounds i8, i8* %138, i32 384
  %145 = bitcast i8* %144 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %145, align 1, !tbaa !97
  %146 = shl i32 %output.s0.c.c.us397.us, 9
  %a6.us398.us.6 = or i32 %146, 3072
  %147 = icmp slt i32 %a6.us398.us.6, %b8
  %output.s0.c.v2.base.s.us399.us.6 = select i1 %147, i32 %a6.us398.us.6, i32 %b8
  %t246.us401.us.6 = add i32 %79, %output.s0.c.v2.base.s.us399.us.6
  %148 = sub i32 %t246.us401.us.6, %reass.add248
  %149 = getelementptr inbounds i8, i8* %12, i32 %148
  %150 = bitcast i8* %149 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %150, align 1, !tbaa !97
  %151 = getelementptr inbounds i8, i8* %149, i32 128
  %152 = bitcast i8* %151 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %152, align 1, !tbaa !97
  %153 = getelementptr inbounds i8, i8* %149, i32 256
  %154 = bitcast i8* %153 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %154, align 1, !tbaa !97
  %155 = getelementptr inbounds i8, i8* %149, i32 384
  %156 = bitcast i8* %155 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %156, align 1, !tbaa !97
  %157 = shl i32 %output.s0.c.c.us397.us, 9
  %a6.us398.us.7 = or i32 %157, 3584
  %158 = icmp slt i32 %a6.us398.us.7, %b8
  %output.s0.c.v2.base.s.us399.us.7 = select i1 %158, i32 %a6.us398.us.7, i32 %b8
  %t246.us401.us.7 = add i32 %79, %output.s0.c.v2.base.s.us399.us.7
  %159 = sub i32 %t246.us401.us.7, %reass.add248
  %160 = getelementptr inbounds i8, i8* %12, i32 %159
  %161 = bitcast i8* %160 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %161, align 1, !tbaa !97
  %162 = getelementptr inbounds i8, i8* %160, i32 128
  %163 = bitcast i8* %162 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %163, align 1, !tbaa !97
  %164 = getelementptr inbounds i8, i8* %160, i32 256
  %165 = bitcast i8* %164 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %165, align 1, !tbaa !97
  %166 = getelementptr inbounds i8, i8* %160, i32 384
  %167 = bitcast i8* %166 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %167, align 1, !tbaa !97
  %168 = add nuw nsw i32 %output.s0.c.c.us397.us, 8
  %niter555.nsub.7 = add i32 %niter555, -8
  %niter555.ncmp.7 = icmp eq i32 %niter555.nsub.7, 0
  br i1 %niter555.ncmp.7, label %"end for output.s0.c.c.loopexit.us.us.loopexit483.unr-lcssa", label %"for output.s0.c.c.us396.us"

"for output.s0.c.c.preheader.split.us404.us":     ; preds = %"for output.s0.x.rebased.us.us"
  %169 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %31, <32 x i32> %34)
  br i1 %40, label %"end for output.s0.c.c.loopexit.us.us.loopexit483.unr-lcssa", label %"for output.s0.c.c.us396.us"

"end for output.s0.c.c.loopexit.us.us.loopexit483.unr-lcssa": ; preds = %"for output.s0.c.c.us396.us", %"for output.s0.c.c.preheader.split.us404.us"
  %output.s0.c.c.us397.us.unr = phi i32 [ 0, %"for output.s0.c.c.preheader.split.us404.us" ], [ %168, %"for output.s0.c.c.us396.us" ]
  br i1 %lcmp.mod553.not, label %"end for output.s0.c.c.loopexit.us.us", label %"for output.s0.c.c.us396.us.epil"

"for output.s0.c.c.us396.us.epil":                ; preds = %"end for output.s0.c.c.loopexit.us.us.loopexit483.unr-lcssa", %"for output.s0.c.c.us396.us.epil"
  %output.s0.c.c.us397.us.epil = phi i32 [ %180, %"for output.s0.c.c.us396.us.epil" ], [ %output.s0.c.c.us397.us.unr, %"end for output.s0.c.c.loopexit.us.us.loopexit483.unr-lcssa" ]
  %epil.iter552 = phi i32 [ %epil.iter552.sub, %"for output.s0.c.c.us396.us.epil" ], [ %xtraiter551, %"end for output.s0.c.c.loopexit.us.us.loopexit483.unr-lcssa" ]
  %a6.us398.us.epil = shl nsw i32 %output.s0.c.c.us397.us.epil, 9
  %170 = icmp slt i32 %a6.us398.us.epil, %b8
  %output.s0.c.v2.base.s.us399.us.epil = select i1 %170, i32 %a6.us398.us.epil, i32 %b8
  %t246.us401.us.epil = add i32 %79, %output.s0.c.v2.base.s.us399.us.epil
  %171 = sub i32 %t246.us401.us.epil, %reass.add248
  %172 = getelementptr inbounds i8, i8* %12, i32 %171
  %173 = bitcast i8* %172 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %173, align 1, !tbaa !97
  %174 = getelementptr inbounds i8, i8* %172, i32 128
  %175 = bitcast i8* %174 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %175, align 1, !tbaa !97
  %176 = getelementptr inbounds i8, i8* %172, i32 256
  %177 = bitcast i8* %176 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %177, align 1, !tbaa !97
  %178 = getelementptr inbounds i8, i8* %172, i32 384
  %179 = bitcast i8* %178 to <32 x i32>*
  store <32 x i32> %169, <32 x i32>* %179, align 1, !tbaa !97
  %180 = add nuw nsw i32 %output.s0.c.c.us397.us.epil, 1
  %epil.iter552.sub = add i32 %epil.iter552, -1
  %epil.iter552.cmp.not = icmp eq i32 %epil.iter552.sub, 0
  br i1 %epil.iter552.cmp.not, label %"end for output.s0.c.c.loopexit.us.us", label %"for output.s0.c.c.us396.us.epil", !llvm.loop !100

"end for output.s0.c.c.loopexit.us.us":           ; preds = %"end for output.s0.c.c.loopexit.us.us.loopexit483.unr-lcssa", %"for output.s0.c.c.us396.us.epil", %"consume maximum.loopexit.us.us.us"
  %181 = add nuw nsw i32 %output.s0.x.rebased.us.us, 1
  %.not101.us.us = icmp eq i32 %181, %15
  br i1 %.not101.us.us, label %"end for output.s0.x.rebased.loopexit.us", label %"for output.s0.x.rebased.us.us"

"for output.s0.c.c.us.us.us":                     ; preds = %"for output.s0.c.c.us.us.us.preheader", %"consume maximum.loopexit.us.us.us"
  %output.s0.c.c.us.us.us = phi i32 [ %196, %"consume maximum.loopexit.us.us.us" ], [ 0, %"for output.s0.c.c.us.us.us.preheader" ]
  %a6.us.us.us = shl nsw i32 %output.s0.c.c.us.us.us, 9
  %182 = icmp slt i32 %a6.us.us.us, %b8
  %output.s0.c.v2.base.s.us.us.us = select i1 %182, i32 %a6.us.us.us, i32 %b8
  %t231.us.us.us = add i32 %output.s0.c.v2.base.s.us.us.us, %44
  br i1 %78, label %"for maximum.s1.r12$y.rebased.us.us.us.us", label %"consume maximum.loopexit.us.us.us", !prof !95

"consume maximum.loopexit.us.us.us":              ; preds = %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us", %"for output.s0.c.c.us.us.us"
  %.us-phi384.us.us.us = phi <32 x i32> [ %31, %"for output.s0.c.c.us.us.us" ], [ %.lcssa486, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ]
  %.us-phi385.us.us.us = phi <32 x i32> [ %31, %"for output.s0.c.c.us.us.us" ], [ %.lcssa, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ]
  %.us-phi386.us.us.us = phi <32 x i32> [ %31, %"for output.s0.c.c.us.us.us" ], [ %.lcssa484, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ]
  %.us-phi387.us.us.us = phi <32 x i32> [ %31, %"for output.s0.c.c.us.us.us" ], [ %.lcssa485, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ]
  %183 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %.us-phi384.us.us.us, <32 x i32> %34)
  %184 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %.us-phi387.us.us.us, <32 x i32> %34)
  %185 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %.us-phi386.us.us.us, <32 x i32> %34)
  %186 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %.us-phi385.us.us.us, <32 x i32> %34)
  %t246.us.us.us = add i32 %79, %output.s0.c.v2.base.s.us.us.us
  %187 = sub i32 %t246.us.us.us, %reass.add248
  %188 = getelementptr inbounds i8, i8* %12, i32 %187
  %189 = bitcast i8* %188 to <32 x i32>*
  store <32 x i32> %183, <32 x i32>* %189, align 1, !tbaa !97
  %190 = getelementptr inbounds i8, i8* %188, i32 128
  %191 = bitcast i8* %190 to <32 x i32>*
  store <32 x i32> %184, <32 x i32>* %191, align 1, !tbaa !97
  %192 = getelementptr inbounds i8, i8* %188, i32 256
  %193 = bitcast i8* %192 to <32 x i32>*
  store <32 x i32> %185, <32 x i32>* %193, align 1, !tbaa !97
  %194 = getelementptr inbounds i8, i8* %188, i32 384
  %195 = bitcast i8* %194 to <32 x i32>*
  store <32 x i32> %186, <32 x i32>* %195, align 1, !tbaa !97
  %196 = add nuw nsw i32 %output.s0.c.c.us.us.us, 1
  %.not102.us.us.us = icmp eq i32 %196, %28
  br i1 %.not102.us.us.us, label %"end for output.s0.c.c.loopexit.us.us", label %"for output.s0.c.c.us.us.us"

"for maximum.s1.r12$y.rebased.us.us.us.us":       ; preds = %"for output.s0.c.c.us.us.us", %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us"
  %.lcssa380383.us.us.us.us = phi <32 x i32> [ %.lcssa486, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ], [ %31, %"for output.s0.c.c.us.us.us" ]
  %maximum81.sroa.28.7.us.us.us.us = phi <32 x i32> [ %.lcssa, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ], [ %31, %"for output.s0.c.c.us.us.us" ]
  %maximum81.sroa.24.7.us.us.us.us = phi <32 x i32> [ %.lcssa484, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ], [ %31, %"for output.s0.c.c.us.us.us" ]
  %maximum81.sroa.16.7.us.us.us.us = phi <32 x i32> [ %.lcssa485, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ], [ %31, %"for output.s0.c.c.us.us.us" ]
  %"maximum.s1.r12$y.rebased.us.us.us.us" = phi i32 [ %300, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us" ], [ 0, %"for output.s0.c.c.us.us.us" ]
  %197 = add nsw i32 %t244.us, %"maximum.s1.r12$y.rebased.us.us.us.us"
  %198 = mul nsw i32 %197, %8
  %199 = add i32 %t231.us.us.us, %198
  br i1 %80, label %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased.us.us.us.us"

"for maximum.s1.r12$x.rebased.us.us.us.us":       ; preds = %"for maximum.s1.r12$y.rebased.us.us.us.us", %"for maximum.s1.r12$x.rebased.us.us.us.us"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.164379.us.us.us.us = phi <32 x i32> [ %266, %"for maximum.s1.r12$x.rebased.us.us.us.us" ], [ %.lcssa380383.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ]
  %maximum81.sroa.28.8.us.us.us.us = phi <32 x i32> [ %278, %"for maximum.s1.r12$x.rebased.us.us.us.us" ], [ %maximum81.sroa.28.7.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ]
  %maximum81.sroa.24.8.us.us.us.us = phi <32 x i32> [ %274, %"for maximum.s1.r12$x.rebased.us.us.us.us" ], [ %maximum81.sroa.24.7.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ]
  %maximum81.sroa.16.8.us.us.us.us = phi <32 x i32> [ %270, %"for maximum.s1.r12$x.rebased.us.us.us.us" ], [ %maximum81.sroa.16.7.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased.us.us.us.us" = phi i32 [ %279, %"for maximum.s1.r12$x.rebased.us.us.us.us" ], [ 0, %"for maximum.s1.r12$y.rebased.us.us.us.us" ]
  %niter569 = phi i32 [ %niter569.nsub.3, %"for maximum.s1.r12$x.rebased.us.us.us.us" ], [ %unroll_iter568, %"for maximum.s1.r12$y.rebased.us.us.us.us" ]
  %200 = add nsw i32 %t254.us.us, %"maximum.s1.r12$x.rebased.us.us.us.us"
  %201 = mul nsw i32 %200, %5
  %t257.us.us.us.us = add i32 %199, %201
  %202 = sub i32 %t257.us.us.us.us, %reass.add245
  %203 = getelementptr inbounds i8, i8* %0, i32 %202
  %204 = bitcast i8* %203 to <32 x i32>*
  %205 = load <32 x i32>, <32 x i32>* %204, align 1, !tbaa !101
  %206 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0.164379.us.us.us.us, <32 x i32> %205)
  %207 = getelementptr inbounds i8, i8* %203, i32 128
  %208 = bitcast i8* %207 to <32 x i32>*
  %209 = load <32 x i32>, <32 x i32>* %208, align 1, !tbaa !101
  %210 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.16.8.us.us.us.us, <32 x i32> %209)
  %211 = getelementptr inbounds i8, i8* %203, i32 256
  %212 = bitcast i8* %211 to <32 x i32>*
  %213 = load <32 x i32>, <32 x i32>* %212, align 1, !tbaa !101
  %214 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.24.8.us.us.us.us, <32 x i32> %213)
  %215 = getelementptr inbounds i8, i8* %203, i32 384
  %216 = bitcast i8* %215 to <32 x i32>*
  %217 = load <32 x i32>, <32 x i32>* %216, align 1, !tbaa !101
  %218 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.28.8.us.us.us.us, <32 x i32> %217)
  %219 = or i32 %"maximum.s1.r12$x.rebased.us.us.us.us", 1
  %220 = add nsw i32 %t254.us.us, %219
  %221 = mul nsw i32 %220, %5
  %t257.us.us.us.us.1 = add i32 %199, %221
  %222 = sub i32 %t257.us.us.us.us.1, %reass.add245
  %223 = getelementptr inbounds i8, i8* %0, i32 %222
  %224 = bitcast i8* %223 to <32 x i32>*
  %225 = load <32 x i32>, <32 x i32>* %224, align 1, !tbaa !101
  %226 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %206, <32 x i32> %225)
  %227 = getelementptr inbounds i8, i8* %223, i32 128
  %228 = bitcast i8* %227 to <32 x i32>*
  %229 = load <32 x i32>, <32 x i32>* %228, align 1, !tbaa !101
  %230 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %210, <32 x i32> %229)
  %231 = getelementptr inbounds i8, i8* %223, i32 256
  %232 = bitcast i8* %231 to <32 x i32>*
  %233 = load <32 x i32>, <32 x i32>* %232, align 1, !tbaa !101
  %234 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %214, <32 x i32> %233)
  %235 = getelementptr inbounds i8, i8* %223, i32 384
  %236 = bitcast i8* %235 to <32 x i32>*
  %237 = load <32 x i32>, <32 x i32>* %236, align 1, !tbaa !101
  %238 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %218, <32 x i32> %237)
  %239 = or i32 %"maximum.s1.r12$x.rebased.us.us.us.us", 2
  %240 = add nsw i32 %t254.us.us, %239
  %241 = mul nsw i32 %240, %5
  %t257.us.us.us.us.2 = add i32 %199, %241
  %242 = sub i32 %t257.us.us.us.us.2, %reass.add245
  %243 = getelementptr inbounds i8, i8* %0, i32 %242
  %244 = bitcast i8* %243 to <32 x i32>*
  %245 = load <32 x i32>, <32 x i32>* %244, align 1, !tbaa !101
  %246 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %226, <32 x i32> %245)
  %247 = getelementptr inbounds i8, i8* %243, i32 128
  %248 = bitcast i8* %247 to <32 x i32>*
  %249 = load <32 x i32>, <32 x i32>* %248, align 1, !tbaa !101
  %250 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %230, <32 x i32> %249)
  %251 = getelementptr inbounds i8, i8* %243, i32 256
  %252 = bitcast i8* %251 to <32 x i32>*
  %253 = load <32 x i32>, <32 x i32>* %252, align 1, !tbaa !101
  %254 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %234, <32 x i32> %253)
  %255 = getelementptr inbounds i8, i8* %243, i32 384
  %256 = bitcast i8* %255 to <32 x i32>*
  %257 = load <32 x i32>, <32 x i32>* %256, align 1, !tbaa !101
  %258 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %238, <32 x i32> %257)
  %259 = or i32 %"maximum.s1.r12$x.rebased.us.us.us.us", 3
  %260 = add nsw i32 %t254.us.us, %259
  %261 = mul nsw i32 %260, %5
  %t257.us.us.us.us.3 = add i32 %199, %261
  %262 = sub i32 %t257.us.us.us.us.3, %reass.add245
  %263 = getelementptr inbounds i8, i8* %0, i32 %262
  %264 = bitcast i8* %263 to <32 x i32>*
  %265 = load <32 x i32>, <32 x i32>* %264, align 1, !tbaa !101
  %266 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %246, <32 x i32> %265)
  %267 = getelementptr inbounds i8, i8* %263, i32 128
  %268 = bitcast i8* %267 to <32 x i32>*
  %269 = load <32 x i32>, <32 x i32>* %268, align 1, !tbaa !101
  %270 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %250, <32 x i32> %269)
  %271 = getelementptr inbounds i8, i8* %263, i32 256
  %272 = bitcast i8* %271 to <32 x i32>*
  %273 = load <32 x i32>, <32 x i32>* %272, align 1, !tbaa !101
  %274 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %254, <32 x i32> %273)
  %275 = getelementptr inbounds i8, i8* %263, i32 384
  %276 = bitcast i8* %275 to <32 x i32>*
  %277 = load <32 x i32>, <32 x i32>* %276, align 1, !tbaa !101
  %278 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %258, <32 x i32> %277)
  %279 = add nuw nsw i32 %"maximum.s1.r12$x.rebased.us.us.us.us", 4
  %niter569.nsub.3 = add i32 %niter569, -4
  %niter569.ncmp.3 = icmp eq i32 %niter569.nsub.3, 0
  br i1 %niter569.ncmp.3, label %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased.us.us.us.us"

"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa": ; preds = %"for maximum.s1.r12$x.rebased.us.us.us.us", %"for maximum.s1.r12$y.rebased.us.us.us.us"
  %.lcssa486.ph = phi <32 x i32> [ undef, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %266, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %.lcssa485.ph = phi <32 x i32> [ undef, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %270, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %.lcssa484.ph = phi <32 x i32> [ undef, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %274, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %.lcssa.ph = phi <32 x i32> [ undef, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %278, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %maximum81.sroa.0.0.maximum81.sroa.0.0.164379.us.us.us.us.unr = phi <32 x i32> [ %.lcssa380383.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %266, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %maximum81.sroa.28.8.us.us.us.us.unr = phi <32 x i32> [ %maximum81.sroa.28.7.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %278, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %maximum81.sroa.24.8.us.us.us.us.unr = phi <32 x i32> [ %maximum81.sroa.24.7.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %274, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %maximum81.sroa.16.8.us.us.us.us.unr = phi <32 x i32> [ %maximum81.sroa.16.7.us.us.us.us, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %270, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased.us.us.us.us.unr" = phi i32 [ 0, %"for maximum.s1.r12$y.rebased.us.us.us.us" ], [ %279, %"for maximum.s1.r12$x.rebased.us.us.us.us" ]
  br i1 %lcmp.mod563.not, label %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us", label %"for maximum.s1.r12$x.rebased.us.us.us.us.epil"

"for maximum.s1.r12$x.rebased.us.us.us.us.epil":  ; preds = %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa", %"for maximum.s1.r12$x.rebased.us.us.us.us.epil"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.164379.us.us.us.us.epil = phi <32 x i32> [ %286, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ], [ %maximum81.sroa.0.0.maximum81.sroa.0.0.164379.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ]
  %maximum81.sroa.28.8.us.us.us.us.epil = phi <32 x i32> [ %298, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ], [ %maximum81.sroa.28.8.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ]
  %maximum81.sroa.24.8.us.us.us.us.epil = phi <32 x i32> [ %294, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ], [ %maximum81.sroa.24.8.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ]
  %maximum81.sroa.16.8.us.us.us.us.epil = phi <32 x i32> [ %290, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ], [ %maximum81.sroa.16.8.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ]
  %"maximum.s1.r12$x.rebased.us.us.us.us.epil" = phi i32 [ %299, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ], [ %"maximum.s1.r12$x.rebased.us.us.us.us.unr", %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ]
  %epil.iter562 = phi i32 [ %epil.iter562.sub, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ], [ %xtraiter561, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ]
  %280 = add nsw i32 %t254.us.us, %"maximum.s1.r12$x.rebased.us.us.us.us.epil"
  %281 = mul nsw i32 %280, %5
  %t257.us.us.us.us.epil = add i32 %199, %281
  %282 = sub i32 %t257.us.us.us.us.epil, %reass.add245
  %283 = getelementptr inbounds i8, i8* %0, i32 %282
  %284 = bitcast i8* %283 to <32 x i32>*
  %285 = load <32 x i32>, <32 x i32>* %284, align 1, !tbaa !101
  %286 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0.164379.us.us.us.us.epil, <32 x i32> %285)
  %287 = getelementptr inbounds i8, i8* %283, i32 128
  %288 = bitcast i8* %287 to <32 x i32>*
  %289 = load <32 x i32>, <32 x i32>* %288, align 1, !tbaa !101
  %290 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.16.8.us.us.us.us.epil, <32 x i32> %289)
  %291 = getelementptr inbounds i8, i8* %283, i32 256
  %292 = bitcast i8* %291 to <32 x i32>*
  %293 = load <32 x i32>, <32 x i32>* %292, align 1, !tbaa !101
  %294 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.24.8.us.us.us.us.epil, <32 x i32> %293)
  %295 = getelementptr inbounds i8, i8* %283, i32 384
  %296 = bitcast i8* %295 to <32 x i32>*
  %297 = load <32 x i32>, <32 x i32>* %296, align 1, !tbaa !101
  %298 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.28.8.us.us.us.us.epil, <32 x i32> %297)
  %299 = add nuw nsw i32 %"maximum.s1.r12$x.rebased.us.us.us.us.epil", 1
  %epil.iter562.sub = add i32 %epil.iter562, -1
  %epil.iter562.cmp.not = icmp eq i32 %epil.iter562.sub, 0
  br i1 %epil.iter562.cmp.not, label %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us", label %"for maximum.s1.r12$x.rebased.us.us.us.us.epil", !llvm.loop !103

"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us": ; preds = %"for maximum.s1.r12$x.rebased.us.us.us.us.epil", %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa"
  %.lcssa486 = phi <32 x i32> [ %.lcssa486.ph, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ], [ %286, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ]
  %.lcssa485 = phi <32 x i32> [ %.lcssa485.ph, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ], [ %290, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ]
  %.lcssa484 = phi <32 x i32> [ %.lcssa484.ph, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ], [ %294, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ]
  %.lcssa = phi <32 x i32> [ %.lcssa.ph, %"end for maximum.s1.r12$x.rebased.loopexit.us.us.us.us.unr-lcssa" ], [ %298, %"for maximum.s1.r12$x.rebased.us.us.us.us.epil" ]
  %300 = add nuw nsw i32 %"maximum.s1.r12$y.rebased.us.us.us.us", 1
  %.not103.us.us.us.us = icmp eq i32 %300, %t250.us
  br i1 %.not103.us.us.us.us, label %"consume maximum.loopexit.us.us.us", label %"for maximum.s1.r12$y.rebased.us.us.us.us"

"end for output.s0.y.rebased":                    ; preds = %"end for output.s0.x.rebased.loopexit.us", %"for output.s0.b.rebased"
  %301 = add nuw nsw i32 %output.s0.b.rebased, 1
  %.not99 = icmp eq i32 %301, %10
  br i1 %.not99, label %call_destructor.exit, label %"for output.s0.b.rebased"

then_bb1:                                         ; preds = %next_bb
  %302 = icmp sgt i32 %10, 0
  br i1 %302, label %"for output.s0.b.rebased3.preheader", label %call_destructor.exit, !prof !95

"for output.s0.b.rebased3.preheader":             ; preds = %then_bb1
  %.neg225 = mul i32 %5, %3
  %.neg224 = mul i32 %8, %6
  %.neg223 = mul i32 %11, %9
  %.neg222 = mul i32 %16, %14
  %.neg221 = mul i32 %19, %17
  %.neg220 = mul i32 %20, %9
  %303 = icmp sgt i32 %18, 0
  %304 = add nsw i32 %7, %6
  %305 = icmp sgt i32 %15, 0
  %306 = add nsw i32 %4, %3
  %307 = add nuw nsw i32 %2, 255
  %308 = ashr i32 %307, 8
  %b21 = add nsw i32 %2, -256
  %309 = insertelement <256 x i8> undef, i8 %output_min, i32 0
  %310 = shufflevector <256 x i8> %309, <256 x i8> undef, <256 x i32> zeroinitializer
  %311 = bitcast <256 x i8> %310 to <64 x i32>
  %reass.add229 = add i32 %.neg224, %.neg225
  %reass.add230 = add i32 %reass.add229, %.neg223
  %312 = insertelement <128 x i8> undef, i8 %b54, i32 0
  %313 = shufflevector <128 x i8> %312, <128 x i8> undef, <128 x i32> zeroinitializer
  %314 = bitcast <128 x i8> %313 to <32 x i32>
  %reass.add232 = add i32 %.neg221, %.neg222
  %reass.add233 = add i32 %reass.add232, %.neg220
  br i1 %303, label %"for output.s0.b.rebased3.us.preheader", label %call_destructor.exit, !prof !95

"for output.s0.b.rebased3.us.preheader":          ; preds = %"for output.s0.b.rebased3.preheader"
  %315 = add nsw i32 %308, -1
  %316 = add nsw i32 %308, -1
  %317 = add i32 %4, %3
  %318 = mul i32 %14, %stride_x
  %319 = sub i32 %317, %318
  %320 = sub i32 %3, %318
  %xtraiter529 = and i32 %308, 7
  %321 = icmp ult i32 %315, 7
  %unroll_iter532 = and i32 %308, -8
  %lcmp.mod531.not = icmp eq i32 %xtraiter529, 0
  %xtraiter534 = and i32 %308, 7
  %322 = icmp ult i32 %316, 7
  %unroll_iter537 = and i32 %308, -8
  %lcmp.mod536.not = icmp eq i32 %xtraiter534, 0
  br label %"for output.s0.b.rebased3.us"

"for output.s0.b.rebased3.us":                    ; preds = %"for output.s0.b.rebased3.us.preheader", %"end for output.s0.y.rebased7.loopexit.us"
  %output.s0.b.rebased5.us = phi i32 [ %326, %"end for output.s0.y.rebased7.loopexit.us" ], [ 0, %"for output.s0.b.rebased3.us.preheader" ]
  %323 = add nsw i32 %output.s0.b.rebased5.us, %9
  %324 = mul nsw i32 %323, %20
  %325 = mul nsw i32 %323, %11
  br i1 %305, label %"for output.s0.y.rebased6.preheader.split.us.us", label %"end for output.s0.y.rebased7.loopexit.us", !prof !95

"end for output.s0.y.rebased7.loopexit.us":       ; preds = %"end for output.s0.x.rebased10.loopexit.us.us", %"for output.s0.b.rebased3.us"
  %326 = add nuw nsw i32 %output.s0.b.rebased5.us, 1
  %.not93.us = icmp eq i32 %326, %10
  br i1 %.not93.us, label %call_destructor.exit, label %"for output.s0.b.rebased3.us"

"for output.s0.y.rebased6.preheader.split.us.us": ; preds = %"for output.s0.b.rebased3.us"
  %327 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %311)
  %328 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %311)
  br label %"for output.s0.y.rebased6.us.us"

"for output.s0.y.rebased6.us.us":                 ; preds = %"end for output.s0.x.rebased10.loopexit.us.us", %"for output.s0.y.rebased6.preheader.split.us.us"
  %output.s0.y.rebased8.us.us = phi i32 [ %409, %"end for output.s0.x.rebased10.loopexit.us.us" ], [ 0, %"for output.s0.y.rebased6.preheader.split.us.us" ]
  %329 = add nsw i32 %output.s0.y.rebased8.us.us, %17
  %330 = mul nsw i32 %329, %stride_y
  %a13.us.us = sub i32 %304, %330
  %331 = icmp slt i32 %a13.us.us, %b42
  %b17.us.us = select i1 %331, i32 %a13.us.us, i32 %b42
  %a14.us.us = sub nsw i32 %6, %330
  %332 = icmp slt i32 %a14.us.us, %b42
  %a22.us.us = select i1 %332, i32 %a14.us.us, i32 %b42
  %333 = icmp sgt i32 %a22.us.us, %b17.us.us
  %a21.us.us = select i1 %333, i32 %a22.us.us, i32 %b17.us.us
  %334 = icmp sgt i32 %a22.us.us, 0
  %335 = select i1 %334, i32 %a22.us.us, i32 0
  %t276.us.us = add nsw i32 %335, %330
  %336 = mul nsw i32 %329, %19
  %337 = icmp sgt i32 %a21.us.us, 0
  %338 = select i1 %337, i32 %a21.us.us, i32 0
  %t282.us.us = sub nsw i32 %338, %335
  %339 = icmp sgt i32 %t282.us.us, 0
  %t264.us.us = add i32 %336, %324
  br i1 %339, label %"for output.s0.x.rebased9.us.us.us", label %"for output.s0.x.rebased9.preheader.split.us368.us", !prof !95

"for output.s0.x.rebased9.us364.us":              ; preds = %"for output.s0.x.rebased9.preheader.split.us368.us", %"end for output.s0.c.c13.split.us.us"
  %output.s0.x.rebased11.us365.us = phi i32 [ %406, %"end for output.s0.c.c13.split.us.us" ], [ 0, %"for output.s0.x.rebased9.preheader.split.us368.us" ]
  %340 = add nsw i32 %output.s0.x.rebased11.us365.us, %14
  %341 = mul nsw i32 %340, %16
  %342 = add i32 %t264.us.us, %341
  br i1 %321, label %"end for output.s0.c.c13.split.us.us.unr-lcssa", label %"for output.s0.c.c12.us.us"

"for output.s0.c.c12.us.us":                      ; preds = %"for output.s0.x.rebased9.us364.us", %"for output.s0.c.c12.us.us"
  %output.s0.c.c14.us.us = phi i32 [ %398, %"for output.s0.c.c12.us.us" ], [ 0, %"for output.s0.x.rebased9.us364.us" ]
  %niter533 = phi i32 [ %niter533.nsub.7, %"for output.s0.c.c12.us.us" ], [ %unroll_iter532, %"for output.s0.x.rebased9.us364.us" ]
  %a19.us.us = shl nsw i32 %output.s0.c.c14.us.us, 8
  %343 = icmp slt i32 %a19.us.us, %b21
  %output.s0.c.v3.base.s.us.us = select i1 %343, i32 %a19.us.us, i32 %b21
  %t278.us.us = add i32 %342, %output.s0.c.v3.base.s.us.us
  %344 = sub i32 %t278.us.us, %reass.add233
  %345 = getelementptr inbounds i8, i8* %12, i32 %344
  %346 = bitcast i8* %345 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %346, align 1, !tbaa !97
  %347 = getelementptr inbounds i8, i8* %345, i32 128
  %348 = bitcast i8* %347 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %348, align 1, !tbaa !97
  %349 = shl i32 %output.s0.c.c14.us.us, 8
  %a19.us.us.1 = or i32 %349, 256
  %350 = icmp slt i32 %a19.us.us.1, %b21
  %output.s0.c.v3.base.s.us.us.1 = select i1 %350, i32 %a19.us.us.1, i32 %b21
  %t278.us.us.1 = add i32 %342, %output.s0.c.v3.base.s.us.us.1
  %351 = sub i32 %t278.us.us.1, %reass.add233
  %352 = getelementptr inbounds i8, i8* %12, i32 %351
  %353 = bitcast i8* %352 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %353, align 1, !tbaa !97
  %354 = getelementptr inbounds i8, i8* %352, i32 128
  %355 = bitcast i8* %354 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %355, align 1, !tbaa !97
  %356 = shl i32 %output.s0.c.c14.us.us, 8
  %a19.us.us.2 = or i32 %356, 512
  %357 = icmp slt i32 %a19.us.us.2, %b21
  %output.s0.c.v3.base.s.us.us.2 = select i1 %357, i32 %a19.us.us.2, i32 %b21
  %t278.us.us.2 = add i32 %342, %output.s0.c.v3.base.s.us.us.2
  %358 = sub i32 %t278.us.us.2, %reass.add233
  %359 = getelementptr inbounds i8, i8* %12, i32 %358
  %360 = bitcast i8* %359 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %360, align 1, !tbaa !97
  %361 = getelementptr inbounds i8, i8* %359, i32 128
  %362 = bitcast i8* %361 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %362, align 1, !tbaa !97
  %363 = shl i32 %output.s0.c.c14.us.us, 8
  %a19.us.us.3 = or i32 %363, 768
  %364 = icmp slt i32 %a19.us.us.3, %b21
  %output.s0.c.v3.base.s.us.us.3 = select i1 %364, i32 %a19.us.us.3, i32 %b21
  %t278.us.us.3 = add i32 %342, %output.s0.c.v3.base.s.us.us.3
  %365 = sub i32 %t278.us.us.3, %reass.add233
  %366 = getelementptr inbounds i8, i8* %12, i32 %365
  %367 = bitcast i8* %366 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %367, align 1, !tbaa !97
  %368 = getelementptr inbounds i8, i8* %366, i32 128
  %369 = bitcast i8* %368 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %369, align 1, !tbaa !97
  %370 = shl i32 %output.s0.c.c14.us.us, 8
  %a19.us.us.4 = or i32 %370, 1024
  %371 = icmp slt i32 %a19.us.us.4, %b21
  %output.s0.c.v3.base.s.us.us.4 = select i1 %371, i32 %a19.us.us.4, i32 %b21
  %t278.us.us.4 = add i32 %342, %output.s0.c.v3.base.s.us.us.4
  %372 = sub i32 %t278.us.us.4, %reass.add233
  %373 = getelementptr inbounds i8, i8* %12, i32 %372
  %374 = bitcast i8* %373 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %374, align 1, !tbaa !97
  %375 = getelementptr inbounds i8, i8* %373, i32 128
  %376 = bitcast i8* %375 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %376, align 1, !tbaa !97
  %377 = shl i32 %output.s0.c.c14.us.us, 8
  %a19.us.us.5 = or i32 %377, 1280
  %378 = icmp slt i32 %a19.us.us.5, %b21
  %output.s0.c.v3.base.s.us.us.5 = select i1 %378, i32 %a19.us.us.5, i32 %b21
  %t278.us.us.5 = add i32 %342, %output.s0.c.v3.base.s.us.us.5
  %379 = sub i32 %t278.us.us.5, %reass.add233
  %380 = getelementptr inbounds i8, i8* %12, i32 %379
  %381 = bitcast i8* %380 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %381, align 1, !tbaa !97
  %382 = getelementptr inbounds i8, i8* %380, i32 128
  %383 = bitcast i8* %382 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %383, align 1, !tbaa !97
  %384 = shl i32 %output.s0.c.c14.us.us, 8
  %a19.us.us.6 = or i32 %384, 1536
  %385 = icmp slt i32 %a19.us.us.6, %b21
  %output.s0.c.v3.base.s.us.us.6 = select i1 %385, i32 %a19.us.us.6, i32 %b21
  %t278.us.us.6 = add i32 %342, %output.s0.c.v3.base.s.us.us.6
  %386 = sub i32 %t278.us.us.6, %reass.add233
  %387 = getelementptr inbounds i8, i8* %12, i32 %386
  %388 = bitcast i8* %387 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %388, align 1, !tbaa !97
  %389 = getelementptr inbounds i8, i8* %387, i32 128
  %390 = bitcast i8* %389 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %390, align 1, !tbaa !97
  %391 = shl i32 %output.s0.c.c14.us.us, 8
  %a19.us.us.7 = or i32 %391, 1792
  %392 = icmp slt i32 %a19.us.us.7, %b21
  %output.s0.c.v3.base.s.us.us.7 = select i1 %392, i32 %a19.us.us.7, i32 %b21
  %t278.us.us.7 = add i32 %342, %output.s0.c.v3.base.s.us.us.7
  %393 = sub i32 %t278.us.us.7, %reass.add233
  %394 = getelementptr inbounds i8, i8* %12, i32 %393
  %395 = bitcast i8* %394 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %395, align 1, !tbaa !97
  %396 = getelementptr inbounds i8, i8* %394, i32 128
  %397 = bitcast i8* %396 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %397, align 1, !tbaa !97
  %398 = add nuw nsw i32 %output.s0.c.c14.us.us, 8
  %niter533.nsub.7 = add i32 %niter533, -8
  %niter533.ncmp.7 = icmp eq i32 %niter533.nsub.7, 0
  br i1 %niter533.ncmp.7, label %"end for output.s0.c.c13.split.us.us.unr-lcssa", label %"for output.s0.c.c12.us.us"

"end for output.s0.c.c13.split.us.us.unr-lcssa":  ; preds = %"for output.s0.c.c12.us.us", %"for output.s0.x.rebased9.us364.us"
  %output.s0.c.c14.us.us.unr = phi i32 [ 0, %"for output.s0.x.rebased9.us364.us" ], [ %398, %"for output.s0.c.c12.us.us" ]
  br i1 %lcmp.mod531.not, label %"end for output.s0.c.c13.split.us.us", label %"for output.s0.c.c12.us.us.epil"

"for output.s0.c.c12.us.us.epil":                 ; preds = %"end for output.s0.c.c13.split.us.us.unr-lcssa", %"for output.s0.c.c12.us.us.epil"
  %output.s0.c.c14.us.us.epil = phi i32 [ %405, %"for output.s0.c.c12.us.us.epil" ], [ %output.s0.c.c14.us.us.unr, %"end for output.s0.c.c13.split.us.us.unr-lcssa" ]
  %epil.iter530 = phi i32 [ %epil.iter530.sub, %"for output.s0.c.c12.us.us.epil" ], [ %xtraiter529, %"end for output.s0.c.c13.split.us.us.unr-lcssa" ]
  %a19.us.us.epil = shl nsw i32 %output.s0.c.c14.us.us.epil, 8
  %399 = icmp slt i32 %a19.us.us.epil, %b21
  %output.s0.c.v3.base.s.us.us.epil = select i1 %399, i32 %a19.us.us.epil, i32 %b21
  %t278.us.us.epil = add i32 %342, %output.s0.c.v3.base.s.us.us.epil
  %400 = sub i32 %t278.us.us.epil, %reass.add233
  %401 = getelementptr inbounds i8, i8* %12, i32 %400
  %402 = bitcast i8* %401 to <32 x i32>*
  store <32 x i32> %407, <32 x i32>* %402, align 1, !tbaa !97
  %403 = getelementptr inbounds i8, i8* %401, i32 128
  %404 = bitcast i8* %403 to <32 x i32>*
  store <32 x i32> %408, <32 x i32>* %404, align 1, !tbaa !97
  %405 = add nuw nsw i32 %output.s0.c.c14.us.us.epil, 1
  %epil.iter530.sub = add i32 %epil.iter530, -1
  %epil.iter530.cmp.not = icmp eq i32 %epil.iter530.sub, 0
  br i1 %epil.iter530.cmp.not, label %"end for output.s0.c.c13.split.us.us", label %"for output.s0.c.c12.us.us.epil", !llvm.loop !104

"end for output.s0.c.c13.split.us.us":            ; preds = %"for output.s0.c.c12.us.us.epil", %"end for output.s0.c.c13.split.us.us.unr-lcssa"
  %406 = add nuw nsw i32 %output.s0.x.rebased11.us365.us, 1
  %.not96.us366.us = icmp eq i32 %406, %15
  br i1 %.not96.us366.us, label %"end for output.s0.x.rebased10.loopexit.us.us", label %"for output.s0.x.rebased9.us364.us"

"for output.s0.x.rebased9.preheader.split.us368.us": ; preds = %"for output.s0.y.rebased6.us.us"
  %407 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %328, <32 x i32> %314)
  %408 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %327, <32 x i32> %314)
  br label %"for output.s0.x.rebased9.us364.us"

"end for output.s0.x.rebased10.loopexit.us.us":   ; preds = %"end for output.s0.c.c13.split.us.us", %"end for output.s0.c.c13.split.us.us.us.us"
  %409 = add nuw nsw i32 %output.s0.y.rebased8.us.us, 1
  %.not94.us.us = icmp eq i32 %409, %18
  br i1 %.not94.us.us, label %"end for output.s0.y.rebased7.loopexit.us", label %"for output.s0.y.rebased6.us.us"

"for output.s0.x.rebased9.us.us.us":              ; preds = %"for output.s0.y.rebased6.us.us", %"end for output.s0.c.c13.split.us.us.us.us"
  %output.s0.x.rebased11.us.us.us = phi i32 [ %499, %"end for output.s0.c.c13.split.us.us.us.us" ], [ 0, %"for output.s0.y.rebased6.us.us" ]
  %410 = mul i32 %output.s0.x.rebased11.us.us.us, %stride_x
  %411 = sub i32 %319, %410
  %412 = icmp sgt i32 %411, %b45
  %smin539 = select i1 %412, i32 %b45, i32 %411
  %413 = sub i32 %320, %410
  %414 = icmp sgt i32 %413, %b45
  %smin540 = select i1 %414, i32 %b45, i32 %413
  %415 = icmp sgt i32 %smin539, %smin540
  %smax541 = select i1 %415, i32 %smin539, i32 %smin540
  %416 = icmp sgt i32 %smax541, 0
  %smax542 = select i1 %416, i32 %smax541, i32 0
  %417 = icmp sgt i32 %smin540, 0
  %smax543 = select i1 %417, i32 %smin540, i32 0
  %418 = sub nsw i32 %smax542, %smax543
  %419 = xor i32 %smax543, -1
  %420 = add nsw i32 %smax542, %419
  %421 = add nsw i32 %output.s0.x.rebased11.us.us.us, %14
  %422 = mul nsw i32 %421, %stride_x
  %a16.us.us.us = sub i32 %306, %422
  %423 = icmp slt i32 %a16.us.us.us, %b45
  %b22.us.us.us = select i1 %423, i32 %a16.us.us.us, i32 %b45
  %a17.us.us.us = sub nsw i32 %3, %422
  %424 = icmp slt i32 %a17.us.us.us, %b45
  %a25.us.us.us = select i1 %424, i32 %a17.us.us.us, i32 %b45
  %425 = mul nsw i32 %421, %16
  %426 = icmp sgt i32 %a25.us.us.us, %b22.us.us.us
  %a24.us.us.us = select i1 %426, i32 %a25.us.us.us, i32 %b22.us.us.us
  %427 = icmp sgt i32 %a25.us.us.us, 0
  %428 = select i1 %427, i32 %a25.us.us.us, i32 0
  %t286.us.us.us = add nsw i32 %428, %422
  %429 = icmp sgt i32 %a24.us.us.us, 0
  %430 = select i1 %429, i32 %a24.us.us.us, i32 0
  %431 = icmp sgt i32 %430, %428
  %432 = add i32 %t264.us.us, %425
  br i1 %431, label %"for output.s0.c.c12.us.us.us.us.us.preheader", label %"for output.s0.x.rebased9.split.us.split.us360.us.us", !prof !95

"for output.s0.c.c12.us.us.us.us.us.preheader":   ; preds = %"for output.s0.x.rebased9.us.us.us"
  %xtraiter544 = and i32 %418, 7
  %433 = icmp ult i32 %420, 7
  %unroll_iter549 = and i32 %418, -8
  %lcmp.mod546.not = icmp eq i32 %xtraiter544, 0
  br label %"for output.s0.c.c12.us.us.us.us.us"

"for output.s0.c.c12.us.us353.us.us":             ; preds = %"for output.s0.x.rebased9.split.us.split.us360.us.us", %"for output.s0.c.c12.us.us353.us.us"
  %output.s0.c.c14.us.us354.us.us = phi i32 [ %489, %"for output.s0.c.c12.us.us353.us.us" ], [ 0, %"for output.s0.x.rebased9.split.us.split.us360.us.us" ]
  %niter538 = phi i32 [ %niter538.nsub.7, %"for output.s0.c.c12.us.us353.us.us" ], [ %unroll_iter537, %"for output.s0.x.rebased9.split.us.split.us360.us.us" ]
  %a19.us.us355.us.us = shl nsw i32 %output.s0.c.c14.us.us354.us.us, 8
  %434 = icmp slt i32 %a19.us.us355.us.us, %b21
  %output.s0.c.v3.base.s.us.us356.us.us = select i1 %434, i32 %a19.us.us355.us.us, i32 %b21
  %t278.us.us357.us.us = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us
  %435 = sub i32 %t278.us.us357.us.us, %reass.add233
  %436 = getelementptr inbounds i8, i8* %12, i32 %435
  %437 = bitcast i8* %436 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %437, align 1, !tbaa !97
  %438 = getelementptr inbounds i8, i8* %436, i32 128
  %439 = bitcast i8* %438 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %439, align 1, !tbaa !97
  %440 = shl i32 %output.s0.c.c14.us.us354.us.us, 8
  %a19.us.us355.us.us.1 = or i32 %440, 256
  %441 = icmp slt i32 %a19.us.us355.us.us.1, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.1 = select i1 %441, i32 %a19.us.us355.us.us.1, i32 %b21
  %t278.us.us357.us.us.1 = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.1
  %442 = sub i32 %t278.us.us357.us.us.1, %reass.add233
  %443 = getelementptr inbounds i8, i8* %12, i32 %442
  %444 = bitcast i8* %443 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %444, align 1, !tbaa !97
  %445 = getelementptr inbounds i8, i8* %443, i32 128
  %446 = bitcast i8* %445 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %446, align 1, !tbaa !97
  %447 = shl i32 %output.s0.c.c14.us.us354.us.us, 8
  %a19.us.us355.us.us.2 = or i32 %447, 512
  %448 = icmp slt i32 %a19.us.us355.us.us.2, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.2 = select i1 %448, i32 %a19.us.us355.us.us.2, i32 %b21
  %t278.us.us357.us.us.2 = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.2
  %449 = sub i32 %t278.us.us357.us.us.2, %reass.add233
  %450 = getelementptr inbounds i8, i8* %12, i32 %449
  %451 = bitcast i8* %450 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %451, align 1, !tbaa !97
  %452 = getelementptr inbounds i8, i8* %450, i32 128
  %453 = bitcast i8* %452 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %453, align 1, !tbaa !97
  %454 = shl i32 %output.s0.c.c14.us.us354.us.us, 8
  %a19.us.us355.us.us.3 = or i32 %454, 768
  %455 = icmp slt i32 %a19.us.us355.us.us.3, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.3 = select i1 %455, i32 %a19.us.us355.us.us.3, i32 %b21
  %t278.us.us357.us.us.3 = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.3
  %456 = sub i32 %t278.us.us357.us.us.3, %reass.add233
  %457 = getelementptr inbounds i8, i8* %12, i32 %456
  %458 = bitcast i8* %457 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %458, align 1, !tbaa !97
  %459 = getelementptr inbounds i8, i8* %457, i32 128
  %460 = bitcast i8* %459 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %460, align 1, !tbaa !97
  %461 = shl i32 %output.s0.c.c14.us.us354.us.us, 8
  %a19.us.us355.us.us.4 = or i32 %461, 1024
  %462 = icmp slt i32 %a19.us.us355.us.us.4, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.4 = select i1 %462, i32 %a19.us.us355.us.us.4, i32 %b21
  %t278.us.us357.us.us.4 = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.4
  %463 = sub i32 %t278.us.us357.us.us.4, %reass.add233
  %464 = getelementptr inbounds i8, i8* %12, i32 %463
  %465 = bitcast i8* %464 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %465, align 1, !tbaa !97
  %466 = getelementptr inbounds i8, i8* %464, i32 128
  %467 = bitcast i8* %466 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %467, align 1, !tbaa !97
  %468 = shl i32 %output.s0.c.c14.us.us354.us.us, 8
  %a19.us.us355.us.us.5 = or i32 %468, 1280
  %469 = icmp slt i32 %a19.us.us355.us.us.5, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.5 = select i1 %469, i32 %a19.us.us355.us.us.5, i32 %b21
  %t278.us.us357.us.us.5 = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.5
  %470 = sub i32 %t278.us.us357.us.us.5, %reass.add233
  %471 = getelementptr inbounds i8, i8* %12, i32 %470
  %472 = bitcast i8* %471 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %472, align 1, !tbaa !97
  %473 = getelementptr inbounds i8, i8* %471, i32 128
  %474 = bitcast i8* %473 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %474, align 1, !tbaa !97
  %475 = shl i32 %output.s0.c.c14.us.us354.us.us, 8
  %a19.us.us355.us.us.6 = or i32 %475, 1536
  %476 = icmp slt i32 %a19.us.us355.us.us.6, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.6 = select i1 %476, i32 %a19.us.us355.us.us.6, i32 %b21
  %t278.us.us357.us.us.6 = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.6
  %477 = sub i32 %t278.us.us357.us.us.6, %reass.add233
  %478 = getelementptr inbounds i8, i8* %12, i32 %477
  %479 = bitcast i8* %478 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %479, align 1, !tbaa !97
  %480 = getelementptr inbounds i8, i8* %478, i32 128
  %481 = bitcast i8* %480 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %481, align 1, !tbaa !97
  %482 = shl i32 %output.s0.c.c14.us.us354.us.us, 8
  %a19.us.us355.us.us.7 = or i32 %482, 1792
  %483 = icmp slt i32 %a19.us.us355.us.us.7, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.7 = select i1 %483, i32 %a19.us.us355.us.us.7, i32 %b21
  %t278.us.us357.us.us.7 = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.7
  %484 = sub i32 %t278.us.us357.us.us.7, %reass.add233
  %485 = getelementptr inbounds i8, i8* %12, i32 %484
  %486 = bitcast i8* %485 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %486, align 1, !tbaa !97
  %487 = getelementptr inbounds i8, i8* %485, i32 128
  %488 = bitcast i8* %487 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %488, align 1, !tbaa !97
  %489 = add nuw nsw i32 %output.s0.c.c14.us.us354.us.us, 8
  %niter538.nsub.7 = add i32 %niter538, -8
  %niter538.ncmp.7 = icmp eq i32 %niter538.nsub.7, 0
  br i1 %niter538.ncmp.7, label %"end for output.s0.c.c13.split.us.us.us.us.loopexit487.unr-lcssa", label %"for output.s0.c.c12.us.us353.us.us"

"for output.s0.x.rebased9.split.us.split.us360.us.us": ; preds = %"for output.s0.x.rebased9.us.us.us"
  %490 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %328, <32 x i32> %314)
  %491 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %327, <32 x i32> %314)
  br i1 %322, label %"end for output.s0.c.c13.split.us.us.us.us.loopexit487.unr-lcssa", label %"for output.s0.c.c12.us.us353.us.us"

"end for output.s0.c.c13.split.us.us.us.us.loopexit487.unr-lcssa": ; preds = %"for output.s0.c.c12.us.us353.us.us", %"for output.s0.x.rebased9.split.us.split.us360.us.us"
  %output.s0.c.c14.us.us354.us.us.unr = phi i32 [ 0, %"for output.s0.x.rebased9.split.us.split.us360.us.us" ], [ %489, %"for output.s0.c.c12.us.us353.us.us" ]
  br i1 %lcmp.mod536.not, label %"end for output.s0.c.c13.split.us.us.us.us", label %"for output.s0.c.c12.us.us353.us.us.epil"

"for output.s0.c.c12.us.us353.us.us.epil":        ; preds = %"end for output.s0.c.c13.split.us.us.us.us.loopexit487.unr-lcssa", %"for output.s0.c.c12.us.us353.us.us.epil"
  %output.s0.c.c14.us.us354.us.us.epil = phi i32 [ %498, %"for output.s0.c.c12.us.us353.us.us.epil" ], [ %output.s0.c.c14.us.us354.us.us.unr, %"end for output.s0.c.c13.split.us.us.us.us.loopexit487.unr-lcssa" ]
  %epil.iter535 = phi i32 [ %epil.iter535.sub, %"for output.s0.c.c12.us.us353.us.us.epil" ], [ %xtraiter534, %"end for output.s0.c.c13.split.us.us.us.us.loopexit487.unr-lcssa" ]
  %a19.us.us355.us.us.epil = shl nsw i32 %output.s0.c.c14.us.us354.us.us.epil, 8
  %492 = icmp slt i32 %a19.us.us355.us.us.epil, %b21
  %output.s0.c.v3.base.s.us.us356.us.us.epil = select i1 %492, i32 %a19.us.us355.us.us.epil, i32 %b21
  %t278.us.us357.us.us.epil = add i32 %432, %output.s0.c.v3.base.s.us.us356.us.us.epil
  %493 = sub i32 %t278.us.us357.us.us.epil, %reass.add233
  %494 = getelementptr inbounds i8, i8* %12, i32 %493
  %495 = bitcast i8* %494 to <32 x i32>*
  store <32 x i32> %490, <32 x i32>* %495, align 1, !tbaa !97
  %496 = getelementptr inbounds i8, i8* %494, i32 128
  %497 = bitcast i8* %496 to <32 x i32>*
  store <32 x i32> %491, <32 x i32>* %497, align 1, !tbaa !97
  %498 = add nuw nsw i32 %output.s0.c.c14.us.us354.us.us.epil, 1
  %epil.iter535.sub = add i32 %epil.iter535, -1
  %epil.iter535.cmp.not = icmp eq i32 %epil.iter535.sub, 0
  br i1 %epil.iter535.cmp.not, label %"end for output.s0.c.c13.split.us.us.us.us", label %"for output.s0.c.c12.us.us353.us.us.epil", !llvm.loop !105

"end for output.s0.c.c13.split.us.us.us.us":      ; preds = %"end for output.s0.c.c13.split.us.us.us.us.loopexit487.unr-lcssa", %"for output.s0.c.c12.us.us353.us.us.epil", %"consume maximum22.loopexit.split.us.us.us.us.us.us"
  %499 = add nuw nsw i32 %output.s0.x.rebased11.us.us.us, 1
  %.not96.us.us.us = icmp eq i32 %499, %15
  br i1 %.not96.us.us.us, label %"end for output.s0.x.rebased10.loopexit.us.us", label %"for output.s0.x.rebased9.us.us.us"

"for output.s0.c.c12.us.us.us.us.us":             ; preds = %"for output.s0.c.c12.us.us.us.us.us.preheader", %"consume maximum22.loopexit.split.us.us.us.us.us.us"
  %output.s0.c.c14.us.us.us.us.us = phi i32 [ %620, %"consume maximum22.loopexit.split.us.us.us.us.us.us" ], [ 0, %"for output.s0.c.c12.us.us.us.us.us.preheader" ]
  %a19.us.us.us.us.us = shl nsw i32 %output.s0.c.c14.us.us.us.us.us, 8
  %500 = icmp slt i32 %a19.us.us.us.us.us, %b21
  %output.s0.c.v3.base.s.us.us.us.us.us = select i1 %500, i32 %a19.us.us.us.us.us, i32 %b21
  %t263.us.us.us.us.us = add i32 %output.s0.c.v3.base.s.us.us.us.us.us, %325
  br label %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us"

"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us": ; preds = %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us", %"for output.s0.c.c12.us.us.us.us.us"
  %.lcssa339342.us.us.us.us.us.us = phi <32 x i32> [ %.lcssa491, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us" ], [ %328, %"for output.s0.c.c12.us.us.us.us.us" ]
  %maximum81.sroa.16.11.us.us.us.us.us.us = phi <32 x i32> [ %.lcssa490, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us" ], [ %327, %"for output.s0.c.c12.us.us.us.us.us" ]
  %"maximum.s1.r12$y.rebased18.us.us.us.us.us.us" = phi i32 [ %612, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us" ], [ 0, %"for output.s0.c.c12.us.us.us.us.us" ]
  %501 = add nsw i32 %t276.us.us, %"maximum.s1.r12$y.rebased18.us.us.us.us.us.us"
  %502 = mul nsw i32 %501, %8
  %503 = add i32 %t263.us.us.us.us.us, %502
  br i1 %433, label %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us"

"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us": ; preds = %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us", %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.158338.us.us.us.us.us.us = phi <32 x i32> [ %594, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ], [ %.lcssa339342.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ]
  %maximum81.sroa.16.12.us.us.us.us.us.us = phi <32 x i32> [ %598, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ], [ %maximum81.sroa.16.11.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us" = phi i32 [ %599, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ], [ 0, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ]
  %niter550 = phi i32 [ %niter550.nsub.7, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ], [ %unroll_iter549, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ]
  %504 = add nsw i32 %t286.us.us.us, %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us"
  %505 = mul nsw i32 %504, %5
  %t289.us.us.us.us.us.us = add i32 %503, %505
  %506 = sub i32 %t289.us.us.us.us.us.us, %reass.add230
  %507 = getelementptr inbounds i8, i8* %0, i32 %506
  %508 = bitcast i8* %507 to <32 x i32>*
  %509 = load <32 x i32>, <32 x i32>* %508, align 1, !tbaa !101
  %510 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0.158338.us.us.us.us.us.us, <32 x i32> %509)
  %511 = getelementptr inbounds i8, i8* %507, i32 128
  %512 = bitcast i8* %511 to <32 x i32>*
  %513 = load <32 x i32>, <32 x i32>* %512, align 1, !tbaa !101
  %514 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.16.12.us.us.us.us.us.us, <32 x i32> %513)
  %515 = or i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 1
  %516 = add nsw i32 %t286.us.us.us, %515
  %517 = mul nsw i32 %516, %5
  %t289.us.us.us.us.us.us.1 = add i32 %503, %517
  %518 = sub i32 %t289.us.us.us.us.us.us.1, %reass.add230
  %519 = getelementptr inbounds i8, i8* %0, i32 %518
  %520 = bitcast i8* %519 to <32 x i32>*
  %521 = load <32 x i32>, <32 x i32>* %520, align 1, !tbaa !101
  %522 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %510, <32 x i32> %521)
  %523 = getelementptr inbounds i8, i8* %519, i32 128
  %524 = bitcast i8* %523 to <32 x i32>*
  %525 = load <32 x i32>, <32 x i32>* %524, align 1, !tbaa !101
  %526 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %514, <32 x i32> %525)
  %527 = or i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 2
  %528 = add nsw i32 %t286.us.us.us, %527
  %529 = mul nsw i32 %528, %5
  %t289.us.us.us.us.us.us.2 = add i32 %503, %529
  %530 = sub i32 %t289.us.us.us.us.us.us.2, %reass.add230
  %531 = getelementptr inbounds i8, i8* %0, i32 %530
  %532 = bitcast i8* %531 to <32 x i32>*
  %533 = load <32 x i32>, <32 x i32>* %532, align 1, !tbaa !101
  %534 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %522, <32 x i32> %533)
  %535 = getelementptr inbounds i8, i8* %531, i32 128
  %536 = bitcast i8* %535 to <32 x i32>*
  %537 = load <32 x i32>, <32 x i32>* %536, align 1, !tbaa !101
  %538 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %526, <32 x i32> %537)
  %539 = or i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 3
  %540 = add nsw i32 %t286.us.us.us, %539
  %541 = mul nsw i32 %540, %5
  %t289.us.us.us.us.us.us.3 = add i32 %503, %541
  %542 = sub i32 %t289.us.us.us.us.us.us.3, %reass.add230
  %543 = getelementptr inbounds i8, i8* %0, i32 %542
  %544 = bitcast i8* %543 to <32 x i32>*
  %545 = load <32 x i32>, <32 x i32>* %544, align 1, !tbaa !101
  %546 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %534, <32 x i32> %545)
  %547 = getelementptr inbounds i8, i8* %543, i32 128
  %548 = bitcast i8* %547 to <32 x i32>*
  %549 = load <32 x i32>, <32 x i32>* %548, align 1, !tbaa !101
  %550 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %538, <32 x i32> %549)
  %551 = or i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 4
  %552 = add nsw i32 %t286.us.us.us, %551
  %553 = mul nsw i32 %552, %5
  %t289.us.us.us.us.us.us.4 = add i32 %503, %553
  %554 = sub i32 %t289.us.us.us.us.us.us.4, %reass.add230
  %555 = getelementptr inbounds i8, i8* %0, i32 %554
  %556 = bitcast i8* %555 to <32 x i32>*
  %557 = load <32 x i32>, <32 x i32>* %556, align 1, !tbaa !101
  %558 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %546, <32 x i32> %557)
  %559 = getelementptr inbounds i8, i8* %555, i32 128
  %560 = bitcast i8* %559 to <32 x i32>*
  %561 = load <32 x i32>, <32 x i32>* %560, align 1, !tbaa !101
  %562 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %550, <32 x i32> %561)
  %563 = or i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 5
  %564 = add nsw i32 %t286.us.us.us, %563
  %565 = mul nsw i32 %564, %5
  %t289.us.us.us.us.us.us.5 = add i32 %503, %565
  %566 = sub i32 %t289.us.us.us.us.us.us.5, %reass.add230
  %567 = getelementptr inbounds i8, i8* %0, i32 %566
  %568 = bitcast i8* %567 to <32 x i32>*
  %569 = load <32 x i32>, <32 x i32>* %568, align 1, !tbaa !101
  %570 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %558, <32 x i32> %569)
  %571 = getelementptr inbounds i8, i8* %567, i32 128
  %572 = bitcast i8* %571 to <32 x i32>*
  %573 = load <32 x i32>, <32 x i32>* %572, align 1, !tbaa !101
  %574 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %562, <32 x i32> %573)
  %575 = or i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 6
  %576 = add nsw i32 %t286.us.us.us, %575
  %577 = mul nsw i32 %576, %5
  %t289.us.us.us.us.us.us.6 = add i32 %503, %577
  %578 = sub i32 %t289.us.us.us.us.us.us.6, %reass.add230
  %579 = getelementptr inbounds i8, i8* %0, i32 %578
  %580 = bitcast i8* %579 to <32 x i32>*
  %581 = load <32 x i32>, <32 x i32>* %580, align 1, !tbaa !101
  %582 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %570, <32 x i32> %581)
  %583 = getelementptr inbounds i8, i8* %579, i32 128
  %584 = bitcast i8* %583 to <32 x i32>*
  %585 = load <32 x i32>, <32 x i32>* %584, align 1, !tbaa !101
  %586 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %574, <32 x i32> %585)
  %587 = or i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 7
  %588 = add nsw i32 %t286.us.us.us, %587
  %589 = mul nsw i32 %588, %5
  %t289.us.us.us.us.us.us.7 = add i32 %503, %589
  %590 = sub i32 %t289.us.us.us.us.us.us.7, %reass.add230
  %591 = getelementptr inbounds i8, i8* %0, i32 %590
  %592 = bitcast i8* %591 to <32 x i32>*
  %593 = load <32 x i32>, <32 x i32>* %592, align 1, !tbaa !101
  %594 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %582, <32 x i32> %593)
  %595 = getelementptr inbounds i8, i8* %591, i32 128
  %596 = bitcast i8* %595 to <32 x i32>*
  %597 = load <32 x i32>, <32 x i32>* %596, align 1, !tbaa !101
  %598 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %586, <32 x i32> %597)
  %599 = add nuw nsw i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us", 8
  %niter550.nsub.7 = add i32 %niter550, -8
  %niter550.ncmp.7 = icmp eq i32 %niter550.nsub.7, 0
  br i1 %niter550.ncmp.7, label %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us"

"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa": ; preds = %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us", %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us"
  %.lcssa491.ph = phi <32 x i32> [ undef, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ], [ %594, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ]
  %.lcssa490.ph = phi <32 x i32> [ undef, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ], [ %598, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ]
  %maximum81.sroa.0.0.maximum81.sroa.0.0.158338.us.us.us.us.us.us.unr = phi <32 x i32> [ %.lcssa339342.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ], [ %594, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ]
  %maximum81.sroa.16.12.us.us.us.us.us.us.unr = phi <32 x i32> [ %maximum81.sroa.16.11.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ], [ %598, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us.unr" = phi i32 [ 0, %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us" ], [ %599, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us" ]
  br i1 %lcmp.mod546.not, label %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us", label %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil"

"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil": ; preds = %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa", %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.158338.us.us.us.us.us.us.epil = phi <32 x i32> [ %606, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil" ], [ %maximum81.sroa.0.0.maximum81.sroa.0.0.158338.us.us.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa" ]
  %maximum81.sroa.16.12.us.us.us.us.us.us.epil = phi <32 x i32> [ %610, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil" ], [ %maximum81.sroa.16.12.us.us.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa" ]
  %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us.epil" = phi i32 [ %611, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil" ], [ %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us.unr", %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa" ]
  %epil.iter545 = phi i32 [ %epil.iter545.sub, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil" ], [ %xtraiter544, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa" ]
  %600 = add nsw i32 %t286.us.us.us, %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us.epil"
  %601 = mul nsw i32 %600, %5
  %t289.us.us.us.us.us.us.epil = add i32 %503, %601
  %602 = sub i32 %t289.us.us.us.us.us.us.epil, %reass.add230
  %603 = getelementptr inbounds i8, i8* %0, i32 %602
  %604 = bitcast i8* %603 to <32 x i32>*
  %605 = load <32 x i32>, <32 x i32>* %604, align 1, !tbaa !101
  %606 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0.158338.us.us.us.us.us.us.epil, <32 x i32> %605)
  %607 = getelementptr inbounds i8, i8* %603, i32 128
  %608 = bitcast i8* %607 to <32 x i32>*
  %609 = load <32 x i32>, <32 x i32>* %608, align 1, !tbaa !101
  %610 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.16.12.us.us.us.us.us.us.epil, <32 x i32> %609)
  %611 = add nuw nsw i32 %"maximum.s1.r12$x.rebased21.us.us.us.us.us.us.epil", 1
  %epil.iter545.sub = add i32 %epil.iter545, -1
  %epil.iter545.cmp.not = icmp eq i32 %epil.iter545.sub, 0
  br i1 %epil.iter545.cmp.not, label %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us", label %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil", !llvm.loop !106

"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us": ; preds = %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil", %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa"
  %.lcssa491 = phi <32 x i32> [ %.lcssa491.ph, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa" ], [ %606, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil" ]
  %.lcssa490 = phi <32 x i32> [ %.lcssa490.ph, %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us.unr-lcssa" ], [ %610, %"for maximum.s1.r12$x.rebased19.us.us.us.us.us.us.epil" ]
  %612 = add nuw nsw i32 %"maximum.s1.r12$y.rebased18.us.us.us.us.us.us", 1
  %.not97.us.us.us.us.us.us = icmp eq i32 %612, %t282.us.us
  br i1 %.not97.us.us.us.us.us.us, label %"consume maximum22.loopexit.split.us.us.us.us.us.us", label %"for maximum.s1.r12$y.rebased16.us.us.us.us.us.us"

"consume maximum22.loopexit.split.us.us.us.us.us.us": ; preds = %"end for maximum.s1.r12$x.rebased20.loopexit.us.us.us.us.us.us"
  %613 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %.lcssa491, <32 x i32> %314)
  %614 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %.lcssa490, <32 x i32> %314)
  %t278.us.us.us.us.us = add i32 %432, %output.s0.c.v3.base.s.us.us.us.us.us
  %615 = sub i32 %t278.us.us.us.us.us, %reass.add233
  %616 = getelementptr inbounds i8, i8* %12, i32 %615
  %617 = bitcast i8* %616 to <32 x i32>*
  store <32 x i32> %613, <32 x i32>* %617, align 1, !tbaa !97
  %618 = getelementptr inbounds i8, i8* %616, i32 128
  %619 = bitcast i8* %618 to <32 x i32>*
  store <32 x i32> %614, <32 x i32>* %619, align 1, !tbaa !97
  %620 = add nuw nsw i32 %output.s0.c.c14.us.us.us.us.us, 1
  %.not95.us.us.us.us.us = icmp eq i32 %620, %308
  br i1 %.not95.us.us.us.us.us, label %"end for output.s0.c.c13.split.us.us.us.us", label %"for output.s0.c.c12.us.us.us.us.us"

next_bb2:                                         ; preds = %next_bb
  %621 = icmp sgt i32 %2, 127
  %622 = icmp sgt i32 %10, 0
  br i1 %621, label %then_bb23, label %next_bb24

then_bb23:                                        ; preds = %next_bb2
  br i1 %622, label %"for output.s0.b.rebased25.preheader", label %call_destructor.exit, !prof !95

"for output.s0.b.rebased25.preheader":            ; preds = %then_bb23
  %.neg210 = mul i32 %5, %3
  %.neg209 = mul i32 %8, %6
  %.neg208 = mul i32 %11, %9
  %.neg207 = mul i32 %16, %14
  %.neg206 = mul i32 %19, %17
  %.neg205 = mul i32 %20, %9
  %623 = icmp sgt i32 %18, 0
  %624 = add nsw i32 %7, %6
  %625 = add nsw i32 %4, %3
  %626 = add nuw nsw i32 %2, 127
  %627 = ashr i32 %626, 7
  %b34 = add nsw i32 %2, -128
  %628 = insertelement <128 x i8> undef, i8 %output_min, i32 0
  %629 = shufflevector <128 x i8> %628, <128 x i8> undef, <128 x i32> zeroinitializer
  %reass.add214 = add i32 %.neg209, %.neg210
  %reass.add215 = add i32 %reass.add214, %.neg208
  %630 = insertelement <128 x i8> undef, i8 %b54, i32 0
  %631 = shufflevector <128 x i8> %630, <128 x i8> undef, <128 x i32> zeroinitializer
  %632 = bitcast <128 x i8> %631 to <32 x i32>
  %reass.add217 = add i32 %.neg206, %.neg207
  %reass.add218 = add i32 %reass.add217, %.neg205
  %633 = icmp sgt i32 %15, 0
  %or.cond = and i1 %623, %633
  br i1 %or.cond, label %"for output.s0.b.rebased25.us.us.preheader", label %call_destructor.exit, !prof !107

"for output.s0.b.rebased25.us.us.preheader":      ; preds = %"for output.s0.b.rebased25.preheader"
  %maximum81.sroa.0.0.maximum81.sroa.0.0..us.us.us.cast = bitcast <128 x i8> %629 to <32 x i32>
  %maximum81.sroa.0.0.maximum81.sroa.0.0..us.us323.us.us.us.cast = bitcast <128 x i8> %629 to <32 x i32>
  %maximum81.sroa.0.0..sroa_cast179.promoted309.us.us.us.us.us.us.cast = bitcast <128 x i8> %629 to <32 x i32>
  %634 = add nsw i32 %627, -1
  %635 = add nsw i32 %627, -1
  %636 = add i32 %4, %3
  %637 = mul i32 %14, %stride_x
  %638 = sub i32 %636, %637
  %639 = sub i32 %3, %637
  %xtraiter508 = and i32 %627, 7
  %640 = icmp ult i32 %634, 7
  %unroll_iter511 = and i32 %627, -8
  %lcmp.mod510.not = icmp eq i32 %xtraiter508, 0
  %xtraiter513 = and i32 %627, 7
  %641 = icmp ult i32 %635, 7
  %unroll_iter516 = and i32 %627, -8
  %lcmp.mod515.not = icmp eq i32 %xtraiter513, 0
  br label %"for output.s0.b.rebased25.us.us"

"for output.s0.b.rebased25.us.us":                ; preds = %"for output.s0.b.rebased25.us.us.preheader", %"end for output.s0.y.rebased29.loopexit.split.us.us.us"
  %output.s0.b.rebased27.us.us = phi i32 [ %860, %"end for output.s0.y.rebased29.loopexit.split.us.us.us" ], [ 0, %"for output.s0.b.rebased25.us.us.preheader" ]
  %642 = add nsw i32 %output.s0.b.rebased27.us.us, %9
  %643 = mul nsw i32 %642, %20
  %644 = mul nsw i32 %642, %11
  br label %"for output.s0.y.rebased28.us.us.us"

"for output.s0.y.rebased28.us.us.us":             ; preds = %"end for output.s0.x.rebased32.loopexit.us.us.us", %"for output.s0.b.rebased25.us.us"
  %output.s0.y.rebased30.us.us.us = phi i32 [ %706, %"end for output.s0.x.rebased32.loopexit.us.us.us" ], [ 0, %"for output.s0.b.rebased25.us.us" ]
  %645 = add nsw i32 %output.s0.y.rebased30.us.us.us, %17
  %646 = mul nsw i32 %645, %stride_y
  %a26.us.us.us = sub i32 %624, %646
  %647 = icmp slt i32 %a26.us.us.us, %b42
  %b30.us.us.us = select i1 %647, i32 %a26.us.us.us, i32 %b42
  %a27.us.us.us = sub nsw i32 %6, %646
  %648 = icmp slt i32 %a27.us.us.us, %b42
  %a35.us.us.us = select i1 %648, i32 %a27.us.us.us, i32 %b42
  %649 = icmp sgt i32 %a35.us.us.us, %b30.us.us.us
  %a34.us.us.us = select i1 %649, i32 %a35.us.us.us, i32 %b30.us.us.us
  %650 = icmp sgt i32 %a35.us.us.us, 0
  %651 = select i1 %650, i32 %a35.us.us.us, i32 0
  %t308.us.us.us = add nsw i32 %651, %646
  %652 = mul nsw i32 %645, %19
  %653 = icmp sgt i32 %a34.us.us.us, 0
  %654 = select i1 %653, i32 %a34.us.us.us, i32 0
  %t314.us.us.us = sub nsw i32 %654, %651
  %655 = icmp sgt i32 %t314.us.us.us, 0
  %t296.us.us.us = add i32 %652, %643
  br i1 %655, label %"for output.s0.x.rebased31.us.us.us.us", label %"for output.s0.x.rebased31.us328.us.us.preheader", !prof !95

"for output.s0.x.rebased31.us328.us.us.preheader": ; preds = %"for output.s0.y.rebased28.us.us.us"
  %656 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0..us.us.us.cast, <32 x i32> %632)
  br label %"for output.s0.x.rebased31.us328.us.us"

"for output.s0.x.rebased31.us328.us.us":          ; preds = %"for output.s0.x.rebased31.us328.us.us.preheader", %"end for output.s0.c.c35.split.us.us.us"
  %output.s0.x.rebased33.us329.us.us = phi i32 [ %705, %"end for output.s0.c.c35.split.us.us.us" ], [ 0, %"for output.s0.x.rebased31.us328.us.us.preheader" ]
  %657 = add nsw i32 %output.s0.x.rebased33.us329.us.us, %14
  %658 = mul nsw i32 %657, %16
  %659 = add i32 %t296.us.us.us, %658
  br i1 %640, label %"end for output.s0.c.c35.split.us.us.us.unr-lcssa", label %"for output.s0.c.c34.us.us.us"

"for output.s0.c.c34.us.us.us":                   ; preds = %"for output.s0.x.rebased31.us328.us.us", %"for output.s0.c.c34.us.us.us"
  %output.s0.c.c36.us.us.us = phi i32 [ %699, %"for output.s0.c.c34.us.us.us" ], [ 0, %"for output.s0.x.rebased31.us328.us.us" ]
  %niter512 = phi i32 [ %niter512.nsub.7, %"for output.s0.c.c34.us.us.us" ], [ %unroll_iter511, %"for output.s0.x.rebased31.us328.us.us" ]
  %a32.us.us.us = shl nsw i32 %output.s0.c.c36.us.us.us, 7
  %660 = icmp slt i32 %a32.us.us.us, %b34
  %output.s0.c.v4.base.s.us.us.us = select i1 %660, i32 %a32.us.us.us, i32 %b34
  %t310.us.us.us = add i32 %659, %output.s0.c.v4.base.s.us.us.us
  %661 = sub i32 %t310.us.us.us, %reass.add218
  %662 = getelementptr inbounds i8, i8* %12, i32 %661
  %663 = bitcast i8* %662 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %663, align 1, !tbaa !97
  %664 = shl i32 %output.s0.c.c36.us.us.us, 7
  %a32.us.us.us.1 = or i32 %664, 128
  %665 = icmp slt i32 %a32.us.us.us.1, %b34
  %output.s0.c.v4.base.s.us.us.us.1 = select i1 %665, i32 %a32.us.us.us.1, i32 %b34
  %t310.us.us.us.1 = add i32 %659, %output.s0.c.v4.base.s.us.us.us.1
  %666 = sub i32 %t310.us.us.us.1, %reass.add218
  %667 = getelementptr inbounds i8, i8* %12, i32 %666
  %668 = bitcast i8* %667 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %668, align 1, !tbaa !97
  %669 = shl i32 %output.s0.c.c36.us.us.us, 7
  %a32.us.us.us.2 = or i32 %669, 256
  %670 = icmp slt i32 %a32.us.us.us.2, %b34
  %output.s0.c.v4.base.s.us.us.us.2 = select i1 %670, i32 %a32.us.us.us.2, i32 %b34
  %t310.us.us.us.2 = add i32 %659, %output.s0.c.v4.base.s.us.us.us.2
  %671 = sub i32 %t310.us.us.us.2, %reass.add218
  %672 = getelementptr inbounds i8, i8* %12, i32 %671
  %673 = bitcast i8* %672 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %673, align 1, !tbaa !97
  %674 = shl i32 %output.s0.c.c36.us.us.us, 7
  %a32.us.us.us.3 = or i32 %674, 384
  %675 = icmp slt i32 %a32.us.us.us.3, %b34
  %output.s0.c.v4.base.s.us.us.us.3 = select i1 %675, i32 %a32.us.us.us.3, i32 %b34
  %t310.us.us.us.3 = add i32 %659, %output.s0.c.v4.base.s.us.us.us.3
  %676 = sub i32 %t310.us.us.us.3, %reass.add218
  %677 = getelementptr inbounds i8, i8* %12, i32 %676
  %678 = bitcast i8* %677 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %678, align 1, !tbaa !97
  %679 = shl i32 %output.s0.c.c36.us.us.us, 7
  %a32.us.us.us.4 = or i32 %679, 512
  %680 = icmp slt i32 %a32.us.us.us.4, %b34
  %output.s0.c.v4.base.s.us.us.us.4 = select i1 %680, i32 %a32.us.us.us.4, i32 %b34
  %t310.us.us.us.4 = add i32 %659, %output.s0.c.v4.base.s.us.us.us.4
  %681 = sub i32 %t310.us.us.us.4, %reass.add218
  %682 = getelementptr inbounds i8, i8* %12, i32 %681
  %683 = bitcast i8* %682 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %683, align 1, !tbaa !97
  %684 = shl i32 %output.s0.c.c36.us.us.us, 7
  %a32.us.us.us.5 = or i32 %684, 640
  %685 = icmp slt i32 %a32.us.us.us.5, %b34
  %output.s0.c.v4.base.s.us.us.us.5 = select i1 %685, i32 %a32.us.us.us.5, i32 %b34
  %t310.us.us.us.5 = add i32 %659, %output.s0.c.v4.base.s.us.us.us.5
  %686 = sub i32 %t310.us.us.us.5, %reass.add218
  %687 = getelementptr inbounds i8, i8* %12, i32 %686
  %688 = bitcast i8* %687 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %688, align 1, !tbaa !97
  %689 = shl i32 %output.s0.c.c36.us.us.us, 7
  %a32.us.us.us.6 = or i32 %689, 768
  %690 = icmp slt i32 %a32.us.us.us.6, %b34
  %output.s0.c.v4.base.s.us.us.us.6 = select i1 %690, i32 %a32.us.us.us.6, i32 %b34
  %t310.us.us.us.6 = add i32 %659, %output.s0.c.v4.base.s.us.us.us.6
  %691 = sub i32 %t310.us.us.us.6, %reass.add218
  %692 = getelementptr inbounds i8, i8* %12, i32 %691
  %693 = bitcast i8* %692 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %693, align 1, !tbaa !97
  %694 = shl i32 %output.s0.c.c36.us.us.us, 7
  %a32.us.us.us.7 = or i32 %694, 896
  %695 = icmp slt i32 %a32.us.us.us.7, %b34
  %output.s0.c.v4.base.s.us.us.us.7 = select i1 %695, i32 %a32.us.us.us.7, i32 %b34
  %t310.us.us.us.7 = add i32 %659, %output.s0.c.v4.base.s.us.us.us.7
  %696 = sub i32 %t310.us.us.us.7, %reass.add218
  %697 = getelementptr inbounds i8, i8* %12, i32 %696
  %698 = bitcast i8* %697 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %698, align 1, !tbaa !97
  %699 = add nuw nsw i32 %output.s0.c.c36.us.us.us, 8
  %niter512.nsub.7 = add i32 %niter512, -8
  %niter512.ncmp.7 = icmp eq i32 %niter512.nsub.7, 0
  br i1 %niter512.ncmp.7, label %"end for output.s0.c.c35.split.us.us.us.unr-lcssa", label %"for output.s0.c.c34.us.us.us"

"end for output.s0.c.c35.split.us.us.us.unr-lcssa": ; preds = %"for output.s0.c.c34.us.us.us", %"for output.s0.x.rebased31.us328.us.us"
  %output.s0.c.c36.us.us.us.unr = phi i32 [ 0, %"for output.s0.x.rebased31.us328.us.us" ], [ %699, %"for output.s0.c.c34.us.us.us" ]
  br i1 %lcmp.mod510.not, label %"end for output.s0.c.c35.split.us.us.us", label %"for output.s0.c.c34.us.us.us.epil"

"for output.s0.c.c34.us.us.us.epil":              ; preds = %"end for output.s0.c.c35.split.us.us.us.unr-lcssa", %"for output.s0.c.c34.us.us.us.epil"
  %output.s0.c.c36.us.us.us.epil = phi i32 [ %704, %"for output.s0.c.c34.us.us.us.epil" ], [ %output.s0.c.c36.us.us.us.unr, %"end for output.s0.c.c35.split.us.us.us.unr-lcssa" ]
  %epil.iter509 = phi i32 [ %epil.iter509.sub, %"for output.s0.c.c34.us.us.us.epil" ], [ %xtraiter508, %"end for output.s0.c.c35.split.us.us.us.unr-lcssa" ]
  %a32.us.us.us.epil = shl nsw i32 %output.s0.c.c36.us.us.us.epil, 7
  %700 = icmp slt i32 %a32.us.us.us.epil, %b34
  %output.s0.c.v4.base.s.us.us.us.epil = select i1 %700, i32 %a32.us.us.us.epil, i32 %b34
  %t310.us.us.us.epil = add i32 %659, %output.s0.c.v4.base.s.us.us.us.epil
  %701 = sub i32 %t310.us.us.us.epil, %reass.add218
  %702 = getelementptr inbounds i8, i8* %12, i32 %701
  %703 = bitcast i8* %702 to <32 x i32>*
  store <32 x i32> %656, <32 x i32>* %703, align 1, !tbaa !97
  %704 = add nuw nsw i32 %output.s0.c.c36.us.us.us.epil, 1
  %epil.iter509.sub = add i32 %epil.iter509, -1
  %epil.iter509.cmp.not = icmp eq i32 %epil.iter509.sub, 0
  br i1 %epil.iter509.cmp.not, label %"end for output.s0.c.c35.split.us.us.us", label %"for output.s0.c.c34.us.us.us.epil", !llvm.loop !108

"end for output.s0.c.c35.split.us.us.us":         ; preds = %"for output.s0.c.c34.us.us.us.epil", %"end for output.s0.c.c35.split.us.us.us.unr-lcssa"
  %705 = add nuw nsw i32 %output.s0.x.rebased33.us329.us.us, 1
  %.not90.us330.us.us = icmp eq i32 %705, %15
  br i1 %.not90.us330.us.us, label %"end for output.s0.x.rebased32.loopexit.us.us.us", label %"for output.s0.x.rebased31.us328.us.us"

"end for output.s0.x.rebased32.loopexit.us.us.us": ; preds = %"end for output.s0.c.c35.split.us.us.us", %"end for output.s0.c.c35.split.us.us.us.us.us"
  %706 = add nuw nsw i32 %output.s0.y.rebased30.us.us.us, 1
  %.not88.us.us.us = icmp eq i32 %706, %18
  br i1 %.not88.us.us.us, label %"end for output.s0.y.rebased29.loopexit.split.us.us.us", label %"for output.s0.y.rebased28.us.us.us"

"for output.s0.x.rebased31.us.us.us.us":          ; preds = %"for output.s0.y.rebased28.us.us.us", %"end for output.s0.c.c35.split.us.us.us.us.us"
  %output.s0.x.rebased33.us.us.us.us = phi i32 [ %777, %"end for output.s0.c.c35.split.us.us.us.us.us" ], [ 0, %"for output.s0.y.rebased28.us.us.us" ]
  %707 = mul i32 %output.s0.x.rebased33.us.us.us.us, %stride_x
  %708 = sub i32 %638, %707
  %709 = icmp sgt i32 %708, %b45
  %smin518 = select i1 %709, i32 %b45, i32 %708
  %710 = sub i32 %639, %707
  %711 = icmp sgt i32 %710, %b45
  %smin519 = select i1 %711, i32 %b45, i32 %710
  %712 = icmp sgt i32 %smin518, %smin519
  %smax520 = select i1 %712, i32 %smin518, i32 %smin519
  %713 = icmp sgt i32 %smax520, 0
  %smax521 = select i1 %713, i32 %smax520, i32 0
  %714 = icmp sgt i32 %smin519, 0
  %smax522 = select i1 %714, i32 %smin519, i32 0
  %715 = sub nsw i32 %smax521, %smax522
  %716 = xor i32 %smax522, -1
  %717 = add nsw i32 %smax521, %716
  %718 = add nsw i32 %output.s0.x.rebased33.us.us.us.us, %14
  %719 = mul nsw i32 %718, %stride_x
  %a29.us.us.us.us = sub i32 %625, %719
  %720 = icmp slt i32 %a29.us.us.us.us, %b45
  %b35.us.us.us.us = select i1 %720, i32 %a29.us.us.us.us, i32 %b45
  %a30.us.us.us.us = sub nsw i32 %3, %719
  %721 = icmp slt i32 %a30.us.us.us.us, %b45
  %a38.us.us.us.us = select i1 %721, i32 %a30.us.us.us.us, i32 %b45
  %722 = mul nsw i32 %718, %16
  %723 = icmp sgt i32 %a38.us.us.us.us, %b35.us.us.us.us
  %a37.us.us.us.us = select i1 %723, i32 %a38.us.us.us.us, i32 %b35.us.us.us.us
  %724 = icmp sgt i32 %a38.us.us.us.us, 0
  %725 = select i1 %724, i32 %a38.us.us.us.us, i32 0
  %t318.us.us.us.us = add nsw i32 %725, %719
  %726 = icmp sgt i32 %a37.us.us.us.us, 0
  %727 = select i1 %726, i32 %a37.us.us.us.us, i32 0
  %728 = icmp sgt i32 %727, %725
  %729 = add i32 %t296.us.us.us, %722
  br i1 %728, label %"for output.s0.c.c34.us.us.us.us.us.us.preheader", label %"for output.s0.c.c34.us.us318.us.us.us.preheader", !prof !95

"for output.s0.c.c34.us.us.us.us.us.us.preheader": ; preds = %"for output.s0.x.rebased31.us.us.us.us"
  %xtraiter523 = and i32 %715, 7
  %730 = icmp ult i32 %717, 7
  %unroll_iter527 = and i32 %715, -8
  %lcmp.mod525.not = icmp eq i32 %xtraiter523, 0
  br label %"for output.s0.c.c34.us.us.us.us.us.us"

"for output.s0.c.c34.us.us318.us.us.us.preheader": ; preds = %"for output.s0.x.rebased31.us.us.us.us"
  %731 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0..us.us323.us.us.us.cast, <32 x i32> %632)
  br i1 %641, label %"end for output.s0.c.c35.split.us.us.us.us.us.loopexit492.unr-lcssa", label %"for output.s0.c.c34.us.us318.us.us.us"

"for output.s0.c.c34.us.us318.us.us.us":          ; preds = %"for output.s0.c.c34.us.us318.us.us.us.preheader", %"for output.s0.c.c34.us.us318.us.us.us"
  %output.s0.c.c36.us.us319.us.us.us = phi i32 [ %771, %"for output.s0.c.c34.us.us318.us.us.us" ], [ 0, %"for output.s0.c.c34.us.us318.us.us.us.preheader" ]
  %niter517 = phi i32 [ %niter517.nsub.7, %"for output.s0.c.c34.us.us318.us.us.us" ], [ %unroll_iter516, %"for output.s0.c.c34.us.us318.us.us.us.preheader" ]
  %a32.us.us320.us.us.us = shl nsw i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %732 = icmp slt i32 %a32.us.us320.us.us.us, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us = select i1 %732, i32 %a32.us.us320.us.us.us, i32 %b34
  %t310.us.us324.us.us.us = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us
  %733 = sub i32 %t310.us.us324.us.us.us, %reass.add218
  %734 = getelementptr inbounds i8, i8* %12, i32 %733
  %735 = bitcast i8* %734 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %735, align 1, !tbaa !97
  %736 = shl i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %a32.us.us320.us.us.us.1 = or i32 %736, 128
  %737 = icmp slt i32 %a32.us.us320.us.us.us.1, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.1 = select i1 %737, i32 %a32.us.us320.us.us.us.1, i32 %b34
  %t310.us.us324.us.us.us.1 = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.1
  %738 = sub i32 %t310.us.us324.us.us.us.1, %reass.add218
  %739 = getelementptr inbounds i8, i8* %12, i32 %738
  %740 = bitcast i8* %739 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %740, align 1, !tbaa !97
  %741 = shl i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %a32.us.us320.us.us.us.2 = or i32 %741, 256
  %742 = icmp slt i32 %a32.us.us320.us.us.us.2, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.2 = select i1 %742, i32 %a32.us.us320.us.us.us.2, i32 %b34
  %t310.us.us324.us.us.us.2 = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.2
  %743 = sub i32 %t310.us.us324.us.us.us.2, %reass.add218
  %744 = getelementptr inbounds i8, i8* %12, i32 %743
  %745 = bitcast i8* %744 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %745, align 1, !tbaa !97
  %746 = shl i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %a32.us.us320.us.us.us.3 = or i32 %746, 384
  %747 = icmp slt i32 %a32.us.us320.us.us.us.3, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.3 = select i1 %747, i32 %a32.us.us320.us.us.us.3, i32 %b34
  %t310.us.us324.us.us.us.3 = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.3
  %748 = sub i32 %t310.us.us324.us.us.us.3, %reass.add218
  %749 = getelementptr inbounds i8, i8* %12, i32 %748
  %750 = bitcast i8* %749 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %750, align 1, !tbaa !97
  %751 = shl i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %a32.us.us320.us.us.us.4 = or i32 %751, 512
  %752 = icmp slt i32 %a32.us.us320.us.us.us.4, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.4 = select i1 %752, i32 %a32.us.us320.us.us.us.4, i32 %b34
  %t310.us.us324.us.us.us.4 = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.4
  %753 = sub i32 %t310.us.us324.us.us.us.4, %reass.add218
  %754 = getelementptr inbounds i8, i8* %12, i32 %753
  %755 = bitcast i8* %754 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %755, align 1, !tbaa !97
  %756 = shl i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %a32.us.us320.us.us.us.5 = or i32 %756, 640
  %757 = icmp slt i32 %a32.us.us320.us.us.us.5, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.5 = select i1 %757, i32 %a32.us.us320.us.us.us.5, i32 %b34
  %t310.us.us324.us.us.us.5 = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.5
  %758 = sub i32 %t310.us.us324.us.us.us.5, %reass.add218
  %759 = getelementptr inbounds i8, i8* %12, i32 %758
  %760 = bitcast i8* %759 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %760, align 1, !tbaa !97
  %761 = shl i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %a32.us.us320.us.us.us.6 = or i32 %761, 768
  %762 = icmp slt i32 %a32.us.us320.us.us.us.6, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.6 = select i1 %762, i32 %a32.us.us320.us.us.us.6, i32 %b34
  %t310.us.us324.us.us.us.6 = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.6
  %763 = sub i32 %t310.us.us324.us.us.us.6, %reass.add218
  %764 = getelementptr inbounds i8, i8* %12, i32 %763
  %765 = bitcast i8* %764 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %765, align 1, !tbaa !97
  %766 = shl i32 %output.s0.c.c36.us.us319.us.us.us, 7
  %a32.us.us320.us.us.us.7 = or i32 %766, 896
  %767 = icmp slt i32 %a32.us.us320.us.us.us.7, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.7 = select i1 %767, i32 %a32.us.us320.us.us.us.7, i32 %b34
  %t310.us.us324.us.us.us.7 = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.7
  %768 = sub i32 %t310.us.us324.us.us.us.7, %reass.add218
  %769 = getelementptr inbounds i8, i8* %12, i32 %768
  %770 = bitcast i8* %769 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %770, align 1, !tbaa !97
  %771 = add nuw nsw i32 %output.s0.c.c36.us.us319.us.us.us, 8
  %niter517.nsub.7 = add i32 %niter517, -8
  %niter517.ncmp.7 = icmp eq i32 %niter517.nsub.7, 0
  br i1 %niter517.ncmp.7, label %"end for output.s0.c.c35.split.us.us.us.us.us.loopexit492.unr-lcssa", label %"for output.s0.c.c34.us.us318.us.us.us"

"end for output.s0.c.c35.split.us.us.us.us.us.loopexit492.unr-lcssa": ; preds = %"for output.s0.c.c34.us.us318.us.us.us", %"for output.s0.c.c34.us.us318.us.us.us.preheader"
  %output.s0.c.c36.us.us319.us.us.us.unr = phi i32 [ 0, %"for output.s0.c.c34.us.us318.us.us.us.preheader" ], [ %771, %"for output.s0.c.c34.us.us318.us.us.us" ]
  br i1 %lcmp.mod515.not, label %"end for output.s0.c.c35.split.us.us.us.us.us", label %"for output.s0.c.c34.us.us318.us.us.us.epil"

"for output.s0.c.c34.us.us318.us.us.us.epil":     ; preds = %"end for output.s0.c.c35.split.us.us.us.us.us.loopexit492.unr-lcssa", %"for output.s0.c.c34.us.us318.us.us.us.epil"
  %output.s0.c.c36.us.us319.us.us.us.epil = phi i32 [ %776, %"for output.s0.c.c34.us.us318.us.us.us.epil" ], [ %output.s0.c.c36.us.us319.us.us.us.unr, %"end for output.s0.c.c35.split.us.us.us.us.us.loopexit492.unr-lcssa" ]
  %epil.iter514 = phi i32 [ %epil.iter514.sub, %"for output.s0.c.c34.us.us318.us.us.us.epil" ], [ %xtraiter513, %"end for output.s0.c.c35.split.us.us.us.us.us.loopexit492.unr-lcssa" ]
  %a32.us.us320.us.us.us.epil = shl nsw i32 %output.s0.c.c36.us.us319.us.us.us.epil, 7
  %772 = icmp slt i32 %a32.us.us320.us.us.us.epil, %b34
  %output.s0.c.v4.base.s.us.us321.us.us.us.epil = select i1 %772, i32 %a32.us.us320.us.us.us.epil, i32 %b34
  %t310.us.us324.us.us.us.epil = add i32 %729, %output.s0.c.v4.base.s.us.us321.us.us.us.epil
  %773 = sub i32 %t310.us.us324.us.us.us.epil, %reass.add218
  %774 = getelementptr inbounds i8, i8* %12, i32 %773
  %775 = bitcast i8* %774 to <32 x i32>*
  store <32 x i32> %731, <32 x i32>* %775, align 1, !tbaa !97
  %776 = add nuw nsw i32 %output.s0.c.c36.us.us319.us.us.us.epil, 1
  %epil.iter514.sub = add i32 %epil.iter514, -1
  %epil.iter514.cmp.not = icmp eq i32 %epil.iter514.sub, 0
  br i1 %epil.iter514.cmp.not, label %"end for output.s0.c.c35.split.us.us.us.us.us", label %"for output.s0.c.c34.us.us318.us.us.us.epil", !llvm.loop !109

"end for output.s0.c.c35.split.us.us.us.us.us":   ; preds = %"end for output.s0.c.c35.split.us.us.us.us.us.loopexit492.unr-lcssa", %"for output.s0.c.c34.us.us318.us.us.us.epil", %"consume maximum44.loopexit.split.us.us.us.us.us.us.us"
  %777 = add nuw nsw i32 %output.s0.x.rebased33.us.us.us.us, 1
  %.not90.us.us.us.us = icmp eq i32 %777, %15
  br i1 %.not90.us.us.us.us, label %"end for output.s0.x.rebased32.loopexit.us.us.us", label %"for output.s0.x.rebased31.us.us.us.us"

"for output.s0.c.c34.us.us.us.us.us.us":          ; preds = %"for output.s0.c.c34.us.us.us.us.us.us.preheader", %"consume maximum44.loopexit.split.us.us.us.us.us.us.us"
  %output.s0.c.c36.us.us.us.us.us.us = phi i32 [ %859, %"consume maximum44.loopexit.split.us.us.us.us.us.us.us" ], [ 0, %"for output.s0.c.c34.us.us.us.us.us.us.preheader" ]
  %a32.us.us.us.us.us.us = shl nsw i32 %output.s0.c.c36.us.us.us.us.us.us, 7
  %778 = icmp slt i32 %a32.us.us.us.us.us.us, %b34
  %output.s0.c.v4.base.s.us.us.us.us.us.us = select i1 %778, i32 %a32.us.us.us.us.us.us, i32 %b34
  %t295.us.us.us.us.us.us = add i32 %output.s0.c.v4.base.s.us.us.us.us.us.us, %644
  br label %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us"

"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us": ; preds = %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us", %"for output.s0.c.c34.us.us.us.us.us.us"
  %.lcssa308311.us.us.us.us.us.us.us = phi <32 x i32> [ %.lcssa495, %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us" ], [ %maximum81.sroa.0.0..sroa_cast179.promoted309.us.us.us.us.us.us.cast, %"for output.s0.c.c34.us.us.us.us.us.us" ]
  %"maximum.s1.r12$y.rebased40.us.us.us.us.us.us.us" = phi i32 [ %854, %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us" ], [ 0, %"for output.s0.c.c34.us.us.us.us.us.us" ]
  %779 = add nsw i32 %t308.us.us.us, %"maximum.s1.r12$y.rebased40.us.us.us.us.us.us.us"
  %780 = mul nsw i32 %779, %8
  %781 = add i32 %t295.us.us.us.us.us.us, %780
  br i1 %730, label %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us"

"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us": ; preds = %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us", %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.152307.us.us.us.us.us.us.us = phi <32 x i32> [ %844, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us" ], [ %.lcssa308311.us.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us" = phi i32 [ %845, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us" ], [ 0, %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us" ]
  %niter528 = phi i32 [ %niter528.nsub.7, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us" ], [ %unroll_iter527, %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us" ]
  %782 = add nsw i32 %t318.us.us.us.us, %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us"
  %783 = mul nsw i32 %782, %5
  %t321.us.us.us.us.us.us.us = add i32 %781, %783
  %784 = sub i32 %t321.us.us.us.us.us.us.us, %reass.add215
  %785 = getelementptr inbounds i8, i8* %0, i32 %784
  %786 = bitcast i8* %785 to <32 x i32>*
  %787 = load <32 x i32>, <32 x i32>* %786, align 1, !tbaa !101
  %788 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0.152307.us.us.us.us.us.us.us, <32 x i32> %787)
  %789 = or i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 1
  %790 = add nsw i32 %t318.us.us.us.us, %789
  %791 = mul nsw i32 %790, %5
  %t321.us.us.us.us.us.us.us.1 = add i32 %781, %791
  %792 = sub i32 %t321.us.us.us.us.us.us.us.1, %reass.add215
  %793 = getelementptr inbounds i8, i8* %0, i32 %792
  %794 = bitcast i8* %793 to <32 x i32>*
  %795 = load <32 x i32>, <32 x i32>* %794, align 1, !tbaa !101
  %796 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %788, <32 x i32> %795)
  %797 = or i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 2
  %798 = add nsw i32 %t318.us.us.us.us, %797
  %799 = mul nsw i32 %798, %5
  %t321.us.us.us.us.us.us.us.2 = add i32 %781, %799
  %800 = sub i32 %t321.us.us.us.us.us.us.us.2, %reass.add215
  %801 = getelementptr inbounds i8, i8* %0, i32 %800
  %802 = bitcast i8* %801 to <32 x i32>*
  %803 = load <32 x i32>, <32 x i32>* %802, align 1, !tbaa !101
  %804 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %796, <32 x i32> %803)
  %805 = or i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 3
  %806 = add nsw i32 %t318.us.us.us.us, %805
  %807 = mul nsw i32 %806, %5
  %t321.us.us.us.us.us.us.us.3 = add i32 %781, %807
  %808 = sub i32 %t321.us.us.us.us.us.us.us.3, %reass.add215
  %809 = getelementptr inbounds i8, i8* %0, i32 %808
  %810 = bitcast i8* %809 to <32 x i32>*
  %811 = load <32 x i32>, <32 x i32>* %810, align 1, !tbaa !101
  %812 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %804, <32 x i32> %811)
  %813 = or i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 4
  %814 = add nsw i32 %t318.us.us.us.us, %813
  %815 = mul nsw i32 %814, %5
  %t321.us.us.us.us.us.us.us.4 = add i32 %781, %815
  %816 = sub i32 %t321.us.us.us.us.us.us.us.4, %reass.add215
  %817 = getelementptr inbounds i8, i8* %0, i32 %816
  %818 = bitcast i8* %817 to <32 x i32>*
  %819 = load <32 x i32>, <32 x i32>* %818, align 1, !tbaa !101
  %820 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %812, <32 x i32> %819)
  %821 = or i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 5
  %822 = add nsw i32 %t318.us.us.us.us, %821
  %823 = mul nsw i32 %822, %5
  %t321.us.us.us.us.us.us.us.5 = add i32 %781, %823
  %824 = sub i32 %t321.us.us.us.us.us.us.us.5, %reass.add215
  %825 = getelementptr inbounds i8, i8* %0, i32 %824
  %826 = bitcast i8* %825 to <32 x i32>*
  %827 = load <32 x i32>, <32 x i32>* %826, align 1, !tbaa !101
  %828 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %820, <32 x i32> %827)
  %829 = or i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 6
  %830 = add nsw i32 %t318.us.us.us.us, %829
  %831 = mul nsw i32 %830, %5
  %t321.us.us.us.us.us.us.us.6 = add i32 %781, %831
  %832 = sub i32 %t321.us.us.us.us.us.us.us.6, %reass.add215
  %833 = getelementptr inbounds i8, i8* %0, i32 %832
  %834 = bitcast i8* %833 to <32 x i32>*
  %835 = load <32 x i32>, <32 x i32>* %834, align 1, !tbaa !101
  %836 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %828, <32 x i32> %835)
  %837 = or i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 7
  %838 = add nsw i32 %t318.us.us.us.us, %837
  %839 = mul nsw i32 %838, %5
  %t321.us.us.us.us.us.us.us.7 = add i32 %781, %839
  %840 = sub i32 %t321.us.us.us.us.us.us.us.7, %reass.add215
  %841 = getelementptr inbounds i8, i8* %0, i32 %840
  %842 = bitcast i8* %841 to <32 x i32>*
  %843 = load <32 x i32>, <32 x i32>* %842, align 1, !tbaa !101
  %844 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %836, <32 x i32> %843)
  %845 = add nuw nsw i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us", 8
  %niter528.nsub.7 = add i32 %niter528, -8
  %niter528.ncmp.7 = icmp eq i32 %niter528.nsub.7, 0
  br i1 %niter528.ncmp.7, label %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us"

"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa": ; preds = %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us", %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us"
  %.lcssa495.ph = phi <32 x i32> [ undef, %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us" ], [ %844, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us" ]
  %maximum81.sroa.0.0.maximum81.sroa.0.0.152307.us.us.us.us.us.us.us.unr = phi <32 x i32> [ %.lcssa308311.us.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us" ], [ %844, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us.unr" = phi i32 [ 0, %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us" ], [ %845, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us" ]
  br i1 %lcmp.mod525.not, label %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us", label %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil"

"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil": ; preds = %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa", %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.152307.us.us.us.us.us.us.us.epil = phi <32 x i32> [ %852, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil" ], [ %maximum81.sroa.0.0.maximum81.sroa.0.0.152307.us.us.us.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa" ]
  %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us.epil" = phi i32 [ %853, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil" ], [ %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us.unr", %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa" ]
  %epil.iter524 = phi i32 [ %epil.iter524.sub, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil" ], [ %xtraiter523, %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa" ]
  %846 = add nsw i32 %t318.us.us.us.us, %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us.epil"
  %847 = mul nsw i32 %846, %5
  %t321.us.us.us.us.us.us.us.epil = add i32 %781, %847
  %848 = sub i32 %t321.us.us.us.us.us.us.us.epil, %reass.add215
  %849 = getelementptr inbounds i8, i8* %0, i32 %848
  %850 = bitcast i8* %849 to <32 x i32>*
  %851 = load <32 x i32>, <32 x i32>* %850, align 1, !tbaa !101
  %852 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %maximum81.sroa.0.0.maximum81.sroa.0.0.152307.us.us.us.us.us.us.us.epil, <32 x i32> %851)
  %853 = add nuw nsw i32 %"maximum.s1.r12$x.rebased43.us.us.us.us.us.us.us.epil", 1
  %epil.iter524.sub = add i32 %epil.iter524, -1
  %epil.iter524.cmp.not = icmp eq i32 %epil.iter524.sub, 0
  br i1 %epil.iter524.cmp.not, label %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us", label %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil", !llvm.loop !110

"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us": ; preds = %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil", %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa"
  %.lcssa495 = phi <32 x i32> [ %.lcssa495.ph, %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us.unr-lcssa" ], [ %852, %"for maximum.s1.r12$x.rebased41.us.us.us.us.us.us.us.epil" ]
  %854 = add nuw nsw i32 %"maximum.s1.r12$y.rebased40.us.us.us.us.us.us.us", 1
  %.not91.us.us.us.us.us.us.us = icmp eq i32 %854, %t314.us.us.us
  br i1 %.not91.us.us.us.us.us.us.us, label %"consume maximum44.loopexit.split.us.us.us.us.us.us.us", label %"for maximum.s1.r12$y.rebased38.us.us.us.us.us.us.us"

"consume maximum44.loopexit.split.us.us.us.us.us.us.us": ; preds = %"end for maximum.s1.r12$x.rebased42.loopexit.us.us.us.us.us.us.us"
  %855 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %.lcssa495, <32 x i32> %632)
  %t310.us.us.us.us.us.us = add i32 %729, %output.s0.c.v4.base.s.us.us.us.us.us.us
  %856 = sub i32 %t310.us.us.us.us.us.us, %reass.add218
  %857 = getelementptr inbounds i8, i8* %12, i32 %856
  %858 = bitcast i8* %857 to <32 x i32>*
  store <32 x i32> %855, <32 x i32>* %858, align 1, !tbaa !97
  %859 = add nuw nsw i32 %output.s0.c.c36.us.us.us.us.us.us, 1
  %.not89.us.us.us.us.us.us = icmp eq i32 %859, %627
  br i1 %.not89.us.us.us.us.us.us, label %"end for output.s0.c.c35.split.us.us.us.us.us", label %"for output.s0.c.c34.us.us.us.us.us.us"

"end for output.s0.y.rebased29.loopexit.split.us.us.us": ; preds = %"end for output.s0.x.rebased32.loopexit.us.us.us"
  %860 = add nuw nsw i32 %output.s0.b.rebased27.us.us, 1
  %.not87.us.us = icmp eq i32 %860, %10
  br i1 %.not87.us.us, label %call_destructor.exit, label %"for output.s0.b.rebased25.us.us"

next_bb24:                                        ; preds = %next_bb2
  br i1 %622, label %"for output.s0.b.rebased45.preheader", label %call_destructor.exit, !prof !95

"for output.s0.b.rebased45.preheader":            ; preds = %next_bb24
  %.neg197 = mul i32 %5, %3
  %.neg196 = mul i32 %8, %6
  %.neg195 = mul i32 %11, %9
  %.neg194 = mul i32 %16, %14
  %.neg193 = mul i32 %19, %17
  %.neg = mul i32 %20, %9
  %861 = icmp slt i32 %18, 1
  %862 = add nsw i32 %7, %6
  %863 = add nsw i32 %4, %3
  %864 = icmp slt i32 %2, 1
  %reass.add = add i32 %.neg196, %.neg197
  %reass.add201 = add i32 %reass.add, %.neg195
  %reass.add202 = add i32 %.neg193, %.neg194
  %reass.add203 = add i32 %reass.add202, %.neg
  %865 = icmp ult i8 %output_min, %b54
  %866 = select i1 %865, i8 %output_min, i8 %b54
  %867 = icmp slt i32 %15, 1
  %or.cond464.not = or i1 %861, %867
  %brmerge466 = or i1 %or.cond464.not, %864
  br i1 %brmerge466, label %call_destructor.exit, label %"for output.s0.b.rebased45.us.us.us.preheader", !prof !96

"for output.s0.b.rebased45.us.us.us.preheader":   ; preds = %"for output.s0.b.rebased45.preheader"
  %868 = add i32 %15, -1
  %869 = add i32 %4, %3
  %870 = mul i32 %14, %stride_x
  %871 = sub i32 %869, %870
  %872 = sub i32 %3, %870
  %xtraiter = and i32 %15, 7
  %873 = icmp ult i32 %868, 7
  %unroll_iter = and i32 %15, -8
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br label %"for output.s0.b.rebased45.us.us.us"

"for output.s0.b.rebased45.us.us.us":             ; preds = %"for output.s0.b.rebased45.us.us.us.preheader", %"end for output.s0.y.rebased49.loopexit.split.us.us.us.split.us.us"
  %output.s0.b.rebased47.us.us.us = phi i32 [ %915, %"end for output.s0.y.rebased49.loopexit.split.us.us.us.split.us.us" ], [ 0, %"for output.s0.b.rebased45.us.us.us.preheader" ]
  %874 = mul i32 %20, %output.s0.b.rebased47.us.us.us
  %875 = add nsw i32 %output.s0.b.rebased47.us.us.us, %9
  %876 = mul nsw i32 %875, %20
  %877 = mul nsw i32 %875, %11
  br label %"for output.s0.y.rebased48.us.us.us.us.us"

"for output.s0.y.rebased48.us.us.us.us.us":       ; preds = %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us", %"for output.s0.b.rebased45.us.us.us"
  %output.s0.y.rebased50.us.us.us.us.us = phi i32 [ %919, %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us" ], [ 0, %"for output.s0.b.rebased45.us.us.us" ]
  %878 = mul i32 %19, %output.s0.y.rebased50.us.us.us.us.us
  %879 = add i32 %874, %878
  %880 = add nsw i32 %output.s0.y.rebased50.us.us.us.us.us, %17
  %881 = mul nsw i32 %880, %stride_y
  %a39.us.us.us.us.us = sub i32 %862, %881
  %882 = icmp slt i32 %a39.us.us.us.us.us, %b42
  %b43.us.us.us.us.us = select i1 %882, i32 %a39.us.us.us.us.us, i32 %b42
  %a40.us.us.us.us.us = sub nsw i32 %6, %881
  %883 = icmp slt i32 %a40.us.us.us.us.us, %b42
  %a47.us.us.us.us.us = select i1 %883, i32 %a40.us.us.us.us.us, i32 %b42
  %884 = icmp sgt i32 %a47.us.us.us.us.us, %b43.us.us.us.us.us
  %a46.us.us.us.us.us = select i1 %884, i32 %a47.us.us.us.us.us, i32 %b43.us.us.us.us.us
  %885 = icmp sgt i32 %a47.us.us.us.us.us, 0
  %886 = select i1 %885, i32 %a47.us.us.us.us.us, i32 0
  %t339.us.us.us.us.us = add nsw i32 %886, %881
  %887 = mul nsw i32 %880, %19
  %888 = icmp sgt i32 %a46.us.us.us.us.us, 0
  %889 = select i1 %888, i32 %a46.us.us.us.us.us, i32 0
  %t345.us.us.us.us.us = sub nsw i32 %889, %886
  %890 = icmp sgt i32 %t345.us.us.us.us.us, 0
  %t327.us.us.us.us.us = add i32 %887, %876
  br i1 %890, label %"for output.s0.x.rebased51.us.us.us.us.us.us.us", label %"for output.s0.x.rebased51.us.us.us.us.us.us301.preheader", !prof !95

"for output.s0.x.rebased51.us.us.us.us.us.us301.preheader": ; preds = %"for output.s0.y.rebased48.us.us.us.us.us"
  br i1 %873, label %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us.loopexit496.unr-lcssa", label %"for output.s0.x.rebased51.us.us.us.us.us.us301"

"for output.s0.x.rebased51.us.us.us.us.us.us301": ; preds = %"for output.s0.x.rebased51.us.us.us.us.us.us301.preheader", %"for output.s0.x.rebased51.us.us.us.us.us.us301"
  %output.s0.x.rebased53.us.us.us.us.us.us302 = phi i32 [ %914, %"for output.s0.x.rebased51.us.us.us.us.us.us301" ], [ 0, %"for output.s0.x.rebased51.us.us.us.us.us.us301.preheader" ]
  %niter = phi i32 [ %niter.nsub.7, %"for output.s0.x.rebased51.us.us.us.us.us.us301" ], [ %unroll_iter, %"for output.s0.x.rebased51.us.us.us.us.us.us301.preheader" ]
  %891 = mul i32 %16, %output.s0.x.rebased53.us.us.us.us.us.us302
  %892 = add i32 %879, %891
  %scevgep = getelementptr i8, i8* %12, i32 %892
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep, i8 %866, i32 %2, i1 false)
  %893 = or i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 1
  %894 = mul i32 %16, %893
  %895 = add i32 %879, %894
  %scevgep.1 = getelementptr i8, i8* %12, i32 %895
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.1, i8 %866, i32 %2, i1 false)
  %896 = or i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 2
  %897 = mul i32 %16, %896
  %898 = add i32 %879, %897
  %scevgep.2 = getelementptr i8, i8* %12, i32 %898
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.2, i8 %866, i32 %2, i1 false)
  %899 = or i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 3
  %900 = mul i32 %16, %899
  %901 = add i32 %879, %900
  %scevgep.3 = getelementptr i8, i8* %12, i32 %901
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.3, i8 %866, i32 %2, i1 false)
  %902 = or i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 4
  %903 = mul i32 %16, %902
  %904 = add i32 %879, %903
  %scevgep.4 = getelementptr i8, i8* %12, i32 %904
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.4, i8 %866, i32 %2, i1 false)
  %905 = or i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 5
  %906 = mul i32 %16, %905
  %907 = add i32 %879, %906
  %scevgep.5 = getelementptr i8, i8* %12, i32 %907
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.5, i8 %866, i32 %2, i1 false)
  %908 = or i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 6
  %909 = mul i32 %16, %908
  %910 = add i32 %879, %909
  %scevgep.6 = getelementptr i8, i8* %12, i32 %910
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.6, i8 %866, i32 %2, i1 false)
  %911 = or i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 7
  %912 = mul i32 %16, %911
  %913 = add i32 %879, %912
  %scevgep.7 = getelementptr i8, i8* %12, i32 %913
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.7, i8 %866, i32 %2, i1 false)
  %914 = add nuw nsw i32 %output.s0.x.rebased53.us.us.us.us.us.us302, 8
  %niter.nsub.7 = add i32 %niter, -8
  %niter.ncmp.7 = icmp eq i32 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us.loopexit496.unr-lcssa", label %"for output.s0.x.rebased51.us.us.us.us.us.us301"

"end for output.s0.y.rebased49.loopexit.split.us.us.us.split.us.us": ; preds = %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us"
  %915 = add nuw nsw i32 %output.s0.b.rebased47.us.us.us, 1
  %.not.us.us.us = icmp eq i32 %915, %10
  br i1 %.not.us.us.us, label %call_destructor.exit, label %"for output.s0.b.rebased45.us.us.us"

"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us.loopexit496.unr-lcssa": ; preds = %"for output.s0.x.rebased51.us.us.us.us.us.us301", %"for output.s0.x.rebased51.us.us.us.us.us.us301.preheader"
  %output.s0.x.rebased53.us.us.us.us.us.us302.unr = phi i32 [ 0, %"for output.s0.x.rebased51.us.us.us.us.us.us301.preheader" ], [ %914, %"for output.s0.x.rebased51.us.us.us.us.us.us301" ]
  br i1 %lcmp.mod.not, label %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us", label %"for output.s0.x.rebased51.us.us.us.us.us.us301.epil"

"for output.s0.x.rebased51.us.us.us.us.us.us301.epil": ; preds = %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us.loopexit496.unr-lcssa", %"for output.s0.x.rebased51.us.us.us.us.us.us301.epil"
  %output.s0.x.rebased53.us.us.us.us.us.us302.epil = phi i32 [ %918, %"for output.s0.x.rebased51.us.us.us.us.us.us301.epil" ], [ %output.s0.x.rebased53.us.us.us.us.us.us302.unr, %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us.loopexit496.unr-lcssa" ]
  %epil.iter = phi i32 [ %epil.iter.sub, %"for output.s0.x.rebased51.us.us.us.us.us.us301.epil" ], [ %xtraiter, %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us.loopexit496.unr-lcssa" ]
  %916 = mul i32 %16, %output.s0.x.rebased53.us.us.us.us.us.us302.epil
  %917 = add i32 %879, %916
  %scevgep.epil = getelementptr i8, i8* %12, i32 %917
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep.epil, i8 %866, i32 %2, i1 false)
  %918 = add nuw nsw i32 %output.s0.x.rebased53.us.us.us.us.us.us302.epil, 1
  %epil.iter.sub = add i32 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us", label %"for output.s0.x.rebased51.us.us.us.us.us.us301.epil", !llvm.loop !111

"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us": ; preds = %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us.loopexit496.unr-lcssa", %"for output.s0.x.rebased51.us.us.us.us.us.us301.epil", %"end for output.s0.c.rebased.loopexit.split.us.us.us.us.us.us.us.us"
  %919 = add nuw nsw i32 %output.s0.y.rebased50.us.us.us.us.us, 1
  %.not82.us.us.us.us.us = icmp eq i32 %919, %18
  br i1 %.not82.us.us.us.us.us, label %"end for output.s0.y.rebased49.loopexit.split.us.us.us.split.us.us", label %"for output.s0.y.rebased48.us.us.us.us.us"

"for output.s0.x.rebased51.us.us.us.us.us.us.us": ; preds = %"for output.s0.y.rebased48.us.us.us.us.us", %"end for output.s0.c.rebased.loopexit.split.us.us.us.us.us.us.us.us"
  %output.s0.x.rebased53.us.us.us.us.us.us.us = phi i32 [ %946, %"end for output.s0.c.rebased.loopexit.split.us.us.us.us.us.us.us.us" ], [ 0, %"for output.s0.y.rebased48.us.us.us.us.us" ]
  %920 = mul i32 %output.s0.x.rebased53.us.us.us.us.us.us.us, %stride_x
  %921 = sub i32 %871, %920
  %922 = icmp sgt i32 %921, %b45
  %smin = select i1 %922, i32 %b45, i32 %921
  %923 = sub i32 %872, %920
  %924 = icmp sgt i32 %923, %b45
  %smin499 = select i1 %924, i32 %b45, i32 %923
  %925 = icmp sgt i32 %smin, %smin499
  %smax = select i1 %925, i32 %smin, i32 %smin499
  %926 = icmp sgt i32 %smax, 0
  %smax500 = select i1 %926, i32 %smax, i32 0
  %927 = icmp sgt i32 %smin499, 0
  %smax501 = select i1 %927, i32 %smin499, i32 0
  %928 = sub nsw i32 %smax500, %smax501
  %929 = xor i32 %smax501, -1
  %930 = add nsw i32 %smax500, %929
  %931 = add nsw i32 %output.s0.x.rebased53.us.us.us.us.us.us.us, %14
  %932 = mul nsw i32 %931, %stride_x
  %a42.us.us.us.us.us.us.us = sub i32 %863, %932
  %933 = icmp slt i32 %a42.us.us.us.us.us.us.us, %b45
  %b47.us.us.us.us.us.us.us = select i1 %933, i32 %a42.us.us.us.us.us.us.us, i32 %b45
  %a43.us.us.us.us.us.us.us = sub nsw i32 %3, %932
  %934 = icmp slt i32 %a43.us.us.us.us.us.us.us, %b45
  %a50.us.us.us.us.us.us.us = select i1 %934, i32 %a43.us.us.us.us.us.us.us, i32 %b45
  %935 = mul nsw i32 %931, %16
  %936 = icmp sgt i32 %a50.us.us.us.us.us.us.us, %b47.us.us.us.us.us.us.us
  %a49.us.us.us.us.us.us.us = select i1 %936, i32 %a50.us.us.us.us.us.us.us, i32 %b47.us.us.us.us.us.us.us
  %937 = icmp sgt i32 %a50.us.us.us.us.us.us.us, 0
  %938 = select i1 %937, i32 %a50.us.us.us.us.us.us.us, i32 0
  %t349.us.us.us.us.us.us.us = add nsw i32 %938, %932
  %939 = icmp sgt i32 %a49.us.us.us.us.us.us.us, 0
  %940 = select i1 %939, i32 %a49.us.us.us.us.us.us.us, i32 0
  %941 = icmp sgt i32 %940, %938
  %942 = add i32 %t327.us.us.us.us.us, %935
  br i1 %941, label %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us.preheader", label %"for output.s0.c.rebased.us.us276.us.us.us.us.us.us.preheader", !prof !95

"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us.preheader": ; preds = %"for output.s0.x.rebased51.us.us.us.us.us.us.us"
  %xtraiter502 = and i32 %928, 7
  %943 = icmp ult i32 %930, 7
  %unroll_iter506 = and i32 %928, -8
  %lcmp.mod504.not = icmp eq i32 %xtraiter502, 0
  br label %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us"

"for output.s0.c.rebased.us.us276.us.us.us.us.us.us.preheader": ; preds = %"for output.s0.x.rebased51.us.us.us.us.us.us.us"
  %944 = mul i32 %16, %output.s0.x.rebased53.us.us.us.us.us.us.us
  %945 = add i32 %879, %944
  %scevgep445 = getelementptr i8, i8* %12, i32 %945
  call void @llvm.memset.p0i8.i32(i8* align 1 %scevgep445, i8 %866, i32 %2, i1 false)
  br label %"end for output.s0.c.rebased.loopexit.split.us.us.us.us.us.us.us.us"

"end for output.s0.c.rebased.loopexit.split.us.us.us.us.us.us.us.us": ; preds = %"consume maximum61.loopexit.split.us.us.us.us.us.us.us.us.us.us", %"for output.s0.c.rebased.us.us276.us.us.us.us.us.us.preheader"
  %946 = add nuw nsw i32 %output.s0.x.rebased53.us.us.us.us.us.us.us, 1
  %.not83.us.us.us.us.us.us.us = icmp eq i32 %946, %15
  br i1 %.not83.us.us.us.us.us.us.us, label %"end for output.s0.x.rebased52.loopexit.split.us.us.us.us.us.us", label %"for output.s0.x.rebased51.us.us.us.us.us.us.us"

"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us": ; preds = %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us.preheader", %"consume maximum61.loopexit.split.us.us.us.us.us.us.us.us.us.us"
  %output.s0.c.rebased.us.us.us.us.us.us.us.us.us = phi i32 [ %1018, %"consume maximum61.loopexit.split.us.us.us.us.us.us.us.us.us.us" ], [ 0, %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us.preheader" ]
  %t326.us.us.us.us.us.us.us.us.us = add i32 %output.s0.c.rebased.us.us.us.us.us.us.us.us.us, %877
  br label %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us"

"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us": ; preds = %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us", %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us"
  %.lcssa257260.us.us.us.us.us.us.us.us.us.us = phi i8 [ %.lcssa498, %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us" ], [ %output_min, %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us" ]
  %"maximum.s1.r12$y.rebased57.us.us.us.us.us.us.us.us.us.us" = phi i32 [ %1013, %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us" ], [ 0, %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us" ]
  %947 = add nsw i32 %t339.us.us.us.us.us, %"maximum.s1.r12$y.rebased57.us.us.us.us.us.us.us.us.us.us"
  %948 = mul nsw i32 %947, %8
  %949 = add i32 %t326.us.us.us.us.us.us.us.us.us, %948
  br i1 %943, label %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us"

"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us": ; preds = %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us", %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us = phi i8 [ %1004, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us" ], [ %.lcssa257260.us.us.us.us.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us" = phi i32 [ %1005, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us" ], [ 0, %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us" ]
  %niter507 = phi i32 [ %niter507.nsub.7, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us" ], [ %unroll_iter506, %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us" ]
  %950 = add nsw i32 %t349.us.us.us.us.us.us.us, %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us"
  %951 = mul nsw i32 %950, %5
  %t352.us.us.us.us.us.us.us.us.us.us = add i32 %949, %951
  %952 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us, %reass.add201
  %953 = getelementptr inbounds i8, i8* %0, i32 %952
  %b53.us.us.us.us.us.us.us.us.us.us = load i8, i8* %953, align 1, !tbaa !101
  %954 = icmp ugt i8 %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us, %b53.us.us.us.us.us.us.us.us.us.us
  %955 = select i1 %954, i8 %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us, i8 %b53.us.us.us.us.us.us.us.us.us.us
  %956 = or i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 1
  %957 = add nsw i32 %t349.us.us.us.us.us.us.us, %956
  %958 = mul nsw i32 %957, %5
  %t352.us.us.us.us.us.us.us.us.us.us.1 = add i32 %949, %958
  %959 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.1, %reass.add201
  %960 = getelementptr inbounds i8, i8* %0, i32 %959
  %b53.us.us.us.us.us.us.us.us.us.us.1 = load i8, i8* %960, align 1, !tbaa !101
  %961 = icmp ugt i8 %955, %b53.us.us.us.us.us.us.us.us.us.us.1
  %962 = select i1 %961, i8 %955, i8 %b53.us.us.us.us.us.us.us.us.us.us.1
  %963 = or i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 2
  %964 = add nsw i32 %t349.us.us.us.us.us.us.us, %963
  %965 = mul nsw i32 %964, %5
  %t352.us.us.us.us.us.us.us.us.us.us.2 = add i32 %949, %965
  %966 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.2, %reass.add201
  %967 = getelementptr inbounds i8, i8* %0, i32 %966
  %b53.us.us.us.us.us.us.us.us.us.us.2 = load i8, i8* %967, align 1, !tbaa !101
  %968 = icmp ugt i8 %962, %b53.us.us.us.us.us.us.us.us.us.us.2
  %969 = select i1 %968, i8 %962, i8 %b53.us.us.us.us.us.us.us.us.us.us.2
  %970 = or i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 3
  %971 = add nsw i32 %t349.us.us.us.us.us.us.us, %970
  %972 = mul nsw i32 %971, %5
  %t352.us.us.us.us.us.us.us.us.us.us.3 = add i32 %949, %972
  %973 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.3, %reass.add201
  %974 = getelementptr inbounds i8, i8* %0, i32 %973
  %b53.us.us.us.us.us.us.us.us.us.us.3 = load i8, i8* %974, align 1, !tbaa !101
  %975 = icmp ugt i8 %969, %b53.us.us.us.us.us.us.us.us.us.us.3
  %976 = select i1 %975, i8 %969, i8 %b53.us.us.us.us.us.us.us.us.us.us.3
  %977 = or i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 4
  %978 = add nsw i32 %t349.us.us.us.us.us.us.us, %977
  %979 = mul nsw i32 %978, %5
  %t352.us.us.us.us.us.us.us.us.us.us.4 = add i32 %949, %979
  %980 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.4, %reass.add201
  %981 = getelementptr inbounds i8, i8* %0, i32 %980
  %b53.us.us.us.us.us.us.us.us.us.us.4 = load i8, i8* %981, align 1, !tbaa !101
  %982 = icmp ugt i8 %976, %b53.us.us.us.us.us.us.us.us.us.us.4
  %983 = select i1 %982, i8 %976, i8 %b53.us.us.us.us.us.us.us.us.us.us.4
  %984 = or i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 5
  %985 = add nsw i32 %t349.us.us.us.us.us.us.us, %984
  %986 = mul nsw i32 %985, %5
  %t352.us.us.us.us.us.us.us.us.us.us.5 = add i32 %949, %986
  %987 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.5, %reass.add201
  %988 = getelementptr inbounds i8, i8* %0, i32 %987
  %b53.us.us.us.us.us.us.us.us.us.us.5 = load i8, i8* %988, align 1, !tbaa !101
  %989 = icmp ugt i8 %983, %b53.us.us.us.us.us.us.us.us.us.us.5
  %990 = select i1 %989, i8 %983, i8 %b53.us.us.us.us.us.us.us.us.us.us.5
  %991 = or i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 6
  %992 = add nsw i32 %t349.us.us.us.us.us.us.us, %991
  %993 = mul nsw i32 %992, %5
  %t352.us.us.us.us.us.us.us.us.us.us.6 = add i32 %949, %993
  %994 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.6, %reass.add201
  %995 = getelementptr inbounds i8, i8* %0, i32 %994
  %b53.us.us.us.us.us.us.us.us.us.us.6 = load i8, i8* %995, align 1, !tbaa !101
  %996 = icmp ugt i8 %990, %b53.us.us.us.us.us.us.us.us.us.us.6
  %997 = select i1 %996, i8 %990, i8 %b53.us.us.us.us.us.us.us.us.us.us.6
  %998 = or i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 7
  %999 = add nsw i32 %t349.us.us.us.us.us.us.us, %998
  %1000 = mul nsw i32 %999, %5
  %t352.us.us.us.us.us.us.us.us.us.us.7 = add i32 %949, %1000
  %1001 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.7, %reass.add201
  %1002 = getelementptr inbounds i8, i8* %0, i32 %1001
  %b53.us.us.us.us.us.us.us.us.us.us.7 = load i8, i8* %1002, align 1, !tbaa !101
  %1003 = icmp ugt i8 %997, %b53.us.us.us.us.us.us.us.us.us.us.7
  %1004 = select i1 %1003, i8 %997, i8 %b53.us.us.us.us.us.us.us.us.us.us.7
  %1005 = add nuw nsw i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us", 8
  %niter507.nsub.7 = add i32 %niter507, -8
  %niter507.ncmp.7 = icmp eq i32 %niter507.nsub.7, 0
  br i1 %niter507.ncmp.7, label %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa", label %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us"

"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa": ; preds = %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us", %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us"
  %.lcssa498.ph = phi i8 [ undef, %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us" ], [ %1004, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us" ]
  %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us.unr = phi i8 [ %.lcssa257260.us.us.us.us.us.us.us.us.us.us, %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us" ], [ %1004, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us" ]
  %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us.unr" = phi i32 [ 0, %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us" ], [ %1005, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us" ]
  br i1 %lcmp.mod504.not, label %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us", label %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil"

"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil": ; preds = %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa", %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil"
  %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us.epil = phi i8 [ %1011, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil" ], [ %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us.unr, %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa" ]
  %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us.epil" = phi i32 [ %1012, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil" ], [ %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us.unr", %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa" ]
  %epil.iter503 = phi i32 [ %epil.iter503.sub, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil" ], [ %xtraiter502, %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa" ]
  %1006 = add nsw i32 %t349.us.us.us.us.us.us.us, %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us.epil"
  %1007 = mul nsw i32 %1006, %5
  %t352.us.us.us.us.us.us.us.us.us.us.epil = add i32 %949, %1007
  %1008 = sub i32 %t352.us.us.us.us.us.us.us.us.us.us.epil, %reass.add201
  %1009 = getelementptr inbounds i8, i8* %0, i32 %1008
  %b53.us.us.us.us.us.us.us.us.us.us.epil = load i8, i8* %1009, align 1, !tbaa !101
  %1010 = icmp ugt i8 %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us.epil, %b53.us.us.us.us.us.us.us.us.us.us.epil
  %1011 = select i1 %1010, i8 %maximum81.sroa.0.0.maximum81.sroa.0.0.a51256.us.us.us.us.us.us.us.us.us.us.epil, i8 %b53.us.us.us.us.us.us.us.us.us.us.epil
  %1012 = add nuw nsw i32 %"maximum.s1.r12$x.rebased60.us.us.us.us.us.us.us.us.us.us.epil", 1
  %epil.iter503.sub = add i32 %epil.iter503, -1
  %epil.iter503.cmp.not = icmp eq i32 %epil.iter503.sub, 0
  br i1 %epil.iter503.cmp.not, label %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us", label %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil", !llvm.loop !112

"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us": ; preds = %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil", %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa"
  %.lcssa498 = phi i8 [ %.lcssa498.ph, %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us.unr-lcssa" ], [ %1011, %"for maximum.s1.r12$x.rebased58.us.us.us.us.us.us.us.us.us.us.epil" ]
  %1013 = add nuw nsw i32 %"maximum.s1.r12$y.rebased57.us.us.us.us.us.us.us.us.us.us", 1
  %.not85.us.us.us.us.us.us.us.us.us.us = icmp eq i32 %1013, %t345.us.us.us.us.us
  br i1 %.not85.us.us.us.us.us.us.us.us.us.us, label %"consume maximum61.loopexit.split.us.us.us.us.us.us.us.us.us.us", label %"for maximum.s1.r12$y.rebased55.us.us.us.us.us.us.us.us.us.us"

"consume maximum61.loopexit.split.us.us.us.us.us.us.us.us.us.us": ; preds = %"end for maximum.s1.r12$x.rebased59.loopexit.us.us.us.us.us.us.us.us.us.us"
  %1014 = icmp ult i8 %.lcssa498, %b54
  %1015 = select i1 %1014, i8 %.lcssa498, i8 %b54
  %t341.us.us.us.us.us.us.us.us.us = add i32 %942, %output.s0.c.rebased.us.us.us.us.us.us.us.us.us
  %1016 = sub i32 %t341.us.us.us.us.us.us.us.us.us, %reass.add203
  %1017 = getelementptr inbounds i8, i8* %12, i32 %1016
  store i8 %1015, i8* %1017, align 1, !tbaa !97
  %1018 = add nuw nsw i32 %output.s0.c.rebased.us.us.us.us.us.us.us.us.us, 1
  %.not84.us.us.us.us.us.us.us.us.us = icmp eq i32 %1018, %2
  br i1 %.not84.us.us.us.us.us.us.us.us.us, label %"end for output.s0.c.rebased.loopexit.split.us.us.us.us.us.us.us.us", label %"for output.s0.c.rebased.us.us.us.us.us.us.us.us.us"
}

; Function Attrs: nounwind
define i32 @max_pool_hvx128_argv(i8** nocapture readonly %0) local_unnamed_addr #11 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 4
  %3 = getelementptr i8*, i8** %0, i32 1
  %4 = bitcast i8** %3 to i32**
  %5 = load i32*, i32** %4, align 4
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr i8*, i8** %0, i32 2
  %8 = bitcast i8** %7 to i32**
  %9 = load i32*, i32** %8, align 4
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr i8*, i8** %0, i32 3
  %12 = bitcast i8** %11 to i32**
  %13 = load i32*, i32** %12, align 4
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr i8*, i8** %0, i32 4
  %16 = bitcast i8** %15 to i32**
  %17 = load i32*, i32** %16, align 4
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr i8*, i8** %0, i32 5
  %20 = load i8*, i8** %19, align 4
  %21 = load i8, i8* %20, align 1
  %22 = getelementptr i8*, i8** %0, i32 6
  %23 = load i8*, i8** %22, align 4
  %24 = load i8, i8* %23, align 1
  %25 = getelementptr i8*, i8** %0, i32 7
  %26 = bitcast i8** %25 to %struct.halide_buffer_t**
  %27 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %26, align 4
  %28 = tail call i32 @max_pool_hvx128(%struct.halide_buffer_t* %2, i32 %6, i32 %10, i32 %14, i32 %18, i8 %21, i8 %24, %struct.halide_buffer_t* %27) #15
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @max_pool_hvx128_metadata() local_unnamed_addr #12 {
entry:
  ret %struct.halide_filter_metadata_t* @max_pool_hvx128_metadata_storage
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
attributes #13 = { nobuiltin nounwind "no-builtins" }
attributes #14 = { nobuiltin "no-builtins" }
attributes #15 = { noinline }

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
!9 = !{!"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"}
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
!96 = !{!"branch_weights", i32 0, i32 -2147483648}
!97 = !{!98, !98, i64 0}
!98 = !{!"output", !99, i64 0}
!99 = !{!"Halide buffer"}
!100 = distinct !{!100, !32}
!101 = !{!102, !102, i64 0}
!102 = !{!"input", !99, i64 0}
!103 = distinct !{!103, !32}
!104 = distinct !{!104, !32}
!105 = distinct !{!105, !32}
!106 = distinct !{!106, !32}
!107 = !{!"branch_weights", i32 -2147483648, i32 0}
!108 = distinct !{!108, !32}
!109 = distinct !{!109, !32}
!110 = distinct !{!110, !32}
!111 = distinct !{!111, !32}
!112 = distinct !{!112, !32}
