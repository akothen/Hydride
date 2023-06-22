; ModuleID = 'mul_hvx128'
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
@0 = private constant [4 x i64*] zeroinitializer
@str = private constant [7 x i8] c"input1\00", align 32
@str.102 = private constant [12 x i8] c"input1_zero\00", align 32
@1 = private constant [4 x i64*] zeroinitializer
@str.103 = private constant [7 x i8] c"input2\00", align 32
@str.104 = private constant [12 x i8] c"input2_zero\00", align 32
@str.105 = private constant [12 x i8] c"output_zero\00", align 32
@str.106 = private constant [18 x i8] c"output_multiplier\00", align 32
@str.107 = private constant [13 x i8] c"output_shift\00", align 32
@str.108 = private constant [11 x i8] c"output_min\00", align 32
@str.109 = private constant [11 x i8] c"output_max\00", align 32
@2 = private constant [4 x i64*] zeroinitializer
@str.110 = private constant [7 x i8] c"output\00", align 32
@3 = private constant [10 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @0, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.102, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.103, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @1, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.104, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.105, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.106, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.107, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.108, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.109, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.110, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @2, i32 0, i32 0) }]
@str.111 = private constant [63 x i8] c"hexagon-32-noos-hvx-hvx_128-hvx_v66-no_asserts-no_bounds_query\00", align 128
@str.112 = private constant [11 x i8] c"mul_hvx128\00", align 32
@mul_hvx128_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 10, %struct.halide_filter_argument_t* getelementptr inbounds ([10 x %struct.halide_filter_argument_t], [10 x %struct.halide_filter_argument_t]* @3, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @str.111, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.112, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0)], align 4

; Function Attrs: nounwind mustprogress
define linkonce i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 %alignment, i32 %size) local_unnamed_addr #0 {
entry:
  %add = add i32 %alignment, -1
  %sub = add i32 %add, %size
  %neg = sub i32 0, %alignment
  %and = and i32 %sub, %neg
  %add2 = add i32 %and, %alignment
  %call = tail call i8* @malloc(i32 %add2) #15
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
  tail call void @free(i8* %1) #15
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @free(i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv() #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 0), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %0) #16
  %1 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 1), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %1) #16
  %2 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 2), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %2) #16
  %3 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 3), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %3) #16
  %4 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 4), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %4) #16
  %5 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 5), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %5) #16
  %6 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 6), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %6) #16
  %7 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 7), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %7) #16
  %8 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 8), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %8) #16
  %9 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZN6Halide7Runtime8Internal7mem_bufE, i32 0, i32 9), align 4, !tbaa !10
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %9) #16
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
  %call = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 65536) #16
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
  %call10 = tail call i8* @_ZN6Halide7Runtime8Internal14aligned_mallocEjj(i32 128, i32 %x) #16
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
  tail call void @_ZN6Halide7Runtime8Internal12aligned_freeEPv(i8* %ptr) #16
  br label %return
}

; Function Attrs: nounwind mustprogress
define weak i8* (i8*, i32)* @halide_set_custom_malloc(i8* (i8*, i32)* %user_malloc) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0)) #15
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !10
  store i8* (i8*, i32)* %user_malloc, i8* (i8*, i32)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 4, !tbaa !10
  ret i8* (i8*, i32)* %0
}

declare void @halide_print(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void (i8*, i8*)* @halide_set_custom_free(void (i8*, i8*)* %user_free) local_unnamed_addr #0 {
entry:
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i32 0, i32 0)) #15
  %0 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !10
  store void (i8*, i8*)* %user_free, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 4, !tbaa !10
  ret void (i8*, i8*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_malloc(i8* %user_context, i32 %x) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @halide_default_malloc(i8* %user_context, i32 %x) #16
  ret i8* %call
}

; Function Attrs: nounwind mustprogress
define weak void @halide_free(i8* %user_context, i8* %ptr) local_unnamed_addr #0 {
entry:
  tail call void @halide_default_free(i8* %user_context, i8* %ptr) #16
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %idx, i8* %closure) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #15
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
  %call = tail call i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %x.012, i8* %closure) #16
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
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.1, i32 0, i32 0)) #15
  ret i32 -1
}

declare void @halide_error(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1.2, i32 0, i32 0)) #15
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i32 0, i32 0)) #15
  ret i1 false
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.2, i32 0, i32 0)) #15
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %f, i8* %closure) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)) #15
  ret %struct.halide_thread* null
}

; Function Attrs: nounwind mustprogress
define weak void @halide_join_thread(%struct.halide_thread* %thread_arg) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.5, i32 0, i32 0)) #15
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
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.6, i32 0, i32 0)) #15
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
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 4, !tbaa !10
  %call = tail call i32 %0(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 4, !tbaa !10
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 4, !tbaa !10
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 4, !tbaa !10
  %call = tail call zeroext i1 %0(%struct.halide_semaphore_t* %sema, i32 %count) #15
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
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i32 0, i32 0)) #15
  %tobool1.not = icmp eq i8* %call, null
  br i1 %tobool1.not, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call3 = tail call i32 @atoi(i8* nonnull %call) #15
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
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #16
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
  %call = tail call i8* @halide_uint64_to_string(i8* %dst.addr.0, i8* %end, i64 %arg.addr.0, i32 %min_digits) #16
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
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %1, i32 8) #15
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
  %call7 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.9, i32 0, i32 0)) #16
  br label %cleanup147

if.else:                                          ; preds = %if.then4
  %call8 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2.10, i32 0, i32 0)) #16
  br label %cleanup147

if.else9:                                         ; preds = %if.then
  br i1 %tobool10.not, label %if.else13, label %if.then11

if.then11:                                        ; preds = %if.else9
  %call12 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.11, i32 0, i32 0)) #16
  br label %cleanup147

if.else13:                                        ; preds = %if.else9
  %call14 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4.12, i32 0, i32 0)) #16
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
  %call23 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5.13, i32 0, i32 0)) #16
  br label %cleanup147

if.else24:                                        ; preds = %if.then20
  %call25 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6.14, i32 0, i32 0)) #16
  br label %cleanup147

if.else26:                                        ; preds = %if.then18
  br i1 %tobool27.not, label %if.else30, label %if.then28

if.then28:                                        ; preds = %if.else26
  %call29 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7.15, i32 0, i32 0)) #16
  br label %cleanup147

if.else30:                                        ; preds = %if.else26
  %call31 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8.16, i32 0, i32 0)) #16
  br label %cleanup147

if.end32:                                         ; preds = %if.else15
  %tobool33.not = icmp sgt i64 %2, -1
  br i1 %tobool33.not, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.end32
  %call35 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0)) #16
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
  %call49 = call i8* @halide_int64_to_string(i8* %dst.addr.0, i8* %end, i64 %div46, i32 1) #16
  %call50 = call i8* @halide_string_to_string(i8* %call49, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #16
  %call51 = call i8* @halide_int64_to_string(i8* %call50, i8* %end, i64 %sub48, i32 6) #16
  %cmp52 = icmp sgt i32 %exponent_base_10.1.lcssa, -1
  br i1 %cmp52, label %if.then53, label %if.else55

if.then53:                                        ; preds = %while.end43
  %call54 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0)) #16
  br label %if.end58

if.else55:                                        ; preds = %while.end43
  %call56 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0)) #16
  %sub57 = sub nsw i32 0, %exponent_base_10.1.lcssa
  br label %if.end58

if.end58:                                         ; preds = %if.else55, %if.then53
  %exponent_base_10.2 = phi i32 [ %exponent_base_10.1.lcssa, %if.then53 ], [ %sub57, %if.else55 ]
  %dst.addr.1 = phi i8* [ %call54, %if.then53 ], [ %call56, %if.else55 ]
  %conv59261 = zext i32 %exponent_base_10.2 to i64
  %call60 = call i8* @halide_int64_to_string(i8* %dst.addr.1, i8* %end, i64 %conv59261, i32 2) #16
  br label %cleanup147

if.else61:                                        ; preds = %if.end36
  br i1 %cmp16, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.else61
  %call64 = call i8* @halide_double_to_string(i8* %dst.addr.0, i8* %end, double 0.000000e+00, i32 0) #16
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
  %call108 = call i8* @halide_int64_to_string(i8* nonnull %add.ptr105, i8* nonnull %add.ptr, i64 %integer_part.2, i32 1) #16
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
  %call141 = call i8* @halide_string_to_string(i8* %dst.addr.0, i8* %end, i8* %int_part_ptr.0.lcssa) #16
  %call142 = call i8* @halide_string_to_string(i8* %call141, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #16
  %call143 = call i8* @halide_int64_to_string(i8* %call142, i8* %end, i64 %fractional_part.2, i32 6) #16
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
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #16
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
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %code_name.0) #16
  %bits = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 1
  %3 = load i8, i8* %bits, align 1, !tbaa !38
  %conv4 = zext i8 %3 to i64
  %call5 = tail call i8* @halide_uint64_to_string(i8* %call, i8* %end, i64 %conv4, i32 1) #16
  %lanes = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i32 0, i32 2
  %4 = load i16, i16* %lanes, align 2, !tbaa !39
  %cmp.not = icmp eq i16 %4, 1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %sw.epilog
  %call7 = tail call i8* @halide_string_to_string(i8* %call5, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0)) #16
  %5 = load i16, i16* %lanes, align 2, !tbaa !39
  %conv9 = zext i16 %5 to i64
  %call10 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %conv9, i32 1) #16
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
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #16
  br label %return

if.end:                                           ; preds = %entry
  %call1 = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0)) #16
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !40
  %call2 = tail call i8* @halide_uint64_to_string(i8* %call1, i8* %end, i64 %0, i32 1) #16
  %call3 = tail call i8* @halide_string_to_string(i8* %call2, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #16
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = bitcast %struct.halide_device_interface_t** %device_interface to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !42
  %call4 = tail call i8* @halide_pointer_to_string(i8* %call3, i8* %end, i8* %2) #16
  %call5 = tail call i8* @halide_string_to_string(i8* %call4, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #16
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %3 = load i8*, i8** %host, align 4, !tbaa !43
  %call6 = tail call i8* @halide_pointer_to_string(i8* %call5, i8* %end, i8* %3) #16
  %call7 = tail call i8* @halide_string_to_string(i8* %call6, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #16
  %flags = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %4 = load i64, i64* %flags, align 8, !tbaa !44
  %call8 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %4, i32 1) #16
  %call9 = tail call i8* @halide_string_to_string(i8* %call8, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #16
  %type = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 4
  %call10 = tail call i8* @halide_type_to_string(i8* %call9, i8* %end, %struct.halide_type_t* nonnull %type) #16
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 5
  %5 = load i32, i32* %dimensions, align 4, !tbaa !45
  %cmp1177 = icmp sgt i32 %5, 0
  br i1 %cmp1177, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 6
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %dst.addr.0.lcssa = phi i8* [ %call10, %if.end ], [ %call24, %for.body ]
  %call25 = tail call i8* @halide_string_to_string(i8* %dst.addr.0.lcssa, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #16
  br label %return

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.079 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %dst.addr.078 = phi i8* [ %call10, %for.body.lr.ph ], [ %call24, %for.body ]
  %call12 = tail call i8* @halide_string_to_string(i8* %dst.addr.078, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0)) #16
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 %i.079, i32 0
  %7 = load i32, i32* %min, align 4, !tbaa !47
  %conv = sext i32 %7 to i64
  %call13 = tail call i8* @halide_int64_to_string(i8* %call12, i8* %end, i64 %conv, i32 1) #16
  %call14 = tail call i8* @halide_string_to_string(i8* %call13, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #16
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %extent = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i32 %i.079, i32 1
  %9 = load i32, i32* %extent, align 4, !tbaa !49
  %conv17 = sext i32 %9 to i64
  %call18 = tail call i8* @halide_int64_to_string(i8* %call14, i8* %end, i64 %conv17, i32 1) #16
  %call19 = tail call i8* @halide_string_to_string(i8* %call18, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #16
  %10 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !46
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %10, i32 %i.079, i32 2
  %11 = load i32, i32* %stride, align 4, !tbaa !50
  %conv22 = sext i32 %11 to i64
  %call23 = tail call i8* @halide_int64_to_string(i8* %call19, i8* %end, i64 %conv22, i32 1) #16
  %call24 = tail call i8* @halide_string_to_string(i8* %call23, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.24, i32 0, i32 0)) #16
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #15
  %p.014 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  %cmp.not15 = icmp eq %struct.halide_device_allocation_pool* %p.014, null
  br i1 %cmp.not15, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.then
  %err.0.lcssa = phi i32 [ 0, %if.then ], [ %spec.select, %for.body ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #15
  br label %if.end5

for.body:                                         ; preds = %if.then, %for.body
  %p.017 = phi %struct.halide_device_allocation_pool* [ %p.0, %for.body ], [ %p.014, %if.then ]
  %err.016 = phi i32 [ %spec.select, %for.body ], [ 0, %if.then ]
  %release_unused = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i32 0, i32 0
  %0 = load i32 (i8*)*, i32 (i8*)** %release_unused, align 4, !tbaa !52
  %call = tail call i32 %0(i8* %user_context) #15
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #15
  %0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %pool, i32 0, i32 1
  store %struct.halide_device_allocation_pool* %0, %struct.halide_device_allocation_pool** %next, align 4, !tbaa !55
  store %struct.halide_device_allocation_pool* %pool, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 4, !tbaa !10
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #15
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
  %call = tail call i8* @memcpy(i8* %5, i8* %3, i32 %conv5) #15
  br label %if.end

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %inc.phi = phi i64 [ %inc.0, %for.body.lr.ph ], [ %inc.1, %for.body.for.body_crit_edge ]
  %src_off.addr.037 = phi i64 [ %src_off, %for.body.lr.ph ], [ %add10, %for.body.for.body_crit_edge ]
  %dst_off.addr.036 = phi i64 [ %dst_off, %for.body.lr.ph ], [ %add12, %for.body.for.body_crit_edge ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %sub, i64 %src_off.addr.037, i64 %dst_off.addr.036) #16
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
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 15, i64 %2, i64 0) #16
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
  %call16 = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  %cmp17.not = icmp eq i32 %call16, 0
  br i1 %cmp17.not, label %if.end23, label %return

if.end23:                                         ; preds = %if.end15
  %4 = load i64, i64* %flags.i.i, align 8, !tbaa !44
  %and.i.i44 = and i64 %4, -3
  store i64 %and.i.i44, i64* %flags.i.i, align 8, !tbaa !44
  %call24 = tail call i32 @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
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
  %call = tail call i32 %1(i8* %user_context) #15
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6.17, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  br label %cleanup

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) #16
  br label %cleanup

cleanup:                                          ; preds = %if.end16.i.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.18, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  %call8 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9.19, i32 0, i32 0)) #15
  br label %cleanup

if.then18:                                        ; preds = %if.end11
  %call19 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* nonnull %device_interface.addr.0) #16
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
  %call44 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17.20, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.21, i32 0, i32 0)) #15
  br label %cleanup12

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #15
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 2
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_malloc, align 4, !tbaa !78
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #15
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  %call = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) #16
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_sync(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16.22, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  %call4 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %cleanup8

if.end5:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_sync = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 4
  %6 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_sync, align 4, !tbaa !80
  %call6 = tail call i32 %6(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.23, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  tail call void %6() #15
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 3
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_free, align 4, !tbaa !81
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #15
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.22.24, i32 0, i32 0)) #15
  tail call void @abort() #15
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
  %call = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %0) #16
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.25, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.26, i32 0, i32 0)) #15
  br label %cleanup14

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #15
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_and_host_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 8
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_malloc, align 4, !tbaa !82
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #15
  %cmp11.not = icmp eq i32 %call9, 0
  br i1 %cmp11.not, label %cleanup14, label %if.then12

if.then12:                                        ; preds = %if.end7
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26, i32 0, i32 0)) #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  tail call void %6() #15
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_and_host_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 9
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_free, align 4, !tbaa !83
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #15
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.28, i32 0, i32 0)) #15
  tail call void @abort() #15
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
  tail call void @halide_free(i8* %user_context, i8* nonnull %12) #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  %call2 = tail call i8* @halide_malloc(i8* %user_context, i32 %mul.i) #15
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  store i8* %call2, i8** %host, align 4, !tbaa !43
  %cmp4 = icmp eq i8* %call2, null
  br i1 %cmp4, label %cleanup13, label %if.end6

if.end6:                                          ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %call7 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* %device_interface) #16
  %cmp8.not = icmp eq i32 %call7, 0
  br i1 %cmp8.not, label %cleanup13, label %if.then9

if.then9:                                         ; preds = %if.end6
  %21 = load i8*, i8** %host, align 4, !tbaa !43
  tail call void @halide_free(i8* %user_context, i8* %21) #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  br label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) #16
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %if.end16.i.split
  %phi.call = phi i32 [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 2
  %4 = load i8*, i8** %host, align 4, !tbaa !43
  %tobool.not = icmp eq i8* %4, null
  br i1 %tobool.not, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @halide_free(i8* %user_context, i8* nonnull %4) #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32, i32 0, i32 0)) #15
  br label %cleanup12

if.end5:                                          ; preds = %if.end
  %device_interface1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #15
  store %struct.halide_device_interface_t* %device_interface, %struct.halide_device_interface_t** %device_interface1, align 8, !tbaa !42
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %wrap_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 14
  %8 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %wrap_native, align 4, !tbaa !88
  %call8 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, i64 %handle) #15
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  tail call void %6() #15
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %detach_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i32 0, i32 15
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %detach_native, align 4, !tbaa !89
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i32 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %10() #15
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !40
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.34, i32 0, i32 0)) #15
  tail call void @abort() #15
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
  tail call void %3() #15
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.35, i32 0, i32 0)) #15
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
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #15
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !44
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #15
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
  tail call void %7() #15
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
  %call = tail call i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %0) #16
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.41, i32 0, i32 0)) #15
  br label %cleanup143

land.lhs.true5:                                   ; preds = %land.lhs.true
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 0
  %1 = load i64, i64* %device, align 8, !tbaa !40
  %tobool6.not = icmp eq i64 %1, 0
  br i1 %tobool6.not, label %if.then7, label %if.end13

if.then7:                                         ; preds = %land.lhs.true5
  %call = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #16
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
  %call48 = tail call i32 %12(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #15
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
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %c, %struct.halide_buffer_t* nonnull %src, i1 zeroext true, %struct.halide_buffer_t* nonnull %dst, i1 zeroext true) #16
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %c, i8* %user_context) #16
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
  %call72 = tail call i32 %16(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #15
  %cmp73 = icmp eq i32 %call72, -42
  br i1 %cmp73, label %if.then74, label %if.end117

if.then74:                                        ; preds = %if.then66
  %call75 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #16
  %tobool76.not = icmp eq i32 %call75, 0
  br i1 %tobool76.not, label %if.then77, label %cleanup143

if.then77:                                        ; preds = %if.then74
  %call78 = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #16
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
  %call93 = tail call i32 %19(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #15
  %cmp94 = icmp eq i32 %call93, 0
  br i1 %cmp94, label %if.then95, label %cleanup143

if.then95:                                        ; preds = %if.then85
  %flags.i.i245 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 3
  %20 = load i64, i64* %flags.i.i245, align 8, !tbaa !44
  %or.i.i246 = or i64 %20, 1
  store i64 %or.i.i246, i64* %flags.i.i245, align 8, !tbaa !44
  %call96 = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* %dst_device_interface) #16
  br label %if.end117

if.else98:                                        ; preds = %if.else81
  br i1 %tobool.not, label %cleanup143, label %if.then100

if.then100:                                       ; preds = %if.else98
  %call103 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #16
  %cmp104 = icmp eq i32 %call103, 0
  br i1 %cmp104, label %if.then105, label %cleanup143

if.then105:                                       ; preds = %if.then100
  %impl106 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %21 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl106, align 4, !tbaa !71
  %buffer_copy107 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %21, i32 0, i32 10
  %22 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy107, align 4, !tbaa !90
  %call108 = tail call i32 %22(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #15
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  %tobool.not = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i32 0, i32 0
  %1 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %1() #15
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
  tail call void %4() #15
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end
  %call = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) #16
  br i1 %tobool.not, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.end16
  %impl19 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl19, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 1
  %6 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %6() #15
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
  tail call void %9() #15
  br label %if.end27

if.end27:                                         ; preds = %if.then23, %if.end20
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #15
  ret i32 -40
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i32 0, i32 0)) #15
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #15
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !45
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i32 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !45
  %cmp.not = icmp eq i32 %2, %3
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i32 0, i32 0)) #15
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #15
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !71
  %device_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 11
  %9 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %device_crop, align 4, !tbaa !91
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_buffer_t* nonnull %dst) #15
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0)) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i32 0, i32 0)) #15
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i32 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i32 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i32 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 4, !tbaa !77
  tail call void %6() #15
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i32 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 4, !tbaa !71
  %device_slice = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i32 0, i32 12
  %9 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %device_slice, align 4, !tbaa !92
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* nonnull %dst) #15
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
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
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i32 0, i32 0)) #15
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i32 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i32 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %device_release_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i32 0, i32 13
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_release_crop, align 4, !tbaa !93
  %call = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #15
  store i64 0, i64* %device, align 8, !tbaa !40
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 4, !tbaa !71
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i32 0, i32 1
  %5 = load void ()*, void ()** %release_module, align 4, !tbaa !79
  tail call void %5() #15
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !42
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #15
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
  %call = tail call float @halide_float16_bits_to_float(i16 zeroext %bits) #16
  %conv = fpext float %call to double
  ret double %conv
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #15
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.37, i32 0, i32 0)) #15
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i16 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.38, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.38, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #15
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.37, i32 0, i32 0)) #15
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i16 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %min_bound, i32 %max_bound, i32 %min_required, i32 %max_required) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i151 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.39, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i152 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.39, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i151, %entry.split ], [ %call.i152, %if.then6.i ]
  %ref.tmp.sroa.34.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.34.0, i8* %var_name) #15
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.40, i32 0, i32 0)) #15
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.34.0, i8* %func_name) #15
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.41, i32 0, i32 0)) #15
  %conv.i = sext i32 %min_bound to i64
  %call.i30 = tail call i8* @halide_int64_to_string(i8* %call.i27, i8* %ref.tmp.sroa.34.0, i64 %conv.i, i32 1) #15
  %call.i33 = tail call i8* @halide_string_to_string(i8* %call.i30, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #15
  %conv.i36 = sext i32 %max_bound to i64
  %call.i37 = tail call i8* @halide_int64_to_string(i8* %call.i33, i8* %ref.tmp.sroa.34.0, i64 %conv.i36, i32 1) #15
  %call.i40 = tail call i8* @halide_string_to_string(i8* %call.i37, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.43, i32 0, i32 0)) #15
  %conv.i43 = sext i32 %min_required to i64
  %call.i44 = tail call i8* @halide_int64_to_string(i8* %call.i40, i8* %ref.tmp.sroa.34.0, i64 %conv.i43, i32 1) #15
  %call.i47 = tail call i8* @halide_string_to_string(i8* %call.i44, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #15
  %conv.i50 = sext i32 %max_required to i64
  %call.i51 = tail call i8* @halide_int64_to_string(i8* %call.i47, i8* %ref.tmp.sroa.34.0, i64 %conv.i50, i32 1) #15
  %call.i54 = tail call i8* @halide_string_to_string(i8* %call.i51, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i54 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
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
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %2, i32 4) #15
  %3 = bitcast i32* %type_given_bits.addr to i8*
  %call1 = call i8* @memcpy(i8* nonnull %1, i8* nonnull %3, i32 4) #15
  %call.i = call i8* @malloc(i32 1024) #15
  %tobool.not.i12 = icmp eq i8* %call.i, null
  br i1 %tobool.not.i12, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i151 = call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i152 = call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i151, %entry.split ], [ %call.i152, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i18 = call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.45, i32 0, i32 0)) #15
  %call.i21 = call i8* @halide_type_to_string(i8* %call.i18, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %correct_type) #15
  %call.i24 = call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.46, i32 0, i32 0)) #15
  %call.i27 = call i8* @halide_type_to_string(i8* %call.i24, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %type_given) #15
  br i1 %tobool.not.i12, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i27 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  call void @free(i8* %call.i) #15
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %user_context, i8* %func_name, i32 %dimensions_given, i32 %correct_dimensions) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.47, i32 0, i32 0)) #15
  %conv.i = sext i32 %correct_dimensions to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #15
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.48, i32 0, i32 0)) #15
  %conv.i20 = sext i32 %dimensions_given to i64
  %call.i21 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i64 %conv.i20, i32 1) #15
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.49, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i24 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %user_context, i8* %func_name, i32 %dimension, i32 %min_touched, i32 %max_touched, i32 %min_valid, i32 %max_valid) local_unnamed_addr #4 {
entry:
  %cmp = icmp slt i32 %min_touched, %min_valid
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i271 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i272 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then.split, %if.then6.i
  %phi.call = phi i8* [ %call.i271, %if.then.split ], [ %call.i272, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i30 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.50, i32 0, i32 0)) #15
  %conv.i = sext i32 %min_touched to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i30, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #15
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.51, i32 0, i32 0)) #15
  %conv.i39 = sext i32 %min_valid to i64
  %call.i40 = tail call i8* @halide_int64_to_string(i8* %call.i36, i8* %ref.tmp.sroa.22.0, i64 %conv.i39, i32 1) #15
  %call.i43 = tail call i8* @halide_string_to_string(i8* %call.i40, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.52, i32 0, i32 0)) #15
  %conv.i46 = sext i32 %dimension to i64
  %call.i47 = tail call i8* @halide_int64_to_string(i8* %call.i43, i8* %ref.tmp.sroa.22.0, i64 %conv.i46, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %if.end17.sink.split

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i47 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %if.end17.sink.split

if.else:                                          ; preds = %entry
  %cmp7 = icmp sgt i32 %max_touched, %max_valid
  br i1 %cmp7, label %if.then8, label %if.end17

if.then8:                                         ; preds = %if.else
  %call.i53 = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i56 = icmp eq i8* %call.i53, null
  br i1 %tobool.not.i56, label %if.then8.split, label %if.then6.i59

if.then8.split:                                   ; preds = %if.then8
  %call.i653 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

if.then6.i59:                                     ; preds = %if.then8
  %add.ptr.i57 = getelementptr inbounds i8, i8* %call.i53, i32 1023
  store i8 0, i8* %add.ptr.i57, align 1, !tbaa !22
  %call.i654 = tail call i8* @halide_string_to_string(i8* nonnull %call.i53, i8* nonnull %add.ptr.i57, i8* %func_name) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62: ; preds = %if.then8.split, %if.then6.i59
  %phi.call5 = phi i8* [ %call.i653, %if.then8.split ], [ %call.i654, %if.then6.i59 ]
  %ref.tmp9.sroa.22.0 = phi i8* [ null, %if.then8.split ], [ %add.ptr.i57, %if.then6.i59 ]
  %call.i68 = tail call i8* @halide_string_to_string(i8* %phi.call5, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.50, i32 0, i32 0)) #15
  %conv.i71 = sext i32 %max_touched to i64
  %call.i72 = tail call i8* @halide_int64_to_string(i8* %call.i68, i8* %ref.tmp9.sroa.22.0, i64 %conv.i71, i32 1) #15
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i72, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.53, i32 0, i32 0)) #15
  %conv.i78 = sext i32 %max_valid to i64
  %call.i79 = tail call i8* @halide_int64_to_string(i8* %call.i75, i8* %ref.tmp9.sroa.22.0, i64 %conv.i78, i32 1) #15
  %call.i82 = tail call i8* @halide_string_to_string(i8* %call.i79, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.52, i32 0, i32 0)) #15
  %conv.i85 = sext i32 %dimension to i64
  %call.i86 = tail call i8* @halide_int64_to_string(i8* %call.i82, i8* %ref.tmp9.sroa.22.0, i64 %conv.i85, i32 1) #15
  br i1 %tobool.not.i56, label %if.then.i90, label %if.else.i101

if.then.i90:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %if.end17.sink.split

if.else.i101:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
  %sub.ptr.lhs.cast.i.i95 = ptrtoint i8* %call.i86 to i32
  %sub.ptr.rhs.cast.i.i96 = ptrtoint i8* %call.i53 to i32
  %sub.ptr.sub.i.i97 = sub i32 1, %sub.ptr.rhs.cast.i.i96
  %add.i.i98 = add i32 %sub.ptr.sub.i.i97, %sub.ptr.lhs.cast.i.i95
  %conv.i.i99 = sext i32 %add.i.i98 to i64
  %call.i.i100 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i53, i64 %conv.i.i99) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i53) #15
  br label %if.end17.sink.split

if.end17.sink.split:                              ; preds = %if.else.i101, %if.then.i90, %if.else.i, %if.then.i
  %call.i53.sink = phi i8* [ %call.i, %if.else.i ], [ null, %if.then.i ], [ %call.i53, %if.else.i101 ], [ null, %if.then.i90 ]
  tail call void @free(i8* %call.i53.sink) #15
  br label %if.end17

if.end17:                                         ; preds = %if.end17.sink.split, %if.else
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %user_context, i8* %buffer_name, i64 %allocation_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.54, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.54, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %allocation_size, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.56, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.57, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.57, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %buffer_name) #15
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.58, i32 0, i32 0)) #15
  %conv.i = sext i32 %dimension to i64
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #15
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.59, i32 0, i32 0)) #15
  %conv.i24 = sext i32 %extent to i64
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i64 %conv.i24, i32 1) #15
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i28 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %user_context, i8* %buffer_name, i64 %actual_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.60, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.60, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %actual_size, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.56, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %constrained_min, i32 %constrained_extent, i32 %required_min, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %add = add i32 %required_min, -1
  %sub = add i32 %add, %required_extent
  %add1 = add i32 %constrained_min, -1
  %sub2 = add i32 %add1, %constrained_extent
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i231 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.61, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i232 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.61, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i231, %entry.split ], [ %call.i232, %if.then6.i ]
  %ref.tmp.sroa.38.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i26 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.38.0, i8* %buffer_name) #15
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.62, i32 0, i32 0)) #15
  %conv.i = sext i32 %dimension to i64
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.38.0, i64 %conv.i, i32 1) #15
  %call.i35 = tail call i8* @halide_string_to_string(i8* %call.i32, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.63, i32 0, i32 0)) #15
  %call.i38 = tail call i8* @halide_string_to_string(i8* %call.i35, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.64, i32 0, i32 0)) #15
  %conv.i41 = sext i32 %required_min to i64
  %call.i42 = tail call i8* @halide_int64_to_string(i8* %call.i38, i8* %ref.tmp.sroa.38.0, i64 %conv.i41, i32 1) #15
  %call.i45 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #15
  %conv.i48 = sext i32 %sub to i64
  %call.i49 = tail call i8* @halide_int64_to_string(i8* %call.i45, i8* %ref.tmp.sroa.38.0, i64 %conv.i48, i32 1) #15
  %call.i52 = tail call i8* @halide_string_to_string(i8* %call.i49, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.63, i32 0, i32 0)) #15
  %call.i55 = tail call i8* @halide_string_to_string(i8* %call.i52, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.65, i32 0, i32 0)) #15
  %conv.i58 = sext i32 %constrained_min to i64
  %call.i59 = tail call i8* @halide_int64_to_string(i8* %call.i55, i8* %ref.tmp.sroa.38.0, i64 %conv.i58, i32 1) #15
  %call.i62 = tail call i8* @halide_string_to_string(i8* %call.i59, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.42, i32 0, i32 0)) #15
  %conv.i65 = sext i32 %sub2 to i64
  %call.i66 = tail call i8* @halide_int64_to_string(i8* %call.i62, i8* %ref.tmp.sroa.38.0, i64 %conv.i65, i32 1) #15
  %call.i69 = tail call i8* @halide_string_to_string(i8* %call.i66, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i69 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %user_context, i8* %var, i32 %val, i8* %constrained_var, i32 %constrained_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.67, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.67, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i8* %var) #15
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #15
  %conv.i = sext i32 %val to i64
  %call.i20 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #15
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.69, i32 0, i32 0)) #15
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %constrained_var) #15
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #15
  %conv.i32 = sext i32 %constrained_val to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #15
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.44, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i36 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %user_context, i8* %param_name, double %val, double %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.71, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %min_val, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %user_context, i8* %param_name, double %val, double %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.70, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.55, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.72, i32 0, i32 0)) #15
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %max_val, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -10
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_error_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.37, i32 0, i32 0)) #15
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %user_context, i8* %buffer_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %buffer_name) #15
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %user_context, i8* %func, i8* %filename, i32 %error_code) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %func) #15
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41.73, i32 0, i32 0)) #15
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* %filename) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42, i32 0, i32 0)) #15
  %conv.i = sext i32 %error_code to i64
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %user_context, i8* %func, i32 %alignment) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* %func) #15
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i32 0, i32 0)) #15
  %conv.i = sext i32 %alignment to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.18.0, i64 %conv.i, i32 1) #15
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.45, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i19 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_dirty_with_no_device_support(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %func) #15
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.47, i32 0, i32 0)) #15
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.48, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i15 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -44
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %func) #15
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %user_context, i8* %func_name, i8* %var_name, i8* %loop_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %var_name) #15
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #15
  %call.i18 = tail call i8* @halide_string_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i8* %func_name) #15
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i32 0, i32 0)) #15
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i8* %loop_name) #15
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i27 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
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
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i521 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i522 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then.split, %if.then6.i
  %phi.call = phi i8* [ %call.i521, %if.then.split ], [ %call.i522, %if.then6.i ]
  %ref.tmp.sroa.36.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %dim to i64
  %call.i55 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.36.0, i64 %conv.i, i32 1) #15
  %call.i58 = tail call i8* @halide_string_to_string(i8* %call.i55, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #15
  %call.i61 = tail call i8* @halide_string_to_string(i8* %call.i58, i8* %ref.tmp.sroa.36.0, i8* %func_name) #15
  %call.i64 = tail call i8* @halide_string_to_string(i8* %call.i61, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #15
  %conv.i67 = sext i32 %min to i64
  %call.i68 = tail call i8* @halide_int64_to_string(i8* %call.i64, i8* %ref.tmp.sroa.36.0, i64 %conv.i67, i32 1) #15
  %call.i71 = tail call i8* @halide_string_to_string(i8* %call.i68, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %add9 = add nsw i32 %extent, %min
  %sub = add nsw i32 %add9, -1
  %conv.i74 = sext i32 %sub to i64
  %call.i75 = tail call i8* @halide_int64_to_string(i8* %call.i71, i8* %ref.tmp.sroa.36.0, i64 %conv.i74, i32 1) #15
  %call.i78 = tail call i8* @halide_string_to_string(i8* %call.i75, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #15
  %call.i81 = tail call i8* @halide_string_to_string(i8* %call.i78, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57, i32 0, i32 0)) #15
  %conv.i84 = sext i32 %valid_min to i64
  %call.i85 = tail call i8* @halide_int64_to_string(i8* %call.i81, i8* %ref.tmp.sroa.36.0, i64 %conv.i84, i32 1) #15
  %call.i88 = tail call i8* @halide_string_to_string(i8* %call.i85, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %add15 = add nsw i32 %fold_factor, %valid_min
  %sub16 = add nsw i32 %add15, -1
  %conv.i91 = sext i32 %sub16 to i64
  %call.i92 = tail call i8* @halide_int64_to_string(i8* %call.i88, i8* %ref.tmp.sroa.36.0, i64 %conv.i91, i32 1) #15
  %call.i95 = tail call i8* @halide_string_to_string(i8* %call.i92, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.74, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %if.end

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i95 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %call.i101 = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i104 = icmp eq i8* %call.i101, null
  br i1 %tobool.not.i104, label %if.else.split, label %if.then6.i107

if.else.split:                                    ; preds = %if.else
  %call.i1133 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

if.then6.i107:                                    ; preds = %if.else
  %add.ptr.i105 = getelementptr inbounds i8, i8* %call.i101, i32 1023
  store i8 0, i8* %add.ptr.i105, align 1, !tbaa !22
  %call.i1134 = tail call i8* @halide_string_to_string(i8* nonnull %call.i101, i8* nonnull %add.ptr.i105, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110: ; preds = %if.else.split, %if.then6.i107
  %phi.call5 = phi i8* [ %call.i1133, %if.else.split ], [ %call.i1134, %if.then6.i107 ]
  %ref.tmp19.sroa.34.0 = phi i8* [ null, %if.else.split ], [ %add.ptr.i105, %if.then6.i107 ]
  %conv.i116 = sext i32 %dim to i64
  %call.i117 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %ref.tmp19.sroa.34.0, i64 %conv.i116, i32 1) #15
  %call.i120 = tail call i8* @halide_string_to_string(i8* %call.i117, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #15
  %call.i123 = tail call i8* @halide_string_to_string(i8* %call.i120, i8* %ref.tmp19.sroa.34.0, i8* %func_name) #15
  %call.i126 = tail call i8* @halide_string_to_string(i8* %call.i123, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i32 0, i32 0)) #15
  %conv.i129 = sext i32 %min to i64
  %call.i130 = tail call i8* @halide_int64_to_string(i8* %call.i126, i8* %ref.tmp19.sroa.34.0, i64 %conv.i129, i32 1) #15
  %call.i133 = tail call i8* @halide_string_to_string(i8* %call.i130, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)) #15
  %sub28 = add nsw i32 %add, -1
  %conv.i136 = sext i32 %sub28 to i64
  %call.i137 = tail call i8* @halide_int64_to_string(i8* %call.i133, i8* %ref.tmp19.sroa.34.0, i64 %conv.i136, i32 1) #15
  %call.i140 = tail call i8* @halide_string_to_string(i8* %call.i137, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i32 0, i32 0)) #15
  %call.i143 = tail call i8* @halide_string_to_string(i8* %call.i140, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.75, i32 0, i32 0)) #15
  %call.i146 = tail call i8* @halide_string_to_string(i8* %call.i143, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.76, i32 0, i32 0)) #15
  %conv.i149 = sext i32 %fold_factor to i64
  %call.i150 = tail call i8* @halide_int64_to_string(i8* %call.i146, i8* %ref.tmp19.sroa.34.0, i64 %conv.i149, i32 1) #15
  %call.i153 = tail call i8* @halide_string_to_string(i8* %call.i150, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.66, i32 0, i32 0)) #15
  br i1 %tobool.not.i104, label %if.then.i157, label %if.else.i168

if.then.i157:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %if.end

if.else.i168:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
  %sub.ptr.lhs.cast.i.i162 = ptrtoint i8* %call.i153 to i32
  %sub.ptr.rhs.cast.i.i163 = ptrtoint i8* %call.i101 to i32
  %sub.ptr.sub.i.i164 = sub i32 1, %sub.ptr.rhs.cast.i.i163
  %add.i.i165 = add i32 %sub.ptr.sub.i.i164, %sub.ptr.lhs.cast.i.i162
  %conv.i.i166 = sext i32 %add.i.i165 to i64
  %call.i.i167 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i101, i64 %conv.i.i166) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i101) #15
  br label %if.end

if.end:                                           ; preds = %if.else.i168, %if.then.i157, %if.else.i, %if.then.i
  %call.i101.sink = phi i8* [ %call.i, %if.else.i ], [ null, %if.then.i ], [ %call.i101, %if.else.i168 ], [ null, %if.then.i157 ]
  tail call void @free(i8* %call.i101.sink) #15
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %fold_factor, i8* %loop_name, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i131 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.77, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i132 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.77, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i131, %entry.split ], [ %call.i132, %if.then6.i ]
  %ref.tmp.sroa.30.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %fold_factor to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.30.0, i64 %conv.i, i32 1) #15
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i32 0, i32 0)) #15
  %call.i22 = tail call i8* @halide_string_to_string(i8* %call.i19, i8* %ref.tmp.sroa.30.0, i8* %var_name) #15
  %call.i25 = tail call i8* @halide_string_to_string(i8* %call.i22, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #15
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.30.0, i8* %func_name) #15
  %call.i31 = tail call i8* @halide_string_to_string(i8* %call.i28, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i32 0, i32 0)) #15
  %call.i34 = tail call i8* @halide_string_to_string(i8* %call.i31, i8* %ref.tmp.sroa.30.0, i8* %loop_name) #15
  %call.i37 = tail call i8* @halide_string_to_string(i8* %call.i34, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.68, i32 0, i32 0)) #15
  %conv.i40 = sext i32 %required_extent to i64
  %call.i41 = tail call i8* @halide_int64_to_string(i8* %call.i37, i8* %ref.tmp.sroa.30.0, i64 %conv.i40, i32 1) #15
  %call.i44 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.78, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i44 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %user_context, i8* %condition, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %condition) #15
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0)) #15
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* %message) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i15 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %user_context, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i41 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #15
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* null, i8* %message) #15
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i42 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i32 0, i32 0)) #15
  %call.i7 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* nonnull %add.ptr.i, i8* %message) #15
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i7 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #15
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i32 0, i32 0)) #15
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #15
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i32 0, i32 0)) #15
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #15
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i32 0, i32 0)) #15
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %user_context, i8* %routine) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %routine) #15
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -38
}

; Function Attrs: nounwind
define weak i32 @halide_error_storage_bound_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %provided_size, i32 %required_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %provided_size to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #15
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i32 0, i32 0)) #15
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i8* %var_name) #15
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)) #15
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %func_name) #15
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.74, i32 0, i32 0)) #15
  %conv.i32 = sext i32 %required_size to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #15
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.78, i32 0, i32 0)) #15
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i36 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
  ret i32 -45
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_crop_failed(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i32 0, i32 0)) #15
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i32 0, i32 0)) #15
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #15
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
  %call = tail call i32 @qurt_hvx_lock(i32 1) #15
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i17 = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i19 = icmp eq i8* %call.i17, null
  br i1 %tobool.not.i19, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call.i30 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.91, i32 0, i32 0)) #15
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i17, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i17, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.91, i32 0, i32 0)) #15
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i17 to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i17, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i17) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i17) #15
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_lock(i32) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_qurt_hvx_unlock(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call = tail call i32 @qurt_hvx_unlock() #15
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %cleanup, label %if.then

if.then:                                          ; preds = %entry
  %call.i13 = tail call i8* @malloc(i32 1024) #15
  %tobool.not.i15 = icmp eq i8* %call.i13, null
  br i1 %tobool.not.i15, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.then
  %call.i26 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.93, i32 0, i32 0)) #15
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7.92, i32 0, i32 0)) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i13, i32 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !22
  %call.i = tail call i8* @halide_string_to_string(i8* nonnull %call.i13, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6.93, i32 0, i32 0)) #15
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i to i32
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i13 to i32
  %sub.ptr.sub.i.i = sub i32 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i32 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %conv.i.i = sext i32 %add.i.i to i64
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i13, i64 %conv.i.i) #15
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i13) #15
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i13) #15
  br label %cleanup

cleanup:                                          ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit, %entry
  %retval.0 = phi i32 [ -1, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @qurt_hvx_unlock() local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_qurt_hvx_unlock_as_destructor(i8* %user_context, i8* %0) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @halide_qurt_hvx_unlock(i8* %user_context) #16
  ret void
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32>, <32 x i32>, i32) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32>, <32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind mustprogress
define weak i8* @halide_vtcm_malloc(i8* %user_context, i32 %size) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @HAP_request_VTCM(i32 %size, i32 1) #15
  ret i8* %call
}

declare i8* @HAP_request_VTCM(i32, i32) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_vtcm_free(i8* %user_context, i8* %addr) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @HAP_release_VTCM(i8* %addr) #15
  ret void
}

declare i32 @HAP_release_VTCM(i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_default_can_use_target_features(i32 %count, i64* %features) #4 {
entry:
  %tmp = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #15
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18, !range !21
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #11
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %tmp) #15
  %call = call i8* @memcpy(i8* bitcast ([4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE to i8*), i8* nonnull %1, i32 32) #15
  store i8 1, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #15
  %cmp.not = icmp eq i32 %count, 2
  br i1 %cmp.not, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.94, i32 0, i32 0)) #15
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
  %call = tail call i32 %0(i32 %count, i64* %features) #15
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
declare <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32>, <64 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32>, <32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32>, <32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32>, <32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind
define i32 @mul_hvx128(%struct.halide_buffer_t* noalias nocapture readonly %input1.buffer, i8 %input1_zero, %struct.halide_buffer_t* noalias nocapture readonly %input2.buffer, i8 %input2_zero, i8 %output_zero, i32 %output_multiplier, i32 %a113, i8 %output_min, i8 %output_max, %struct.halide_buffer_t* noalias nocapture readonly %output.buffer) local_unnamed_addr #10 {
entry:
  %hvx_lock_result = tail call i32 @halide_qurt_hvx_lock(i8* null) #11
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input1.buffer, i32 0, i32 2
  %0 = load i8*, i8** %host.i, align 4, !tbaa !43
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input1.buffer, i32 0, i32 6
  %1 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !46
  %min.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 0, i32 0
  %2 = load i32, i32* %min.i, align 4, !tbaa !47
  %min.i175 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 1, i32 0
  %3 = load i32, i32* %min.i175, align 4, !tbaa !47
  %stride.i177 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i32 1, i32 2
  %4 = load i32, i32* %stride.i177, align 4, !tbaa !50
  %host.i178 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input2.buffer, i32 0, i32 2
  %5 = load i8*, i8** %host.i178, align 4, !tbaa !43
  %dim.i179 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input2.buffer, i32 0, i32 6
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i179, align 8, !tbaa !46
  %min.i180 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 0, i32 0
  %7 = load i32, i32* %min.i180, align 4, !tbaa !47
  %stride.i182 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 0, i32 2
  %8 = load i32, i32* %stride.i182, align 4, !tbaa !50
  %min.i184 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 1, i32 0
  %9 = load i32, i32* %min.i184, align 4, !tbaa !47
  %stride.i186 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 1, i32 2
  %10 = load i32, i32* %stride.i186, align 4, !tbaa !50
  %host.i187 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 2
  %11 = load i8*, i8** %host.i187, align 4, !tbaa !43
  %dim.i188 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 6
  %12 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i188, align 8, !tbaa !46
  %min.i189 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 0, i32 0
  %13 = load i32, i32* %min.i189, align 4, !tbaa !47
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 0, i32 1
  %14 = load i32, i32* %extent.i, align 4, !tbaa !49
  %min.i194 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 1, i32 0
  %15 = load i32, i32* %min.i194, align 4, !tbaa !47
  %extent.i196 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 1, i32 1
  %16 = load i32, i32* %extent.i196, align 4, !tbaa !49
  %stride.i198 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i32 1, i32 2
  %17 = load i32, i32* %stride.i198, align 4, !tbaa !50
  switch i32 %8, label %call_destructor.exit [
    i32 1, label %case_1_bb
    i32 0, label %case_0_bb
  ]

call_destructor.exit:                             ; preds = %"end for output.s0.x.x.rebased103", %"end for output.s0.x.x.rebased", %case_0_bb, %case_1_bb, %entry
  tail call void @halide_qurt_hvx_unlock_as_destructor(i8* null, i8* nonnull inttoptr (i32 1 to i8*)) #15
  ret i32 0

case_1_bb:                                        ; preds = %entry
  %18 = add nsw i32 %14, 127
  %19 = ashr i32 %18, 7
  %a0 = ashr i32 %14, 7
  %20 = icmp sgt i32 %14, 127
  %21 = select i1 %20, i32 %a0, i32 0
  %t58 = sub nsw i32 %19, %21
  %22 = icmp sgt i32 %16, 0
  br i1 %22, label %"for output.s0.y.rebased.preheader", label %call_destructor.exit, !prof !95

"for output.s0.y.rebased.preheader":              ; preds = %case_1_bb
  %23 = mul nsw i32 %4, %3
  %t54.s = sub nsw i32 %13, %23
  %24 = mul nsw i32 %10, %9
  %t55.s = sub nsw i32 %13, %24
  %25 = sub i32 %t54.s, %2
  %26 = zext i8 %input1_zero to i16
  %27 = mul nsw i16 %26, -64
  %28 = insertelement <128 x i16> undef, i16 %27, i32 0
  %29 = shufflevector <128 x i16> %28, <128 x i16> undef, <128 x i32> zeroinitializer
  %30 = sub i32 %t55.s, %7
  %31 = zext i8 %input2_zero to i16
  %32 = mul nsw i16 %31, -64
  %33 = insertelement <128 x i16> undef, i16 %32, i32 0
  %34 = shufflevector <128 x i16> %33, <128 x i16> undef, <128 x i32> zeroinitializer
  %35 = icmp ult i32 %a113, 15
  %36 = select i1 %35, i32 %a113, i32 15
  %.not171 = icmp eq i32 %36, 0
  %37 = select i1 %.not171, <32 x i32> zeroinitializer, <32 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %38 = add nsw i32 %36, -1
  %39 = zext i8 %output_zero to i16
  %40 = insertelement <64 x i16> undef, i16 %39, i32 0
  %41 = shufflevector <64 x i16> %40, <64 x i16> undef, <64 x i32> zeroinitializer
  %42 = insertelement <128 x i8> undef, i8 %output_max, i32 0
  %43 = shufflevector <128 x i8> %42, <128 x i8> undef, <128 x i32> zeroinitializer
  %44 = insertelement <128 x i8> undef, i8 %output_min, i32 0
  %45 = shufflevector <128 x i8> %44, <128 x i8> undef, <128 x i32> zeroinitializer
  %46 = bitcast <64 x i16> %41 to <32 x i32>
  %47 = bitcast <128 x i16> %29 to <64 x i32>
  %48 = bitcast <128 x i16> %34 to <64 x i32>
  %49 = bitcast <128 x i8> %43 to <32 x i32>
  %50 = bitcast <128 x i8> %45 to <32 x i32>
  %51 = icmp sgt i32 %t58, 0
  %52 = add i32 %13, 1
  %53 = add nsw i32 %14, %13
  %54 = insertelement <128 x i32> undef, i32 %53, i32 0
  %55 = shufflevector <128 x i32> %54, <128 x i32> undef, <128 x i32> zeroinitializer
  br label %"for output.s0.y.rebased"

"for output.s0.y.rebased":                        ; preds = %"for output.s0.y.rebased.preheader", %"end for output.s0.x.x.rebased"
  %output.s0.y.rebased = phi i32 [ %174, %"end for output.s0.x.x.rebased" ], [ 0, %"for output.s0.y.rebased.preheader" ]
  br i1 %20, label %"for output.s0.x.x.preheader", label %"end for output.s0.x.x", !prof !95

"for output.s0.x.x.preheader":                    ; preds = %"for output.s0.y.rebased"
  %56 = add nsw i32 %output.s0.y.rebased, %15
  %57 = mul nsw i32 %56, %4
  %58 = add nsw i32 %25, %57
  %59 = mul nsw i32 %56, %10
  %60 = add nsw i32 %30, %59
  %61 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %46, <32 x i32> %46) #11
  %62 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %36) #11
  %63 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %47) #11
  %64 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %48) #11
  %65 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %output_multiplier) #11
  %66 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %38) #11
  %67 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %47) #11
  %68 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %48) #11
  %69 = mul nsw i32 %output.s0.y.rebased, %17
  br label %"for output.s0.x.x"

"for output.s0.x.x":                              ; preds = %"for output.s0.x.x.preheader", %"for output.s0.x.x"
  %output.s0.x.x = phi i32 [ %164, %"for output.s0.x.x" ], [ 0, %"for output.s0.x.x.preheader" ]
  %70 = shl nsw i32 %output.s0.x.x, 7
  %71 = add nsw i32 %58, %70
  %72 = getelementptr inbounds i8, i8* %0, i32 %71
  %73 = bitcast i8* %72 to <32 x i32>*
  %74 = load <32 x i32>, <32 x i32>* %73, align 1, !tbaa !96
  %75 = add nsw i32 %60, %70
  %76 = getelementptr inbounds i8, i8* %5, i32 %75
  %77 = bitcast i8* %76 to <32 x i32>*
  %78 = load <32 x i32>, <32 x i32>* %77, align 1, !tbaa !99
  %79 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %74) #11
  %80 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %79) #11
  %81 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %63, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %80) #11
  %82 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %81) #11
  %83 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %78) #11
  %84 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %83) #11
  %85 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %64, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %84) #11
  %86 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %85) #11
  %87 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %82, <32 x i32> %86) #11
  %88 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %87) #11
  %89 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %88, <32 x i32> %65) #11
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %89, <32 x i32> %88, <32 x i32> %65) #11
  %91 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %90, <32 x i32> %62) #11
  %92 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %78) #11
  %93 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %92) #11
  %94 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %93, <64 x i32> %48) #11
  %95 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %94) #11
  %96 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %95) #11
  %97 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %74) #11
  %98 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %97) #11
  %99 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %98, <64 x i32> %47) #11
  %100 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %99) #11
  %101 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %100) #11
  %102 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %96, <32 x i32> %101) #11
  %103 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %102) #11
  %104 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %103, <32 x i32> %65) #11
  %105 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %104, <32 x i32> %103, <32 x i32> %65) #11
  %106 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %66) #11
  %107 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %106, <32 x i32> %37) #11
  %108 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %91, <32 x i32> %107) #11
  %109 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %87) #11
  %110 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %109, <32 x i32> %65) #11
  %111 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %110, <32 x i32> %109, <32 x i32> %65) #11
  %112 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %111, <32 x i32> %62) #11
  %113 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %102) #11
  %114 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %113, <32 x i32> %65) #11
  %115 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %114, <32 x i32> %113, <32 x i32> %65) #11
  %116 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %115, <32 x i32> %66) #11
  %117 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %116, <32 x i32> %37) #11
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %112, <32 x i32> %117) #11
  %119 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %108, <32 x i32> %118) #11
  %120 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %79) #11
  %121 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %67, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %120) #11
  %122 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %121) #11
  %123 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %83) #11
  %124 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %68, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %123) #11
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %124) #11
  %126 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %122, <32 x i32> %125) #11
  %127 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %126) #11
  %128 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %127, <32 x i32> %65) #11
  %129 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %128, <32 x i32> %127, <32 x i32> %65) #11
  %130 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %62) #11
  %131 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %99) #11
  %132 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %131) #11
  %133 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %48, <64 x i32> %93) #11
  %134 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %133) #11
  %135 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %134) #11
  %136 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %132, <32 x i32> %135) #11
  %137 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %136) #11
  %138 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %137, <32 x i32> %65) #11
  %139 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %138, <32 x i32> %137, <32 x i32> %65) #11
  %140 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %139, <32 x i32> %66) #11
  %141 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %140, <32 x i32> %37) #11
  %142 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %130, <32 x i32> %141) #11
  %143 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %126) #11
  %144 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %143, <32 x i32> %65) #11
  %145 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %144, <32 x i32> %143, <32 x i32> %65) #11
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %145, <32 x i32> %62) #11
  %147 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %136) #11
  %148 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %147, <32 x i32> %65) #11
  %149 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %148, <32 x i32> %147, <32 x i32> %65) #11
  %150 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %149, <32 x i32> %66) #11
  %151 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %150, <32 x i32> %37) #11
  %152 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %146, <32 x i32> %151) #11
  %153 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %142, <32 x i32> %152) #11
  %154 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %119, <32 x i32> %153) #11
  %155 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %61, <64 x i32> %154) #11
  %156 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %155) #11
  %157 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %155) #11
  %158 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %156, <32 x i32> %157) #11
  %159 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %158, <32 x i32> %49) #11
  %160 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %50, <32 x i32> %159) #11
  %161 = add nsw i32 %70, %69
  %162 = getelementptr inbounds i8, i8* %11, i32 %161
  %163 = bitcast i8* %162 to <32 x i32>*
  store <32 x i32> %160, <32 x i32>* %163, align 1, !tbaa !101
  %164 = add nuw nsw i32 %output.s0.x.x, 1
  %.not172 = icmp eq i32 %164, %21
  br i1 %.not172, label %"end for output.s0.x.x", label %"for output.s0.x.x"

"end for output.s0.x.x":                          ; preds = %"for output.s0.x.x", %"for output.s0.y.rebased"
  br i1 %51, label %"for output.s0.x.x.rebased.preheader", label %"end for output.s0.x.x.rebased", !prof !95

"for output.s0.x.x.rebased.preheader":            ; preds = %"end for output.s0.x.x"
  %165 = add nsw i32 %output.s0.y.rebased, %15
  %166 = mul nsw i32 %165, %4
  %167 = add nsw i32 %25, %166
  %168 = mul nsw i32 %165, %10
  %169 = add nsw i32 %30, %168
  %170 = mul nsw i32 %output.s0.y.rebased, %17
  br label %"for output.s0.x.x.rebased"

"for output.s0.x.x.rebased":                      ; preds = %"for output.s0.x.x.rebased.preheader", %after_bb11
  %output.s0.x.x.rebased = phi i32 [ %175, %after_bb11 ], [ 0, %"for output.s0.x.x.rebased.preheader" ]
  %171 = add nsw i32 %output.s0.x.x.rebased, %21
  %172 = shl nsw i32 %171, 7
  %173 = add nsw i32 %172, 128
  %.not167 = icmp sgt i32 %173, %14
  br i1 %.not167, label %next_bb, label %then_bb

"end for output.s0.x.x.rebased":                  ; preds = %after_bb11, %"end for output.s0.x.x"
  %174 = add nuw nsw i32 %output.s0.y.rebased, 1
  %.not166 = icmp eq i32 %174, %16
  br i1 %.not166, label %call_destructor.exit, label %"for output.s0.y.rebased"

after_bb11:                                       ; preds = %after_bb83, %then_bb
  %175 = add nuw nsw i32 %output.s0.x.x.rebased, 1
  %.not169 = icmp eq i32 %175, %t58
  br i1 %.not169, label %"end for output.s0.x.x.rebased", label %"for output.s0.x.x.rebased"

then_bb:                                          ; preds = %"for output.s0.x.x.rebased"
  %176 = add nsw i32 %output.s0.x.x.rebased, %a0
  %177 = shl nsw i32 %176, 7
  %178 = add nsw i32 %167, %177
  %179 = getelementptr inbounds i8, i8* %0, i32 %178
  %180 = bitcast i8* %179 to <32 x i32>*
  %181 = load <32 x i32>, <32 x i32>* %180, align 1, !tbaa !96
  %182 = add nsw i32 %169, %177
  %183 = getelementptr inbounds i8, i8* %5, i32 %182
  %184 = bitcast i8* %183 to <32 x i32>*
  %185 = load <32 x i32>, <32 x i32>* %184, align 1, !tbaa !99
  %186 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %46, <32 x i32> %46) #11
  %187 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %36) #11
  %188 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %47) #11
  %189 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %181) #11
  %190 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %189) #11
  %191 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %188, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %190) #11
  %192 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %191) #11
  %193 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %48) #11
  %194 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %185) #11
  %195 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194) #11
  %196 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %193, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %195) #11
  %197 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %196) #11
  %198 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %192, <32 x i32> %197) #11
  %199 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %198) #11
  %200 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %output_multiplier) #11
  %201 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %199, <32 x i32> %200) #11
  %202 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %201, <32 x i32> %199, <32 x i32> %200) #11
  %203 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %202, <32 x i32> %187) #11
  %204 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %38) #11
  %205 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %185) #11
  %206 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %205) #11
  %207 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %206, <64 x i32> %48) #11
  %208 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %207) #11
  %209 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %208) #11
  %210 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %181) #11
  %211 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %210) #11
  %212 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %211, <64 x i32> %47) #11
  %213 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %212) #11
  %214 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %213) #11
  %215 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %209, <32 x i32> %214) #11
  %216 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %215) #11
  %217 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %216, <32 x i32> %200) #11
  %218 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %217, <32 x i32> %216, <32 x i32> %200) #11
  %219 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %218, <32 x i32> %204) #11
  %220 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %219, <32 x i32> %37) #11
  %221 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %203, <32 x i32> %220) #11
  %222 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %198) #11
  %223 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %222, <32 x i32> %200) #11
  %224 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %223, <32 x i32> %222, <32 x i32> %200) #11
  %225 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %224, <32 x i32> %187) #11
  %226 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %215) #11
  %227 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %226, <32 x i32> %200) #11
  %228 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %227, <32 x i32> %226, <32 x i32> %200) #11
  %229 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %228, <32 x i32> %204) #11
  %230 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %229, <32 x i32> %37) #11
  %231 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %225, <32 x i32> %230) #11
  %232 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %221, <32 x i32> %231) #11
  %233 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %47) #11
  %234 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %189) #11
  %235 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %233, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %234) #11
  %236 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %235) #11
  %237 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %48) #11
  %238 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %194) #11
  %239 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %237, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %238) #11
  %240 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %239) #11
  %241 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %236, <32 x i32> %240) #11
  %242 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %241) #11
  %243 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %242, <32 x i32> %200) #11
  %244 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %243, <32 x i32> %242, <32 x i32> %200) #11
  %245 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %244, <32 x i32> %187) #11
  %246 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %212) #11
  %247 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %246) #11
  %248 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %48, <64 x i32> %206) #11
  %249 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %248) #11
  %250 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %249) #11
  %251 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %247, <32 x i32> %250) #11
  %252 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %251) #11
  %253 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %252, <32 x i32> %200) #11
  %254 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %253, <32 x i32> %252, <32 x i32> %200) #11
  %255 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %254, <32 x i32> %204) #11
  %256 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %255, <32 x i32> %37) #11
  %257 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %245, <32 x i32> %256) #11
  %258 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %241) #11
  %259 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %258, <32 x i32> %200) #11
  %260 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %259, <32 x i32> %258, <32 x i32> %200) #11
  %261 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %260, <32 x i32> %187) #11
  %262 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %251) #11
  %263 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %262, <32 x i32> %200) #11
  %264 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %263, <32 x i32> %262, <32 x i32> %200) #11
  %265 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %264, <32 x i32> %204) #11
  %266 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %265, <32 x i32> %37) #11
  %267 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %261, <32 x i32> %266) #11
  %268 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %257, <32 x i32> %267) #11
  %269 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %232, <32 x i32> %268) #11
  %270 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %186, <64 x i32> %269) #11
  %271 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %270) #11
  %272 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %270) #11
  %273 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %271, <32 x i32> %272) #11
  %274 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %273, <32 x i32> %49) #11
  %275 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %50, <32 x i32> %274) #11
  %276 = add nsw i32 %177, %170
  %277 = getelementptr inbounds i8, i8* %11, i32 %276
  %278 = bitcast i8* %277 to <32 x i32>*
  store <32 x i32> %275, <32 x i32>* %278, align 1, !tbaa !101
  br label %after_bb11

next_bb:                                          ; preds = %"for output.s0.x.x.rebased"
  %279 = add i32 %52, %172
  %280 = insertelement <128 x i32> undef, i32 %279, i32 0
  %281 = shufflevector <128 x i32> %280, <128 x i32> undef, <128 x i32> zeroinitializer
  %282 = add nsw <128 x i32> %281, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %t39 = icmp sle <128 x i32> %282, %55
  %283 = zext <128 x i1> %t39 to <128 x i8>
  %284 = tail call i8 @llvm.vector.reduce.umax.v128i8(<128 x i8> %283) #9
  %285 = and i8 %284, 1
  %t82.not = icmp eq i8 %285, 0
  br i1 %t82.not, label %after_bb83, label %true_bb81

true_bb81:                                        ; preds = %next_bb
  %286 = add nsw i32 %167, %172
  %287 = getelementptr inbounds i8, i8* %0, i32 %286
  %288 = bitcast i8* %287 to <32 x i32>*
  %289 = load <32 x i32>, <32 x i32>* %288, align 1, !tbaa !96
  %290 = add nsw i32 %169, %172
  %291 = getelementptr inbounds i8, i8* %5, i32 %290
  %292 = bitcast i8* %291 to <32 x i32>*
  %293 = load <32 x i32>, <32 x i32>* %292, align 1, !tbaa !99
  %294 = add nsw i32 %167, %172
  %295 = getelementptr inbounds i8, i8* %0, i32 %294
  %296 = bitcast i8* %295 to <32 x i32>*
  %297 = load <32 x i32>, <32 x i32>* %296, align 1, !tbaa !96
  %298 = add nsw i32 %169, %172
  %299 = getelementptr inbounds i8, i8* %5, i32 %298
  %300 = bitcast i8* %299 to <32 x i32>*
  %301 = load <32 x i32>, <32 x i32>* %300, align 1, !tbaa !99
  br label %after_bb83

after_bb83:                                       ; preds = %next_bb, %true_bb81
  %302 = phi <32 x i32> [ %293, %true_bb81 ], [ zeroinitializer, %next_bb ]
  %303 = phi <32 x i32> [ %289, %true_bb81 ], [ zeroinitializer, %next_bb ]
  %304 = phi <32 x i32> [ %297, %true_bb81 ], [ zeroinitializer, %next_bb ]
  %305 = phi <32 x i32> [ %301, %true_bb81 ], [ zeroinitializer, %next_bb ]
  %306 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %46, <32 x i32> %46) #11
  %307 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %36) #11
  %308 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %47) #11
  %309 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %304) #11
  %310 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %309) #11
  %311 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %308, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %310) #11
  %312 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %311) #11
  %313 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %48) #11
  %314 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %305) #11
  %315 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %314) #11
  %316 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %313, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %315) #11
  %317 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %316) #11
  %318 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %312, <32 x i32> %317) #11
  %319 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %318) #11
  %320 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %output_multiplier) #11
  %321 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %319, <32 x i32> %320) #11
  %322 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %321, <32 x i32> %319, <32 x i32> %320) #11
  %323 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %322, <32 x i32> %307) #11
  %324 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %38) #11
  %325 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %305) #11
  %326 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %325) #11
  %327 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %326, <64 x i32> %48) #11
  %328 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %327) #11
  %329 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %328) #11
  %330 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %304) #11
  %331 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %330) #11
  %332 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %331, <64 x i32> %47) #11
  %333 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %332) #11
  %334 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %333) #11
  %335 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %329, <32 x i32> %334) #11
  %336 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %335) #11
  %337 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %336, <32 x i32> %320) #11
  %338 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %337, <32 x i32> %336, <32 x i32> %320) #11
  %339 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %338, <32 x i32> %324) #11
  %340 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %339, <32 x i32> %37) #11
  %341 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %323, <32 x i32> %340) #11
  %342 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %303) #11
  %343 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %342) #11
  %344 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %308, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %343) #11
  %345 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %344) #11
  %346 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %302) #11
  %347 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %346) #11
  %348 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %313, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %347) #11
  %349 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %348) #11
  %350 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %345, <32 x i32> %349) #11
  %351 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %350) #11
  %352 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %351, <32 x i32> %320) #11
  %353 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %352, <32 x i32> %351, <32 x i32> %320) #11
  %354 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %307) #11
  %355 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %305) #11
  %356 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %355) #11
  %357 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %356, <64 x i32> %48) #11
  %358 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %357) #11
  %359 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %358) #11
  %360 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %304) #11
  %361 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %360) #11
  %362 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %361, <64 x i32> %47) #11
  %363 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %362) #11
  %364 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %363) #11
  %365 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %359, <32 x i32> %364) #11
  %366 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %365) #11
  %367 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %366, <32 x i32> %320) #11
  %368 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %367, <32 x i32> %366, <32 x i32> %320) #11
  %369 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %368, <32 x i32> %324) #11
  %370 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %369, <32 x i32> %37) #11
  %371 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %354, <32 x i32> %370) #11
  %372 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %341, <32 x i32> %371) #11
  %373 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %47) #11
  %374 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %304) #11
  %375 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %374) #11
  %376 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %373, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %375) #11
  %377 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %376) #11
  %378 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %48) #11
  %379 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %305) #11
  %380 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %379) #11
  %381 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %378, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %380) #11
  %382 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %381) #11
  %383 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %377, <32 x i32> %382) #11
  %384 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %383) #11
  %385 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %384, <32 x i32> %320) #11
  %386 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %385, <32 x i32> %384, <32 x i32> %320) #11
  %387 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %386, <32 x i32> %307) #11
  %388 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %304) #11
  %389 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %388) #11
  %390 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %389, <64 x i32> %47) #11
  %391 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390) #11
  %392 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %391) #11
  %393 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %305) #11
  %394 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %393) #11
  %395 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %48, <64 x i32> %394) #11
  %396 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %395) #11
  %397 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %396) #11
  %398 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %392, <32 x i32> %397) #11
  %399 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %398) #11
  %400 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %399, <32 x i32> %320) #11
  %401 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %400, <32 x i32> %399, <32 x i32> %320) #11
  %402 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %401, <32 x i32> %324) #11
  %403 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %402, <32 x i32> %37) #11
  %404 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %387, <32 x i32> %403) #11
  %405 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %304) #11
  %406 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %405) #11
  %407 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %373, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %406) #11
  %408 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %407) #11
  %409 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %305) #11
  %410 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %409) #11
  %411 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %378, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %410) #11
  %412 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %411) #11
  %413 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %408, <32 x i32> %412) #11
  %414 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %413) #11
  %415 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %414, <32 x i32> %320) #11
  %416 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %415, <32 x i32> %414, <32 x i32> %320) #11
  %417 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %416, <32 x i32> %307) #11
  %418 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %304) #11
  %419 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %418) #11
  %420 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %419, <64 x i32> %47) #11
  %421 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %420) #11
  %422 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %421) #11
  %423 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %305) #11
  %424 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %423) #11
  %425 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %48, <64 x i32> %424) #11
  %426 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %425) #11
  %427 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %426) #11
  %428 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %422, <32 x i32> %427) #11
  %429 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %428) #11
  %430 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %429, <32 x i32> %320) #11
  %431 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %430, <32 x i32> %429, <32 x i32> %320) #11
  %432 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %324) #11
  %433 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %432, <32 x i32> %37) #11
  %434 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %417, <32 x i32> %433) #11
  %435 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %404, <32 x i32> %434) #11
  %436 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %372, <32 x i32> %435) #11
  %437 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %306, <64 x i32> %436) #11
  %438 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %437) #11
  %439 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %437) #11
  %440 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %438, <32 x i32> %439) #11
  %441 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %440, <32 x i32> %49) #11
  %442 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %50, <32 x i32> %441) #11
  %443 = bitcast <32 x i32> %442 to <128 x i8>
  %444 = add nsw i32 %172, %170
  %445 = getelementptr inbounds i8, i8* %11, i32 %444
  %446 = bitcast i8* %445 to <128 x i8>*
  tail call void @llvm.masked.store.v128i8.p0v128i8(<128 x i8> %443, <128 x i8>* %446, i32 1, <128 x i1> %t39), !tbaa !101
  br label %after_bb11

case_0_bb:                                        ; preds = %entry
  %447 = add nsw i32 %14, 127
  %448 = ashr i32 %447, 7
  %a58 = ashr i32 %14, 7
  %449 = icmp sgt i32 %14, 127
  %450 = select i1 %449, i32 %a58, i32 0
  %t71 = sub nsw i32 %448, %450
  %451 = icmp sgt i32 %16, 0
  br i1 %451, label %"for output.s0.y.rebased84.preheader", label %call_destructor.exit, !prof !95

"for output.s0.y.rebased84.preheader":            ; preds = %case_0_bb
  %452 = mul nsw i32 %4, %3
  %t67.s = sub nsw i32 %13, %452
  %453 = sub i32 %t67.s, %2
  %454 = zext i8 %input1_zero to i16
  %455 = mul nsw i16 %454, -64
  %456 = insertelement <128 x i16> undef, i16 %455, i32 0
  %457 = shufflevector <128 x i16> %456, <128 x i16> undef, <128 x i32> zeroinitializer
  %458 = zext i8 %input2_zero to i16
  %459 = icmp ult i32 %a113, 15
  %460 = select i1 %459, i32 %a113, i32 15
  %.not164 = icmp eq i32 %460, 0
  %461 = select i1 %.not164, <32 x i32> zeroinitializer, <32 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %462 = add nsw i32 %460, -1
  %463 = zext i8 %output_zero to i16
  %464 = insertelement <64 x i16> undef, i16 %463, i32 0
  %465 = shufflevector <64 x i16> %464, <64 x i16> undef, <64 x i32> zeroinitializer
  %466 = insertelement <128 x i8> undef, i8 %output_max, i32 0
  %467 = shufflevector <128 x i8> %466, <128 x i8> undef, <128 x i32> zeroinitializer
  %468 = insertelement <128 x i8> undef, i8 %output_min, i32 0
  %469 = shufflevector <128 x i8> %468, <128 x i8> undef, <128 x i32> zeroinitializer
  %470 = bitcast <64 x i16> %465 to <32 x i32>
  %471 = bitcast <128 x i16> %457 to <64 x i32>
  %472 = bitcast <128 x i8> %467 to <32 x i32>
  %473 = bitcast <128 x i8> %469 to <32 x i32>
  %474 = icmp sgt i32 %t71, 0
  %475 = add i32 %13, 1
  %476 = add nsw i32 %14, %13
  %477 = insertelement <128 x i32> undef, i32 %476, i32 0
  %478 = shufflevector <128 x i32> %477, <128 x i32> undef, <128 x i32> zeroinitializer
  br label %"for output.s0.y.rebased84"

"for output.s0.y.rebased84":                      ; preds = %"for output.s0.y.rebased84.preheader", %"end for output.s0.x.x.rebased103"
  %output.s0.y.rebased86 = phi i32 [ %587, %"end for output.s0.x.x.rebased103" ], [ 0, %"for output.s0.y.rebased84.preheader" ]
  br i1 %449, label %"for output.s0.x.x87.preheader", label %"end for output.s0.x.x88", !prof !95

"for output.s0.x.x87.preheader":                  ; preds = %"for output.s0.y.rebased84"
  %479 = add i32 %output.s0.y.rebased86, %15
  %480 = mul nsw i32 %479, %4
  %481 = add nsw i32 %453, %480
  %482 = sub i32 %479, %9
  %483 = mul nsw i32 %482, %10
  %484 = getelementptr inbounds i8, i8* %5, i32 %483
  %485 = load i8, i8* %484, align 1, !tbaa !99
  %486 = zext i8 %485 to i16
  %487 = sub nsw i16 %486, %458
  %488 = shl nsw i16 %487, 6
  %489 = insertelement <64 x i16> undef, i16 %488, i32 0
  %490 = shufflevector <64 x i16> %489, <64 x i16> undef, <64 x i32> zeroinitializer
  %491 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %470, <32 x i32> %470) #11
  %492 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %460) #11
  %493 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %471) #11
  %494 = bitcast <64 x i16> %490 to <32 x i32>
  %495 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %494) #11
  %496 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %output_multiplier) #11
  %497 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %462) #11
  %498 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %471) #11
  %499 = mul nsw i32 %output.s0.y.rebased86, %17
  br label %"for output.s0.x.x87"

"for output.s0.x.x87":                            ; preds = %"for output.s0.x.x87.preheader", %"for output.s0.x.x87"
  %output.s0.x.x89 = phi i32 [ %576, %"for output.s0.x.x87" ], [ 0, %"for output.s0.x.x87.preheader" ]
  %500 = shl nsw i32 %output.s0.x.x89, 7
  %501 = add nsw i32 %481, %500
  %502 = getelementptr inbounds i8, i8* %0, i32 %501
  %503 = bitcast i8* %502 to <32 x i32>*
  %504 = load <32 x i32>, <32 x i32>* %503, align 1, !tbaa !96
  %505 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %504) #11
  %506 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %505) #11
  %507 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %493, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %506) #11
  %508 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %507) #11
  %509 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %508, <32 x i32> %495) #11
  %510 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %509) #11
  %511 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %510, <32 x i32> %496) #11
  %512 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %511, <32 x i32> %510, <32 x i32> %496) #11
  %513 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %512, <32 x i32> %492) #11
  %514 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %504) #11
  %515 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %514) #11
  %516 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %515, <64 x i32> %471) #11
  %517 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %516) #11
  %518 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %516) #11
  %519 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %517, <32 x i32> %518, i32 -2) #11
  %520 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %519) #11
  %521 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %494, <32 x i32> %520) #11
  %522 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %521) #11
  %523 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %522, <32 x i32> %496) #11
  %524 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %523, <32 x i32> %522, <32 x i32> %496) #11
  %525 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %524, <32 x i32> %497) #11
  %526 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %525, <32 x i32> %461) #11
  %527 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %513, <32 x i32> %526) #11
  %528 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %509) #11
  %529 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %528, <32 x i32> %496) #11
  %530 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %529, <32 x i32> %528, <32 x i32> %496) #11
  %531 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %530, <32 x i32> %492) #11
  %532 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %521) #11
  %533 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %532, <32 x i32> %496) #11
  %534 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %533, <32 x i32> %532, <32 x i32> %496) #11
  %535 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %534, <32 x i32> %497) #11
  %536 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %535, <32 x i32> %461) #11
  %537 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %531, <32 x i32> %536) #11
  %538 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %527, <32 x i32> %537) #11
  %539 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %505) #11
  %540 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %498, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %539) #11
  %541 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %540) #11
  %542 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %541, <32 x i32> %495) #11
  %543 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %542) #11
  %544 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %543, <32 x i32> %496) #11
  %545 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %544, <32 x i32> %543, <32 x i32> %496) #11
  %546 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %545, <32 x i32> %492) #11
  %547 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %519) #11
  %548 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %494, <32 x i32> %547) #11
  %549 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %548) #11
  %550 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %549, <32 x i32> %496) #11
  %551 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %550, <32 x i32> %549, <32 x i32> %496) #11
  %552 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %551, <32 x i32> %497) #11
  %553 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %552, <32 x i32> %461) #11
  %554 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %546, <32 x i32> %553) #11
  %555 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %542) #11
  %556 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %555, <32 x i32> %496) #11
  %557 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %556, <32 x i32> %555, <32 x i32> %496) #11
  %558 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %557, <32 x i32> %492) #11
  %559 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %548) #11
  %560 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %559, <32 x i32> %496) #11
  %561 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %560, <32 x i32> %559, <32 x i32> %496) #11
  %562 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %561, <32 x i32> %497) #11
  %563 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %562, <32 x i32> %461) #11
  %564 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %558, <32 x i32> %563) #11
  %565 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %554, <32 x i32> %564) #11
  %566 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %538, <32 x i32> %565) #11
  %567 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %491, <64 x i32> %566) #11
  %568 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %567) #11
  %569 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %567) #11
  %570 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %568, <32 x i32> %569) #11
  %571 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %570, <32 x i32> %472) #11
  %572 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %473, <32 x i32> %571) #11
  %573 = add nsw i32 %500, %499
  %574 = getelementptr inbounds i8, i8* %11, i32 %573
  %575 = bitcast i8* %574 to <32 x i32>*
  store <32 x i32> %572, <32 x i32>* %575, align 1, !tbaa !101
  %576 = add nuw nsw i32 %output.s0.x.x89, 1
  %.not165 = icmp eq i32 %576, %450
  br i1 %.not165, label %"end for output.s0.x.x88", label %"for output.s0.x.x87"

"end for output.s0.x.x88":                        ; preds = %"for output.s0.x.x87", %"for output.s0.y.rebased84"
  br i1 %474, label %"for output.s0.x.x.rebased102.preheader", label %"end for output.s0.x.x.rebased103", !prof !95

"for output.s0.x.x.rebased102.preheader":         ; preds = %"end for output.s0.x.x88"
  %577 = add i32 %output.s0.y.rebased86, %15
  %578 = mul nsw i32 %577, %4
  %579 = add nsw i32 %453, %578
  %580 = sub i32 %577, %9
  %581 = mul nsw i32 %580, %10
  %582 = getelementptr inbounds i8, i8* %5, i32 %581
  %583 = mul nsw i32 %output.s0.y.rebased86, %17
  br label %"for output.s0.x.x.rebased102"

"for output.s0.x.x.rebased102":                   ; preds = %"for output.s0.x.x.rebased102.preheader", %after_bb105
  %output.s0.x.x.rebased104 = phi i32 [ %588, %after_bb105 ], [ 0, %"for output.s0.x.x.rebased102.preheader" ]
  %584 = add nsw i32 %output.s0.x.x.rebased104, %450
  %585 = shl nsw i32 %584, 7
  %586 = add nsw i32 %585, 128
  %.not159 = icmp sgt i32 %586, %14
  br i1 %.not159, label %next_bb107, label %then_bb106

"end for output.s0.x.x.rebased103":               ; preds = %after_bb105, %"end for output.s0.x.x88"
  %587 = add nuw nsw i32 %output.s0.y.rebased86, 1
  %.not = icmp eq i32 %587, %16
  br i1 %.not, label %call_destructor.exit, label %"for output.s0.y.rebased84"

after_bb105:                                      ; preds = %after_bb155, %then_bb106
  %588 = add nuw nsw i32 %output.s0.x.x.rebased104, 1
  %.not162 = icmp eq i32 %588, %t71
  br i1 %.not162, label %"end for output.s0.x.x.rebased103", label %"for output.s0.x.x.rebased102"

then_bb106:                                       ; preds = %"for output.s0.x.x.rebased102"
  %589 = add nsw i32 %output.s0.x.x.rebased104, %a58
  %590 = shl nsw i32 %589, 7
  %591 = add nsw i32 %579, %590
  %592 = getelementptr inbounds i8, i8* %0, i32 %591
  %593 = bitcast i8* %592 to <32 x i32>*
  %594 = load <32 x i32>, <32 x i32>* %593, align 1, !tbaa !96
  %595 = load i8, i8* %582, align 1, !tbaa !99
  %596 = zext i8 %595 to i16
  %597 = sub nsw i16 %596, %458
  %598 = shl nsw i16 %597, 6
  %599 = insertelement <64 x i16> undef, i16 %598, i32 0
  %600 = shufflevector <64 x i16> %599, <64 x i16> undef, <64 x i32> zeroinitializer
  %601 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %470, <32 x i32> %470) #11
  %602 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %460) #11
  %603 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %471) #11
  %604 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %594) #11
  %605 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %604) #11
  %606 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %603, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %605) #11
  %607 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %606) #11
  %608 = bitcast <64 x i16> %600 to <32 x i32>
  %609 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %608) #11
  %610 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %607, <32 x i32> %609) #11
  %611 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %610) #11
  %612 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %output_multiplier) #11
  %613 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %611, <32 x i32> %612) #11
  %614 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %613, <32 x i32> %611, <32 x i32> %612) #11
  %615 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %614, <32 x i32> %602) #11
  %616 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %462) #11
  %617 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %594) #11
  %618 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %617) #11
  %619 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %618, <64 x i32> %471) #11
  %620 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %619) #11
  %621 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %619) #11
  %622 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %620, <32 x i32> %621, i32 -2) #11
  %623 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %622) #11
  %624 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %608, <32 x i32> %623) #11
  %625 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %624) #11
  %626 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %625, <32 x i32> %612) #11
  %627 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %626, <32 x i32> %625, <32 x i32> %612) #11
  %628 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %627, <32 x i32> %616) #11
  %629 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %628, <32 x i32> %461) #11
  %630 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %615, <32 x i32> %629) #11
  %631 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %610) #11
  %632 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %631, <32 x i32> %612) #11
  %633 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %632, <32 x i32> %631, <32 x i32> %612) #11
  %634 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %633, <32 x i32> %602) #11
  %635 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %624) #11
  %636 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %635, <32 x i32> %612) #11
  %637 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %636, <32 x i32> %635, <32 x i32> %612) #11
  %638 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %637, <32 x i32> %616) #11
  %639 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %638, <32 x i32> %461) #11
  %640 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %634, <32 x i32> %639) #11
  %641 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %630, <32 x i32> %640) #11
  %642 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %471) #11
  %643 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %604) #11
  %644 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %642, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %643) #11
  %645 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %644) #11
  %646 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %645, <32 x i32> %609) #11
  %647 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %646) #11
  %648 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %647, <32 x i32> %612) #11
  %649 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %648, <32 x i32> %647, <32 x i32> %612) #11
  %650 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %649, <32 x i32> %602) #11
  %651 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %622) #11
  %652 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %608, <32 x i32> %651) #11
  %653 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %652) #11
  %654 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %653, <32 x i32> %612) #11
  %655 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %654, <32 x i32> %653, <32 x i32> %612) #11
  %656 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %655, <32 x i32> %616) #11
  %657 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %656, <32 x i32> %461) #11
  %658 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %650, <32 x i32> %657) #11
  %659 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %646) #11
  %660 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %659, <32 x i32> %612) #11
  %661 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %660, <32 x i32> %659, <32 x i32> %612) #11
  %662 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %661, <32 x i32> %602) #11
  %663 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %652) #11
  %664 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %663, <32 x i32> %612) #11
  %665 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %664, <32 x i32> %663, <32 x i32> %612) #11
  %666 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %665, <32 x i32> %616) #11
  %667 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %666, <32 x i32> %461) #11
  %668 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %662, <32 x i32> %667) #11
  %669 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %658, <32 x i32> %668) #11
  %670 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %641, <32 x i32> %669) #11
  %671 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %601, <64 x i32> %670) #11
  %672 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %671) #11
  %673 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %671) #11
  %674 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %672, <32 x i32> %673) #11
  %675 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %674, <32 x i32> %472) #11
  %676 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %473, <32 x i32> %675) #11
  %677 = add nsw i32 %590, %583
  %678 = getelementptr inbounds i8, i8* %11, i32 %677
  %679 = bitcast i8* %678 to <32 x i32>*
  store <32 x i32> %676, <32 x i32>* %679, align 1, !tbaa !101
  br label %after_bb105

next_bb107:                                       ; preds = %"for output.s0.x.x.rebased102"
  %680 = add i32 %475, %585
  %681 = insertelement <128 x i32> undef, i32 %680, i32 0
  %682 = shufflevector <128 x i32> %681, <128 x i32> undef, <128 x i32> zeroinitializer
  %683 = add nsw <128 x i32> %682, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %684 = icmp sle <128 x i32> %683, %478
  %685 = or i32 %585, 1
  %.not160 = icmp sgt i32 %685, %14
  br i1 %.not160, label %after_bb122.thread, label %true_bb153

after_bb122.thread:                               ; preds = %next_bb107
  %686 = load i8, i8* %582, align 1, !tbaa !99
  %687 = zext i8 %686 to i16
  %688 = sub nsw i16 %687, %458
  %689 = shl nsw i16 %688, 6
  %690 = insertelement <64 x i16> undef, i16 %689, i32 0
  %691 = shufflevector <64 x i16> %690, <64 x i16> undef, <64 x i32> zeroinitializer
  br label %after_bb155

true_bb153:                                       ; preds = %next_bb107
  %692 = add nsw i32 %579, %585
  %693 = getelementptr inbounds i8, i8* %0, i32 %692
  %694 = bitcast i8* %693 to <32 x i32>*
  %695 = load <32 x i32>, <32 x i32>* %694, align 1, !tbaa !96
  %696 = load i8, i8* %582, align 1, !tbaa !99
  %697 = zext i8 %696 to i16
  %698 = sub nsw i16 %697, %458
  %699 = shl nsw i16 %698, 6
  %700 = insertelement <64 x i16> undef, i16 %699, i32 0
  %701 = shufflevector <64 x i16> %700, <64 x i16> undef, <64 x i32> zeroinitializer
  %702 = add nsw i32 %579, %585
  %703 = getelementptr inbounds i8, i8* %0, i32 %702
  %704 = bitcast i8* %703 to <32 x i32>*
  %705 = load <32 x i32>, <32 x i32>* %704, align 1, !tbaa !96
  br label %after_bb155

after_bb155:                                      ; preds = %after_bb122.thread, %true_bb153
  %706 = phi <64 x i16> [ %701, %true_bb153 ], [ %691, %after_bb122.thread ]
  %707 = phi <32 x i32> [ %695, %true_bb153 ], [ zeroinitializer, %after_bb122.thread ]
  %708 = phi <32 x i32> [ %705, %true_bb153 ], [ zeroinitializer, %after_bb122.thread ]
  %709 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %470, <32 x i32> %470) #11
  %710 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %460) #11
  %711 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %471) #11
  %712 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %708) #11
  %713 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %712) #11
  %714 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %711, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %713) #11
  %715 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %714) #11
  %716 = bitcast <64 x i16> %706 to <32 x i32>
  %717 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %716) #11
  %718 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %715, <32 x i32> %717) #11
  %719 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %718) #11
  %720 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %output_multiplier) #11
  %721 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %719, <32 x i32> %720) #11
  %722 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %721, <32 x i32> %719, <32 x i32> %720) #11
  %723 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %722, <32 x i32> %710) #11
  %724 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %462) #11
  %725 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %708) #11
  %726 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %725) #11
  %727 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %726, <64 x i32> %471) #11
  %728 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %727) #11
  %729 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %727) #11
  %730 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %728, <32 x i32> %729, i32 -2) #11
  %731 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %730) #11
  %732 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %716, <32 x i32> %731) #11
  %733 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %732) #11
  %734 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %733, <32 x i32> %720) #11
  %735 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %734, <32 x i32> %733, <32 x i32> %720) #11
  %736 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %735, <32 x i32> %724) #11
  %737 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %736, <32 x i32> %461) #11
  %738 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %723, <32 x i32> %737) #11
  %739 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %707) #11
  %740 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %739) #11
  %741 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %711, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %740) #11
  %742 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %741) #11
  %743 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %742, <32 x i32> %717) #11
  %744 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %743) #11
  %745 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %744, <32 x i32> %720) #11
  %746 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %745, <32 x i32> %744, <32 x i32> %720) #11
  %747 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %746, <32 x i32> %710) #11
  %748 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %708) #11
  %749 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %748) #11
  %750 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %749, <64 x i32> %471) #11
  %751 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %750) #11
  %752 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %750) #11
  %753 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %751, <32 x i32> %752, i32 -2) #11
  %754 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %753) #11
  %755 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %716, <32 x i32> %754) #11
  %756 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %755) #11
  %757 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %756, <32 x i32> %720) #11
  %758 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %757, <32 x i32> %756, <32 x i32> %720) #11
  %759 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %758, <32 x i32> %724) #11
  %760 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %759, <32 x i32> %461) #11
  %761 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %747, <32 x i32> %760) #11
  %762 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %738, <32 x i32> %761) #11
  %763 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %471) #11
  %764 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %708) #11
  %765 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %764) #11
  %766 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %763, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %765) #11
  %767 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %766) #11
  %768 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %767, <32 x i32> %717) #11
  %769 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %768) #11
  %770 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %769, <32 x i32> %720) #11
  %771 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %770, <32 x i32> %769, <32 x i32> %720) #11
  %772 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %771, <32 x i32> %710) #11
  %773 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %708) #11
  %774 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %773) #11
  %775 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %774, <64 x i32> %471) #11
  %776 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %775) #11
  %777 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %775) #11
  %778 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %776, <32 x i32> %777, i32 -2) #11
  %779 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %778) #11
  %780 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %716, <32 x i32> %779) #11
  %781 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %780) #11
  %782 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %781, <32 x i32> %720) #11
  %783 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %782, <32 x i32> %781, <32 x i32> %720) #11
  %784 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %783, <32 x i32> %724) #11
  %785 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %784, <32 x i32> %461) #11
  %786 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %772, <32 x i32> %785) #11
  %787 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %708) #11
  %788 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %787) #11
  %789 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %763, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %788) #11
  %790 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %789) #11
  %791 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %790, <32 x i32> %717) #11
  %792 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %791) #11
  %793 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %792, <32 x i32> %720) #11
  %794 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %793, <32 x i32> %792, <32 x i32> %720) #11
  %795 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %794, <32 x i32> %710) #11
  %796 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %708) #11
  %797 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %796) #11
  %798 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %797, <64 x i32> %471) #11
  %799 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %798) #11
  %800 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %798) #11
  %801 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %799, <32 x i32> %800, i32 -2) #11
  %802 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %801) #11
  %803 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %716, <32 x i32> %802) #11
  %804 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %803) #11
  %805 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %804, <32 x i32> %720) #11
  %806 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %805, <32 x i32> %804, <32 x i32> %720) #11
  %807 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %806, <32 x i32> %724) #11
  %808 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %807, <32 x i32> %461) #11
  %809 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %795, <32 x i32> %808) #11
  %810 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %786, <32 x i32> %809) #11
  %811 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %762, <32 x i32> %810) #11
  %812 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %709, <64 x i32> %811) #11
  %813 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %812) #11
  %814 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %812) #11
  %815 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %813, <32 x i32> %814) #11
  %816 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %815, <32 x i32> %472) #11
  %817 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %473, <32 x i32> %816) #11
  %818 = bitcast <32 x i32> %817 to <128 x i8>
  %819 = add nsw i32 %585, %583
  %820 = getelementptr inbounds i8, i8* %11, i32 %819
  %821 = bitcast i8* %820 to <128 x i8>*
  tail call void @llvm.masked.store.v128i8.p0v128i8(<128 x i8> %818, <128 x i8>* %821, i32 1, <128 x i1> %684), !tbaa !101
  br label %after_bb105
}

; Function Attrs: nounwind
define i32 @mul_hvx128_argv(i8** nocapture readonly %0) local_unnamed_addr #11 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 4
  %3 = getelementptr i8*, i8** %0, i32 1
  %4 = load i8*, i8** %3, align 4
  %5 = load i8, i8* %4, align 1
  %6 = getelementptr i8*, i8** %0, i32 2
  %7 = bitcast i8** %6 to %struct.halide_buffer_t**
  %8 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %7, align 4
  %9 = getelementptr i8*, i8** %0, i32 3
  %10 = load i8*, i8** %9, align 4
  %11 = load i8, i8* %10, align 1
  %12 = getelementptr i8*, i8** %0, i32 4
  %13 = load i8*, i8** %12, align 4
  %14 = load i8, i8* %13, align 1
  %15 = getelementptr i8*, i8** %0, i32 5
  %16 = bitcast i8** %15 to i32**
  %17 = load i32*, i32** %16, align 4
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr i8*, i8** %0, i32 6
  %20 = bitcast i8** %19 to i32**
  %21 = load i32*, i32** %20, align 4
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr i8*, i8** %0, i32 7
  %24 = load i8*, i8** %23, align 4
  %25 = load i8, i8* %24, align 1
  %26 = getelementptr i8*, i8** %0, i32 8
  %27 = load i8*, i8** %26, align 4
  %28 = load i8, i8* %27, align 1
  %29 = getelementptr i8*, i8** %0, i32 9
  %30 = bitcast i8** %29 to %struct.halide_buffer_t**
  %31 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %30, align 4
  %32 = tail call i32 @mul_hvx128(%struct.halide_buffer_t* %2, i8 %5, %struct.halide_buffer_t* %8, i8 %11, i8 %14, i32 %18, i32 %22, i8 %25, i8 %28, %struct.halide_buffer_t* %31) #17
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @mul_hvx128_metadata() local_unnamed_addr #12 {
entry:
  ret %struct.halide_filter_metadata_t* @mul_hvx128_metadata_storage
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8 @llvm.vector.reduce.umax.v128i8(<128 x i8>) #13

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.store.v128i8.p0v128i8(<128 x i8>, <128 x i8>*, i32 immarg, <128 x i1>) #5

; Function Attrs: nounwind readnone willreturn
define <128 x i8> @hydride.node.mul_hvx_depth3.0(<128 x i8> %arg, <128 x i16> %arg.1, <128 x i8> %arg.2, <128 x i16> %arg.3, <1 x i32> %arg.4, <1 x i32> %arg.5, <32 x i32> %arg.6, <128 x i8> %arg.7, <128 x i16> %arg.8, <128 x i8> %arg.9, <128 x i16> %arg.10, <1 x i32> %arg.11, <128 x i8> %arg.12, <128 x i16> %arg.13, <128 x i8> %arg.14, <128 x i16> %arg.15, <1 x i32> %arg.16, <32 x i32> %arg.17, <128 x i8> %arg.18, <128 x i16> %arg.19, <128 x i8> %arg.20, <128 x i16> %arg.21, <1 x i32> %arg.22, <64 x i16> %arg.23, <128 x i8> %arg.24, <128 x i16> %arg.25, <128 x i8> %arg.26, <128 x i16> %arg.27, <1 x i32> %arg.28, <32 x i32> %arg.29, <128 x i8> %arg.30, <128 x i16> %arg.31, <128 x i8> %arg.32, <128 x i16> %arg.33, <1 x i32> %arg.34, <128 x i8> %arg.35, <128 x i16> %arg.36, <128 x i8> %arg.37, <128 x i16> %arg.38, <1 x i32> %arg.39, <32 x i32> %arg.40, <128 x i8> %arg.41, <128 x i16> %arg.42, <128 x i8> %arg.43, <128 x i16> %arg.44, <1 x i32> %arg.45, <64 x i16> %arg.46, <128 x i8> %arg.47, <128 x i8> %arg.48) local_unnamed_addr #14 {
entry:
  %0 = bitcast <64 x i16> %arg.23 to <32 x i32>
  %1 = bitcast <64 x i16> %arg.46 to <32 x i32>
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %0, <32 x i32> %1)
  %3 = extractelement <1 x i32> %arg.16, i32 0
  %4 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %3)
  %5 = bitcast <128 x i16> %arg.13 to <64 x i32>
  %6 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %5)
  %7 = bitcast <128 x i8> %arg.12 to <32 x i32>
  %8 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %7)
  %9 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %8)
  %10 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %6, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %9)
  %11 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %10)
  %12 = bitcast <128 x i16> %arg.15 to <64 x i32>
  %13 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %12)
  %14 = bitcast <128 x i8> %arg.14 to <32 x i32>
  %15 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %14)
  %16 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %15)
  %17 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %13, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %16)
  %18 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %17)
  %19 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %11, <32 x i32> %18)
  %20 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %19)
  %21 = extractelement <1 x i32> %arg.4, i32 0
  %22 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %21)
  %23 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %20, <32 x i32> %22)
  %24 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %23, <32 x i32> %20, <32 x i32> %22)
  %25 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %24, <32 x i32> %4)
  %26 = extractelement <1 x i32> %arg.22, i32 0
  %27 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %26)
  %28 = bitcast <128 x i8> %arg.20 to <32 x i32>
  %29 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %28)
  %30 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %29)
  %31 = bitcast <128 x i16> %arg.21 to <64 x i32>
  %32 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %30, <64 x i32> %31)
  %33 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %32)
  %34 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %33)
  %35 = bitcast <128 x i8> %arg.18 to <32 x i32>
  %36 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %35)
  %37 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %36)
  %38 = bitcast <128 x i16> %arg.19 to <64 x i32>
  %39 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %37, <64 x i32> %38)
  %40 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %39)
  %41 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %40)
  %42 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %34, <32 x i32> %41)
  %43 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %42)
  %44 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %43, <32 x i32> %22)
  %45 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %44, <32 x i32> %43, <32 x i32> %22)
  %46 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %45, <32 x i32> %27)
  %47 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %46, <32 x i32> %arg.17)
  %48 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %25, <32 x i32> %47)
  %49 = extractelement <1 x i32> %arg.5, i32 0
  %50 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %49)
  %51 = bitcast <128 x i16> %arg.1 to <64 x i32>
  %52 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %51)
  %53 = bitcast <128 x i8> %arg to <32 x i32>
  %54 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %53)
  %55 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %54)
  %56 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %52, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %55)
  %57 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %56)
  %58 = bitcast <128 x i16> %arg.3 to <64 x i32>
  %59 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %58)
  %60 = bitcast <128 x i8> %arg.2 to <32 x i32>
  %61 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %60)
  %62 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %61)
  %63 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %59, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %62)
  %64 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %63)
  %65 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %57, <32 x i32> %64)
  %66 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %65)
  %67 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %66, <32 x i32> %22)
  %68 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %67, <32 x i32> %66, <32 x i32> %22)
  %69 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %68, <32 x i32> %50)
  %70 = extractelement <1 x i32> %arg.11, i32 0
  %71 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %70)
  %72 = bitcast <128 x i8> %arg.9 to <32 x i32>
  %73 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %72)
  %74 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %73)
  %75 = bitcast <128 x i16> %arg.10 to <64 x i32>
  %76 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %74, <64 x i32> %75)
  %77 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %76)
  %78 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %77)
  %79 = bitcast <128 x i8> %arg.7 to <32 x i32>
  %80 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %79)
  %81 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %80)
  %82 = bitcast <128 x i16> %arg.8 to <64 x i32>
  %83 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %81, <64 x i32> %82)
  %84 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %83)
  %85 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %84)
  %86 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %78, <32 x i32> %85)
  %87 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %86)
  %88 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %87, <32 x i32> %22)
  %89 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %88, <32 x i32> %87, <32 x i32> %22)
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %89, <32 x i32> %71)
  %91 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %90, <32 x i32> %arg.6)
  %92 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %69, <32 x i32> %91)
  %93 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %48, <32 x i32> %92)
  %94 = extractelement <1 x i32> %arg.39, i32 0
  %95 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %94)
  %96 = bitcast <128 x i16> %arg.36 to <64 x i32>
  %97 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %96)
  %98 = bitcast <128 x i8> %arg.35 to <32 x i32>
  %99 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %98)
  %100 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %99)
  %101 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %97, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %100)
  %102 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %101)
  %103 = bitcast <128 x i16> %arg.38 to <64 x i32>
  %104 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %103)
  %105 = bitcast <128 x i8> %arg.37 to <32 x i32>
  %106 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %105)
  %107 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %106)
  %108 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %104, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %107)
  %109 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %108)
  %110 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %102, <32 x i32> %109)
  %111 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %110)
  %112 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %111, <32 x i32> %22)
  %113 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %112, <32 x i32> %111, <32 x i32> %22)
  %114 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %113, <32 x i32> %95)
  %115 = extractelement <1 x i32> %arg.45, i32 0
  %116 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %115)
  %117 = bitcast <128 x i8> %arg.41 to <32 x i32>
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %117)
  %119 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.42 to <64 x i32>
  %121 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %119, <64 x i32> %120)
  %122 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %121)
  %123 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %122)
  %124 = bitcast <128 x i8> %arg.43 to <32 x i32>
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %124)
  %126 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %125)
  %127 = bitcast <128 x i16> %arg.44 to <64 x i32>
  %128 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %127, <64 x i32> %126)
  %129 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %128)
  %130 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %129)
  %131 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %123, <32 x i32> %130)
  %132 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %131)
  %133 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %132, <32 x i32> %22)
  %134 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %133, <32 x i32> %132, <32 x i32> %22)
  %135 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %116)
  %136 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %135, <32 x i32> %arg.40)
  %137 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %114, <32 x i32> %136)
  %138 = extractelement <1 x i32> %arg.28, i32 0
  %139 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %138)
  %140 = bitcast <128 x i16> %arg.25 to <64 x i32>
  %141 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %140)
  %142 = bitcast <128 x i8> %arg.24 to <32 x i32>
  %143 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %142)
  %144 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %143)
  %145 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %141, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %144)
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %145)
  %147 = bitcast <128 x i16> %arg.27 to <64 x i32>
  %148 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %147)
  %149 = bitcast <128 x i8> %arg.26 to <32 x i32>
  %150 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %149)
  %151 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %148, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %151)
  %153 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %152)
  %154 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %146, <32 x i32> %153)
  %155 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %154)
  %156 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %155, <32 x i32> %22)
  %157 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %156, <32 x i32> %155, <32 x i32> %22)
  %158 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %139)
  %159 = extractelement <1 x i32> %arg.34, i32 0
  %160 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %159)
  %161 = bitcast <128 x i8> %arg.30 to <32 x i32>
  %162 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %161)
  %163 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %162)
  %164 = bitcast <128 x i16> %arg.31 to <64 x i32>
  %165 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %163, <64 x i32> %164)
  %166 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %165)
  %167 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %166)
  %168 = bitcast <128 x i8> %arg.32 to <32 x i32>
  %169 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %168)
  %170 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %169)
  %171 = bitcast <128 x i16> %arg.33 to <64 x i32>
  %172 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %171, <64 x i32> %170)
  %173 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %172)
  %174 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %173)
  %175 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %167, <32 x i32> %174)
  %176 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %175)
  %177 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %176, <32 x i32> %22)
  %178 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %177, <32 x i32> %176, <32 x i32> %22)
  %179 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %178, <32 x i32> %160)
  %180 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %179, <32 x i32> %arg.29)
  %181 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %158, <32 x i32> %180)
  %182 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %137, <32 x i32> %181)
  %183 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %93, <32 x i32> %182)
  %184 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %2, <64 x i32> %183)
  %185 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %184)
  %186 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %184)
  %187 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %185, <32 x i32> %186)
  %188 = bitcast <128 x i8> %arg.47 to <32 x i32>
  %189 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %187, <32 x i32> %188)
  %190 = bitcast <128 x i8> %arg.48 to <32 x i32>
  %191 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %190, <32 x i32> %189)
  %192 = bitcast <32 x i32> %191 to <128 x i8>
  ret <128 x i8> %192
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32>, <64 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone willreturn
define <128 x i8> @hydride.node.mul_hvx_depth3.1(<128 x i8> %arg, <128 x i16> %arg.1, <128 x i8> %arg.2, <128 x i16> %arg.3, <1 x i32> %arg.4, <1 x i32> %arg.5, <32 x i32> %arg.6, <128 x i8> %arg.7, <128 x i16> %arg.8, <128 x i8> %arg.9, <128 x i16> %arg.10, <1 x i32> %arg.11, <128 x i8> %arg.12, <128 x i16> %arg.13, <128 x i8> %arg.14, <128 x i16> %arg.15, <1 x i32> %arg.16, <32 x i32> %arg.17, <128 x i8> %arg.18, <128 x i16> %arg.19, <128 x i8> %arg.20, <128 x i16> %arg.21, <1 x i32> %arg.22, <64 x i16> %arg.23, <128 x i8> %arg.24, <128 x i16> %arg.25, <128 x i8> %arg.26, <128 x i16> %arg.27, <1 x i32> %arg.28, <32 x i32> %arg.29, <128 x i8> %arg.30, <128 x i16> %arg.31, <128 x i8> %arg.32, <128 x i16> %arg.33, <1 x i32> %arg.34, <128 x i8> %arg.35, <128 x i16> %arg.36, <128 x i8> %arg.37, <128 x i16> %arg.38, <1 x i32> %arg.39, <32 x i32> %arg.40, <128 x i8> %arg.41, <128 x i16> %arg.42, <128 x i8> %arg.43, <128 x i16> %arg.44, <1 x i32> %arg.45, <64 x i16> %arg.46, <128 x i8> %arg.47, <128 x i8> %arg.48) local_unnamed_addr #14 {
entry:
  %0 = bitcast <64 x i16> %arg.23 to <32 x i32>
  %1 = bitcast <64 x i16> %arg.46 to <32 x i32>
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %0, <32 x i32> %1)
  %3 = extractelement <1 x i32> %arg.16, i32 0
  %4 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %3)
  %5 = bitcast <128 x i16> %arg.13 to <64 x i32>
  %6 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %5)
  %7 = bitcast <128 x i8> %arg.12 to <32 x i32>
  %8 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %7)
  %9 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %8)
  %10 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %6, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %9)
  %11 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %10)
  %12 = bitcast <128 x i16> %arg.15 to <64 x i32>
  %13 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %12)
  %14 = bitcast <128 x i8> %arg.14 to <32 x i32>
  %15 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %14)
  %16 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %15)
  %17 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %13, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %16)
  %18 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %17)
  %19 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %11, <32 x i32> %18)
  %20 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %19)
  %21 = extractelement <1 x i32> %arg.4, i32 0
  %22 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %21)
  %23 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %20, <32 x i32> %22)
  %24 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %23, <32 x i32> %20, <32 x i32> %22)
  %25 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %24, <32 x i32> %4)
  %26 = extractelement <1 x i32> %arg.22, i32 0
  %27 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %26)
  %28 = bitcast <128 x i8> %arg.20 to <32 x i32>
  %29 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %28)
  %30 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %29)
  %31 = bitcast <128 x i16> %arg.21 to <64 x i32>
  %32 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %30, <64 x i32> %31)
  %33 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %32)
  %34 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %33)
  %35 = bitcast <128 x i8> %arg.18 to <32 x i32>
  %36 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %35)
  %37 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %36)
  %38 = bitcast <128 x i16> %arg.19 to <64 x i32>
  %39 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %37, <64 x i32> %38)
  %40 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %39)
  %41 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %40)
  %42 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %34, <32 x i32> %41)
  %43 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %42)
  %44 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %43, <32 x i32> %22)
  %45 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %44, <32 x i32> %43, <32 x i32> %22)
  %46 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %45, <32 x i32> %27)
  %47 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %46, <32 x i32> %arg.17)
  %48 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %25, <32 x i32> %47)
  %49 = extractelement <1 x i32> %arg.5, i32 0
  %50 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %49)
  %51 = bitcast <128 x i16> %arg.1 to <64 x i32>
  %52 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %51)
  %53 = bitcast <128 x i8> %arg to <32 x i32>
  %54 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %53)
  %55 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %54)
  %56 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %52, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %55)
  %57 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %56)
  %58 = bitcast <128 x i16> %arg.3 to <64 x i32>
  %59 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %58)
  %60 = bitcast <128 x i8> %arg.2 to <32 x i32>
  %61 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %60)
  %62 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %61)
  %63 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %59, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %62)
  %64 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %63)
  %65 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %57, <32 x i32> %64)
  %66 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %65)
  %67 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %66, <32 x i32> %22)
  %68 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %67, <32 x i32> %66, <32 x i32> %22)
  %69 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %68, <32 x i32> %50)
  %70 = extractelement <1 x i32> %arg.11, i32 0
  %71 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %70)
  %72 = bitcast <128 x i8> %arg.9 to <32 x i32>
  %73 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %72)
  %74 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %73)
  %75 = bitcast <128 x i16> %arg.10 to <64 x i32>
  %76 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %74, <64 x i32> %75)
  %77 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %76)
  %78 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %77)
  %79 = bitcast <128 x i8> %arg.7 to <32 x i32>
  %80 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %79)
  %81 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %80)
  %82 = bitcast <128 x i16> %arg.8 to <64 x i32>
  %83 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %81, <64 x i32> %82)
  %84 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %83)
  %85 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %84)
  %86 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %78, <32 x i32> %85)
  %87 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %86)
  %88 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %87, <32 x i32> %22)
  %89 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %88, <32 x i32> %87, <32 x i32> %22)
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %89, <32 x i32> %71)
  %91 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %90, <32 x i32> %arg.6)
  %92 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %69, <32 x i32> %91)
  %93 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %48, <32 x i32> %92)
  %94 = extractelement <1 x i32> %arg.39, i32 0
  %95 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %94)
  %96 = bitcast <128 x i16> %arg.36 to <64 x i32>
  %97 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %96)
  %98 = bitcast <128 x i8> %arg.35 to <32 x i32>
  %99 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %98)
  %100 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %99)
  %101 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %97, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %100)
  %102 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %101)
  %103 = bitcast <128 x i16> %arg.38 to <64 x i32>
  %104 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %103)
  %105 = bitcast <128 x i8> %arg.37 to <32 x i32>
  %106 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %105)
  %107 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %106)
  %108 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %104, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %107)
  %109 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %108)
  %110 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %102, <32 x i32> %109)
  %111 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %110)
  %112 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %111, <32 x i32> %22)
  %113 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %112, <32 x i32> %111, <32 x i32> %22)
  %114 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %113, <32 x i32> %95)
  %115 = extractelement <1 x i32> %arg.45, i32 0
  %116 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %115)
  %117 = bitcast <128 x i8> %arg.41 to <32 x i32>
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %117)
  %119 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.42 to <64 x i32>
  %121 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %119, <64 x i32> %120)
  %122 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %121)
  %123 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %122)
  %124 = bitcast <128 x i8> %arg.43 to <32 x i32>
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %124)
  %126 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %125)
  %127 = bitcast <128 x i16> %arg.44 to <64 x i32>
  %128 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %127, <64 x i32> %126)
  %129 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %128)
  %130 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %129)
  %131 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %123, <32 x i32> %130)
  %132 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %131)
  %133 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %132, <32 x i32> %22)
  %134 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %133, <32 x i32> %132, <32 x i32> %22)
  %135 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %116)
  %136 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %135, <32 x i32> %arg.40)
  %137 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %114, <32 x i32> %136)
  %138 = extractelement <1 x i32> %arg.28, i32 0
  %139 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %138)
  %140 = bitcast <128 x i16> %arg.25 to <64 x i32>
  %141 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %140)
  %142 = bitcast <128 x i8> %arg.24 to <32 x i32>
  %143 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %142)
  %144 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %143)
  %145 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %141, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %144)
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %145)
  %147 = bitcast <128 x i16> %arg.27 to <64 x i32>
  %148 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %147)
  %149 = bitcast <128 x i8> %arg.26 to <32 x i32>
  %150 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %149)
  %151 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %148, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %151)
  %153 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %152)
  %154 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %146, <32 x i32> %153)
  %155 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %154)
  %156 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %155, <32 x i32> %22)
  %157 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %156, <32 x i32> %155, <32 x i32> %22)
  %158 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %139)
  %159 = extractelement <1 x i32> %arg.34, i32 0
  %160 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %159)
  %161 = bitcast <128 x i8> %arg.30 to <32 x i32>
  %162 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %161)
  %163 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %162)
  %164 = bitcast <128 x i16> %arg.31 to <64 x i32>
  %165 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %163, <64 x i32> %164)
  %166 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %165)
  %167 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %166)
  %168 = bitcast <128 x i8> %arg.32 to <32 x i32>
  %169 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %168)
  %170 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %169)
  %171 = bitcast <128 x i16> %arg.33 to <64 x i32>
  %172 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %171, <64 x i32> %170)
  %173 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %172)
  %174 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %173)
  %175 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %167, <32 x i32> %174)
  %176 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %175)
  %177 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %176, <32 x i32> %22)
  %178 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %177, <32 x i32> %176, <32 x i32> %22)
  %179 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %178, <32 x i32> %160)
  %180 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %179, <32 x i32> %arg.29)
  %181 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %158, <32 x i32> %180)
  %182 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %137, <32 x i32> %181)
  %183 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %93, <32 x i32> %182)
  %184 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %2, <64 x i32> %183)
  %185 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %184)
  %186 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %184)
  %187 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %185, <32 x i32> %186)
  %188 = bitcast <128 x i8> %arg.47 to <32 x i32>
  %189 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %187, <32 x i32> %188)
  %190 = bitcast <128 x i8> %arg.48 to <32 x i32>
  %191 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %190, <32 x i32> %189)
  %192 = bitcast <32 x i32> %191 to <128 x i8>
  ret <128 x i8> %192
}

; Function Attrs: nounwind readnone willreturn
define <128 x i8> @hydride.node.mul_hvx_depth3.2(<128 x i8> %arg, <128 x i16> %arg.1, <128 x i8> %arg.2, <128 x i16> %arg.3, <1 x i32> %arg.4, <1 x i32> %arg.5, <32 x i32> %arg.6, <128 x i8> %arg.7, <128 x i16> %arg.8, <128 x i8> %arg.9, <128 x i16> %arg.10, <1 x i32> %arg.11, <128 x i8> %arg.12, <128 x i16> %arg.13, <128 x i8> %arg.14, <128 x i16> %arg.15, <1 x i32> %arg.16, <32 x i32> %arg.17, <128 x i8> %arg.18, <128 x i16> %arg.19, <128 x i8> %arg.20, <128 x i16> %arg.21, <1 x i32> %arg.22, <64 x i16> %arg.23, <128 x i8> %arg.24, <128 x i16> %arg.25, <128 x i8> %arg.26, <128 x i16> %arg.27, <1 x i32> %arg.28, <32 x i32> %arg.29, <128 x i8> %arg.30, <128 x i16> %arg.31, <128 x i8> %arg.32, <128 x i16> %arg.33, <1 x i32> %arg.34, <128 x i8> %arg.35, <128 x i16> %arg.36, <128 x i8> %arg.37, <128 x i16> %arg.38, <1 x i32> %arg.39, <32 x i32> %arg.40, <128 x i8> %arg.41, <128 x i16> %arg.42, <128 x i8> %arg.43, <128 x i16> %arg.44, <1 x i32> %arg.45, <64 x i16> %arg.46, <128 x i8> %arg.47, <128 x i8> %arg.48) local_unnamed_addr #14 {
entry:
  %0 = bitcast <64 x i16> %arg.23 to <32 x i32>
  %1 = bitcast <64 x i16> %arg.46 to <32 x i32>
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %0, <32 x i32> %1)
  %3 = extractelement <1 x i32> %arg.16, i32 0
  %4 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %3)
  %5 = bitcast <128 x i16> %arg.13 to <64 x i32>
  %6 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %5)
  %7 = bitcast <128 x i8> %arg.12 to <32 x i32>
  %8 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %7)
  %9 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %8)
  %10 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %6, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %9)
  %11 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %10)
  %12 = bitcast <128 x i16> %arg.15 to <64 x i32>
  %13 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %12)
  %14 = bitcast <128 x i8> %arg.14 to <32 x i32>
  %15 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %14)
  %16 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %15)
  %17 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %13, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %16)
  %18 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %17)
  %19 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %11, <32 x i32> %18)
  %20 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %19)
  %21 = extractelement <1 x i32> %arg.4, i32 0
  %22 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %21)
  %23 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %20, <32 x i32> %22)
  %24 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %23, <32 x i32> %20, <32 x i32> %22)
  %25 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %24, <32 x i32> %4)
  %26 = extractelement <1 x i32> %arg.22, i32 0
  %27 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %26)
  %28 = bitcast <128 x i8> %arg.20 to <32 x i32>
  %29 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %28)
  %30 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %29)
  %31 = bitcast <128 x i16> %arg.21 to <64 x i32>
  %32 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %30, <64 x i32> %31)
  %33 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %32)
  %34 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %33)
  %35 = bitcast <128 x i8> %arg.18 to <32 x i32>
  %36 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %35)
  %37 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %36)
  %38 = bitcast <128 x i16> %arg.19 to <64 x i32>
  %39 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %37, <64 x i32> %38)
  %40 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %39)
  %41 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %40)
  %42 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %34, <32 x i32> %41)
  %43 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %42)
  %44 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %43, <32 x i32> %22)
  %45 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %44, <32 x i32> %43, <32 x i32> %22)
  %46 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %45, <32 x i32> %27)
  %47 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %46, <32 x i32> %arg.17)
  %48 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %25, <32 x i32> %47)
  %49 = extractelement <1 x i32> %arg.5, i32 0
  %50 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %49)
  %51 = bitcast <128 x i16> %arg.1 to <64 x i32>
  %52 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %51)
  %53 = bitcast <128 x i8> %arg to <32 x i32>
  %54 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %53)
  %55 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %54)
  %56 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %52, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %55)
  %57 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %56)
  %58 = bitcast <128 x i16> %arg.3 to <64 x i32>
  %59 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %58)
  %60 = bitcast <128 x i8> %arg.2 to <32 x i32>
  %61 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %60)
  %62 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %61)
  %63 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %59, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %62)
  %64 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %63)
  %65 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %57, <32 x i32> %64)
  %66 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %65)
  %67 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %66, <32 x i32> %22)
  %68 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %67, <32 x i32> %66, <32 x i32> %22)
  %69 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %68, <32 x i32> %50)
  %70 = extractelement <1 x i32> %arg.11, i32 0
  %71 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %70)
  %72 = bitcast <128 x i8> %arg.9 to <32 x i32>
  %73 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %72)
  %74 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %73)
  %75 = bitcast <128 x i16> %arg.10 to <64 x i32>
  %76 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %74, <64 x i32> %75)
  %77 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %76)
  %78 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %77)
  %79 = bitcast <128 x i8> %arg.7 to <32 x i32>
  %80 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %79)
  %81 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %80)
  %82 = bitcast <128 x i16> %arg.8 to <64 x i32>
  %83 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %81, <64 x i32> %82)
  %84 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %83)
  %85 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %84)
  %86 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %78, <32 x i32> %85)
  %87 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %86)
  %88 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %87, <32 x i32> %22)
  %89 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %88, <32 x i32> %87, <32 x i32> %22)
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %89, <32 x i32> %71)
  %91 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %90, <32 x i32> %arg.6)
  %92 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %69, <32 x i32> %91)
  %93 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %48, <32 x i32> %92)
  %94 = extractelement <1 x i32> %arg.39, i32 0
  %95 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %94)
  %96 = bitcast <128 x i16> %arg.36 to <64 x i32>
  %97 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %96)
  %98 = bitcast <128 x i8> %arg.35 to <32 x i32>
  %99 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %98)
  %100 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %99)
  %101 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %97, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %100)
  %102 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %101)
  %103 = bitcast <128 x i16> %arg.38 to <64 x i32>
  %104 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %103)
  %105 = bitcast <128 x i8> %arg.37 to <32 x i32>
  %106 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %105)
  %107 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %106)
  %108 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %104, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %107)
  %109 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %108)
  %110 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %102, <32 x i32> %109)
  %111 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %110)
  %112 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %111, <32 x i32> %22)
  %113 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %112, <32 x i32> %111, <32 x i32> %22)
  %114 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %113, <32 x i32> %95)
  %115 = extractelement <1 x i32> %arg.45, i32 0
  %116 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %115)
  %117 = bitcast <128 x i8> %arg.41 to <32 x i32>
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %117)
  %119 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.42 to <64 x i32>
  %121 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %119, <64 x i32> %120)
  %122 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %121)
  %123 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %122)
  %124 = bitcast <128 x i8> %arg.43 to <32 x i32>
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %124)
  %126 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %125)
  %127 = bitcast <128 x i16> %arg.44 to <64 x i32>
  %128 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %127, <64 x i32> %126)
  %129 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %128)
  %130 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %129)
  %131 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %123, <32 x i32> %130)
  %132 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %131)
  %133 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %132, <32 x i32> %22)
  %134 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %133, <32 x i32> %132, <32 x i32> %22)
  %135 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %116)
  %136 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %135, <32 x i32> %arg.40)
  %137 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %114, <32 x i32> %136)
  %138 = extractelement <1 x i32> %arg.28, i32 0
  %139 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %138)
  %140 = bitcast <128 x i16> %arg.25 to <64 x i32>
  %141 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %140)
  %142 = bitcast <128 x i8> %arg.24 to <32 x i32>
  %143 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %142)
  %144 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %143)
  %145 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %141, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %144)
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %145)
  %147 = bitcast <128 x i16> %arg.27 to <64 x i32>
  %148 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %147)
  %149 = bitcast <128 x i8> %arg.26 to <32 x i32>
  %150 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %149)
  %151 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %148, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %151)
  %153 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %152)
  %154 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %146, <32 x i32> %153)
  %155 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %154)
  %156 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %155, <32 x i32> %22)
  %157 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %156, <32 x i32> %155, <32 x i32> %22)
  %158 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %139)
  %159 = extractelement <1 x i32> %arg.34, i32 0
  %160 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %159)
  %161 = bitcast <128 x i8> %arg.30 to <32 x i32>
  %162 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %161)
  %163 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %162)
  %164 = bitcast <128 x i16> %arg.31 to <64 x i32>
  %165 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %163, <64 x i32> %164)
  %166 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %165)
  %167 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %166)
  %168 = bitcast <128 x i8> %arg.32 to <32 x i32>
  %169 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %168)
  %170 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %169)
  %171 = bitcast <128 x i16> %arg.33 to <64 x i32>
  %172 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %171, <64 x i32> %170)
  %173 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %172)
  %174 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %173)
  %175 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %167, <32 x i32> %174)
  %176 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %175)
  %177 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %176, <32 x i32> %22)
  %178 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %177, <32 x i32> %176, <32 x i32> %22)
  %179 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %178, <32 x i32> %160)
  %180 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %179, <32 x i32> %arg.29)
  %181 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %158, <32 x i32> %180)
  %182 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %137, <32 x i32> %181)
  %183 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %93, <32 x i32> %182)
  %184 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %2, <64 x i32> %183)
  %185 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %184)
  %186 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %184)
  %187 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %185, <32 x i32> %186)
  %188 = bitcast <128 x i8> %arg.47 to <32 x i32>
  %189 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %187, <32 x i32> %188)
  %190 = bitcast <128 x i8> %arg.48 to <32 x i32>
  %191 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %190, <32 x i32> %189)
  %192 = bitcast <32 x i32> %191 to <128 x i8>
  ret <128 x i8> %192
}

; Function Attrs: nounwind readnone willreturn
define <128 x i8> @hydride.node.mul_hvx_depth3.3(<128 x i8> %arg, <128 x i16> %arg.1, <64 x i16> %arg.2, <1 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <128 x i8> %arg.6, <128 x i16> %arg.7, <64 x i16> %arg.8, <1 x i32> %arg.9, <128 x i8> %arg.10, <128 x i16> %arg.11, <64 x i16> %arg.12, <1 x i32> %arg.13, <32 x i32> %arg.14, <128 x i8> %arg.15, <128 x i16> %arg.16, <64 x i16> %arg.17, <1 x i32> %arg.18, <64 x i16> %arg.19, <128 x i8> %arg.20, <128 x i16> %arg.21, <64 x i16> %arg.22, <1 x i32> %arg.23, <32 x i32> %arg.24, <128 x i8> %arg.25, <128 x i16> %arg.26, <64 x i16> %arg.27, <1 x i32> %arg.28, <128 x i8> %arg.29, <128 x i16> %arg.30, <64 x i16> %arg.31, <1 x i32> %arg.32, <32 x i32> %arg.33, <128 x i8> %arg.34, <128 x i16> %arg.35, <64 x i16> %arg.36, <1 x i32> %arg.37, <64 x i16> %arg.38, <128 x i8> %arg.39, <128 x i8> %arg.40) local_unnamed_addr #14 {
entry:
  %0 = bitcast <64 x i16> %arg.19 to <32 x i32>
  %1 = bitcast <64 x i16> %arg.38 to <32 x i32>
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %0, <32 x i32> %1)
  %3 = extractelement <1 x i32> %arg.13, i32 0
  %4 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %3)
  %5 = bitcast <128 x i16> %arg.11 to <64 x i32>
  %6 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %5)
  %7 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %8 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %7)
  %9 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %8)
  %10 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %6, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %9)
  %11 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %10)
  %12 = bitcast <64 x i16> %arg.12 to <32 x i32>
  %13 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %12)
  %14 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %11, <32 x i32> %13)
  %15 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %14)
  %16 = extractelement <1 x i32> %arg.3, i32 0
  %17 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %16)
  %18 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %15, <32 x i32> %17)
  %19 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %18, <32 x i32> %15, <32 x i32> %17)
  %20 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %19, <32 x i32> %4)
  %21 = extractelement <1 x i32> %arg.18, i32 0
  %22 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %21)
  %23 = bitcast <128 x i8> %arg.15 to <32 x i32>
  %24 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %23)
  %25 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %24)
  %26 = bitcast <128 x i16> %arg.16 to <64 x i32>
  %27 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %25, <64 x i32> %26)
  %28 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %27)
  %29 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %27)
  %30 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %28, <32 x i32> %29, i32 -2)
  %31 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %30)
  %32 = bitcast <64 x i16> %arg.17 to <32 x i32>
  %33 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %32, <32 x i32> %31)
  %34 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %33)
  %35 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %34, <32 x i32> %17)
  %36 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %35, <32 x i32> %34, <32 x i32> %17)
  %37 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %36, <32 x i32> %22)
  %38 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %37, <32 x i32> %arg.14)
  %39 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %20, <32 x i32> %38)
  %40 = extractelement <1 x i32> %arg.4, i32 0
  %41 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %40)
  %42 = bitcast <128 x i16> %arg.1 to <64 x i32>
  %43 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %42)
  %44 = bitcast <128 x i8> %arg to <32 x i32>
  %45 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %44)
  %46 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %45)
  %47 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %43, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %46)
  %48 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %47)
  %49 = bitcast <64 x i16> %arg.2 to <32 x i32>
  %50 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %49)
  %51 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %48, <32 x i32> %50)
  %52 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %51)
  %53 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %52, <32 x i32> %17)
  %54 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %53, <32 x i32> %52, <32 x i32> %17)
  %55 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %54, <32 x i32> %41)
  %56 = extractelement <1 x i32> %arg.9, i32 0
  %57 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %56)
  %58 = bitcast <128 x i8> %arg.6 to <32 x i32>
  %59 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %58)
  %60 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %59)
  %61 = bitcast <128 x i16> %arg.7 to <64 x i32>
  %62 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %60, <64 x i32> %61)
  %63 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %62)
  %64 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %62)
  %65 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %63, <32 x i32> %64, i32 -2)
  %66 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %65)
  %67 = bitcast <64 x i16> %arg.8 to <32 x i32>
  %68 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %67, <32 x i32> %66)
  %69 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %68)
  %70 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %69, <32 x i32> %17)
  %71 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %70, <32 x i32> %69, <32 x i32> %17)
  %72 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %71, <32 x i32> %57)
  %73 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %72, <32 x i32> %arg.5)
  %74 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %55, <32 x i32> %73)
  %75 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %39, <32 x i32> %74)
  %76 = extractelement <1 x i32> %arg.32, i32 0
  %77 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %76)
  %78 = bitcast <128 x i16> %arg.30 to <64 x i32>
  %79 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %78)
  %80 = bitcast <128 x i8> %arg.29 to <32 x i32>
  %81 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %80)
  %82 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %81)
  %83 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %79, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %82)
  %84 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %83)
  %85 = bitcast <64 x i16> %arg.31 to <32 x i32>
  %86 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %85)
  %87 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %84, <32 x i32> %86)
  %88 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %87)
  %89 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %88, <32 x i32> %17)
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %89, <32 x i32> %88, <32 x i32> %17)
  %91 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %90, <32 x i32> %77)
  %92 = extractelement <1 x i32> %arg.37, i32 0
  %93 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %92)
  %94 = bitcast <128 x i8> %arg.34 to <32 x i32>
  %95 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %94)
  %96 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %95)
  %97 = bitcast <128 x i16> %arg.35 to <64 x i32>
  %98 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %96, <64 x i32> %97)
  %99 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %98)
  %100 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %98)
  %101 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %99, <32 x i32> %100, i32 -2)
  %102 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %101)
  %103 = bitcast <64 x i16> %arg.36 to <32 x i32>
  %104 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %103, <32 x i32> %102)
  %105 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %104)
  %106 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %105, <32 x i32> %17)
  %107 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %106, <32 x i32> %105, <32 x i32> %17)
  %108 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %107, <32 x i32> %93)
  %109 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %108, <32 x i32> %arg.33)
  %110 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %91, <32 x i32> %109)
  %111 = extractelement <1 x i32> %arg.23, i32 0
  %112 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %111)
  %113 = bitcast <128 x i16> %arg.21 to <64 x i32>
  %114 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = bitcast <128 x i8> %arg.20 to <32 x i32>
  %116 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %115)
  %117 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %114, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %117)
  %119 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %118)
  %120 = bitcast <64 x i16> %arg.22 to <32 x i32>
  %121 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %120)
  %122 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %119, <32 x i32> %121)
  %123 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %122)
  %124 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %123, <32 x i32> %17)
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %124, <32 x i32> %123, <32 x i32> %17)
  %126 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %125, <32 x i32> %112)
  %127 = extractelement <1 x i32> %arg.28, i32 0
  %128 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %127)
  %129 = bitcast <128 x i8> %arg.25 to <32 x i32>
  %130 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %129)
  %131 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %130)
  %132 = bitcast <128 x i16> %arg.26 to <64 x i32>
  %133 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %131, <64 x i32> %132)
  %134 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %133)
  %135 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %133)
  %136 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %134, <32 x i32> %135, i32 -2)
  %137 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %136)
  %138 = bitcast <64 x i16> %arg.27 to <32 x i32>
  %139 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %138, <32 x i32> %137)
  %140 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %139)
  %141 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %140, <32 x i32> %17)
  %142 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %141, <32 x i32> %140, <32 x i32> %17)
  %143 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %128)
  %144 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %143, <32 x i32> %arg.24)
  %145 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %126, <32 x i32> %144)
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %110, <32 x i32> %145)
  %147 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %75, <32 x i32> %146)
  %148 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %2, <64 x i32> %147)
  %149 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %148)
  %150 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %148)
  %151 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %149, <32 x i32> %150)
  %152 = bitcast <128 x i8> %arg.39 to <32 x i32>
  %153 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %151, <32 x i32> %152)
  %154 = bitcast <128 x i8> %arg.40 to <32 x i32>
  %155 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %154, <32 x i32> %153)
  %156 = bitcast <32 x i32> %155 to <128 x i8>
  ret <128 x i8> %156
}

; Function Attrs: nounwind readnone willreturn
define <128 x i8> @hydride.node.mul_hvx_depth3.4(<128 x i8> %arg, <128 x i16> %arg.1, <64 x i16> %arg.2, <1 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <128 x i8> %arg.6, <128 x i16> %arg.7, <64 x i16> %arg.8, <1 x i32> %arg.9, <128 x i8> %arg.10, <128 x i16> %arg.11, <64 x i16> %arg.12, <1 x i32> %arg.13, <32 x i32> %arg.14, <128 x i8> %arg.15, <128 x i16> %arg.16, <64 x i16> %arg.17, <1 x i32> %arg.18, <64 x i16> %arg.19, <128 x i8> %arg.20, <128 x i16> %arg.21, <64 x i16> %arg.22, <1 x i32> %arg.23, <32 x i32> %arg.24, <128 x i8> %arg.25, <128 x i16> %arg.26, <64 x i16> %arg.27, <1 x i32> %arg.28, <128 x i8> %arg.29, <128 x i16> %arg.30, <64 x i16> %arg.31, <1 x i32> %arg.32, <32 x i32> %arg.33, <128 x i8> %arg.34, <128 x i16> %arg.35, <64 x i16> %arg.36, <1 x i32> %arg.37, <64 x i16> %arg.38, <128 x i8> %arg.39, <128 x i8> %arg.40) local_unnamed_addr #14 {
entry:
  %0 = bitcast <64 x i16> %arg.19 to <32 x i32>
  %1 = bitcast <64 x i16> %arg.38 to <32 x i32>
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %0, <32 x i32> %1)
  %3 = extractelement <1 x i32> %arg.13, i32 0
  %4 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %3)
  %5 = bitcast <128 x i16> %arg.11 to <64 x i32>
  %6 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %5)
  %7 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %8 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %7)
  %9 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %8)
  %10 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %6, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %9)
  %11 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %10)
  %12 = bitcast <64 x i16> %arg.12 to <32 x i32>
  %13 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %12)
  %14 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %11, <32 x i32> %13)
  %15 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %14)
  %16 = extractelement <1 x i32> %arg.3, i32 0
  %17 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %16)
  %18 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %15, <32 x i32> %17)
  %19 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %18, <32 x i32> %15, <32 x i32> %17)
  %20 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %19, <32 x i32> %4)
  %21 = extractelement <1 x i32> %arg.18, i32 0
  %22 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %21)
  %23 = bitcast <128 x i8> %arg.15 to <32 x i32>
  %24 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %23)
  %25 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %24)
  %26 = bitcast <128 x i16> %arg.16 to <64 x i32>
  %27 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %25, <64 x i32> %26)
  %28 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %27)
  %29 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %27)
  %30 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %28, <32 x i32> %29, i32 -2)
  %31 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %30)
  %32 = bitcast <64 x i16> %arg.17 to <32 x i32>
  %33 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %32, <32 x i32> %31)
  %34 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %33)
  %35 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %34, <32 x i32> %17)
  %36 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %35, <32 x i32> %34, <32 x i32> %17)
  %37 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %36, <32 x i32> %22)
  %38 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %37, <32 x i32> %arg.14)
  %39 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %20, <32 x i32> %38)
  %40 = extractelement <1 x i32> %arg.4, i32 0
  %41 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %40)
  %42 = bitcast <128 x i16> %arg.1 to <64 x i32>
  %43 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %42)
  %44 = bitcast <128 x i8> %arg to <32 x i32>
  %45 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %44)
  %46 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %45)
  %47 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %43, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %46)
  %48 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %47)
  %49 = bitcast <64 x i16> %arg.2 to <32 x i32>
  %50 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %49)
  %51 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %48, <32 x i32> %50)
  %52 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %51)
  %53 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %52, <32 x i32> %17)
  %54 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %53, <32 x i32> %52, <32 x i32> %17)
  %55 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %54, <32 x i32> %41)
  %56 = extractelement <1 x i32> %arg.9, i32 0
  %57 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %56)
  %58 = bitcast <128 x i8> %arg.6 to <32 x i32>
  %59 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %58)
  %60 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %59)
  %61 = bitcast <128 x i16> %arg.7 to <64 x i32>
  %62 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %60, <64 x i32> %61)
  %63 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %62)
  %64 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %62)
  %65 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %63, <32 x i32> %64, i32 -2)
  %66 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %65)
  %67 = bitcast <64 x i16> %arg.8 to <32 x i32>
  %68 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %67, <32 x i32> %66)
  %69 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %68)
  %70 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %69, <32 x i32> %17)
  %71 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %70, <32 x i32> %69, <32 x i32> %17)
  %72 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %71, <32 x i32> %57)
  %73 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %72, <32 x i32> %arg.5)
  %74 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %55, <32 x i32> %73)
  %75 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %39, <32 x i32> %74)
  %76 = extractelement <1 x i32> %arg.32, i32 0
  %77 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %76)
  %78 = bitcast <128 x i16> %arg.30 to <64 x i32>
  %79 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %78)
  %80 = bitcast <128 x i8> %arg.29 to <32 x i32>
  %81 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %80)
  %82 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %81)
  %83 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %79, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %82)
  %84 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %83)
  %85 = bitcast <64 x i16> %arg.31 to <32 x i32>
  %86 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %85)
  %87 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %84, <32 x i32> %86)
  %88 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %87)
  %89 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %88, <32 x i32> %17)
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %89, <32 x i32> %88, <32 x i32> %17)
  %91 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %90, <32 x i32> %77)
  %92 = extractelement <1 x i32> %arg.37, i32 0
  %93 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %92)
  %94 = bitcast <128 x i8> %arg.34 to <32 x i32>
  %95 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %94)
  %96 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %95)
  %97 = bitcast <128 x i16> %arg.35 to <64 x i32>
  %98 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %96, <64 x i32> %97)
  %99 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %98)
  %100 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %98)
  %101 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %99, <32 x i32> %100, i32 -2)
  %102 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %101)
  %103 = bitcast <64 x i16> %arg.36 to <32 x i32>
  %104 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %103, <32 x i32> %102)
  %105 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %104)
  %106 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %105, <32 x i32> %17)
  %107 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %106, <32 x i32> %105, <32 x i32> %17)
  %108 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %107, <32 x i32> %93)
  %109 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %108, <32 x i32> %arg.33)
  %110 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %91, <32 x i32> %109)
  %111 = extractelement <1 x i32> %arg.23, i32 0
  %112 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %111)
  %113 = bitcast <128 x i16> %arg.21 to <64 x i32>
  %114 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = bitcast <128 x i8> %arg.20 to <32 x i32>
  %116 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %115)
  %117 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %114, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %117)
  %119 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %118)
  %120 = bitcast <64 x i16> %arg.22 to <32 x i32>
  %121 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %120)
  %122 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %119, <32 x i32> %121)
  %123 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %122)
  %124 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %123, <32 x i32> %17)
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %124, <32 x i32> %123, <32 x i32> %17)
  %126 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %125, <32 x i32> %112)
  %127 = extractelement <1 x i32> %arg.28, i32 0
  %128 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %127)
  %129 = bitcast <128 x i8> %arg.25 to <32 x i32>
  %130 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %129)
  %131 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %130)
  %132 = bitcast <128 x i16> %arg.26 to <64 x i32>
  %133 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %131, <64 x i32> %132)
  %134 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %133)
  %135 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %133)
  %136 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %134, <32 x i32> %135, i32 -2)
  %137 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %136)
  %138 = bitcast <64 x i16> %arg.27 to <32 x i32>
  %139 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %138, <32 x i32> %137)
  %140 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %139)
  %141 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %140, <32 x i32> %17)
  %142 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %141, <32 x i32> %140, <32 x i32> %17)
  %143 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %128)
  %144 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %143, <32 x i32> %arg.24)
  %145 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %126, <32 x i32> %144)
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %110, <32 x i32> %145)
  %147 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %75, <32 x i32> %146)
  %148 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %2, <64 x i32> %147)
  %149 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %148)
  %150 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %148)
  %151 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %149, <32 x i32> %150)
  %152 = bitcast <128 x i8> %arg.39 to <32 x i32>
  %153 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %151, <32 x i32> %152)
  %154 = bitcast <128 x i8> %arg.40 to <32 x i32>
  %155 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %154, <32 x i32> %153)
  %156 = bitcast <32 x i32> %155 to <128 x i8>
  ret <128 x i8> %156
}

; Function Attrs: nounwind readnone willreturn
define <128 x i8> @hydride.node.mul_hvx_depth3.5(<128 x i8> %arg, <128 x i16> %arg.1, <64 x i16> %arg.2, <1 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <128 x i8> %arg.6, <128 x i16> %arg.7, <64 x i16> %arg.8, <1 x i32> %arg.9, <128 x i8> %arg.10, <128 x i16> %arg.11, <64 x i16> %arg.12, <1 x i32> %arg.13, <32 x i32> %arg.14, <128 x i8> %arg.15, <128 x i16> %arg.16, <64 x i16> %arg.17, <1 x i32> %arg.18, <64 x i16> %arg.19, <128 x i8> %arg.20, <128 x i16> %arg.21, <64 x i16> %arg.22, <1 x i32> %arg.23, <32 x i32> %arg.24, <128 x i8> %arg.25, <128 x i16> %arg.26, <64 x i16> %arg.27, <1 x i32> %arg.28, <128 x i8> %arg.29, <128 x i16> %arg.30, <64 x i16> %arg.31, <1 x i32> %arg.32, <32 x i32> %arg.33, <128 x i8> %arg.34, <128 x i16> %arg.35, <64 x i16> %arg.36, <1 x i32> %arg.37, <64 x i16> %arg.38, <128 x i8> %arg.39, <128 x i8> %arg.40) local_unnamed_addr #14 {
entry:
  %0 = bitcast <64 x i16> %arg.19 to <32 x i32>
  %1 = bitcast <64 x i16> %arg.38 to <32 x i32>
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %0, <32 x i32> %1)
  %3 = extractelement <1 x i32> %arg.13, i32 0
  %4 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %3)
  %5 = bitcast <128 x i16> %arg.11 to <64 x i32>
  %6 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %5)
  %7 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %8 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %7)
  %9 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %8)
  %10 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %6, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %9)
  %11 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %10)
  %12 = bitcast <64 x i16> %arg.12 to <32 x i32>
  %13 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %12)
  %14 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %11, <32 x i32> %13)
  %15 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %14)
  %16 = extractelement <1 x i32> %arg.3, i32 0
  %17 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %16)
  %18 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %15, <32 x i32> %17)
  %19 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %18, <32 x i32> %15, <32 x i32> %17)
  %20 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %19, <32 x i32> %4)
  %21 = extractelement <1 x i32> %arg.18, i32 0
  %22 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %21)
  %23 = bitcast <128 x i8> %arg.15 to <32 x i32>
  %24 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %23)
  %25 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %24)
  %26 = bitcast <128 x i16> %arg.16 to <64 x i32>
  %27 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %25, <64 x i32> %26)
  %28 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %27)
  %29 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %27)
  %30 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %28, <32 x i32> %29, i32 -2)
  %31 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %30)
  %32 = bitcast <64 x i16> %arg.17 to <32 x i32>
  %33 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %32, <32 x i32> %31)
  %34 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %33)
  %35 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %34, <32 x i32> %17)
  %36 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %35, <32 x i32> %34, <32 x i32> %17)
  %37 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %36, <32 x i32> %22)
  %38 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %37, <32 x i32> %arg.14)
  %39 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %20, <32 x i32> %38)
  %40 = extractelement <1 x i32> %arg.4, i32 0
  %41 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %40)
  %42 = bitcast <128 x i16> %arg.1 to <64 x i32>
  %43 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %42)
  %44 = bitcast <128 x i8> %arg to <32 x i32>
  %45 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %44)
  %46 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %45)
  %47 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %43, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %46)
  %48 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %47)
  %49 = bitcast <64 x i16> %arg.2 to <32 x i32>
  %50 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %49)
  %51 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %48, <32 x i32> %50)
  %52 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %51)
  %53 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %52, <32 x i32> %17)
  %54 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %53, <32 x i32> %52, <32 x i32> %17)
  %55 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %54, <32 x i32> %41)
  %56 = extractelement <1 x i32> %arg.9, i32 0
  %57 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %56)
  %58 = bitcast <128 x i8> %arg.6 to <32 x i32>
  %59 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %58)
  %60 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %59)
  %61 = bitcast <128 x i16> %arg.7 to <64 x i32>
  %62 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %60, <64 x i32> %61)
  %63 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %62)
  %64 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %62)
  %65 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %63, <32 x i32> %64, i32 -2)
  %66 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %65)
  %67 = bitcast <64 x i16> %arg.8 to <32 x i32>
  %68 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %67, <32 x i32> %66)
  %69 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %68)
  %70 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %69, <32 x i32> %17)
  %71 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %70, <32 x i32> %69, <32 x i32> %17)
  %72 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %71, <32 x i32> %57)
  %73 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %72, <32 x i32> %arg.5)
  %74 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %55, <32 x i32> %73)
  %75 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %39, <32 x i32> %74)
  %76 = extractelement <1 x i32> %arg.32, i32 0
  %77 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %76)
  %78 = bitcast <128 x i16> %arg.30 to <64 x i32>
  %79 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %78)
  %80 = bitcast <128 x i8> %arg.29 to <32 x i32>
  %81 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %80)
  %82 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %81)
  %83 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %79, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %82)
  %84 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %83)
  %85 = bitcast <64 x i16> %arg.31 to <32 x i32>
  %86 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %85)
  %87 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %84, <32 x i32> %86)
  %88 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %87)
  %89 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %88, <32 x i32> %17)
  %90 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %89, <32 x i32> %88, <32 x i32> %17)
  %91 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %90, <32 x i32> %77)
  %92 = extractelement <1 x i32> %arg.37, i32 0
  %93 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %92)
  %94 = bitcast <128 x i8> %arg.34 to <32 x i32>
  %95 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %94)
  %96 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %95)
  %97 = bitcast <128 x i16> %arg.35 to <64 x i32>
  %98 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %96, <64 x i32> %97)
  %99 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %98)
  %100 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %98)
  %101 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %99, <32 x i32> %100, i32 -2)
  %102 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %101)
  %103 = bitcast <64 x i16> %arg.36 to <32 x i32>
  %104 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %103, <32 x i32> %102)
  %105 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %104)
  %106 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %105, <32 x i32> %17)
  %107 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %106, <32 x i32> %105, <32 x i32> %17)
  %108 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %107, <32 x i32> %93)
  %109 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %108, <32 x i32> %arg.33)
  %110 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %91, <32 x i32> %109)
  %111 = extractelement <1 x i32> %arg.23, i32 0
  %112 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %111)
  %113 = bitcast <128 x i16> %arg.21 to <64 x i32>
  %114 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = bitcast <128 x i8> %arg.20 to <32 x i32>
  %116 = tail call <64 x i32> @llvm.hexagon.V6.vunpackub.128B(<32 x i32> %115)
  %117 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = tail call <32 x i32> @llvm.hexagon.V6.vmpyih.acc.128B(<32 x i32> %114, <32 x i32> <i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368, i32 4194368>, <32 x i32> %117)
  %119 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %118)
  %120 = bitcast <64 x i16> %arg.22 to <32 x i32>
  %121 = tail call <32 x i32> @llvm.hexagon.V6.vshuffh.128B(<32 x i32> %120)
  %122 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %119, <32 x i32> %121)
  %123 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %122)
  %124 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %123, <32 x i32> %17)
  %125 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %124, <32 x i32> %123, <32 x i32> %17)
  %126 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %125, <32 x i32> %112)
  %127 = extractelement <1 x i32> %arg.28, i32 0
  %128 = tail call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %127)
  %129 = bitcast <128 x i8> %arg.25 to <32 x i32>
  %130 = tail call <32 x i32> @llvm.hexagon.V6.vshuffb.128B(<32 x i32> %129)
  %131 = tail call <64 x i32> @llvm.hexagon.V6.vmpyubv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> <i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576, i32 1077952576>, <32 x i32> %130)
  %132 = bitcast <128 x i16> %arg.26 to <64 x i32>
  %133 = tail call <64 x i32> @llvm.hexagon.V6.vaddh.dv.128B(<64 x i32> %131, <64 x i32> %132)
  %134 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %133)
  %135 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %133)
  %136 = tail call <64 x i32> @llvm.hexagon.V6.vshuffvdd.128B(<32 x i32> %134, <32 x i32> %135, i32 -2)
  %137 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %136)
  %138 = bitcast <64 x i16> %arg.27 to <32 x i32>
  %139 = tail call <64 x i32> @llvm.hexagon.V6.vmpyhv.acc.128B(<64 x i32> zeroinitializer, <32 x i32> %138, <32 x i32> %137)
  %140 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %139)
  %141 = tail call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %140, <32 x i32> %17)
  %142 = tail call <32 x i32> @llvm.hexagon.V6.vmpyowh.sacc.128B(<32 x i32> %141, <32 x i32> %140, <32 x i32> %17)
  %143 = tail call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %128)
  %144 = tail call <32 x i32> @llvm.hexagon.V6.vand.128B(<32 x i32> %143, <32 x i32> %arg.24)
  %145 = tail call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %126, <32 x i32> %144)
  %146 = tail call <32 x i32> @llvm.hexagon.V6.vsatwh.128B(<32 x i32> %110, <32 x i32> %145)
  %147 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %75, <32 x i32> %146)
  %148 = tail call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %2, <64 x i32> %147)
  %149 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %148)
  %150 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %148)
  %151 = tail call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %149, <32 x i32> %150)
  %152 = bitcast <128 x i8> %arg.39 to <32 x i32>
  %153 = tail call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %151, <32 x i32> %152)
  %154 = bitcast <128 x i8> %arg.40 to <32 x i32>
  %155 = tail call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %154, <32 x i32> %153)
  %156 = bitcast <32 x i32> %155 to <128 x i8>
  ret <128 x i8> %156
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
attributes #13 = { nofree nosync nounwind readnone willreturn }
attributes #14 = { nounwind readnone willreturn }
attributes #15 = { nobuiltin nounwind "no-builtins" }
attributes #16 = { nobuiltin "no-builtins" }
attributes #17 = { noinline }

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
!96 = !{!97, !97, i64 0}
!97 = !{!"input1", !98, i64 0}
!98 = !{!"Halide buffer"}
!99 = !{!100, !100, i64 0}
!100 = !{!"input2", !98, i64 0}
!101 = !{!102, !102, i64 0}
!102 = !{!"output", !98, i64 0}
