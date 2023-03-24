; ModuleID = 'conv_nn_hvx128'
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
@0 = private constant i64 0
@1 = private constant [8 x i64*] [i64* @0, i64* null, i64* null, i64* null, i64* null, i64* null, i64* null, i64* null]
@str = private constant [6 x i8] c"input\00", align 32
@str.102 = private constant [11 x i8] c"input_zero\00", align 32
@2 = private constant i64 0
@3 = private constant i64 4
@4 = private constant i64 0
@5 = private constant i64 32
@6 = private constant i64 0
@7 = private constant i64 0
@8 = private constant i64 0
@9 = private constant i64 0
@10 = private constant [12 x i64*] [i64* @2, i64* @3, i64* @4, i64* @5, i64* @6, i64* null, i64* @7, i64* null, i64* @8, i64* null, i64* @9, i64* null]
@str.103 = private constant [7 x i8] c"filter\00", align 32
@str.104 = private constant [12 x i8] c"filter_zero\00", align 32
@11 = private constant i64 0
@12 = private constant [2 x i64*] [i64* @11, i64* null]
@str.105 = private constant [5 x i8] c"bias\00", align 32
@str.106 = private constant [9 x i8] c"stride_x\00", align 32
@str.107 = private constant [9 x i8] c"stride_y\00", align 32
@str.108 = private constant [11 x i8] c"dilation_x\00", align 32
@str.109 = private constant [11 x i8] c"dilation_y\00", align 32
@str.110 = private constant [18 x i8] c"output_multiplier\00", align 32
@str.111 = private constant [13 x i8] c"output_shift\00", align 32
@str.112 = private constant [12 x i8] c"output_zero\00", align 32
@str.113 = private constant [11 x i8] c"output_min\00", align 32
@str.114 = private constant [11 x i8] c"output_max\00", align 32
@13 = private constant i64 0
@14 = private constant [8 x i64*] [i64* @13, i64* null, i64* null, i64* null, i64* null, i64* null, i64* null, i64* null]
@str.115 = private constant [7 x i8] c"output\00", align 32
@15 = private constant [15 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str, i32 0, i32 0), i32 1, i32 4, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([8 x i64*], [8 x i64*]* @1, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.102, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.103, i32 0, i32 0), i32 1, i32 6, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([12 x i64*], [12 x i64*]* @10, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.104, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.105, i32 0, i32 0), i32 1, i32 1, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([2 x i64*], [2 x i64*]* @12, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.106, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.107, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.108, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.109, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.110, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.111, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.112, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.113, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.114, i32 0, i32 0), i32 0, i32 0, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** null }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.115, i32 0, i32 0), i32 2, i32 4, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([8 x i64*], [8 x i64*]* @14, i32 0, i32 0) }]
@str.116 = private constant [63 x i8] c"hexagon-32-noos-hvx-hvx_128-hvx_v66-no_asserts-no_bounds_query\00", align 128
@str.117 = private constant [15 x i8] c"conv_nn_hvx128\00", align 32
@conv_nn_hvx128_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 15, %struct.halide_filter_argument_t* getelementptr inbounds ([15 x %struct.halide_filter_argument_t], [15 x %struct.halide_filter_argument_t]* @15, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @str.116, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.117, i32 0, i32 0) }
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
define weak noalias i8* @halide_malloc(i8* %user_context, i32 %x) local_unnamed_addr #0 {
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
declare <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32>, i32) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32>, <32 x i32>, <32 x i32>) #9

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
declare <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32>, <64 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32>, <32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32>, <32 x i32>, i32) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32>, <32 x i32>, i32) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32>, <32 x i32>) #9

; Function Attrs: nounwind
define i32 @conv_nn_hvx128(%struct.halide_buffer_t* noalias nocapture readonly %input.buffer, i8 %input_zero, %struct.halide_buffer_t* noalias nocapture readonly %filter.buffer, i8 %filter_zero, %struct.halide_buffer_t* noalias nocapture readonly %bias.buffer, i32 %stride_x, i32 %stride_y, i32 %dilation_x, i32 %dilation_y, i32 %output_multiplier, i32 %output_shift, i8 %output_zero, i8 %output_min, i8 %output_max, %struct.halide_buffer_t* noalias nocapture readonly %output.buffer) local_unnamed_addr #10 {
if.end.i:
  %hvx_lock_result = tail call i32 @halide_qurt_hvx_lock(i8* null) #11
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %bias.buffer, i32 0, i32 2
  %0 = bitcast i8** %host.i to i32**
  %1 = load i32*, i32** %0, align 4, !tbaa !43
  %2 = bitcast i32* %1 to i8*
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %bias.buffer, i32 0, i32 6
  %3 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !46
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %3, i32 0, i32 1
  %4 = load i32, i32* %extent.i, align 4, !tbaa !49
  %host.i472 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %filter.buffer, i32 0, i32 2
  %5 = load i8*, i8** %host.i472, align 4, !tbaa !43
  %dim.i473 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %filter.buffer, i32 0, i32 6
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i473, align 8, !tbaa !46
  %extent.i488 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 2, i32 1
  %7 = load i32, i32* %extent.i488, align 4, !tbaa !49
  %stride.i494 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 3, i32 2
  %8 = load i32, i32* %stride.i494, align 4, !tbaa !50
  %extent.i498 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 4, i32 1
  %9 = load i32, i32* %extent.i498, align 4, !tbaa !49
  %stride.i500 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 4, i32 2
  %10 = load i32, i32* %stride.i500, align 4, !tbaa !50
  %extent.i504 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 5, i32 1
  %11 = load i32, i32* %extent.i504, align 4, !tbaa !49
  %stride.i506 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i32 5, i32 2
  %12 = load i32, i32* %stride.i506, align 4, !tbaa !50
  %host.i507 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i32 0, i32 2
  %13 = load i8*, i8** %host.i507, align 4, !tbaa !43
  %dim.i508 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i32 0, i32 6
  %14 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i508, align 8, !tbaa !46
  %extent.i511 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 0, i32 1
  %15 = load i32, i32* %extent.i511, align 4, !tbaa !49
  %min.i515 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 1, i32 0
  %16 = load i32, i32* %min.i515, align 4, !tbaa !47
  %stride.i517 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 1, i32 2
  %17 = load i32, i32* %stride.i517, align 4, !tbaa !50
  %min.i519 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 2, i32 0
  %18 = load i32, i32* %min.i519, align 4, !tbaa !47
  %stride.i521 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 2, i32 2
  %19 = load i32, i32* %stride.i521, align 4, !tbaa !50
  %min.i523 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 3, i32 0
  %20 = load i32, i32* %min.i523, align 4, !tbaa !47
  %extent.i525 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 3, i32 1
  %21 = load i32, i32* %extent.i525, align 4, !tbaa !49
  %stride.i527 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %14, i32 3, i32 2
  %22 = load i32, i32* %stride.i527, align 4, !tbaa !50
  %host.i528 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 2
  %23 = load i8*, i8** %host.i528, align 4, !tbaa !43
  %dim.i529 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i32 0, i32 6
  %24 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i529, align 8, !tbaa !46
  %min.i536 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 1, i32 0
  %25 = load i32, i32* %min.i536, align 4, !tbaa !47
  %extent.i538 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 1, i32 1
  %26 = load i32, i32* %extent.i538, align 4, !tbaa !49
  %stride.i540 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 1, i32 2
  %27 = load i32, i32* %stride.i540, align 4, !tbaa !50
  %min.i542 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 2, i32 0
  %28 = load i32, i32* %min.i542, align 4, !tbaa !47
  %extent.i544 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 2, i32 1
  %29 = load i32, i32* %extent.i544, align 4, !tbaa !49
  %stride.i546 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 2, i32 2
  %30 = load i32, i32* %stride.i546, align 4, !tbaa !50
  %stride.i552 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %24, i32 3, i32 2
  %31 = load i32, i32* %stride.i552, align 4, !tbaa !50
  %32 = add nsw i32 %4, -1
  %a0 = ashr i32 %32, 5
  %33 = icmp sgt i32 %a0, -1
  %t1225 = select i1 %33, i32 %a0, i32 -1
  %34 = shl i32 %t1225, 7
  %35 = add i32 %34, 268
  %cmp7.i = icmp ugt i32 %35, 16384
  br i1 %cmp7.i, label %pseudostack_alloc.exit, label %then_bb

pseudostack_alloc.exit:                           ; preds = %if.end.i
  %call.i = tail call i8* @halide_malloc(i8* null, i32 %35) #14
  %.not = icmp eq i8* %call.i, null
  br i1 %.not, label %then_bb, label %"pseudostack_alloc.exit.produce bias_im_global_wrapper$0_crit_edge", !prof !95

"pseudostack_alloc.exit.produce bias_im_global_wrapper$0_crit_edge": ; preds = %pseudostack_alloc.exit
  %36 = bitcast i8* %call.i to i32*
  br label %"produce bias_im_global_wrapper$0"

then_bb:                                          ; preds = %if.end.i, %pseudostack_alloc.exit
  %37 = alloca i32, i32 %35, align 128
  %38 = bitcast i32* %37 to i8*
  br label %"produce bias_im_global_wrapper$0"

"produce bias_im_global_wrapper$0":               ; preds = %"pseudostack_alloc.exit.produce bias_im_global_wrapper$0_crit_edge", %then_bb
  %"bias_im_global_wrapper$0.pseudostack_slot.sroa.0.0" = phi i8* [ %call.i, %"pseudostack_alloc.exit.produce bias_im_global_wrapper$0_crit_edge" ], [ %38, %then_bb ]
  %"bias_im_global_wrapper$0" = phi i32* [ %36, %"pseudostack_alloc.exit.produce bias_im_global_wrapper$0_crit_edge" ], [ %37, %then_bb ]
  %39 = icmp sgt i32 %4, 0
  br i1 %39, label %"for bias_im_global_wrapper$0.s0._0.preheader.old", label %"end for bias_im_global_wrapper$0.s0._0", !prof !96

"for bias_im_global_wrapper$0.s0._0.preheader.old": ; preds = %"produce bias_im_global_wrapper$0"
  %40 = shl nuw i32 %4, 2
  %41 = ptrtoint i32* %1 to i32
  %42 = ptrtoint i8* %"bias_im_global_wrapper$0.pseudostack_slot.sroa.0.0" to i32
  %43 = bitcast i32* %1 to i8*
  %44 = icmp ult i8* %"bias_im_global_wrapper$0.pseudostack_slot.sroa.0.0", %43
  %45 = sub i32 %42, %41
  %46 = icmp sle i32 %40, %45
  %47 = or i1 %44, %46
  br i1 %47, label %"for bias_im_global_wrapper$0.s0._0.rtli", label %"for bias_im_global_wrapper$0.s0._0.preheader"

"for bias_im_global_wrapper$0.s0._0.preheader":   ; preds = %"for bias_im_global_wrapper$0.s0._0.preheader.old"
  %48 = add i32 %4, -1
  %xtraiter = and i32 %4, 7
  %49 = icmp ult i32 %48, 7
  br i1 %49, label %"end for bias_im_global_wrapper$0.s0._0.loopexit.unr-lcssa", label %"for bias_im_global_wrapper$0.s0._0.preheader.new"

"for bias_im_global_wrapper$0.s0._0.preheader.new": ; preds = %"for bias_im_global_wrapper$0.s0._0.preheader"
  %unroll_iter = and i32 %4, -8
  br label %"for bias_im_global_wrapper$0.s0._0"

"for bias_im_global_wrapper$0.s0._0.rtli":        ; preds = %"for bias_im_global_wrapper$0.s0._0.preheader.old"
  call void @llvm.memmove.p0i8.p0i8.i32(i8* nonnull align 4 %"bias_im_global_wrapper$0.pseudostack_slot.sroa.0.0", i8* align 4 %2, i32 %40, i1 false)
  br label %"end for bias_im_global_wrapper$0.s0._0"

"for bias_im_global_wrapper$0.s0._0":             ; preds = %"for bias_im_global_wrapper$0.s0._0", %"for bias_im_global_wrapper$0.s0._0.preheader.new"
  %"bias_im_global_wrapper$0.s0._0" = phi i32 [ 0, %"for bias_im_global_wrapper$0.s0._0.preheader.new" ], [ %81, %"for bias_im_global_wrapper$0.s0._0" ]
  %niter = phi i32 [ %unroll_iter, %"for bias_im_global_wrapper$0.s0._0.preheader.new" ], [ %niter.nsub.7, %"for bias_im_global_wrapper$0.s0._0" ]
  %50 = getelementptr inbounds i32, i32* %1, i32 %"bias_im_global_wrapper$0.s0._0"
  %51 = load i32, i32* %50, align 4, !tbaa !97
  %52 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %"bias_im_global_wrapper$0.s0._0"
  store i32 %51, i32* %52, align 4, !tbaa !100
  %53 = or i32 %"bias_im_global_wrapper$0.s0._0", 1
  %54 = getelementptr inbounds i32, i32* %1, i32 %53
  %55 = load i32, i32* %54, align 4, !tbaa !97
  %56 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %53
  store i32 %55, i32* %56, align 4, !tbaa !100
  %57 = or i32 %"bias_im_global_wrapper$0.s0._0", 2
  %58 = getelementptr inbounds i32, i32* %1, i32 %57
  %59 = load i32, i32* %58, align 4, !tbaa !97
  %60 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %57
  store i32 %59, i32* %60, align 4, !tbaa !100
  %61 = or i32 %"bias_im_global_wrapper$0.s0._0", 3
  %62 = getelementptr inbounds i32, i32* %1, i32 %61
  %63 = load i32, i32* %62, align 4, !tbaa !97
  %64 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %61
  store i32 %63, i32* %64, align 4, !tbaa !100
  %65 = or i32 %"bias_im_global_wrapper$0.s0._0", 4
  %66 = getelementptr inbounds i32, i32* %1, i32 %65
  %67 = load i32, i32* %66, align 4, !tbaa !97
  %68 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %65
  store i32 %67, i32* %68, align 4, !tbaa !100
  %69 = or i32 %"bias_im_global_wrapper$0.s0._0", 5
  %70 = getelementptr inbounds i32, i32* %1, i32 %69
  %71 = load i32, i32* %70, align 4, !tbaa !97
  %72 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %69
  store i32 %71, i32* %72, align 4, !tbaa !100
  %73 = or i32 %"bias_im_global_wrapper$0.s0._0", 6
  %74 = getelementptr inbounds i32, i32* %1, i32 %73
  %75 = load i32, i32* %74, align 4, !tbaa !97
  %76 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %73
  store i32 %75, i32* %76, align 4, !tbaa !100
  %77 = or i32 %"bias_im_global_wrapper$0.s0._0", 7
  %78 = getelementptr inbounds i32, i32* %1, i32 %77
  %79 = load i32, i32* %78, align 4, !tbaa !97
  %80 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %77
  store i32 %79, i32* %80, align 4, !tbaa !100
  %81 = add nuw nsw i32 %"bias_im_global_wrapper$0.s0._0", 8
  %niter.nsub.7 = add i32 %niter, -8
  %niter.ncmp.7 = icmp eq i32 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %"end for bias_im_global_wrapper$0.s0._0.loopexit.unr-lcssa", label %"for bias_im_global_wrapper$0.s0._0"

"end for bias_im_global_wrapper$0.s0._0.loopexit.unr-lcssa": ; preds = %"for bias_im_global_wrapper$0.s0._0", %"for bias_im_global_wrapper$0.s0._0.preheader"
  %"bias_im_global_wrapper$0.s0._0.unr" = phi i32 [ 0, %"for bias_im_global_wrapper$0.s0._0.preheader" ], [ %81, %"for bias_im_global_wrapper$0.s0._0" ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %"end for bias_im_global_wrapper$0.s0._0", label %"for bias_im_global_wrapper$0.s0._0.epil"

"for bias_im_global_wrapper$0.s0._0.epil":        ; preds = %"end for bias_im_global_wrapper$0.s0._0.loopexit.unr-lcssa", %"for bias_im_global_wrapper$0.s0._0.epil"
  %"bias_im_global_wrapper$0.s0._0.epil" = phi i32 [ %85, %"for bias_im_global_wrapper$0.s0._0.epil" ], [ %"bias_im_global_wrapper$0.s0._0.unr", %"end for bias_im_global_wrapper$0.s0._0.loopexit.unr-lcssa" ]
  %epil.iter = phi i32 [ %epil.iter.sub, %"for bias_im_global_wrapper$0.s0._0.epil" ], [ %xtraiter, %"end for bias_im_global_wrapper$0.s0._0.loopexit.unr-lcssa" ]
  %82 = getelementptr inbounds i32, i32* %1, i32 %"bias_im_global_wrapper$0.s0._0.epil"
  %83 = load i32, i32* %82, align 4, !tbaa !97
  %84 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %"bias_im_global_wrapper$0.s0._0.epil"
  store i32 %83, i32* %84, align 4, !tbaa !100
  %85 = add nuw nsw i32 %"bias_im_global_wrapper$0.s0._0.epil", 1
  %epil.iter.sub = add i32 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %"end for bias_im_global_wrapper$0.s0._0", label %"for bias_im_global_wrapper$0.s0._0.epil", !llvm.loop !102

"end for bias_im_global_wrapper$0.s0._0":         ; preds = %"end for bias_im_global_wrapper$0.s0._0.loopexit.unr-lcssa", %"for bias_im_global_wrapper$0.s0._0.epil", %"for bias_im_global_wrapper$0.s0._0.rtli", %"produce bias_im_global_wrapper$0"
  %86 = and i32 %4, 127
  %t1217 = icmp eq i32 %86, 0
  %t1218 = icmp sgt i32 %26, 7
  %87 = icmp sgt i32 %26, 5
  %88 = and i1 %t1217, %87
  %89 = or i32 %32, 127
  %90 = and i32 %4, 63
  %91 = icmp eq i32 %90, 0
  %92 = and i1 %91, %t1218
  %93 = or i32 %32, 63
  %94 = and i32 %4, 31
  %95 = icmp eq i32 %94, 0
  %96 = and i1 %95, %t1218
  %97 = or i32 %32, 31
  %98 = icmp sgt i32 %26, 0
  %99 = and i1 %t1217, %98
  %100 = icmp slt i32 %4, 32
  %101 = select i1 %100, i32 %4, i32 32
  %102 = add nsw i32 %101, -1
  %a3 = ashr i32 %102, 5
  %103 = icmp slt i32 %a0, 3
  %104 = select i1 %103, i32 %a0, i32 3
  %105 = and i32 %a3, -4
  %b5 = add nsw i32 %105, %104
  %106 = icmp slt i32 %a3, %b5
  %107 = select i1 %106, i32 %a3, i32 %b5
  %108 = add nsw i32 %107, %a0
  %109 = shl nsw i32 %108, 5
  %110 = or i32 %109, 31
  %111 = select i1 %99, i32 %89, i32 %110
  %112 = select i1 %96, i32 %97, i32 %111
  %113 = select i1 %92, i32 %93, i32 %112
  %a2 = select i1 %88, i32 %89, i32 %113
  %114 = icmp sgt i32 %a2, %97
  %115 = select i1 %114, i32 %a2, i32 %97
  %.inv = icmp slt i32 %115, 0
  %a9 = shl i32 %115, 2
  %a9.op.op = add i32 %a9, 144
  %116 = select i1 %.inv, i32 140, i32 %a9.op.op
  %117 = call i8* @halide_malloc(i8* null, i32 %116)
  %offset_c = bitcast i8* %117 to i32*
  %118 = add nsw i32 %4, 31
  %119 = ashr i32 %118, 5
  br i1 %39, label %"for offset_c.s0.c.c.preheader", label %"consume bias_im_global_wrapper$0.thread", !prof !96

"for offset_c.s0.c.c.preheader":                  ; preds = %"end for bias_im_global_wrapper$0.s0._0"
  %120 = shl nuw i32 %119, 7
  call void @llvm.memset.p0i8.i32(i8* align 128 %117, i8 0, i32 %120, i1 false)
  %.not396 = icmp eq i8 %input_zero, 0
  br i1 %.not396, label %"for offset_c.s2.c.c.preheader", label %"for offset_c.s1.c.co.preheader"

"for offset_c.s1.c.co.preheader":                 ; preds = %"for offset_c.s0.c.c.preheader"
  %121 = icmp sgt i32 %11, 0
  %122 = select i1 %121, i32 %11, i32 0
  %123 = icmp sgt i32 %7, 0
  %124 = insertelement <128 x i8> undef, i8 %input_zero, i32 0
  %125 = shufflevector <128 x i8> %124, <128 x i8> undef, <128 x i32> zeroinitializer
  %126 = bitcast <128 x i8> %125 to <32 x i32>
  %127 = icmp sgt i32 %9, 0
  %or.cond = and i1 %121, %127
  %128 = and i1 %or.cond, %123
  br i1 %128, label %"for offset_c.s1.c.co.us.us.us.preheader", label %"for offset_c.s2.c.c.preheader", !prof !103

"for offset_c.s1.c.co.us.us.us.preheader":        ; preds = %"for offset_c.s1.c.co.preheader"
  %129 = add i32 %7, -1
  %xtraiter1592 = and i32 %7, 7
  %130 = icmp ult i32 %129, 7
  %unroll_iter1596 = and i32 %7, -8
  %lcmp.mod1594.not = icmp eq i32 %xtraiter1592, 0
  br label %"for offset_c.s1.c.co.us.us.us"

"for offset_c.s1.c.co.us.us.us":                  ; preds = %"for offset_c.s1.c.co.us.us.us.preheader", %"end for offset_c.s1.r19$y.loopexit.split.us.split.us.us.us.us"
  %offset_c.s1.c.co.us.us.us = phi i32 [ %205, %"end for offset_c.s1.r19$y.loopexit.split.us.split.us.us.us.us" ], [ 0, %"for offset_c.s1.c.co.us.us.us.preheader" ]
  %131 = mul nsw i32 %offset_c.s1.c.co.us.us.us, %8
  %132 = shl nsw i32 %offset_c.s1.c.co.us.us.us, 5
  %133 = getelementptr inbounds i32, i32* %offset_c, i32 %132
  %134 = bitcast i32* %133 to <32 x i32>*
  %.promoted.us.us.us = load <32 x i32>, <32 x i32>* %134, align 128, !tbaa !104
  br label %"for offset_c.s1.r19$y.us.us.us.us.us"

"for offset_c.s1.r19$y.us.us.us.us.us":           ; preds = %"end for offset_c.s1.r19$x.loopexit.split.us.us.us.us.us.us", %"for offset_c.s1.c.co.us.us.us"
  %.lcssa1001.us.lcssa.us.us1008.us.us.us = phi <32 x i32> [ %.lcssa1591, %"end for offset_c.s1.r19$x.loopexit.split.us.us.us.us.us.us" ], [ %.promoted.us.us.us, %"for offset_c.s1.c.co.us.us.us" ]
  %"offset_c.s1.r19$y.us.us.us.us.us" = phi i32 [ %204, %"end for offset_c.s1.r19$x.loopexit.split.us.us.us.us.us.us" ], [ 0, %"for offset_c.s1.c.co.us.us.us" ]
  %135 = mul nsw i32 %"offset_c.s1.r19$y.us.us.us.us.us", %12
  %t838.us.us.us.us.us = add nsw i32 %135, %131
  br label %"for offset_c.s1.r19$x.us.us.us.us.us.us"

"for offset_c.s1.r19$x.us.us.us.us.us.us":        ; preds = %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us", %"for offset_c.s1.r19$y.us.us.us.us.us"
  %.lcssa1001.us1002.us.us.us.us.us = phi <32 x i32> [ %.lcssa1591, %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us" ], [ %.lcssa1001.us.lcssa.us.us1008.us.us.us, %"for offset_c.s1.r19$y.us.us.us.us.us" ]
  %"offset_c.s1.r19$x.us.us.us.us.us.us" = phi i32 [ %203, %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us" ], [ 0, %"for offset_c.s1.r19$y.us.us.us.us.us" ]
  %136 = mul nsw i32 %"offset_c.s1.r19$x.us.us.us.us.us.us", %10
  %137 = add nsw i32 %t838.us.us.us.us.us, %136
  br i1 %130, label %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa", label %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us"

"for offset_c.s1.r19$z.r124.us.us.us.us.us.us":   ; preds = %"for offset_c.s1.r19$x.us.us.us.us.us.us", %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us"
  %138 = phi <32 x i32> [ %193, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us" ], [ %.lcssa1001.us1002.us.us.us.us.us, %"for offset_c.s1.r19$x.us.us.us.us.us.us" ]
  %"offset_c.s1.r19$z.r124.us.us.us.us.us.us" = phi i32 [ %194, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us" ], [ 0, %"for offset_c.s1.r19$x.us.us.us.us.us.us" ]
  %niter1597 = phi i32 [ %niter1597.nsub.7, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us" ], [ %unroll_iter1596, %"for offset_c.s1.r19$x.us.us.us.us.us.us" ]
  %139 = shl nsw i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %140 = add nsw i32 %137, %139
  %141 = getelementptr inbounds i8, i8* %5, i32 %140
  %142 = bitcast i8* %141 to <32 x i32>*
  %143 = load <32 x i32>, <32 x i32>* %142, align 128, !tbaa !106
  %144 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %138, <32 x i32> %143, <32 x i32> %126) #11
  %145 = shl i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %146 = or i32 %145, 128
  %147 = add nsw i32 %137, %146
  %148 = getelementptr inbounds i8, i8* %5, i32 %147
  %149 = bitcast i8* %148 to <32 x i32>*
  %150 = load <32 x i32>, <32 x i32>* %149, align 128, !tbaa !106
  %151 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %144, <32 x i32> %150, <32 x i32> %126) #11
  %152 = shl i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %153 = or i32 %152, 256
  %154 = add nsw i32 %137, %153
  %155 = getelementptr inbounds i8, i8* %5, i32 %154
  %156 = bitcast i8* %155 to <32 x i32>*
  %157 = load <32 x i32>, <32 x i32>* %156, align 128, !tbaa !106
  %158 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %151, <32 x i32> %157, <32 x i32> %126) #11
  %159 = shl i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %160 = or i32 %159, 384
  %161 = add nsw i32 %137, %160
  %162 = getelementptr inbounds i8, i8* %5, i32 %161
  %163 = bitcast i8* %162 to <32 x i32>*
  %164 = load <32 x i32>, <32 x i32>* %163, align 128, !tbaa !106
  %165 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %158, <32 x i32> %164, <32 x i32> %126) #11
  %166 = shl i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %167 = or i32 %166, 512
  %168 = add nsw i32 %137, %167
  %169 = getelementptr inbounds i8, i8* %5, i32 %168
  %170 = bitcast i8* %169 to <32 x i32>*
  %171 = load <32 x i32>, <32 x i32>* %170, align 128, !tbaa !106
  %172 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %165, <32 x i32> %171, <32 x i32> %126) #11
  %173 = shl i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %174 = or i32 %173, 640
  %175 = add nsw i32 %137, %174
  %176 = getelementptr inbounds i8, i8* %5, i32 %175
  %177 = bitcast i8* %176 to <32 x i32>*
  %178 = load <32 x i32>, <32 x i32>* %177, align 128, !tbaa !106
  %179 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %172, <32 x i32> %178, <32 x i32> %126) #11
  %180 = shl i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %181 = or i32 %180, 768
  %182 = add nsw i32 %137, %181
  %183 = getelementptr inbounds i8, i8* %5, i32 %182
  %184 = bitcast i8* %183 to <32 x i32>*
  %185 = load <32 x i32>, <32 x i32>* %184, align 128, !tbaa !106
  %186 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %179, <32 x i32> %185, <32 x i32> %126) #11
  %187 = shl i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 7
  %188 = or i32 %187, 896
  %189 = add nsw i32 %137, %188
  %190 = getelementptr inbounds i8, i8* %5, i32 %189
  %191 = bitcast i8* %190 to <32 x i32>*
  %192 = load <32 x i32>, <32 x i32>* %191, align 128, !tbaa !106
  %193 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %186, <32 x i32> %192, <32 x i32> %126) #11
  %194 = add nuw nsw i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us", 8
  %niter1597.nsub.7 = add i32 %niter1597, -8
  %niter1597.ncmp.7 = icmp eq i32 %niter1597.nsub.7, 0
  br i1 %niter1597.ncmp.7, label %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa", label %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us"

"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa": ; preds = %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us", %"for offset_c.s1.r19$x.us.us.us.us.us.us"
  %.lcssa1591.ph = phi <32 x i32> [ undef, %"for offset_c.s1.r19$x.us.us.us.us.us.us" ], [ %193, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us" ]
  %.unr = phi <32 x i32> [ %.lcssa1001.us1002.us.us.us.us.us, %"for offset_c.s1.r19$x.us.us.us.us.us.us" ], [ %193, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us" ]
  %"offset_c.s1.r19$z.r124.us.us.us.us.us.us.unr" = phi i32 [ 0, %"for offset_c.s1.r19$x.us.us.us.us.us.us" ], [ %194, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us" ]
  br i1 %lcmp.mod1594.not, label %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us", label %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil"

"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil": ; preds = %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa", %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil"
  %195 = phi <32 x i32> [ %201, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil" ], [ %.unr, %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa" ]
  %"offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil" = phi i32 [ %202, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil" ], [ %"offset_c.s1.r19$z.r124.us.us.us.us.us.us.unr", %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa" ]
  %epil.iter1593 = phi i32 [ %epil.iter1593.sub, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil" ], [ %xtraiter1592, %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa" ]
  %196 = shl nsw i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil", 7
  %197 = add nsw i32 %137, %196
  %198 = getelementptr inbounds i8, i8* %5, i32 %197
  %199 = bitcast i8* %198 to <32 x i32>*
  %200 = load <32 x i32>, <32 x i32>* %199, align 128, !tbaa !106
  %201 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %195, <32 x i32> %200, <32 x i32> %126) #11
  %202 = add nuw nsw i32 %"offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil", 1
  %epil.iter1593.sub = add i32 %epil.iter1593, -1
  %epil.iter1593.cmp.not = icmp eq i32 %epil.iter1593.sub, 0
  br i1 %epil.iter1593.cmp.not, label %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us", label %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil", !llvm.loop !108

"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us": ; preds = %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil", %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa"
  %.lcssa1591 = phi <32 x i32> [ %.lcssa1591.ph, %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us.unr-lcssa" ], [ %201, %"for offset_c.s1.r19$z.r124.us.us.us.us.us.us.epil" ]
  %203 = add nuw nsw i32 %"offset_c.s1.r19$x.us.us.us.us.us.us", 1
  %.not466.us.us.us.us.us.us = icmp eq i32 %203, %9
  br i1 %.not466.us.us.us.us.us.us, label %"end for offset_c.s1.r19$x.loopexit.split.us.us.us.us.us.us", label %"for offset_c.s1.r19$x.us.us.us.us.us.us"

"end for offset_c.s1.r19$x.loopexit.split.us.us.us.us.us.us": ; preds = %"end for offset_c.s1.r19$z.r124.loopexit.us.us.us.us.us.us"
  %204 = add nuw nsw i32 %"offset_c.s1.r19$y.us.us.us.us.us", 1
  %.not465.us.us.us.us.us = icmp eq i32 %204, %122
  br i1 %.not465.us.us.us.us.us, label %"end for offset_c.s1.r19$y.loopexit.split.us.split.us.us.us.us", label %"for offset_c.s1.r19$y.us.us.us.us.us"

"end for offset_c.s1.r19$y.loopexit.split.us.split.us.us.us.us": ; preds = %"end for offset_c.s1.r19$x.loopexit.split.us.us.us.us.us.us"
  store <32 x i32> %.lcssa1591, <32 x i32>* %134, align 128, !tbaa !104
  %205 = add nuw nsw i32 %offset_c.s1.c.co.us.us.us, 1
  %.not464.us.us.us = icmp eq i32 %205, %119
  br i1 %.not464.us.us.us, label %"for offset_c.s2.c.c.preheader", label %"for offset_c.s1.c.co.us.us.us"

"consume bias_im_global_wrapper$0.thread":        ; preds = %"end for bias_im_global_wrapper$0.s0._0"
  %206 = zext i8 %filter_zero to i32
  br label %"consume offset_c"

"for offset_c.s2.c.c.preheader":                  ; preds = %"end for offset_c.s1.r19$y.loopexit.split.us.split.us.us.us.us", %"for offset_c.s1.c.co.preheader", %"for offset_c.s0.c.c.preheader"
  %207 = zext i8 %filter_zero to i32
  %208 = zext i8 %input_zero to i32
  %209 = shl nuw nsw i32 %208, 2
  %210 = mul nuw nsw i32 %209, %207
  %211 = mul i32 %210, %7
  %t841.s = mul i32 %211, %9
  %212 = mul i32 %t841.s, %11
  %213 = insertelement <32 x i32> undef, i32 %212, i32 0
  %214 = shufflevector <32 x i32> %213, <32 x i32> undef, <32 x i32> zeroinitializer
  %215 = add nsw i32 %119, -1
  %xtraiter1598 = and i32 %119, 7
  %216 = icmp ult i32 %215, 7
  br i1 %216, label %"consume offset_c.loopexit.unr-lcssa", label %"for offset_c.s2.c.c.preheader.new"

"for offset_c.s2.c.c.preheader.new":              ; preds = %"for offset_c.s2.c.c.preheader"
  %unroll_iter1601 = and i32 %119, -8
  br label %"for offset_c.s2.c.c"

"for offset_c.s2.c.c":                            ; preds = %"for offset_c.s2.c.c", %"for offset_c.s2.c.c.preheader.new"
  %offset_c.s2.c.c = phi i32 [ 0, %"for offset_c.s2.c.c.preheader.new" ], [ %296, %"for offset_c.s2.c.c" ]
  %niter1602 = phi i32 [ %unroll_iter1601, %"for offset_c.s2.c.c.preheader.new" ], [ %niter1602.nsub.7, %"for offset_c.s2.c.c" ]
  %217 = shl nsw i32 %offset_c.s2.c.c, 5
  %218 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %217
  %219 = bitcast i32* %218 to <32 x i32>*
  %220 = load <32 x i32>, <32 x i32>* %219, align 128, !tbaa !100
  %221 = add nsw <32 x i32> %220, %214
  %222 = getelementptr inbounds i32, i32* %offset_c, i32 %217
  %223 = bitcast i32* %222 to <32 x i32>*
  %224 = load <32 x i32>, <32 x i32>* %223, align 128, !tbaa !104
  %225 = sub <32 x i32> %221, %224
  store <32 x i32> %225, <32 x i32>* %223, align 128, !tbaa !104
  %226 = shl i32 %offset_c.s2.c.c, 5
  %227 = or i32 %226, 32
  %228 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %227
  %229 = bitcast i32* %228 to <32 x i32>*
  %230 = load <32 x i32>, <32 x i32>* %229, align 128, !tbaa !100
  %231 = add nsw <32 x i32> %230, %214
  %232 = getelementptr inbounds i32, i32* %offset_c, i32 %227
  %233 = bitcast i32* %232 to <32 x i32>*
  %234 = load <32 x i32>, <32 x i32>* %233, align 128, !tbaa !104
  %235 = sub <32 x i32> %231, %234
  store <32 x i32> %235, <32 x i32>* %233, align 128, !tbaa !104
  %236 = shl i32 %offset_c.s2.c.c, 5
  %237 = or i32 %236, 64
  %238 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %237
  %239 = bitcast i32* %238 to <32 x i32>*
  %240 = load <32 x i32>, <32 x i32>* %239, align 128, !tbaa !100
  %241 = add nsw <32 x i32> %240, %214
  %242 = getelementptr inbounds i32, i32* %offset_c, i32 %237
  %243 = bitcast i32* %242 to <32 x i32>*
  %244 = load <32 x i32>, <32 x i32>* %243, align 128, !tbaa !104
  %245 = sub <32 x i32> %241, %244
  store <32 x i32> %245, <32 x i32>* %243, align 128, !tbaa !104
  %246 = shl i32 %offset_c.s2.c.c, 5
  %247 = or i32 %246, 96
  %248 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %247
  %249 = bitcast i32* %248 to <32 x i32>*
  %250 = load <32 x i32>, <32 x i32>* %249, align 128, !tbaa !100
  %251 = add nsw <32 x i32> %250, %214
  %252 = getelementptr inbounds i32, i32* %offset_c, i32 %247
  %253 = bitcast i32* %252 to <32 x i32>*
  %254 = load <32 x i32>, <32 x i32>* %253, align 128, !tbaa !104
  %255 = sub <32 x i32> %251, %254
  store <32 x i32> %255, <32 x i32>* %253, align 128, !tbaa !104
  %256 = shl i32 %offset_c.s2.c.c, 5
  %257 = or i32 %256, 128
  %258 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %257
  %259 = bitcast i32* %258 to <32 x i32>*
  %260 = load <32 x i32>, <32 x i32>* %259, align 128, !tbaa !100
  %261 = add nsw <32 x i32> %260, %214
  %262 = getelementptr inbounds i32, i32* %offset_c, i32 %257
  %263 = bitcast i32* %262 to <32 x i32>*
  %264 = load <32 x i32>, <32 x i32>* %263, align 128, !tbaa !104
  %265 = sub <32 x i32> %261, %264
  store <32 x i32> %265, <32 x i32>* %263, align 128, !tbaa !104
  %266 = shl i32 %offset_c.s2.c.c, 5
  %267 = or i32 %266, 160
  %268 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %267
  %269 = bitcast i32* %268 to <32 x i32>*
  %270 = load <32 x i32>, <32 x i32>* %269, align 128, !tbaa !100
  %271 = add nsw <32 x i32> %270, %214
  %272 = getelementptr inbounds i32, i32* %offset_c, i32 %267
  %273 = bitcast i32* %272 to <32 x i32>*
  %274 = load <32 x i32>, <32 x i32>* %273, align 128, !tbaa !104
  %275 = sub <32 x i32> %271, %274
  store <32 x i32> %275, <32 x i32>* %273, align 128, !tbaa !104
  %276 = shl i32 %offset_c.s2.c.c, 5
  %277 = or i32 %276, 192
  %278 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %277
  %279 = bitcast i32* %278 to <32 x i32>*
  %280 = load <32 x i32>, <32 x i32>* %279, align 128, !tbaa !100
  %281 = add nsw <32 x i32> %280, %214
  %282 = getelementptr inbounds i32, i32* %offset_c, i32 %277
  %283 = bitcast i32* %282 to <32 x i32>*
  %284 = load <32 x i32>, <32 x i32>* %283, align 128, !tbaa !104
  %285 = sub <32 x i32> %281, %284
  store <32 x i32> %285, <32 x i32>* %283, align 128, !tbaa !104
  %286 = shl i32 %offset_c.s2.c.c, 5
  %287 = or i32 %286, 224
  %288 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %287
  %289 = bitcast i32* %288 to <32 x i32>*
  %290 = load <32 x i32>, <32 x i32>* %289, align 128, !tbaa !100
  %291 = add nsw <32 x i32> %290, %214
  %292 = getelementptr inbounds i32, i32* %offset_c, i32 %287
  %293 = bitcast i32* %292 to <32 x i32>*
  %294 = load <32 x i32>, <32 x i32>* %293, align 128, !tbaa !104
  %295 = sub <32 x i32> %291, %294
  store <32 x i32> %295, <32 x i32>* %293, align 128, !tbaa !104
  %296 = add nuw nsw i32 %offset_c.s2.c.c, 8
  %niter1602.nsub.7 = add i32 %niter1602, -8
  %niter1602.ncmp.7 = icmp eq i32 %niter1602.nsub.7, 0
  br i1 %niter1602.ncmp.7, label %"consume offset_c.loopexit.unr-lcssa", label %"for offset_c.s2.c.c"

"consume offset_c.loopexit.unr-lcssa":            ; preds = %"for offset_c.s2.c.c", %"for offset_c.s2.c.c.preheader"
  %offset_c.s2.c.c.unr = phi i32 [ 0, %"for offset_c.s2.c.c.preheader" ], [ %296, %"for offset_c.s2.c.c" ]
  %lcmp.mod1600.not = icmp eq i32 %xtraiter1598, 0
  br i1 %lcmp.mod1600.not, label %"consume offset_c", label %"for offset_c.s2.c.c.epil"

"for offset_c.s2.c.c.epil":                       ; preds = %"consume offset_c.loopexit.unr-lcssa", %"for offset_c.s2.c.c.epil"
  %offset_c.s2.c.c.epil = phi i32 [ %306, %"for offset_c.s2.c.c.epil" ], [ %offset_c.s2.c.c.unr, %"consume offset_c.loopexit.unr-lcssa" ]
  %epil.iter1599 = phi i32 [ %epil.iter1599.sub, %"for offset_c.s2.c.c.epil" ], [ %xtraiter1598, %"consume offset_c.loopexit.unr-lcssa" ]
  %297 = shl nsw i32 %offset_c.s2.c.c.epil, 5
  %298 = getelementptr inbounds i32, i32* %"bias_im_global_wrapper$0", i32 %297
  %299 = bitcast i32* %298 to <32 x i32>*
  %300 = load <32 x i32>, <32 x i32>* %299, align 128, !tbaa !100
  %301 = add nsw <32 x i32> %300, %214
  %302 = getelementptr inbounds i32, i32* %offset_c, i32 %297
  %303 = bitcast i32* %302 to <32 x i32>*
  %304 = load <32 x i32>, <32 x i32>* %303, align 128, !tbaa !104
  %305 = sub <32 x i32> %301, %304
  store <32 x i32> %305, <32 x i32>* %303, align 128, !tbaa !104
  %306 = add nuw nsw i32 %offset_c.s2.c.c.epil, 1
  %epil.iter1599.sub = add i32 %epil.iter1599, -1
  %epil.iter1599.cmp.not = icmp eq i32 %epil.iter1599.sub, 0
  br i1 %epil.iter1599.cmp.not, label %"consume offset_c", label %"for offset_c.s2.c.c.epil", !llvm.loop !109

"consume offset_c":                               ; preds = %"consume offset_c.loopexit.unr-lcssa", %"for offset_c.s2.c.c.epil", %"consume bias_im_global_wrapper$0.thread"
  %307 = phi i32 [ %206, %"consume bias_im_global_wrapper$0.thread" ], [ %207, %"for offset_c.s2.c.c.epil" ], [ %207, %"consume offset_c.loopexit.unr-lcssa" ]
  %308 = icmp eq i32 %stride_x, 1
  %309 = icmp eq i32 %7, 1
  %310 = and i1 %308, %309
  %311 = icmp eq i32 %15, 4
  %312 = icmp eq i32 %17, 4
  %313 = and i1 %311, %312
  %t844 = and i1 %310, %313
  %t843.not = icmp eq i8 %filter_zero, 0
  br i1 %88, label %then_bb4, label %next_bb5

after_bb3:                                        ; preds = %"end for output.s0.y.rebased249", %"end for output.s0.y.rebased197.loopexit.us", %"end for output.s0.y.rebased120.loopexit.us", %"end for output.s0.y.rebased43.loopexit.us", %"end for output.s0.y.rebased.loopexit.us", %"for output.s0.b.rebased193.preheader", %"for output.s0.b.rebased116.preheader", %"for output.s0.b.rebased39.preheader", %"for output.s0.b.rebased.preheader", %next_bb192, %then_bb191, %then_bb114, %then_bb37, %then_bb4
  %tobool.not.i.not = icmp eq i8* %117, null
  br i1 %tobool.not.i.not, label %land.lhs.true.i678, label %if.then.i553

if.then.i553:                                     ; preds = %after_bb3
  call void @halide_free(i8* null, i8* nonnull %117) #14
  br label %land.lhs.true.i678

land.lhs.true.i678:                               ; preds = %after_bb3, %if.then.i553
  br i1 %cmp7.i, label %if.then.i679, label %call_destructor.exit564

if.then.i679:                                     ; preds = %land.lhs.true.i678
  call void @halide_free(i8* null, i8* nonnull %"bias_im_global_wrapper$0.pseudostack_slot.sroa.0.0") #14
  br label %call_destructor.exit564

call_destructor.exit564:                          ; preds = %if.then.i679, %land.lhs.true.i678
  call void @halide_qurt_hvx_unlock_as_destructor(i8* null, i8* nonnull inttoptr (i32 1 to i8*)) #14
  ret i32 0

then_bb4:                                         ; preds = %"consume offset_c"
  %314 = mul nsw i32 %19, %18
  %315 = mul nsw i32 %22, %20
  %316 = mul nsw i32 %17, %16
  %317 = add i32 %315, %314
  %t852 = add i32 %317, %316
  %318 = icmp sgt i32 %21, 0
  br i1 %318, label %"for output.s0.b.rebased.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased.preheader":              ; preds = %then_bb4
  %319 = mul nsw i32 %17, %stride_x
  %320 = mul nsw i32 %319, 5
  %321 = shl nsw i32 %319, 2
  %322 = mul nsw i32 %319, 3
  %323 = shl nsw i32 %319, 1
  %324 = sub nsw i32 %stride_x, %16
  %325 = mul nsw i32 %324, %17
  %326 = icmp sgt i32 %29, 0
  %.neg925 = mul i32 %30, %28
  %.neg926 = mul i32 %27, %25
  %.neg927 = mul i32 %31, %20
  %reass.add929 = add i32 %.neg925, %.neg926
  %reass.add930 = add i32 %reass.add929, %.neg927
  %327 = add nuw nsw i32 %26, 5
  %328 = ashr i32 %327, 31
  %329 = xor i32 %328, %327
  %330 = zext i32 %329 to i64
  %331 = mul nuw i64 %330, 2863311531
  %332 = lshr i64 %331, 34
  %333 = trunc i64 %332 to i32
  %334 = xor i32 %328, %333
  %335 = icmp sgt i32 %334, 0
  %b14 = add nsw i32 %26, -6
  %336 = icmp sgt i32 %11, 0
  %337 = icmp sgt i32 %9, 0
  %338 = icmp sgt i32 %7, 0
  %339 = ashr i32 %4, 7
  %340 = icmp sgt i32 %4, 127
  %341 = insertelement <128 x i32> undef, i32 %output_multiplier, i32 0
  %342 = shufflevector <128 x i32> %341, <128 x i32> undef, <32 x i32> zeroinitializer
  %343 = icmp sgt i32 %output_shift, 0
  %344 = select i1 %343, <128 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <128 x i32> zeroinitializer
  %345 = add nsw i32 %output_shift, -1
  %346 = zext i8 %output_zero to i16
  %347 = insertelement <128 x i16> undef, i16 %346, i32 0
  %348 = shufflevector <128 x i16> %347, <128 x i16> undef, <128 x i32> zeroinitializer
  %349 = bitcast <128 x i16> %348 to <64 x i32>
  %350 = insertelement <128 x i8> undef, i8 %output_max, i32 0
  %351 = shufflevector <128 x i8> %350, <128 x i8> undef, <128 x i32> zeroinitializer
  %352 = bitcast <128 x i8> %351 to <32 x i32>
  %353 = insertelement <128 x i8> undef, i8 %output_min, i32 0
  %354 = shufflevector <128 x i8> %353, <128 x i8> undef, <128 x i32> zeroinitializer
  %355 = bitcast <128 x i8> %354 to <32 x i32>
  br i1 %326, label %"for output.s0.b.rebased.us.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased.us.preheader":           ; preds = %"for output.s0.b.rebased.preheader"
  %356 = add i32 %316, %314
  %357 = add i32 %7, -1
  %358 = add i32 %9, -1
  %brmerge1435.demorgan = and i1 %337, %338
  %xtraiter1676 = and i32 %7, 3
  %359 = icmp ult i32 %357, 3
  %unroll_iter1680 = and i32 %7, -4
  %lcmp.mod1678.not = icmp eq i32 %xtraiter1676, 0
  %xtraiter1682 = and i32 %9, 7
  %360 = icmp ult i32 %358, 7
  %unroll_iter1686 = and i32 %9, -8
  %lcmp.mod1684.not = icmp eq i32 %xtraiter1682, 0
  br label %"for output.s0.b.rebased.us"

"for output.s0.b.rebased.us":                     ; preds = %"for output.s0.b.rebased.us.preheader", %"end for output.s0.y.rebased.loopexit.us"
  %sum_input395.sroa.0.0.us = phi <6 x i32> [ %.us-phi1250.us, %"end for output.s0.y.rebased.loopexit.us" ], [ undef, %"for output.s0.b.rebased.us.preheader" ]
  %output.s0.b.rebased.us = phi i32 [ %367, %"end for output.s0.y.rebased.loopexit.us" ], [ 0, %"for output.s0.b.rebased.us.preheader" ]
  %361 = add nsw i32 %output.s0.b.rebased.us, %20
  %362 = mul nsw i32 %361, %31
  %363 = sub i32 %362, %reass.add930
  %364 = mul nsw i32 %361, %22
  %365 = sub i32 %364, %317
  %366 = sub nsw i32 %364, %t852
  br i1 %335, label %"for output.s0.y.rebased.us.us", label %"end for output.s0.y.rebased.loopexit.us", !prof !96

"end for output.s0.y.rebased.loopexit.us":        ; preds = %"end for output.s0.x.xo.loopexit.us.us", %"for output.s0.b.rebased.us"
  %.us-phi1250.us = phi <6 x i32> [ %sum_input395.sroa.0.0.us, %"for output.s0.b.rebased.us" ], [ %sum_input395.sroa.0.13.us.us, %"end for output.s0.x.xo.loopexit.us.us" ]
  %367 = add nuw nsw i32 %output.s0.b.rebased.us, 1
  %.not451.us = icmp eq i32 %367, %21
  br i1 %.not451.us, label %after_bb3, label %"for output.s0.b.rebased.us"

"for output.s0.y.rebased.us.us":                  ; preds = %"for output.s0.b.rebased.us", %"end for output.s0.x.xo.loopexit.us.us"
  %sum_input395.sroa.0.1.us.us = phi <6 x i32> [ %sum_input395.sroa.0.13.us.us, %"end for output.s0.x.xo.loopexit.us.us" ], [ %sum_input395.sroa.0.0.us, %"for output.s0.b.rebased.us" ]
  %output.s0.y.rebased.us.us = phi i32 [ %864, %"end for output.s0.x.xo.loopexit.us.us" ], [ 0, %"for output.s0.b.rebased.us" ]
  %368 = add nsw i32 %output.s0.y.rebased.us.us, %28
  %369 = mul nsw i32 %368, %30
  %t877.us.us = add i32 %363, %369
  %370 = mul nsw i32 %368, %stride_y
  br label %"for output.s0.x.xo.us.us"

"for output.s0.x.xo.us.us":                       ; preds = %"end for output.s0.c.co.us.us", %"for output.s0.y.rebased.us.us"
  %sum_input395.sroa.0.3.us.us = phi <6 x i32> [ %sum_input395.sroa.0.13.us.us, %"end for output.s0.c.co.us.us" ], [ %sum_input395.sroa.0.1.us.us, %"for output.s0.y.rebased.us.us" ]
  %output.s0.x.xo.us.us = phi i32 [ %803, %"end for output.s0.c.co.us.us" ], [ 0, %"for output.s0.y.rebased.us.us" ]
  %a12.us.us = mul nsw i32 %output.s0.x.xo.us.us, 6
  %371 = icmp slt i32 %a12.us.us, %b14
  %output.s0.x.x.base.s.us.us = select i1 %371, i32 %a12.us.us, i32 %b14
  br i1 %t843.not, label %"consume sum_input.us.us", label %then_bb7.us.us

then_bb7.us.us:                                   ; preds = %"for output.s0.x.xo.us.us"
  br i1 %t844, label %then_bb10.us.us, label %next_bb11.us.us

next_bb11.us.us:                                  ; preds = %then_bb7.us.us
  br i1 %336, label %"for sum_input.s1.r19$y12.preheader.us.us", label %"consume sum_input.us.us", !prof !96

then_bb10.us.us:                                  ; preds = %then_bb7.us.us
  br i1 %336, label %"for sum_input.s1.r19$y.preheader.us.us", label %"consume sum_input.us.us", !prof !96

"for sum_input.s1.r19$y.us.us":                   ; preds = %"for sum_input.s1.r19$y.preheader.us.us", %"end for sum_input.s1.r19$x.us.us"
  %sum_input395.sroa.0.5.us.us = phi <6 x i32> [ %sum_input395.sroa.0.7.us.us, %"end for sum_input.s1.r19$x.us.us" ], [ zeroinitializer, %"for sum_input.s1.r19$y.preheader.us.us" ]
  %"sum_input.s1.r19$y.us.us" = phi i32 [ %464, %"end for sum_input.s1.r19$x.us.us" ], [ 0, %"for sum_input.s1.r19$y.preheader.us.us" ]
  br i1 %337, label %"for sum_input.s1.r19$x.preheader.us.us", label %"end for sum_input.s1.r19$x.us.us", !prof !96

"for sum_input.s1.r19$x.us.us":                   ; preds = %"for sum_input.s1.r19$x.preheader.us.us", %"for sum_input.s1.r19$x.us.us"
  %sum_input395.sroa.0.6.us.us = phi <6 x i32> [ %451, %"for sum_input.s1.r19$x.us.us" ], [ %sum_input395.sroa.0.5.us.us, %"for sum_input.s1.r19$x.preheader.us.us" ]
  %"sum_input.s1.r19$x.us.us" = phi i32 [ %452, %"for sum_input.s1.r19$x.us.us" ], [ 0, %"for sum_input.s1.r19$x.preheader.us.us" ]
  %niter1687 = phi i32 [ %niter1687.nsub.7, %"for sum_input.s1.r19$x.us.us" ], [ %unroll_iter1686, %"for sum_input.s1.r19$x.preheader.us.us" ]
  %372 = mul nsw i32 %"sum_input.s1.r19$x.us.us", %dilation_x
  %reass.add935.us.us = add i32 %861, %372
  %reass.mul936.us.us = shl i32 %reass.add935.us.us, 2
  %373 = add i32 %t880.us.us, %reass.mul936.us.us
  %374 = getelementptr inbounds i8, i8* %13, i32 %373
  %375 = bitcast i8* %374 to <24 x i8>*
  %376 = load <24 x i8>, <24 x i8>* %375, align 4, !tbaa !110
  %377 = shufflevector <6 x i32> %sum_input395.sroa.0.6.us.us, <6 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %378 = shufflevector <24 x i8> %376, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %379 = bitcast <128 x i8> %378 to <32 x i32>
  %380 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %377, <32 x i32> %379, i32 16843009) #11
  %381 = or i32 %"sum_input.s1.r19$x.us.us", 1
  %382 = mul nsw i32 %381, %dilation_x
  %reass.add935.us.us.1 = add i32 %861, %382
  %reass.mul936.us.us.1 = shl i32 %reass.add935.us.us.1, 2
  %383 = add i32 %t880.us.us, %reass.mul936.us.us.1
  %384 = getelementptr inbounds i8, i8* %13, i32 %383
  %385 = bitcast i8* %384 to <24 x i8>*
  %386 = load <24 x i8>, <24 x i8>* %385, align 4, !tbaa !110
  %387 = shufflevector <32 x i32> %380, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %388 = shufflevector <24 x i8> %386, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %389 = bitcast <128 x i8> %388 to <32 x i32>
  %390 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %387, <32 x i32> %389, i32 16843009) #11
  %391 = or i32 %"sum_input.s1.r19$x.us.us", 2
  %392 = mul nsw i32 %391, %dilation_x
  %reass.add935.us.us.2 = add i32 %861, %392
  %reass.mul936.us.us.2 = shl i32 %reass.add935.us.us.2, 2
  %393 = add i32 %t880.us.us, %reass.mul936.us.us.2
  %394 = getelementptr inbounds i8, i8* %13, i32 %393
  %395 = bitcast i8* %394 to <24 x i8>*
  %396 = load <24 x i8>, <24 x i8>* %395, align 4, !tbaa !110
  %397 = shufflevector <32 x i32> %390, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %398 = shufflevector <24 x i8> %396, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %399 = bitcast <128 x i8> %398 to <32 x i32>
  %400 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %397, <32 x i32> %399, i32 16843009) #11
  %401 = or i32 %"sum_input.s1.r19$x.us.us", 3
  %402 = mul nsw i32 %401, %dilation_x
  %reass.add935.us.us.3 = add i32 %861, %402
  %reass.mul936.us.us.3 = shl i32 %reass.add935.us.us.3, 2
  %403 = add i32 %t880.us.us, %reass.mul936.us.us.3
  %404 = getelementptr inbounds i8, i8* %13, i32 %403
  %405 = bitcast i8* %404 to <24 x i8>*
  %406 = load <24 x i8>, <24 x i8>* %405, align 4, !tbaa !110
  %407 = shufflevector <32 x i32> %400, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %408 = shufflevector <24 x i8> %406, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %409 = bitcast <128 x i8> %408 to <32 x i32>
  %410 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %407, <32 x i32> %409, i32 16843009) #11
  %411 = or i32 %"sum_input.s1.r19$x.us.us", 4
  %412 = mul nsw i32 %411, %dilation_x
  %reass.add935.us.us.4 = add i32 %861, %412
  %reass.mul936.us.us.4 = shl i32 %reass.add935.us.us.4, 2
  %413 = add i32 %t880.us.us, %reass.mul936.us.us.4
  %414 = getelementptr inbounds i8, i8* %13, i32 %413
  %415 = bitcast i8* %414 to <24 x i8>*
  %416 = load <24 x i8>, <24 x i8>* %415, align 4, !tbaa !110
  %417 = shufflevector <32 x i32> %410, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %418 = shufflevector <24 x i8> %416, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %419 = bitcast <128 x i8> %418 to <32 x i32>
  %420 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %417, <32 x i32> %419, i32 16843009) #11
  %421 = or i32 %"sum_input.s1.r19$x.us.us", 5
  %422 = mul nsw i32 %421, %dilation_x
  %reass.add935.us.us.5 = add i32 %861, %422
  %reass.mul936.us.us.5 = shl i32 %reass.add935.us.us.5, 2
  %423 = add i32 %t880.us.us, %reass.mul936.us.us.5
  %424 = getelementptr inbounds i8, i8* %13, i32 %423
  %425 = bitcast i8* %424 to <24 x i8>*
  %426 = load <24 x i8>, <24 x i8>* %425, align 4, !tbaa !110
  %427 = shufflevector <32 x i32> %420, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %428 = shufflevector <24 x i8> %426, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %429 = bitcast <128 x i8> %428 to <32 x i32>
  %430 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %427, <32 x i32> %429, i32 16843009) #11
  %431 = or i32 %"sum_input.s1.r19$x.us.us", 6
  %432 = mul nsw i32 %431, %dilation_x
  %reass.add935.us.us.6 = add i32 %861, %432
  %reass.mul936.us.us.6 = shl i32 %reass.add935.us.us.6, 2
  %433 = add i32 %t880.us.us, %reass.mul936.us.us.6
  %434 = getelementptr inbounds i8, i8* %13, i32 %433
  %435 = bitcast i8* %434 to <24 x i8>*
  %436 = load <24 x i8>, <24 x i8>* %435, align 4, !tbaa !110
  %437 = shufflevector <32 x i32> %430, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %438 = shufflevector <24 x i8> %436, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %439 = bitcast <128 x i8> %438 to <32 x i32>
  %440 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %437, <32 x i32> %439, i32 16843009) #11
  %441 = or i32 %"sum_input.s1.r19$x.us.us", 7
  %442 = mul nsw i32 %441, %dilation_x
  %reass.add935.us.us.7 = add i32 %861, %442
  %reass.mul936.us.us.7 = shl i32 %reass.add935.us.us.7, 2
  %443 = add i32 %t880.us.us, %reass.mul936.us.us.7
  %444 = getelementptr inbounds i8, i8* %13, i32 %443
  %445 = bitcast i8* %444 to <24 x i8>*
  %446 = load <24 x i8>, <24 x i8>* %445, align 4, !tbaa !110
  %447 = shufflevector <32 x i32> %440, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %448 = shufflevector <24 x i8> %446, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %449 = bitcast <128 x i8> %448 to <32 x i32>
  %450 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %447, <32 x i32> %449, i32 16843009) #11
  %451 = shufflevector <32 x i32> %450, <32 x i32> undef, <6 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
  %452 = add nuw nsw i32 %"sum_input.s1.r19$x.us.us", 8
  %niter1687.nsub.7 = add i32 %niter1687, -8
  %niter1687.ncmp.7 = icmp eq i32 %niter1687.nsub.7, 0
  br i1 %niter1687.ncmp.7, label %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x.us.us"

"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa": ; preds = %"for sum_input.s1.r19$x.us.us", %"for sum_input.s1.r19$x.preheader.us.us"
  %.lcssa1525.ph = phi <6 x i32> [ undef, %"for sum_input.s1.r19$x.preheader.us.us" ], [ %451, %"for sum_input.s1.r19$x.us.us" ]
  %sum_input395.sroa.0.6.us.us.unr = phi <6 x i32> [ %sum_input395.sroa.0.5.us.us, %"for sum_input.s1.r19$x.preheader.us.us" ], [ %451, %"for sum_input.s1.r19$x.us.us" ]
  %"sum_input.s1.r19$x.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x.preheader.us.us" ], [ %452, %"for sum_input.s1.r19$x.us.us" ]
  br i1 %lcmp.mod1684.not, label %"end for sum_input.s1.r19$x.us.us", label %"for sum_input.s1.r19$x.us.us.epil"

"for sum_input.s1.r19$x.us.us.epil":              ; preds = %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x.us.us.epil"
  %sum_input395.sroa.0.6.us.us.epil = phi <6 x i32> [ %462, %"for sum_input.s1.r19$x.us.us.epil" ], [ %sum_input395.sroa.0.6.us.us.unr, %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa" ]
  %"sum_input.s1.r19$x.us.us.epil" = phi i32 [ %463, %"for sum_input.s1.r19$x.us.us.epil" ], [ %"sum_input.s1.r19$x.us.us.unr", %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa" ]
  %epil.iter1683 = phi i32 [ %epil.iter1683.sub, %"for sum_input.s1.r19$x.us.us.epil" ], [ %xtraiter1682, %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa" ]
  %453 = mul nsw i32 %"sum_input.s1.r19$x.us.us.epil", %dilation_x
  %reass.add935.us.us.epil = add i32 %861, %453
  %reass.mul936.us.us.epil = shl i32 %reass.add935.us.us.epil, 2
  %454 = add i32 %t880.us.us, %reass.mul936.us.us.epil
  %455 = getelementptr inbounds i8, i8* %13, i32 %454
  %456 = bitcast i8* %455 to <24 x i8>*
  %457 = load <24 x i8>, <24 x i8>* %456, align 4, !tbaa !110
  %458 = shufflevector <6 x i32> %sum_input395.sroa.0.6.us.us.epil, <6 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %459 = shufflevector <24 x i8> %457, <24 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %460 = bitcast <128 x i8> %459 to <32 x i32>
  %461 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %458, <32 x i32> %460, i32 16843009) #11
  %462 = shufflevector <32 x i32> %461, <32 x i32> undef, <6 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
  %463 = add nuw nsw i32 %"sum_input.s1.r19$x.us.us.epil", 1
  %epil.iter1683.sub = add i32 %epil.iter1683, -1
  %epil.iter1683.cmp.not = icmp eq i32 %epil.iter1683.sub, 0
  br i1 %epil.iter1683.cmp.not, label %"end for sum_input.s1.r19$x.us.us", label %"for sum_input.s1.r19$x.us.us.epil", !llvm.loop !112

"end for sum_input.s1.r19$x.us.us":               ; preds = %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x.us.us.epil", %"for sum_input.s1.r19$y.us.us"
  %sum_input395.sroa.0.7.us.us = phi <6 x i32> [ %sum_input395.sroa.0.5.us.us, %"for sum_input.s1.r19$y.us.us" ], [ %.lcssa1525.ph, %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa" ], [ %462, %"for sum_input.s1.r19$x.us.us.epil" ]
  %464 = add nuw nsw i32 %"sum_input.s1.r19$y.us.us", 1
  %.not461.us.us = icmp eq i32 %464, %11
  br i1 %.not461.us.us, label %"consume sum_input.us.us", label %"for sum_input.s1.r19$y.us.us"

"consume sum_input.us.us":                        ; preds = %"end for sum_input.s1.r19$x16.loopexit.split.us.us.us.us.us", %"end for sum_input.s1.r19$x.us.us", %"for sum_input.s1.r19$y12.preheader.us.us", %then_bb10.us.us, %next_bb11.us.us, %"for output.s0.x.xo.us.us"
  %sum_input395.sroa.0.13.us.us = phi <6 x i32> [ %sum_input395.sroa.0.3.us.us, %"for output.s0.x.xo.us.us" ], [ zeroinitializer, %then_bb10.us.us ], [ zeroinitializer, %next_bb11.us.us ], [ zeroinitializer, %"for sum_input.s1.r19$y12.preheader.us.us" ], [ %sum_input395.sroa.0.7.us.us, %"end for sum_input.s1.r19$x.us.us" ], [ %.lcssa, %"end for sum_input.s1.r19$x16.loopexit.split.us.us.us.us.us" ]
  br i1 %340, label %"for output.s0.c.co.preheader.us.us", label %"end for output.s0.c.co.us.us", !prof !96

"for output.s0.c.co.us.us":                       ; preds = %"for output.s0.c.co.preheader.us.us", %"consume convolved.us.us"
  %output.s0.c.co.us.us = phi i32 [ %802, %"consume convolved.us.us" ], [ 0, %"for output.s0.c.co.preheader.us.us" ]
  %465 = shl nsw i32 %output.s0.c.co.us.us, 7
  %466 = getelementptr inbounds i32, i32* %offset_c, i32 %465
  %467 = bitcast i32* %466 to <32 x i32>*
  %468 = load <32 x i32>, <32 x i32>* %467, align 128, !tbaa !104
  br i1 %t843.not, label %then_bb19.us.us, label %next_bb20.us.us

next_bb20.us.us:                                  ; preds = %"for output.s0.c.co.us.us"
  %469 = sub nsw <32 x i32> %468, %826
  %470 = sub nsw <32 x i32> %468, %829
  %471 = sub nsw <32 x i32> %468, %832
  %472 = sub nsw <32 x i32> %468, %835
  %473 = sub nsw <32 x i32> %468, %838
  %474 = sub nsw <32 x i32> %468, %841
  %475 = getelementptr inbounds i32, i32* %466, i32 32
  %476 = bitcast i32* %475 to <32 x i32>*
  %477 = load <32 x i32>, <32 x i32>* %476, align 128, !tbaa !104
  %478 = sub nsw <32 x i32> %477, %826
  %479 = sub nsw <32 x i32> %477, %829
  %480 = sub nsw <32 x i32> %477, %832
  %481 = sub nsw <32 x i32> %477, %835
  %482 = sub nsw <32 x i32> %477, %838
  %483 = sub nsw <32 x i32> %477, %841
  %484 = getelementptr inbounds i32, i32* %466, i32 64
  %485 = bitcast i32* %484 to <32 x i32>*
  %486 = load <32 x i32>, <32 x i32>* %485, align 128, !tbaa !104
  %487 = sub nsw <32 x i32> %486, %826
  %488 = sub nsw <32 x i32> %486, %829
  %489 = sub nsw <32 x i32> %486, %832
  %490 = sub nsw <32 x i32> %486, %835
  %491 = sub nsw <32 x i32> %486, %838
  %492 = sub nsw <32 x i32> %486, %841
  %493 = getelementptr inbounds i32, i32* %466, i32 96
  %494 = bitcast i32* %493 to <32 x i32>*
  %495 = load <32 x i32>, <32 x i32>* %494, align 128, !tbaa !104
  %496 = sub nsw <32 x i32> %495, %826
  %497 = sub nsw <32 x i32> %495, %829
  %498 = sub nsw <32 x i32> %495, %832
  %499 = sub nsw <32 x i32> %495, %835
  %500 = sub nsw <32 x i32> %495, %838
  %501 = sub nsw <32 x i32> %495, %841
  br label %after_bb18.us.us

then_bb19.us.us:                                  ; preds = %"for output.s0.c.co.us.us"
  %502 = getelementptr inbounds i32, i32* %466, i32 32
  %503 = bitcast i32* %502 to <32 x i32>*
  %504 = load <32 x i32>, <32 x i32>* %503, align 128, !tbaa !104
  %505 = getelementptr inbounds i32, i32* %466, i32 64
  %506 = bitcast i32* %505 to <32 x i32>*
  %507 = load <32 x i32>, <32 x i32>* %506, align 128, !tbaa !104
  %508 = getelementptr inbounds i32, i32* %466, i32 96
  %509 = bitcast i32* %508 to <32 x i32>*
  %510 = load <32 x i32>, <32 x i32>* %509, align 128, !tbaa !104
  br label %after_bb18.us.us

after_bb18.us.us:                                 ; preds = %then_bb19.us.us, %next_bb20.us.us
  %convolved394.sroa.208.0.us.us = phi <32 x i32> [ %510, %then_bb19.us.us ], [ %501, %next_bb20.us.us ]
  %convolved394.sroa.203.0.us.us = phi <32 x i32> [ %507, %then_bb19.us.us ], [ %492, %next_bb20.us.us ]
  %convolved394.sroa.198.0.us.us = phi <32 x i32> [ %504, %then_bb19.us.us ], [ %483, %next_bb20.us.us ]
  %convolved394.sroa.193.0.us.us = phi <32 x i32> [ %468, %then_bb19.us.us ], [ %474, %next_bb20.us.us ]
  %convolved394.sroa.188.0.us.us = phi <32 x i32> [ %510, %then_bb19.us.us ], [ %500, %next_bb20.us.us ]
  %convolved394.sroa.183.0.us.us = phi <32 x i32> [ %507, %then_bb19.us.us ], [ %491, %next_bb20.us.us ]
  %convolved394.sroa.178.0.us.us = phi <32 x i32> [ %504, %then_bb19.us.us ], [ %482, %next_bb20.us.us ]
  %convolved394.sroa.173.0.us.us = phi <32 x i32> [ %468, %then_bb19.us.us ], [ %473, %next_bb20.us.us ]
  %convolved394.sroa.168.0.us.us = phi <32 x i32> [ %510, %then_bb19.us.us ], [ %499, %next_bb20.us.us ]
  %convolved394.sroa.163.0.us.us = phi <32 x i32> [ %507, %then_bb19.us.us ], [ %490, %next_bb20.us.us ]
  %convolved394.sroa.158.0.us.us = phi <32 x i32> [ %504, %then_bb19.us.us ], [ %481, %next_bb20.us.us ]
  %convolved394.sroa.153.0.us.us = phi <32 x i32> [ %468, %then_bb19.us.us ], [ %472, %next_bb20.us.us ]
  %convolved394.sroa.148.0.us.us = phi <32 x i32> [ %510, %then_bb19.us.us ], [ %498, %next_bb20.us.us ]
  %convolved394.sroa.143.0.us.us = phi <32 x i32> [ %507, %then_bb19.us.us ], [ %489, %next_bb20.us.us ]
  %convolved394.sroa.138.0.us.us = phi <32 x i32> [ %504, %then_bb19.us.us ], [ %480, %next_bb20.us.us ]
  %convolved394.sroa.133.0.us.us = phi <32 x i32> [ %468, %then_bb19.us.us ], [ %471, %next_bb20.us.us ]
  %convolved394.sroa.123.0.us.us = phi <32 x i32> [ %510, %then_bb19.us.us ], [ %497, %next_bb20.us.us ]
  %convolved394.sroa.113.0.us.us = phi <32 x i32> [ %507, %then_bb19.us.us ], [ %488, %next_bb20.us.us ]
  %convolved394.sroa.103.0.us.us = phi <32 x i32> [ %504, %then_bb19.us.us ], [ %479, %next_bb20.us.us ]
  %convolved394.sroa.93.0.us.us = phi <32 x i32> [ %468, %then_bb19.us.us ], [ %470, %next_bb20.us.us ]
  %convolved394.sroa.78.0.us.us = phi <32 x i32> [ %510, %then_bb19.us.us ], [ %496, %next_bb20.us.us ]
  %convolved394.sroa.63.0.us.us = phi <32 x i32> [ %507, %then_bb19.us.us ], [ %487, %next_bb20.us.us ]
  %convolved394.sroa.48.0.us.us = phi <32 x i32> [ %504, %then_bb19.us.us ], [ %478, %next_bb20.us.us ]
  %convolved394.sroa.0.0.us.us = phi <32 x i32> [ %468, %then_bb19.us.us ], [ %469, %next_bb20.us.us ]
  br i1 %336, label %"for convolved.s1.r19$y.preheader.us.us", label %"consume convolved.us.us", !prof !96

"for convolved.s1.r19$y.us.us":                   ; preds = %"for convolved.s1.r19$y.preheader.us.us", %"end for convolved.s1.r19$x.us.us"
  %convolved394.sroa.208.1.us.us = phi <32 x i32> [ %convolved394.sroa.208.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.208.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.203.1.us.us = phi <32 x i32> [ %convolved394.sroa.203.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.203.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.198.1.us.us = phi <32 x i32> [ %convolved394.sroa.198.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.198.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.193.1.us.us = phi <32 x i32> [ %convolved394.sroa.193.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.193.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.188.1.us.us = phi <32 x i32> [ %convolved394.sroa.188.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.188.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.183.1.us.us = phi <32 x i32> [ %convolved394.sroa.183.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.183.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.178.1.us.us = phi <32 x i32> [ %convolved394.sroa.178.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.178.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.173.1.us.us = phi <32 x i32> [ %convolved394.sroa.173.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.173.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.168.1.us.us = phi <32 x i32> [ %convolved394.sroa.168.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.168.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.163.1.us.us = phi <32 x i32> [ %convolved394.sroa.163.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.163.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.158.1.us.us = phi <32 x i32> [ %convolved394.sroa.158.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.158.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.153.1.us.us = phi <32 x i32> [ %convolved394.sroa.153.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.153.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.148.1.us.us = phi <32 x i32> [ %convolved394.sroa.148.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.148.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.143.1.us.us = phi <32 x i32> [ %convolved394.sroa.143.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.143.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.138.1.us.us = phi <32 x i32> [ %convolved394.sroa.138.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.138.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.133.1.us.us = phi <32 x i32> [ %convolved394.sroa.133.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.133.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.123.1.us.us = phi <32 x i32> [ %convolved394.sroa.123.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.123.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.113.1.us.us = phi <32 x i32> [ %convolved394.sroa.113.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.113.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.103.1.us.us = phi <32 x i32> [ %convolved394.sroa.103.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.103.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.93.1.us.us = phi <32 x i32> [ %convolved394.sroa.93.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.93.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.78.1.us.us = phi <32 x i32> [ %convolved394.sroa.78.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.78.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.63.1.us.us = phi <32 x i32> [ %convolved394.sroa.63.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.63.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.48.1.us.us = phi <32 x i32> [ %convolved394.sroa.48.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.48.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %convolved394.sroa.0.1.us.us = phi <32 x i32> [ %convolved394.sroa.0.3.us.us, %"end for convolved.s1.r19$x.us.us" ], [ %convolved394.sroa.0.0.us.us, %"for convolved.s1.r19$y.preheader.us.us" ]
  %"convolved.s1.r19$y.us.us" = phi i32 [ %595, %"end for convolved.s1.r19$x.us.us" ], [ 0, %"for convolved.s1.r19$y.preheader.us.us" ]
  %511 = mul nsw i32 %"convolved.s1.r19$y.us.us", %dilation_y
  %512 = add nsw i32 %511, %370
  %513 = mul nsw i32 %512, %19
  %t913.us.us = add nsw i32 %513, %366
  %514 = mul nsw i32 %"convolved.s1.r19$y.us.us", %12
  br i1 %337, label %"for convolved.s1.r19$x.us.us", label %"end for convolved.s1.r19$x.us.us", !prof !96

"for convolved.s1.r19$x.us.us":                   ; preds = %"for convolved.s1.r19$y.us.us", %"end for convolved.s1.r19$z.r124.us.us"
  %convolved394.sroa.208.2.us.us = phi <32 x i32> [ %convolved394.sroa.208.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.208.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.203.2.us.us = phi <32 x i32> [ %convolved394.sroa.203.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.203.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.198.2.us.us = phi <32 x i32> [ %convolved394.sroa.198.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.198.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.193.2.us.us = phi <32 x i32> [ %convolved394.sroa.193.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.193.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.188.2.us.us = phi <32 x i32> [ %convolved394.sroa.188.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.188.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.183.2.us.us = phi <32 x i32> [ %convolved394.sroa.183.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.183.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.178.2.us.us = phi <32 x i32> [ %convolved394.sroa.178.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.178.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.173.2.us.us = phi <32 x i32> [ %convolved394.sroa.173.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.173.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.168.2.us.us = phi <32 x i32> [ %convolved394.sroa.168.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.168.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.163.2.us.us = phi <32 x i32> [ %convolved394.sroa.163.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.163.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.158.2.us.us = phi <32 x i32> [ %convolved394.sroa.158.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.158.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.153.2.us.us = phi <32 x i32> [ %convolved394.sroa.153.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.153.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.148.2.us.us = phi <32 x i32> [ %convolved394.sroa.148.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.148.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.143.2.us.us = phi <32 x i32> [ %convolved394.sroa.143.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.143.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.138.2.us.us = phi <32 x i32> [ %convolved394.sroa.138.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.138.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.133.2.us.us = phi <32 x i32> [ %convolved394.sroa.133.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.133.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.123.2.us.us = phi <32 x i32> [ %convolved394.sroa.123.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.123.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.113.2.us.us = phi <32 x i32> [ %convolved394.sroa.113.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.113.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.103.2.us.us = phi <32 x i32> [ %convolved394.sroa.103.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.103.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.93.2.us.us = phi <32 x i32> [ %convolved394.sroa.93.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.93.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.78.2.us.us = phi <32 x i32> [ %convolved394.sroa.78.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.78.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.63.2.us.us = phi <32 x i32> [ %convolved394.sroa.63.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.63.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.48.2.us.us = phi <32 x i32> [ %convolved394.sroa.48.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.48.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %convolved394.sroa.0.2.us.us = phi <32 x i32> [ %convolved394.sroa.0.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.0.1.us.us, %"for convolved.s1.r19$y.us.us" ]
  %"convolved.s1.r19$x.us.us" = phi i32 [ %594, %"end for convolved.s1.r19$z.r124.us.us" ], [ 0, %"for convolved.s1.r19$y.us.us" ]
  %515 = mul nsw i32 %"convolved.s1.r19$x.us.us", %dilation_x
  %516 = mul nsw i32 %"convolved.s1.r19$x.us.us", %10
  %t920.us.us = add i32 %516, %514
  br i1 %338, label %"for convolved.s1.r19$z.r124.preheader.us.us", label %"end for convolved.s1.r19$z.r124.us.us", !prof !96

"for convolved.s1.r19$z.r124.us.us":              ; preds = %"for convolved.s1.r19$z.r124.preheader.us.us", %"for convolved.s1.r19$z.r124.us.us"
  %convolved394.sroa.208.4.us.us = phi <32 x i32> [ %592, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.208.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.203.4.us.us = phi <32 x i32> [ %591, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.203.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.198.4.us.us = phi <32 x i32> [ %590, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.198.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.193.4.us.us = phi <32 x i32> [ %589, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.193.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.188.4.us.us = phi <32 x i32> [ %583, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.188.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.183.4.us.us = phi <32 x i32> [ %582, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.183.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.178.4.us.us = phi <32 x i32> [ %581, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.178.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.173.4.us.us = phi <32 x i32> [ %580, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.173.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.168.4.us.us = phi <32 x i32> [ %574, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.168.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.163.4.us.us = phi <32 x i32> [ %573, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.163.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.158.4.us.us = phi <32 x i32> [ %572, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.158.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.153.4.us.us = phi <32 x i32> [ %571, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.153.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.148.4.us.us = phi <32 x i32> [ %565, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.148.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.143.4.us.us = phi <32 x i32> [ %564, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.143.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.138.4.us.us = phi <32 x i32> [ %563, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.138.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.133.4.us.us = phi <32 x i32> [ %562, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.133.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.123.4.us.us = phi <32 x i32> [ %556, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.123.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.113.4.us.us = phi <32 x i32> [ %555, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.113.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.103.4.us.us = phi <32 x i32> [ %554, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.103.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.93.4.us.us = phi <32 x i32> [ %553, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.93.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.78.4.us.us = phi <32 x i32> [ %547, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.78.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.63.4.us.us = phi <32 x i32> [ %542, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.63.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.48.4.us.us = phi <32 x i32> [ %537, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.48.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %convolved394.sroa.0.4.us.us = phi <32 x i32> [ %531, %"for convolved.s1.r19$z.r124.us.us" ], [ %convolved394.sroa.0.2.us.us, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %"convolved.s1.r19$z.r124.us.us" = phi i32 [ %593, %"for convolved.s1.r19$z.r124.us.us" ], [ 0, %"for convolved.s1.r19$z.r124.preheader.us.us" ]
  %517 = shl nsw i32 %"convolved.s1.r19$z.r124.us.us", 5
  %518 = add nsw i32 %517, %820
  %519 = shl nsw i32 %518, 2
  %520 = add nsw i32 %t920.us.us, %519
  %521 = getelementptr inbounds i8, i8* %5, i32 %520
  %522 = bitcast i8* %521 to <32 x i32>*
  %523 = load <32 x i32>, <32 x i32>* %522, align 128, !tbaa !106
  %524 = shl nsw i32 %"convolved.s1.r19$z.r124.us.us", 2
  %525 = add i32 %524, %t913.us.us
  %526 = add i32 %525, %804
  %527 = getelementptr inbounds i8, i8* %13, i32 %526
  %528 = bitcast i8* %527 to <1 x i32>*
  %529 = load <1 x i32>, <1 x i32>* %528, align 4, !tbaa !110
  %530 = extractelement <1 x i32> %529, i64 0
  %531 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.4.us.us, <32 x i32> %523, i32 %530) #11
  %532 = shl nsw i32 %"convolved.s1.r19$z.r124.us.us", 7
  %533 = add i32 %805, %532
  %534 = getelementptr inbounds i8, i8* %5, i32 %533
  %535 = bitcast i8* %534 to <32 x i32>*
  %536 = load <32 x i32>, <32 x i32>* %535, align 128, !tbaa !106
  %537 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.48.4.us.us, <32 x i32> %536, i32 %530) #11
  %538 = add i32 %806, %532
  %539 = getelementptr inbounds i8, i8* %5, i32 %538
  %540 = bitcast i8* %539 to <32 x i32>*
  %541 = load <32 x i32>, <32 x i32>* %540, align 128, !tbaa !106
  %542 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.63.4.us.us, <32 x i32> %541, i32 %530) #11
  %543 = add i32 %807, %532
  %544 = getelementptr inbounds i8, i8* %5, i32 %543
  %545 = bitcast i8* %544 to <32 x i32>*
  %546 = load <32 x i32>, <32 x i32>* %545, align 128, !tbaa !106
  %547 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.78.4.us.us, <32 x i32> %546, i32 %530) #11
  %548 = add i32 %525, %808
  %549 = getelementptr inbounds i8, i8* %13, i32 %548
  %550 = bitcast i8* %549 to <1 x i32>*
  %551 = load <1 x i32>, <1 x i32>* %550, align 4, !tbaa !110
  %552 = extractelement <1 x i32> %551, i64 0
  %553 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.93.4.us.us, <32 x i32> %523, i32 %552) #11
  %554 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.103.4.us.us, <32 x i32> %536, i32 %552) #11
  %555 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.113.4.us.us, <32 x i32> %541, i32 %552) #11
  %556 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.123.4.us.us, <32 x i32> %546, i32 %552) #11
  %557 = add i32 %525, %809
  %558 = getelementptr inbounds i8, i8* %13, i32 %557
  %559 = bitcast i8* %558 to <1 x i32>*
  %560 = load <1 x i32>, <1 x i32>* %559, align 4, !tbaa !110
  %561 = extractelement <1 x i32> %560, i64 0
  %562 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.133.4.us.us, <32 x i32> %523, i32 %561) #11
  %563 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.138.4.us.us, <32 x i32> %536, i32 %561) #11
  %564 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.143.4.us.us, <32 x i32> %541, i32 %561) #11
  %565 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.148.4.us.us, <32 x i32> %546, i32 %561) #11
  %566 = add i32 %525, %810
  %567 = getelementptr inbounds i8, i8* %13, i32 %566
  %568 = bitcast i8* %567 to <1 x i32>*
  %569 = load <1 x i32>, <1 x i32>* %568, align 4, !tbaa !110
  %570 = extractelement <1 x i32> %569, i64 0
  %571 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.153.4.us.us, <32 x i32> %523, i32 %570) #11
  %572 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.158.4.us.us, <32 x i32> %536, i32 %570) #11
  %573 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.163.4.us.us, <32 x i32> %541, i32 %570) #11
  %574 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.168.4.us.us, <32 x i32> %546, i32 %570) #11
  %575 = add i32 %525, %811
  %576 = getelementptr inbounds i8, i8* %13, i32 %575
  %577 = bitcast i8* %576 to <1 x i32>*
  %578 = load <1 x i32>, <1 x i32>* %577, align 4, !tbaa !110
  %579 = extractelement <1 x i32> %578, i64 0
  %580 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.173.4.us.us, <32 x i32> %523, i32 %579) #11
  %581 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.178.4.us.us, <32 x i32> %536, i32 %579) #11
  %582 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.183.4.us.us, <32 x i32> %541, i32 %579) #11
  %583 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.188.4.us.us, <32 x i32> %546, i32 %579) #11
  %584 = add i32 %525, %812
  %585 = getelementptr inbounds i8, i8* %13, i32 %584
  %586 = bitcast i8* %585 to <1 x i32>*
  %587 = load <1 x i32>, <1 x i32>* %586, align 4, !tbaa !110
  %588 = extractelement <1 x i32> %587, i64 0
  %589 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.193.4.us.us, <32 x i32> %523, i32 %588) #11
  %590 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.198.4.us.us, <32 x i32> %536, i32 %588) #11
  %591 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.203.4.us.us, <32 x i32> %541, i32 %588) #11
  %592 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.208.4.us.us, <32 x i32> %546, i32 %588) #11
  %593 = add nuw nsw i32 %"convolved.s1.r19$z.r124.us.us", 1
  %.not457.us.us = icmp eq i32 %593, %7
  br i1 %.not457.us.us, label %"end for convolved.s1.r19$z.r124.us.us", label %"for convolved.s1.r19$z.r124.us.us"

"end for convolved.s1.r19$z.r124.us.us":          ; preds = %"for convolved.s1.r19$z.r124.us.us", %"for convolved.s1.r19$x.us.us"
  %convolved394.sroa.208.5.us.us = phi <32 x i32> [ %convolved394.sroa.208.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %592, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.203.5.us.us = phi <32 x i32> [ %convolved394.sroa.203.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %591, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.198.5.us.us = phi <32 x i32> [ %convolved394.sroa.198.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %590, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.193.5.us.us = phi <32 x i32> [ %convolved394.sroa.193.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %589, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.188.5.us.us = phi <32 x i32> [ %convolved394.sroa.188.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %583, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.183.5.us.us = phi <32 x i32> [ %convolved394.sroa.183.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %582, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.178.5.us.us = phi <32 x i32> [ %convolved394.sroa.178.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %581, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.173.5.us.us = phi <32 x i32> [ %convolved394.sroa.173.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %580, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.168.5.us.us = phi <32 x i32> [ %convolved394.sroa.168.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %574, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.163.5.us.us = phi <32 x i32> [ %convolved394.sroa.163.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %573, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.158.5.us.us = phi <32 x i32> [ %convolved394.sroa.158.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %572, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.153.5.us.us = phi <32 x i32> [ %convolved394.sroa.153.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %571, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.148.5.us.us = phi <32 x i32> [ %convolved394.sroa.148.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %565, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.143.5.us.us = phi <32 x i32> [ %convolved394.sroa.143.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %564, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.138.5.us.us = phi <32 x i32> [ %convolved394.sroa.138.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %563, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.133.5.us.us = phi <32 x i32> [ %convolved394.sroa.133.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %562, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.123.5.us.us = phi <32 x i32> [ %convolved394.sroa.123.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %556, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.113.5.us.us = phi <32 x i32> [ %convolved394.sroa.113.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %555, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.103.5.us.us = phi <32 x i32> [ %convolved394.sroa.103.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %554, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.93.5.us.us = phi <32 x i32> [ %convolved394.sroa.93.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %553, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.78.5.us.us = phi <32 x i32> [ %convolved394.sroa.78.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %547, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.63.5.us.us = phi <32 x i32> [ %convolved394.sroa.63.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %542, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.48.5.us.us = phi <32 x i32> [ %convolved394.sroa.48.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %537, %"for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.0.5.us.us = phi <32 x i32> [ %convolved394.sroa.0.2.us.us, %"for convolved.s1.r19$x.us.us" ], [ %531, %"for convolved.s1.r19$z.r124.us.us" ]
  %594 = add nuw nsw i32 %"convolved.s1.r19$x.us.us", 1
  %.not456.us.us = icmp eq i32 %594, %9
  br i1 %.not456.us.us, label %"end for convolved.s1.r19$x.us.us", label %"for convolved.s1.r19$x.us.us"

"end for convolved.s1.r19$x.us.us":               ; preds = %"end for convolved.s1.r19$z.r124.us.us", %"for convolved.s1.r19$y.us.us"
  %convolved394.sroa.208.3.us.us = phi <32 x i32> [ %convolved394.sroa.208.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.208.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.203.3.us.us = phi <32 x i32> [ %convolved394.sroa.203.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.203.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.198.3.us.us = phi <32 x i32> [ %convolved394.sroa.198.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.198.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.193.3.us.us = phi <32 x i32> [ %convolved394.sroa.193.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.193.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.188.3.us.us = phi <32 x i32> [ %convolved394.sroa.188.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.188.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.183.3.us.us = phi <32 x i32> [ %convolved394.sroa.183.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.183.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.178.3.us.us = phi <32 x i32> [ %convolved394.sroa.178.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.178.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.173.3.us.us = phi <32 x i32> [ %convolved394.sroa.173.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.173.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.168.3.us.us = phi <32 x i32> [ %convolved394.sroa.168.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.168.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.163.3.us.us = phi <32 x i32> [ %convolved394.sroa.163.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.163.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.158.3.us.us = phi <32 x i32> [ %convolved394.sroa.158.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.158.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.153.3.us.us = phi <32 x i32> [ %convolved394.sroa.153.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.153.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.148.3.us.us = phi <32 x i32> [ %convolved394.sroa.148.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.148.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.143.3.us.us = phi <32 x i32> [ %convolved394.sroa.143.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.143.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.138.3.us.us = phi <32 x i32> [ %convolved394.sroa.138.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.138.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.133.3.us.us = phi <32 x i32> [ %convolved394.sroa.133.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.133.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.123.3.us.us = phi <32 x i32> [ %convolved394.sroa.123.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.123.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.113.3.us.us = phi <32 x i32> [ %convolved394.sroa.113.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.113.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.103.3.us.us = phi <32 x i32> [ %convolved394.sroa.103.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.103.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.93.3.us.us = phi <32 x i32> [ %convolved394.sroa.93.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.93.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.78.3.us.us = phi <32 x i32> [ %convolved394.sroa.78.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.78.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.63.3.us.us = phi <32 x i32> [ %convolved394.sroa.63.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.63.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.48.3.us.us = phi <32 x i32> [ %convolved394.sroa.48.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.48.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %convolved394.sroa.0.3.us.us = phi <32 x i32> [ %convolved394.sroa.0.1.us.us, %"for convolved.s1.r19$y.us.us" ], [ %convolved394.sroa.0.5.us.us, %"end for convolved.s1.r19$z.r124.us.us" ]
  %595 = add nuw nsw i32 %"convolved.s1.r19$y.us.us", 1
  %.not455.us.us = icmp eq i32 %595, %11
  br i1 %.not455.us.us, label %"consume convolved.us.us", label %"for convolved.s1.r19$y.us.us"

"consume convolved.us.us":                        ; preds = %"end for convolved.s1.r19$x.us.us", %after_bb18.us.us
  %convolved394.sroa.208.6.us.us = phi <32 x i32> [ %convolved394.sroa.208.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.208.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.203.6.us.us = phi <32 x i32> [ %convolved394.sroa.203.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.203.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.198.6.us.us = phi <32 x i32> [ %convolved394.sroa.198.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.198.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.193.6.us.us = phi <32 x i32> [ %convolved394.sroa.193.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.193.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.188.6.us.us = phi <32 x i32> [ %convolved394.sroa.188.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.188.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.183.6.us.us = phi <32 x i32> [ %convolved394.sroa.183.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.183.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.178.6.us.us = phi <32 x i32> [ %convolved394.sroa.178.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.178.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.173.6.us.us = phi <32 x i32> [ %convolved394.sroa.173.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.173.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.168.6.us.us = phi <32 x i32> [ %convolved394.sroa.168.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.168.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.163.6.us.us = phi <32 x i32> [ %convolved394.sroa.163.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.163.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.158.6.us.us = phi <32 x i32> [ %convolved394.sroa.158.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.158.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.153.6.us.us = phi <32 x i32> [ %convolved394.sroa.153.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.153.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.148.6.us.us = phi <32 x i32> [ %convolved394.sroa.148.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.148.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.143.6.us.us = phi <32 x i32> [ %convolved394.sroa.143.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.143.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.138.6.us.us = phi <32 x i32> [ %convolved394.sroa.138.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.138.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.133.6.us.us = phi <32 x i32> [ %convolved394.sroa.133.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.133.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.123.6.us.us = phi <32 x i32> [ %convolved394.sroa.123.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.123.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.113.6.us.us = phi <32 x i32> [ %convolved394.sroa.113.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.113.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.103.6.us.us = phi <32 x i32> [ %convolved394.sroa.103.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.103.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.93.6.us.us = phi <32 x i32> [ %convolved394.sroa.93.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.93.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.78.6.us.us = phi <32 x i32> [ %convolved394.sroa.78.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.78.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.63.6.us.us = phi <32 x i32> [ %convolved394.sroa.63.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.63.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.48.6.us.us = phi <32 x i32> [ %convolved394.sroa.48.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.48.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %convolved394.sroa.0.6.us.us = phi <32 x i32> [ %convolved394.sroa.0.0.us.us, %after_bb18.us.us ], [ %convolved394.sroa.0.3.us.us, %"end for convolved.s1.r19$x.us.us" ]
  %ab1.i.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.0.6.us.us, <32 x i32> %342) #11
  %ab.i.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i.us.us, <32 x i32> %convolved394.sroa.0.6.us.us, <32 x i32> %342) #11
  %ab1.i565.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.48.6.us.us, <32 x i32> %342) #11
  %ab.i566.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i565.us.us, <32 x i32> %convolved394.sroa.48.6.us.us, <32 x i32> %342) #11
  %ab1.i567.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.63.6.us.us, <32 x i32> %342) #11
  %ab.i568.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i567.us.us, <32 x i32> %convolved394.sroa.63.6.us.us, <32 x i32> %342) #11
  %ab1.i569.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.78.6.us.us, <32 x i32> %342) #11
  %ab.i570.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i569.us.us, <32 x i32> %convolved394.sroa.78.6.us.us, <32 x i32> %342) #11
  %596 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i.us.us, i32 %output_shift) #11
  %597 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i566.us.us, i32 %output_shift) #11
  %598 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i568.us.us, i32 %output_shift) #11
  %599 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i570.us.us, i32 %output_shift) #11
  %600 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %597, <32 x i32> %596)
  %601 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %599, <32 x i32> %598)
  %602 = shufflevector <64 x i32> %600, <64 x i32> %601, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %603 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i.us.us, i32 %345) #11
  %604 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i566.us.us, i32 %345) #11
  %605 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i568.us.us, i32 %345) #11
  %606 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i570.us.us, i32 %345) #11
  %607 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %604, <32 x i32> %603)
  %608 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %606, <32 x i32> %605)
  %609 = shufflevector <64 x i32> %607, <64 x i32> %608, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %610 = and <128 x i32> %609, %344
  %611 = add nsw <128 x i32> %610, %602
  %612 = shufflevector <128 x i32> %611, <128 x i32> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %613 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %612) #11
  %614 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %612) #11
  %615 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %614, <32 x i32> %613) #11
  %616 = shufflevector <128 x i32> %611, <128 x i32> undef, <64 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %617 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %616) #11
  %618 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %616) #11
  %619 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %618, <32 x i32> %617) #11
  %620 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %619, <32 x i32> %615)
  %621 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %620, <64 x i32> %349) #11
  %622 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %621) #11
  %623 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %621) #11
  %624 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %622, <32 x i32> %623) #11
  %625 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %624, <32 x i32> %352) #11
  %626 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %625, <32 x i32> %355) #11
  %627 = shl nsw i32 %output.s0.c.co.us.us, 7
  %628 = add i32 %627, %t877.us.us
  %629 = add i32 %628, %854
  %630 = getelementptr inbounds i8, i8* %23, i32 %629
  %631 = bitcast i8* %630 to <32 x i32>*
  store <32 x i32> %626, <32 x i32>* %631, align 1, !tbaa !113
  %ab1.i571.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.93.6.us.us, <32 x i32> %342) #11
  %ab.i572.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i571.us.us, <32 x i32> %convolved394.sroa.93.6.us.us, <32 x i32> %342) #11
  %ab1.i573.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.103.6.us.us, <32 x i32> %342) #11
  %ab.i574.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i573.us.us, <32 x i32> %convolved394.sroa.103.6.us.us, <32 x i32> %342) #11
  %ab1.i575.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.113.6.us.us, <32 x i32> %342) #11
  %ab.i576.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i575.us.us, <32 x i32> %convolved394.sroa.113.6.us.us, <32 x i32> %342) #11
  %ab1.i577.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.123.6.us.us, <32 x i32> %342) #11
  %ab.i578.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i577.us.us, <32 x i32> %convolved394.sroa.123.6.us.us, <32 x i32> %342) #11
  %632 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i572.us.us, i32 %output_shift) #11
  %633 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i574.us.us, i32 %output_shift) #11
  %634 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i576.us.us, i32 %output_shift) #11
  %635 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i578.us.us, i32 %output_shift) #11
  %636 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %633, <32 x i32> %632)
  %637 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %635, <32 x i32> %634)
  %638 = shufflevector <64 x i32> %636, <64 x i32> %637, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %639 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i572.us.us, i32 %345) #11
  %640 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i574.us.us, i32 %345) #11
  %641 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i576.us.us, i32 %345) #11
  %642 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i578.us.us, i32 %345) #11
  %643 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %640, <32 x i32> %639)
  %644 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %642, <32 x i32> %641)
  %645 = shufflevector <64 x i32> %643, <64 x i32> %644, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %646 = and <128 x i32> %645, %344
  %647 = add nsw <128 x i32> %646, %638
  %648 = shufflevector <128 x i32> %647, <128 x i32> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %649 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %648) #11
  %650 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %648) #11
  %651 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %650, <32 x i32> %649) #11
  %652 = shufflevector <128 x i32> %647, <128 x i32> undef, <64 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %653 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %652) #11
  %654 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %652) #11
  %655 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %654, <32 x i32> %653) #11
  %656 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %655, <32 x i32> %651)
  %657 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %656, <64 x i32> %349) #11
  %658 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %657) #11
  %659 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %657) #11
  %660 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %658, <32 x i32> %659) #11
  %661 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %660, <32 x i32> %352) #11
  %662 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %661, <32 x i32> %355) #11
  %663 = add i32 %628, %855
  %664 = getelementptr inbounds i8, i8* %23, i32 %663
  %665 = bitcast i8* %664 to <32 x i32>*
  store <32 x i32> %662, <32 x i32>* %665, align 1, !tbaa !113
  %ab1.i579.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.133.6.us.us, <32 x i32> %342) #11
  %ab.i580.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i579.us.us, <32 x i32> %convolved394.sroa.133.6.us.us, <32 x i32> %342) #11
  %ab1.i581.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.138.6.us.us, <32 x i32> %342) #11
  %ab.i582.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i581.us.us, <32 x i32> %convolved394.sroa.138.6.us.us, <32 x i32> %342) #11
  %ab1.i583.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.143.6.us.us, <32 x i32> %342) #11
  %ab.i584.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i583.us.us, <32 x i32> %convolved394.sroa.143.6.us.us, <32 x i32> %342) #11
  %ab1.i585.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.148.6.us.us, <32 x i32> %342) #11
  %ab.i586.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i585.us.us, <32 x i32> %convolved394.sroa.148.6.us.us, <32 x i32> %342) #11
  %666 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i580.us.us, i32 %output_shift) #11
  %667 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i582.us.us, i32 %output_shift) #11
  %668 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i584.us.us, i32 %output_shift) #11
  %669 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i586.us.us, i32 %output_shift) #11
  %670 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %667, <32 x i32> %666)
  %671 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %669, <32 x i32> %668)
  %672 = shufflevector <64 x i32> %670, <64 x i32> %671, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %673 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i580.us.us, i32 %345) #11
  %674 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i582.us.us, i32 %345) #11
  %675 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i584.us.us, i32 %345) #11
  %676 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i586.us.us, i32 %345) #11
  %677 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %674, <32 x i32> %673)
  %678 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %676, <32 x i32> %675)
  %679 = shufflevector <64 x i32> %677, <64 x i32> %678, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %680 = and <128 x i32> %679, %344
  %681 = add nsw <128 x i32> %680, %672
  %682 = shufflevector <128 x i32> %681, <128 x i32> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %683 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %682) #11
  %684 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %682) #11
  %685 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %684, <32 x i32> %683) #11
  %686 = shufflevector <128 x i32> %681, <128 x i32> undef, <64 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %687 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %686) #11
  %688 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %686) #11
  %689 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %688, <32 x i32> %687) #11
  %690 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %689, <32 x i32> %685)
  %691 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %690, <64 x i32> %349) #11
  %692 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %691) #11
  %693 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %691) #11
  %694 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %692, <32 x i32> %693) #11
  %695 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %694, <32 x i32> %352) #11
  %696 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %695, <32 x i32> %355) #11
  %697 = add i32 %628, %856
  %698 = getelementptr inbounds i8, i8* %23, i32 %697
  %699 = bitcast i8* %698 to <32 x i32>*
  store <32 x i32> %696, <32 x i32>* %699, align 1, !tbaa !113
  %ab1.i587.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.153.6.us.us, <32 x i32> %342) #11
  %ab.i588.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i587.us.us, <32 x i32> %convolved394.sroa.153.6.us.us, <32 x i32> %342) #11
  %ab1.i589.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.158.6.us.us, <32 x i32> %342) #11
  %ab.i590.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i589.us.us, <32 x i32> %convolved394.sroa.158.6.us.us, <32 x i32> %342) #11
  %ab1.i591.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.163.6.us.us, <32 x i32> %342) #11
  %ab.i592.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i591.us.us, <32 x i32> %convolved394.sroa.163.6.us.us, <32 x i32> %342) #11
  %ab1.i593.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.168.6.us.us, <32 x i32> %342) #11
  %ab.i594.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i593.us.us, <32 x i32> %convolved394.sroa.168.6.us.us, <32 x i32> %342) #11
  %700 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i588.us.us, i32 %output_shift) #11
  %701 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i590.us.us, i32 %output_shift) #11
  %702 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i592.us.us, i32 %output_shift) #11
  %703 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i594.us.us, i32 %output_shift) #11
  %704 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %701, <32 x i32> %700)
  %705 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %703, <32 x i32> %702)
  %706 = shufflevector <64 x i32> %704, <64 x i32> %705, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %707 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i588.us.us, i32 %345) #11
  %708 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i590.us.us, i32 %345) #11
  %709 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i592.us.us, i32 %345) #11
  %710 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i594.us.us, i32 %345) #11
  %711 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %708, <32 x i32> %707)
  %712 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %710, <32 x i32> %709)
  %713 = shufflevector <64 x i32> %711, <64 x i32> %712, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %714 = and <128 x i32> %713, %344
  %715 = add nsw <128 x i32> %714, %706
  %716 = shufflevector <128 x i32> %715, <128 x i32> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %717 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %716) #11
  %718 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %716) #11
  %719 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %718, <32 x i32> %717) #11
  %720 = shufflevector <128 x i32> %715, <128 x i32> undef, <64 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %721 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %720) #11
  %722 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %720) #11
  %723 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %722, <32 x i32> %721) #11
  %724 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %723, <32 x i32> %719)
  %725 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %724, <64 x i32> %349) #11
  %726 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %725) #11
  %727 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %725) #11
  %728 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %726, <32 x i32> %727) #11
  %729 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %728, <32 x i32> %352) #11
  %730 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %729, <32 x i32> %355) #11
  %731 = add i32 %628, %857
  %732 = getelementptr inbounds i8, i8* %23, i32 %731
  %733 = bitcast i8* %732 to <32 x i32>*
  store <32 x i32> %730, <32 x i32>* %733, align 1, !tbaa !113
  %ab1.i595.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.173.6.us.us, <32 x i32> %342) #11
  %ab.i596.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i595.us.us, <32 x i32> %convolved394.sroa.173.6.us.us, <32 x i32> %342) #11
  %ab1.i597.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.178.6.us.us, <32 x i32> %342) #11
  %ab.i598.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i597.us.us, <32 x i32> %convolved394.sroa.178.6.us.us, <32 x i32> %342) #11
  %ab1.i599.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.183.6.us.us, <32 x i32> %342) #11
  %ab.i600.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i599.us.us, <32 x i32> %convolved394.sroa.183.6.us.us, <32 x i32> %342) #11
  %ab1.i601.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.188.6.us.us, <32 x i32> %342) #11
  %ab.i602.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i601.us.us, <32 x i32> %convolved394.sroa.188.6.us.us, <32 x i32> %342) #11
  %734 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i596.us.us, i32 %output_shift) #11
  %735 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i598.us.us, i32 %output_shift) #11
  %736 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i600.us.us, i32 %output_shift) #11
  %737 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i602.us.us, i32 %output_shift) #11
  %738 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %735, <32 x i32> %734)
  %739 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %737, <32 x i32> %736)
  %740 = shufflevector <64 x i32> %738, <64 x i32> %739, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %741 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i596.us.us, i32 %345) #11
  %742 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i598.us.us, i32 %345) #11
  %743 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i600.us.us, i32 %345) #11
  %744 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i602.us.us, i32 %345) #11
  %745 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %742, <32 x i32> %741)
  %746 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %744, <32 x i32> %743)
  %747 = shufflevector <64 x i32> %745, <64 x i32> %746, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %748 = and <128 x i32> %747, %344
  %749 = add nsw <128 x i32> %748, %740
  %750 = shufflevector <128 x i32> %749, <128 x i32> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %751 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %750) #11
  %752 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %750) #11
  %753 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %752, <32 x i32> %751) #11
  %754 = shufflevector <128 x i32> %749, <128 x i32> undef, <64 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %755 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %754) #11
  %756 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %754) #11
  %757 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %756, <32 x i32> %755) #11
  %758 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %757, <32 x i32> %753)
  %759 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %758, <64 x i32> %349) #11
  %760 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %759) #11
  %761 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %759) #11
  %762 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %760, <32 x i32> %761) #11
  %763 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %762, <32 x i32> %352) #11
  %764 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %763, <32 x i32> %355) #11
  %765 = add i32 %628, %858
  %766 = getelementptr inbounds i8, i8* %23, i32 %765
  %767 = bitcast i8* %766 to <32 x i32>*
  store <32 x i32> %764, <32 x i32>* %767, align 1, !tbaa !113
  %ab1.i603.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.193.6.us.us, <32 x i32> %342) #11
  %ab.i604.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i603.us.us, <32 x i32> %convolved394.sroa.193.6.us.us, <32 x i32> %342) #11
  %ab1.i605.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.198.6.us.us, <32 x i32> %342) #11
  %ab.i606.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i605.us.us, <32 x i32> %convolved394.sroa.198.6.us.us, <32 x i32> %342) #11
  %ab1.i607.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.203.6.us.us, <32 x i32> %342) #11
  %ab.i608.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i607.us.us, <32 x i32> %convolved394.sroa.203.6.us.us, <32 x i32> %342) #11
  %ab1.i609.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.208.6.us.us, <32 x i32> %342) #11
  %ab.i610.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i609.us.us, <32 x i32> %convolved394.sroa.208.6.us.us, <32 x i32> %342) #11
  %768 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i604.us.us, i32 %output_shift) #11
  %769 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i606.us.us, i32 %output_shift) #11
  %770 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i608.us.us, i32 %output_shift) #11
  %771 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i610.us.us, i32 %output_shift) #11
  %772 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %769, <32 x i32> %768)
  %773 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %771, <32 x i32> %770)
  %774 = shufflevector <64 x i32> %772, <64 x i32> %773, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %775 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i604.us.us, i32 %345) #11
  %776 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i606.us.us, i32 %345) #11
  %777 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i608.us.us, i32 %345) #11
  %778 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i610.us.us, i32 %345) #11
  %779 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %776, <32 x i32> %775)
  %780 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %778, <32 x i32> %777)
  %781 = shufflevector <64 x i32> %779, <64 x i32> %780, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %782 = and <128 x i32> %781, %344
  %783 = add nsw <128 x i32> %782, %774
  %784 = shufflevector <128 x i32> %783, <128 x i32> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %785 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %784) #11
  %786 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %784) #11
  %787 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %786, <32 x i32> %785) #11
  %788 = shufflevector <128 x i32> %783, <128 x i32> undef, <64 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %789 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %788) #11
  %790 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %788) #11
  %791 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %790, <32 x i32> %789) #11
  %792 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %791, <32 x i32> %787)
  %793 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %792, <64 x i32> %349) #11
  %794 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %793) #11
  %795 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %793) #11
  %796 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %794, <32 x i32> %795) #11
  %797 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %796, <32 x i32> %352) #11
  %798 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %797, <32 x i32> %355) #11
  %799 = add i32 %628, %859
  %800 = getelementptr inbounds i8, i8* %23, i32 %799
  %801 = bitcast i8* %800 to <32 x i32>*
  store <32 x i32> %798, <32 x i32>* %801, align 1, !tbaa !113
  %802 = add nuw nsw i32 %output.s0.c.co.us.us, 1
  %.not454.us.us = icmp eq i32 %802, %339
  br i1 %.not454.us.us, label %"end for output.s0.c.co.us.us", label %"for output.s0.c.co.us.us"

"end for output.s0.c.co.us.us":                   ; preds = %"consume convolved.us.us", %"consume sum_input.us.us"
  %803 = add nuw nsw i32 %output.s0.x.xo.us.us, 1
  %.not453.us.us = icmp eq i32 %803, %334
  br i1 %.not453.us.us, label %"end for output.s0.x.xo.loopexit.us.us", label %"for output.s0.x.xo.us.us"

"for convolved.s1.r19$z.r124.preheader.us.us":    ; preds = %"for convolved.s1.r19$x.us.us"
  %t919.s.us.us = add nsw i32 %515, %853
  %t924.s.us.us = add nsw i32 %515, %852
  %t925.s.us.us = add nsw i32 %515, %850
  %t926.s.us.us = add nsw i32 %515, %848
  %t927.s.us.us = add nsw i32 %515, %846
  %t928.s.us.us = add nsw i32 %515, %844
  %804 = mul nsw i32 %t919.s.us.us, %17
  %805 = add i32 %t920.us.us, %819
  %806 = add i32 %t920.us.us, %817
  %807 = add i32 %t920.us.us, %815
  %808 = mul nsw i32 %t924.s.us.us, %17
  %809 = mul nsw i32 %t925.s.us.us, %17
  %810 = mul nsw i32 %t926.s.us.us, %17
  %811 = mul nsw i32 %t927.s.us.us, %17
  %812 = mul nsw i32 %t928.s.us.us, %17
  br label %"for convolved.s1.r19$z.r124.us.us"

"for convolved.s1.r19$y.preheader.us.us":         ; preds = %after_bb18.us.us
  %813 = shl nsw i32 %output.s0.c.co.us.us, 2
  %814 = or i32 %813, 3
  %815 = mul nsw i32 %814, %8
  %816 = or i32 %813, 2
  %817 = mul nsw i32 %816, %8
  %818 = or i32 %813, 1
  %819 = mul nsw i32 %818, %8
  %820 = mul nsw i32 %output.s0.c.co.us.us, %8
  br label %"for convolved.s1.r19$y.us.us"

"for sum_input.s1.r19$x.preheader.us.us":         ; preds = %"for sum_input.s1.r19$y.us.us"
  %821 = mul nsw i32 %"sum_input.s1.r19$y.us.us", %dilation_y
  %822 = add nsw i32 %821, %370
  %823 = mul nsw i32 %822, %19
  %t880.us.us = add i32 %365, %823
  br i1 %360, label %"end for sum_input.s1.r19$x.us.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x.us.us"

"for output.s0.c.co.preheader.us.us":             ; preds = %"consume sum_input.us.us"
  %sum_input395.sroa.0.0.vec.extract709.us.us = extractelement <6 x i32> %sum_input395.sroa.0.13.us.us, i32 0
  %824 = mul nsw i32 %sum_input395.sroa.0.0.vec.extract709.us.us, %307
  %825 = insertelement <32 x i32> undef, i32 %824, i32 0
  %826 = shufflevector <32 x i32> %825, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input395.sroa.0.4.vec.extract715.us.us = extractelement <6 x i32> %sum_input395.sroa.0.13.us.us, i32 1
  %827 = mul nsw i32 %sum_input395.sroa.0.4.vec.extract715.us.us, %307
  %828 = insertelement <32 x i32> undef, i32 %827, i32 0
  %829 = shufflevector <32 x i32> %828, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input395.sroa.0.8.vec.extract721.us.us = extractelement <6 x i32> %sum_input395.sroa.0.13.us.us, i32 2
  %830 = mul nsw i32 %sum_input395.sroa.0.8.vec.extract721.us.us, %307
  %831 = insertelement <32 x i32> undef, i32 %830, i32 0
  %832 = shufflevector <32 x i32> %831, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input395.sroa.0.12.vec.extract727.us.us = extractelement <6 x i32> %sum_input395.sroa.0.13.us.us, i32 3
  %833 = mul nsw i32 %sum_input395.sroa.0.12.vec.extract727.us.us, %307
  %834 = insertelement <32 x i32> undef, i32 %833, i32 0
  %835 = shufflevector <32 x i32> %834, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input395.sroa.0.16.vec.extract733.us.us = extractelement <6 x i32> %sum_input395.sroa.0.13.us.us, i32 4
  %836 = mul nsw i32 %sum_input395.sroa.0.16.vec.extract733.us.us, %307
  %837 = insertelement <32 x i32> undef, i32 %836, i32 0
  %838 = shufflevector <32 x i32> %837, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input395.sroa.0.20.vec.extract739.us.us = extractelement <6 x i32> %sum_input395.sroa.0.13.us.us, i32 5
  %839 = mul nsw i32 %sum_input395.sroa.0.20.vec.extract739.us.us, %307
  %840 = insertelement <32 x i32> undef, i32 %839, i32 0
  %841 = shufflevector <32 x i32> %840, <32 x i32> undef, <32 x i32> zeroinitializer
  %842 = add nsw i32 %output.s0.x.x.base.s.us.us, %25
  %843 = add nsw i32 %842, 5
  %844 = mul nsw i32 %843, %stride_x
  %845 = add nsw i32 %842, 4
  %846 = mul nsw i32 %845, %stride_x
  %847 = add nsw i32 %842, 3
  %848 = mul nsw i32 %847, %stride_x
  %849 = add nsw i32 %842, 2
  %850 = mul nsw i32 %849, %stride_x
  %851 = add nsw i32 %842, 1
  %852 = mul nsw i32 %851, %stride_x
  %853 = mul nsw i32 %842, %stride_x
  %854 = mul nsw i32 %842, %27
  %855 = mul nsw i32 %851, %27
  %856 = mul nsw i32 %849, %27
  %857 = mul nsw i32 %847, %27
  %858 = mul nsw i32 %845, %27
  %859 = mul nsw i32 %843, %27
  br label %"for output.s0.c.co.us.us"

"for sum_input.s1.r19$y.preheader.us.us":         ; preds = %then_bb10.us.us
  %860 = add nsw i32 %output.s0.x.x.base.s.us.us, %25
  %861 = sub i32 %860, %16
  br label %"for sum_input.s1.r19$y.us.us"

"for sum_input.s1.r19$y12.preheader.us.us":       ; preds = %next_bb11.us.us
  %862 = add nsw i32 %output.s0.x.x.base.s.us.us, %25
  %863 = mul nsw i32 %862, %stride_x
  br i1 %brmerge1435.demorgan, label %"for sum_input.s1.r19$y12.us.us.us.us", label %"consume sum_input.us.us", !prof !103

"end for output.s0.x.xo.loopexit.us.us":          ; preds = %"end for output.s0.c.co.us.us"
  %864 = add nuw nsw i32 %output.s0.y.rebased.us.us, 1
  %.not452.us.us = icmp eq i32 %864, %29
  br i1 %.not452.us.us, label %"end for output.s0.y.rebased.loopexit.us", label %"for output.s0.y.rebased.us.us"

"for sum_input.s1.r19$y12.us.us.us.us":           ; preds = %"for sum_input.s1.r19$y12.preheader.us.us", %"end for sum_input.s1.r19$x16.loopexit.split.us.us.us.us.us"
  %sum_input395.sroa.0.8.us.us.us.us = phi <6 x i32> [ %.lcssa, %"end for sum_input.s1.r19$x16.loopexit.split.us.us.us.us.us" ], [ zeroinitializer, %"for sum_input.s1.r19$y12.preheader.us.us" ]
  %"sum_input.s1.r19$y14.us.us.us.us" = phi i32 [ %1058, %"end for sum_input.s1.r19$x16.loopexit.split.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y12.preheader.us.us" ]
  %865 = mul nsw i32 %"sum_input.s1.r19$y14.us.us.us.us", %dilation_y
  %t882.s.us.us.us.us = add nsw i32 %865, %370
  %866 = mul nsw i32 %t882.s.us.us.us.us, %19
  br label %"for sum_input.s1.r19$x15.us.us.us.us.us"

"for sum_input.s1.r19$x15.us.us.us.us.us":        ; preds = %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us", %"for sum_input.s1.r19$y12.us.us.us.us"
  %sum_input395.sroa.0.9.us.us.us.us.us = phi <6 x i32> [ %.lcssa, %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us" ], [ %sum_input395.sroa.0.8.us.us.us.us, %"for sum_input.s1.r19$y12.us.us.us.us" ]
  %"sum_input.s1.r19$x17.us.us.us.us.us" = phi i32 [ %1057, %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y12.us.us.us.us" ]
  %867 = mul nsw i32 %"sum_input.s1.r19$x17.us.us.us.us.us", %dilation_x
  %t883.s.us.us.us.us.us = add nsw i32 %867, %863
  %868 = mul nsw i32 %t883.s.us.us.us.us.us, %17
  %869 = add i32 %868, %866
  %t884.us.us.us.us.us = sub i32 %869, %t852
  %870 = add i32 %t884.us.us.us.us.us, %364
  %t860.us.us.us.us.us = add i32 %869, %325
  %871 = sub i32 %t860.us.us.us.us.us, %314
  %t885.us.us.us.us.us = sub i32 %871, %315
  %872 = add i32 %t885.us.us.us.us.us, %364
  %873 = add i32 %869, %323
  %874 = sub i32 %873, %356
  %t886.us.us.us.us.us = sub i32 %874, %315
  %875 = add i32 %t886.us.us.us.us.us, %364
  %876 = add i32 %869, %322
  %877 = sub i32 %876, %356
  %t887.us.us.us.us.us = sub i32 %877, %315
  %878 = add i32 %t887.us.us.us.us.us, %364
  %879 = add i32 %869, %321
  %880 = sub i32 %879, %356
  %t888.us.us.us.us.us = sub i32 %880, %315
  %881 = add i32 %t888.us.us.us.us.us, %364
  %882 = add i32 %869, %320
  %883 = sub i32 %882, %356
  %t889.us.us.us.us.us = sub i32 %883, %315
  %884 = add i32 %t889.us.us.us.us.us, %364
  br i1 %359, label %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r124.us.us.us.us.us"

"for sum_input.s1.r19$z.r124.us.us.us.us.us":     ; preds = %"for sum_input.s1.r19$x15.us.us.us.us.us", %"for sum_input.s1.r19$z.r124.us.us.us.us.us"
  %sum_input395.sroa.0.11.us.us.us.us.us = phi <6 x i32> [ %1020, %"for sum_input.s1.r19$z.r124.us.us.us.us.us" ], [ %sum_input395.sroa.0.9.us.us.us.us.us, %"for sum_input.s1.r19$x15.us.us.us.us.us" ]
  %"sum_input.s1.r19$z.r124.us.us.us.us.us" = phi i32 [ %1021, %"for sum_input.s1.r19$z.r124.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$x15.us.us.us.us.us" ]
  %niter1681 = phi i32 [ %niter1681.nsub.3, %"for sum_input.s1.r19$z.r124.us.us.us.us.us" ], [ %unroll_iter1680, %"for sum_input.s1.r19$x15.us.us.us.us.us" ]
  %885 = shl nsw i32 %"sum_input.s1.r19$z.r124.us.us.us.us.us", 2
  %886 = add i32 %870, %885
  %887 = getelementptr inbounds i8, i8* %13, i32 %886
  %888 = bitcast i8* %887 to <4 x i8>*
  %889 = load <4 x i8>, <4 x i8>* %888, align 4, !tbaa !110
  %890 = add i32 %872, %885
  %891 = getelementptr inbounds i8, i8* %13, i32 %890
  %892 = bitcast i8* %891 to <4 x i8>*
  %893 = load <4 x i8>, <4 x i8>* %892, align 4, !tbaa !110
  %894 = add i32 %875, %885
  %895 = getelementptr inbounds i8, i8* %13, i32 %894
  %896 = bitcast i8* %895 to <4 x i8>*
  %897 = load <4 x i8>, <4 x i8>* %896, align 4, !tbaa !110
  %898 = add i32 %878, %885
  %899 = getelementptr inbounds i8, i8* %13, i32 %898
  %900 = bitcast i8* %899 to <4 x i8>*
  %901 = load <4 x i8>, <4 x i8>* %900, align 4, !tbaa !110
  %902 = add i32 %881, %885
  %903 = getelementptr inbounds i8, i8* %13, i32 %902
  %904 = bitcast i8* %903 to <4 x i8>*
  %905 = load <4 x i8>, <4 x i8>* %904, align 4, !tbaa !110
  %906 = add i32 %884, %885
  %907 = getelementptr inbounds i8, i8* %13, i32 %906
  %908 = bitcast i8* %907 to <4 x i8>*
  %909 = load <4 x i8>, <4 x i8>* %908, align 4, !tbaa !110
  %910 = shufflevector <4 x i8> %889, <4 x i8> %893, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %911 = shufflevector <4 x i8> %897, <4 x i8> %901, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %912 = shufflevector <8 x i8> %910, <8 x i8> %911, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %913 = shufflevector <4 x i8> %905, <4 x i8> %909, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %914 = shufflevector <6 x i32> %sum_input395.sroa.0.11.us.us.us.us.us, <6 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %915 = shufflevector <16 x i8> %912, <16 x i8> %913, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %916 = bitcast <128 x i8> %915 to <32 x i32>
  %917 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %914, <32 x i32> %916, i32 16843009) #11
  %918 = shl i32 %"sum_input.s1.r19$z.r124.us.us.us.us.us", 2
  %919 = or i32 %918, 4
  %920 = add i32 %870, %919
  %921 = getelementptr inbounds i8, i8* %13, i32 %920
  %922 = bitcast i8* %921 to <4 x i8>*
  %923 = load <4 x i8>, <4 x i8>* %922, align 4, !tbaa !110
  %924 = add i32 %872, %919
  %925 = getelementptr inbounds i8, i8* %13, i32 %924
  %926 = bitcast i8* %925 to <4 x i8>*
  %927 = load <4 x i8>, <4 x i8>* %926, align 4, !tbaa !110
  %928 = add i32 %875, %919
  %929 = getelementptr inbounds i8, i8* %13, i32 %928
  %930 = bitcast i8* %929 to <4 x i8>*
  %931 = load <4 x i8>, <4 x i8>* %930, align 4, !tbaa !110
  %932 = add i32 %878, %919
  %933 = getelementptr inbounds i8, i8* %13, i32 %932
  %934 = bitcast i8* %933 to <4 x i8>*
  %935 = load <4 x i8>, <4 x i8>* %934, align 4, !tbaa !110
  %936 = add i32 %881, %919
  %937 = getelementptr inbounds i8, i8* %13, i32 %936
  %938 = bitcast i8* %937 to <4 x i8>*
  %939 = load <4 x i8>, <4 x i8>* %938, align 4, !tbaa !110
  %940 = add i32 %884, %919
  %941 = getelementptr inbounds i8, i8* %13, i32 %940
  %942 = bitcast i8* %941 to <4 x i8>*
  %943 = load <4 x i8>, <4 x i8>* %942, align 4, !tbaa !110
  %944 = shufflevector <4 x i8> %923, <4 x i8> %927, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %945 = shufflevector <4 x i8> %931, <4 x i8> %935, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %946 = shufflevector <8 x i8> %944, <8 x i8> %945, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %947 = shufflevector <4 x i8> %939, <4 x i8> %943, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %948 = shufflevector <32 x i32> %917, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %949 = shufflevector <16 x i8> %946, <16 x i8> %947, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %950 = bitcast <128 x i8> %949 to <32 x i32>
  %951 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %948, <32 x i32> %950, i32 16843009) #11
  %952 = shl i32 %"sum_input.s1.r19$z.r124.us.us.us.us.us", 2
  %953 = or i32 %952, 8
  %954 = add i32 %870, %953
  %955 = getelementptr inbounds i8, i8* %13, i32 %954
  %956 = bitcast i8* %955 to <4 x i8>*
  %957 = load <4 x i8>, <4 x i8>* %956, align 4, !tbaa !110
  %958 = add i32 %872, %953
  %959 = getelementptr inbounds i8, i8* %13, i32 %958
  %960 = bitcast i8* %959 to <4 x i8>*
  %961 = load <4 x i8>, <4 x i8>* %960, align 4, !tbaa !110
  %962 = add i32 %875, %953
  %963 = getelementptr inbounds i8, i8* %13, i32 %962
  %964 = bitcast i8* %963 to <4 x i8>*
  %965 = load <4 x i8>, <4 x i8>* %964, align 4, !tbaa !110
  %966 = add i32 %878, %953
  %967 = getelementptr inbounds i8, i8* %13, i32 %966
  %968 = bitcast i8* %967 to <4 x i8>*
  %969 = load <4 x i8>, <4 x i8>* %968, align 4, !tbaa !110
  %970 = add i32 %881, %953
  %971 = getelementptr inbounds i8, i8* %13, i32 %970
  %972 = bitcast i8* %971 to <4 x i8>*
  %973 = load <4 x i8>, <4 x i8>* %972, align 4, !tbaa !110
  %974 = add i32 %884, %953
  %975 = getelementptr inbounds i8, i8* %13, i32 %974
  %976 = bitcast i8* %975 to <4 x i8>*
  %977 = load <4 x i8>, <4 x i8>* %976, align 4, !tbaa !110
  %978 = shufflevector <4 x i8> %957, <4 x i8> %961, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %979 = shufflevector <4 x i8> %965, <4 x i8> %969, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %980 = shufflevector <8 x i8> %978, <8 x i8> %979, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %981 = shufflevector <4 x i8> %973, <4 x i8> %977, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %982 = shufflevector <32 x i32> %951, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %983 = shufflevector <16 x i8> %980, <16 x i8> %981, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %984 = bitcast <128 x i8> %983 to <32 x i32>
  %985 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %982, <32 x i32> %984, i32 16843009) #11
  %986 = shl i32 %"sum_input.s1.r19$z.r124.us.us.us.us.us", 2
  %987 = or i32 %986, 12
  %988 = add i32 %870, %987
  %989 = getelementptr inbounds i8, i8* %13, i32 %988
  %990 = bitcast i8* %989 to <4 x i8>*
  %991 = load <4 x i8>, <4 x i8>* %990, align 4, !tbaa !110
  %992 = add i32 %872, %987
  %993 = getelementptr inbounds i8, i8* %13, i32 %992
  %994 = bitcast i8* %993 to <4 x i8>*
  %995 = load <4 x i8>, <4 x i8>* %994, align 4, !tbaa !110
  %996 = add i32 %875, %987
  %997 = getelementptr inbounds i8, i8* %13, i32 %996
  %998 = bitcast i8* %997 to <4 x i8>*
  %999 = load <4 x i8>, <4 x i8>* %998, align 4, !tbaa !110
  %1000 = add i32 %878, %987
  %1001 = getelementptr inbounds i8, i8* %13, i32 %1000
  %1002 = bitcast i8* %1001 to <4 x i8>*
  %1003 = load <4 x i8>, <4 x i8>* %1002, align 4, !tbaa !110
  %1004 = add i32 %881, %987
  %1005 = getelementptr inbounds i8, i8* %13, i32 %1004
  %1006 = bitcast i8* %1005 to <4 x i8>*
  %1007 = load <4 x i8>, <4 x i8>* %1006, align 4, !tbaa !110
  %1008 = add i32 %884, %987
  %1009 = getelementptr inbounds i8, i8* %13, i32 %1008
  %1010 = bitcast i8* %1009 to <4 x i8>*
  %1011 = load <4 x i8>, <4 x i8>* %1010, align 4, !tbaa !110
  %1012 = shufflevector <4 x i8> %991, <4 x i8> %995, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1013 = shufflevector <4 x i8> %999, <4 x i8> %1003, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1014 = shufflevector <8 x i8> %1012, <8 x i8> %1013, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1015 = shufflevector <4 x i8> %1007, <4 x i8> %1011, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1016 = shufflevector <32 x i32> %985, <32 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1017 = shufflevector <16 x i8> %1014, <16 x i8> %1015, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1018 = bitcast <128 x i8> %1017 to <32 x i32>
  %1019 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1016, <32 x i32> %1018, i32 16843009) #11
  %1020 = shufflevector <32 x i32> %1019, <32 x i32> undef, <6 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
  %1021 = add nuw nsw i32 %"sum_input.s1.r19$z.r124.us.us.us.us.us", 4
  %niter1681.nsub.3 = add i32 %niter1681, -4
  %niter1681.ncmp.3 = icmp eq i32 %niter1681.nsub.3, 0
  br i1 %niter1681.ncmp.3, label %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r124.us.us.us.us.us"

"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa": ; preds = %"for sum_input.s1.r19$z.r124.us.us.us.us.us", %"for sum_input.s1.r19$x15.us.us.us.us.us"
  %.lcssa.ph = phi <6 x i32> [ undef, %"for sum_input.s1.r19$x15.us.us.us.us.us" ], [ %1020, %"for sum_input.s1.r19$z.r124.us.us.us.us.us" ]
  %sum_input395.sroa.0.11.us.us.us.us.us.unr = phi <6 x i32> [ %sum_input395.sroa.0.9.us.us.us.us.us, %"for sum_input.s1.r19$x15.us.us.us.us.us" ], [ %1020, %"for sum_input.s1.r19$z.r124.us.us.us.us.us" ]
  %"sum_input.s1.r19$z.r124.us.us.us.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x15.us.us.us.us.us" ], [ %1021, %"for sum_input.s1.r19$z.r124.us.us.us.us.us" ]
  br i1 %lcmp.mod1678.not, label %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us", label %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil"

"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil": ; preds = %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa", %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil"
  %sum_input395.sroa.0.11.us.us.us.us.us.epil = phi <6 x i32> [ %1055, %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil" ], [ %sum_input395.sroa.0.11.us.us.us.us.us.unr, %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa" ]
  %"sum_input.s1.r19$z.r124.us.us.us.us.us.epil" = phi i32 [ %1056, %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil" ], [ %"sum_input.s1.r19$z.r124.us.us.us.us.us.unr", %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa" ]
  %epil.iter1677 = phi i32 [ %epil.iter1677.sub, %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil" ], [ %xtraiter1676, %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa" ]
  %1022 = shl nsw i32 %"sum_input.s1.r19$z.r124.us.us.us.us.us.epil", 2
  %1023 = add i32 %870, %1022
  %1024 = getelementptr inbounds i8, i8* %13, i32 %1023
  %1025 = bitcast i8* %1024 to <4 x i8>*
  %1026 = load <4 x i8>, <4 x i8>* %1025, align 4, !tbaa !110
  %1027 = add i32 %872, %1022
  %1028 = getelementptr inbounds i8, i8* %13, i32 %1027
  %1029 = bitcast i8* %1028 to <4 x i8>*
  %1030 = load <4 x i8>, <4 x i8>* %1029, align 4, !tbaa !110
  %1031 = add i32 %875, %1022
  %1032 = getelementptr inbounds i8, i8* %13, i32 %1031
  %1033 = bitcast i8* %1032 to <4 x i8>*
  %1034 = load <4 x i8>, <4 x i8>* %1033, align 4, !tbaa !110
  %1035 = add i32 %878, %1022
  %1036 = getelementptr inbounds i8, i8* %13, i32 %1035
  %1037 = bitcast i8* %1036 to <4 x i8>*
  %1038 = load <4 x i8>, <4 x i8>* %1037, align 4, !tbaa !110
  %1039 = add i32 %881, %1022
  %1040 = getelementptr inbounds i8, i8* %13, i32 %1039
  %1041 = bitcast i8* %1040 to <4 x i8>*
  %1042 = load <4 x i8>, <4 x i8>* %1041, align 4, !tbaa !110
  %1043 = add i32 %884, %1022
  %1044 = getelementptr inbounds i8, i8* %13, i32 %1043
  %1045 = bitcast i8* %1044 to <4 x i8>*
  %1046 = load <4 x i8>, <4 x i8>* %1045, align 4, !tbaa !110
  %1047 = shufflevector <4 x i8> %1026, <4 x i8> %1030, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1048 = shufflevector <4 x i8> %1034, <4 x i8> %1038, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1049 = shufflevector <8 x i8> %1047, <8 x i8> %1048, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1050 = shufflevector <4 x i8> %1042, <4 x i8> %1046, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1051 = shufflevector <6 x i32> %sum_input395.sroa.0.11.us.us.us.us.us.epil, <6 x i32> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1052 = shufflevector <16 x i8> %1049, <16 x i8> %1050, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1053 = bitcast <128 x i8> %1052 to <32 x i32>
  %1054 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1051, <32 x i32> %1053, i32 16843009) #11
  %1055 = shufflevector <32 x i32> %1054, <32 x i32> undef, <6 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
  %1056 = add nuw nsw i32 %"sum_input.s1.r19$z.r124.us.us.us.us.us.epil", 1
  %epil.iter1677.sub = add i32 %epil.iter1677, -1
  %epil.iter1677.cmp.not = icmp eq i32 %epil.iter1677.sub, 0
  br i1 %epil.iter1677.cmp.not, label %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us", label %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil", !llvm.loop !115

"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us": ; preds = %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil", %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa"
  %.lcssa = phi <6 x i32> [ %.lcssa.ph, %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us.unr-lcssa" ], [ %1055, %"for sum_input.s1.r19$z.r124.us.us.us.us.us.epil" ]
  %1057 = add nuw nsw i32 %"sum_input.s1.r19$x17.us.us.us.us.us", 1
  %.not459.us.us.us.us.us = icmp eq i32 %1057, %9
  br i1 %.not459.us.us.us.us.us, label %"end for sum_input.s1.r19$x16.loopexit.split.us.us.us.us.us", label %"for sum_input.s1.r19$x15.us.us.us.us.us"

"end for sum_input.s1.r19$x16.loopexit.split.us.us.us.us.us": ; preds = %"end for sum_input.s1.r19$z.r124.loopexit.us.us.us.us.us"
  %1058 = add nuw nsw i32 %"sum_input.s1.r19$y14.us.us.us.us", 1
  %.not458.us.us.us.us = icmp eq i32 %1058, %11
  br i1 %.not458.us.us.us.us, label %"consume sum_input.us.us", label %"for sum_input.s1.r19$y12.us.us.us.us"

next_bb5:                                         ; preds = %"consume offset_c"
  br i1 %92, label %then_bb37, label %next_bb38

then_bb37:                                        ; preds = %next_bb5
  %1059 = mul nsw i32 %19, %18
  %1060 = mul nsw i32 %22, %20
  %1061 = mul nsw i32 %17, %16
  %1062 = add i32 %1060, %1059
  %t941 = add i32 %1062, %1061
  %1063 = icmp sgt i32 %21, 0
  br i1 %1063, label %"for output.s0.b.rebased39.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased39.preheader":            ; preds = %then_bb37
  %1064 = mul nsw i32 %17, %stride_x
  %1065 = mul nsw i32 %1064, 7
  %1066 = mul nsw i32 %1064, 6
  %1067 = mul nsw i32 %1064, 5
  %1068 = shl nsw i32 %1064, 2
  %1069 = mul nsw i32 %1064, 3
  %1070 = shl nsw i32 %1064, 1
  %1071 = sub nsw i32 %stride_x, %16
  %1072 = mul nsw i32 %1071, %17
  %1073 = icmp sgt i32 %29, 0
  %.neg910 = mul i32 %30, %28
  %.neg911 = mul i32 %27, %25
  %.neg912 = mul i32 %31, %20
  %reass.add914 = add i32 %.neg910, %.neg911
  %reass.add915 = add i32 %reass.add914, %.neg912
  %1074 = add nuw nsw i32 %26, 7
  %1075 = ashr i32 %1074, 3
  %b15 = add nsw i32 %26, -8
  %1076 = icmp sgt i32 %11, 0
  %1077 = icmp sgt i32 %9, 0
  %1078 = icmp sgt i32 %7, 0
  %1079 = ashr i32 %4, 6
  %1080 = icmp sgt i32 %4, 63
  %1081 = insertelement <64 x i32> undef, i32 %output_multiplier, i32 0
  %1082 = shufflevector <64 x i32> %1081, <64 x i32> undef, <64 x i32> zeroinitializer
  %1083 = icmp sgt i32 %output_shift, 0
  %1084 = select i1 %1083, <64 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <64 x i32> zeroinitializer
  %1085 = add nsw i32 %output_shift, -1
  %1086 = zext i8 %output_zero to i16
  %1087 = insertelement <64 x i16> undef, i16 %1086, i32 0
  %1088 = shufflevector <64 x i16> %1087, <64 x i16> undef, <64 x i32> zeroinitializer
  %1089 = bitcast <64 x i16> %1088 to <32 x i32>
  %1090 = insertelement <64 x i8> undef, i8 %output_max, i32 0
  %1091 = shufflevector <64 x i8> %1090, <64 x i8> undef, <128 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1092 = bitcast <128 x i8> %1091 to <32 x i32>
  %1093 = insertelement <64 x i8> undef, i8 %output_min, i32 0
  %1094 = shufflevector <64 x i8> %1093, <64 x i8> undef, <128 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1095 = bitcast <128 x i8> %1094 to <32 x i32>
  br i1 %1073, label %"for output.s0.b.rebased39.us.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased39.us.preheader":         ; preds = %"for output.s0.b.rebased39.preheader"
  %1096 = add i32 %1061, %1059
  %1097 = add i32 %9, -1
  %brmerge1438.demorgan = and i1 %1077, %1078
  %xtraiter1666 = and i32 %7, 1
  %1098 = icmp eq i32 %7, 1
  %unroll_iter1668 = and i32 %7, -2
  %lcmp.mod1667.not = icmp eq i32 %xtraiter1666, 0
  %xtraiter1670 = and i32 %9, 7
  %1099 = icmp ult i32 %1097, 7
  %unroll_iter1674 = and i32 %9, -8
  %lcmp.mod1672.not = icmp eq i32 %xtraiter1670, 0
  br label %"for output.s0.b.rebased39.us"

"for output.s0.b.rebased39.us":                   ; preds = %"for output.s0.b.rebased39.us.preheader", %"end for output.s0.y.rebased43.loopexit.us"
  %convolved394.sroa.0.7.us = phi <32 x i32> [ %.us-phi1226.us, %"end for output.s0.y.rebased43.loopexit.us" ], [ undef, %"for output.s0.b.rebased39.us.preheader" ]
  %output.s0.b.rebased41.us = phi i32 [ %1106, %"end for output.s0.y.rebased43.loopexit.us" ], [ 0, %"for output.s0.b.rebased39.us.preheader" ]
  %1100 = add nsw i32 %output.s0.b.rebased41.us, %20
  %1101 = mul nsw i32 %1100, %31
  %1102 = sub i32 %1101, %reass.add915
  %1103 = mul nsw i32 %1100, %22
  %1104 = sub i32 %1103, %1062
  %1105 = sub nsw i32 %1103, %t941
  br i1 %98, label %"for output.s0.y.rebased42.us.us", label %"end for output.s0.y.rebased43.loopexit.us", !prof !96

"end for output.s0.y.rebased43.loopexit.us":      ; preds = %"end for output.s0.x.xo46.loopexit.us.us", %"for output.s0.b.rebased39.us"
  %.us-phi1226.us = phi <32 x i32> [ %convolved394.sroa.0.7.us, %"for output.s0.b.rebased39.us" ], [ %convolved394.sroa.0.20.us.us, %"end for output.s0.x.xo46.loopexit.us.us" ]
  %1106 = add nuw nsw i32 %output.s0.b.rebased41.us, 1
  %.not439.us = icmp eq i32 %1106, %21
  br i1 %.not439.us, label %after_bb3, label %"for output.s0.b.rebased39.us"

"for output.s0.y.rebased42.us.us":                ; preds = %"for output.s0.b.rebased39.us", %"end for output.s0.x.xo46.loopexit.us.us"
  %convolved394.sroa.0.8.us.us = phi <32 x i32> [ %convolved394.sroa.0.20.us.us, %"end for output.s0.x.xo46.loopexit.us.us" ], [ %convolved394.sroa.0.7.us, %"for output.s0.b.rebased39.us" ]
  %output.s0.y.rebased44.us.us = phi i32 [ %1477, %"end for output.s0.x.xo46.loopexit.us.us" ], [ 0, %"for output.s0.b.rebased39.us" ]
  %1107 = add nsw i32 %output.s0.y.rebased44.us.us, %28
  %1108 = mul nsw i32 %1107, %30
  %t970.us.us = add i32 %1102, %1108
  %1109 = mul nsw i32 %1107, %stride_y
  br label %"for output.s0.x.xo45.us.us"

"for output.s0.x.xo45.us.us":                     ; preds = %"end for output.s0.c.co74.us.us", %"for output.s0.y.rebased42.us.us"
  %convolved394.sroa.0.10.us.us = phi <32 x i32> [ %convolved394.sroa.0.20.us.us, %"end for output.s0.c.co74.us.us" ], [ %convolved394.sroa.0.8.us.us, %"for output.s0.y.rebased42.us.us" ]
  %output.s0.x.xo47.us.us = phi i32 [ %1415, %"end for output.s0.c.co74.us.us" ], [ 0, %"for output.s0.y.rebased42.us.us" ]
  %a13.us.us = shl nsw i32 %output.s0.x.xo47.us.us, 3
  %1110 = icmp slt i32 %a13.us.us, %b15
  %output.s0.x.x.base.s48.us.us = select i1 %1110, i32 %a13.us.us, i32 %b15
  br i1 %t843.not, label %"consume sum_input72.us.us", label %then_bb52.us.us

then_bb52.us.us:                                  ; preds = %"for output.s0.x.xo45.us.us"
  %convolved394.sroa.0.0.vecblend.us.us = shufflevector <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, <32 x i32> %convolved394.sroa.0.10.us.us, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  br i1 %t844, label %then_bb55.us.us, label %next_bb56.us.us

next_bb56.us.us:                                  ; preds = %then_bb52.us.us
  br i1 %1076, label %"for sum_input.s1.r19$y63.preheader.us.us", label %"consume sum_input72.us.us", !prof !96

then_bb55.us.us:                                  ; preds = %then_bb52.us.us
  br i1 %1076, label %"for sum_input.s1.r19$y57.preheader.us.us", label %"consume sum_input72.us.us", !prof !96

"for sum_input.s1.r19$y57.us.us":                 ; preds = %"for sum_input.s1.r19$y57.preheader.us.us", %"end for sum_input.s1.r19$x61.us.us"
  %convolved394.sroa.0.12.us.us = phi <32 x i32> [ %convolved394.sroa.0.14.us.us, %"end for sum_input.s1.r19$x61.us.us" ], [ %convolved394.sroa.0.0.vecblend.us.us, %"for sum_input.s1.r19$y57.preheader.us.us" ]
  %"sum_input.s1.r19$y59.us.us" = phi i32 [ %1201, %"end for sum_input.s1.r19$x61.us.us" ], [ 0, %"for sum_input.s1.r19$y57.preheader.us.us" ]
  br i1 %1077, label %"for sum_input.s1.r19$x60.preheader.us.us", label %"end for sum_input.s1.r19$x61.us.us", !prof !96

"for sum_input.s1.r19$x60.us.us":                 ; preds = %"for sum_input.s1.r19$x60.preheader.us.us", %"for sum_input.s1.r19$x60.us.us"
  %convolved394.sroa.0.13.us.us = phi <32 x i32> [ %convolved394.sroa.0.0.vecblend754.us.us.7, %"for sum_input.s1.r19$x60.us.us" ], [ %convolved394.sroa.0.12.us.us, %"for sum_input.s1.r19$x60.preheader.us.us" ]
  %"sum_input.s1.r19$x62.us.us" = phi i32 [ %1190, %"for sum_input.s1.r19$x60.us.us" ], [ 0, %"for sum_input.s1.r19$x60.preheader.us.us" ]
  %niter1675 = phi i32 [ %niter1675.nsub.7, %"for sum_input.s1.r19$x60.us.us" ], [ %unroll_iter1674, %"for sum_input.s1.r19$x60.preheader.us.us" ]
  %1111 = mul nsw i32 %"sum_input.s1.r19$x62.us.us", %dilation_x
  %reass.add920.us.us = add i32 %1474, %1111
  %reass.mul921.us.us = shl i32 %reass.add920.us.us, 2
  %1112 = add i32 %t973.us.us, %reass.mul921.us.us
  %1113 = getelementptr inbounds i8, i8* %13, i32 %1112
  %1114 = bitcast i8* %1113 to <32 x i8>*
  %1115 = load <32 x i8>, <32 x i8>* %1114, align 4, !tbaa !110
  %1116 = shufflevector <32 x i32> %convolved394.sroa.0.13.us.us, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1117 = shufflevector <32 x i8> %1115, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1118 = bitcast <128 x i8> %1117 to <32 x i32>
  %1119 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1116, <32 x i32> %1118, i32 16843009) #11
  %1120 = or i32 %"sum_input.s1.r19$x62.us.us", 1
  %1121 = mul nsw i32 %1120, %dilation_x
  %reass.add920.us.us.1 = add i32 %1474, %1121
  %reass.mul921.us.us.1 = shl i32 %reass.add920.us.us.1, 2
  %1122 = add i32 %t973.us.us, %reass.mul921.us.us.1
  %1123 = getelementptr inbounds i8, i8* %13, i32 %1122
  %1124 = bitcast i8* %1123 to <32 x i8>*
  %1125 = load <32 x i8>, <32 x i8>* %1124, align 4, !tbaa !110
  %1126 = shufflevector <32 x i32> %1119, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1127 = shufflevector <32 x i8> %1125, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1128 = bitcast <128 x i8> %1127 to <32 x i32>
  %1129 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1126, <32 x i32> %1128, i32 16843009) #11
  %1130 = or i32 %"sum_input.s1.r19$x62.us.us", 2
  %1131 = mul nsw i32 %1130, %dilation_x
  %reass.add920.us.us.2 = add i32 %1474, %1131
  %reass.mul921.us.us.2 = shl i32 %reass.add920.us.us.2, 2
  %1132 = add i32 %t973.us.us, %reass.mul921.us.us.2
  %1133 = getelementptr inbounds i8, i8* %13, i32 %1132
  %1134 = bitcast i8* %1133 to <32 x i8>*
  %1135 = load <32 x i8>, <32 x i8>* %1134, align 4, !tbaa !110
  %1136 = shufflevector <32 x i32> %1129, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1137 = shufflevector <32 x i8> %1135, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1138 = bitcast <128 x i8> %1137 to <32 x i32>
  %1139 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1136, <32 x i32> %1138, i32 16843009) #11
  %1140 = or i32 %"sum_input.s1.r19$x62.us.us", 3
  %1141 = mul nsw i32 %1140, %dilation_x
  %reass.add920.us.us.3 = add i32 %1474, %1141
  %reass.mul921.us.us.3 = shl i32 %reass.add920.us.us.3, 2
  %1142 = add i32 %t973.us.us, %reass.mul921.us.us.3
  %1143 = getelementptr inbounds i8, i8* %13, i32 %1142
  %1144 = bitcast i8* %1143 to <32 x i8>*
  %1145 = load <32 x i8>, <32 x i8>* %1144, align 4, !tbaa !110
  %1146 = shufflevector <32 x i32> %1139, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1147 = shufflevector <32 x i8> %1145, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1148 = bitcast <128 x i8> %1147 to <32 x i32>
  %1149 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1146, <32 x i32> %1148, i32 16843009) #11
  %1150 = or i32 %"sum_input.s1.r19$x62.us.us", 4
  %1151 = mul nsw i32 %1150, %dilation_x
  %reass.add920.us.us.4 = add i32 %1474, %1151
  %reass.mul921.us.us.4 = shl i32 %reass.add920.us.us.4, 2
  %1152 = add i32 %t973.us.us, %reass.mul921.us.us.4
  %1153 = getelementptr inbounds i8, i8* %13, i32 %1152
  %1154 = bitcast i8* %1153 to <32 x i8>*
  %1155 = load <32 x i8>, <32 x i8>* %1154, align 4, !tbaa !110
  %1156 = shufflevector <32 x i32> %1149, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1157 = shufflevector <32 x i8> %1155, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1158 = bitcast <128 x i8> %1157 to <32 x i32>
  %1159 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1156, <32 x i32> %1158, i32 16843009) #11
  %1160 = or i32 %"sum_input.s1.r19$x62.us.us", 5
  %1161 = mul nsw i32 %1160, %dilation_x
  %reass.add920.us.us.5 = add i32 %1474, %1161
  %reass.mul921.us.us.5 = shl i32 %reass.add920.us.us.5, 2
  %1162 = add i32 %t973.us.us, %reass.mul921.us.us.5
  %1163 = getelementptr inbounds i8, i8* %13, i32 %1162
  %1164 = bitcast i8* %1163 to <32 x i8>*
  %1165 = load <32 x i8>, <32 x i8>* %1164, align 4, !tbaa !110
  %1166 = shufflevector <32 x i32> %1159, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1167 = shufflevector <32 x i8> %1165, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1168 = bitcast <128 x i8> %1167 to <32 x i32>
  %1169 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1166, <32 x i32> %1168, i32 16843009) #11
  %1170 = or i32 %"sum_input.s1.r19$x62.us.us", 6
  %1171 = mul nsw i32 %1170, %dilation_x
  %reass.add920.us.us.6 = add i32 %1474, %1171
  %reass.mul921.us.us.6 = shl i32 %reass.add920.us.us.6, 2
  %1172 = add i32 %t973.us.us, %reass.mul921.us.us.6
  %1173 = getelementptr inbounds i8, i8* %13, i32 %1172
  %1174 = bitcast i8* %1173 to <32 x i8>*
  %1175 = load <32 x i8>, <32 x i8>* %1174, align 4, !tbaa !110
  %1176 = shufflevector <32 x i32> %1169, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1177 = shufflevector <32 x i8> %1175, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1178 = bitcast <128 x i8> %1177 to <32 x i32>
  %1179 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1176, <32 x i32> %1178, i32 16843009) #11
  %1180 = or i32 %"sum_input.s1.r19$x62.us.us", 7
  %1181 = mul nsw i32 %1180, %dilation_x
  %reass.add920.us.us.7 = add i32 %1474, %1181
  %reass.mul921.us.us.7 = shl i32 %reass.add920.us.us.7, 2
  %1182 = add i32 %t973.us.us, %reass.mul921.us.us.7
  %1183 = getelementptr inbounds i8, i8* %13, i32 %1182
  %1184 = bitcast i8* %1183 to <32 x i8>*
  %1185 = load <32 x i8>, <32 x i8>* %1184, align 4, !tbaa !110
  %1186 = shufflevector <32 x i32> %1179, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1187 = shufflevector <32 x i8> %1185, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1188 = bitcast <128 x i8> %1187 to <32 x i32>
  %1189 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1186, <32 x i32> %1188, i32 16843009) #11
  %convolved394.sroa.0.0.vecblend754.us.us.7 = shufflevector <32 x i32> %1189, <32 x i32> %convolved394.sroa.0.13.us.us, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1190 = add nuw nsw i32 %"sum_input.s1.r19$x62.us.us", 8
  %niter1675.nsub.7 = add i32 %niter1675, -8
  %niter1675.ncmp.7 = icmp eq i32 %niter1675.nsub.7, 0
  br i1 %niter1675.ncmp.7, label %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x60.us.us"

"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa": ; preds = %"for sum_input.s1.r19$x60.us.us", %"for sum_input.s1.r19$x60.preheader.us.us"
  %convolved394.sroa.0.0.vecblend754.us.us.lcssa.ph = phi <32 x i32> [ undef, %"for sum_input.s1.r19$x60.preheader.us.us" ], [ %convolved394.sroa.0.0.vecblend754.us.us.7, %"for sum_input.s1.r19$x60.us.us" ]
  %convolved394.sroa.0.13.us.us.unr = phi <32 x i32> [ %convolved394.sroa.0.12.us.us, %"for sum_input.s1.r19$x60.preheader.us.us" ], [ %convolved394.sroa.0.0.vecblend754.us.us.7, %"for sum_input.s1.r19$x60.us.us" ]
  %"sum_input.s1.r19$x62.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x60.preheader.us.us" ], [ %1190, %"for sum_input.s1.r19$x60.us.us" ]
  br i1 %lcmp.mod1672.not, label %"end for sum_input.s1.r19$x61.us.us", label %"for sum_input.s1.r19$x60.us.us.epil"

"for sum_input.s1.r19$x60.us.us.epil":            ; preds = %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x60.us.us.epil"
  %convolved394.sroa.0.13.us.us.epil = phi <32 x i32> [ %convolved394.sroa.0.0.vecblend754.us.us.epil, %"for sum_input.s1.r19$x60.us.us.epil" ], [ %convolved394.sroa.0.13.us.us.unr, %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa" ]
  %"sum_input.s1.r19$x62.us.us.epil" = phi i32 [ %1200, %"for sum_input.s1.r19$x60.us.us.epil" ], [ %"sum_input.s1.r19$x62.us.us.unr", %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa" ]
  %epil.iter1671 = phi i32 [ %epil.iter1671.sub, %"for sum_input.s1.r19$x60.us.us.epil" ], [ %xtraiter1670, %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa" ]
  %1191 = mul nsw i32 %"sum_input.s1.r19$x62.us.us.epil", %dilation_x
  %reass.add920.us.us.epil = add i32 %1474, %1191
  %reass.mul921.us.us.epil = shl i32 %reass.add920.us.us.epil, 2
  %1192 = add i32 %t973.us.us, %reass.mul921.us.us.epil
  %1193 = getelementptr inbounds i8, i8* %13, i32 %1192
  %1194 = bitcast i8* %1193 to <32 x i8>*
  %1195 = load <32 x i8>, <32 x i8>* %1194, align 4, !tbaa !110
  %1196 = shufflevector <32 x i32> %convolved394.sroa.0.13.us.us.epil, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1197 = shufflevector <32 x i8> %1195, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1198 = bitcast <128 x i8> %1197 to <32 x i32>
  %1199 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1196, <32 x i32> %1198, i32 16843009) #11
  %convolved394.sroa.0.0.vecblend754.us.us.epil = shufflevector <32 x i32> %1199, <32 x i32> %convolved394.sroa.0.13.us.us.epil, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1200 = add nuw nsw i32 %"sum_input.s1.r19$x62.us.us.epil", 1
  %epil.iter1671.sub = add i32 %epil.iter1671, -1
  %epil.iter1671.cmp.not = icmp eq i32 %epil.iter1671.sub, 0
  br i1 %epil.iter1671.cmp.not, label %"end for sum_input.s1.r19$x61.us.us", label %"for sum_input.s1.r19$x60.us.us.epil", !llvm.loop !116

"end for sum_input.s1.r19$x61.us.us":             ; preds = %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x60.us.us.epil", %"for sum_input.s1.r19$y57.us.us"
  %convolved394.sroa.0.14.us.us = phi <32 x i32> [ %convolved394.sroa.0.12.us.us, %"for sum_input.s1.r19$y57.us.us" ], [ %convolved394.sroa.0.0.vecblend754.us.us.lcssa.ph, %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa" ], [ %convolved394.sroa.0.0.vecblend754.us.us.epil, %"for sum_input.s1.r19$x60.us.us.epil" ]
  %1201 = add nuw nsw i32 %"sum_input.s1.r19$y59.us.us", 1
  %.not449.us.us = icmp eq i32 %1201, %11
  br i1 %.not449.us.us, label %"consume sum_input72.us.us", label %"for sum_input.s1.r19$y57.us.us"

"consume sum_input72.us.us":                      ; preds = %"end for sum_input.s1.r19$x67.loopexit.split.us.us.us.us.us", %"end for sum_input.s1.r19$x61.us.us", %"for sum_input.s1.r19$y63.preheader.us.us", %then_bb55.us.us, %next_bb56.us.us, %"for output.s0.x.xo45.us.us"
  %convolved394.sroa.0.20.us.us = phi <32 x i32> [ %convolved394.sroa.0.10.us.us, %"for output.s0.x.xo45.us.us" ], [ %convolved394.sroa.0.0.vecblend.us.us, %then_bb55.us.us ], [ %convolved394.sroa.0.0.vecblend.us.us, %next_bb56.us.us ], [ %convolved394.sroa.0.0.vecblend.us.us, %"for sum_input.s1.r19$y63.preheader.us.us" ], [ %convolved394.sroa.0.14.us.us, %"end for sum_input.s1.r19$x61.us.us" ], [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.lcssa, %"end for sum_input.s1.r19$x67.loopexit.split.us.us.us.us.us" ]
  br i1 %1080, label %"for output.s0.c.co73.preheader.us.us", label %"end for output.s0.c.co74.us.us", !prof !96

"for output.s0.c.co73.us.us":                     ; preds = %"for output.s0.c.co73.preheader.us.us", %"consume convolved89.us.us"
  %output.s0.c.co75.us.us = phi i32 [ %1414, %"consume convolved89.us.us" ], [ 0, %"for output.s0.c.co73.preheader.us.us" ]
  %1202 = shl nsw i32 %output.s0.c.co75.us.us, 6
  %1203 = getelementptr inbounds i32, i32* %offset_c, i32 %1202
  %1204 = bitcast i32* %1203 to <32 x i32>*
  %1205 = load <32 x i32>, <32 x i32>* %1204, align 128, !tbaa !104
  br i1 %t843.not, label %then_bb78.us.us, label %next_bb79.us.us

next_bb79.us.us:                                  ; preds = %"for output.s0.c.co73.us.us"
  %1206 = sub nsw <32 x i32> %1205, %1425
  %1207 = sub nsw <32 x i32> %1205, %1428
  %1208 = sub nsw <32 x i32> %1205, %1431
  %1209 = sub nsw <32 x i32> %1205, %1434
  %1210 = sub nsw <32 x i32> %1205, %1437
  %1211 = sub nsw <32 x i32> %1205, %1440
  %1212 = sub nsw <32 x i32> %1205, %1443
  %1213 = sub nsw <32 x i32> %1205, %1446
  %1214 = getelementptr inbounds i32, i32* %1203, i32 32
  %1215 = bitcast i32* %1214 to <32 x i32>*
  %1216 = load <32 x i32>, <32 x i32>* %1215, align 128, !tbaa !104
  %1217 = sub nsw <32 x i32> %1216, %1425
  %1218 = sub nsw <32 x i32> %1216, %1428
  %1219 = sub nsw <32 x i32> %1216, %1431
  %1220 = sub nsw <32 x i32> %1216, %1434
  %1221 = sub nsw <32 x i32> %1216, %1437
  %1222 = sub nsw <32 x i32> %1216, %1440
  %1223 = sub nsw <32 x i32> %1216, %1443
  %1224 = sub nsw <32 x i32> %1216, %1446
  br label %after_bb77.us.us

then_bb78.us.us:                                  ; preds = %"for output.s0.c.co73.us.us"
  %1225 = getelementptr inbounds i32, i32* %1203, i32 32
  %1226 = bitcast i32* %1225 to <32 x i32>*
  %1227 = load <32 x i32>, <32 x i32>* %1226, align 128, !tbaa !104
  br label %after_bb77.us.us

after_bb77.us.us:                                 ; preds = %then_bb78.us.us, %next_bb79.us.us
  %sum_input254393.sroa.95.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1224, %next_bb79.us.us ]
  %sum_input254393.sroa.90.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1213, %next_bb79.us.us ]
  %sum_input254393.sroa.85.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1223, %next_bb79.us.us ]
  %sum_input254393.sroa.80.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1212, %next_bb79.us.us ]
  %sum_input254393.sroa.75.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1222, %next_bb79.us.us ]
  %sum_input254393.sroa.70.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1211, %next_bb79.us.us ]
  %sum_input254393.sroa.65.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1221, %next_bb79.us.us ]
  %sum_input254393.sroa.60.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1210, %next_bb79.us.us ]
  %sum_input254393.sroa.55.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1220, %next_bb79.us.us ]
  %sum_input254393.sroa.50.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1209, %next_bb79.us.us ]
  %sum_input254393.sroa.45.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1219, %next_bb79.us.us ]
  %sum_input254393.sroa.40.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1208, %next_bb79.us.us ]
  %sum_input254393.sroa.35.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1218, %next_bb79.us.us ]
  %sum_input254393.sroa.30.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1207, %next_bb79.us.us ]
  %sum_input254393.sroa.25.0.us.us = phi <32 x i32> [ %1227, %then_bb78.us.us ], [ %1217, %next_bb79.us.us ]
  %sum_input254393.sroa.0.0.us.us = phi <32 x i32> [ %1205, %then_bb78.us.us ], [ %1206, %next_bb79.us.us ]
  br i1 %1076, label %"for convolved.s1.r19$y80.preheader.us.us", label %"consume convolved89.us.us", !prof !96

"consume convolved89.us.us":                      ; preds = %"end for convolved.s1.r19$x84.loopexit.us.us.us", %"for convolved.s1.r19$y80.preheader.us.us", %after_bb77.us.us
  %sum_input254393.sroa.95.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.95.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.95.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1173.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.90.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.90.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.90.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1174.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.85.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.85.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.85.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1175.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.80.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.80.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.80.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1176.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.75.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.75.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.75.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1177.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.70.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.70.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.70.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1178.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.65.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.65.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.65.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1179.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.60.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.60.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.60.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1180.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.55.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.55.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.55.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1181.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.50.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.50.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.50.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1182.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.45.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.45.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.45.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1183.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.40.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.40.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.40.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1184.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.35.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.35.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.35.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1185.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.30.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.30.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.30.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1186.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.25.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.25.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.25.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1187.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %sum_input254393.sroa.0.6.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.us.us, %after_bb77.us.us ], [ %sum_input254393.sroa.0.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ], [ %.us-phi1188.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ]
  %ab1.i611.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.0.6.us.us, <32 x i32> %1463) #11
  %ab.i612.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i611.us.us, <32 x i32> %sum_input254393.sroa.0.6.us.us, <32 x i32> %1463) #11
  %ab1.i613.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.25.6.us.us, <32 x i32> %1464) #11
  %ab.i614.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i613.us.us, <32 x i32> %sum_input254393.sroa.25.6.us.us, <32 x i32> %1464) #11
  %1228 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i612.us.us, i32 %output_shift) #11
  %1229 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i614.us.us, i32 %output_shift) #11
  %1230 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1229, <32 x i32> %1228)
  %1231 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i612.us.us, i32 %1085) #11
  %1232 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i614.us.us, i32 %1085) #11
  %1233 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1232, <32 x i32> %1231)
  %1234 = and <64 x i32> %1233, %1084
  %1235 = add nsw <64 x i32> %1234, %1230
  %1236 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1235) #11
  %1237 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1235) #11
  %1238 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1237, <32 x i32> %1236) #11
  %1239 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1238, <32 x i32> %1089) #11
  %1240 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1239)
  %1241 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1240) #11
  %1242 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1240) #11
  %1243 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1241, <32 x i32> %1242) #11
  %1244 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1243, <32 x i32> %1092) #11
  %1245 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1244, <32 x i32> %1095) #11
  %1246 = bitcast <32 x i32> %1245 to <128 x i8>
  %1247 = shufflevector <128 x i8> %1246, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1248 = shl nsw i32 %output.s0.c.co75.us.us, 6
  %1249 = add i32 %1248, %t970.us.us
  %1250 = add i32 %1249, %1465
  %1251 = getelementptr inbounds i8, i8* %23, i32 %1250
  %1252 = bitcast i8* %1251 to <64 x i8>*
  store <64 x i8> %1247, <64 x i8>* %1252, align 1, !tbaa !113
  %ab1.i615.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.30.6.us.us, <32 x i32> %1463) #11
  %ab.i616.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i615.us.us, <32 x i32> %sum_input254393.sroa.30.6.us.us, <32 x i32> %1463) #11
  %ab1.i617.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.35.6.us.us, <32 x i32> %1464) #11
  %ab.i618.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i617.us.us, <32 x i32> %sum_input254393.sroa.35.6.us.us, <32 x i32> %1464) #11
  %1253 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i616.us.us, i32 %output_shift) #11
  %1254 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i618.us.us, i32 %output_shift) #11
  %1255 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1254, <32 x i32> %1253)
  %1256 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i616.us.us, i32 %1085) #11
  %1257 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i618.us.us, i32 %1085) #11
  %1258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1257, <32 x i32> %1256)
  %1259 = and <64 x i32> %1258, %1084
  %1260 = add nsw <64 x i32> %1259, %1255
  %1261 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1260) #11
  %1262 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1260) #11
  %1263 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1262, <32 x i32> %1261) #11
  %1264 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1263, <32 x i32> %1089) #11
  %1265 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1264)
  %1266 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1265) #11
  %1267 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1265) #11
  %1268 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1266, <32 x i32> %1267) #11
  %1269 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1268, <32 x i32> %1092) #11
  %1270 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1269, <32 x i32> %1095) #11
  %1271 = bitcast <32 x i32> %1270 to <128 x i8>
  %1272 = shufflevector <128 x i8> %1271, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1273 = add i32 %1249, %1466
  %1274 = getelementptr inbounds i8, i8* %23, i32 %1273
  %1275 = bitcast i8* %1274 to <64 x i8>*
  store <64 x i8> %1272, <64 x i8>* %1275, align 1, !tbaa !113
  %ab1.i619.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.40.6.us.us, <32 x i32> %1463) #11
  %ab.i620.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i619.us.us, <32 x i32> %sum_input254393.sroa.40.6.us.us, <32 x i32> %1463) #11
  %ab1.i621.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.45.6.us.us, <32 x i32> %1464) #11
  %ab.i622.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i621.us.us, <32 x i32> %sum_input254393.sroa.45.6.us.us, <32 x i32> %1464) #11
  %1276 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i620.us.us, i32 %output_shift) #11
  %1277 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i622.us.us, i32 %output_shift) #11
  %1278 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1277, <32 x i32> %1276)
  %1279 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i620.us.us, i32 %1085) #11
  %1280 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i622.us.us, i32 %1085) #11
  %1281 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1280, <32 x i32> %1279)
  %1282 = and <64 x i32> %1281, %1084
  %1283 = add nsw <64 x i32> %1282, %1278
  %1284 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1283) #11
  %1285 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1283) #11
  %1286 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1285, <32 x i32> %1284) #11
  %1287 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1286, <32 x i32> %1089) #11
  %1288 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1287)
  %1289 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1288) #11
  %1290 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1288) #11
  %1291 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1289, <32 x i32> %1290) #11
  %1292 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1291, <32 x i32> %1092) #11
  %1293 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1292, <32 x i32> %1095) #11
  %1294 = bitcast <32 x i32> %1293 to <128 x i8>
  %1295 = shufflevector <128 x i8> %1294, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1296 = add i32 %1249, %1467
  %1297 = getelementptr inbounds i8, i8* %23, i32 %1296
  %1298 = bitcast i8* %1297 to <64 x i8>*
  store <64 x i8> %1295, <64 x i8>* %1298, align 1, !tbaa !113
  %ab1.i623.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.50.6.us.us, <32 x i32> %1463) #11
  %ab.i624.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i623.us.us, <32 x i32> %sum_input254393.sroa.50.6.us.us, <32 x i32> %1463) #11
  %ab1.i625.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.55.6.us.us, <32 x i32> %1464) #11
  %ab.i626.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i625.us.us, <32 x i32> %sum_input254393.sroa.55.6.us.us, <32 x i32> %1464) #11
  %1299 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i624.us.us, i32 %output_shift) #11
  %1300 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i626.us.us, i32 %output_shift) #11
  %1301 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1300, <32 x i32> %1299)
  %1302 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i624.us.us, i32 %1085) #11
  %1303 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i626.us.us, i32 %1085) #11
  %1304 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1303, <32 x i32> %1302)
  %1305 = and <64 x i32> %1304, %1084
  %1306 = add nsw <64 x i32> %1305, %1301
  %1307 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1306) #11
  %1308 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1306) #11
  %1309 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1308, <32 x i32> %1307) #11
  %1310 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1309, <32 x i32> %1089) #11
  %1311 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1310)
  %1312 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1311) #11
  %1313 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1311) #11
  %1314 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1312, <32 x i32> %1313) #11
  %1315 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1314, <32 x i32> %1092) #11
  %1316 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1315, <32 x i32> %1095) #11
  %1317 = bitcast <32 x i32> %1316 to <128 x i8>
  %1318 = shufflevector <128 x i8> %1317, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1319 = add i32 %1249, %1468
  %1320 = getelementptr inbounds i8, i8* %23, i32 %1319
  %1321 = bitcast i8* %1320 to <64 x i8>*
  store <64 x i8> %1318, <64 x i8>* %1321, align 1, !tbaa !113
  %ab1.i627.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.60.6.us.us, <32 x i32> %1463) #11
  %ab.i628.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i627.us.us, <32 x i32> %sum_input254393.sroa.60.6.us.us, <32 x i32> %1463) #11
  %ab1.i629.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.65.6.us.us, <32 x i32> %1464) #11
  %ab.i630.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i629.us.us, <32 x i32> %sum_input254393.sroa.65.6.us.us, <32 x i32> %1464) #11
  %1322 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i628.us.us, i32 %output_shift) #11
  %1323 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i630.us.us, i32 %output_shift) #11
  %1324 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1323, <32 x i32> %1322)
  %1325 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i628.us.us, i32 %1085) #11
  %1326 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i630.us.us, i32 %1085) #11
  %1327 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1326, <32 x i32> %1325)
  %1328 = and <64 x i32> %1327, %1084
  %1329 = add nsw <64 x i32> %1328, %1324
  %1330 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1329) #11
  %1331 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1329) #11
  %1332 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1331, <32 x i32> %1330) #11
  %1333 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1332, <32 x i32> %1089) #11
  %1334 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1333)
  %1335 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1334) #11
  %1336 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1334) #11
  %1337 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1335, <32 x i32> %1336) #11
  %1338 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1337, <32 x i32> %1092) #11
  %1339 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1338, <32 x i32> %1095) #11
  %1340 = bitcast <32 x i32> %1339 to <128 x i8>
  %1341 = shufflevector <128 x i8> %1340, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1342 = add i32 %1249, %1469
  %1343 = getelementptr inbounds i8, i8* %23, i32 %1342
  %1344 = bitcast i8* %1343 to <64 x i8>*
  store <64 x i8> %1341, <64 x i8>* %1344, align 1, !tbaa !113
  %ab1.i631.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.70.6.us.us, <32 x i32> %1463) #11
  %ab.i632.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i631.us.us, <32 x i32> %sum_input254393.sroa.70.6.us.us, <32 x i32> %1463) #11
  %ab1.i633.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.75.6.us.us, <32 x i32> %1464) #11
  %ab.i634.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i633.us.us, <32 x i32> %sum_input254393.sroa.75.6.us.us, <32 x i32> %1464) #11
  %1345 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i632.us.us, i32 %output_shift) #11
  %1346 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i634.us.us, i32 %output_shift) #11
  %1347 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1346, <32 x i32> %1345)
  %1348 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i632.us.us, i32 %1085) #11
  %1349 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i634.us.us, i32 %1085) #11
  %1350 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1349, <32 x i32> %1348)
  %1351 = and <64 x i32> %1350, %1084
  %1352 = add nsw <64 x i32> %1351, %1347
  %1353 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1352) #11
  %1354 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1352) #11
  %1355 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1354, <32 x i32> %1353) #11
  %1356 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1355, <32 x i32> %1089) #11
  %1357 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1356)
  %1358 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1357) #11
  %1359 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1357) #11
  %1360 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1358, <32 x i32> %1359) #11
  %1361 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1360, <32 x i32> %1092) #11
  %1362 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1361, <32 x i32> %1095) #11
  %1363 = bitcast <32 x i32> %1362 to <128 x i8>
  %1364 = shufflevector <128 x i8> %1363, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1365 = add i32 %1249, %1470
  %1366 = getelementptr inbounds i8, i8* %23, i32 %1365
  %1367 = bitcast i8* %1366 to <64 x i8>*
  store <64 x i8> %1364, <64 x i8>* %1367, align 1, !tbaa !113
  %ab1.i635.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.80.6.us.us, <32 x i32> %1463) #11
  %ab.i636.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i635.us.us, <32 x i32> %sum_input254393.sroa.80.6.us.us, <32 x i32> %1463) #11
  %ab1.i637.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.85.6.us.us, <32 x i32> %1464) #11
  %ab.i638.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i637.us.us, <32 x i32> %sum_input254393.sroa.85.6.us.us, <32 x i32> %1464) #11
  %1368 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i636.us.us, i32 %output_shift) #11
  %1369 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i638.us.us, i32 %output_shift) #11
  %1370 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1369, <32 x i32> %1368)
  %1371 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i636.us.us, i32 %1085) #11
  %1372 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i638.us.us, i32 %1085) #11
  %1373 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1372, <32 x i32> %1371)
  %1374 = and <64 x i32> %1373, %1084
  %1375 = add nsw <64 x i32> %1374, %1370
  %1376 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1375) #11
  %1377 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1375) #11
  %1378 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1377, <32 x i32> %1376) #11
  %1379 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1378, <32 x i32> %1089) #11
  %1380 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1379)
  %1381 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1380) #11
  %1382 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1380) #11
  %1383 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1381, <32 x i32> %1382) #11
  %1384 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1383, <32 x i32> %1092) #11
  %1385 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1384, <32 x i32> %1095) #11
  %1386 = bitcast <32 x i32> %1385 to <128 x i8>
  %1387 = shufflevector <128 x i8> %1386, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1388 = add i32 %1249, %1471
  %1389 = getelementptr inbounds i8, i8* %23, i32 %1388
  %1390 = bitcast i8* %1389 to <64 x i8>*
  store <64 x i8> %1387, <64 x i8>* %1390, align 1, !tbaa !113
  %ab1.i639.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.90.6.us.us, <32 x i32> %1463) #11
  %ab.i640.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i639.us.us, <32 x i32> %sum_input254393.sroa.90.6.us.us, <32 x i32> %1463) #11
  %ab1.i641.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %sum_input254393.sroa.95.6.us.us, <32 x i32> %1464) #11
  %ab.i642.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i641.us.us, <32 x i32> %sum_input254393.sroa.95.6.us.us, <32 x i32> %1464) #11
  %1391 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i640.us.us, i32 %output_shift) #11
  %1392 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i642.us.us, i32 %output_shift) #11
  %1393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1392, <32 x i32> %1391)
  %1394 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i640.us.us, i32 %1085) #11
  %1395 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i642.us.us, i32 %1085) #11
  %1396 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %1395, <32 x i32> %1394)
  %1397 = and <64 x i32> %1396, %1084
  %1398 = add nsw <64 x i32> %1397, %1393
  %1399 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1398) #11
  %1400 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1398) #11
  %1401 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1400, <32 x i32> %1399) #11
  %1402 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1401, <32 x i32> %1089) #11
  %1403 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1402)
  %1404 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1403) #11
  %1405 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1403) #11
  %1406 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1404, <32 x i32> %1405) #11
  %1407 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1406, <32 x i32> %1092) #11
  %1408 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1407, <32 x i32> %1095) #11
  %1409 = bitcast <32 x i32> %1408 to <128 x i8>
  %1410 = shufflevector <128 x i8> %1409, <128 x i8> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1411 = add i32 %1249, %1472
  %1412 = getelementptr inbounds i8, i8* %23, i32 %1411
  %1413 = bitcast i8* %1412 to <64 x i8>*
  store <64 x i8> %1410, <64 x i8>* %1413, align 1, !tbaa !113
  %1414 = add nuw nsw i32 %output.s0.c.co75.us.us, 1
  %.not442.us.us = icmp eq i32 %1414, %1079
  br i1 %.not442.us.us, label %"end for output.s0.c.co74.us.us", label %"for output.s0.c.co73.us.us"

"end for output.s0.c.co74.us.us":                 ; preds = %"consume convolved89.us.us", %"consume sum_input72.us.us"
  %1415 = add nuw nsw i32 %output.s0.x.xo47.us.us, 1
  %.not441.us.us = icmp eq i32 %1415, %1075
  br i1 %.not441.us.us, label %"end for output.s0.x.xo46.loopexit.us.us", label %"for output.s0.x.xo45.us.us"

"for convolved.s1.r19$y80.preheader.us.us":       ; preds = %after_bb77.us.us
  %1416 = shl nuw nsw i32 %output.s0.c.co75.us.us, 1
  %1417 = or i32 %1416, 1
  %1418 = mul nsw i32 %1417, %8
  %1419 = mul nsw i32 %output.s0.c.co75.us.us, %8
  br i1 %1077, label %"for convolved.s1.r19$y80.us.us.us", label %"consume convolved89.us.us", !prof !96

"for sum_input.s1.r19$x60.preheader.us.us":       ; preds = %"for sum_input.s1.r19$y57.us.us"
  %1420 = mul nsw i32 %"sum_input.s1.r19$y59.us.us", %dilation_y
  %1421 = add nsw i32 %1420, %1109
  %1422 = mul nsw i32 %1421, %19
  %t973.us.us = add i32 %1104, %1422
  br i1 %1099, label %"end for sum_input.s1.r19$x61.us.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x60.us.us"

"for output.s0.c.co73.preheader.us.us":           ; preds = %"consume sum_input72.us.us"
  %convolved394.sroa.0.0.vec.extract763.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 0
  %1423 = mul nsw i32 %convolved394.sroa.0.0.vec.extract763.us.us, %307
  %1424 = insertelement <32 x i32> undef, i32 %1423, i32 0
  %1425 = shufflevector <32 x i32> %1424, <32 x i32> undef, <32 x i32> zeroinitializer
  %convolved394.sroa.0.4.vec.extract765.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 1
  %1426 = mul nsw i32 %convolved394.sroa.0.4.vec.extract765.us.us, %307
  %1427 = insertelement <32 x i32> undef, i32 %1426, i32 0
  %1428 = shufflevector <32 x i32> %1427, <32 x i32> undef, <32 x i32> zeroinitializer
  %convolved394.sroa.0.8.vec.extract767.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 2
  %1429 = mul nsw i32 %convolved394.sroa.0.8.vec.extract767.us.us, %307
  %1430 = insertelement <32 x i32> undef, i32 %1429, i32 0
  %1431 = shufflevector <32 x i32> %1430, <32 x i32> undef, <32 x i32> zeroinitializer
  %convolved394.sroa.0.12.vec.extract769.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 3
  %1432 = mul nsw i32 %convolved394.sroa.0.12.vec.extract769.us.us, %307
  %1433 = insertelement <32 x i32> undef, i32 %1432, i32 0
  %1434 = shufflevector <32 x i32> %1433, <32 x i32> undef, <32 x i32> zeroinitializer
  %convolved394.sroa.0.16.vec.extract771.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 4
  %1435 = mul nsw i32 %convolved394.sroa.0.16.vec.extract771.us.us, %307
  %1436 = insertelement <32 x i32> undef, i32 %1435, i32 0
  %1437 = shufflevector <32 x i32> %1436, <32 x i32> undef, <32 x i32> zeroinitializer
  %convolved394.sroa.0.20.vec.extract773.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 5
  %1438 = mul nsw i32 %convolved394.sroa.0.20.vec.extract773.us.us, %307
  %1439 = insertelement <32 x i32> undef, i32 %1438, i32 0
  %1440 = shufflevector <32 x i32> %1439, <32 x i32> undef, <32 x i32> zeroinitializer
  %convolved394.sroa.0.24.vec.extract775.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 6
  %1441 = mul nsw i32 %convolved394.sroa.0.24.vec.extract775.us.us, %307
  %1442 = insertelement <32 x i32> undef, i32 %1441, i32 0
  %1443 = shufflevector <32 x i32> %1442, <32 x i32> undef, <32 x i32> zeroinitializer
  %convolved394.sroa.0.28.vec.extract777.us.us = extractelement <32 x i32> %convolved394.sroa.0.20.us.us, i32 7
  %1444 = mul nsw i32 %convolved394.sroa.0.28.vec.extract777.us.us, %307
  %1445 = insertelement <32 x i32> undef, i32 %1444, i32 0
  %1446 = shufflevector <32 x i32> %1445, <32 x i32> undef, <32 x i32> zeroinitializer
  %1447 = add nsw i32 %output.s0.x.x.base.s48.us.us, %25
  %1448 = add nsw i32 %1447, 7
  %1449 = mul nsw i32 %1448, %stride_x
  %1450 = add nsw i32 %1447, 6
  %1451 = mul nsw i32 %1450, %stride_x
  %1452 = add nsw i32 %1447, 5
  %1453 = mul nsw i32 %1452, %stride_x
  %1454 = add nsw i32 %1447, 4
  %1455 = mul nsw i32 %1454, %stride_x
  %1456 = add nsw i32 %1447, 3
  %1457 = mul nsw i32 %1456, %stride_x
  %1458 = add nsw i32 %1447, 2
  %1459 = mul nsw i32 %1458, %stride_x
  %1460 = add nsw i32 %1447, 1
  %1461 = mul nsw i32 %1460, %stride_x
  %1462 = mul nsw i32 %1447, %stride_x
  %1463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1082)
  %1464 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1082)
  %1465 = mul nsw i32 %1447, %27
  %1466 = mul nsw i32 %1460, %27
  %1467 = mul nsw i32 %1458, %27
  %1468 = mul nsw i32 %1456, %27
  %1469 = mul nsw i32 %1454, %27
  %1470 = mul nsw i32 %1452, %27
  %1471 = mul nsw i32 %1450, %27
  %1472 = mul nsw i32 %1448, %27
  br label %"for output.s0.c.co73.us.us"

"for sum_input.s1.r19$y57.preheader.us.us":       ; preds = %then_bb55.us.us
  %1473 = add nsw i32 %output.s0.x.x.base.s48.us.us, %25
  %1474 = sub i32 %1473, %16
  br label %"for sum_input.s1.r19$y57.us.us"

"for sum_input.s1.r19$y63.preheader.us.us":       ; preds = %next_bb56.us.us
  %1475 = add nsw i32 %output.s0.x.x.base.s48.us.us, %25
  %1476 = mul nsw i32 %1475, %stride_x
  br i1 %brmerge1438.demorgan, label %"for sum_input.s1.r19$y63.us.us.us.us", label %"consume sum_input72.us.us", !prof !103

"end for output.s0.x.xo46.loopexit.us.us":        ; preds = %"end for output.s0.c.co74.us.us"
  %1477 = add nuw nsw i32 %output.s0.y.rebased44.us.us, 1
  %.not440.us.us = icmp eq i32 %1477, %29
  br i1 %.not440.us.us, label %"end for output.s0.y.rebased43.loopexit.us", label %"for output.s0.y.rebased42.us.us"

"for sum_input.s1.r19$y63.us.us.us.us":           ; preds = %"for sum_input.s1.r19$y63.preheader.us.us", %"end for sum_input.s1.r19$x67.loopexit.split.us.us.us.us.us"
  %convolved394.sroa.0.15.us.us.us.us = phi <32 x i32> [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.lcssa, %"end for sum_input.s1.r19$x67.loopexit.split.us.us.us.us.us" ], [ %convolved394.sroa.0.0.vecblend.us.us, %"for sum_input.s1.r19$y63.preheader.us.us" ]
  %"sum_input.s1.r19$y65.us.us.us.us" = phi i32 [ %1636, %"end for sum_input.s1.r19$x67.loopexit.split.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y63.preheader.us.us" ]
  %1478 = mul nsw i32 %"sum_input.s1.r19$y65.us.us.us.us", %dilation_y
  %t975.s.us.us.us.us = add nsw i32 %1478, %1109
  %1479 = mul nsw i32 %t975.s.us.us.us.us, %19
  br label %"for sum_input.s1.r19$x66.us.us.us.us.us"

"for sum_input.s1.r19$x66.us.us.us.us.us":        ; preds = %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us", %"for sum_input.s1.r19$y63.us.us.us.us"
  %convolved394.sroa.0.16.us.us.us.us.us = phi <32 x i32> [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.lcssa, %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us" ], [ %convolved394.sroa.0.15.us.us.us.us, %"for sum_input.s1.r19$y63.us.us.us.us" ]
  %"sum_input.s1.r19$x68.us.us.us.us.us" = phi i32 [ %1635, %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y63.us.us.us.us" ]
  %1480 = mul nsw i32 %"sum_input.s1.r19$x68.us.us.us.us.us", %dilation_x
  %t976.s.us.us.us.us.us = add nsw i32 %1480, %1476
  %1481 = mul nsw i32 %t976.s.us.us.us.us.us, %17
  %1482 = add i32 %1481, %1479
  %t977.us.us.us.us.us = sub i32 %1482, %t941
  %1483 = add i32 %t977.us.us.us.us.us, %1103
  %t949.us.us.us.us.us = add i32 %1482, %1072
  %1484 = sub i32 %t949.us.us.us.us.us, %1059
  %t978.us.us.us.us.us = sub i32 %1484, %1060
  %1485 = add i32 %t978.us.us.us.us.us, %1103
  %1486 = add i32 %1482, %1070
  %1487 = sub i32 %1486, %1096
  %t979.us.us.us.us.us = sub i32 %1487, %1060
  %1488 = add i32 %t979.us.us.us.us.us, %1103
  %1489 = add i32 %1482, %1069
  %1490 = sub i32 %1489, %1096
  %t980.us.us.us.us.us = sub i32 %1490, %1060
  %1491 = add i32 %t980.us.us.us.us.us, %1103
  %1492 = add i32 %1482, %1068
  %1493 = sub i32 %1492, %1096
  %t981.us.us.us.us.us = sub i32 %1493, %1060
  %1494 = add i32 %t981.us.us.us.us.us, %1103
  %1495 = add i32 %1482, %1067
  %1496 = sub i32 %1495, %1096
  %t982.us.us.us.us.us = sub i32 %1496, %1060
  %1497 = add i32 %t982.us.us.us.us.us, %1103
  %1498 = add i32 %1482, %1066
  %1499 = sub i32 %1498, %1096
  %t983.us.us.us.us.us = sub i32 %1499, %1060
  %1500 = add i32 %t983.us.us.us.us.us, %1103
  %1501 = add i32 %1482, %1065
  %1502 = sub i32 %1501, %1096
  %t984.us.us.us.us.us = sub i32 %1502, %1060
  %1503 = add i32 %t984.us.us.us.us.us, %1103
  br i1 %1098, label %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r12469.us.us.us.us.us"

"for sum_input.s1.r19$z.r12469.us.us.us.us.us":   ; preds = %"for sum_input.s1.r19$x66.us.us.us.us.us", %"for sum_input.s1.r19$z.r12469.us.us.us.us.us"
  %convolved394.sroa.0.18.us.us.us.us.us = phi <32 x i32> [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.1, %"for sum_input.s1.r19$z.r12469.us.us.us.us.us" ], [ %convolved394.sroa.0.16.us.us.us.us.us, %"for sum_input.s1.r19$x66.us.us.us.us.us" ]
  %"sum_input.s1.r19$z.r12471.us.us.us.us.us" = phi i32 [ %1591, %"for sum_input.s1.r19$z.r12469.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$x66.us.us.us.us.us" ]
  %niter1669 = phi i32 [ %niter1669.nsub.1, %"for sum_input.s1.r19$z.r12469.us.us.us.us.us" ], [ %unroll_iter1668, %"for sum_input.s1.r19$x66.us.us.us.us.us" ]
  %1504 = shl nsw i32 %"sum_input.s1.r19$z.r12471.us.us.us.us.us", 2
  %1505 = add i32 %1483, %1504
  %1506 = getelementptr inbounds i8, i8* %13, i32 %1505
  %1507 = bitcast i8* %1506 to <4 x i8>*
  %1508 = load <4 x i8>, <4 x i8>* %1507, align 4, !tbaa !110
  %1509 = add i32 %1485, %1504
  %1510 = getelementptr inbounds i8, i8* %13, i32 %1509
  %1511 = bitcast i8* %1510 to <4 x i8>*
  %1512 = load <4 x i8>, <4 x i8>* %1511, align 4, !tbaa !110
  %1513 = add i32 %1488, %1504
  %1514 = getelementptr inbounds i8, i8* %13, i32 %1513
  %1515 = bitcast i8* %1514 to <4 x i8>*
  %1516 = load <4 x i8>, <4 x i8>* %1515, align 4, !tbaa !110
  %1517 = add i32 %1491, %1504
  %1518 = getelementptr inbounds i8, i8* %13, i32 %1517
  %1519 = bitcast i8* %1518 to <4 x i8>*
  %1520 = load <4 x i8>, <4 x i8>* %1519, align 4, !tbaa !110
  %1521 = add i32 %1494, %1504
  %1522 = getelementptr inbounds i8, i8* %13, i32 %1521
  %1523 = bitcast i8* %1522 to <4 x i8>*
  %1524 = load <4 x i8>, <4 x i8>* %1523, align 4, !tbaa !110
  %1525 = add i32 %1497, %1504
  %1526 = getelementptr inbounds i8, i8* %13, i32 %1525
  %1527 = bitcast i8* %1526 to <4 x i8>*
  %1528 = load <4 x i8>, <4 x i8>* %1527, align 4, !tbaa !110
  %1529 = add i32 %1500, %1504
  %1530 = getelementptr inbounds i8, i8* %13, i32 %1529
  %1531 = bitcast i8* %1530 to <4 x i8>*
  %1532 = load <4 x i8>, <4 x i8>* %1531, align 4, !tbaa !110
  %1533 = add i32 %1503, %1504
  %1534 = getelementptr inbounds i8, i8* %13, i32 %1533
  %1535 = bitcast i8* %1534 to <4 x i8>*
  %1536 = load <4 x i8>, <4 x i8>* %1535, align 4, !tbaa !110
  %1537 = shufflevector <4 x i8> %1508, <4 x i8> %1512, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1538 = shufflevector <4 x i8> %1516, <4 x i8> %1520, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1539 = shufflevector <4 x i8> %1524, <4 x i8> %1528, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1540 = shufflevector <4 x i8> %1532, <4 x i8> %1536, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1541 = shufflevector <8 x i8> %1537, <8 x i8> %1538, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1542 = shufflevector <8 x i8> %1539, <8 x i8> %1540, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1543 = shufflevector <32 x i32> %convolved394.sroa.0.18.us.us.us.us.us, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1544 = shufflevector <16 x i8> %1541, <16 x i8> %1542, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1545 = bitcast <128 x i8> %1544 to <32 x i32>
  %1546 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1543, <32 x i32> %1545, i32 16843009) #11
  %1547 = shl i32 %"sum_input.s1.r19$z.r12471.us.us.us.us.us", 2
  %1548 = or i32 %1547, 4
  %1549 = add i32 %1483, %1548
  %1550 = getelementptr inbounds i8, i8* %13, i32 %1549
  %1551 = bitcast i8* %1550 to <4 x i8>*
  %1552 = load <4 x i8>, <4 x i8>* %1551, align 4, !tbaa !110
  %1553 = add i32 %1485, %1548
  %1554 = getelementptr inbounds i8, i8* %13, i32 %1553
  %1555 = bitcast i8* %1554 to <4 x i8>*
  %1556 = load <4 x i8>, <4 x i8>* %1555, align 4, !tbaa !110
  %1557 = add i32 %1488, %1548
  %1558 = getelementptr inbounds i8, i8* %13, i32 %1557
  %1559 = bitcast i8* %1558 to <4 x i8>*
  %1560 = load <4 x i8>, <4 x i8>* %1559, align 4, !tbaa !110
  %1561 = add i32 %1491, %1548
  %1562 = getelementptr inbounds i8, i8* %13, i32 %1561
  %1563 = bitcast i8* %1562 to <4 x i8>*
  %1564 = load <4 x i8>, <4 x i8>* %1563, align 4, !tbaa !110
  %1565 = add i32 %1494, %1548
  %1566 = getelementptr inbounds i8, i8* %13, i32 %1565
  %1567 = bitcast i8* %1566 to <4 x i8>*
  %1568 = load <4 x i8>, <4 x i8>* %1567, align 4, !tbaa !110
  %1569 = add i32 %1497, %1548
  %1570 = getelementptr inbounds i8, i8* %13, i32 %1569
  %1571 = bitcast i8* %1570 to <4 x i8>*
  %1572 = load <4 x i8>, <4 x i8>* %1571, align 4, !tbaa !110
  %1573 = add i32 %1500, %1548
  %1574 = getelementptr inbounds i8, i8* %13, i32 %1573
  %1575 = bitcast i8* %1574 to <4 x i8>*
  %1576 = load <4 x i8>, <4 x i8>* %1575, align 4, !tbaa !110
  %1577 = add i32 %1503, %1548
  %1578 = getelementptr inbounds i8, i8* %13, i32 %1577
  %1579 = bitcast i8* %1578 to <4 x i8>*
  %1580 = load <4 x i8>, <4 x i8>* %1579, align 4, !tbaa !110
  %1581 = shufflevector <4 x i8> %1552, <4 x i8> %1556, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1582 = shufflevector <4 x i8> %1560, <4 x i8> %1564, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1583 = shufflevector <4 x i8> %1568, <4 x i8> %1572, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1584 = shufflevector <4 x i8> %1576, <4 x i8> %1580, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1585 = shufflevector <8 x i8> %1581, <8 x i8> %1582, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1586 = shufflevector <8 x i8> %1583, <8 x i8> %1584, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1587 = shufflevector <32 x i32> %1546, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1588 = shufflevector <16 x i8> %1585, <16 x i8> %1586, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1589 = bitcast <128 x i8> %1588 to <32 x i32>
  %1590 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1587, <32 x i32> %1589, i32 16843009) #11
  %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.1 = shufflevector <32 x i32> %1590, <32 x i32> %convolved394.sroa.0.18.us.us.us.us.us, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1591 = add nuw nsw i32 %"sum_input.s1.r19$z.r12471.us.us.us.us.us", 2
  %niter1669.nsub.1 = add i32 %niter1669, -2
  %niter1669.ncmp.1 = icmp eq i32 %niter1669.nsub.1, 0
  br i1 %niter1669.ncmp.1, label %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r12469.us.us.us.us.us"

"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us.unr-lcssa": ; preds = %"for sum_input.s1.r19$z.r12469.us.us.us.us.us", %"for sum_input.s1.r19$x66.us.us.us.us.us"
  %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.lcssa.ph = phi <32 x i32> [ undef, %"for sum_input.s1.r19$x66.us.us.us.us.us" ], [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.1, %"for sum_input.s1.r19$z.r12469.us.us.us.us.us" ]
  %convolved394.sroa.0.18.us.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.0.16.us.us.us.us.us, %"for sum_input.s1.r19$x66.us.us.us.us.us" ], [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.1, %"for sum_input.s1.r19$z.r12469.us.us.us.us.us" ]
  %"sum_input.s1.r19$z.r12471.us.us.us.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x66.us.us.us.us.us" ], [ %1591, %"for sum_input.s1.r19$z.r12469.us.us.us.us.us" ]
  br i1 %lcmp.mod1667.not, label %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us", label %"for sum_input.s1.r19$z.r12469.us.us.us.us.us.epil"

"for sum_input.s1.r19$z.r12469.us.us.us.us.us.epil": ; preds = %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us.unr-lcssa"
  %1592 = shl nsw i32 %"sum_input.s1.r19$z.r12471.us.us.us.us.us.unr", 2
  %1593 = shufflevector <32 x i32> %convolved394.sroa.0.18.us.us.us.us.us.unr, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1594 = add i32 %1483, %1592
  %1595 = getelementptr inbounds i8, i8* %13, i32 %1594
  %1596 = bitcast i8* %1595 to <4 x i8>*
  %1597 = load <4 x i8>, <4 x i8>* %1596, align 4, !tbaa !110
  %1598 = add i32 %1485, %1592
  %1599 = getelementptr inbounds i8, i8* %13, i32 %1598
  %1600 = bitcast i8* %1599 to <4 x i8>*
  %1601 = load <4 x i8>, <4 x i8>* %1600, align 4, !tbaa !110
  %1602 = shufflevector <4 x i8> %1597, <4 x i8> %1601, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1603 = add i32 %1488, %1592
  %1604 = getelementptr inbounds i8, i8* %13, i32 %1603
  %1605 = bitcast i8* %1604 to <4 x i8>*
  %1606 = load <4 x i8>, <4 x i8>* %1605, align 4, !tbaa !110
  %1607 = add i32 %1491, %1592
  %1608 = getelementptr inbounds i8, i8* %13, i32 %1607
  %1609 = bitcast i8* %1608 to <4 x i8>*
  %1610 = load <4 x i8>, <4 x i8>* %1609, align 4, !tbaa !110
  %1611 = shufflevector <4 x i8> %1606, <4 x i8> %1610, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1612 = shufflevector <8 x i8> %1602, <8 x i8> %1611, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1613 = add i32 %1494, %1592
  %1614 = getelementptr inbounds i8, i8* %13, i32 %1613
  %1615 = bitcast i8* %1614 to <4 x i8>*
  %1616 = load <4 x i8>, <4 x i8>* %1615, align 4, !tbaa !110
  %1617 = add i32 %1497, %1592
  %1618 = getelementptr inbounds i8, i8* %13, i32 %1617
  %1619 = bitcast i8* %1618 to <4 x i8>*
  %1620 = load <4 x i8>, <4 x i8>* %1619, align 4, !tbaa !110
  %1621 = shufflevector <4 x i8> %1616, <4 x i8> %1620, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1622 = add i32 %1500, %1592
  %1623 = getelementptr inbounds i8, i8* %13, i32 %1622
  %1624 = bitcast i8* %1623 to <4 x i8>*
  %1625 = load <4 x i8>, <4 x i8>* %1624, align 4, !tbaa !110
  %1626 = add i32 %1503, %1592
  %1627 = getelementptr inbounds i8, i8* %13, i32 %1626
  %1628 = bitcast i8* %1627 to <4 x i8>*
  %1629 = load <4 x i8>, <4 x i8>* %1628, align 4, !tbaa !110
  %1630 = shufflevector <4 x i8> %1625, <4 x i8> %1629, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %1631 = shufflevector <8 x i8> %1621, <8 x i8> %1630, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1632 = shufflevector <16 x i8> %1612, <16 x i8> %1631, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1633 = bitcast <128 x i8> %1632 to <32 x i32>
  %1634 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1593, <32 x i32> %1633, i32 16843009) #11
  %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.epil = shufflevector <32 x i32> %1634, <32 x i32> %convolved394.sroa.0.18.us.us.us.us.us.unr, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  br label %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us"

"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us": ; preds = %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us.unr-lcssa", %"for sum_input.s1.r19$z.r12469.us.us.us.us.us.epil"
  %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.lcssa = phi <32 x i32> [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.lcssa.ph, %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us.unr-lcssa" ], [ %convolved394.sroa.0.0.vecblend759.us.us.us.us.us.epil, %"for sum_input.s1.r19$z.r12469.us.us.us.us.us.epil" ]
  %1635 = add nuw nsw i32 %"sum_input.s1.r19$x68.us.us.us.us.us", 1
  %.not447.us.us.us.us.us = icmp eq i32 %1635, %9
  br i1 %.not447.us.us.us.us.us, label %"end for sum_input.s1.r19$x67.loopexit.split.us.us.us.us.us", label %"for sum_input.s1.r19$x66.us.us.us.us.us"

"end for sum_input.s1.r19$x67.loopexit.split.us.us.us.us.us": ; preds = %"end for sum_input.s1.r19$z.r12470.loopexit.us.us.us.us.us"
  %1636 = add nuw nsw i32 %"sum_input.s1.r19$y65.us.us.us.us", 1
  %.not446.us.us.us.us = icmp eq i32 %1636, %11
  br i1 %.not446.us.us.us.us, label %"consume sum_input72.us.us", label %"for sum_input.s1.r19$y63.us.us.us.us"

"for convolved.s1.r19$y80.us.us.us":              ; preds = %"for convolved.s1.r19$y80.preheader.us.us", %"end for convolved.s1.r19$x84.loopexit.us.us.us"
  %sum_input254393.sroa.95.1.us.us.us = phi <32 x i32> [ %.us-phi1173.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.95.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.90.1.us.us.us = phi <32 x i32> [ %.us-phi1174.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.90.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.85.1.us.us.us = phi <32 x i32> [ %.us-phi1175.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.85.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.80.1.us.us.us = phi <32 x i32> [ %.us-phi1176.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.80.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.75.1.us.us.us = phi <32 x i32> [ %.us-phi1177.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.75.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.70.1.us.us.us = phi <32 x i32> [ %.us-phi1178.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.70.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.65.1.us.us.us = phi <32 x i32> [ %.us-phi1179.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.65.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.60.1.us.us.us = phi <32 x i32> [ %.us-phi1180.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.60.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.55.1.us.us.us = phi <32 x i32> [ %.us-phi1181.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.55.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.50.1.us.us.us = phi <32 x i32> [ %.us-phi1182.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.50.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.45.1.us.us.us = phi <32 x i32> [ %.us-phi1183.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.45.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.40.1.us.us.us = phi <32 x i32> [ %.us-phi1184.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.40.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.35.1.us.us.us = phi <32 x i32> [ %.us-phi1185.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.35.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.30.1.us.us.us = phi <32 x i32> [ %.us-phi1186.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.30.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.25.1.us.us.us = phi <32 x i32> [ %.us-phi1187.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.25.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %sum_input254393.sroa.0.1.us.us.us = phi <32 x i32> [ %.us-phi1188.us.us.us, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ %sum_input254393.sroa.0.0.us.us, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %"convolved.s1.r19$y82.us.us.us" = phi i32 [ %1641, %"end for convolved.s1.r19$x84.loopexit.us.us.us" ], [ 0, %"for convolved.s1.r19$y80.preheader.us.us" ]
  %1637 = mul nsw i32 %"convolved.s1.r19$y82.us.us.us", %dilation_y
  %1638 = add nsw i32 %1637, %1109
  %1639 = mul nsw i32 %1638, %19
  %t1011.us.us.us = add nsw i32 %1639, %1105
  %1640 = mul nsw i32 %"convolved.s1.r19$y82.us.us.us", %12
  br i1 %1078, label %"for convolved.s1.r19$x83.us.us.us.us", label %"end for convolved.s1.r19$x84.loopexit.us.us.us", !prof !96

"end for convolved.s1.r19$x84.loopexit.us.us.us": ; preds = %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us", %"for convolved.s1.r19$y80.us.us.us"
  %.us-phi1173.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.95.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1722, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1174.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.90.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1721, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1175.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.85.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1715, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1176.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.80.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1714, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1177.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.75.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1708, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1178.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.70.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1707, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1179.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.65.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1701, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1180.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.60.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1700, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1181.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.55.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1694, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1182.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.50.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1693, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1183.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.45.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1687, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1184.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.40.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1686, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1185.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.35.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1680, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1186.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.30.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1679, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1187.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.25.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1673, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %.us-phi1188.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ], [ %1667, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ]
  %1641 = add nuw nsw i32 %"convolved.s1.r19$y82.us.us.us", 1
  %.not443.us.us.us = icmp eq i32 %1641, %11
  br i1 %.not443.us.us.us, label %"consume convolved89.us.us", label %"for convolved.s1.r19$y80.us.us.us"

"for convolved.s1.r19$x83.us.us.us.us":           ; preds = %"for convolved.s1.r19$y80.us.us.us", %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us"
  %sum_input254393.sroa.95.2.us.us.us.us = phi <32 x i32> [ %1722, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.95.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.90.2.us.us.us.us = phi <32 x i32> [ %1721, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.90.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.85.2.us.us.us.us = phi <32 x i32> [ %1715, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.85.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.80.2.us.us.us.us = phi <32 x i32> [ %1714, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.80.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.75.2.us.us.us.us = phi <32 x i32> [ %1708, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.75.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.70.2.us.us.us.us = phi <32 x i32> [ %1707, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.70.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.65.2.us.us.us.us = phi <32 x i32> [ %1701, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.65.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.60.2.us.us.us.us = phi <32 x i32> [ %1700, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.60.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.55.2.us.us.us.us = phi <32 x i32> [ %1694, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.55.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.50.2.us.us.us.us = phi <32 x i32> [ %1693, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.50.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.45.2.us.us.us.us = phi <32 x i32> [ %1687, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.45.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.40.2.us.us.us.us = phi <32 x i32> [ %1686, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.40.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.35.2.us.us.us.us = phi <32 x i32> [ %1680, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.35.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.30.2.us.us.us.us = phi <32 x i32> [ %1679, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.30.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.25.2.us.us.us.us = phi <32 x i32> [ %1673, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.25.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %sum_input254393.sroa.0.2.us.us.us.us = phi <32 x i32> [ %1667, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ %sum_input254393.sroa.0.1.us.us.us, %"for convolved.s1.r19$y80.us.us.us" ]
  %"convolved.s1.r19$x85.us.us.us.us" = phi i32 [ %1724, %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us" ], [ 0, %"for convolved.s1.r19$y80.us.us.us" ]
  %1642 = mul nsw i32 %"convolved.s1.r19$x85.us.us.us.us", %dilation_x
  %t1024.s.us.us.us.us = add nsw i32 %1642, %1449
  %t1023.s.us.us.us.us = add nsw i32 %1642, %1451
  %t1022.s.us.us.us.us = add nsw i32 %1642, %1453
  %t1021.s.us.us.us.us = add nsw i32 %1642, %1455
  %t1020.s.us.us.us.us = add nsw i32 %1642, %1457
  %t1019.s.us.us.us.us = add nsw i32 %1642, %1459
  %t1018.s.us.us.us.us = add nsw i32 %1642, %1461
  %t1015.s.us.us.us.us = add nsw i32 %1642, %1462
  %1643 = mul nsw i32 %"convolved.s1.r19$x85.us.us.us.us", %10
  %t1016.us.us.us.us = add nsw i32 %1643, %1640
  %1644 = mul nsw i32 %t1015.s.us.us.us.us, %17
  %1645 = add i32 %t1016.us.us.us.us, %1418
  %1646 = mul nsw i32 %t1018.s.us.us.us.us, %17
  %1647 = mul nsw i32 %t1019.s.us.us.us.us, %17
  %1648 = mul nsw i32 %t1020.s.us.us.us.us, %17
  %1649 = mul nsw i32 %t1021.s.us.us.us.us, %17
  %1650 = mul nsw i32 %t1022.s.us.us.us.us, %17
  %1651 = mul nsw i32 %t1023.s.us.us.us.us, %17
  %1652 = mul nsw i32 %t1024.s.us.us.us.us, %17
  br label %"for convolved.s1.r19$z.r12486.us.us.us.us"

"for convolved.s1.r19$z.r12486.us.us.us.us":      ; preds = %"for convolved.s1.r19$z.r12486.us.us.us.us", %"for convolved.s1.r19$x83.us.us.us.us"
  %sum_input254393.sroa.95.4.us.us.us.us = phi <32 x i32> [ %1722, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.95.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.90.4.us.us.us.us = phi <32 x i32> [ %1721, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.90.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.85.4.us.us.us.us = phi <32 x i32> [ %1715, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.85.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.80.4.us.us.us.us = phi <32 x i32> [ %1714, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.80.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.75.4.us.us.us.us = phi <32 x i32> [ %1708, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.75.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.70.4.us.us.us.us = phi <32 x i32> [ %1707, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.70.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.65.4.us.us.us.us = phi <32 x i32> [ %1701, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.65.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.60.4.us.us.us.us = phi <32 x i32> [ %1700, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.60.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.55.4.us.us.us.us = phi <32 x i32> [ %1694, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.55.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.50.4.us.us.us.us = phi <32 x i32> [ %1693, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.50.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.45.4.us.us.us.us = phi <32 x i32> [ %1687, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.45.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.40.4.us.us.us.us = phi <32 x i32> [ %1686, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.40.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.35.4.us.us.us.us = phi <32 x i32> [ %1680, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.35.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.30.4.us.us.us.us = phi <32 x i32> [ %1679, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.30.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.25.4.us.us.us.us = phi <32 x i32> [ %1673, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.25.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %sum_input254393.sroa.0.4.us.us.us.us = phi <32 x i32> [ %1667, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ %sum_input254393.sroa.0.2.us.us.us.us, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %"convolved.s1.r19$z.r12488.us.us.us.us" = phi i32 [ %1723, %"for convolved.s1.r19$z.r12486.us.us.us.us" ], [ 0, %"for convolved.s1.r19$x83.us.us.us.us" ]
  %1653 = shl nsw i32 %"convolved.s1.r19$z.r12488.us.us.us.us", 6
  %1654 = add nsw i32 %1653, %1419
  %1655 = shl nsw i32 %1654, 1
  %1656 = add nsw i32 %t1016.us.us.us.us, %1655
  %1657 = getelementptr inbounds i8, i8* %5, i32 %1656
  %1658 = bitcast i8* %1657 to <32 x i32>*
  %1659 = load <32 x i32>, <32 x i32>* %1658, align 128, !tbaa !106
  %1660 = shl nsw i32 %"convolved.s1.r19$z.r12488.us.us.us.us", 2
  %1661 = add i32 %1660, %t1011.us.us.us
  %1662 = add i32 %1661, %1644
  %1663 = getelementptr inbounds i8, i8* %13, i32 %1662
  %1664 = bitcast i8* %1663 to <1 x i32>*
  %1665 = load <1 x i32>, <1 x i32>* %1664, align 4, !tbaa !110
  %1666 = extractelement <1 x i32> %1665, i64 0
  %1667 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.0.4.us.us.us.us, <32 x i32> %1659, i32 %1666) #11
  %1668 = shl nsw i32 %"convolved.s1.r19$z.r12488.us.us.us.us", 7
  %1669 = add i32 %1645, %1668
  %1670 = getelementptr inbounds i8, i8* %5, i32 %1669
  %1671 = bitcast i8* %1670 to <32 x i32>*
  %1672 = load <32 x i32>, <32 x i32>* %1671, align 128, !tbaa !106
  %1673 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.25.4.us.us.us.us, <32 x i32> %1672, i32 %1666) #11
  %1674 = add i32 %1661, %1646
  %1675 = getelementptr inbounds i8, i8* %13, i32 %1674
  %1676 = bitcast i8* %1675 to <1 x i32>*
  %1677 = load <1 x i32>, <1 x i32>* %1676, align 4, !tbaa !110
  %1678 = extractelement <1 x i32> %1677, i64 0
  %1679 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.30.4.us.us.us.us, <32 x i32> %1659, i32 %1678) #11
  %1680 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.35.4.us.us.us.us, <32 x i32> %1672, i32 %1678) #11
  %1681 = add i32 %1661, %1647
  %1682 = getelementptr inbounds i8, i8* %13, i32 %1681
  %1683 = bitcast i8* %1682 to <1 x i32>*
  %1684 = load <1 x i32>, <1 x i32>* %1683, align 4, !tbaa !110
  %1685 = extractelement <1 x i32> %1684, i64 0
  %1686 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.40.4.us.us.us.us, <32 x i32> %1659, i32 %1685) #11
  %1687 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.45.4.us.us.us.us, <32 x i32> %1672, i32 %1685) #11
  %1688 = add i32 %1661, %1648
  %1689 = getelementptr inbounds i8, i8* %13, i32 %1688
  %1690 = bitcast i8* %1689 to <1 x i32>*
  %1691 = load <1 x i32>, <1 x i32>* %1690, align 4, !tbaa !110
  %1692 = extractelement <1 x i32> %1691, i64 0
  %1693 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.50.4.us.us.us.us, <32 x i32> %1659, i32 %1692) #11
  %1694 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.55.4.us.us.us.us, <32 x i32> %1672, i32 %1692) #11
  %1695 = add i32 %1661, %1649
  %1696 = getelementptr inbounds i8, i8* %13, i32 %1695
  %1697 = bitcast i8* %1696 to <1 x i32>*
  %1698 = load <1 x i32>, <1 x i32>* %1697, align 4, !tbaa !110
  %1699 = extractelement <1 x i32> %1698, i64 0
  %1700 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.60.4.us.us.us.us, <32 x i32> %1659, i32 %1699) #11
  %1701 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.65.4.us.us.us.us, <32 x i32> %1672, i32 %1699) #11
  %1702 = add i32 %1661, %1650
  %1703 = getelementptr inbounds i8, i8* %13, i32 %1702
  %1704 = bitcast i8* %1703 to <1 x i32>*
  %1705 = load <1 x i32>, <1 x i32>* %1704, align 4, !tbaa !110
  %1706 = extractelement <1 x i32> %1705, i64 0
  %1707 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.70.4.us.us.us.us, <32 x i32> %1659, i32 %1706) #11
  %1708 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.75.4.us.us.us.us, <32 x i32> %1672, i32 %1706) #11
  %1709 = add i32 %1661, %1651
  %1710 = getelementptr inbounds i8, i8* %13, i32 %1709
  %1711 = bitcast i8* %1710 to <1 x i32>*
  %1712 = load <1 x i32>, <1 x i32>* %1711, align 4, !tbaa !110
  %1713 = extractelement <1 x i32> %1712, i64 0
  %1714 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.80.4.us.us.us.us, <32 x i32> %1659, i32 %1713) #11
  %1715 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.85.4.us.us.us.us, <32 x i32> %1672, i32 %1713) #11
  %1716 = add i32 %1661, %1652
  %1717 = getelementptr inbounds i8, i8* %13, i32 %1716
  %1718 = bitcast i8* %1717 to <1 x i32>*
  %1719 = load <1 x i32>, <1 x i32>* %1718, align 4, !tbaa !110
  %1720 = extractelement <1 x i32> %1719, i64 0
  %1721 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.90.4.us.us.us.us, <32 x i32> %1659, i32 %1720) #11
  %1722 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %sum_input254393.sroa.95.4.us.us.us.us, <32 x i32> %1672, i32 %1720) #11
  %1723 = add nuw nsw i32 %"convolved.s1.r19$z.r12488.us.us.us.us", 1
  %.not445.us.us.us.us = icmp eq i32 %1723, %7
  br i1 %.not445.us.us.us.us, label %"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r12486.us.us.us.us"

"end for convolved.s1.r19$z.r12487.loopexit.us.us.us.us": ; preds = %"for convolved.s1.r19$z.r12486.us.us.us.us"
  %1724 = add nuw nsw i32 %"convolved.s1.r19$x85.us.us.us.us", 1
  %.not444.us.us.us.us = icmp eq i32 %1724, %9
  br i1 %.not444.us.us.us.us, label %"end for convolved.s1.r19$x84.loopexit.us.us.us", label %"for convolved.s1.r19$x83.us.us.us.us"

next_bb38:                                        ; preds = %next_bb5
  br i1 %96, label %then_bb114, label %next_bb115

then_bb114:                                       ; preds = %next_bb38
  %1725 = mul nsw i32 %19, %18
  %1726 = mul nsw i32 %22, %20
  %1727 = mul nsw i32 %17, %16
  %1728 = add i32 %1726, %1725
  %t1037 = add i32 %1728, %1727
  %1729 = icmp sgt i32 %21, 0
  br i1 %1729, label %"for output.s0.b.rebased116.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased116.preheader":           ; preds = %then_bb114
  %1730 = mul nsw i32 %17, %stride_x
  %1731 = mul nsw i32 %1730, 7
  %1732 = mul nsw i32 %1730, 6
  %1733 = mul nsw i32 %1730, 5
  %1734 = shl nsw i32 %1730, 2
  %1735 = mul nsw i32 %1730, 3
  %1736 = shl nsw i32 %1730, 1
  %1737 = sub nsw i32 %stride_x, %16
  %1738 = mul nsw i32 %1737, %17
  %1739 = icmp sgt i32 %29, 0
  %.neg895 = mul i32 %30, %28
  %.neg896 = mul i32 %27, %25
  %.neg897 = mul i32 %31, %20
  %reass.add899 = add i32 %.neg895, %.neg896
  %reass.add900 = add i32 %reass.add899, %.neg897
  %1740 = add nuw nsw i32 %26, 7
  %1741 = ashr i32 %1740, 3
  %b16 = add nsw i32 %26, -8
  %1742 = icmp sgt i32 %11, 0
  %1743 = icmp sgt i32 %9, 0
  %1744 = icmp sgt i32 %7, 0
  %1745 = ashr i32 %4, 5
  %1746 = icmp sgt i32 %4, 31
  %1747 = insertelement <32 x i32> undef, i32 %output_multiplier, i32 0
  %1748 = shufflevector <32 x i32> %1747, <32 x i32> undef, <32 x i32> zeroinitializer
  %1749 = icmp sgt i32 %output_shift, 0
  %1750 = select i1 %1749, <32 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <32 x i32> zeroinitializer
  %1751 = add nsw i32 %output_shift, -1
  %1752 = zext i8 %output_zero to i16
  %1753 = insertelement <32 x i16> undef, i16 %1752, i32 0
  %1754 = shufflevector <32 x i16> %1753, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1755 = bitcast <64 x i16> %1754 to <32 x i32>
  %1756 = insertelement <32 x i8> undef, i8 %output_max, i32 0
  %1757 = shufflevector <32 x i8> %1756, <32 x i8> undef, <128 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1758 = bitcast <128 x i8> %1757 to <32 x i32>
  %1759 = insertelement <32 x i8> undef, i8 %output_min, i32 0
  %1760 = shufflevector <32 x i8> %1759, <32 x i8> undef, <128 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1761 = bitcast <128 x i8> %1760 to <32 x i32>
  br i1 %1739, label %"for output.s0.b.rebased116.us.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased116.us.preheader":        ; preds = %"for output.s0.b.rebased116.preheader"
  %1762 = add i32 %1727, %1725
  %1763 = add i32 %7, -1
  %1764 = add i32 %9, -1
  %brmerge1441.demorgan = and i1 %1743, %1744
  %xtraiter1652 = and i32 %7, 1
  %1765 = icmp eq i32 %1763, 0
  %unroll_iter1654 = and i32 %7, -2
  %lcmp.mod1653.not = icmp eq i32 %xtraiter1652, 0
  %xtraiter1656 = and i32 %9, 7
  %1766 = icmp ult i32 %1764, 7
  %unroll_iter1660 = and i32 %9, -8
  %lcmp.mod1658.not = icmp eq i32 %xtraiter1656, 0
  %xtraiter1662 = and i32 %7, 1
  %1767 = icmp eq i32 %1763, 0
  %unroll_iter1664 = and i32 %7, -2
  %lcmp.mod1663.not = icmp eq i32 %xtraiter1662, 0
  br label %"for output.s0.b.rebased116.us"

"for output.s0.b.rebased116.us":                  ; preds = %"for output.s0.b.rebased116.us.preheader", %"end for output.s0.y.rebased120.loopexit.us"
  %sum_input254393.sroa.0.7.us = phi <32 x i32> [ %.us-phi1160.us, %"end for output.s0.y.rebased120.loopexit.us" ], [ undef, %"for output.s0.b.rebased116.us.preheader" ]
  %output.s0.b.rebased118.us = phi i32 [ %1774, %"end for output.s0.y.rebased120.loopexit.us" ], [ 0, %"for output.s0.b.rebased116.us.preheader" ]
  %1768 = add nsw i32 %output.s0.b.rebased118.us, %20
  %1769 = mul nsw i32 %1768, %31
  %1770 = sub i32 %1769, %reass.add900
  %1771 = mul nsw i32 %1768, %22
  %1772 = sub i32 %1771, %1728
  %1773 = sub nsw i32 %1771, %t1037
  br i1 %98, label %"for output.s0.y.rebased119.us.us", label %"end for output.s0.y.rebased120.loopexit.us", !prof !96

"end for output.s0.y.rebased120.loopexit.us":     ; preds = %"end for output.s0.x.xo123.loopexit.us.us", %"for output.s0.b.rebased116.us"
  %.us-phi1160.us = phi <32 x i32> [ %sum_input254393.sroa.0.7.us, %"for output.s0.b.rebased116.us" ], [ %sum_input254393.sroa.0.20.us.us, %"end for output.s0.x.xo123.loopexit.us.us" ]
  %1774 = add nuw nsw i32 %output.s0.b.rebased118.us, 1
  %.not427.us = icmp eq i32 %1774, %21
  br i1 %.not427.us, label %after_bb3, label %"for output.s0.b.rebased116.us"

"for output.s0.y.rebased119.us.us":               ; preds = %"for output.s0.b.rebased116.us", %"end for output.s0.x.xo123.loopexit.us.us"
  %sum_input254393.sroa.0.8.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.20.us.us, %"end for output.s0.x.xo123.loopexit.us.us" ], [ %sum_input254393.sroa.0.7.us, %"for output.s0.b.rebased116.us" ]
  %output.s0.y.rebased121.us.us = phi i32 [ %2102, %"end for output.s0.x.xo123.loopexit.us.us" ], [ 0, %"for output.s0.b.rebased116.us" ]
  %1775 = add nsw i32 %output.s0.y.rebased121.us.us, %28
  %1776 = mul nsw i32 %1775, %30
  %t1066.us.us = add i32 %1770, %1776
  %1777 = mul nsw i32 %1775, %stride_y
  br label %"for output.s0.x.xo122.us.us"

"for output.s0.x.xo122.us.us":                    ; preds = %"end for output.s0.c.co151.us.us", %"for output.s0.y.rebased119.us.us"
  %sum_input254393.sroa.0.10.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.20.us.us, %"end for output.s0.c.co151.us.us" ], [ %sum_input254393.sroa.0.8.us.us, %"for output.s0.y.rebased119.us.us" ]
  %output.s0.x.xo124.us.us = phi i32 [ %2045, %"end for output.s0.c.co151.us.us" ], [ 0, %"for output.s0.y.rebased119.us.us" ]
  %a14.us.us = shl nsw i32 %output.s0.x.xo124.us.us, 3
  %1778 = icmp slt i32 %a14.us.us, %b16
  %output.s0.x.x.base.s125.us.us = select i1 %1778, i32 %a14.us.us, i32 %b16
  br i1 %t843.not, label %"consume sum_input149.us.us", label %then_bb129.us.us

then_bb129.us.us:                                 ; preds = %"for output.s0.x.xo122.us.us"
  %sum_input254393.sroa.0.0.vecblend.us.us = shufflevector <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, <32 x i32> %sum_input254393.sroa.0.10.us.us, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  br i1 %t844, label %then_bb132.us.us, label %next_bb133.us.us

next_bb133.us.us:                                 ; preds = %then_bb129.us.us
  br i1 %1742, label %"for sum_input.s1.r19$y140.preheader.us.us", label %"consume sum_input149.us.us", !prof !96

then_bb132.us.us:                                 ; preds = %then_bb129.us.us
  br i1 %1742, label %"for sum_input.s1.r19$y134.preheader.us.us", label %"consume sum_input149.us.us", !prof !96

"for sum_input.s1.r19$y134.us.us":                ; preds = %"for sum_input.s1.r19$y134.preheader.us.us", %"end for sum_input.s1.r19$x138.us.us"
  %sum_input254393.sroa.0.12.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.14.us.us, %"end for sum_input.s1.r19$x138.us.us" ], [ %sum_input254393.sroa.0.0.vecblend.us.us, %"for sum_input.s1.r19$y134.preheader.us.us" ]
  %"sum_input.s1.r19$y136.us.us" = phi i32 [ %1869, %"end for sum_input.s1.r19$x138.us.us" ], [ 0, %"for sum_input.s1.r19$y134.preheader.us.us" ]
  br i1 %1743, label %"for sum_input.s1.r19$x137.preheader.us.us", label %"end for sum_input.s1.r19$x138.us.us", !prof !96

"for sum_input.s1.r19$x137.us.us":                ; preds = %"for sum_input.s1.r19$x137.preheader.us.us", %"for sum_input.s1.r19$x137.us.us"
  %sum_input254393.sroa.0.13.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.vecblend825.us.us.7, %"for sum_input.s1.r19$x137.us.us" ], [ %sum_input254393.sroa.0.12.us.us, %"for sum_input.s1.r19$x137.preheader.us.us" ]
  %"sum_input.s1.r19$x139.us.us" = phi i32 [ %1858, %"for sum_input.s1.r19$x137.us.us" ], [ 0, %"for sum_input.s1.r19$x137.preheader.us.us" ]
  %niter1661 = phi i32 [ %niter1661.nsub.7, %"for sum_input.s1.r19$x137.us.us" ], [ %unroll_iter1660, %"for sum_input.s1.r19$x137.preheader.us.us" ]
  %1779 = mul nsw i32 %"sum_input.s1.r19$x139.us.us", %dilation_x
  %reass.add905.us.us = add i32 %2099, %1779
  %reass.mul906.us.us = shl i32 %reass.add905.us.us, 2
  %1780 = add i32 %t1069.us.us, %reass.mul906.us.us
  %1781 = getelementptr inbounds i8, i8* %13, i32 %1780
  %1782 = bitcast i8* %1781 to <32 x i8>*
  %1783 = load <32 x i8>, <32 x i8>* %1782, align 4, !tbaa !110
  %1784 = shufflevector <32 x i32> %sum_input254393.sroa.0.13.us.us, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1785 = shufflevector <32 x i8> %1783, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1786 = bitcast <128 x i8> %1785 to <32 x i32>
  %1787 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1784, <32 x i32> %1786, i32 16843009) #11
  %1788 = or i32 %"sum_input.s1.r19$x139.us.us", 1
  %1789 = mul nsw i32 %1788, %dilation_x
  %reass.add905.us.us.1 = add i32 %2099, %1789
  %reass.mul906.us.us.1 = shl i32 %reass.add905.us.us.1, 2
  %1790 = add i32 %t1069.us.us, %reass.mul906.us.us.1
  %1791 = getelementptr inbounds i8, i8* %13, i32 %1790
  %1792 = bitcast i8* %1791 to <32 x i8>*
  %1793 = load <32 x i8>, <32 x i8>* %1792, align 4, !tbaa !110
  %1794 = shufflevector <32 x i32> %1787, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1795 = shufflevector <32 x i8> %1793, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1796 = bitcast <128 x i8> %1795 to <32 x i32>
  %1797 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1794, <32 x i32> %1796, i32 16843009) #11
  %1798 = or i32 %"sum_input.s1.r19$x139.us.us", 2
  %1799 = mul nsw i32 %1798, %dilation_x
  %reass.add905.us.us.2 = add i32 %2099, %1799
  %reass.mul906.us.us.2 = shl i32 %reass.add905.us.us.2, 2
  %1800 = add i32 %t1069.us.us, %reass.mul906.us.us.2
  %1801 = getelementptr inbounds i8, i8* %13, i32 %1800
  %1802 = bitcast i8* %1801 to <32 x i8>*
  %1803 = load <32 x i8>, <32 x i8>* %1802, align 4, !tbaa !110
  %1804 = shufflevector <32 x i32> %1797, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1805 = shufflevector <32 x i8> %1803, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1806 = bitcast <128 x i8> %1805 to <32 x i32>
  %1807 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1804, <32 x i32> %1806, i32 16843009) #11
  %1808 = or i32 %"sum_input.s1.r19$x139.us.us", 3
  %1809 = mul nsw i32 %1808, %dilation_x
  %reass.add905.us.us.3 = add i32 %2099, %1809
  %reass.mul906.us.us.3 = shl i32 %reass.add905.us.us.3, 2
  %1810 = add i32 %t1069.us.us, %reass.mul906.us.us.3
  %1811 = getelementptr inbounds i8, i8* %13, i32 %1810
  %1812 = bitcast i8* %1811 to <32 x i8>*
  %1813 = load <32 x i8>, <32 x i8>* %1812, align 4, !tbaa !110
  %1814 = shufflevector <32 x i32> %1807, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1815 = shufflevector <32 x i8> %1813, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1816 = bitcast <128 x i8> %1815 to <32 x i32>
  %1817 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1814, <32 x i32> %1816, i32 16843009) #11
  %1818 = or i32 %"sum_input.s1.r19$x139.us.us", 4
  %1819 = mul nsw i32 %1818, %dilation_x
  %reass.add905.us.us.4 = add i32 %2099, %1819
  %reass.mul906.us.us.4 = shl i32 %reass.add905.us.us.4, 2
  %1820 = add i32 %t1069.us.us, %reass.mul906.us.us.4
  %1821 = getelementptr inbounds i8, i8* %13, i32 %1820
  %1822 = bitcast i8* %1821 to <32 x i8>*
  %1823 = load <32 x i8>, <32 x i8>* %1822, align 4, !tbaa !110
  %1824 = shufflevector <32 x i32> %1817, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1825 = shufflevector <32 x i8> %1823, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1826 = bitcast <128 x i8> %1825 to <32 x i32>
  %1827 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1824, <32 x i32> %1826, i32 16843009) #11
  %1828 = or i32 %"sum_input.s1.r19$x139.us.us", 5
  %1829 = mul nsw i32 %1828, %dilation_x
  %reass.add905.us.us.5 = add i32 %2099, %1829
  %reass.mul906.us.us.5 = shl i32 %reass.add905.us.us.5, 2
  %1830 = add i32 %t1069.us.us, %reass.mul906.us.us.5
  %1831 = getelementptr inbounds i8, i8* %13, i32 %1830
  %1832 = bitcast i8* %1831 to <32 x i8>*
  %1833 = load <32 x i8>, <32 x i8>* %1832, align 4, !tbaa !110
  %1834 = shufflevector <32 x i32> %1827, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1835 = shufflevector <32 x i8> %1833, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1836 = bitcast <128 x i8> %1835 to <32 x i32>
  %1837 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1834, <32 x i32> %1836, i32 16843009) #11
  %1838 = or i32 %"sum_input.s1.r19$x139.us.us", 6
  %1839 = mul nsw i32 %1838, %dilation_x
  %reass.add905.us.us.6 = add i32 %2099, %1839
  %reass.mul906.us.us.6 = shl i32 %reass.add905.us.us.6, 2
  %1840 = add i32 %t1069.us.us, %reass.mul906.us.us.6
  %1841 = getelementptr inbounds i8, i8* %13, i32 %1840
  %1842 = bitcast i8* %1841 to <32 x i8>*
  %1843 = load <32 x i8>, <32 x i8>* %1842, align 4, !tbaa !110
  %1844 = shufflevector <32 x i32> %1837, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1845 = shufflevector <32 x i8> %1843, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1846 = bitcast <128 x i8> %1845 to <32 x i32>
  %1847 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1844, <32 x i32> %1846, i32 16843009) #11
  %1848 = or i32 %"sum_input.s1.r19$x139.us.us", 7
  %1849 = mul nsw i32 %1848, %dilation_x
  %reass.add905.us.us.7 = add i32 %2099, %1849
  %reass.mul906.us.us.7 = shl i32 %reass.add905.us.us.7, 2
  %1850 = add i32 %t1069.us.us, %reass.mul906.us.us.7
  %1851 = getelementptr inbounds i8, i8* %13, i32 %1850
  %1852 = bitcast i8* %1851 to <32 x i8>*
  %1853 = load <32 x i8>, <32 x i8>* %1852, align 4, !tbaa !110
  %1854 = shufflevector <32 x i32> %1847, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1855 = shufflevector <32 x i8> %1853, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1856 = bitcast <128 x i8> %1855 to <32 x i32>
  %1857 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1854, <32 x i32> %1856, i32 16843009) #11
  %sum_input254393.sroa.0.0.vecblend825.us.us.7 = shufflevector <32 x i32> %1857, <32 x i32> %sum_input254393.sroa.0.13.us.us, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1858 = add nuw nsw i32 %"sum_input.s1.r19$x139.us.us", 8
  %niter1661.nsub.7 = add i32 %niter1661, -8
  %niter1661.ncmp.7 = icmp eq i32 %niter1661.nsub.7, 0
  br i1 %niter1661.ncmp.7, label %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x137.us.us"

"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa": ; preds = %"for sum_input.s1.r19$x137.us.us", %"for sum_input.s1.r19$x137.preheader.us.us"
  %sum_input254393.sroa.0.0.vecblend825.us.us.lcssa.ph = phi <32 x i32> [ undef, %"for sum_input.s1.r19$x137.preheader.us.us" ], [ %sum_input254393.sroa.0.0.vecblend825.us.us.7, %"for sum_input.s1.r19$x137.us.us" ]
  %sum_input254393.sroa.0.13.us.us.unr = phi <32 x i32> [ %sum_input254393.sroa.0.12.us.us, %"for sum_input.s1.r19$x137.preheader.us.us" ], [ %sum_input254393.sroa.0.0.vecblend825.us.us.7, %"for sum_input.s1.r19$x137.us.us" ]
  %"sum_input.s1.r19$x139.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x137.preheader.us.us" ], [ %1858, %"for sum_input.s1.r19$x137.us.us" ]
  br i1 %lcmp.mod1658.not, label %"end for sum_input.s1.r19$x138.us.us", label %"for sum_input.s1.r19$x137.us.us.epil"

"for sum_input.s1.r19$x137.us.us.epil":           ; preds = %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x137.us.us.epil"
  %sum_input254393.sroa.0.13.us.us.epil = phi <32 x i32> [ %sum_input254393.sroa.0.0.vecblend825.us.us.epil, %"for sum_input.s1.r19$x137.us.us.epil" ], [ %sum_input254393.sroa.0.13.us.us.unr, %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa" ]
  %"sum_input.s1.r19$x139.us.us.epil" = phi i32 [ %1868, %"for sum_input.s1.r19$x137.us.us.epil" ], [ %"sum_input.s1.r19$x139.us.us.unr", %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa" ]
  %epil.iter1657 = phi i32 [ %epil.iter1657.sub, %"for sum_input.s1.r19$x137.us.us.epil" ], [ %xtraiter1656, %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa" ]
  %1859 = mul nsw i32 %"sum_input.s1.r19$x139.us.us.epil", %dilation_x
  %reass.add905.us.us.epil = add i32 %2099, %1859
  %reass.mul906.us.us.epil = shl i32 %reass.add905.us.us.epil, 2
  %1860 = add i32 %t1069.us.us, %reass.mul906.us.us.epil
  %1861 = getelementptr inbounds i8, i8* %13, i32 %1860
  %1862 = bitcast i8* %1861 to <32 x i8>*
  %1863 = load <32 x i8>, <32 x i8>* %1862, align 4, !tbaa !110
  %1864 = shufflevector <32 x i32> %sum_input254393.sroa.0.13.us.us.epil, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1865 = shufflevector <32 x i8> %1863, <32 x i8> undef, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %1866 = bitcast <128 x i8> %1865 to <32 x i32>
  %1867 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %1864, <32 x i32> %1866, i32 16843009) #11
  %sum_input254393.sroa.0.0.vecblend825.us.us.epil = shufflevector <32 x i32> %1867, <32 x i32> %sum_input254393.sroa.0.13.us.us.epil, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1868 = add nuw nsw i32 %"sum_input.s1.r19$x139.us.us.epil", 1
  %epil.iter1657.sub = add i32 %epil.iter1657, -1
  %epil.iter1657.cmp.not = icmp eq i32 %epil.iter1657.sub, 0
  br i1 %epil.iter1657.cmp.not, label %"end for sum_input.s1.r19$x138.us.us", label %"for sum_input.s1.r19$x137.us.us.epil", !llvm.loop !117

"end for sum_input.s1.r19$x138.us.us":            ; preds = %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x137.us.us.epil", %"for sum_input.s1.r19$y134.us.us"
  %sum_input254393.sroa.0.14.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.12.us.us, %"for sum_input.s1.r19$y134.us.us" ], [ %sum_input254393.sroa.0.0.vecblend825.us.us.lcssa.ph, %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa" ], [ %sum_input254393.sroa.0.0.vecblend825.us.us.epil, %"for sum_input.s1.r19$x137.us.us.epil" ]
  %1869 = add nuw nsw i32 %"sum_input.s1.r19$y136.us.us", 1
  %.not437.us.us = icmp eq i32 %1869, %11
  br i1 %.not437.us.us, label %"consume sum_input149.us.us", label %"for sum_input.s1.r19$y134.us.us"

"consume sum_input149.us.us":                     ; preds = %"end for sum_input.s1.r19$x144.loopexit.split.us.us.us.us.us", %"end for sum_input.s1.r19$x138.us.us", %"for sum_input.s1.r19$y140.preheader.us.us", %then_bb132.us.us, %next_bb133.us.us, %"for output.s0.x.xo122.us.us"
  %sum_input254393.sroa.0.20.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.10.us.us, %"for output.s0.x.xo122.us.us" ], [ %sum_input254393.sroa.0.0.vecblend.us.us, %then_bb132.us.us ], [ %sum_input254393.sroa.0.0.vecblend.us.us, %next_bb133.us.us ], [ %sum_input254393.sroa.0.0.vecblend.us.us, %"for sum_input.s1.r19$y140.preheader.us.us" ], [ %sum_input254393.sroa.0.14.us.us, %"end for sum_input.s1.r19$x138.us.us" ], [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.lcssa, %"end for sum_input.s1.r19$x144.loopexit.split.us.us.us.us.us" ]
  br i1 %1746, label %"for output.s0.c.co150.preheader.us.us", label %"end for output.s0.c.co151.us.us", !prof !96

"for output.s0.c.co150.us.us":                    ; preds = %"for output.s0.c.co150.preheader.us.us", %"consume convolved166.us.us"
  %output.s0.c.co152.us.us = phi i32 [ %2044, %"consume convolved166.us.us" ], [ 0, %"for output.s0.c.co150.preheader.us.us" ]
  %1870 = shl nsw i32 %output.s0.c.co152.us.us, 5
  %1871 = getelementptr inbounds i32, i32* %offset_c, i32 %1870
  %1872 = bitcast i32* %1871 to <32 x i32>*
  %1873 = load <32 x i32>, <32 x i32>* %1872, align 128, !tbaa !104
  br i1 %t843.not, label %after_bb154.us.us, label %next_bb156.us.us

next_bb156.us.us:                                 ; preds = %"for output.s0.c.co150.us.us"
  %1874 = sub nsw <32 x i32> %1873, %2052
  %1875 = sub nsw <32 x i32> %1873, %2055
  %1876 = sub nsw <32 x i32> %1873, %2058
  %1877 = sub nsw <32 x i32> %1873, %2061
  %1878 = sub nsw <32 x i32> %1873, %2064
  %1879 = sub nsw <32 x i32> %1873, %2067
  %1880 = sub nsw <32 x i32> %1873, %2070
  %1881 = sub nsw <32 x i32> %1873, %2073
  br label %after_bb154.us.us

after_bb154.us.us:                                ; preds = %"for output.s0.c.co150.us.us", %next_bb156.us.us
  %convolved394.sroa.123.7.us.us = phi <32 x i32> [ %1881, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  %convolved394.sroa.113.7.us.us = phi <32 x i32> [ %1880, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  %convolved394.sroa.103.7.us.us = phi <32 x i32> [ %1879, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  %convolved394.sroa.93.7.us.us = phi <32 x i32> [ %1878, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  %convolved394.sroa.78.7.us.us = phi <32 x i32> [ %1877, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  %convolved394.sroa.63.7.us.us = phi <32 x i32> [ %1876, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  %convolved394.sroa.48.7.us.us = phi <32 x i32> [ %1875, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  %convolved394.sroa.0.21.us.us = phi <32 x i32> [ %1874, %next_bb156.us.us ], [ %1873, %"for output.s0.c.co150.us.us" ]
  br i1 %1742, label %"for convolved.s1.r19$y157.preheader.us.us", label %"consume convolved166.us.us", !prof !96

"consume convolved166.us.us":                     ; preds = %"end for convolved.s1.r19$x161.loopexit.us.us.us", %"for convolved.s1.r19$y157.preheader.us.us", %after_bb154.us.us
  %convolved394.sroa.123.13.us.us = phi <32 x i32> [ %convolved394.sroa.123.7.us.us, %after_bb154.us.us ], [ %convolved394.sroa.123.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1123.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %convolved394.sroa.113.13.us.us = phi <32 x i32> [ %convolved394.sroa.113.7.us.us, %after_bb154.us.us ], [ %convolved394.sroa.113.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1124.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %convolved394.sroa.103.13.us.us = phi <32 x i32> [ %convolved394.sroa.103.7.us.us, %after_bb154.us.us ], [ %convolved394.sroa.103.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1125.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %convolved394.sroa.93.13.us.us = phi <32 x i32> [ %convolved394.sroa.93.7.us.us, %after_bb154.us.us ], [ %convolved394.sroa.93.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1126.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %convolved394.sroa.78.13.us.us = phi <32 x i32> [ %convolved394.sroa.78.7.us.us, %after_bb154.us.us ], [ %convolved394.sroa.78.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1127.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %convolved394.sroa.63.13.us.us = phi <32 x i32> [ %convolved394.sroa.63.7.us.us, %after_bb154.us.us ], [ %convolved394.sroa.63.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1128.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %convolved394.sroa.48.13.us.us = phi <32 x i32> [ %convolved394.sroa.48.7.us.us, %after_bb154.us.us ], [ %convolved394.sroa.48.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1129.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %convolved394.sroa.0.27.us.us = phi <32 x i32> [ %convolved394.sroa.0.21.us.us, %after_bb154.us.us ], [ %convolved394.sroa.0.21.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ], [ %.us-phi1130.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ]
  %ab1.i643.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.0.27.us.us, <32 x i32> %1748) #11
  %ab.i644.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i643.us.us, <32 x i32> %convolved394.sroa.0.27.us.us, <32 x i32> %1748) #11
  %1882 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i644.us.us, i32 %output_shift) #11
  %1883 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i644.us.us, i32 %1751) #11
  %1884 = and <32 x i32> %1883, %1750
  %1885 = add nsw <32 x i32> %1884, %1882
  %1886 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1885)
  %1887 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1886) #11
  %1888 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1886) #11
  %1889 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1888, <32 x i32> %1887) #11
  %1890 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1889, <32 x i32> %1755) #11
  %1891 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1890)
  %1892 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1891) #11
  %1893 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1891) #11
  %1894 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1892, <32 x i32> %1893) #11
  %1895 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1894, <32 x i32> %1758) #11
  %1896 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1895, <32 x i32> %1761) #11
  %1897 = bitcast <32 x i32> %1896 to <128 x i8>
  %1898 = shufflevector <128 x i8> %1897, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1899 = shl nsw i32 %output.s0.c.co152.us.us, 5
  %1900 = add i32 %1899, %t1066.us.us
  %1901 = add i32 %1900, %2090
  %1902 = getelementptr inbounds i8, i8* %23, i32 %1901
  %1903 = bitcast i8* %1902 to <32 x i8>*
  store <32 x i8> %1898, <32 x i8>* %1903, align 1, !tbaa !113
  %ab1.i645.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.48.13.us.us, <32 x i32> %1748) #11
  %ab.i646.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i645.us.us, <32 x i32> %convolved394.sroa.48.13.us.us, <32 x i32> %1748) #11
  %1904 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i646.us.us, i32 %output_shift) #11
  %1905 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i646.us.us, i32 %1751) #11
  %1906 = and <32 x i32> %1905, %1750
  %1907 = add nsw <32 x i32> %1906, %1904
  %1908 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1907)
  %1909 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1908) #11
  %1910 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1908) #11
  %1911 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1910, <32 x i32> %1909) #11
  %1912 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1911, <32 x i32> %1755) #11
  %1913 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1912)
  %1914 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1913) #11
  %1915 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1913) #11
  %1916 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1914, <32 x i32> %1915) #11
  %1917 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1916, <32 x i32> %1758) #11
  %1918 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1917, <32 x i32> %1761) #11
  %1919 = bitcast <32 x i32> %1918 to <128 x i8>
  %1920 = shufflevector <128 x i8> %1919, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1921 = add i32 %1900, %2091
  %1922 = getelementptr inbounds i8, i8* %23, i32 %1921
  %1923 = bitcast i8* %1922 to <32 x i8>*
  store <32 x i8> %1920, <32 x i8>* %1923, align 1, !tbaa !113
  %ab1.i647.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.63.13.us.us, <32 x i32> %1748) #11
  %ab.i648.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i647.us.us, <32 x i32> %convolved394.sroa.63.13.us.us, <32 x i32> %1748) #11
  %1924 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i648.us.us, i32 %output_shift) #11
  %1925 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i648.us.us, i32 %1751) #11
  %1926 = and <32 x i32> %1925, %1750
  %1927 = add nsw <32 x i32> %1926, %1924
  %1928 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1927)
  %1929 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1928) #11
  %1930 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1928) #11
  %1931 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1930, <32 x i32> %1929) #11
  %1932 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1931, <32 x i32> %1755) #11
  %1933 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1932)
  %1934 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1933) #11
  %1935 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1933) #11
  %1936 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1934, <32 x i32> %1935) #11
  %1937 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1936, <32 x i32> %1758) #11
  %1938 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1937, <32 x i32> %1761) #11
  %1939 = bitcast <32 x i32> %1938 to <128 x i8>
  %1940 = shufflevector <128 x i8> %1939, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1941 = add i32 %1900, %2092
  %1942 = getelementptr inbounds i8, i8* %23, i32 %1941
  %1943 = bitcast i8* %1942 to <32 x i8>*
  store <32 x i8> %1940, <32 x i8>* %1943, align 1, !tbaa !113
  %ab1.i649.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.78.13.us.us, <32 x i32> %1748) #11
  %ab.i650.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i649.us.us, <32 x i32> %convolved394.sroa.78.13.us.us, <32 x i32> %1748) #11
  %1944 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i650.us.us, i32 %output_shift) #11
  %1945 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i650.us.us, i32 %1751) #11
  %1946 = and <32 x i32> %1945, %1750
  %1947 = add nsw <32 x i32> %1946, %1944
  %1948 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1947)
  %1949 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1948) #11
  %1950 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1948) #11
  %1951 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1950, <32 x i32> %1949) #11
  %1952 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1951, <32 x i32> %1755) #11
  %1953 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1952)
  %1954 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1953) #11
  %1955 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1953) #11
  %1956 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1954, <32 x i32> %1955) #11
  %1957 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1956, <32 x i32> %1758) #11
  %1958 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1957, <32 x i32> %1761) #11
  %1959 = bitcast <32 x i32> %1958 to <128 x i8>
  %1960 = shufflevector <128 x i8> %1959, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1961 = add i32 %1900, %2093
  %1962 = getelementptr inbounds i8, i8* %23, i32 %1961
  %1963 = bitcast i8* %1962 to <32 x i8>*
  store <32 x i8> %1960, <32 x i8>* %1963, align 1, !tbaa !113
  %ab1.i651.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.93.13.us.us, <32 x i32> %1748) #11
  %ab.i652.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i651.us.us, <32 x i32> %convolved394.sroa.93.13.us.us, <32 x i32> %1748) #11
  %1964 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i652.us.us, i32 %output_shift) #11
  %1965 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i652.us.us, i32 %1751) #11
  %1966 = and <32 x i32> %1965, %1750
  %1967 = add nsw <32 x i32> %1966, %1964
  %1968 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1967)
  %1969 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1968) #11
  %1970 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1968) #11
  %1971 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1970, <32 x i32> %1969) #11
  %1972 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1971, <32 x i32> %1755) #11
  %1973 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1972)
  %1974 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1973) #11
  %1975 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1973) #11
  %1976 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1974, <32 x i32> %1975) #11
  %1977 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1976, <32 x i32> %1758) #11
  %1978 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1977, <32 x i32> %1761) #11
  %1979 = bitcast <32 x i32> %1978 to <128 x i8>
  %1980 = shufflevector <128 x i8> %1979, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1981 = add i32 %1900, %2094
  %1982 = getelementptr inbounds i8, i8* %23, i32 %1981
  %1983 = bitcast i8* %1982 to <32 x i8>*
  store <32 x i8> %1980, <32 x i8>* %1983, align 1, !tbaa !113
  %ab1.i653.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.103.13.us.us, <32 x i32> %1748) #11
  %ab.i654.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i653.us.us, <32 x i32> %convolved394.sroa.103.13.us.us, <32 x i32> %1748) #11
  %1984 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i654.us.us, i32 %output_shift) #11
  %1985 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i654.us.us, i32 %1751) #11
  %1986 = and <32 x i32> %1985, %1750
  %1987 = add nsw <32 x i32> %1986, %1984
  %1988 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1987)
  %1989 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1988) #11
  %1990 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1988) #11
  %1991 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %1990, <32 x i32> %1989) #11
  %1992 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %1991, <32 x i32> %1755) #11
  %1993 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %1992)
  %1994 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %1993) #11
  %1995 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %1993) #11
  %1996 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %1994, <32 x i32> %1995) #11
  %1997 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %1996, <32 x i32> %1758) #11
  %1998 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %1997, <32 x i32> %1761) #11
  %1999 = bitcast <32 x i32> %1998 to <128 x i8>
  %2000 = shufflevector <128 x i8> %1999, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %2001 = add i32 %1900, %2095
  %2002 = getelementptr inbounds i8, i8* %23, i32 %2001
  %2003 = bitcast i8* %2002 to <32 x i8>*
  store <32 x i8> %2000, <32 x i8>* %2003, align 1, !tbaa !113
  %ab1.i655.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.113.13.us.us, <32 x i32> %1748) #11
  %ab.i656.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i655.us.us, <32 x i32> %convolved394.sroa.113.13.us.us, <32 x i32> %1748) #11
  %2004 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i656.us.us, i32 %output_shift) #11
  %2005 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i656.us.us, i32 %1751) #11
  %2006 = and <32 x i32> %2005, %1750
  %2007 = add nsw <32 x i32> %2006, %2004
  %2008 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %2007)
  %2009 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2008) #11
  %2010 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2008) #11
  %2011 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %2010, <32 x i32> %2009) #11
  %2012 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %2011, <32 x i32> %1755) #11
  %2013 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %2012)
  %2014 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2013) #11
  %2015 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2013) #11
  %2016 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %2014, <32 x i32> %2015) #11
  %2017 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %2016, <32 x i32> %1758) #11
  %2018 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %2017, <32 x i32> %1761) #11
  %2019 = bitcast <32 x i32> %2018 to <128 x i8>
  %2020 = shufflevector <128 x i8> %2019, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %2021 = add i32 %1900, %2096
  %2022 = getelementptr inbounds i8, i8* %23, i32 %2021
  %2023 = bitcast i8* %2022 to <32 x i8>*
  store <32 x i8> %2020, <32 x i8>* %2023, align 1, !tbaa !113
  %ab1.i657.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.123.13.us.us, <32 x i32> %1748) #11
  %ab.i658.us.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i657.us.us, <32 x i32> %convolved394.sroa.123.13.us.us, <32 x i32> %1748) #11
  %2024 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i658.us.us, i32 %output_shift) #11
  %2025 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i658.us.us, i32 %1751) #11
  %2026 = and <32 x i32> %2025, %1750
  %2027 = add nsw <32 x i32> %2026, %2024
  %2028 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %2027)
  %2029 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2028) #11
  %2030 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2028) #11
  %2031 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %2030, <32 x i32> %2029) #11
  %2032 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %2031, <32 x i32> %1755) #11
  %2033 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %2032)
  %2034 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2033) #11
  %2035 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2033) #11
  %2036 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %2034, <32 x i32> %2035) #11
  %2037 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %2036, <32 x i32> %1758) #11
  %2038 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %2037, <32 x i32> %1761) #11
  %2039 = bitcast <32 x i32> %2038 to <128 x i8>
  %2040 = shufflevector <128 x i8> %2039, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %2041 = add i32 %1900, %2097
  %2042 = getelementptr inbounds i8, i8* %23, i32 %2041
  %2043 = bitcast i8* %2042 to <32 x i8>*
  store <32 x i8> %2040, <32 x i8>* %2043, align 1, !tbaa !113
  %2044 = add nuw nsw i32 %output.s0.c.co152.us.us, 1
  %.not430.us.us = icmp eq i32 %2044, %1745
  br i1 %.not430.us.us, label %"end for output.s0.c.co151.us.us", label %"for output.s0.c.co150.us.us"

"end for output.s0.c.co151.us.us":                ; preds = %"consume convolved166.us.us", %"consume sum_input149.us.us"
  %2045 = add nuw nsw i32 %output.s0.x.xo124.us.us, 1
  %.not429.us.us = icmp eq i32 %2045, %1741
  br i1 %.not429.us.us, label %"end for output.s0.x.xo123.loopexit.us.us", label %"for output.s0.x.xo122.us.us"

"for convolved.s1.r19$y157.preheader.us.us":      ; preds = %after_bb154.us.us
  %2046 = mul nsw i32 %output.s0.c.co152.us.us, %8
  br i1 %1743, label %"for convolved.s1.r19$y157.us.us.us", label %"consume convolved166.us.us", !prof !96

"for sum_input.s1.r19$x137.preheader.us.us":      ; preds = %"for sum_input.s1.r19$y134.us.us"
  %2047 = mul nsw i32 %"sum_input.s1.r19$y136.us.us", %dilation_y
  %2048 = add nsw i32 %2047, %1777
  %2049 = mul nsw i32 %2048, %19
  %t1069.us.us = add i32 %1772, %2049
  br i1 %1766, label %"end for sum_input.s1.r19$x138.us.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x137.us.us"

"for output.s0.c.co150.preheader.us.us":          ; preds = %"consume sum_input149.us.us"
  %sum_input254393.sroa.0.0.vec.extract845.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 0
  %2050 = mul nsw i32 %sum_input254393.sroa.0.0.vec.extract845.us.us, %307
  %2051 = insertelement <32 x i32> undef, i32 %2050, i32 0
  %2052 = shufflevector <32 x i32> %2051, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input254393.sroa.0.4.vec.extract.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 1
  %2053 = mul nsw i32 %sum_input254393.sroa.0.4.vec.extract.us.us, %307
  %2054 = insertelement <32 x i32> undef, i32 %2053, i32 0
  %2055 = shufflevector <32 x i32> %2054, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input254393.sroa.0.8.vec.extract.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 2
  %2056 = mul nsw i32 %sum_input254393.sroa.0.8.vec.extract.us.us, %307
  %2057 = insertelement <32 x i32> undef, i32 %2056, i32 0
  %2058 = shufflevector <32 x i32> %2057, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input254393.sroa.0.12.vec.extract.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 3
  %2059 = mul nsw i32 %sum_input254393.sroa.0.12.vec.extract.us.us, %307
  %2060 = insertelement <32 x i32> undef, i32 %2059, i32 0
  %2061 = shufflevector <32 x i32> %2060, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input254393.sroa.0.16.vec.extract.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 4
  %2062 = mul nsw i32 %sum_input254393.sroa.0.16.vec.extract.us.us, %307
  %2063 = insertelement <32 x i32> undef, i32 %2062, i32 0
  %2064 = shufflevector <32 x i32> %2063, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input254393.sroa.0.20.vec.extract.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 5
  %2065 = mul nsw i32 %sum_input254393.sroa.0.20.vec.extract.us.us, %307
  %2066 = insertelement <32 x i32> undef, i32 %2065, i32 0
  %2067 = shufflevector <32 x i32> %2066, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input254393.sroa.0.24.vec.extract.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 6
  %2068 = mul nsw i32 %sum_input254393.sroa.0.24.vec.extract.us.us, %307
  %2069 = insertelement <32 x i32> undef, i32 %2068, i32 0
  %2070 = shufflevector <32 x i32> %2069, <32 x i32> undef, <32 x i32> zeroinitializer
  %sum_input254393.sroa.0.28.vec.extract.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.20.us.us, i32 7
  %2071 = mul nsw i32 %sum_input254393.sroa.0.28.vec.extract.us.us, %307
  %2072 = insertelement <32 x i32> undef, i32 %2071, i32 0
  %2073 = shufflevector <32 x i32> %2072, <32 x i32> undef, <32 x i32> zeroinitializer
  %2074 = add nsw i32 %output.s0.x.x.base.s125.us.us, %25
  %2075 = add nsw i32 %2074, 7
  %2076 = mul nsw i32 %2075, %stride_x
  %2077 = add nsw i32 %2074, 6
  %2078 = mul nsw i32 %2077, %stride_x
  %2079 = add nsw i32 %2074, 5
  %2080 = mul nsw i32 %2079, %stride_x
  %2081 = add nsw i32 %2074, 4
  %2082 = mul nsw i32 %2081, %stride_x
  %2083 = add nsw i32 %2074, 3
  %2084 = mul nsw i32 %2083, %stride_x
  %2085 = add nsw i32 %2074, 2
  %2086 = mul nsw i32 %2085, %stride_x
  %2087 = add nsw i32 %2074, 1
  %2088 = mul nsw i32 %2087, %stride_x
  %2089 = mul nsw i32 %2074, %stride_x
  %2090 = mul nsw i32 %2074, %27
  %2091 = mul nsw i32 %2087, %27
  %2092 = mul nsw i32 %2085, %27
  %2093 = mul nsw i32 %2083, %27
  %2094 = mul nsw i32 %2081, %27
  %2095 = mul nsw i32 %2079, %27
  %2096 = mul nsw i32 %2077, %27
  %2097 = mul nsw i32 %2075, %27
  br label %"for output.s0.c.co150.us.us"

"for sum_input.s1.r19$y134.preheader.us.us":      ; preds = %then_bb132.us.us
  %2098 = add nsw i32 %output.s0.x.x.base.s125.us.us, %25
  %2099 = sub i32 %2098, %16
  br label %"for sum_input.s1.r19$y134.us.us"

"for sum_input.s1.r19$y140.preheader.us.us":      ; preds = %next_bb133.us.us
  %2100 = add nsw i32 %output.s0.x.x.base.s125.us.us, %25
  %2101 = mul nsw i32 %2100, %stride_x
  br i1 %brmerge1441.demorgan, label %"for sum_input.s1.r19$y140.us.us.us.us", label %"consume sum_input149.us.us", !prof !103

"end for output.s0.x.xo123.loopexit.us.us":       ; preds = %"end for output.s0.c.co151.us.us"
  %2102 = add nuw nsw i32 %output.s0.y.rebased121.us.us, 1
  %.not428.us.us = icmp eq i32 %2102, %29
  br i1 %.not428.us.us, label %"end for output.s0.y.rebased120.loopexit.us", label %"for output.s0.y.rebased119.us.us"

"for sum_input.s1.r19$y140.us.us.us.us":          ; preds = %"for sum_input.s1.r19$y140.preheader.us.us", %"end for sum_input.s1.r19$x144.loopexit.split.us.us.us.us.us"
  %sum_input254393.sroa.0.15.us.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.lcssa, %"end for sum_input.s1.r19$x144.loopexit.split.us.us.us.us.us" ], [ %sum_input254393.sroa.0.0.vecblend.us.us, %"for sum_input.s1.r19$y140.preheader.us.us" ]
  %"sum_input.s1.r19$y142.us.us.us.us" = phi i32 [ %2261, %"end for sum_input.s1.r19$x144.loopexit.split.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y140.preheader.us.us" ]
  %2103 = mul nsw i32 %"sum_input.s1.r19$y142.us.us.us.us", %dilation_y
  %t1071.s.us.us.us.us = add nsw i32 %2103, %1777
  %2104 = mul nsw i32 %t1071.s.us.us.us.us, %19
  br label %"for sum_input.s1.r19$x143.us.us.us.us.us"

"for sum_input.s1.r19$x143.us.us.us.us.us":       ; preds = %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us", %"for sum_input.s1.r19$y140.us.us.us.us"
  %sum_input254393.sroa.0.16.us.us.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.lcssa, %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us" ], [ %sum_input254393.sroa.0.15.us.us.us.us, %"for sum_input.s1.r19$y140.us.us.us.us" ]
  %"sum_input.s1.r19$x145.us.us.us.us.us" = phi i32 [ %2260, %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y140.us.us.us.us" ]
  %2105 = mul nsw i32 %"sum_input.s1.r19$x145.us.us.us.us.us", %dilation_x
  %t1072.s.us.us.us.us.us = add nsw i32 %2105, %2101
  %2106 = mul nsw i32 %t1072.s.us.us.us.us.us, %17
  %2107 = add i32 %2106, %2104
  %t1073.us.us.us.us.us = sub i32 %2107, %t1037
  %2108 = add i32 %t1073.us.us.us.us.us, %1771
  %t1045.us.us.us.us.us = add i32 %2107, %1738
  %2109 = sub i32 %t1045.us.us.us.us.us, %1725
  %t1074.us.us.us.us.us = sub i32 %2109, %1726
  %2110 = add i32 %t1074.us.us.us.us.us, %1771
  %2111 = add i32 %2107, %1736
  %2112 = sub i32 %2111, %1762
  %t1075.us.us.us.us.us = sub i32 %2112, %1726
  %2113 = add i32 %t1075.us.us.us.us.us, %1771
  %2114 = add i32 %2107, %1735
  %2115 = sub i32 %2114, %1762
  %t1076.us.us.us.us.us = sub i32 %2115, %1726
  %2116 = add i32 %t1076.us.us.us.us.us, %1771
  %2117 = add i32 %2107, %1734
  %2118 = sub i32 %2117, %1762
  %t1077.us.us.us.us.us = sub i32 %2118, %1726
  %2119 = add i32 %t1077.us.us.us.us.us, %1771
  %2120 = add i32 %2107, %1733
  %2121 = sub i32 %2120, %1762
  %t1078.us.us.us.us.us = sub i32 %2121, %1726
  %2122 = add i32 %t1078.us.us.us.us.us, %1771
  %2123 = add i32 %2107, %1732
  %2124 = sub i32 %2123, %1762
  %t1079.us.us.us.us.us = sub i32 %2124, %1726
  %2125 = add i32 %t1079.us.us.us.us.us, %1771
  %2126 = add i32 %2107, %1731
  %2127 = sub i32 %2126, %1762
  %t1080.us.us.us.us.us = sub i32 %2127, %1726
  %2128 = add i32 %t1080.us.us.us.us.us, %1771
  br i1 %1765, label %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r124146.us.us.us.us.us"

"for sum_input.s1.r19$z.r124146.us.us.us.us.us":  ; preds = %"for sum_input.s1.r19$x143.us.us.us.us.us", %"for sum_input.s1.r19$z.r124146.us.us.us.us.us"
  %sum_input254393.sroa.0.18.us.us.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.1, %"for sum_input.s1.r19$z.r124146.us.us.us.us.us" ], [ %sum_input254393.sroa.0.16.us.us.us.us.us, %"for sum_input.s1.r19$x143.us.us.us.us.us" ]
  %"sum_input.s1.r19$z.r124148.us.us.us.us.us" = phi i32 [ %2216, %"for sum_input.s1.r19$z.r124146.us.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$x143.us.us.us.us.us" ]
  %niter1655 = phi i32 [ %niter1655.nsub.1, %"for sum_input.s1.r19$z.r124146.us.us.us.us.us" ], [ %unroll_iter1654, %"for sum_input.s1.r19$x143.us.us.us.us.us" ]
  %2129 = shl nsw i32 %"sum_input.s1.r19$z.r124148.us.us.us.us.us", 2
  %2130 = add i32 %2108, %2129
  %2131 = getelementptr inbounds i8, i8* %13, i32 %2130
  %2132 = bitcast i8* %2131 to <4 x i8>*
  %2133 = load <4 x i8>, <4 x i8>* %2132, align 4, !tbaa !110
  %2134 = add i32 %2110, %2129
  %2135 = getelementptr inbounds i8, i8* %13, i32 %2134
  %2136 = bitcast i8* %2135 to <4 x i8>*
  %2137 = load <4 x i8>, <4 x i8>* %2136, align 4, !tbaa !110
  %2138 = add i32 %2113, %2129
  %2139 = getelementptr inbounds i8, i8* %13, i32 %2138
  %2140 = bitcast i8* %2139 to <4 x i8>*
  %2141 = load <4 x i8>, <4 x i8>* %2140, align 4, !tbaa !110
  %2142 = add i32 %2116, %2129
  %2143 = getelementptr inbounds i8, i8* %13, i32 %2142
  %2144 = bitcast i8* %2143 to <4 x i8>*
  %2145 = load <4 x i8>, <4 x i8>* %2144, align 4, !tbaa !110
  %2146 = add i32 %2119, %2129
  %2147 = getelementptr inbounds i8, i8* %13, i32 %2146
  %2148 = bitcast i8* %2147 to <4 x i8>*
  %2149 = load <4 x i8>, <4 x i8>* %2148, align 4, !tbaa !110
  %2150 = add i32 %2122, %2129
  %2151 = getelementptr inbounds i8, i8* %13, i32 %2150
  %2152 = bitcast i8* %2151 to <4 x i8>*
  %2153 = load <4 x i8>, <4 x i8>* %2152, align 4, !tbaa !110
  %2154 = add i32 %2125, %2129
  %2155 = getelementptr inbounds i8, i8* %13, i32 %2154
  %2156 = bitcast i8* %2155 to <4 x i8>*
  %2157 = load <4 x i8>, <4 x i8>* %2156, align 4, !tbaa !110
  %2158 = add i32 %2128, %2129
  %2159 = getelementptr inbounds i8, i8* %13, i32 %2158
  %2160 = bitcast i8* %2159 to <4 x i8>*
  %2161 = load <4 x i8>, <4 x i8>* %2160, align 4, !tbaa !110
  %2162 = shufflevector <4 x i8> %2133, <4 x i8> %2137, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2163 = shufflevector <4 x i8> %2141, <4 x i8> %2145, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2164 = shufflevector <4 x i8> %2149, <4 x i8> %2153, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2165 = shufflevector <4 x i8> %2157, <4 x i8> %2161, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2166 = shufflevector <8 x i8> %2162, <8 x i8> %2163, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %2167 = shufflevector <8 x i8> %2164, <8 x i8> %2165, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %2168 = shufflevector <32 x i32> %sum_input254393.sroa.0.18.us.us.us.us.us, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2169 = shufflevector <16 x i8> %2166, <16 x i8> %2167, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2170 = bitcast <128 x i8> %2169 to <32 x i32>
  %2171 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %2168, <32 x i32> %2170, i32 16843009) #11
  %2172 = shl i32 %"sum_input.s1.r19$z.r124148.us.us.us.us.us", 2
  %2173 = or i32 %2172, 4
  %2174 = add i32 %2108, %2173
  %2175 = getelementptr inbounds i8, i8* %13, i32 %2174
  %2176 = bitcast i8* %2175 to <4 x i8>*
  %2177 = load <4 x i8>, <4 x i8>* %2176, align 4, !tbaa !110
  %2178 = add i32 %2110, %2173
  %2179 = getelementptr inbounds i8, i8* %13, i32 %2178
  %2180 = bitcast i8* %2179 to <4 x i8>*
  %2181 = load <4 x i8>, <4 x i8>* %2180, align 4, !tbaa !110
  %2182 = add i32 %2113, %2173
  %2183 = getelementptr inbounds i8, i8* %13, i32 %2182
  %2184 = bitcast i8* %2183 to <4 x i8>*
  %2185 = load <4 x i8>, <4 x i8>* %2184, align 4, !tbaa !110
  %2186 = add i32 %2116, %2173
  %2187 = getelementptr inbounds i8, i8* %13, i32 %2186
  %2188 = bitcast i8* %2187 to <4 x i8>*
  %2189 = load <4 x i8>, <4 x i8>* %2188, align 4, !tbaa !110
  %2190 = add i32 %2119, %2173
  %2191 = getelementptr inbounds i8, i8* %13, i32 %2190
  %2192 = bitcast i8* %2191 to <4 x i8>*
  %2193 = load <4 x i8>, <4 x i8>* %2192, align 4, !tbaa !110
  %2194 = add i32 %2122, %2173
  %2195 = getelementptr inbounds i8, i8* %13, i32 %2194
  %2196 = bitcast i8* %2195 to <4 x i8>*
  %2197 = load <4 x i8>, <4 x i8>* %2196, align 4, !tbaa !110
  %2198 = add i32 %2125, %2173
  %2199 = getelementptr inbounds i8, i8* %13, i32 %2198
  %2200 = bitcast i8* %2199 to <4 x i8>*
  %2201 = load <4 x i8>, <4 x i8>* %2200, align 4, !tbaa !110
  %2202 = add i32 %2128, %2173
  %2203 = getelementptr inbounds i8, i8* %13, i32 %2202
  %2204 = bitcast i8* %2203 to <4 x i8>*
  %2205 = load <4 x i8>, <4 x i8>* %2204, align 4, !tbaa !110
  %2206 = shufflevector <4 x i8> %2177, <4 x i8> %2181, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2207 = shufflevector <4 x i8> %2185, <4 x i8> %2189, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2208 = shufflevector <4 x i8> %2193, <4 x i8> %2197, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2209 = shufflevector <4 x i8> %2201, <4 x i8> %2205, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2210 = shufflevector <8 x i8> %2206, <8 x i8> %2207, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %2211 = shufflevector <8 x i8> %2208, <8 x i8> %2209, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %2212 = shufflevector <32 x i32> %2171, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2213 = shufflevector <16 x i8> %2210, <16 x i8> %2211, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2214 = bitcast <128 x i8> %2213 to <32 x i32>
  %2215 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %2212, <32 x i32> %2214, i32 16843009) #11
  %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.1 = shufflevector <32 x i32> %2215, <32 x i32> %sum_input254393.sroa.0.18.us.us.us.us.us, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %2216 = add nuw nsw i32 %"sum_input.s1.r19$z.r124148.us.us.us.us.us", 2
  %niter1655.nsub.1 = add i32 %niter1655, -2
  %niter1655.ncmp.1 = icmp eq i32 %niter1655.nsub.1, 0
  br i1 %niter1655.ncmp.1, label %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r124146.us.us.us.us.us"

"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us.unr-lcssa": ; preds = %"for sum_input.s1.r19$z.r124146.us.us.us.us.us", %"for sum_input.s1.r19$x143.us.us.us.us.us"
  %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.lcssa.ph = phi <32 x i32> [ undef, %"for sum_input.s1.r19$x143.us.us.us.us.us" ], [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.1, %"for sum_input.s1.r19$z.r124146.us.us.us.us.us" ]
  %sum_input254393.sroa.0.18.us.us.us.us.us.unr = phi <32 x i32> [ %sum_input254393.sroa.0.16.us.us.us.us.us, %"for sum_input.s1.r19$x143.us.us.us.us.us" ], [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.1, %"for sum_input.s1.r19$z.r124146.us.us.us.us.us" ]
  %"sum_input.s1.r19$z.r124148.us.us.us.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x143.us.us.us.us.us" ], [ %2216, %"for sum_input.s1.r19$z.r124146.us.us.us.us.us" ]
  br i1 %lcmp.mod1653.not, label %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us", label %"for sum_input.s1.r19$z.r124146.us.us.us.us.us.epil"

"for sum_input.s1.r19$z.r124146.us.us.us.us.us.epil": ; preds = %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us.unr-lcssa"
  %2217 = shl nsw i32 %"sum_input.s1.r19$z.r124148.us.us.us.us.us.unr", 2
  %2218 = shufflevector <32 x i32> %sum_input254393.sroa.0.18.us.us.us.us.us.unr, <32 x i32> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2219 = add i32 %2108, %2217
  %2220 = getelementptr inbounds i8, i8* %13, i32 %2219
  %2221 = bitcast i8* %2220 to <4 x i8>*
  %2222 = load <4 x i8>, <4 x i8>* %2221, align 4, !tbaa !110
  %2223 = add i32 %2110, %2217
  %2224 = getelementptr inbounds i8, i8* %13, i32 %2223
  %2225 = bitcast i8* %2224 to <4 x i8>*
  %2226 = load <4 x i8>, <4 x i8>* %2225, align 4, !tbaa !110
  %2227 = shufflevector <4 x i8> %2222, <4 x i8> %2226, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2228 = add i32 %2113, %2217
  %2229 = getelementptr inbounds i8, i8* %13, i32 %2228
  %2230 = bitcast i8* %2229 to <4 x i8>*
  %2231 = load <4 x i8>, <4 x i8>* %2230, align 4, !tbaa !110
  %2232 = add i32 %2116, %2217
  %2233 = getelementptr inbounds i8, i8* %13, i32 %2232
  %2234 = bitcast i8* %2233 to <4 x i8>*
  %2235 = load <4 x i8>, <4 x i8>* %2234, align 4, !tbaa !110
  %2236 = shufflevector <4 x i8> %2231, <4 x i8> %2235, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2237 = shufflevector <8 x i8> %2227, <8 x i8> %2236, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %2238 = add i32 %2119, %2217
  %2239 = getelementptr inbounds i8, i8* %13, i32 %2238
  %2240 = bitcast i8* %2239 to <4 x i8>*
  %2241 = load <4 x i8>, <4 x i8>* %2240, align 4, !tbaa !110
  %2242 = add i32 %2122, %2217
  %2243 = getelementptr inbounds i8, i8* %13, i32 %2242
  %2244 = bitcast i8* %2243 to <4 x i8>*
  %2245 = load <4 x i8>, <4 x i8>* %2244, align 4, !tbaa !110
  %2246 = shufflevector <4 x i8> %2241, <4 x i8> %2245, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2247 = add i32 %2125, %2217
  %2248 = getelementptr inbounds i8, i8* %13, i32 %2247
  %2249 = bitcast i8* %2248 to <4 x i8>*
  %2250 = load <4 x i8>, <4 x i8>* %2249, align 4, !tbaa !110
  %2251 = add i32 %2128, %2217
  %2252 = getelementptr inbounds i8, i8* %13, i32 %2251
  %2253 = bitcast i8* %2252 to <4 x i8>*
  %2254 = load <4 x i8>, <4 x i8>* %2253, align 4, !tbaa !110
  %2255 = shufflevector <4 x i8> %2250, <4 x i8> %2254, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2256 = shufflevector <8 x i8> %2246, <8 x i8> %2255, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %2257 = shufflevector <16 x i8> %2237, <16 x i8> %2256, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2258 = bitcast <128 x i8> %2257 to <32 x i32>
  %2259 = call <32 x i32> @llvm.hexagon.V6.vrmpybus.acc.128B(<32 x i32> %2218, <32 x i32> %2258, i32 16843009) #11
  %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.epil = shufflevector <32 x i32> %2259, <32 x i32> %sum_input254393.sroa.0.18.us.us.us.us.us.unr, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  br label %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us"

"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us": ; preds = %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us.unr-lcssa", %"for sum_input.s1.r19$z.r124146.us.us.us.us.us.epil"
  %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.lcssa = phi <32 x i32> [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.lcssa.ph, %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us.unr-lcssa" ], [ %sum_input254393.sroa.0.0.vecblend830.us.us.us.us.us.epil, %"for sum_input.s1.r19$z.r124146.us.us.us.us.us.epil" ]
  %2260 = add nuw nsw i32 %"sum_input.s1.r19$x145.us.us.us.us.us", 1
  %.not435.us.us.us.us.us = icmp eq i32 %2260, %9
  br i1 %.not435.us.us.us.us.us, label %"end for sum_input.s1.r19$x144.loopexit.split.us.us.us.us.us", label %"for sum_input.s1.r19$x143.us.us.us.us.us"

"end for sum_input.s1.r19$x144.loopexit.split.us.us.us.us.us": ; preds = %"end for sum_input.s1.r19$z.r124147.loopexit.us.us.us.us.us"
  %2261 = add nuw nsw i32 %"sum_input.s1.r19$y142.us.us.us.us", 1
  %.not434.us.us.us.us = icmp eq i32 %2261, %11
  br i1 %.not434.us.us.us.us, label %"consume sum_input149.us.us", label %"for sum_input.s1.r19$y140.us.us.us.us"

"for convolved.s1.r19$y157.us.us.us":             ; preds = %"for convolved.s1.r19$y157.preheader.us.us", %"end for convolved.s1.r19$x161.loopexit.us.us.us"
  %convolved394.sroa.123.8.us.us.us = phi <32 x i32> [ %.us-phi1123.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.123.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %convolved394.sroa.113.8.us.us.us = phi <32 x i32> [ %.us-phi1124.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.113.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %convolved394.sroa.103.8.us.us.us = phi <32 x i32> [ %.us-phi1125.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.103.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %convolved394.sroa.93.8.us.us.us = phi <32 x i32> [ %.us-phi1126.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.93.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %convolved394.sroa.78.8.us.us.us = phi <32 x i32> [ %.us-phi1127.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.78.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %convolved394.sroa.63.8.us.us.us = phi <32 x i32> [ %.us-phi1128.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.63.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %convolved394.sroa.48.8.us.us.us = phi <32 x i32> [ %.us-phi1129.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.48.7.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %convolved394.sroa.0.22.us.us.us = phi <32 x i32> [ %.us-phi1130.us.us.us, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ %convolved394.sroa.0.21.us.us, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %"convolved.s1.r19$y159.us.us.us" = phi i32 [ %2266, %"end for convolved.s1.r19$x161.loopexit.us.us.us" ], [ 0, %"for convolved.s1.r19$y157.preheader.us.us" ]
  %2262 = mul nsw i32 %"convolved.s1.r19$y159.us.us.us", %dilation_y
  %2263 = add nsw i32 %2262, %1777
  %2264 = mul nsw i32 %2263, %19
  %t1106.us.us.us = add nsw i32 %2264, %1773
  %2265 = mul nsw i32 %"convolved.s1.r19$y159.us.us.us", %12
  %t1107.us.us.us = add nsw i32 %2265, %2046
  br i1 %1744, label %"for convolved.s1.r19$x160.us.us.us.us", label %"end for convolved.s1.r19$x161.loopexit.us.us.us", !prof !96

"end for convolved.s1.r19$x161.loopexit.us.us.us": ; preds = %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us", %"for convolved.s1.r19$y157.us.us.us"
  %.us-phi1123.us.us.us = phi <32 x i32> [ %convolved394.sroa.123.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1570, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %.us-phi1124.us.us.us = phi <32 x i32> [ %convolved394.sroa.113.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1571, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %.us-phi1125.us.us.us = phi <32 x i32> [ %convolved394.sroa.103.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1572, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %.us-phi1126.us.us.us = phi <32 x i32> [ %convolved394.sroa.93.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1573, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %.us-phi1127.us.us.us = phi <32 x i32> [ %convolved394.sroa.78.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1574, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %.us-phi1128.us.us.us = phi <32 x i32> [ %convolved394.sroa.63.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1575, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %.us-phi1129.us.us.us = phi <32 x i32> [ %convolved394.sroa.48.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1576, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %.us-phi1130.us.us.us = phi <32 x i32> [ %convolved394.sroa.0.22.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ], [ %.lcssa1577, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ]
  %2266 = add nuw nsw i32 %"convolved.s1.r19$y159.us.us.us", 1
  %.not431.us.us.us = icmp eq i32 %2266, %11
  br i1 %.not431.us.us.us, label %"consume convolved166.us.us", label %"for convolved.s1.r19$y157.us.us.us"

"for convolved.s1.r19$x160.us.us.us.us":          ; preds = %"for convolved.s1.r19$y157.us.us.us", %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us"
  %convolved394.sroa.123.9.us.us.us.us = phi <32 x i32> [ %.lcssa1570, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.123.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %convolved394.sroa.113.9.us.us.us.us = phi <32 x i32> [ %.lcssa1571, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.113.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %convolved394.sroa.103.9.us.us.us.us = phi <32 x i32> [ %.lcssa1572, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.103.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %convolved394.sroa.93.9.us.us.us.us = phi <32 x i32> [ %.lcssa1573, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.93.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %convolved394.sroa.78.9.us.us.us.us = phi <32 x i32> [ %.lcssa1574, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.78.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %convolved394.sroa.63.9.us.us.us.us = phi <32 x i32> [ %.lcssa1575, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.63.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %convolved394.sroa.48.9.us.us.us.us = phi <32 x i32> [ %.lcssa1576, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.48.8.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %convolved394.sroa.0.23.us.us.us.us = phi <32 x i32> [ %.lcssa1577, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ %convolved394.sroa.0.22.us.us.us, %"for convolved.s1.r19$y157.us.us.us" ]
  %"convolved.s1.r19$x162.us.us.us.us" = phi i32 [ %2445, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us" ], [ 0, %"for convolved.s1.r19$y157.us.us.us" ]
  %2267 = mul nsw i32 %"convolved.s1.r19$x162.us.us.us.us", %dilation_x
  %t1116.s.us.us.us.us = add nsw i32 %2267, %2076
  %t1115.s.us.us.us.us = add nsw i32 %2267, %2078
  %t1114.s.us.us.us.us = add nsw i32 %2267, %2080
  %t1113.s.us.us.us.us = add nsw i32 %2267, %2082
  %t1112.s.us.us.us.us = add nsw i32 %2267, %2084
  %t1111.s.us.us.us.us = add nsw i32 %2267, %2086
  %t1110.s.us.us.us.us = add nsw i32 %2267, %2088
  %t1108.s.us.us.us.us = add nsw i32 %2267, %2089
  %2268 = mul nsw i32 %"convolved.s1.r19$x162.us.us.us.us", %10
  %2269 = add nsw i32 %t1107.us.us.us, %2268
  %2270 = mul nsw i32 %t1108.s.us.us.us.us, %17
  %2271 = mul nsw i32 %t1110.s.us.us.us.us, %17
  %2272 = mul nsw i32 %t1111.s.us.us.us.us, %17
  %2273 = mul nsw i32 %t1112.s.us.us.us.us, %17
  %2274 = mul nsw i32 %t1113.s.us.us.us.us, %17
  %2275 = mul nsw i32 %t1114.s.us.us.us.us, %17
  %2276 = mul nsw i32 %t1115.s.us.us.us.us, %17
  %2277 = mul nsw i32 %t1116.s.us.us.us.us, %17
  br i1 %1767, label %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124163.us.us.us.us"

"for convolved.s1.r19$z.r124163.us.us.us.us":     ; preds = %"for convolved.s1.r19$x160.us.us.us.us", %"for convolved.s1.r19$z.r124163.us.us.us.us"
  %convolved394.sroa.123.11.us.us.us.us = phi <32 x i32> [ %2388, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.123.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %convolved394.sroa.113.11.us.us.us.us = phi <32 x i32> [ %2382, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.113.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %convolved394.sroa.103.11.us.us.us.us = phi <32 x i32> [ %2376, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.103.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %convolved394.sroa.93.11.us.us.us.us = phi <32 x i32> [ %2370, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.93.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %convolved394.sroa.78.11.us.us.us.us = phi <32 x i32> [ %2364, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.78.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %convolved394.sroa.63.11.us.us.us.us = phi <32 x i32> [ %2358, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.63.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %convolved394.sroa.48.11.us.us.us.us = phi <32 x i32> [ %2352, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.48.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %convolved394.sroa.0.25.us.us.us.us = phi <32 x i32> [ %2346, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %convolved394.sroa.0.23.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %"convolved.s1.r19$z.r124165.us.us.us.us" = phi i32 [ %2389, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ 0, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %niter1665 = phi i32 [ %niter1665.nsub.1, %"for convolved.s1.r19$z.r124163.us.us.us.us" ], [ %unroll_iter1664, %"for convolved.s1.r19$x160.us.us.us.us" ]
  %2278 = shl nsw i32 %"convolved.s1.r19$z.r124165.us.us.us.us", 7
  %2279 = add nsw i32 %2269, %2278
  %2280 = getelementptr inbounds i8, i8* %5, i32 %2279
  %2281 = bitcast i8* %2280 to <32 x i32>*
  %2282 = load <32 x i32>, <32 x i32>* %2281, align 128, !tbaa !106
  %2283 = shl nsw i32 %"convolved.s1.r19$z.r124165.us.us.us.us", 2
  %2284 = add i32 %2283, %t1106.us.us.us
  %2285 = add i32 %2284, %2270
  %2286 = getelementptr inbounds i8, i8* %13, i32 %2285
  %2287 = bitcast i8* %2286 to <1 x i32>*
  %2288 = load <1 x i32>, <1 x i32>* %2287, align 4, !tbaa !110
  %2289 = extractelement <1 x i32> %2288, i64 0
  %2290 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.25.us.us.us.us, <32 x i32> %2282, i32 %2289) #11
  %2291 = add i32 %2284, %2271
  %2292 = getelementptr inbounds i8, i8* %13, i32 %2291
  %2293 = bitcast i8* %2292 to <1 x i32>*
  %2294 = load <1 x i32>, <1 x i32>* %2293, align 4, !tbaa !110
  %2295 = extractelement <1 x i32> %2294, i64 0
  %2296 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.48.11.us.us.us.us, <32 x i32> %2282, i32 %2295) #11
  %2297 = add i32 %2284, %2272
  %2298 = getelementptr inbounds i8, i8* %13, i32 %2297
  %2299 = bitcast i8* %2298 to <1 x i32>*
  %2300 = load <1 x i32>, <1 x i32>* %2299, align 4, !tbaa !110
  %2301 = extractelement <1 x i32> %2300, i64 0
  %2302 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.63.11.us.us.us.us, <32 x i32> %2282, i32 %2301) #11
  %2303 = add i32 %2284, %2273
  %2304 = getelementptr inbounds i8, i8* %13, i32 %2303
  %2305 = bitcast i8* %2304 to <1 x i32>*
  %2306 = load <1 x i32>, <1 x i32>* %2305, align 4, !tbaa !110
  %2307 = extractelement <1 x i32> %2306, i64 0
  %2308 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.78.11.us.us.us.us, <32 x i32> %2282, i32 %2307) #11
  %2309 = add i32 %2284, %2274
  %2310 = getelementptr inbounds i8, i8* %13, i32 %2309
  %2311 = bitcast i8* %2310 to <1 x i32>*
  %2312 = load <1 x i32>, <1 x i32>* %2311, align 4, !tbaa !110
  %2313 = extractelement <1 x i32> %2312, i64 0
  %2314 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.93.11.us.us.us.us, <32 x i32> %2282, i32 %2313) #11
  %2315 = add i32 %2284, %2275
  %2316 = getelementptr inbounds i8, i8* %13, i32 %2315
  %2317 = bitcast i8* %2316 to <1 x i32>*
  %2318 = load <1 x i32>, <1 x i32>* %2317, align 4, !tbaa !110
  %2319 = extractelement <1 x i32> %2318, i64 0
  %2320 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.103.11.us.us.us.us, <32 x i32> %2282, i32 %2319) #11
  %2321 = add i32 %2284, %2276
  %2322 = getelementptr inbounds i8, i8* %13, i32 %2321
  %2323 = bitcast i8* %2322 to <1 x i32>*
  %2324 = load <1 x i32>, <1 x i32>* %2323, align 4, !tbaa !110
  %2325 = extractelement <1 x i32> %2324, i64 0
  %2326 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.113.11.us.us.us.us, <32 x i32> %2282, i32 %2325) #11
  %2327 = add i32 %2284, %2277
  %2328 = getelementptr inbounds i8, i8* %13, i32 %2327
  %2329 = bitcast i8* %2328 to <1 x i32>*
  %2330 = load <1 x i32>, <1 x i32>* %2329, align 4, !tbaa !110
  %2331 = extractelement <1 x i32> %2330, i64 0
  %2332 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.123.11.us.us.us.us, <32 x i32> %2282, i32 %2331) #11
  %2333 = or i32 %"convolved.s1.r19$z.r124165.us.us.us.us", 1
  %2334 = shl nsw i32 %2333, 7
  %2335 = add nsw i32 %2269, %2334
  %2336 = getelementptr inbounds i8, i8* %5, i32 %2335
  %2337 = bitcast i8* %2336 to <32 x i32>*
  %2338 = load <32 x i32>, <32 x i32>* %2337, align 128, !tbaa !106
  %2339 = shl nsw i32 %2333, 2
  %2340 = add i32 %2339, %t1106.us.us.us
  %2341 = add i32 %2340, %2270
  %2342 = getelementptr inbounds i8, i8* %13, i32 %2341
  %2343 = bitcast i8* %2342 to <1 x i32>*
  %2344 = load <1 x i32>, <1 x i32>* %2343, align 4, !tbaa !110
  %2345 = extractelement <1 x i32> %2344, i64 0
  %2346 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2290, <32 x i32> %2338, i32 %2345) #11
  %2347 = add i32 %2340, %2271
  %2348 = getelementptr inbounds i8, i8* %13, i32 %2347
  %2349 = bitcast i8* %2348 to <1 x i32>*
  %2350 = load <1 x i32>, <1 x i32>* %2349, align 4, !tbaa !110
  %2351 = extractelement <1 x i32> %2350, i64 0
  %2352 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2296, <32 x i32> %2338, i32 %2351) #11
  %2353 = add i32 %2340, %2272
  %2354 = getelementptr inbounds i8, i8* %13, i32 %2353
  %2355 = bitcast i8* %2354 to <1 x i32>*
  %2356 = load <1 x i32>, <1 x i32>* %2355, align 4, !tbaa !110
  %2357 = extractelement <1 x i32> %2356, i64 0
  %2358 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2302, <32 x i32> %2338, i32 %2357) #11
  %2359 = add i32 %2340, %2273
  %2360 = getelementptr inbounds i8, i8* %13, i32 %2359
  %2361 = bitcast i8* %2360 to <1 x i32>*
  %2362 = load <1 x i32>, <1 x i32>* %2361, align 4, !tbaa !110
  %2363 = extractelement <1 x i32> %2362, i64 0
  %2364 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2308, <32 x i32> %2338, i32 %2363) #11
  %2365 = add i32 %2340, %2274
  %2366 = getelementptr inbounds i8, i8* %13, i32 %2365
  %2367 = bitcast i8* %2366 to <1 x i32>*
  %2368 = load <1 x i32>, <1 x i32>* %2367, align 4, !tbaa !110
  %2369 = extractelement <1 x i32> %2368, i64 0
  %2370 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2314, <32 x i32> %2338, i32 %2369) #11
  %2371 = add i32 %2340, %2275
  %2372 = getelementptr inbounds i8, i8* %13, i32 %2371
  %2373 = bitcast i8* %2372 to <1 x i32>*
  %2374 = load <1 x i32>, <1 x i32>* %2373, align 4, !tbaa !110
  %2375 = extractelement <1 x i32> %2374, i64 0
  %2376 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2320, <32 x i32> %2338, i32 %2375) #11
  %2377 = add i32 %2340, %2276
  %2378 = getelementptr inbounds i8, i8* %13, i32 %2377
  %2379 = bitcast i8* %2378 to <1 x i32>*
  %2380 = load <1 x i32>, <1 x i32>* %2379, align 4, !tbaa !110
  %2381 = extractelement <1 x i32> %2380, i64 0
  %2382 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2326, <32 x i32> %2338, i32 %2381) #11
  %2383 = add i32 %2340, %2277
  %2384 = getelementptr inbounds i8, i8* %13, i32 %2383
  %2385 = bitcast i8* %2384 to <1 x i32>*
  %2386 = load <1 x i32>, <1 x i32>* %2385, align 4, !tbaa !110
  %2387 = extractelement <1 x i32> %2386, i64 0
  %2388 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2332, <32 x i32> %2338, i32 %2387) #11
  %2389 = add nuw nsw i32 %"convolved.s1.r19$z.r124165.us.us.us.us", 2
  %niter1665.nsub.1 = add i32 %niter1665, -2
  %niter1665.ncmp.1 = icmp eq i32 %niter1665.nsub.1, 0
  br i1 %niter1665.ncmp.1, label %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124163.us.us.us.us"

"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa": ; preds = %"for convolved.s1.r19$z.r124163.us.us.us.us", %"for convolved.s1.r19$x160.us.us.us.us"
  %.lcssa1577.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2346, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %.lcssa1576.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2352, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %.lcssa1575.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2358, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %.lcssa1574.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2364, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %.lcssa1573.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2370, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %.lcssa1572.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2376, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %.lcssa1571.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2382, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %.lcssa1570.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2388, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.123.11.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.123.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2388, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.113.11.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.113.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2382, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.103.11.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.103.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2376, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.93.11.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.93.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2370, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.78.11.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.78.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2364, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.63.11.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.63.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2358, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.48.11.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.48.9.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2352, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %convolved394.sroa.0.25.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.0.23.us.us.us.us, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2346, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  %"convolved.s1.r19$z.r124165.us.us.us.us.unr" = phi i32 [ 0, %"for convolved.s1.r19$x160.us.us.us.us" ], [ %2389, %"for convolved.s1.r19$z.r124163.us.us.us.us" ]
  br i1 %lcmp.mod1663.not, label %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r124163.us.us.us.us.epil"

"for convolved.s1.r19$z.r124163.us.us.us.us.epil": ; preds = %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa"
  %2390 = shl nsw i32 %"convolved.s1.r19$z.r124165.us.us.us.us.unr", 7
  %2391 = add nsw i32 %2269, %2390
  %2392 = getelementptr inbounds i8, i8* %5, i32 %2391
  %2393 = bitcast i8* %2392 to <32 x i32>*
  %2394 = load <32 x i32>, <32 x i32>* %2393, align 128, !tbaa !106
  %2395 = shl nsw i32 %"convolved.s1.r19$z.r124165.us.us.us.us.unr", 2
  %2396 = add i32 %2395, %t1106.us.us.us
  %2397 = add i32 %2396, %2277
  %2398 = getelementptr inbounds i8, i8* %13, i32 %2397
  %2399 = bitcast i8* %2398 to <1 x i32>*
  %2400 = load <1 x i32>, <1 x i32>* %2399, align 4, !tbaa !110
  %2401 = extractelement <1 x i32> %2400, i64 0
  %2402 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.123.11.us.us.us.us.unr, <32 x i32> %2394, i32 %2401) #11
  %2403 = add i32 %2396, %2276
  %2404 = getelementptr inbounds i8, i8* %13, i32 %2403
  %2405 = bitcast i8* %2404 to <1 x i32>*
  %2406 = load <1 x i32>, <1 x i32>* %2405, align 4, !tbaa !110
  %2407 = extractelement <1 x i32> %2406, i64 0
  %2408 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.113.11.us.us.us.us.unr, <32 x i32> %2394, i32 %2407) #11
  %2409 = add i32 %2396, %2275
  %2410 = getelementptr inbounds i8, i8* %13, i32 %2409
  %2411 = bitcast i8* %2410 to <1 x i32>*
  %2412 = load <1 x i32>, <1 x i32>* %2411, align 4, !tbaa !110
  %2413 = extractelement <1 x i32> %2412, i64 0
  %2414 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.103.11.us.us.us.us.unr, <32 x i32> %2394, i32 %2413) #11
  %2415 = add i32 %2396, %2274
  %2416 = getelementptr inbounds i8, i8* %13, i32 %2415
  %2417 = bitcast i8* %2416 to <1 x i32>*
  %2418 = load <1 x i32>, <1 x i32>* %2417, align 4, !tbaa !110
  %2419 = extractelement <1 x i32> %2418, i64 0
  %2420 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.93.11.us.us.us.us.unr, <32 x i32> %2394, i32 %2419) #11
  %2421 = add i32 %2396, %2273
  %2422 = getelementptr inbounds i8, i8* %13, i32 %2421
  %2423 = bitcast i8* %2422 to <1 x i32>*
  %2424 = load <1 x i32>, <1 x i32>* %2423, align 4, !tbaa !110
  %2425 = extractelement <1 x i32> %2424, i64 0
  %2426 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.78.11.us.us.us.us.unr, <32 x i32> %2394, i32 %2425) #11
  %2427 = add i32 %2396, %2272
  %2428 = getelementptr inbounds i8, i8* %13, i32 %2427
  %2429 = bitcast i8* %2428 to <1 x i32>*
  %2430 = load <1 x i32>, <1 x i32>* %2429, align 4, !tbaa !110
  %2431 = extractelement <1 x i32> %2430, i64 0
  %2432 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.63.11.us.us.us.us.unr, <32 x i32> %2394, i32 %2431) #11
  %2433 = add i32 %2396, %2271
  %2434 = getelementptr inbounds i8, i8* %13, i32 %2433
  %2435 = bitcast i8* %2434 to <1 x i32>*
  %2436 = load <1 x i32>, <1 x i32>* %2435, align 4, !tbaa !110
  %2437 = extractelement <1 x i32> %2436, i64 0
  %2438 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.48.11.us.us.us.us.unr, <32 x i32> %2394, i32 %2437) #11
  %2439 = add i32 %2396, %2270
  %2440 = getelementptr inbounds i8, i8* %13, i32 %2439
  %2441 = bitcast i8* %2440 to <1 x i32>*
  %2442 = load <1 x i32>, <1 x i32>* %2441, align 4, !tbaa !110
  %2443 = extractelement <1 x i32> %2442, i64 0
  %2444 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.25.us.us.us.us.unr, <32 x i32> %2394, i32 %2443) #11
  br label %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us"

"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us": ; preds = %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa", %"for convolved.s1.r19$z.r124163.us.us.us.us.epil"
  %.lcssa1577 = phi <32 x i32> [ %.lcssa1577.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2444, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %.lcssa1576 = phi <32 x i32> [ %.lcssa1576.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2438, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %.lcssa1575 = phi <32 x i32> [ %.lcssa1575.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2432, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %.lcssa1574 = phi <32 x i32> [ %.lcssa1574.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2426, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %.lcssa1573 = phi <32 x i32> [ %.lcssa1573.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2420, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %.lcssa1572 = phi <32 x i32> [ %.lcssa1572.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2414, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %.lcssa1571 = phi <32 x i32> [ %.lcssa1571.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2408, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %.lcssa1570 = phi <32 x i32> [ %.lcssa1570.ph, %"end for convolved.s1.r19$z.r124164.loopexit.us.us.us.us.unr-lcssa" ], [ %2402, %"for convolved.s1.r19$z.r124163.us.us.us.us.epil" ]
  %2445 = add nuw nsw i32 %"convolved.s1.r19$x162.us.us.us.us", 1
  %.not432.us.us.us.us = icmp eq i32 %2445, %9
  br i1 %.not432.us.us.us.us, label %"end for convolved.s1.r19$x161.loopexit.us.us.us", label %"for convolved.s1.r19$x160.us.us.us.us"

next_bb115:                                       ; preds = %next_bb38
  br i1 %99, label %then_bb191, label %next_bb192

then_bb191:                                       ; preds = %next_bb115
  %2446 = mul nsw i32 %19, %18
  %2447 = mul nsw i32 %17, %16
  %2448 = mul nsw i32 %22, %20
  %2449 = add i32 %2448, %2446
  %t1121 = add i32 %2449, %2447
  %2450 = icmp sgt i32 %21, 0
  br i1 %2450, label %"for output.s0.b.rebased193.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased193.preheader":           ; preds = %then_bb191
  %2451 = icmp sgt i32 %29, 0
  %.neg878 = mul i32 %30, %28
  %.neg879 = mul i32 %27, %25
  %.neg880 = mul i32 %31, %20
  %2452 = icmp sgt i32 %11, 0
  %2453 = icmp sgt i32 %9, 0
  %2454 = icmp sgt i32 %7, 0
  %2455 = ashr i32 %4, 7
  %2456 = icmp sgt i32 %4, 127
  %2457 = insertelement <128 x i32> undef, i32 %output_multiplier, i32 0
  %2458 = shufflevector <128 x i32> %2457, <128 x i32> undef, <32 x i32> zeroinitializer
  %2459 = icmp sgt i32 %output_shift, 0
  %2460 = select i1 %2459, <128 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <128 x i32> zeroinitializer
  %2461 = add nsw i32 %output_shift, -1
  %2462 = zext i8 %output_zero to i16
  %2463 = insertelement <128 x i16> undef, i16 %2462, i32 0
  %2464 = shufflevector <128 x i16> %2463, <128 x i16> undef, <128 x i32> zeroinitializer
  %2465 = bitcast <128 x i16> %2464 to <64 x i32>
  %2466 = insertelement <128 x i8> undef, i8 %output_max, i32 0
  %2467 = shufflevector <128 x i8> %2466, <128 x i8> undef, <128 x i32> zeroinitializer
  %2468 = bitcast <128 x i8> %2467 to <32 x i32>
  %2469 = insertelement <128 x i8> undef, i8 %output_min, i32 0
  %2470 = shufflevector <128 x i8> %2469, <128 x i8> undef, <128 x i32> zeroinitializer
  %2471 = bitcast <128 x i8> %2470 to <32 x i32>
  %reass.add889 = add i32 %.neg878, %.neg879
  %reass.add890 = add i32 %reass.add889, %.neg880
  br i1 %2451, label %"for output.s0.b.rebased193.us.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased193.us.preheader":        ; preds = %"for output.s0.b.rebased193.preheader"
  %2472 = add i32 %7, -1
  %2473 = add i32 %9, -1
  %brmerge1444.demorgan = and i1 %2453, %2454
  %xtraiter1629 = and i32 %7, 7
  %2474 = icmp ult i32 %2472, 7
  %unroll_iter1634 = and i32 %7, -8
  %lcmp.mod1631.not = icmp eq i32 %xtraiter1629, 0
  %xtraiter1636 = and i32 %9, 3
  %2475 = icmp ult i32 %2473, 3
  %unroll_iter1641 = and i32 %9, -4
  %lcmp.mod1638.not = icmp eq i32 %xtraiter1636, 0
  %xtraiter1643 = and i32 %7, 3
  %2476 = icmp ult i32 %2472, 3
  %unroll_iter1650 = and i32 %7, -4
  %lcmp.mod1645.not = icmp eq i32 %xtraiter1643, 0
  br label %"for output.s0.b.rebased193.us"

"for output.s0.b.rebased193.us":                  ; preds = %"for output.s0.b.rebased193.us.preheader", %"end for output.s0.y.rebased197.loopexit.us"
  %sum_input395.sroa.0.14.us = phi <6 x i32> [ %sum_input395.sroa.0.26.us, %"end for output.s0.y.rebased197.loopexit.us" ], [ undef, %"for output.s0.b.rebased193.us.preheader" ]
  %output.s0.b.rebased195.us = phi i32 [ %2618, %"end for output.s0.y.rebased197.loopexit.us" ], [ 0, %"for output.s0.b.rebased193.us.preheader" ]
  %2477 = add nsw i32 %output.s0.b.rebased195.us, %20
  %2478 = mul nsw i32 %2477, %31
  %2479 = mul nsw i32 %2477, %22
  %2480 = sub i32 %2479, %t1121
  %2481 = sub i32 %2479, %2449
  %2482 = sub i32 %2478, %reass.add890
  br label %"for output.s0.y.rebased196.us"

"for output.s0.y.rebased196.us":                  ; preds = %"for output.s0.b.rebased193.us", %"end for output.s0.x.xo200.us"
  %sum_input395.sroa.0.15.us = phi <6 x i32> [ %sum_input395.sroa.0.26.us, %"end for output.s0.x.xo200.us" ], [ %sum_input395.sroa.0.14.us, %"for output.s0.b.rebased193.us" ]
  %output.s0.y.rebased198.us = phi i32 [ %2595, %"end for output.s0.x.xo200.us" ], [ 0, %"for output.s0.b.rebased193.us" ]
  %2483 = add nsw i32 %output.s0.y.rebased198.us, %28
  %2484 = mul nsw i32 %2483, %30
  %2485 = mul nsw i32 %2483, %stride_y
  %t1133.us = add i32 %2482, %2484
  br label %"for output.s0.x.xo199.us"

"for output.s0.x.xo199.us":                       ; preds = %"end for output.s0.c.co226.us", %"for output.s0.y.rebased196.us"
  %sum_input395.sroa.0.17.us = phi <6 x i32> [ %sum_input395.sroa.0.15.us, %"for output.s0.y.rebased196.us" ], [ %sum_input395.sroa.0.26.us, %"end for output.s0.c.co226.us" ]
  %output.s0.x.xo201.us = phi i32 [ 0, %"for output.s0.y.rebased196.us" ], [ %2594, %"end for output.s0.c.co226.us" ]
  br i1 %t843.not, label %"consume sum_input224.us", label %then_bb204.us

then_bb204.us:                                    ; preds = %"for output.s0.x.xo199.us"
  %sum_input395.sroa.0.0.vec.insert701.us = insertelement <6 x i32> %sum_input395.sroa.0.17.us, i32 0, i32 0
  br i1 %t844, label %then_bb207.us, label %next_bb208.us

next_bb208.us:                                    ; preds = %then_bb204.us
  br i1 %2452, label %"for sum_input.s1.r19$y215.preheader.us", label %"consume sum_input224.us", !prof !96

then_bb207.us:                                    ; preds = %then_bb204.us
  br i1 %2452, label %"for sum_input.s1.r19$y209.preheader.us", label %"consume sum_input224.us", !prof !96

"for sum_input.s1.r19$y209.us":                   ; preds = %"for sum_input.s1.r19$y209.preheader.us", %"end for sum_input.s1.r19$x213.us"
  %sum_input395.sroa.0.18.us = phi <6 x i32> [ %sum_input395.sroa.0.20.us, %"end for sum_input.s1.r19$x213.us" ], [ %sum_input395.sroa.0.0.vec.insert701.us, %"for sum_input.s1.r19$y209.preheader.us" ]
  %"sum_input.s1.r19$y211.us" = phi i32 [ %2531, %"end for sum_input.s1.r19$x213.us" ], [ 0, %"for sum_input.s1.r19$y209.preheader.us" ]
  br i1 %2453, label %"for sum_input.s1.r19$x212.preheader.us", label %"end for sum_input.s1.r19$x213.us", !prof !96

"for sum_input.s1.r19$x212.us":                   ; preds = %"for sum_input.s1.r19$x212.preheader.us", %"for sum_input.s1.r19$x212.us"
  %sum_input395.sroa.0.19.us = phi <6 x i32> [ %sum_input395.sroa.0.0.vec.insert697.us.3, %"for sum_input.s1.r19$x212.us" ], [ %sum_input395.sroa.0.18.us, %"for sum_input.s1.r19$x212.preheader.us" ]
  %"sum_input.s1.r19$x214.us" = phi i32 [ %2521, %"for sum_input.s1.r19$x212.us" ], [ 0, %"for sum_input.s1.r19$x212.preheader.us" ]
  %niter1642 = phi i32 [ %niter1642.nsub.3, %"for sum_input.s1.r19$x212.us" ], [ %unroll_iter1641, %"for sum_input.s1.r19$x212.preheader.us" ]
  %sum_input395.sroa.0.0.vec.extract699.us = extractelement <6 x i32> %sum_input395.sroa.0.19.us, i32 0
  %2486 = mul nsw i32 %"sum_input.s1.r19$x214.us", %dilation_x
  %reass.add887.us = add i32 %2615, %2486
  %reass.mul888.us = shl i32 %reass.add887.us, 2
  %2487 = add i32 %t1136.us, %reass.mul888.us
  %2488 = getelementptr inbounds i8, i8* %13, i32 %2487
  %2489 = bitcast i8* %2488 to <4 x i8>*
  %2490 = load <4 x i8>, <4 x i8>* %2489, align 4, !tbaa !110
  %2491 = zext <4 x i8> %2490 to <4 x i32>
  %2492 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2491) #9
  %2493 = add nsw i32 %2492, %sum_input395.sroa.0.0.vec.extract699.us
  %2494 = or i32 %"sum_input.s1.r19$x214.us", 1
  %2495 = mul nsw i32 %2494, %dilation_x
  %reass.add887.us.1 = add i32 %2615, %2495
  %reass.mul888.us.1 = shl i32 %reass.add887.us.1, 2
  %2496 = add i32 %t1136.us, %reass.mul888.us.1
  %2497 = getelementptr inbounds i8, i8* %13, i32 %2496
  %2498 = bitcast i8* %2497 to <4 x i8>*
  %2499 = load <4 x i8>, <4 x i8>* %2498, align 4, !tbaa !110
  %2500 = zext <4 x i8> %2499 to <4 x i32>
  %2501 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2500) #9
  %2502 = add nsw i32 %2501, %2493
  %2503 = or i32 %"sum_input.s1.r19$x214.us", 2
  %2504 = mul nsw i32 %2503, %dilation_x
  %reass.add887.us.2 = add i32 %2615, %2504
  %reass.mul888.us.2 = shl i32 %reass.add887.us.2, 2
  %2505 = add i32 %t1136.us, %reass.mul888.us.2
  %2506 = getelementptr inbounds i8, i8* %13, i32 %2505
  %2507 = bitcast i8* %2506 to <4 x i8>*
  %2508 = load <4 x i8>, <4 x i8>* %2507, align 4, !tbaa !110
  %2509 = zext <4 x i8> %2508 to <4 x i32>
  %2510 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2509) #9
  %2511 = add nsw i32 %2510, %2502
  %sum_input395.sroa.0.0.vec.insert697.us.2 = insertelement <6 x i32> %sum_input395.sroa.0.19.us, i32 %2511, i32 0
  %2512 = or i32 %"sum_input.s1.r19$x214.us", 3
  %2513 = mul nsw i32 %2512, %dilation_x
  %reass.add887.us.3 = add i32 %2615, %2513
  %reass.mul888.us.3 = shl i32 %reass.add887.us.3, 2
  %2514 = add i32 %t1136.us, %reass.mul888.us.3
  %2515 = getelementptr inbounds i8, i8* %13, i32 %2514
  %2516 = bitcast i8* %2515 to <4 x i8>*
  %2517 = load <4 x i8>, <4 x i8>* %2516, align 4, !tbaa !110
  %2518 = zext <4 x i8> %2517 to <4 x i32>
  %2519 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2518) #9
  %2520 = add nsw i32 %2519, %2511
  %sum_input395.sroa.0.0.vec.insert697.us.3 = insertelement <6 x i32> %sum_input395.sroa.0.0.vec.insert697.us.2, i32 %2520, i32 0
  %2521 = add nuw nsw i32 %"sum_input.s1.r19$x214.us", 4
  %niter1642.nsub.3 = add i32 %niter1642, -4
  %niter1642.ncmp.3 = icmp eq i32 %niter1642.nsub.3, 0
  br i1 %niter1642.ncmp.3, label %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa.loopexit", label %"for sum_input.s1.r19$x212.us"

"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa.loopexit": ; preds = %"for sum_input.s1.r19$x212.us"
  %sum_input395.sroa.0.0.vec.insert697.us.2.le = insertelement <6 x i32> %sum_input395.sroa.0.19.us, i32 %2511, i32 0
  %sum_input395.sroa.0.0.vec.insert697.us.3.le = insertelement <6 x i32> %sum_input395.sroa.0.0.vec.insert697.us.2.le, i32 %2520, i32 0
  br label %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa"

"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa": ; preds = %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa.loopexit", %"for sum_input.s1.r19$x212.preheader.us"
  %sum_input395.sroa.0.19.us.lcssa.ph = phi <6 x i32> [ undef, %"for sum_input.s1.r19$x212.preheader.us" ], [ %sum_input395.sroa.0.0.vec.insert697.us.2.le, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa.loopexit" ]
  %.lcssa1580.ph = phi i32 [ undef, %"for sum_input.s1.r19$x212.preheader.us" ], [ %2520, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa.loopexit" ]
  %sum_input395.sroa.0.19.us.unr = phi <6 x i32> [ %sum_input395.sroa.0.18.us, %"for sum_input.s1.r19$x212.preheader.us" ], [ %sum_input395.sroa.0.0.vec.insert697.us.3.le, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa.loopexit" ]
  %"sum_input.s1.r19$x214.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x212.preheader.us" ], [ %2521, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa.loopexit" ]
  br i1 %lcmp.mod1638.not, label %"end for sum_input.s1.r19$x213.us.loopexit", label %"for sum_input.s1.r19$x212.us.epil"

"for sum_input.s1.r19$x212.us.epil":              ; preds = %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x212.us.epil"
  %sum_input395.sroa.0.19.us.epil = phi <6 x i32> [ %sum_input395.sroa.0.0.vec.insert697.us.epil, %"for sum_input.s1.r19$x212.us.epil" ], [ %sum_input395.sroa.0.19.us.unr, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa" ]
  %"sum_input.s1.r19$x214.us.epil" = phi i32 [ %2530, %"for sum_input.s1.r19$x212.us.epil" ], [ %"sum_input.s1.r19$x214.us.unr", %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa" ]
  %epil.iter1637 = phi i32 [ %epil.iter1637.sub, %"for sum_input.s1.r19$x212.us.epil" ], [ %xtraiter1636, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa" ]
  %sum_input395.sroa.0.0.vec.extract699.us.epil = extractelement <6 x i32> %sum_input395.sroa.0.19.us.epil, i32 0
  %2522 = mul nsw i32 %"sum_input.s1.r19$x214.us.epil", %dilation_x
  %reass.add887.us.epil = add i32 %2615, %2522
  %reass.mul888.us.epil = shl i32 %reass.add887.us.epil, 2
  %2523 = add i32 %t1136.us, %reass.mul888.us.epil
  %2524 = getelementptr inbounds i8, i8* %13, i32 %2523
  %2525 = bitcast i8* %2524 to <4 x i8>*
  %2526 = load <4 x i8>, <4 x i8>* %2525, align 4, !tbaa !110
  %2527 = zext <4 x i8> %2526 to <4 x i32>
  %2528 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2527) #9
  %2529 = add nsw i32 %2528, %sum_input395.sroa.0.0.vec.extract699.us.epil
  %sum_input395.sroa.0.0.vec.insert697.us.epil = insertelement <6 x i32> %sum_input395.sroa.0.19.us.epil, i32 %2529, i32 0
  %2530 = add nuw nsw i32 %"sum_input.s1.r19$x214.us.epil", 1
  %epil.iter1637.sub = add i32 %epil.iter1637, -1
  %epil.iter1637.cmp.not = icmp eq i32 %epil.iter1637.sub, 0
  br i1 %epil.iter1637.cmp.not, label %"end for sum_input.s1.r19$x213.us.loopexit", label %"for sum_input.s1.r19$x212.us.epil", !llvm.loop !118

"end for sum_input.s1.r19$x213.us.loopexit":      ; preds = %"for sum_input.s1.r19$x212.us.epil", %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa"
  %sum_input395.sroa.0.19.us.lcssa = phi <6 x i32> [ %sum_input395.sroa.0.19.us.lcssa.ph, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa" ], [ %sum_input395.sroa.0.19.us.epil, %"for sum_input.s1.r19$x212.us.epil" ]
  %.lcssa1580 = phi i32 [ %.lcssa1580.ph, %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa" ], [ %2529, %"for sum_input.s1.r19$x212.us.epil" ]
  %sum_input395.sroa.0.0.vec.insert697.us.le = insertelement <6 x i32> %sum_input395.sroa.0.19.us.lcssa, i32 %.lcssa1580, i32 0
  br label %"end for sum_input.s1.r19$x213.us"

"end for sum_input.s1.r19$x213.us":               ; preds = %"end for sum_input.s1.r19$x213.us.loopexit", %"for sum_input.s1.r19$y209.us"
  %sum_input395.sroa.0.20.us = phi <6 x i32> [ %sum_input395.sroa.0.18.us, %"for sum_input.s1.r19$y209.us" ], [ %sum_input395.sroa.0.0.vec.insert697.us.le, %"end for sum_input.s1.r19$x213.us.loopexit" ]
  %2531 = add nuw nsw i32 %"sum_input.s1.r19$y211.us", 1
  %.not425.us = icmp eq i32 %2531, %11
  br i1 %.not425.us, label %"consume sum_input224.us", label %"for sum_input.s1.r19$y209.us"

"consume sum_input224.us.loopexit1368":           ; preds = %"end for sum_input.s1.r19$x219.loopexit.split.us.us.us.us"
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.le.le.le = insertelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us.lcssa, i32 %.lcssa1579, i32 0
  br label %"consume sum_input224.us"

"consume sum_input224.us":                        ; preds = %"end for sum_input.s1.r19$x213.us", %"for sum_input.s1.r19$y215.preheader.us", %"consume sum_input224.us.loopexit1368", %then_bb207.us, %next_bb208.us, %"for output.s0.x.xo199.us"
  %sum_input395.sroa.0.26.us = phi <6 x i32> [ %sum_input395.sroa.0.17.us, %"for output.s0.x.xo199.us" ], [ %sum_input395.sroa.0.0.vec.insert701.us, %then_bb207.us ], [ %sum_input395.sroa.0.0.vec.insert701.us, %next_bb208.us ], [ %sum_input395.sroa.0.0.vec.insert701.us, %"for sum_input.s1.r19$y215.preheader.us" ], [ %sum_input395.sroa.0.0.vec.insert.us.us.us.us.le.le.le, %"consume sum_input224.us.loopexit1368" ], [ %sum_input395.sroa.0.20.us, %"end for sum_input.s1.r19$x213.us" ]
  br i1 %2456, label %"for output.s0.c.co225.preheader.us", label %"end for output.s0.c.co226.us", !prof !96

"for output.s0.c.co225.us":                       ; preds = %"for output.s0.c.co225.preheader.us", %"consume convolved241.us"
  %output.s0.c.co227.us = phi i32 [ %2593, %"consume convolved241.us" ], [ 0, %"for output.s0.c.co225.preheader.us" ]
  %2532 = shl nsw i32 %output.s0.c.co227.us, 7
  %2533 = getelementptr inbounds i32, i32* %offset_c, i32 %2532
  %2534 = bitcast i32* %2533 to <32 x i32>*
  %2535 = load <32 x i32>, <32 x i32>* %2534, align 128, !tbaa !104
  br i1 %t843.not, label %then_bb230.us, label %next_bb231.us

next_bb231.us:                                    ; preds = %"for output.s0.c.co225.us"
  %2536 = sub nsw <32 x i32> %2535, %2609
  %2537 = getelementptr inbounds i32, i32* %2533, i32 32
  %2538 = bitcast i32* %2537 to <32 x i32>*
  %2539 = load <32 x i32>, <32 x i32>* %2538, align 128, !tbaa !104
  %2540 = sub nsw <32 x i32> %2539, %2609
  %2541 = getelementptr inbounds i32, i32* %2533, i32 64
  %2542 = bitcast i32* %2541 to <32 x i32>*
  %2543 = load <32 x i32>, <32 x i32>* %2542, align 128, !tbaa !104
  %2544 = sub nsw <32 x i32> %2543, %2609
  %2545 = getelementptr inbounds i32, i32* %2533, i32 96
  %2546 = bitcast i32* %2545 to <32 x i32>*
  %2547 = load <32 x i32>, <32 x i32>* %2546, align 128, !tbaa !104
  %2548 = sub nsw <32 x i32> %2547, %2609
  br label %after_bb229.us

then_bb230.us:                                    ; preds = %"for output.s0.c.co225.us"
  %2549 = getelementptr inbounds i32, i32* %2533, i32 32
  %2550 = bitcast i32* %2549 to <32 x i32>*
  %2551 = load <32 x i32>, <32 x i32>* %2550, align 128, !tbaa !104
  %2552 = getelementptr inbounds i32, i32* %2533, i32 64
  %2553 = bitcast i32* %2552 to <32 x i32>*
  %2554 = load <32 x i32>, <32 x i32>* %2553, align 128, !tbaa !104
  %2555 = getelementptr inbounds i32, i32* %2533, i32 96
  %2556 = bitcast i32* %2555 to <32 x i32>*
  %2557 = load <32 x i32>, <32 x i32>* %2556, align 128, !tbaa !104
  br label %after_bb229.us

after_bb229.us:                                   ; preds = %then_bb230.us, %next_bb231.us
  %convolved394.sroa.78.14.us = phi <32 x i32> [ %2557, %then_bb230.us ], [ %2548, %next_bb231.us ]
  %convolved394.sroa.63.14.us = phi <32 x i32> [ %2554, %then_bb230.us ], [ %2544, %next_bb231.us ]
  %convolved394.sroa.48.14.us = phi <32 x i32> [ %2551, %then_bb230.us ], [ %2540, %next_bb231.us ]
  %convolved394.sroa.0.28.us = phi <32 x i32> [ %2535, %then_bb230.us ], [ %2536, %next_bb231.us ]
  br i1 %2452, label %"for convolved.s1.r19$y232.preheader.us", label %"consume convolved241.us", !prof !96

"consume convolved241.us":                        ; preds = %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us", %"for convolved.s1.r19$y232.preheader.split.us.us", %"for convolved.s1.r19$y232.preheader.us", %after_bb229.us
  %convolved394.sroa.78.20.us = phi <32 x i32> [ %convolved394.sroa.78.14.us, %after_bb229.us ], [ %convolved394.sroa.78.14.us, %"for convolved.s1.r19$y232.preheader.us" ], [ %convolved394.sroa.78.14.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ], [ %.lcssa1581, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ]
  %convolved394.sroa.63.20.us = phi <32 x i32> [ %convolved394.sroa.63.14.us, %after_bb229.us ], [ %convolved394.sroa.63.14.us, %"for convolved.s1.r19$y232.preheader.us" ], [ %convolved394.sroa.63.14.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ], [ %.lcssa1582, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ]
  %convolved394.sroa.48.20.us = phi <32 x i32> [ %convolved394.sroa.48.14.us, %after_bb229.us ], [ %convolved394.sroa.48.14.us, %"for convolved.s1.r19$y232.preheader.us" ], [ %convolved394.sroa.48.14.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ], [ %.lcssa1583, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ]
  %convolved394.sroa.0.34.us = phi <32 x i32> [ %convolved394.sroa.0.28.us, %after_bb229.us ], [ %convolved394.sroa.0.28.us, %"for convolved.s1.r19$y232.preheader.us" ], [ %convolved394.sroa.0.28.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ], [ %.lcssa1584, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ]
  %ab1.i659.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.0.34.us, <32 x i32> %2458) #11
  %ab.i660.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i659.us, <32 x i32> %convolved394.sroa.0.34.us, <32 x i32> %2458) #11
  %ab1.i661.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.48.20.us, <32 x i32> %2458) #11
  %ab.i662.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i661.us, <32 x i32> %convolved394.sroa.48.20.us, <32 x i32> %2458) #11
  %ab1.i663.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.63.20.us, <32 x i32> %2458) #11
  %ab.i664.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i663.us, <32 x i32> %convolved394.sroa.63.20.us, <32 x i32> %2458) #11
  %ab1.i665.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.78.20.us, <32 x i32> %2458) #11
  %ab.i666.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i665.us, <32 x i32> %convolved394.sroa.78.20.us, <32 x i32> %2458) #11
  %2558 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i660.us, i32 %output_shift) #11
  %2559 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i662.us, i32 %output_shift) #11
  %2560 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i664.us, i32 %output_shift) #11
  %2561 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i666.us, i32 %output_shift) #11
  %2562 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %2559, <32 x i32> %2558)
  %2563 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %2561, <32 x i32> %2560)
  %2564 = shufflevector <64 x i32> %2562, <64 x i32> %2563, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %2565 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i660.us, i32 %2461) #11
  %2566 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i662.us, i32 %2461) #11
  %2567 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i664.us, i32 %2461) #11
  %2568 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i666.us, i32 %2461) #11
  %2569 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %2566, <32 x i32> %2565)
  %2570 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %2568, <32 x i32> %2567)
  %2571 = shufflevector <64 x i32> %2569, <64 x i32> %2570, <128 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %2572 = and <128 x i32> %2571, %2460
  %2573 = add nsw <128 x i32> %2572, %2564
  %2574 = shufflevector <128 x i32> %2573, <128 x i32> undef, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %2575 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2574) #11
  %2576 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2574) #11
  %2577 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %2576, <32 x i32> %2575) #11
  %2578 = shufflevector <128 x i32> %2573, <128 x i32> undef, <64 x i32> <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111, i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119, i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %2579 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2578) #11
  %2580 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2578) #11
  %2581 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %2580, <32 x i32> %2579) #11
  %2582 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %2581, <32 x i32> %2577)
  %2583 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %2582, <64 x i32> %2465) #11
  %2584 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2583) #11
  %2585 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2583) #11
  %2586 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %2584, <32 x i32> %2585) #11
  %2587 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %2586, <32 x i32> %2468) #11
  %2588 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %2587, <32 x i32> %2471) #11
  %2589 = shl nsw i32 %output.s0.c.co227.us, 7
  %2590 = add i32 %2613, %2589
  %2591 = getelementptr inbounds i8, i8* %23, i32 %2590
  %2592 = bitcast i8* %2591 to <32 x i32>*
  store <32 x i32> %2588, <32 x i32>* %2592, align 1, !tbaa !113
  %2593 = add nuw nsw i32 %output.s0.c.co227.us, 1
  %.not418.us = icmp eq i32 %2593, %2455
  br i1 %.not418.us, label %"end for output.s0.c.co226.us", label %"for output.s0.c.co225.us"

"end for output.s0.c.co226.us":                   ; preds = %"consume convolved241.us", %"consume sum_input224.us"
  %2594 = add nuw nsw i32 %output.s0.x.xo201.us, 1
  %.not416.us = icmp eq i32 %2594, %26
  br i1 %.not416.us, label %"end for output.s0.x.xo200.us", label %"for output.s0.x.xo199.us"

"end for output.s0.x.xo200.us":                   ; preds = %"end for output.s0.c.co226.us"
  %2595 = add nuw nsw i32 %output.s0.y.rebased198.us, 1
  %.not417.us = icmp eq i32 %2595, %29
  br i1 %.not417.us, label %"end for output.s0.y.rebased197.loopexit.us", label %"for output.s0.y.rebased196.us"

"for convolved.s1.r19$y232.preheader.us":         ; preds = %after_bb229.us
  %2596 = shl nsw i32 %output.s0.c.co227.us, 2
  %2597 = or i32 %2596, 3
  %2598 = mul nsw i32 %2597, %8
  %2599 = or i32 %2596, 2
  %2600 = mul nsw i32 %2599, %8
  %2601 = or i32 %2596, 1
  %2602 = mul nsw i32 %2601, %8
  %2603 = mul nsw i32 %output.s0.c.co227.us, %8
  br i1 %2453, label %"for convolved.s1.r19$y232.preheader.split.us.us", label %"consume convolved241.us", !prof !96

"for sum_input.s1.r19$x212.preheader.us":         ; preds = %"for sum_input.s1.r19$y209.us"
  %2604 = mul nsw i32 %"sum_input.s1.r19$y211.us", %dilation_y
  %2605 = add nsw i32 %2604, %2485
  %2606 = mul nsw i32 %2605, %19
  %t1136.us = add i32 %2481, %2606
  br i1 %2475, label %"end for sum_input.s1.r19$x213.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x212.us"

"for output.s0.c.co225.preheader.us":             ; preds = %"consume sum_input224.us"
  %sum_input395.sroa.0.0.vec.extract692.us = extractelement <6 x i32> %sum_input395.sroa.0.26.us, i32 0
  %2607 = mul nsw i32 %sum_input395.sroa.0.0.vec.extract692.us, %307
  %2608 = insertelement <32 x i32> undef, i32 %2607, i32 0
  %2609 = shufflevector <32 x i32> %2608, <32 x i32> undef, <32 x i32> zeroinitializer
  %2610 = add nsw i32 %output.s0.x.xo201.us, %25
  %2611 = mul nsw i32 %2610, %stride_x
  %2612 = mul nsw i32 %2610, %27
  %2613 = add i32 %t1133.us, %2612
  br label %"for output.s0.c.co225.us"

"for sum_input.s1.r19$y209.preheader.us":         ; preds = %then_bb207.us
  %2614 = add nsw i32 %output.s0.x.xo201.us, %25
  %2615 = sub i32 %2614, %16
  br label %"for sum_input.s1.r19$y209.us"

"for sum_input.s1.r19$y215.preheader.us":         ; preds = %next_bb208.us
  %2616 = add nsw i32 %output.s0.x.xo201.us, %25
  %2617 = mul nsw i32 %2616, %stride_x
  br i1 %brmerge1444.demorgan, label %"for sum_input.s1.r19$y215.us.us.us", label %"consume sum_input224.us", !prof !103

"end for output.s0.y.rebased197.loopexit.us":     ; preds = %"end for output.s0.x.xo200.us"
  %2618 = add nuw nsw i32 %output.s0.b.rebased195.us, 1
  %.not415.us = icmp eq i32 %2618, %21
  br i1 %.not415.us, label %after_bb3, label %"for output.s0.b.rebased193.us"

"for sum_input.s1.r19$y215.us.us.us":             ; preds = %"for sum_input.s1.r19$y215.preheader.us", %"end for sum_input.s1.r19$x219.loopexit.split.us.us.us.us"
  %sum_input395.sroa.0.21.us.us.us = phi <6 x i32> [ %sum_input395.sroa.0.0.vec.insert.us.us.us.us.le.le, %"end for sum_input.s1.r19$x219.loopexit.split.us.us.us.us" ], [ %sum_input395.sroa.0.0.vec.insert701.us, %"for sum_input.s1.r19$y215.preheader.us" ]
  %"sum_input.s1.r19$y217.us.us.us" = phi i32 [ %2707, %"end for sum_input.s1.r19$x219.loopexit.split.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y215.preheader.us" ]
  %2619 = mul nsw i32 %"sum_input.s1.r19$y217.us.us.us", %dilation_y
  %2620 = add nsw i32 %2619, %2485
  %2621 = mul nsw i32 %2620, %19
  %t1138.us.us.us = add nsw i32 %2480, %2621
  br label %"for sum_input.s1.r19$x218.us.us.us.us"

"for sum_input.s1.r19$x218.us.us.us.us":          ; preds = %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us", %"for sum_input.s1.r19$y215.us.us.us"
  %sum_input395.sroa.0.22.us.us.us.us = phi <6 x i32> [ %sum_input395.sroa.0.0.vec.insert.us.us.us.us.le, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us" ], [ %sum_input395.sroa.0.21.us.us.us, %"for sum_input.s1.r19$y215.us.us.us" ]
  %"sum_input.s1.r19$x220.us.us.us.us" = phi i32 [ %2706, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$y215.us.us.us" ]
  %2622 = mul nsw i32 %"sum_input.s1.r19$x220.us.us.us.us", %dilation_x
  %t1139.s.us.us.us.us = add nsw i32 %2622, %2617
  %2623 = mul nsw i32 %t1139.s.us.us.us.us, %17
  %2624 = add nsw i32 %t1138.us.us.us, %2623
  br i1 %2474, label %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r124221.us.us.us.us"

"for sum_input.s1.r19$z.r124221.us.us.us.us":     ; preds = %"for sum_input.s1.r19$x218.us.us.us.us", %"for sum_input.s1.r19$z.r124221.us.us.us.us"
  %sum_input395.sroa.0.24.us.us.us.us = phi <6 x i32> [ %sum_input395.sroa.0.0.vec.insert.us.us.us.us.7, %"for sum_input.s1.r19$z.r124221.us.us.us.us" ], [ %sum_input395.sroa.0.22.us.us.us.us, %"for sum_input.s1.r19$x218.us.us.us.us" ]
  %"sum_input.s1.r19$z.r124223.us.us.us.us" = phi i32 [ %2696, %"for sum_input.s1.r19$z.r124221.us.us.us.us" ], [ 0, %"for sum_input.s1.r19$x218.us.us.us.us" ]
  %niter1635 = phi i32 [ %niter1635.nsub.7, %"for sum_input.s1.r19$z.r124221.us.us.us.us" ], [ %unroll_iter1634, %"for sum_input.s1.r19$x218.us.us.us.us" ]
  %sum_input395.sroa.0.0.vec.extract695.us.us.us.us = extractelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us, i32 0
  %2625 = shl nsw i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2626 = add nsw i32 %2624, %2625
  %2627 = getelementptr inbounds i8, i8* %13, i32 %2626
  %2628 = bitcast i8* %2627 to <4 x i8>*
  %2629 = load <4 x i8>, <4 x i8>* %2628, align 4, !tbaa !110
  %2630 = zext <4 x i8> %2629 to <4 x i32>
  %2631 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2630) #9
  %2632 = add nsw i32 %2631, %sum_input395.sroa.0.0.vec.extract695.us.us.us.us
  %2633 = shl i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2634 = or i32 %2633, 4
  %2635 = add nsw i32 %2624, %2634
  %2636 = getelementptr inbounds i8, i8* %13, i32 %2635
  %2637 = bitcast i8* %2636 to <4 x i8>*
  %2638 = load <4 x i8>, <4 x i8>* %2637, align 4, !tbaa !110
  %2639 = zext <4 x i8> %2638 to <4 x i32>
  %2640 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2639) #9
  %2641 = add nsw i32 %2640, %2632
  %2642 = shl i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2643 = or i32 %2642, 8
  %2644 = add nsw i32 %2624, %2643
  %2645 = getelementptr inbounds i8, i8* %13, i32 %2644
  %2646 = bitcast i8* %2645 to <4 x i8>*
  %2647 = load <4 x i8>, <4 x i8>* %2646, align 4, !tbaa !110
  %2648 = zext <4 x i8> %2647 to <4 x i32>
  %2649 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2648) #9
  %2650 = add nsw i32 %2649, %2641
  %2651 = shl i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2652 = or i32 %2651, 12
  %2653 = add nsw i32 %2624, %2652
  %2654 = getelementptr inbounds i8, i8* %13, i32 %2653
  %2655 = bitcast i8* %2654 to <4 x i8>*
  %2656 = load <4 x i8>, <4 x i8>* %2655, align 4, !tbaa !110
  %2657 = zext <4 x i8> %2656 to <4 x i32>
  %2658 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2657) #9
  %2659 = add nsw i32 %2658, %2650
  %2660 = shl i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2661 = or i32 %2660, 16
  %2662 = add nsw i32 %2624, %2661
  %2663 = getelementptr inbounds i8, i8* %13, i32 %2662
  %2664 = bitcast i8* %2663 to <4 x i8>*
  %2665 = load <4 x i8>, <4 x i8>* %2664, align 4, !tbaa !110
  %2666 = zext <4 x i8> %2665 to <4 x i32>
  %2667 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2666) #9
  %2668 = add nsw i32 %2667, %2659
  %2669 = shl i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2670 = or i32 %2669, 20
  %2671 = add nsw i32 %2624, %2670
  %2672 = getelementptr inbounds i8, i8* %13, i32 %2671
  %2673 = bitcast i8* %2672 to <4 x i8>*
  %2674 = load <4 x i8>, <4 x i8>* %2673, align 4, !tbaa !110
  %2675 = zext <4 x i8> %2674 to <4 x i32>
  %2676 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2675) #9
  %2677 = add nsw i32 %2676, %2668
  %2678 = shl i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2679 = or i32 %2678, 24
  %2680 = add nsw i32 %2624, %2679
  %2681 = getelementptr inbounds i8, i8* %13, i32 %2680
  %2682 = bitcast i8* %2681 to <4 x i8>*
  %2683 = load <4 x i8>, <4 x i8>* %2682, align 4, !tbaa !110
  %2684 = zext <4 x i8> %2683 to <4 x i32>
  %2685 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2684) #9
  %2686 = add nsw i32 %2685, %2677
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.6 = insertelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us, i32 %2686, i32 0
  %2687 = shl i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 2
  %2688 = or i32 %2687, 28
  %2689 = add nsw i32 %2624, %2688
  %2690 = getelementptr inbounds i8, i8* %13, i32 %2689
  %2691 = bitcast i8* %2690 to <4 x i8>*
  %2692 = load <4 x i8>, <4 x i8>* %2691, align 4, !tbaa !110
  %2693 = zext <4 x i8> %2692 to <4 x i32>
  %2694 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2693) #9
  %2695 = add nsw i32 %2694, %2686
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.7 = insertelement <6 x i32> %sum_input395.sroa.0.0.vec.insert.us.us.us.us.6, i32 %2695, i32 0
  %2696 = add nuw nsw i32 %"sum_input.s1.r19$z.r124223.us.us.us.us", 8
  %niter1635.nsub.7 = add i32 %niter1635, -8
  %niter1635.ncmp.7 = icmp eq i32 %niter1635.nsub.7, 0
  br i1 %niter1635.ncmp.7, label %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa.loopexit", label %"for sum_input.s1.r19$z.r124221.us.us.us.us"

"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa.loopexit": ; preds = %"for sum_input.s1.r19$z.r124221.us.us.us.us"
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.6.le = insertelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us, i32 %2686, i32 0
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.7.le = insertelement <6 x i32> %sum_input395.sroa.0.0.vec.insert.us.us.us.us.6.le, i32 %2695, i32 0
  br label %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa"

"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa": ; preds = %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa.loopexit", %"for sum_input.s1.r19$x218.us.us.us.us"
  %sum_input395.sroa.0.24.us.us.us.us.lcssa.ph = phi <6 x i32> [ undef, %"for sum_input.s1.r19$x218.us.us.us.us" ], [ %sum_input395.sroa.0.0.vec.insert.us.us.us.us.6.le, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa.loopexit" ]
  %.lcssa1579.ph = phi i32 [ undef, %"for sum_input.s1.r19$x218.us.us.us.us" ], [ %2695, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa.loopexit" ]
  %sum_input395.sroa.0.24.us.us.us.us.unr = phi <6 x i32> [ %sum_input395.sroa.0.22.us.us.us.us, %"for sum_input.s1.r19$x218.us.us.us.us" ], [ %sum_input395.sroa.0.0.vec.insert.us.us.us.us.7.le, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa.loopexit" ]
  %"sum_input.s1.r19$z.r124223.us.us.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x218.us.us.us.us" ], [ %2696, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa.loopexit" ]
  br i1 %lcmp.mod1631.not, label %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us", label %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil"

"for sum_input.s1.r19$z.r124221.us.us.us.us.epil": ; preds = %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa", %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil"
  %sum_input395.sroa.0.24.us.us.us.us.epil = phi <6 x i32> [ %sum_input395.sroa.0.0.vec.insert.us.us.us.us.epil, %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil" ], [ %sum_input395.sroa.0.24.us.us.us.us.unr, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa" ]
  %"sum_input.s1.r19$z.r124223.us.us.us.us.epil" = phi i32 [ %2705, %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil" ], [ %"sum_input.s1.r19$z.r124223.us.us.us.us.unr", %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa" ]
  %epil.iter1630 = phi i32 [ %epil.iter1630.sub, %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil" ], [ %xtraiter1629, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa" ]
  %sum_input395.sroa.0.0.vec.extract695.us.us.us.us.epil = extractelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us.epil, i32 0
  %2697 = shl nsw i32 %"sum_input.s1.r19$z.r124223.us.us.us.us.epil", 2
  %2698 = add nsw i32 %2624, %2697
  %2699 = getelementptr inbounds i8, i8* %13, i32 %2698
  %2700 = bitcast i8* %2699 to <4 x i8>*
  %2701 = load <4 x i8>, <4 x i8>* %2700, align 4, !tbaa !110
  %2702 = zext <4 x i8> %2701 to <4 x i32>
  %2703 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2702) #9
  %2704 = add nsw i32 %2703, %sum_input395.sroa.0.0.vec.extract695.us.us.us.us.epil
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.epil = insertelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us.epil, i32 %2704, i32 0
  %2705 = add nuw nsw i32 %"sum_input.s1.r19$z.r124223.us.us.us.us.epil", 1
  %epil.iter1630.sub = add i32 %epil.iter1630, -1
  %epil.iter1630.cmp.not = icmp eq i32 %epil.iter1630.sub, 0
  br i1 %epil.iter1630.cmp.not, label %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us", label %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil", !llvm.loop !119

"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us": ; preds = %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil", %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa"
  %sum_input395.sroa.0.24.us.us.us.us.lcssa = phi <6 x i32> [ %sum_input395.sroa.0.24.us.us.us.us.lcssa.ph, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa" ], [ %sum_input395.sroa.0.24.us.us.us.us.epil, %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil" ]
  %.lcssa1579 = phi i32 [ %.lcssa1579.ph, %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us.unr-lcssa" ], [ %2704, %"for sum_input.s1.r19$z.r124221.us.us.us.us.epil" ]
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.le = insertelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us.lcssa, i32 %.lcssa1579, i32 0
  %2706 = add nuw nsw i32 %"sum_input.s1.r19$x220.us.us.us.us", 1
  %.not423.us.us.us.us = icmp eq i32 %2706, %9
  br i1 %.not423.us.us.us.us, label %"end for sum_input.s1.r19$x219.loopexit.split.us.us.us.us", label %"for sum_input.s1.r19$x218.us.us.us.us"

"end for sum_input.s1.r19$x219.loopexit.split.us.us.us.us": ; preds = %"end for sum_input.s1.r19$z.r124222.loopexit.us.us.us.us"
  %sum_input395.sroa.0.0.vec.insert.us.us.us.us.le.le = insertelement <6 x i32> %sum_input395.sroa.0.24.us.us.us.us.lcssa, i32 %.lcssa1579, i32 0
  %2707 = add nuw nsw i32 %"sum_input.s1.r19$y217.us.us.us", 1
  %.not422.us.us.us = icmp eq i32 %2707, %11
  br i1 %.not422.us.us.us, label %"consume sum_input224.us.loopexit1368", label %"for sum_input.s1.r19$y215.us.us.us"

"for convolved.s1.r19$y232.preheader.split.us.us": ; preds = %"for convolved.s1.r19$y232.preheader.us"
  br i1 %2454, label %"for convolved.s1.r19$y232.us.us.us", label %"consume convolved241.us", !prof !96

"for convolved.s1.r19$y232.us.us.us":             ; preds = %"for convolved.s1.r19$y232.preheader.split.us.us", %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us"
  %convolved394.sroa.78.15.us.us.us = phi <32 x i32> [ %.lcssa1581, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ], [ %convolved394.sroa.78.14.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ]
  %convolved394.sroa.63.15.us.us.us = phi <32 x i32> [ %.lcssa1582, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ], [ %convolved394.sroa.63.14.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ]
  %convolved394.sroa.48.15.us.us.us = phi <32 x i32> [ %.lcssa1583, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ], [ %convolved394.sroa.48.14.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ]
  %convolved394.sroa.0.29.us.us.us = phi <32 x i32> [ %.lcssa1584, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ], [ %convolved394.sroa.0.28.us, %"for convolved.s1.r19$y232.preheader.split.us.us" ]
  %"convolved.s1.r19$y234.us.us.us" = phi i32 [ %2875, %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us" ], [ 0, %"for convolved.s1.r19$y232.preheader.split.us.us" ]
  %2708 = mul nsw i32 %"convolved.s1.r19$y234.us.us.us", %dilation_y
  %2709 = add nsw i32 %2708, %2485
  %2710 = mul nsw i32 %2709, %19
  %t1148.us.us.us = add nsw i32 %2480, %2710
  %2711 = mul nsw i32 %"convolved.s1.r19$y234.us.us.us", %12
  br label %"for convolved.s1.r19$x235.us.us.us.us"

"for convolved.s1.r19$x235.us.us.us.us":          ; preds = %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us", %"for convolved.s1.r19$y232.us.us.us"
  %convolved394.sroa.78.16.us.us.us.us = phi <32 x i32> [ %.lcssa1581, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us" ], [ %convolved394.sroa.78.15.us.us.us, %"for convolved.s1.r19$y232.us.us.us" ]
  %convolved394.sroa.63.16.us.us.us.us = phi <32 x i32> [ %.lcssa1582, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us" ], [ %convolved394.sroa.63.15.us.us.us, %"for convolved.s1.r19$y232.us.us.us" ]
  %convolved394.sroa.48.16.us.us.us.us = phi <32 x i32> [ %.lcssa1583, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us" ], [ %convolved394.sroa.48.15.us.us.us, %"for convolved.s1.r19$y232.us.us.us" ]
  %convolved394.sroa.0.30.us.us.us.us = phi <32 x i32> [ %.lcssa1584, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us" ], [ %convolved394.sroa.0.29.us.us.us, %"for convolved.s1.r19$y232.us.us.us" ]
  %"convolved.s1.r19$x237.us.us.us.us" = phi i32 [ %2874, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us" ], [ 0, %"for convolved.s1.r19$y232.us.us.us" ]
  %2712 = mul nsw i32 %"convolved.s1.r19$x237.us.us.us.us", %dilation_x
  %t1154.s.us.us.us.us = add nsw i32 %2712, %2611
  %2713 = mul nsw i32 %"convolved.s1.r19$x237.us.us.us.us", %10
  %t1155.us.us.us.us = add nsw i32 %2713, %2711
  %2714 = mul nsw i32 %t1154.s.us.us.us.us, %17
  %2715 = add nsw i32 %t1148.us.us.us, %2714
  %2716 = add i32 %t1155.us.us.us.us, %2602
  %2717 = add i32 %t1155.us.us.us.us, %2600
  %2718 = add i32 %t1155.us.us.us.us, %2598
  br i1 %2476, label %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124238.us.us.us.us"

"for convolved.s1.r19$z.r124238.us.us.us.us":     ; preds = %"for convolved.s1.r19$x235.us.us.us.us", %"for convolved.s1.r19$z.r124238.us.us.us.us"
  %convolved394.sroa.78.18.us.us.us.us = phi <32 x i32> [ %2841, %"for convolved.s1.r19$z.r124238.us.us.us.us" ], [ %convolved394.sroa.78.16.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ]
  %convolved394.sroa.63.18.us.us.us.us = phi <32 x i32> [ %2836, %"for convolved.s1.r19$z.r124238.us.us.us.us" ], [ %convolved394.sroa.63.16.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ]
  %convolved394.sroa.48.18.us.us.us.us = phi <32 x i32> [ %2831, %"for convolved.s1.r19$z.r124238.us.us.us.us" ], [ %convolved394.sroa.48.16.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ]
  %convolved394.sroa.0.32.us.us.us.us = phi <32 x i32> [ %2825, %"for convolved.s1.r19$z.r124238.us.us.us.us" ], [ %convolved394.sroa.0.30.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ]
  %"convolved.s1.r19$z.r124240.us.us.us.us" = phi i32 [ %2842, %"for convolved.s1.r19$z.r124238.us.us.us.us" ], [ 0, %"for convolved.s1.r19$x235.us.us.us.us" ]
  %niter1651 = phi i32 [ %niter1651.nsub.3, %"for convolved.s1.r19$z.r124238.us.us.us.us" ], [ %unroll_iter1650, %"for convolved.s1.r19$x235.us.us.us.us" ]
  %2719 = shl nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us", 5
  %2720 = add nsw i32 %2719, %2603
  %2721 = shl nsw i32 %2720, 2
  %2722 = add nsw i32 %t1155.us.us.us.us, %2721
  %2723 = getelementptr inbounds i8, i8* %5, i32 %2722
  %2724 = bitcast i8* %2723 to <32 x i32>*
  %2725 = load <32 x i32>, <32 x i32>* %2724, align 128, !tbaa !106
  %2726 = shl nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us", 2
  %2727 = add nsw i32 %2715, %2726
  %2728 = getelementptr inbounds i8, i8* %13, i32 %2727
  %2729 = bitcast i8* %2728 to <1 x i32>*
  %2730 = load <1 x i32>, <1 x i32>* %2729, align 4, !tbaa !110
  %2731 = extractelement <1 x i32> %2730, i64 0
  %2732 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.32.us.us.us.us, <32 x i32> %2725, i32 %2731) #11
  %2733 = shl nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us", 7
  %2734 = add i32 %2716, %2733
  %2735 = getelementptr inbounds i8, i8* %5, i32 %2734
  %2736 = bitcast i8* %2735 to <32 x i32>*
  %2737 = load <32 x i32>, <32 x i32>* %2736, align 128, !tbaa !106
  %2738 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.48.18.us.us.us.us, <32 x i32> %2737, i32 %2731) #11
  %2739 = add i32 %2717, %2733
  %2740 = getelementptr inbounds i8, i8* %5, i32 %2739
  %2741 = bitcast i8* %2740 to <32 x i32>*
  %2742 = load <32 x i32>, <32 x i32>* %2741, align 128, !tbaa !106
  %2743 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.63.18.us.us.us.us, <32 x i32> %2742, i32 %2731) #11
  %2744 = add i32 %2718, %2733
  %2745 = getelementptr inbounds i8, i8* %5, i32 %2744
  %2746 = bitcast i8* %2745 to <32 x i32>*
  %2747 = load <32 x i32>, <32 x i32>* %2746, align 128, !tbaa !106
  %2748 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.78.18.us.us.us.us, <32 x i32> %2747, i32 %2731) #11
  %2749 = or i32 %"convolved.s1.r19$z.r124240.us.us.us.us", 1
  %2750 = shl nsw i32 %2749, 5
  %2751 = add nsw i32 %2750, %2603
  %2752 = shl nsw i32 %2751, 2
  %2753 = add nsw i32 %t1155.us.us.us.us, %2752
  %2754 = getelementptr inbounds i8, i8* %5, i32 %2753
  %2755 = bitcast i8* %2754 to <32 x i32>*
  %2756 = load <32 x i32>, <32 x i32>* %2755, align 128, !tbaa !106
  %2757 = shl nsw i32 %2749, 2
  %2758 = add nsw i32 %2715, %2757
  %2759 = getelementptr inbounds i8, i8* %13, i32 %2758
  %2760 = bitcast i8* %2759 to <1 x i32>*
  %2761 = load <1 x i32>, <1 x i32>* %2760, align 4, !tbaa !110
  %2762 = extractelement <1 x i32> %2761, i64 0
  %2763 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2732, <32 x i32> %2756, i32 %2762) #11
  %2764 = shl nsw i32 %2749, 7
  %2765 = add i32 %2716, %2764
  %2766 = getelementptr inbounds i8, i8* %5, i32 %2765
  %2767 = bitcast i8* %2766 to <32 x i32>*
  %2768 = load <32 x i32>, <32 x i32>* %2767, align 128, !tbaa !106
  %2769 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2738, <32 x i32> %2768, i32 %2762) #11
  %2770 = add i32 %2717, %2764
  %2771 = getelementptr inbounds i8, i8* %5, i32 %2770
  %2772 = bitcast i8* %2771 to <32 x i32>*
  %2773 = load <32 x i32>, <32 x i32>* %2772, align 128, !tbaa !106
  %2774 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2743, <32 x i32> %2773, i32 %2762) #11
  %2775 = add i32 %2718, %2764
  %2776 = getelementptr inbounds i8, i8* %5, i32 %2775
  %2777 = bitcast i8* %2776 to <32 x i32>*
  %2778 = load <32 x i32>, <32 x i32>* %2777, align 128, !tbaa !106
  %2779 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2748, <32 x i32> %2778, i32 %2762) #11
  %2780 = or i32 %"convolved.s1.r19$z.r124240.us.us.us.us", 2
  %2781 = shl nsw i32 %2780, 5
  %2782 = add nsw i32 %2781, %2603
  %2783 = shl nsw i32 %2782, 2
  %2784 = add nsw i32 %t1155.us.us.us.us, %2783
  %2785 = getelementptr inbounds i8, i8* %5, i32 %2784
  %2786 = bitcast i8* %2785 to <32 x i32>*
  %2787 = load <32 x i32>, <32 x i32>* %2786, align 128, !tbaa !106
  %2788 = shl nsw i32 %2780, 2
  %2789 = add nsw i32 %2715, %2788
  %2790 = getelementptr inbounds i8, i8* %13, i32 %2789
  %2791 = bitcast i8* %2790 to <1 x i32>*
  %2792 = load <1 x i32>, <1 x i32>* %2791, align 4, !tbaa !110
  %2793 = extractelement <1 x i32> %2792, i64 0
  %2794 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2763, <32 x i32> %2787, i32 %2793) #11
  %2795 = shl nsw i32 %2780, 7
  %2796 = add i32 %2716, %2795
  %2797 = getelementptr inbounds i8, i8* %5, i32 %2796
  %2798 = bitcast i8* %2797 to <32 x i32>*
  %2799 = load <32 x i32>, <32 x i32>* %2798, align 128, !tbaa !106
  %2800 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2769, <32 x i32> %2799, i32 %2793) #11
  %2801 = add i32 %2717, %2795
  %2802 = getelementptr inbounds i8, i8* %5, i32 %2801
  %2803 = bitcast i8* %2802 to <32 x i32>*
  %2804 = load <32 x i32>, <32 x i32>* %2803, align 128, !tbaa !106
  %2805 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2774, <32 x i32> %2804, i32 %2793) #11
  %2806 = add i32 %2718, %2795
  %2807 = getelementptr inbounds i8, i8* %5, i32 %2806
  %2808 = bitcast i8* %2807 to <32 x i32>*
  %2809 = load <32 x i32>, <32 x i32>* %2808, align 128, !tbaa !106
  %2810 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2779, <32 x i32> %2809, i32 %2793) #11
  %2811 = or i32 %"convolved.s1.r19$z.r124240.us.us.us.us", 3
  %2812 = shl nsw i32 %2811, 5
  %2813 = add nsw i32 %2812, %2603
  %2814 = shl nsw i32 %2813, 2
  %2815 = add nsw i32 %t1155.us.us.us.us, %2814
  %2816 = getelementptr inbounds i8, i8* %5, i32 %2815
  %2817 = bitcast i8* %2816 to <32 x i32>*
  %2818 = load <32 x i32>, <32 x i32>* %2817, align 128, !tbaa !106
  %2819 = shl nsw i32 %2811, 2
  %2820 = add nsw i32 %2715, %2819
  %2821 = getelementptr inbounds i8, i8* %13, i32 %2820
  %2822 = bitcast i8* %2821 to <1 x i32>*
  %2823 = load <1 x i32>, <1 x i32>* %2822, align 4, !tbaa !110
  %2824 = extractelement <1 x i32> %2823, i64 0
  %2825 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2794, <32 x i32> %2818, i32 %2824) #11
  %2826 = shl nsw i32 %2811, 7
  %2827 = add i32 %2716, %2826
  %2828 = getelementptr inbounds i8, i8* %5, i32 %2827
  %2829 = bitcast i8* %2828 to <32 x i32>*
  %2830 = load <32 x i32>, <32 x i32>* %2829, align 128, !tbaa !106
  %2831 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2800, <32 x i32> %2830, i32 %2824) #11
  %2832 = add i32 %2717, %2826
  %2833 = getelementptr inbounds i8, i8* %5, i32 %2832
  %2834 = bitcast i8* %2833 to <32 x i32>*
  %2835 = load <32 x i32>, <32 x i32>* %2834, align 128, !tbaa !106
  %2836 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2805, <32 x i32> %2835, i32 %2824) #11
  %2837 = add i32 %2718, %2826
  %2838 = getelementptr inbounds i8, i8* %5, i32 %2837
  %2839 = bitcast i8* %2838 to <32 x i32>*
  %2840 = load <32 x i32>, <32 x i32>* %2839, align 128, !tbaa !106
  %2841 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %2810, <32 x i32> %2840, i32 %2824) #11
  %2842 = add nuw nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us", 4
  %niter1651.nsub.3 = add i32 %niter1651, -4
  %niter1651.ncmp.3 = icmp eq i32 %niter1651.nsub.3, 0
  br i1 %niter1651.ncmp.3, label %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124238.us.us.us.us"

"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa": ; preds = %"for convolved.s1.r19$z.r124238.us.us.us.us", %"for convolved.s1.r19$x235.us.us.us.us"
  %.lcssa1584.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2825, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %.lcssa1583.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2831, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %.lcssa1582.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2836, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %.lcssa1581.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2841, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %convolved394.sroa.78.18.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.78.16.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2841, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %convolved394.sroa.63.18.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.63.16.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2836, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %convolved394.sroa.48.18.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.48.16.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2831, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %convolved394.sroa.0.32.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.0.30.us.us.us.us, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2825, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  %"convolved.s1.r19$z.r124240.us.us.us.us.unr" = phi i32 [ 0, %"for convolved.s1.r19$x235.us.us.us.us" ], [ %2842, %"for convolved.s1.r19$z.r124238.us.us.us.us" ]
  br i1 %lcmp.mod1645.not, label %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r124238.us.us.us.us.epil"

"for convolved.s1.r19$z.r124238.us.us.us.us.epil": ; preds = %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa", %"for convolved.s1.r19$z.r124238.us.us.us.us.epil"
  %convolved394.sroa.78.18.us.us.us.us.epil = phi <32 x i32> [ %2872, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ], [ %convolved394.sroa.78.18.us.us.us.us.unr, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ]
  %convolved394.sroa.63.18.us.us.us.us.epil = phi <32 x i32> [ %2867, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ], [ %convolved394.sroa.63.18.us.us.us.us.unr, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ]
  %convolved394.sroa.48.18.us.us.us.us.epil = phi <32 x i32> [ %2862, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ], [ %convolved394.sroa.48.18.us.us.us.us.unr, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ]
  %convolved394.sroa.0.32.us.us.us.us.epil = phi <32 x i32> [ %2856, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ], [ %convolved394.sroa.0.32.us.us.us.us.unr, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ]
  %"convolved.s1.r19$z.r124240.us.us.us.us.epil" = phi i32 [ %2873, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ], [ %"convolved.s1.r19$z.r124240.us.us.us.us.unr", %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ]
  %epil.iter1644 = phi i32 [ %epil.iter1644.sub, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ], [ %xtraiter1643, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ]
  %2843 = shl nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us.epil", 5
  %2844 = add nsw i32 %2843, %2603
  %2845 = shl nsw i32 %2844, 2
  %2846 = add nsw i32 %t1155.us.us.us.us, %2845
  %2847 = getelementptr inbounds i8, i8* %5, i32 %2846
  %2848 = bitcast i8* %2847 to <32 x i32>*
  %2849 = load <32 x i32>, <32 x i32>* %2848, align 128, !tbaa !106
  %2850 = shl nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us.epil", 2
  %2851 = add nsw i32 %2715, %2850
  %2852 = getelementptr inbounds i8, i8* %13, i32 %2851
  %2853 = bitcast i8* %2852 to <1 x i32>*
  %2854 = load <1 x i32>, <1 x i32>* %2853, align 4, !tbaa !110
  %2855 = extractelement <1 x i32> %2854, i64 0
  %2856 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.32.us.us.us.us.epil, <32 x i32> %2849, i32 %2855) #11
  %2857 = shl nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us.epil", 7
  %2858 = add i32 %2716, %2857
  %2859 = getelementptr inbounds i8, i8* %5, i32 %2858
  %2860 = bitcast i8* %2859 to <32 x i32>*
  %2861 = load <32 x i32>, <32 x i32>* %2860, align 128, !tbaa !106
  %2862 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.48.18.us.us.us.us.epil, <32 x i32> %2861, i32 %2855) #11
  %2863 = add i32 %2717, %2857
  %2864 = getelementptr inbounds i8, i8* %5, i32 %2863
  %2865 = bitcast i8* %2864 to <32 x i32>*
  %2866 = load <32 x i32>, <32 x i32>* %2865, align 128, !tbaa !106
  %2867 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.63.18.us.us.us.us.epil, <32 x i32> %2866, i32 %2855) #11
  %2868 = add i32 %2718, %2857
  %2869 = getelementptr inbounds i8, i8* %5, i32 %2868
  %2870 = bitcast i8* %2869 to <32 x i32>*
  %2871 = load <32 x i32>, <32 x i32>* %2870, align 128, !tbaa !106
  %2872 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.78.18.us.us.us.us.epil, <32 x i32> %2871, i32 %2855) #11
  %2873 = add nuw nsw i32 %"convolved.s1.r19$z.r124240.us.us.us.us.epil", 1
  %epil.iter1644.sub = add i32 %epil.iter1644, -1
  %epil.iter1644.cmp.not = icmp eq i32 %epil.iter1644.sub, 0
  br i1 %epil.iter1644.cmp.not, label %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r124238.us.us.us.us.epil", !llvm.loop !120

"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us": ; preds = %"for convolved.s1.r19$z.r124238.us.us.us.us.epil", %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa"
  %.lcssa1584 = phi <32 x i32> [ %.lcssa1584.ph, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ], [ %2856, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ]
  %.lcssa1583 = phi <32 x i32> [ %.lcssa1583.ph, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ], [ %2862, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ]
  %.lcssa1582 = phi <32 x i32> [ %.lcssa1582.ph, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ], [ %2867, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ]
  %.lcssa1581 = phi <32 x i32> [ %.lcssa1581.ph, %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us.unr-lcssa" ], [ %2872, %"for convolved.s1.r19$z.r124238.us.us.us.us.epil" ]
  %2874 = add nuw nsw i32 %"convolved.s1.r19$x237.us.us.us.us", 1
  %.not420.us.us.us.us = icmp eq i32 %2874, %9
  br i1 %.not420.us.us.us.us, label %"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us", label %"for convolved.s1.r19$x235.us.us.us.us"

"end for convolved.s1.r19$x236.loopexit.split.us.us.us.us": ; preds = %"end for convolved.s1.r19$z.r124239.loopexit.us.us.us.us"
  %2875 = add nuw nsw i32 %"convolved.s1.r19$y234.us.us.us", 1
  %.not419.us.us.us = icmp eq i32 %2875, %11
  br i1 %.not419.us.us.us, label %"consume convolved241.us", label %"for convolved.s1.r19$y232.us.us.us"

next_bb192:                                       ; preds = %next_bb115
  %a15 = ashr i32 %4, 5
  %2876 = icmp sgt i32 %4, 31
  %2877 = select i1 %2876, i32 %a15, i32 0
  %t1167 = sub nsw i32 %119, %2877
  %2878 = mul nsw i32 %19, %18
  %2879 = mul nsw i32 %17, %16
  %2880 = mul nsw i32 %22, %20
  %2881 = add i32 %2880, %2878
  %t1163 = add i32 %2881, %2879
  %2882 = icmp sgt i32 %21, 0
  br i1 %2882, label %"for output.s0.b.rebased245.preheader", label %after_bb3, !prof !96

"for output.s0.b.rebased245.preheader":           ; preds = %next_bb192
  %2883 = icmp sgt i32 %29, 0
  %.neg867 = mul i32 %30, %28
  %.neg868 = mul i32 %27, %25
  %.neg869 = mul i32 %31, %20
  %reass.add = add i32 %.neg867, %.neg868
  %reass.add871 = add i32 %reass.add, %.neg869
  %2884 = icmp sgt i32 %11, 0
  %2885 = icmp sgt i32 %9, 0
  %2886 = icmp sgt i32 %7, 0
  %2887 = insertelement <32 x i32> undef, i32 %output_multiplier, i32 0
  %2888 = shufflevector <32 x i32> %2887, <32 x i32> undef, <32 x i32> zeroinitializer
  %2889 = icmp sgt i32 %output_shift, 0
  %2890 = select i1 %2889, <32 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <32 x i32> zeroinitializer
  %2891 = add nsw i32 %output_shift, -1
  %2892 = zext i8 %output_zero to i16
  %2893 = insertelement <32 x i16> undef, i16 %2892, i32 0
  %2894 = shufflevector <32 x i16> %2893, <32 x i16> undef, <64 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2895 = bitcast <64 x i16> %2894 to <32 x i32>
  %2896 = insertelement <32 x i8> undef, i8 %output_max, i32 0
  %2897 = shufflevector <32 x i8> %2896, <32 x i8> undef, <128 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2898 = bitcast <128 x i8> %2897 to <32 x i32>
  %2899 = insertelement <32 x i8> undef, i8 %output_min, i32 0
  %2900 = shufflevector <32 x i8> %2899, <32 x i8> undef, <128 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %2901 = bitcast <128 x i8> %2900 to <32 x i32>
  %2902 = icmp sgt i32 %t1167, 0
  %2903 = insertelement <32 x i32> undef, i32 %4, i32 0
  %2904 = shufflevector <32 x i32> %2903, <32 x i32> undef, <32 x i32> zeroinitializer
  %2905 = add i32 %7, -1
  %2906 = add i32 %9, -1
  %xtraiter1603 = and i32 %7, 7
  %2907 = icmp ult i32 %2905, 7
  %unroll_iter1608 = and i32 %7, -8
  %lcmp.mod1605.not = icmp eq i32 %xtraiter1603, 0
  %xtraiter1610 = and i32 %9, 3
  %2908 = icmp ult i32 %2906, 3
  %unroll_iter1615 = and i32 %9, -4
  %lcmp.mod1612.not = icmp eq i32 %xtraiter1610, 0
  %brmerge1449.demorgan = and i1 %2885, %2886
  %or.cond1523 = and i1 %2884, %brmerge1449.demorgan
  %xtraiter1617 = and i32 %7, 7
  %2909 = icmp ult i32 %2905, 7
  %unroll_iter1621 = and i32 %7, -8
  %lcmp.mod1619.not = icmp eq i32 %xtraiter1617, 0
  %brmerge1452.demorgan = and i1 %2885, %2886
  %or.cond1522 = and i1 %2884, %brmerge1452.demorgan
  %xtraiter1623 = and i32 %7, 7
  %2910 = icmp ult i32 %2905, 7
  %unroll_iter1627 = and i32 %7, -8
  %lcmp.mod1625.not = icmp eq i32 %xtraiter1623, 0
  br label %"for output.s0.b.rebased245"

"for output.s0.b.rebased245":                     ; preds = %"for output.s0.b.rebased245.preheader", %"end for output.s0.y.rebased249"
  %sum_input254393.sroa.0.21 = phi <32 x i32> [ %sum_input254393.sroa.0.23, %"end for output.s0.y.rebased249" ], [ undef, %"for output.s0.b.rebased245.preheader" ]
  %convolved394.sroa.0.35 = phi <32 x i32> [ %convolved394.sroa.0.37, %"end for output.s0.y.rebased249" ], [ undef, %"for output.s0.b.rebased245.preheader" ]
  %output.s0.b.rebased247 = phi i32 [ %3423, %"end for output.s0.y.rebased249" ], [ 0, %"for output.s0.b.rebased245.preheader" ]
  br i1 %2883, label %"for output.s0.y.rebased248.preheader", label %"end for output.s0.y.rebased249", !prof !96

"for output.s0.y.rebased248.preheader":           ; preds = %"for output.s0.b.rebased245"
  %2911 = add nsw i32 %output.s0.b.rebased247, %20
  %2912 = mul nsw i32 %2911, %31
  %2913 = sub i32 %2912, %reass.add871
  %2914 = mul nsw i32 %2911, %22
  %2915 = sub i32 %2914, %t1163
  %2916 = sub i32 %2914, %2881
  br i1 %98, label %"for output.s0.y.rebased248.us", label %"end for output.s0.y.rebased249", !prof !96

"for output.s0.y.rebased248.us":                  ; preds = %"for output.s0.y.rebased248.preheader", %"end for output.s0.x.xo252.loopexit.us"
  %sum_input254393.sroa.0.22.us = phi <32 x i32> [ %sum_input254393.sroa.0.34.us, %"end for output.s0.x.xo252.loopexit.us" ], [ %sum_input254393.sroa.0.21, %"for output.s0.y.rebased248.preheader" ]
  %convolved394.sroa.0.36.us = phi <32 x i32> [ %convolved394.sroa.0.50.us, %"end for output.s0.x.xo252.loopexit.us" ], [ %convolved394.sroa.0.35, %"for output.s0.y.rebased248.preheader" ]
  %output.s0.y.rebased250.us = phi i32 [ %3077, %"end for output.s0.x.xo252.loopexit.us" ], [ 0, %"for output.s0.y.rebased248.preheader" ]
  %2917 = add nsw i32 %output.s0.y.rebased250.us, %28
  %2918 = mul nsw i32 %2917, %30
  %t1180.us = add i32 %2913, %2918
  %2919 = mul nsw i32 %2917, %stride_y
  br label %"for output.s0.x.xo251.us"

"for output.s0.x.xo251.us":                       ; preds = %"for output.s0.y.rebased248.us", %"end for output.s0.c.co.rebased.us"
  %sum_input254393.sroa.0.24.us = phi <32 x i32> [ %sum_input254393.sroa.0.34.us, %"end for output.s0.c.co.rebased.us" ], [ %sum_input254393.sroa.0.22.us, %"for output.s0.y.rebased248.us" ]
  %convolved394.sroa.0.38.us = phi <32 x i32> [ %convolved394.sroa.0.50.us, %"end for output.s0.c.co.rebased.us" ], [ %convolved394.sroa.0.36.us, %"for output.s0.y.rebased248.us" ]
  %output.s0.x.xo253.us = phi i32 [ %3053, %"end for output.s0.c.co.rebased.us" ], [ 0, %"for output.s0.y.rebased248.us" ]
  br i1 %t843.not, label %"consume sum_input277.us", label %then_bb257.us

then_bb257.us:                                    ; preds = %"for output.s0.x.xo251.us"
  %sum_input254393.sroa.0.0.vec.insert843.us = insertelement <32 x i32> %sum_input254393.sroa.0.24.us, i32 0, i32 0
  br i1 %t844, label %then_bb260.us, label %next_bb261.us

next_bb261.us:                                    ; preds = %then_bb257.us
  br i1 %2884, label %"for sum_input.s1.r19$y268.preheader.us", label %"consume sum_input277.us", !prof !96

then_bb260.us:                                    ; preds = %then_bb257.us
  br i1 %2884, label %"for sum_input.s1.r19$y262.preheader.us", label %"consume sum_input277.us", !prof !96

"for sum_input.s1.r19$y262.us":                   ; preds = %"for sum_input.s1.r19$y262.preheader.us", %"end for sum_input.s1.r19$x266.us"
  %sum_input254393.sroa.0.26.us = phi <32 x i32> [ %sum_input254393.sroa.0.28.us, %"end for sum_input.s1.r19$x266.us" ], [ %sum_input254393.sroa.0.0.vec.insert843.us, %"for sum_input.s1.r19$y262.preheader.us" ]
  %"sum_input.s1.r19$y264.us" = phi i32 [ %2965, %"end for sum_input.s1.r19$x266.us" ], [ 0, %"for sum_input.s1.r19$y262.preheader.us" ]
  br i1 %2885, label %"for sum_input.s1.r19$x265.preheader.us", label %"end for sum_input.s1.r19$x266.us", !prof !96

"for sum_input.s1.r19$x265.us":                   ; preds = %"for sum_input.s1.r19$x265.preheader.us", %"for sum_input.s1.r19$x265.us"
  %sum_input254393.sroa.0.27.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.vec.insert839.us.3, %"for sum_input.s1.r19$x265.us" ], [ %sum_input254393.sroa.0.26.us, %"for sum_input.s1.r19$x265.preheader.us" ]
  %"sum_input.s1.r19$x267.us" = phi i32 [ %2955, %"for sum_input.s1.r19$x265.us" ], [ 0, %"for sum_input.s1.r19$x265.preheader.us" ]
  %niter1616 = phi i32 [ %niter1616.nsub.3, %"for sum_input.s1.r19$x265.us" ], [ %unroll_iter1615, %"for sum_input.s1.r19$x265.preheader.us" ]
  %sum_input254393.sroa.0.0.vec.extract841.us = extractelement <32 x i32> %sum_input254393.sroa.0.27.us, i32 0
  %2920 = mul nsw i32 %"sum_input.s1.r19$x267.us", %dilation_x
  %reass.add876.us = add i32 %3074, %2920
  %reass.mul877.us = shl i32 %reass.add876.us, 2
  %2921 = add i32 %t1183.us, %reass.mul877.us
  %2922 = getelementptr inbounds i8, i8* %13, i32 %2921
  %2923 = bitcast i8* %2922 to <4 x i8>*
  %2924 = load <4 x i8>, <4 x i8>* %2923, align 4, !tbaa !110
  %2925 = zext <4 x i8> %2924 to <4 x i32>
  %2926 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2925) #9
  %2927 = add nsw i32 %2926, %sum_input254393.sroa.0.0.vec.extract841.us
  %2928 = or i32 %"sum_input.s1.r19$x267.us", 1
  %2929 = mul nsw i32 %2928, %dilation_x
  %reass.add876.us.1 = add i32 %3074, %2929
  %reass.mul877.us.1 = shl i32 %reass.add876.us.1, 2
  %2930 = add i32 %t1183.us, %reass.mul877.us.1
  %2931 = getelementptr inbounds i8, i8* %13, i32 %2930
  %2932 = bitcast i8* %2931 to <4 x i8>*
  %2933 = load <4 x i8>, <4 x i8>* %2932, align 4, !tbaa !110
  %2934 = zext <4 x i8> %2933 to <4 x i32>
  %2935 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2934) #9
  %2936 = add nsw i32 %2935, %2927
  %2937 = or i32 %"sum_input.s1.r19$x267.us", 2
  %2938 = mul nsw i32 %2937, %dilation_x
  %reass.add876.us.2 = add i32 %3074, %2938
  %reass.mul877.us.2 = shl i32 %reass.add876.us.2, 2
  %2939 = add i32 %t1183.us, %reass.mul877.us.2
  %2940 = getelementptr inbounds i8, i8* %13, i32 %2939
  %2941 = bitcast i8* %2940 to <4 x i8>*
  %2942 = load <4 x i8>, <4 x i8>* %2941, align 4, !tbaa !110
  %2943 = zext <4 x i8> %2942 to <4 x i32>
  %2944 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2943) #9
  %2945 = add nsw i32 %2944, %2936
  %sum_input254393.sroa.0.0.vec.insert839.us.2 = insertelement <32 x i32> %sum_input254393.sroa.0.27.us, i32 %2945, i32 0
  %2946 = or i32 %"sum_input.s1.r19$x267.us", 3
  %2947 = mul nsw i32 %2946, %dilation_x
  %reass.add876.us.3 = add i32 %3074, %2947
  %reass.mul877.us.3 = shl i32 %reass.add876.us.3, 2
  %2948 = add i32 %t1183.us, %reass.mul877.us.3
  %2949 = getelementptr inbounds i8, i8* %13, i32 %2948
  %2950 = bitcast i8* %2949 to <4 x i8>*
  %2951 = load <4 x i8>, <4 x i8>* %2950, align 4, !tbaa !110
  %2952 = zext <4 x i8> %2951 to <4 x i32>
  %2953 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2952) #9
  %2954 = add nsw i32 %2953, %2945
  %sum_input254393.sroa.0.0.vec.insert839.us.3 = insertelement <32 x i32> %sum_input254393.sroa.0.0.vec.insert839.us.2, i32 %2954, i32 0
  %2955 = add nuw nsw i32 %"sum_input.s1.r19$x267.us", 4
  %niter1616.nsub.3 = add i32 %niter1616, -4
  %niter1616.ncmp.3 = icmp eq i32 %niter1616.nsub.3, 0
  br i1 %niter1616.ncmp.3, label %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa.loopexit", label %"for sum_input.s1.r19$x265.us"

"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa.loopexit": ; preds = %"for sum_input.s1.r19$x265.us"
  %sum_input254393.sroa.0.0.vec.insert839.us.2.le = insertelement <32 x i32> %sum_input254393.sroa.0.27.us, i32 %2945, i32 0
  %sum_input254393.sroa.0.0.vec.insert839.us.3.le = insertelement <32 x i32> %sum_input254393.sroa.0.0.vec.insert839.us.2.le, i32 %2954, i32 0
  br label %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa"

"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa": ; preds = %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa.loopexit", %"for sum_input.s1.r19$x265.preheader.us"
  %sum_input254393.sroa.0.27.us.lcssa.ph = phi <32 x i32> [ undef, %"for sum_input.s1.r19$x265.preheader.us" ], [ %sum_input254393.sroa.0.0.vec.insert839.us.2.le, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa.loopexit" ]
  %.lcssa1588.ph = phi i32 [ undef, %"for sum_input.s1.r19$x265.preheader.us" ], [ %2954, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa.loopexit" ]
  %sum_input254393.sroa.0.27.us.unr = phi <32 x i32> [ %sum_input254393.sroa.0.26.us, %"for sum_input.s1.r19$x265.preheader.us" ], [ %sum_input254393.sroa.0.0.vec.insert839.us.3.le, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa.loopexit" ]
  %"sum_input.s1.r19$x267.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x265.preheader.us" ], [ %2955, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa.loopexit" ]
  br i1 %lcmp.mod1612.not, label %"end for sum_input.s1.r19$x266.us.loopexit", label %"for sum_input.s1.r19$x265.us.epil"

"for sum_input.s1.r19$x265.us.epil":              ; preds = %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa", %"for sum_input.s1.r19$x265.us.epil"
  %sum_input254393.sroa.0.27.us.epil = phi <32 x i32> [ %sum_input254393.sroa.0.0.vec.insert839.us.epil, %"for sum_input.s1.r19$x265.us.epil" ], [ %sum_input254393.sroa.0.27.us.unr, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa" ]
  %"sum_input.s1.r19$x267.us.epil" = phi i32 [ %2964, %"for sum_input.s1.r19$x265.us.epil" ], [ %"sum_input.s1.r19$x267.us.unr", %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa" ]
  %epil.iter1611 = phi i32 [ %epil.iter1611.sub, %"for sum_input.s1.r19$x265.us.epil" ], [ %xtraiter1610, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa" ]
  %sum_input254393.sroa.0.0.vec.extract841.us.epil = extractelement <32 x i32> %sum_input254393.sroa.0.27.us.epil, i32 0
  %2956 = mul nsw i32 %"sum_input.s1.r19$x267.us.epil", %dilation_x
  %reass.add876.us.epil = add i32 %3074, %2956
  %reass.mul877.us.epil = shl i32 %reass.add876.us.epil, 2
  %2957 = add i32 %t1183.us, %reass.mul877.us.epil
  %2958 = getelementptr inbounds i8, i8* %13, i32 %2957
  %2959 = bitcast i8* %2958 to <4 x i8>*
  %2960 = load <4 x i8>, <4 x i8>* %2959, align 4, !tbaa !110
  %2961 = zext <4 x i8> %2960 to <4 x i32>
  %2962 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %2961) #9
  %2963 = add nsw i32 %2962, %sum_input254393.sroa.0.0.vec.extract841.us.epil
  %sum_input254393.sroa.0.0.vec.insert839.us.epil = insertelement <32 x i32> %sum_input254393.sroa.0.27.us.epil, i32 %2963, i32 0
  %2964 = add nuw nsw i32 %"sum_input.s1.r19$x267.us.epil", 1
  %epil.iter1611.sub = add i32 %epil.iter1611, -1
  %epil.iter1611.cmp.not = icmp eq i32 %epil.iter1611.sub, 0
  br i1 %epil.iter1611.cmp.not, label %"end for sum_input.s1.r19$x266.us.loopexit", label %"for sum_input.s1.r19$x265.us.epil", !llvm.loop !121

"end for sum_input.s1.r19$x266.us.loopexit":      ; preds = %"for sum_input.s1.r19$x265.us.epil", %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa"
  %sum_input254393.sroa.0.27.us.lcssa = phi <32 x i32> [ %sum_input254393.sroa.0.27.us.lcssa.ph, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa" ], [ %sum_input254393.sroa.0.27.us.epil, %"for sum_input.s1.r19$x265.us.epil" ]
  %.lcssa1588 = phi i32 [ %.lcssa1588.ph, %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa" ], [ %2963, %"for sum_input.s1.r19$x265.us.epil" ]
  %sum_input254393.sroa.0.0.vec.insert839.us.le = insertelement <32 x i32> %sum_input254393.sroa.0.27.us.lcssa, i32 %.lcssa1588, i32 0
  br label %"end for sum_input.s1.r19$x266.us"

"end for sum_input.s1.r19$x266.us":               ; preds = %"end for sum_input.s1.r19$x266.us.loopexit", %"for sum_input.s1.r19$y262.us"
  %sum_input254393.sroa.0.28.us = phi <32 x i32> [ %sum_input254393.sroa.0.26.us, %"for sum_input.s1.r19$y262.us" ], [ %sum_input254393.sroa.0.0.vec.insert839.us.le, %"end for sum_input.s1.r19$x266.us.loopexit" ]
  %2965 = add nuw nsw i32 %"sum_input.s1.r19$y264.us", 1
  %.not413.us = icmp eq i32 %2965, %11
  br i1 %.not413.us, label %"consume sum_input277.us", label %"for sum_input.s1.r19$y262.us"

"consume sum_input277.us":                        ; preds = %"end for sum_input.s1.r19$x272.loopexit.us.us", %"end for sum_input.s1.r19$x266.us", %"for sum_input.s1.r19$y268.preheader.us", %then_bb260.us, %next_bb261.us, %"for output.s0.x.xo251.us"
  %sum_input254393.sroa.0.34.us = phi <32 x i32> [ %sum_input254393.sroa.0.24.us, %"for output.s0.x.xo251.us" ], [ %sum_input254393.sroa.0.0.vec.insert843.us, %then_bb260.us ], [ %sum_input254393.sroa.0.0.vec.insert843.us, %next_bb261.us ], [ %sum_input254393.sroa.0.0.vec.insert843.us, %"for sum_input.s1.r19$y268.preheader.us" ], [ %sum_input254393.sroa.0.28.us, %"end for sum_input.s1.r19$x266.us" ], [ %.us-phi.us.us, %"end for sum_input.s1.r19$x272.loopexit.us.us" ]
  br i1 %2876, label %"for output.s0.c.co278.preheader.us", label %"end for output.s0.c.co279.us", !prof !96

"for output.s0.c.co278.us":                       ; preds = %"for output.s0.c.co278.preheader.us", %"consume convolved297.us"
  %convolved394.sroa.0.40.us = phi <32 x i32> [ %convolved394.sroa.0.48.us, %"consume convolved297.us" ], [ %convolved394.sroa.0.38.us, %"for output.s0.c.co278.preheader.us" ]
  %output.s0.c.co280.us = phi i32 [ %2992, %"consume convolved297.us" ], [ 0, %"for output.s0.c.co278.preheader.us" ]
  %2966 = shl nsw i32 %output.s0.c.co280.us, 5
  %2967 = icmp slt i32 %2966, %4
  br i1 %2967, label %then_bb283.us, label %"consume convolved297.us"

then_bb283.us:                                    ; preds = %"for output.s0.c.co278.us"
  %2968 = getelementptr inbounds i32, i32* %offset_c, i32 %2966
  %2969 = bitcast i32* %2968 to <32 x i32>*
  %2970 = load <32 x i32>, <32 x i32>* %2969, align 128, !tbaa !104
  %convolved394.sroa.0.42.us = sub nsw <32 x i32> %2970, %3072
  %2971 = mul nsw i32 %output.s0.c.co280.us, %8
  br i1 %or.cond1523, label %"for convolved.s1.r19$y288.us.us.us", label %"consume convolved297.us", !prof !103

"consume convolved297.us":                        ; preds = %"end for convolved.s1.r19$x292.loopexit.split.us.us.us.us", %then_bb283.us, %"for output.s0.c.co278.us"
  %convolved394.sroa.0.48.us = phi <32 x i32> [ %convolved394.sroa.0.42.us, %then_bb283.us ], [ %convolved394.sroa.0.40.us, %"for output.s0.c.co278.us" ], [ %.lcssa1589, %"end for convolved.s1.r19$x292.loopexit.split.us.us.us.us" ]
  %ab1.i667.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.0.48.us, <32 x i32> %2888) #11
  %ab.i668.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i667.us, <32 x i32> %convolved394.sroa.0.48.us, <32 x i32> %2888) #11
  %2972 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i668.us, i32 %output_shift) #11
  %2973 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i668.us, i32 %2891) #11
  %2974 = and <32 x i32> %2973, %2890
  %2975 = add nsw <32 x i32> %2974, %2972
  %2976 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %2975)
  %2977 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2976) #11
  %2978 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2976) #11
  %2979 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %2978, <32 x i32> %2977) #11
  %2980 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %2979, <32 x i32> %2895) #11
  %2981 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %2980)
  %2982 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %2981) #11
  %2983 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2981) #11
  %2984 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %2982, <32 x i32> %2983) #11
  %2985 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %2984, <32 x i32> %2898) #11
  %2986 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %2985, <32 x i32> %2901) #11
  %2987 = bitcast <32 x i32> %2986 to <128 x i8>
  %2988 = shufflevector <128 x i8> %2987, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %2989 = add nsw i32 %3071, %2966
  %2990 = getelementptr inbounds i8, i8* %23, i32 %2989
  %2991 = bitcast i8* %2990 to <32 x i8>*
  store <32 x i8> %2988, <32 x i8>* %2991, align 1, !tbaa !113
  %2992 = add nuw nsw i32 %output.s0.c.co280.us, 1
  %.not406.us = icmp eq i32 %2992, %2877
  br i1 %.not406.us, label %"end for output.s0.c.co279.us", label %"for output.s0.c.co278.us"

"end for output.s0.c.co279.us":                   ; preds = %"consume convolved297.us", %"consume sum_input277.us"
  %convolved394.sroa.0.41.us = phi <32 x i32> [ %convolved394.sroa.0.38.us, %"consume sum_input277.us" ], [ %convolved394.sroa.0.48.us, %"consume convolved297.us" ]
  br i1 %2902, label %"for output.s0.c.co.rebased.preheader.us", label %"end for output.s0.c.co.rebased.us", !prof !96

"for output.s0.c.co.rebased.us":                  ; preds = %"for output.s0.c.co.rebased.preheader.us", %after_bb324.us
  %convolved394.sroa.0.49.us = phi <32 x i32> [ %convolved394.sroa.0.57.us, %after_bb324.us ], [ %convolved394.sroa.0.41.us, %"for output.s0.c.co.rebased.preheader.us" ]
  %output.s0.c.co.rebased.us = phi i32 [ %3052, %after_bb324.us ], [ 0, %"for output.s0.c.co.rebased.preheader.us" ]
  %2993 = add nsw i32 %output.s0.c.co.rebased.us, %2877
  %2994 = icmp sgt i32 %2993, %a0
  %2995 = shl nsw i32 %2993, 5
  %2996 = icmp sge i32 %2995, %4
  %.not1445 = or i1 %2994, %2996
  %2997 = add nsw i32 %output.s0.c.co.rebased.us, %a15
  %.not1362 = icmp sgt i32 %2997, %a0
  %or.cond1446 = or i1 %.not1445, %.not1362
  br i1 %or.cond1446, label %"consume convolved323.us", label %then_bb306.us

then_bb306.us:                                    ; preds = %"for output.s0.c.co.rebased.us"
  %2998 = shl nsw i32 %2997, 5
  %2999 = getelementptr inbounds i32, i32* %offset_c, i32 %2998
  %3000 = bitcast i32* %2999 to <32 x i32>*
  %3001 = load <32 x i32>, <32 x i32>* %3000, align 128, !tbaa !104
  %convolved394.sroa.0.51.us = sub nsw <32 x i32> %3001, %3064
  %3002 = mul nsw i32 %2997, %8
  br i1 %or.cond1522, label %"for convolved.s1.r19$y314.us.us.us", label %"consume convolved323.us", !prof !122

"consume convolved323.us":                        ; preds = %"end for convolved.s1.r19$x318.loopexit.split.us.us.us.us", %then_bb306.us, %"for output.s0.c.co.rebased.us"
  %convolved394.sroa.0.57.us = phi <32 x i32> [ %convolved394.sroa.0.51.us, %then_bb306.us ], [ %convolved394.sroa.0.49.us, %"for output.s0.c.co.rebased.us" ], [ %.lcssa1590, %"end for convolved.s1.r19$x318.loopexit.split.us.us.us.us" ]
  %3003 = add nsw i32 %2995, 32
  %.not400.us = icmp sgt i32 %3003, %4
  br i1 %.not400.us, label %next_bb326.us, label %then_bb325.us

then_bb325.us:                                    ; preds = %"consume convolved323.us"
  %ab1.i669.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %convolved394.sroa.0.57.us, <32 x i32> %2888) #11
  %ab.i670.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i669.us, <32 x i32> %convolved394.sroa.0.57.us, <32 x i32> %2888) #11
  %3004 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i670.us, i32 %output_shift) #11
  %3005 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i670.us, i32 %2891) #11
  %3006 = and <32 x i32> %3005, %2890
  %3007 = add nsw <32 x i32> %3006, %3004
  %3008 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %3007)
  %3009 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %3008) #11
  %3010 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %3008) #11
  %3011 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %3010, <32 x i32> %3009) #11
  %3012 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %3011, <32 x i32> %2895) #11
  %3013 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %3012)
  %3014 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %3013) #11
  %3015 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %3013) #11
  %3016 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %3014, <32 x i32> %3015) #11
  %3017 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %3016, <32 x i32> %2898) #11
  %3018 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %3017, <32 x i32> %2901) #11
  %3019 = bitcast <32 x i32> %3018 to <128 x i8>
  %3020 = shufflevector <128 x i8> %3019, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %3021 = add nsw i32 %output.s0.c.co.rebased.us, %a15
  %3022 = shl nsw i32 %3021, 5
  %3023 = add nsw i32 %3063, %3022
  %3024 = getelementptr inbounds i8, i8* %23, i32 %3023
  %3025 = bitcast i8* %3024 to <32 x i8>*
  store <32 x i8> %3020, <32 x i8>* %3025, align 1, !tbaa !113
  br label %after_bb324.us

next_bb326.us:                                    ; preds = %"consume convolved323.us"
  %3026 = or i32 %2995, 1
  %3027 = insertelement <32 x i32> undef, i32 %3026, i32 0
  %3028 = shufflevector <32 x i32> %3027, <32 x i32> undef, <32 x i32> zeroinitializer
  %3029 = add nsw <32 x i32> %3028, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %3030 = icmp sle <32 x i32> %3029, %2904
  %.not401.us = icmp sgt i32 %3026, %4
  %3031 = select i1 %.not401.us, <32 x i32> zeroinitializer, <32 x i32> %convolved394.sroa.0.57.us
  %ab1.i671.us = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %3031, <32 x i32> %2888) #11
  %ab.i672.us = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1.i671.us, <32 x i32> %3031, <32 x i32> %2888) #11
  %3032 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i672.us, i32 %output_shift) #11
  %3033 = call <32 x i32> @llvm.hexagon.V6.vasrw.128B(<32 x i32> %ab.i672.us, i32 %2891) #11
  %3034 = and <32 x i32> %3033, %2890
  %3035 = add nsw <32 x i32> %3034, %3032
  %3036 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %3035)
  %3037 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %3036) #11
  %3038 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %3036) #11
  %3039 = call <32 x i32> @llvm.hexagon.V6.vpackwh.sat.128B(<32 x i32> %3038, <32 x i32> %3037) #11
  %3040 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %3039, <32 x i32> %2895) #11
  %3041 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> undef, <32 x i32> %3040)
  %3042 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %3041) #11
  %3043 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %3041) #11
  %3044 = call <32 x i32> @llvm.hexagon.V6.vpackhub.sat.128B(<32 x i32> %3042, <32 x i32> %3043) #11
  %3045 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %3044, <32 x i32> %2898) #11
  %3046 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %3045, <32 x i32> %2901) #11
  %3047 = bitcast <32 x i32> %3046 to <128 x i8>
  %3048 = shufflevector <128 x i8> %3047, <128 x i8> undef, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %3049 = add nsw i32 %3063, %2995
  %3050 = getelementptr inbounds i8, i8* %23, i32 %3049
  %3051 = bitcast i8* %3050 to <32 x i8>*
  call void @llvm.masked.store.v32i8.p0v32i8(<32 x i8> %3048, <32 x i8>* %3051, i32 1, <32 x i1> %3030), !tbaa !113
  br label %after_bb324.us

after_bb324.us:                                   ; preds = %next_bb326.us, %then_bb325.us
  %3052 = add nuw nsw i32 %output.s0.c.co.rebased.us, 1
  %.not402.us = icmp eq i32 %3052, %t1167
  br i1 %.not402.us, label %"end for output.s0.c.co.rebased.us", label %"for output.s0.c.co.rebased.us"

"end for output.s0.c.co.rebased.us":              ; preds = %after_bb324.us, %"end for output.s0.c.co279.us"
  %convolved394.sroa.0.50.us = phi <32 x i32> [ %convolved394.sroa.0.41.us, %"end for output.s0.c.co279.us" ], [ %convolved394.sroa.0.57.us, %after_bb324.us ]
  %3053 = add nuw nsw i32 %output.s0.x.xo253.us, 1
  %.not399.us = icmp eq i32 %3053, %26
  br i1 %.not399.us, label %"end for output.s0.x.xo252.loopexit.us", label %"for output.s0.x.xo251.us"

"for sum_input.s1.r19$x265.preheader.us":         ; preds = %"for sum_input.s1.r19$y262.us"
  %3054 = mul nsw i32 %"sum_input.s1.r19$y264.us", %dilation_y
  %3055 = add nsw i32 %3054, %2919
  %3056 = mul nsw i32 %3055, %19
  %t1183.us = add i32 %2916, %3056
  br i1 %2908, label %"end for sum_input.s1.r19$x266.us.loopexit.unr-lcssa", label %"for sum_input.s1.r19$x265.us"

"for output.s0.c.co.rebased.preheader.us":        ; preds = %"end for output.s0.c.co279.us"
  %sum_input254393.sroa.0.0.vec.extract832.us = extractelement <32 x i32> %sum_input254393.sroa.0.34.us, i32 0
  %3057 = mul nsw i32 %sum_input254393.sroa.0.0.vec.extract832.us, %307
  %3058 = insertelement <32 x i32> undef, i32 %3057, i32 0
  %3059 = shufflevector <32 x i32> %3058, <32 x i32> undef, <32 x i32> zeroinitializer
  %3060 = add nsw i32 %output.s0.x.xo253.us, %25
  %3061 = mul nsw i32 %3060, %stride_x
  %3062 = mul nsw i32 %3060, %27
  %3063 = add nsw i32 %3062, %t1180.us
  %3064 = select i1 %t843.not, <32 x i32> zeroinitializer, <32 x i32> %3059
  br label %"for output.s0.c.co.rebased.us"

"for output.s0.c.co278.preheader.us":             ; preds = %"consume sum_input277.us"
  %sum_input254393.sroa.0.0.vec.extract834.us = extractelement <32 x i32> %sum_input254393.sroa.0.34.us, i32 0
  %3065 = mul nsw i32 %sum_input254393.sroa.0.0.vec.extract834.us, %307
  %3066 = insertelement <32 x i32> undef, i32 %3065, i32 0
  %3067 = shufflevector <32 x i32> %3066, <32 x i32> undef, <32 x i32> zeroinitializer
  %3068 = add nsw i32 %output.s0.x.xo253.us, %25
  %3069 = mul nsw i32 %3068, %stride_x
  %3070 = mul nsw i32 %3068, %27
  %3071 = add nsw i32 %3070, %t1180.us
  %3072 = select i1 %t843.not, <32 x i32> zeroinitializer, <32 x i32> %3067
  br label %"for output.s0.c.co278.us"

"for sum_input.s1.r19$y262.preheader.us":         ; preds = %then_bb260.us
  %3073 = add nsw i32 %output.s0.x.xo253.us, %25
  %3074 = sub i32 %3073, %16
  br label %"for sum_input.s1.r19$y262.us"

"for sum_input.s1.r19$y268.preheader.us":         ; preds = %next_bb261.us
  %3075 = add nsw i32 %output.s0.x.xo253.us, %25
  %3076 = mul nsw i32 %3075, %stride_x
  br i1 %2885, label %"for sum_input.s1.r19$y268.us.us", label %"consume sum_input277.us", !prof !96

"end for output.s0.x.xo252.loopexit.us":          ; preds = %"end for output.s0.c.co.rebased.us"
  %3077 = add nuw nsw i32 %output.s0.y.rebased250.us, 1
  %.not398.us = icmp eq i32 %3077, %29
  br i1 %.not398.us, label %"end for output.s0.y.rebased249", label %"for output.s0.y.rebased248.us"

"for sum_input.s1.r19$y268.us.us":                ; preds = %"for sum_input.s1.r19$y268.preheader.us", %"end for sum_input.s1.r19$x272.loopexit.us.us"
  %sum_input254393.sroa.0.29.us.us = phi <32 x i32> [ %.us-phi.us.us, %"end for sum_input.s1.r19$x272.loopexit.us.us" ], [ %sum_input254393.sroa.0.0.vec.insert843.us, %"for sum_input.s1.r19$y268.preheader.us" ]
  %"sum_input.s1.r19$y270.us.us" = phi i32 [ %3081, %"end for sum_input.s1.r19$x272.loopexit.us.us" ], [ 0, %"for sum_input.s1.r19$y268.preheader.us" ]
  %3078 = mul nsw i32 %"sum_input.s1.r19$y270.us.us", %dilation_y
  %3079 = add nsw i32 %3078, %2919
  %3080 = mul nsw i32 %3079, %19
  %t1185.us.us = add nsw i32 %2915, %3080
  br i1 %2886, label %"for sum_input.s1.r19$x271.us.us.us", label %"end for sum_input.s1.r19$x272.loopexit.us.us", !prof !96

"end for sum_input.s1.r19$x272.loopexit.us.us.loopexit": ; preds = %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us"
  %sum_input254393.sroa.0.0.vec.insert.us.us.us.le.le = insertelement <32 x i32> %sum_input254393.sroa.0.32.us.us.us.lcssa, i32 %.lcssa1587, i32 0
  br label %"end for sum_input.s1.r19$x272.loopexit.us.us"

"end for sum_input.s1.r19$x272.loopexit.us.us":   ; preds = %"end for sum_input.s1.r19$x272.loopexit.us.us.loopexit", %"for sum_input.s1.r19$y268.us.us"
  %.us-phi.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.29.us.us, %"for sum_input.s1.r19$y268.us.us" ], [ %sum_input254393.sroa.0.0.vec.insert.us.us.us.le.le, %"end for sum_input.s1.r19$x272.loopexit.us.us.loopexit" ]
  %3081 = add nuw nsw i32 %"sum_input.s1.r19$y270.us.us", 1
  %.not410.us.us = icmp eq i32 %3081, %11
  br i1 %.not410.us.us, label %"consume sum_input277.us", label %"for sum_input.s1.r19$y268.us.us"

"for sum_input.s1.r19$x271.us.us.us":             ; preds = %"for sum_input.s1.r19$y268.us.us", %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us"
  %sum_input254393.sroa.0.30.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.vec.insert.us.us.us.le, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us" ], [ %sum_input254393.sroa.0.29.us.us, %"for sum_input.s1.r19$y268.us.us" ]
  %"sum_input.s1.r19$x273.us.us.us" = phi i32 [ %3166, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us" ], [ 0, %"for sum_input.s1.r19$y268.us.us" ]
  %3082 = mul nsw i32 %"sum_input.s1.r19$x273.us.us.us", %dilation_x
  %t1186.s.us.us.us = add nsw i32 %3082, %3076
  %3083 = mul nsw i32 %t1186.s.us.us.us, %17
  %3084 = add nsw i32 %t1185.us.us, %3083
  br i1 %2907, label %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa", label %"for sum_input.s1.r19$z.r124274.us.us.us"

"for sum_input.s1.r19$z.r124274.us.us.us":        ; preds = %"for sum_input.s1.r19$x271.us.us.us", %"for sum_input.s1.r19$z.r124274.us.us.us"
  %sum_input254393.sroa.0.32.us.us.us = phi <32 x i32> [ %sum_input254393.sroa.0.0.vec.insert.us.us.us.7, %"for sum_input.s1.r19$z.r124274.us.us.us" ], [ %sum_input254393.sroa.0.30.us.us.us, %"for sum_input.s1.r19$x271.us.us.us" ]
  %"sum_input.s1.r19$z.r124276.us.us.us" = phi i32 [ %3156, %"for sum_input.s1.r19$z.r124274.us.us.us" ], [ 0, %"for sum_input.s1.r19$x271.us.us.us" ]
  %niter1609 = phi i32 [ %niter1609.nsub.7, %"for sum_input.s1.r19$z.r124274.us.us.us" ], [ %unroll_iter1608, %"for sum_input.s1.r19$x271.us.us.us" ]
  %sum_input254393.sroa.0.0.vec.extract837.us.us.us = extractelement <32 x i32> %sum_input254393.sroa.0.32.us.us.us, i32 0
  %3085 = shl nsw i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3086 = add nsw i32 %3084, %3085
  %3087 = getelementptr inbounds i8, i8* %13, i32 %3086
  %3088 = bitcast i8* %3087 to <4 x i8>*
  %3089 = load <4 x i8>, <4 x i8>* %3088, align 4, !tbaa !110
  %3090 = zext <4 x i8> %3089 to <4 x i32>
  %3091 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3090) #9
  %3092 = add nsw i32 %3091, %sum_input254393.sroa.0.0.vec.extract837.us.us.us
  %3093 = shl i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3094 = or i32 %3093, 4
  %3095 = add nsw i32 %3084, %3094
  %3096 = getelementptr inbounds i8, i8* %13, i32 %3095
  %3097 = bitcast i8* %3096 to <4 x i8>*
  %3098 = load <4 x i8>, <4 x i8>* %3097, align 4, !tbaa !110
  %3099 = zext <4 x i8> %3098 to <4 x i32>
  %3100 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3099) #9
  %3101 = add nsw i32 %3100, %3092
  %3102 = shl i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3103 = or i32 %3102, 8
  %3104 = add nsw i32 %3084, %3103
  %3105 = getelementptr inbounds i8, i8* %13, i32 %3104
  %3106 = bitcast i8* %3105 to <4 x i8>*
  %3107 = load <4 x i8>, <4 x i8>* %3106, align 4, !tbaa !110
  %3108 = zext <4 x i8> %3107 to <4 x i32>
  %3109 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3108) #9
  %3110 = add nsw i32 %3109, %3101
  %3111 = shl i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3112 = or i32 %3111, 12
  %3113 = add nsw i32 %3084, %3112
  %3114 = getelementptr inbounds i8, i8* %13, i32 %3113
  %3115 = bitcast i8* %3114 to <4 x i8>*
  %3116 = load <4 x i8>, <4 x i8>* %3115, align 4, !tbaa !110
  %3117 = zext <4 x i8> %3116 to <4 x i32>
  %3118 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3117) #9
  %3119 = add nsw i32 %3118, %3110
  %3120 = shl i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3121 = or i32 %3120, 16
  %3122 = add nsw i32 %3084, %3121
  %3123 = getelementptr inbounds i8, i8* %13, i32 %3122
  %3124 = bitcast i8* %3123 to <4 x i8>*
  %3125 = load <4 x i8>, <4 x i8>* %3124, align 4, !tbaa !110
  %3126 = zext <4 x i8> %3125 to <4 x i32>
  %3127 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3126) #9
  %3128 = add nsw i32 %3127, %3119
  %3129 = shl i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3130 = or i32 %3129, 20
  %3131 = add nsw i32 %3084, %3130
  %3132 = getelementptr inbounds i8, i8* %13, i32 %3131
  %3133 = bitcast i8* %3132 to <4 x i8>*
  %3134 = load <4 x i8>, <4 x i8>* %3133, align 4, !tbaa !110
  %3135 = zext <4 x i8> %3134 to <4 x i32>
  %3136 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3135) #9
  %3137 = add nsw i32 %3136, %3128
  %3138 = shl i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3139 = or i32 %3138, 24
  %3140 = add nsw i32 %3084, %3139
  %3141 = getelementptr inbounds i8, i8* %13, i32 %3140
  %3142 = bitcast i8* %3141 to <4 x i8>*
  %3143 = load <4 x i8>, <4 x i8>* %3142, align 4, !tbaa !110
  %3144 = zext <4 x i8> %3143 to <4 x i32>
  %3145 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3144) #9
  %3146 = add nsw i32 %3145, %3137
  %sum_input254393.sroa.0.0.vec.insert.us.us.us.6 = insertelement <32 x i32> %sum_input254393.sroa.0.32.us.us.us, i32 %3146, i32 0
  %3147 = shl i32 %"sum_input.s1.r19$z.r124276.us.us.us", 2
  %3148 = or i32 %3147, 28
  %3149 = add nsw i32 %3084, %3148
  %3150 = getelementptr inbounds i8, i8* %13, i32 %3149
  %3151 = bitcast i8* %3150 to <4 x i8>*
  %3152 = load <4 x i8>, <4 x i8>* %3151, align 4, !tbaa !110
  %3153 = zext <4 x i8> %3152 to <4 x i32>
  %3154 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3153) #9
  %3155 = add nsw i32 %3154, %3146
  %sum_input254393.sroa.0.0.vec.insert.us.us.us.7 = insertelement <32 x i32> %sum_input254393.sroa.0.0.vec.insert.us.us.us.6, i32 %3155, i32 0
  %3156 = add nuw nsw i32 %"sum_input.s1.r19$z.r124276.us.us.us", 8
  %niter1609.nsub.7 = add i32 %niter1609, -8
  %niter1609.ncmp.7 = icmp eq i32 %niter1609.nsub.7, 0
  br i1 %niter1609.ncmp.7, label %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa.loopexit", label %"for sum_input.s1.r19$z.r124274.us.us.us"

"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa.loopexit": ; preds = %"for sum_input.s1.r19$z.r124274.us.us.us"
  %sum_input254393.sroa.0.0.vec.insert.us.us.us.6.le = insertelement <32 x i32> %sum_input254393.sroa.0.32.us.us.us, i32 %3146, i32 0
  %sum_input254393.sroa.0.0.vec.insert.us.us.us.7.le = insertelement <32 x i32> %sum_input254393.sroa.0.0.vec.insert.us.us.us.6.le, i32 %3155, i32 0
  br label %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa"

"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa": ; preds = %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa.loopexit", %"for sum_input.s1.r19$x271.us.us.us"
  %sum_input254393.sroa.0.32.us.us.us.lcssa.ph = phi <32 x i32> [ undef, %"for sum_input.s1.r19$x271.us.us.us" ], [ %sum_input254393.sroa.0.0.vec.insert.us.us.us.6.le, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa.loopexit" ]
  %.lcssa1587.ph = phi i32 [ undef, %"for sum_input.s1.r19$x271.us.us.us" ], [ %3155, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa.loopexit" ]
  %sum_input254393.sroa.0.32.us.us.us.unr = phi <32 x i32> [ %sum_input254393.sroa.0.30.us.us.us, %"for sum_input.s1.r19$x271.us.us.us" ], [ %sum_input254393.sroa.0.0.vec.insert.us.us.us.7.le, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa.loopexit" ]
  %"sum_input.s1.r19$z.r124276.us.us.us.unr" = phi i32 [ 0, %"for sum_input.s1.r19$x271.us.us.us" ], [ %3156, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa.loopexit" ]
  br i1 %lcmp.mod1605.not, label %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us", label %"for sum_input.s1.r19$z.r124274.us.us.us.epil"

"for sum_input.s1.r19$z.r124274.us.us.us.epil":   ; preds = %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa", %"for sum_input.s1.r19$z.r124274.us.us.us.epil"
  %sum_input254393.sroa.0.32.us.us.us.epil = phi <32 x i32> [ %sum_input254393.sroa.0.0.vec.insert.us.us.us.epil, %"for sum_input.s1.r19$z.r124274.us.us.us.epil" ], [ %sum_input254393.sroa.0.32.us.us.us.unr, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa" ]
  %"sum_input.s1.r19$z.r124276.us.us.us.epil" = phi i32 [ %3165, %"for sum_input.s1.r19$z.r124274.us.us.us.epil" ], [ %"sum_input.s1.r19$z.r124276.us.us.us.unr", %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa" ]
  %epil.iter1604 = phi i32 [ %epil.iter1604.sub, %"for sum_input.s1.r19$z.r124274.us.us.us.epil" ], [ %xtraiter1603, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa" ]
  %sum_input254393.sroa.0.0.vec.extract837.us.us.us.epil = extractelement <32 x i32> %sum_input254393.sroa.0.32.us.us.us.epil, i32 0
  %3157 = shl nsw i32 %"sum_input.s1.r19$z.r124276.us.us.us.epil", 2
  %3158 = add nsw i32 %3084, %3157
  %3159 = getelementptr inbounds i8, i8* %13, i32 %3158
  %3160 = bitcast i8* %3159 to <4 x i8>*
  %3161 = load <4 x i8>, <4 x i8>* %3160, align 4, !tbaa !110
  %3162 = zext <4 x i8> %3161 to <4 x i32>
  %3163 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3162) #9
  %3164 = add nsw i32 %3163, %sum_input254393.sroa.0.0.vec.extract837.us.us.us.epil
  %sum_input254393.sroa.0.0.vec.insert.us.us.us.epil = insertelement <32 x i32> %sum_input254393.sroa.0.32.us.us.us.epil, i32 %3164, i32 0
  %3165 = add nuw nsw i32 %"sum_input.s1.r19$z.r124276.us.us.us.epil", 1
  %epil.iter1604.sub = add i32 %epil.iter1604, -1
  %epil.iter1604.cmp.not = icmp eq i32 %epil.iter1604.sub, 0
  br i1 %epil.iter1604.cmp.not, label %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us", label %"for sum_input.s1.r19$z.r124274.us.us.us.epil", !llvm.loop !123

"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us": ; preds = %"for sum_input.s1.r19$z.r124274.us.us.us.epil", %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa"
  %sum_input254393.sroa.0.32.us.us.us.lcssa = phi <32 x i32> [ %sum_input254393.sroa.0.32.us.us.us.lcssa.ph, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa" ], [ %sum_input254393.sroa.0.32.us.us.us.epil, %"for sum_input.s1.r19$z.r124274.us.us.us.epil" ]
  %.lcssa1587 = phi i32 [ %.lcssa1587.ph, %"end for sum_input.s1.r19$z.r124275.loopexit.us.us.us.unr-lcssa" ], [ %3164, %"for sum_input.s1.r19$z.r124274.us.us.us.epil" ]
  %sum_input254393.sroa.0.0.vec.insert.us.us.us.le = insertelement <32 x i32> %sum_input254393.sroa.0.32.us.us.us.lcssa, i32 %.lcssa1587, i32 0
  %3166 = add nuw nsw i32 %"sum_input.s1.r19$x273.us.us.us", 1
  %.not411.us.us.us = icmp eq i32 %3166, %9
  br i1 %.not411.us.us.us, label %"end for sum_input.s1.r19$x272.loopexit.us.us.loopexit", label %"for sum_input.s1.r19$x271.us.us.us"

"for convolved.s1.r19$y288.us.us.us":             ; preds = %then_bb283.us, %"end for convolved.s1.r19$x292.loopexit.split.us.us.us.us"
  %convolved394.sroa.0.43.us.us.us = phi <32 x i32> [ %.lcssa1589, %"end for convolved.s1.r19$x292.loopexit.split.us.us.us.us" ], [ %convolved394.sroa.0.42.us, %then_bb283.us ]
  %"convolved.s1.r19$y290.us.us.us" = phi i32 [ %3294, %"end for convolved.s1.r19$x292.loopexit.split.us.us.us.us" ], [ 0, %then_bb283.us ]
  %3167 = mul nsw i32 %"convolved.s1.r19$y290.us.us.us", %dilation_y
  %3168 = add nsw i32 %3167, %2919
  %3169 = mul nsw i32 %3168, %19
  %t1191.us.us.us = add nsw i32 %2915, %3169
  %3170 = mul nsw i32 %"convolved.s1.r19$y290.us.us.us", %12
  %t1192.us.us.us = add nsw i32 %3170, %2971
  br label %"for convolved.s1.r19$x291.us.us.us.us"

"for convolved.s1.r19$x291.us.us.us.us":          ; preds = %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us", %"for convolved.s1.r19$y288.us.us.us"
  %convolved394.sroa.0.44.us.us.us.us = phi <32 x i32> [ %.lcssa1589, %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us" ], [ %convolved394.sroa.0.43.us.us.us, %"for convolved.s1.r19$y288.us.us.us" ]
  %"convolved.s1.r19$x293.us.us.us.us" = phi i32 [ %3293, %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us" ], [ 0, %"for convolved.s1.r19$y288.us.us.us" ]
  %3171 = mul nsw i32 %"convolved.s1.r19$x293.us.us.us.us", %dilation_x
  %t1193.s.us.us.us.us = add nsw i32 %3171, %3069
  %3172 = mul nsw i32 %"convolved.s1.r19$x293.us.us.us.us", %10
  %3173 = add nsw i32 %t1192.us.us.us, %3172
  %3174 = mul nsw i32 %t1193.s.us.us.us.us, %17
  %3175 = add nsw i32 %t1191.us.us.us, %3174
  br i1 %2909, label %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124294.us.us.us.us"

"for convolved.s1.r19$z.r124294.us.us.us.us":     ; preds = %"for convolved.s1.r19$x291.us.us.us.us", %"for convolved.s1.r19$z.r124294.us.us.us.us"
  %convolved394.sroa.0.46.us.us.us.us = phi <32 x i32> [ %3278, %"for convolved.s1.r19$z.r124294.us.us.us.us" ], [ %convolved394.sroa.0.44.us.us.us.us, %"for convolved.s1.r19$x291.us.us.us.us" ]
  %"convolved.s1.r19$z.r124296.us.us.us.us" = phi i32 [ %3279, %"for convolved.s1.r19$z.r124294.us.us.us.us" ], [ 0, %"for convolved.s1.r19$x291.us.us.us.us" ]
  %niter1622 = phi i32 [ %niter1622.nsub.7, %"for convolved.s1.r19$z.r124294.us.us.us.us" ], [ %unroll_iter1621, %"for convolved.s1.r19$x291.us.us.us.us" ]
  %3176 = shl nsw i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 7
  %3177 = add nsw i32 %3173, %3176
  %3178 = getelementptr inbounds i8, i8* %5, i32 %3177
  %3179 = bitcast i8* %3178 to <32 x i32>*
  %3180 = load <32 x i32>, <32 x i32>* %3179, align 128, !tbaa !106
  %3181 = shl nsw i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 2
  %3182 = add nsw i32 %3175, %3181
  %3183 = getelementptr inbounds i8, i8* %13, i32 %3182
  %3184 = bitcast i8* %3183 to <1 x i32>*
  %3185 = load <1 x i32>, <1 x i32>* %3184, align 4, !tbaa !110
  %3186 = extractelement <1 x i32> %3185, i64 0
  %3187 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.46.us.us.us.us, <32 x i32> %3180, i32 %3186) #11
  %3188 = or i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 1
  %3189 = shl nsw i32 %3188, 7
  %3190 = add nsw i32 %3173, %3189
  %3191 = getelementptr inbounds i8, i8* %5, i32 %3190
  %3192 = bitcast i8* %3191 to <32 x i32>*
  %3193 = load <32 x i32>, <32 x i32>* %3192, align 128, !tbaa !106
  %3194 = shl nsw i32 %3188, 2
  %3195 = add nsw i32 %3175, %3194
  %3196 = getelementptr inbounds i8, i8* %13, i32 %3195
  %3197 = bitcast i8* %3196 to <1 x i32>*
  %3198 = load <1 x i32>, <1 x i32>* %3197, align 4, !tbaa !110
  %3199 = extractelement <1 x i32> %3198, i64 0
  %3200 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3187, <32 x i32> %3193, i32 %3199) #11
  %3201 = or i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 2
  %3202 = shl nsw i32 %3201, 7
  %3203 = add nsw i32 %3173, %3202
  %3204 = getelementptr inbounds i8, i8* %5, i32 %3203
  %3205 = bitcast i8* %3204 to <32 x i32>*
  %3206 = load <32 x i32>, <32 x i32>* %3205, align 128, !tbaa !106
  %3207 = shl nsw i32 %3201, 2
  %3208 = add nsw i32 %3175, %3207
  %3209 = getelementptr inbounds i8, i8* %13, i32 %3208
  %3210 = bitcast i8* %3209 to <1 x i32>*
  %3211 = load <1 x i32>, <1 x i32>* %3210, align 4, !tbaa !110
  %3212 = extractelement <1 x i32> %3211, i64 0
  %3213 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3200, <32 x i32> %3206, i32 %3212) #11
  %3214 = or i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 3
  %3215 = shl nsw i32 %3214, 7
  %3216 = add nsw i32 %3173, %3215
  %3217 = getelementptr inbounds i8, i8* %5, i32 %3216
  %3218 = bitcast i8* %3217 to <32 x i32>*
  %3219 = load <32 x i32>, <32 x i32>* %3218, align 128, !tbaa !106
  %3220 = shl nsw i32 %3214, 2
  %3221 = add nsw i32 %3175, %3220
  %3222 = getelementptr inbounds i8, i8* %13, i32 %3221
  %3223 = bitcast i8* %3222 to <1 x i32>*
  %3224 = load <1 x i32>, <1 x i32>* %3223, align 4, !tbaa !110
  %3225 = extractelement <1 x i32> %3224, i64 0
  %3226 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3213, <32 x i32> %3219, i32 %3225) #11
  %3227 = or i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 4
  %3228 = shl nsw i32 %3227, 7
  %3229 = add nsw i32 %3173, %3228
  %3230 = getelementptr inbounds i8, i8* %5, i32 %3229
  %3231 = bitcast i8* %3230 to <32 x i32>*
  %3232 = load <32 x i32>, <32 x i32>* %3231, align 128, !tbaa !106
  %3233 = shl nsw i32 %3227, 2
  %3234 = add nsw i32 %3175, %3233
  %3235 = getelementptr inbounds i8, i8* %13, i32 %3234
  %3236 = bitcast i8* %3235 to <1 x i32>*
  %3237 = load <1 x i32>, <1 x i32>* %3236, align 4, !tbaa !110
  %3238 = extractelement <1 x i32> %3237, i64 0
  %3239 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3226, <32 x i32> %3232, i32 %3238) #11
  %3240 = or i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 5
  %3241 = shl nsw i32 %3240, 7
  %3242 = add nsw i32 %3173, %3241
  %3243 = getelementptr inbounds i8, i8* %5, i32 %3242
  %3244 = bitcast i8* %3243 to <32 x i32>*
  %3245 = load <32 x i32>, <32 x i32>* %3244, align 128, !tbaa !106
  %3246 = shl nsw i32 %3240, 2
  %3247 = add nsw i32 %3175, %3246
  %3248 = getelementptr inbounds i8, i8* %13, i32 %3247
  %3249 = bitcast i8* %3248 to <1 x i32>*
  %3250 = load <1 x i32>, <1 x i32>* %3249, align 4, !tbaa !110
  %3251 = extractelement <1 x i32> %3250, i64 0
  %3252 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3239, <32 x i32> %3245, i32 %3251) #11
  %3253 = or i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 6
  %3254 = shl nsw i32 %3253, 7
  %3255 = add nsw i32 %3173, %3254
  %3256 = getelementptr inbounds i8, i8* %5, i32 %3255
  %3257 = bitcast i8* %3256 to <32 x i32>*
  %3258 = load <32 x i32>, <32 x i32>* %3257, align 128, !tbaa !106
  %3259 = shl nsw i32 %3253, 2
  %3260 = add nsw i32 %3175, %3259
  %3261 = getelementptr inbounds i8, i8* %13, i32 %3260
  %3262 = bitcast i8* %3261 to <1 x i32>*
  %3263 = load <1 x i32>, <1 x i32>* %3262, align 4, !tbaa !110
  %3264 = extractelement <1 x i32> %3263, i64 0
  %3265 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3252, <32 x i32> %3258, i32 %3264) #11
  %3266 = or i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 7
  %3267 = shl nsw i32 %3266, 7
  %3268 = add nsw i32 %3173, %3267
  %3269 = getelementptr inbounds i8, i8* %5, i32 %3268
  %3270 = bitcast i8* %3269 to <32 x i32>*
  %3271 = load <32 x i32>, <32 x i32>* %3270, align 128, !tbaa !106
  %3272 = shl nsw i32 %3266, 2
  %3273 = add nsw i32 %3175, %3272
  %3274 = getelementptr inbounds i8, i8* %13, i32 %3273
  %3275 = bitcast i8* %3274 to <1 x i32>*
  %3276 = load <1 x i32>, <1 x i32>* %3275, align 4, !tbaa !110
  %3277 = extractelement <1 x i32> %3276, i64 0
  %3278 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3265, <32 x i32> %3271, i32 %3277) #11
  %3279 = add nuw nsw i32 %"convolved.s1.r19$z.r124296.us.us.us.us", 8
  %niter1622.nsub.7 = add i32 %niter1622, -8
  %niter1622.ncmp.7 = icmp eq i32 %niter1622.nsub.7, 0
  br i1 %niter1622.ncmp.7, label %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124294.us.us.us.us"

"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa": ; preds = %"for convolved.s1.r19$z.r124294.us.us.us.us", %"for convolved.s1.r19$x291.us.us.us.us"
  %.lcssa1589.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x291.us.us.us.us" ], [ %3278, %"for convolved.s1.r19$z.r124294.us.us.us.us" ]
  %convolved394.sroa.0.46.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.0.44.us.us.us.us, %"for convolved.s1.r19$x291.us.us.us.us" ], [ %3278, %"for convolved.s1.r19$z.r124294.us.us.us.us" ]
  %"convolved.s1.r19$z.r124296.us.us.us.us.unr" = phi i32 [ 0, %"for convolved.s1.r19$x291.us.us.us.us" ], [ %3279, %"for convolved.s1.r19$z.r124294.us.us.us.us" ]
  br i1 %lcmp.mod1619.not, label %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r124294.us.us.us.us.epil"

"for convolved.s1.r19$z.r124294.us.us.us.us.epil": ; preds = %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa", %"for convolved.s1.r19$z.r124294.us.us.us.us.epil"
  %convolved394.sroa.0.46.us.us.us.us.epil = phi <32 x i32> [ %3291, %"for convolved.s1.r19$z.r124294.us.us.us.us.epil" ], [ %convolved394.sroa.0.46.us.us.us.us.unr, %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa" ]
  %"convolved.s1.r19$z.r124296.us.us.us.us.epil" = phi i32 [ %3292, %"for convolved.s1.r19$z.r124294.us.us.us.us.epil" ], [ %"convolved.s1.r19$z.r124296.us.us.us.us.unr", %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa" ]
  %epil.iter1618 = phi i32 [ %epil.iter1618.sub, %"for convolved.s1.r19$z.r124294.us.us.us.us.epil" ], [ %xtraiter1617, %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa" ]
  %3280 = shl nsw i32 %"convolved.s1.r19$z.r124296.us.us.us.us.epil", 7
  %3281 = add nsw i32 %3173, %3280
  %3282 = getelementptr inbounds i8, i8* %5, i32 %3281
  %3283 = bitcast i8* %3282 to <32 x i32>*
  %3284 = load <32 x i32>, <32 x i32>* %3283, align 128, !tbaa !106
  %3285 = shl nsw i32 %"convolved.s1.r19$z.r124296.us.us.us.us.epil", 2
  %3286 = add nsw i32 %3175, %3285
  %3287 = getelementptr inbounds i8, i8* %13, i32 %3286
  %3288 = bitcast i8* %3287 to <1 x i32>*
  %3289 = load <1 x i32>, <1 x i32>* %3288, align 4, !tbaa !110
  %3290 = extractelement <1 x i32> %3289, i64 0
  %3291 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.46.us.us.us.us.epil, <32 x i32> %3284, i32 %3290) #11
  %3292 = add nuw nsw i32 %"convolved.s1.r19$z.r124296.us.us.us.us.epil", 1
  %epil.iter1618.sub = add i32 %epil.iter1618, -1
  %epil.iter1618.cmp.not = icmp eq i32 %epil.iter1618.sub, 0
  br i1 %epil.iter1618.cmp.not, label %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r124294.us.us.us.us.epil", !llvm.loop !124

"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us": ; preds = %"for convolved.s1.r19$z.r124294.us.us.us.us.epil", %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa"
  %.lcssa1589 = phi <32 x i32> [ %.lcssa1589.ph, %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us.unr-lcssa" ], [ %3291, %"for convolved.s1.r19$z.r124294.us.us.us.us.epil" ]
  %3293 = add nuw nsw i32 %"convolved.s1.r19$x293.us.us.us.us", 1
  %.not408.us.us.us.us = icmp eq i32 %3293, %9
  br i1 %.not408.us.us.us.us, label %"end for convolved.s1.r19$x292.loopexit.split.us.us.us.us", label %"for convolved.s1.r19$x291.us.us.us.us"

"end for convolved.s1.r19$x292.loopexit.split.us.us.us.us": ; preds = %"end for convolved.s1.r19$z.r124295.loopexit.us.us.us.us"
  %3294 = add nuw nsw i32 %"convolved.s1.r19$y290.us.us.us", 1
  %.not407.us.us.us = icmp eq i32 %3294, %11
  br i1 %.not407.us.us.us, label %"consume convolved297.us", label %"for convolved.s1.r19$y288.us.us.us"

"for convolved.s1.r19$y314.us.us.us":             ; preds = %then_bb306.us, %"end for convolved.s1.r19$x318.loopexit.split.us.us.us.us"
  %convolved394.sroa.0.52.us.us.us = phi <32 x i32> [ %.lcssa1590, %"end for convolved.s1.r19$x318.loopexit.split.us.us.us.us" ], [ %convolved394.sroa.0.51.us, %then_bb306.us ]
  %"convolved.s1.r19$y316.us.us.us" = phi i32 [ %3422, %"end for convolved.s1.r19$x318.loopexit.split.us.us.us.us" ], [ 0, %then_bb306.us ]
  %3295 = mul nsw i32 %"convolved.s1.r19$y316.us.us.us", %dilation_y
  %3296 = add nsw i32 %3295, %2919
  %3297 = mul nsw i32 %3296, %19
  %t1201.us.us.us = add nsw i32 %2915, %3297
  %3298 = mul nsw i32 %"convolved.s1.r19$y316.us.us.us", %12
  %t1202.us.us.us = add nsw i32 %3298, %3002
  br label %"for convolved.s1.r19$x317.us.us.us.us"

"for convolved.s1.r19$x317.us.us.us.us":          ; preds = %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us", %"for convolved.s1.r19$y314.us.us.us"
  %convolved394.sroa.0.53.us.us.us.us = phi <32 x i32> [ %.lcssa1590, %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us" ], [ %convolved394.sroa.0.52.us.us.us, %"for convolved.s1.r19$y314.us.us.us" ]
  %"convolved.s1.r19$x319.us.us.us.us" = phi i32 [ %3421, %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us" ], [ 0, %"for convolved.s1.r19$y314.us.us.us" ]
  %3299 = mul nsw i32 %"convolved.s1.r19$x319.us.us.us.us", %dilation_x
  %t1203.s.us.us.us.us = add nsw i32 %3299, %3061
  %3300 = mul nsw i32 %"convolved.s1.r19$x319.us.us.us.us", %10
  %3301 = add nsw i32 %t1202.us.us.us, %3300
  %3302 = mul nsw i32 %t1203.s.us.us.us.us, %17
  %3303 = add nsw i32 %t1201.us.us.us, %3302
  br i1 %2910, label %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124320.us.us.us.us"

"for convolved.s1.r19$z.r124320.us.us.us.us":     ; preds = %"for convolved.s1.r19$x317.us.us.us.us", %"for convolved.s1.r19$z.r124320.us.us.us.us"
  %convolved394.sroa.0.55.us.us.us.us = phi <32 x i32> [ %3406, %"for convolved.s1.r19$z.r124320.us.us.us.us" ], [ %convolved394.sroa.0.53.us.us.us.us, %"for convolved.s1.r19$x317.us.us.us.us" ]
  %"convolved.s1.r19$z.r124322.us.us.us.us" = phi i32 [ %3407, %"for convolved.s1.r19$z.r124320.us.us.us.us" ], [ 0, %"for convolved.s1.r19$x317.us.us.us.us" ]
  %niter1628 = phi i32 [ %niter1628.nsub.7, %"for convolved.s1.r19$z.r124320.us.us.us.us" ], [ %unroll_iter1627, %"for convolved.s1.r19$x317.us.us.us.us" ]
  %3304 = shl nsw i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 7
  %3305 = add nsw i32 %3301, %3304
  %3306 = getelementptr inbounds i8, i8* %5, i32 %3305
  %3307 = bitcast i8* %3306 to <32 x i32>*
  %3308 = load <32 x i32>, <32 x i32>* %3307, align 128, !tbaa !106
  %3309 = shl nsw i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 2
  %3310 = add nsw i32 %3303, %3309
  %3311 = getelementptr inbounds i8, i8* %13, i32 %3310
  %3312 = bitcast i8* %3311 to <1 x i32>*
  %3313 = load <1 x i32>, <1 x i32>* %3312, align 4, !tbaa !110
  %3314 = extractelement <1 x i32> %3313, i64 0
  %3315 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.55.us.us.us.us, <32 x i32> %3308, i32 %3314) #11
  %3316 = or i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 1
  %3317 = shl nsw i32 %3316, 7
  %3318 = add nsw i32 %3301, %3317
  %3319 = getelementptr inbounds i8, i8* %5, i32 %3318
  %3320 = bitcast i8* %3319 to <32 x i32>*
  %3321 = load <32 x i32>, <32 x i32>* %3320, align 128, !tbaa !106
  %3322 = shl nsw i32 %3316, 2
  %3323 = add nsw i32 %3303, %3322
  %3324 = getelementptr inbounds i8, i8* %13, i32 %3323
  %3325 = bitcast i8* %3324 to <1 x i32>*
  %3326 = load <1 x i32>, <1 x i32>* %3325, align 4, !tbaa !110
  %3327 = extractelement <1 x i32> %3326, i64 0
  %3328 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3315, <32 x i32> %3321, i32 %3327) #11
  %3329 = or i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 2
  %3330 = shl nsw i32 %3329, 7
  %3331 = add nsw i32 %3301, %3330
  %3332 = getelementptr inbounds i8, i8* %5, i32 %3331
  %3333 = bitcast i8* %3332 to <32 x i32>*
  %3334 = load <32 x i32>, <32 x i32>* %3333, align 128, !tbaa !106
  %3335 = shl nsw i32 %3329, 2
  %3336 = add nsw i32 %3303, %3335
  %3337 = getelementptr inbounds i8, i8* %13, i32 %3336
  %3338 = bitcast i8* %3337 to <1 x i32>*
  %3339 = load <1 x i32>, <1 x i32>* %3338, align 4, !tbaa !110
  %3340 = extractelement <1 x i32> %3339, i64 0
  %3341 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3328, <32 x i32> %3334, i32 %3340) #11
  %3342 = or i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 3
  %3343 = shl nsw i32 %3342, 7
  %3344 = add nsw i32 %3301, %3343
  %3345 = getelementptr inbounds i8, i8* %5, i32 %3344
  %3346 = bitcast i8* %3345 to <32 x i32>*
  %3347 = load <32 x i32>, <32 x i32>* %3346, align 128, !tbaa !106
  %3348 = shl nsw i32 %3342, 2
  %3349 = add nsw i32 %3303, %3348
  %3350 = getelementptr inbounds i8, i8* %13, i32 %3349
  %3351 = bitcast i8* %3350 to <1 x i32>*
  %3352 = load <1 x i32>, <1 x i32>* %3351, align 4, !tbaa !110
  %3353 = extractelement <1 x i32> %3352, i64 0
  %3354 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3341, <32 x i32> %3347, i32 %3353) #11
  %3355 = or i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 4
  %3356 = shl nsw i32 %3355, 7
  %3357 = add nsw i32 %3301, %3356
  %3358 = getelementptr inbounds i8, i8* %5, i32 %3357
  %3359 = bitcast i8* %3358 to <32 x i32>*
  %3360 = load <32 x i32>, <32 x i32>* %3359, align 128, !tbaa !106
  %3361 = shl nsw i32 %3355, 2
  %3362 = add nsw i32 %3303, %3361
  %3363 = getelementptr inbounds i8, i8* %13, i32 %3362
  %3364 = bitcast i8* %3363 to <1 x i32>*
  %3365 = load <1 x i32>, <1 x i32>* %3364, align 4, !tbaa !110
  %3366 = extractelement <1 x i32> %3365, i64 0
  %3367 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3354, <32 x i32> %3360, i32 %3366) #11
  %3368 = or i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 5
  %3369 = shl nsw i32 %3368, 7
  %3370 = add nsw i32 %3301, %3369
  %3371 = getelementptr inbounds i8, i8* %5, i32 %3370
  %3372 = bitcast i8* %3371 to <32 x i32>*
  %3373 = load <32 x i32>, <32 x i32>* %3372, align 128, !tbaa !106
  %3374 = shl nsw i32 %3368, 2
  %3375 = add nsw i32 %3303, %3374
  %3376 = getelementptr inbounds i8, i8* %13, i32 %3375
  %3377 = bitcast i8* %3376 to <1 x i32>*
  %3378 = load <1 x i32>, <1 x i32>* %3377, align 4, !tbaa !110
  %3379 = extractelement <1 x i32> %3378, i64 0
  %3380 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3367, <32 x i32> %3373, i32 %3379) #11
  %3381 = or i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 6
  %3382 = shl nsw i32 %3381, 7
  %3383 = add nsw i32 %3301, %3382
  %3384 = getelementptr inbounds i8, i8* %5, i32 %3383
  %3385 = bitcast i8* %3384 to <32 x i32>*
  %3386 = load <32 x i32>, <32 x i32>* %3385, align 128, !tbaa !106
  %3387 = shl nsw i32 %3381, 2
  %3388 = add nsw i32 %3303, %3387
  %3389 = getelementptr inbounds i8, i8* %13, i32 %3388
  %3390 = bitcast i8* %3389 to <1 x i32>*
  %3391 = load <1 x i32>, <1 x i32>* %3390, align 4, !tbaa !110
  %3392 = extractelement <1 x i32> %3391, i64 0
  %3393 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3380, <32 x i32> %3386, i32 %3392) #11
  %3394 = or i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 7
  %3395 = shl nsw i32 %3394, 7
  %3396 = add nsw i32 %3301, %3395
  %3397 = getelementptr inbounds i8, i8* %5, i32 %3396
  %3398 = bitcast i8* %3397 to <32 x i32>*
  %3399 = load <32 x i32>, <32 x i32>* %3398, align 128, !tbaa !106
  %3400 = shl nsw i32 %3394, 2
  %3401 = add nsw i32 %3303, %3400
  %3402 = getelementptr inbounds i8, i8* %13, i32 %3401
  %3403 = bitcast i8* %3402 to <1 x i32>*
  %3404 = load <1 x i32>, <1 x i32>* %3403, align 4, !tbaa !110
  %3405 = extractelement <1 x i32> %3404, i64 0
  %3406 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %3393, <32 x i32> %3399, i32 %3405) #11
  %3407 = add nuw nsw i32 %"convolved.s1.r19$z.r124322.us.us.us.us", 8
  %niter1628.nsub.7 = add i32 %niter1628, -8
  %niter1628.ncmp.7 = icmp eq i32 %niter1628.nsub.7, 0
  br i1 %niter1628.ncmp.7, label %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa", label %"for convolved.s1.r19$z.r124320.us.us.us.us"

"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa": ; preds = %"for convolved.s1.r19$z.r124320.us.us.us.us", %"for convolved.s1.r19$x317.us.us.us.us"
  %.lcssa1590.ph = phi <32 x i32> [ undef, %"for convolved.s1.r19$x317.us.us.us.us" ], [ %3406, %"for convolved.s1.r19$z.r124320.us.us.us.us" ]
  %convolved394.sroa.0.55.us.us.us.us.unr = phi <32 x i32> [ %convolved394.sroa.0.53.us.us.us.us, %"for convolved.s1.r19$x317.us.us.us.us" ], [ %3406, %"for convolved.s1.r19$z.r124320.us.us.us.us" ]
  %"convolved.s1.r19$z.r124322.us.us.us.us.unr" = phi i32 [ 0, %"for convolved.s1.r19$x317.us.us.us.us" ], [ %3407, %"for convolved.s1.r19$z.r124320.us.us.us.us" ]
  br i1 %lcmp.mod1625.not, label %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r124320.us.us.us.us.epil"

"for convolved.s1.r19$z.r124320.us.us.us.us.epil": ; preds = %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa", %"for convolved.s1.r19$z.r124320.us.us.us.us.epil"
  %convolved394.sroa.0.55.us.us.us.us.epil = phi <32 x i32> [ %3419, %"for convolved.s1.r19$z.r124320.us.us.us.us.epil" ], [ %convolved394.sroa.0.55.us.us.us.us.unr, %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa" ]
  %"convolved.s1.r19$z.r124322.us.us.us.us.epil" = phi i32 [ %3420, %"for convolved.s1.r19$z.r124320.us.us.us.us.epil" ], [ %"convolved.s1.r19$z.r124322.us.us.us.us.unr", %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa" ]
  %epil.iter1624 = phi i32 [ %epil.iter1624.sub, %"for convolved.s1.r19$z.r124320.us.us.us.us.epil" ], [ %xtraiter1623, %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa" ]
  %3408 = shl nsw i32 %"convolved.s1.r19$z.r124322.us.us.us.us.epil", 7
  %3409 = add nsw i32 %3301, %3408
  %3410 = getelementptr inbounds i8, i8* %5, i32 %3409
  %3411 = bitcast i8* %3410 to <32 x i32>*
  %3412 = load <32 x i32>, <32 x i32>* %3411, align 128, !tbaa !106
  %3413 = shl nsw i32 %"convolved.s1.r19$z.r124322.us.us.us.us.epil", 2
  %3414 = add nsw i32 %3303, %3413
  %3415 = getelementptr inbounds i8, i8* %13, i32 %3414
  %3416 = bitcast i8* %3415 to <1 x i32>*
  %3417 = load <1 x i32>, <1 x i32>* %3416, align 4, !tbaa !110
  %3418 = extractelement <1 x i32> %3417, i64 0
  %3419 = call <32 x i32> @llvm.hexagon.V6.vrmpyub.acc.128B(<32 x i32> %convolved394.sroa.0.55.us.us.us.us.epil, <32 x i32> %3412, i32 %3418) #11
  %3420 = add nuw nsw i32 %"convolved.s1.r19$z.r124322.us.us.us.us.epil", 1
  %epil.iter1624.sub = add i32 %epil.iter1624, -1
  %epil.iter1624.cmp.not = icmp eq i32 %epil.iter1624.sub, 0
  br i1 %epil.iter1624.cmp.not, label %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us", label %"for convolved.s1.r19$z.r124320.us.us.us.us.epil", !llvm.loop !125

"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us": ; preds = %"for convolved.s1.r19$z.r124320.us.us.us.us.epil", %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa"
  %.lcssa1590 = phi <32 x i32> [ %.lcssa1590.ph, %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us.unr-lcssa" ], [ %3419, %"for convolved.s1.r19$z.r124320.us.us.us.us.epil" ]
  %3421 = add nuw nsw i32 %"convolved.s1.r19$x319.us.us.us.us", 1
  %.not404.us.us.us.us = icmp eq i32 %3421, %9
  br i1 %.not404.us.us.us.us, label %"end for convolved.s1.r19$x318.loopexit.split.us.us.us.us", label %"for convolved.s1.r19$x317.us.us.us.us"

"end for convolved.s1.r19$x318.loopexit.split.us.us.us.us": ; preds = %"end for convolved.s1.r19$z.r124321.loopexit.us.us.us.us"
  %3422 = add nuw nsw i32 %"convolved.s1.r19$y316.us.us.us", 1
  %.not403.us.us.us = icmp eq i32 %3422, %11
  br i1 %.not403.us.us.us, label %"consume convolved323.us", label %"for convolved.s1.r19$y314.us.us.us"

"end for output.s0.y.rebased249":                 ; preds = %"end for output.s0.x.xo252.loopexit.us", %"for output.s0.y.rebased248.preheader", %"for output.s0.b.rebased245"
  %sum_input254393.sroa.0.23 = phi <32 x i32> [ %sum_input254393.sroa.0.21, %"for output.s0.b.rebased245" ], [ %sum_input254393.sroa.0.21, %"for output.s0.y.rebased248.preheader" ], [ %sum_input254393.sroa.0.34.us, %"end for output.s0.x.xo252.loopexit.us" ]
  %convolved394.sroa.0.37 = phi <32 x i32> [ %convolved394.sroa.0.35, %"for output.s0.b.rebased245" ], [ %convolved394.sroa.0.35, %"for output.s0.y.rebased248.preheader" ], [ %convolved394.sroa.0.50.us, %"end for output.s0.x.xo252.loopexit.us" ]
  %3423 = add nuw nsw i32 %output.s0.b.rebased247, 1
  %.not397 = icmp eq i32 %3423, %21
  br i1 %.not397, label %after_bb3, label %"for output.s0.b.rebased245"
}

; Function Attrs: nounwind
define i32 @conv_nn_hvx128_argv(i8** nocapture readonly %0) local_unnamed_addr #11 {
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
  %13 = bitcast i8** %12 to %struct.halide_buffer_t**
  %14 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %13, align 4
  %15 = getelementptr i8*, i8** %0, i32 5
  %16 = bitcast i8** %15 to i32**
  %17 = load i32*, i32** %16, align 4
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr i8*, i8** %0, i32 6
  %20 = bitcast i8** %19 to i32**
  %21 = load i32*, i32** %20, align 4
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr i8*, i8** %0, i32 7
  %24 = bitcast i8** %23 to i32**
  %25 = load i32*, i32** %24, align 4
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr i8*, i8** %0, i32 8
  %28 = bitcast i8** %27 to i32**
  %29 = load i32*, i32** %28, align 4
  %30 = load i32, i32* %29, align 4
  %31 = getelementptr i8*, i8** %0, i32 9
  %32 = bitcast i8** %31 to i32**
  %33 = load i32*, i32** %32, align 4
  %34 = load i32, i32* %33, align 4
  %35 = getelementptr i8*, i8** %0, i32 10
  %36 = bitcast i8** %35 to i32**
  %37 = load i32*, i32** %36, align 4
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr i8*, i8** %0, i32 11
  %40 = load i8*, i8** %39, align 4
  %41 = load i8, i8* %40, align 1
  %42 = getelementptr i8*, i8** %0, i32 12
  %43 = load i8*, i8** %42, align 4
  %44 = load i8, i8* %43, align 1
  %45 = getelementptr i8*, i8** %0, i32 13
  %46 = load i8*, i8** %45, align 4
  %47 = load i8, i8* %46, align 1
  %48 = getelementptr i8*, i8** %0, i32 14
  %49 = bitcast i8** %48 to %struct.halide_buffer_t**
  %50 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %49, align 4
  %51 = tail call i32 @conv_nn_hvx128(%struct.halide_buffer_t* %2, i8 %5, %struct.halide_buffer_t* %8, i8 %11, %struct.halide_buffer_t* %14, i32 %18, i32 %22, i32 %26, i32 %30, i32 %34, i32 %38, i8 %41, i8 %44, i8 %47, %struct.halide_buffer_t* %50) #16
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @conv_nn_hvx128_metadata() local_unnamed_addr #12 {
entry:
  ret %struct.halide_filter_metadata_t* @conv_nn_hvx128_metadata_storage
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.store.v32i8.p0v32i8(<32 x i8>, <32 x i8>*, i32 immarg, <32 x i1>) #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1 immarg) #3

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
!95 = !{!"branch_weights", i32 0, i32 1073741824}
!96 = !{!"branch_weights", i32 1073741824, i32 0}
!97 = !{!98, !98, i64 0}
!98 = !{!"bias", !99, i64 0}
!99 = !{!"Halide buffer"}
!100 = !{!101, !101, i64 0}
!101 = !{!"bias_im_global_wrapper$0", !99, i64 0}
!102 = distinct !{!102, !32}
!103 = !{!"branch_weights", i32 -2147483648, i32 0}
!104 = !{!105, !105, i64 0}
!105 = !{!"offset_c", !99, i64 0}
!106 = !{!107, !107, i64 0}
!107 = !{!"filter", !99, i64 0}
!108 = distinct !{!108, !32}
!109 = distinct !{!109, !32}
!110 = !{!111, !111, i64 0}
!111 = !{!"input", !99, i64 0}
!112 = distinct !{!112, !32}
!113 = !{!114, !114, i64 0}
!114 = !{!"output", !99, i64 0}
!115 = distinct !{!115, !32}
!116 = distinct !{!116, !32}
!117 = distinct !{!117, !32}
!118 = distinct !{!118, !32}
!119 = distinct !{!119, !32}
!120 = distinct !{!120, !32}
!121 = distinct !{!121, !32}
!122 = !{!"branch_weights", i32 -2147483648, i32 -2147483648}
!123 = distinct !{!123, !32}
!124 = distinct !{!124, !32}
!125 = distinct !{!125, !32}
