; ModuleID = 'gaussian5x5'
source_filename = "/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/fake_thread_pool.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--"

%struct.halide_parallel_task_t = type { i32 (i8*, i32, i32, i8*, i8*)*, i8*, i8*, %struct.halide_semaphore_acquire_t*, i32, i32, i32, i32, i8, [7 x i8] }
%struct.halide_semaphore_acquire_t = type { %struct.halide_semaphore_t*, i32, [4 x i8] }
%struct.halide_semaphore_t = type { [2 x i64] }
%struct.halide_mutex_array = type { %struct.halide_mutex* }
%struct.halide_mutex = type { [1 x i64] }
%"class.Halide::Runtime::Internal::TraceBuffer" = type { %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock", i32, i32, [1048576 x i8] }
%"class.Halide::Runtime::Internal::SharedExclusiveSpinLock" = type { i32 }
%struct.halide_trace_event_t = type <{ i8*, i8*, i32*, i8*, %struct.halide_type_t, i32, i32, i32, i32, [4 x i8] }>
%struct.halide_type_t = type { i8, i8, i16 }
%"struct.Halide::Runtime::Internal::CacheEntry" = type { %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"*, i8*, i64, i8*, i32, i32, i32, i32, %struct.halide_dimension_t*, %struct.halide_buffer_t*, i64, i8, [7 x i8] }
%struct.halide_dimension_t = type { i32, i32, i32, i32 }
%struct.halide_buffer_t = type { i64, %struct.halide_device_interface_t*, i8*, i64, %struct.halide_type_t, i32, %struct.halide_dimension_t*, i8* }
%struct.halide_device_interface_t = type { i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, void (i8*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, i32*, i32*)*, %struct.halide_device_interface_impl_t* }
%struct.halide_device_interface_impl_t = type { void ()*, void ()*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*)* }
%struct.halide_device_allocation_pool = type { i32 (i8*)*, %struct.halide_device_allocation_pool* }
%struct.halide_filter_argument_t = type { i8*, i32, i32, %struct.halide_type_t, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, i64** }
%struct.halide_scalar_value_t = type { %union.anon.28 }
%union.anon.28 = type { double }
%struct.halide_filter_metadata_t = type { i32, i32, %struct.halide_filter_argument_t*, i8*, i8* }
%struct.halide_thread = type opaque
%"struct.Halide::Runtime::Internal::halide_tiff_header" = type <{ i16, i16, i32, i16, [15 x %"struct.Halide::Runtime::Internal::tiff_tag"], i32, [2 x i32], [2 x i32] }>
%"struct.Halide::Runtime::Internal::tiff_tag" = type { i16, i16, i32, %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock" }
%"struct.Halide::Runtime::Internal::CacheBlockHeader" = type { %"struct.Halide::Runtime::Internal::CacheEntry"*, i32, [4 x i8] }
%"struct.Halide::Runtime::Internal::device_copy" = type { i64, i64, i64, [16 x i64], [16 x i64], [16 x i64], i64 }
%"struct.Halide::Runtime::Internal::CpuFeatures" = type { [2 x i64], [2 x i64] }

@.str = private unnamed_addr constant [67 x i8] c"halide_default_do_parallel_tasks not implemented on this platform.\00", align 1
@.str.1 = private unnamed_addr constant [64 x i8] c"halide_default_semaphore_init not implemented on this platform.\00", align 1
@.str.2 = private unnamed_addr constant [67 x i8] c"halide_default_semaphore_release not implemented on this platform.\00", align 1
@.str.3 = private unnamed_addr constant [71 x i8] c"halide_default_semaphore_try_acquire not implemented on this platform.\00", align 1
@_ZN6Halide7Runtime8Internal14custom_do_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_default_do_task, align 8
@_ZN6Halide7Runtime8Internal19custom_do_loop_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* @halide_default_do_loop_task, align 8
@_ZN6Halide7Runtime8Internal17custom_do_par_forE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_default_do_par_for, align 8
@_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE = linkonce local_unnamed_addr global i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* @halide_default_do_parallel_tasks, align 8
@_ZN6Halide7Runtime8Internal21custom_semaphore_initE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_init, align 8
@_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE = linkonce local_unnamed_addr global i1 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_try_acquire, align 8
@_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_release, align 8
@_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE = linkonce global %struct.halide_mutex_array zeroinitializer, align 8
@.str.4 = private unnamed_addr constant [54 x i8] c"halide_spawn_thread not implemented on this platform.\00", align 1
@.str.5 = private unnamed_addr constant [53 x i8] c"halide_join_thread not implemented on this platform.\00", align 1
@.str.6 = private unnamed_addr constant [69 x i8] c"halide_set_num_threads: only supports a value of 1 on this platform.\00", align 1
@_ZN6Halide7Runtime8Internal17halide_gpu_deviceE = linkonce local_unnamed_addr global i32 0, align 4
@_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE = linkonce global i8 0, align 1
@_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"HL_GPU_DEVICE\00", align 1
@_ZN6Halide7Runtime8Internal19halide_trace_bufferE = linkonce local_unnamed_addr global %"class.Halide::Runtime::Internal::TraceBuffer"* null, align 8
@_ZN6Halide7Runtime8Internal17halide_trace_fileE = linkonce local_unnamed_addr global i32 -1, align 4
@_ZN6Halide7Runtime8Internal22halide_trace_file_lockE = linkonce global i8 0, align 1
@_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE = linkonce local_unnamed_addr global i8* null, align 8
@_ZN6Halide7Runtime8Internal19halide_custom_traceE = linkonce local_unnamed_addr global i32 (i8*, %struct.halide_trace_event_t*)* @halide_default_trace, align 8
@_ZZ20halide_default_traceE3ids = internal global i32 1, align 4
@.str.32 = private unnamed_addr constant [172 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/tracing.cpp:115 halide_abort_if_false() failed: success && \22Could not write to trace file\22\0A\00", align 1
@.str.31 = private unnamed_addr constant [148 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/tracing.cpp:87 halide_abort_if_false() failed: size <= buffer_size\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1.9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2.10 = private unnamed_addr constant [168 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/tracing.cpp:218 halide_abort_if_false() failed: print_bits <= 64 && \22Tracing bad type\22\0A\00", align 1
@__const.halide_default_trace.event_types = private unnamed_addr constant [11 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.11, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.12, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5.13, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6.14, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7.15, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8.16, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0)], align 8
@.str.14 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c">)\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c">, <\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c" = <\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c" = \00", align 1
@.str.24 = private unnamed_addr constant [170 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/tracing.cpp:287 halide_abort_if_false() failed: print_bits >= 16 && \22Tracing a bad type\22\0A\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c">\00", align 1
@.str.26 = private unnamed_addr constant [9 x i8] c" tag = \22\00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@.str.3.11 = private unnamed_addr constant [5 x i8] c"Load\00", align 1
@.str.4.12 = private unnamed_addr constant [6 x i8] c"Store\00", align 1
@.str.5.13 = private unnamed_addr constant [18 x i8] c"Begin realization\00", align 1
@.str.6.14 = private unnamed_addr constant [16 x i8] c"End realization\00", align 1
@.str.7.15 = private unnamed_addr constant [8 x i8] c"Produce\00", align 1
@.str.8.16 = private unnamed_addr constant [12 x i8] c"End produce\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"Consume\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"End consume\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"Begin pipeline\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"End pipeline\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"Tag\00", align 1
@.str.28 = private unnamed_addr constant [14 x i8] c"HL_TRACE_FILE\00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str.30 = private unnamed_addr constant [167 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/tracing.cpp:351 halide_abort_if_false() failed: file && \22Failed to open trace file\\n\22\0A\00", align 1
@llvm.global_dtors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @halide_trace_cleanup, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @halide_cache_cleanup, i8* null }]
@_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE = linkonce local_unnamed_addr global [10 x i16] [i16 3, i16 3, i16 1, i16 2, i16 1, i16 2, i16 1, i16 2, i16 1, i16 2], align 2
@_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE = linkonce local_unnamed_addr global [10 x i8] c"\07\06\09\08\0B\0A\0D\0C\0F\0E", align 1
@_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE = linkonce local_unnamed_addr global [10 x i8] c"\07\09\02\01\04\03\06\05\0D\0C", align 1
@.str.34 = private unnamed_addr constant [51 x i8] c"Bounds query buffer passed to halide_debug_to_file\00", align 1
@.str.1.35 = private unnamed_addr constant [59 x i8] c"Can't debug_to_file a Func with more than four dimensions\0A\00", align 1
@.str.2.36 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.3.37 = private unnamed_addr constant [6 x i8] c".tiff\00", align 1
@.str.4.38 = private unnamed_addr constant [5 x i8] c".tif\00", align 1
@.str.5.39 = private unnamed_addr constant [5 x i8] c".mat\00", align 1
@__const.halide_debug_to_file.header = private unnamed_addr constant [129 x i8] c"MATLAB 5.0 MAT-file, produced by Halide                                                                                     \00\01IM\00", align 1
@.str.6.40 = private unnamed_addr constant [53 x i8] c"Can't debug_to_file to a .mat file greater than 4GB\0A\00", align 1
@_ZN6Halide7Runtime8Internal16memoization_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal13cache_entriesE = linkonce global [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*] zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal18most_recently_usedE = linkonce local_unnamed_addr global %"struct.Halide::Runtime::Internal::CacheEntry"* null, align 8
@_ZN6Halide7Runtime8Internal19least_recently_usedE = linkonce local_unnamed_addr global %"struct.Halide::Runtime::Internal::CacheEntry"* null, align 8
@_ZN6Halide7Runtime8Internal14max_cache_sizeE = linkonce local_unnamed_addr global i64 1048576, align 8
@_ZN6Halide7Runtime8Internal18current_cache_sizeE = linkonce local_unnamed_addr global i64 0, align 8
@.str.2.42 = private unnamed_addr constant [154 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/cache.cpp:284 halide_abort_if_false() failed: prev_hash_entry != nullptr\0A\00", align 1
@.str.3.43 = private unnamed_addr constant [157 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/cache.cpp:373 halide_abort_if_false() failed: entry->more_recent != nullptr\0A\00", align 1
@.str.4.44 = private unnamed_addr constant [156 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/cache.cpp:377 halide_abort_if_false() failed: least_recently_used == entry\0A\00", align 1
@.str.5.45 = private unnamed_addr constant [157 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/cache.cpp:380 halide_abort_if_false() failed: entry->more_recent != nullptr\0A\00", align 1
@.str.9.46 = private unnamed_addr constant [150 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/cache.cpp:472 halide_abort_if_false() failed: no_host_pointers_equal\0A\00", align 1
@.str.12.47 = private unnamed_addr constant [151 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/cache.cpp:550 halide_abort_if_false() failed: entry->in_use_count > 0\0A\00", align 1
@.str.50 = private unnamed_addr constant [10 x i8] c"<nullptr>\00", align 1
@.str.1.57 = private unnamed_addr constant [5 x i8] c"-nan\00", align 1
@.str.2.58 = private unnamed_addr constant [4 x i8] c"nan\00", align 1
@.str.3.59 = private unnamed_addr constant [5 x i8] c"-inf\00", align 1
@.str.4.60 = private unnamed_addr constant [4 x i8] c"inf\00", align 1
@.str.5.61 = private unnamed_addr constant [14 x i8] c"-0.000000e+00\00", align 1
@.str.6.62 = private unnamed_addr constant [13 x i8] c"0.000000e+00\00", align 1
@.str.7.63 = private unnamed_addr constant [10 x i8] c"-0.000000\00", align 1
@.str.8.64 = private unnamed_addr constant [9 x i8] c"0.000000\00", align 1
@.str.9.65 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.11.67 = private unnamed_addr constant [3 x i8] c"e+\00", align 1
@.str.12.68 = private unnamed_addr constant [3 x i8] c"e-\00", align 1
@.str.13.71 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str.18.72 = private unnamed_addr constant [14 x i8] c"bad_type_code\00", align 1
@.str.17.73 = private unnamed_addr constant [7 x i8] c"handle\00", align 1
@.str.16.74 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.15.75 = private unnamed_addr constant [5 x i8] c"uint\00", align 1
@.str.14.76 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.19.77 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.20.78 = private unnamed_addr constant [8 x i8] c"nullptr\00", align 1
@.str.21.79 = private unnamed_addr constant [8 x i8] c"buffer(\00", align 1
@.str.23.82 = private unnamed_addr constant [4 x i8] c", {\00", align 1
@.str.24.83 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE = linkonce local_unnamed_addr global i8 1, align 1
@_ZN6Halide7Runtime8Internal21allocation_pools_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal23device_allocation_poolsE = linkonce local_unnamed_addr global %struct.halide_device_allocation_pool* null, align 8
@_ZN6Halide7Runtime8Internal17device_copy_mutexE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@.str.6.88 = private unnamed_addr constant [20 x i8] c"halide_copy_to_host\00", align 1
@.str.7.89 = private unnamed_addr constant [22 x i8] c"halide_copy_to_device\00", align 1
@.str.9.90 = private unnamed_addr constant [61 x i8] c"halide_copy_to_device does not support switching interfaces\0A\00", align 1
@.str.17.91 = private unnamed_addr constant [21 x i8] c"halide_device_malloc\00", align 1
@.str.20.92 = private unnamed_addr constant [59 x i8] c"halide_device_malloc doesn't support switching interfaces\0A\00", align 1
@.str.16.93 = private unnamed_addr constant [19 x i8] c"halide_device_sync\00", align 1
@.str.21.96 = private unnamed_addr constant [19 x i8] c"halide_device_free\00", align 1
@.str.22.97 = private unnamed_addr constant [155 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/device_interface.cpp:252 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.23.98 = private unnamed_addr constant [30 x i8] c"halide_device_and_host_malloc\00", align 1
@.str.25.99 = private unnamed_addr constant [68 x i8] c"halide_device_and_host_malloc doesn't support switching interfaces\0A\00", align 1
@.str.26.100 = private unnamed_addr constant [42 x i8] c"allocating host and device memory failed\0A\00", align 1
@.str.27.101 = private unnamed_addr constant [28 x i8] c"halide_device_and_host_free\00", align 1
@.str.28.102 = private unnamed_addr constant [155 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/device_interface.cpp:317 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.29.103 = private unnamed_addr constant [38 x i8] c"halide_default_device_and_host_malloc\00", align 1
@.str.30.104 = private unnamed_addr constant [36 x i8] c"halide_default_device_and_host_free\00", align 1
@.str.31.105 = private unnamed_addr constant [26 x i8] c"halide_device_wrap_native\00", align 1
@.str.32.106 = private unnamed_addr constant [64 x i8] c"halide_device_wrap_native doesn't support switching interfaces\0A\00", align 1
@.str.33.107 = private unnamed_addr constant [28 x i8] c"halide_device_detach_native\00", align 1
@.str.34.108 = private unnamed_addr constant [155 x i8] c"/home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/src/runtime/device_interface.cpp:403 halide_abort_if_false() failed: buf->device == 0\0A\00", align 1
@.str.35 = private unnamed_addr constant [36 x i8] c"halide_default_device_detach_native\00", align 1
@.str.41 = private unnamed_addr constant [64 x i8] c"halide_buffer_copy does not support switching device interfaces\00", align 1
@.str.58 = private unnamed_addr constant [44 x i8] c"device_interface does not support cropping\0A\00", align 1
@.str.59 = private unnamed_addr constant [43 x i8] c"device_interface does not support slicing\0A\00", align 1
@.str.60 = private unnamed_addr constant [52 x i8] c"destination buffer already has a device allocation\0A\00", align 1
@.str.61 = private unnamed_addr constant [48 x i8] c"src and dst must have identical dimensionality\0A\00", align 1
@.str.64 = private unnamed_addr constant [52 x i8] c"dst must have exactly one fewer dimension than src\0A\00", align 1
@.str.111 = private unnamed_addr constant [41 x i8] c"Bounds inference call to external stage \00", align 1
@.str.1.112 = private unnamed_addr constant [27 x i8] c" returned non-zero value: \00", align 1
@.str.76 = private unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@.str.2.113 = private unnamed_addr constant [24 x i8] c"Call to external stage \00", align 1
@.str.3.114 = private unnamed_addr constant [18 x i8] c"Bounds given for \00", align 1
@.str.4.115 = private unnamed_addr constant [5 x i8] c" in \00", align 1
@.str.5.116 = private unnamed_addr constant [8 x i8] c" (from \00", align 1
@.str.6.117 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@.str.7.118 = private unnamed_addr constant [38 x i8] c") do not cover required region (from \00", align 1
@.str.8.119 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.9.120 = private unnamed_addr constant [11 x i8] c" has type \00", align 1
@.str.10.121 = private unnamed_addr constant [38 x i8] c" but type of the buffer passed in is \00", align 1
@.str.11.122 = private unnamed_addr constant [31 x i8] c" requires a buffer of exactly \00", align 1
@.str.12.123 = private unnamed_addr constant [43 x i8] c" dimensions, but the buffer passed in has \00", align 1
@.str.13.124 = private unnamed_addr constant [12 x i8] c" dimensions\00", align 1
@.str.14.125 = private unnamed_addr constant [17 x i8] c" is accessed at \00", align 1
@.str.15.126 = private unnamed_addr constant [28 x i8] c", which is before the min (\00", align 1
@.str.16.127 = private unnamed_addr constant [16 x i8] c") in dimension \00", align 1
@.str.17.128 = private unnamed_addr constant [28 x i8] c", which is beyond the max (\00", align 1
@.str.18.129 = private unnamed_addr constant [29 x i8] c"Total allocation for buffer \00", align 1
@.str.19.130 = private unnamed_addr constant [5 x i8] c" is \00", align 1
@.str.20.131 = private unnamed_addr constant [37 x i8] c", which exceeds the maximum size of \00", align 1
@.str.21.132 = private unnamed_addr constant [24 x i8] c"The extents for buffer \00", align 1
@.str.22.133 = private unnamed_addr constant [12 x i8] c" dimension \00", align 1
@.str.23.134 = private unnamed_addr constant [15 x i8] c" is negative (\00", align 1
@.str.24.135 = private unnamed_addr constant [31 x i8] c"Product of extents for buffer \00", align 1
@.str.25.136 = private unnamed_addr constant [29 x i8] c"Applying the constraints on \00", align 1
@.str.26.137 = private unnamed_addr constant [54 x i8] c" to the required region made it smaller in dimension \00", align 1
@.str.27.138 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.28.139 = private unnamed_addr constant [16 x i8] c"Required size: \00", align 1
@.str.29.140 = private unnamed_addr constant [19 x i8] c"Constrained size: \00", align 1
@.str.30.141 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.31.142 = private unnamed_addr constant [22 x i8] c"Constraint violated: \00", align 1
@.str.32.143 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.33.144 = private unnamed_addr constant [6 x i8] c") == \00", align 1
@.str.34.145 = private unnamed_addr constant [11 x i8] c"Parameter \00", align 1
@.str.35.146 = private unnamed_addr constant [23 x i8] c" but must be at least \00", align 1
@.str.36 = private unnamed_addr constant [22 x i8] c" but must be at most \00", align 1
@.str.37 = private unnamed_addr constant [47 x i8] c"Out of memory (halide_malloc returned nullptr)\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"Buffer argument \00", align 1
@.str.39 = private unnamed_addr constant [12 x i8] c" is nullptr\00", align 1
@.str.40 = private unnamed_addr constant [25 x i8] c"Failed to dump function \00", align 1
@.str.41.147 = private unnamed_addr constant [10 x i8] c" to file \00", align 1
@.str.42 = private unnamed_addr constant [13 x i8] c" with error \00", align 1
@.str.43 = private unnamed_addr constant [21 x i8] c"The host pointer of \00", align 1
@.str.44 = private unnamed_addr constant [22 x i8] c" is not aligned to a \00", align 1
@.str.45 = private unnamed_addr constant [17 x i8] c" bytes boundary.\00", align 1
@.str.46 = private unnamed_addr constant [12 x i8] c"The buffer \00", align 1
@.str.47 = private unnamed_addr constant [53 x i8] c" is dirty on device, but this pipeline was compiled \00", align 1
@.str.48 = private unnamed_addr constant [43 x i8] c"with no support for device to host copies.\00", align 1
@.str.49 = private unnamed_addr constant [55 x i8] c" is null, but the pipeline will access it on the host.\00", align 1
@.str.50.148 = private unnamed_addr constant [30 x i8] c"The folded storage dimension \00", align 1
@.str.51 = private unnamed_addr constant [5 x i8] c" of \00", align 1
@.str.52 = private unnamed_addr constant [36 x i8] c" was accessed out of order by loop \00", align 1
@.str.53 = private unnamed_addr constant [23 x i8] c"Cannot fold dimension \00", align 1
@.str.54 = private unnamed_addr constant [36 x i8] c" because an extern stage accesses [\00", align 1
@.str.55 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.56 = private unnamed_addr constant [3 x i8] c"],\00", align 1
@.str.57 = private unnamed_addr constant [47 x i8] c" which is outside the range currently valid: [\00", align 1
@.str.58.149 = private unnamed_addr constant [3 x i8] c"].\00", align 1
@.str.59.150 = private unnamed_addr constant [47 x i8] c" which wraps around the boundary of the fold, \00", align 1
@.str.60.151 = private unnamed_addr constant [30 x i8] c"which occurs at multiples of \00", align 1
@.str.61.152 = private unnamed_addr constant [18 x i8] c"The fold factor (\00", align 1
@.str.62 = private unnamed_addr constant [16 x i8] c") of dimension \00", align 1
@.str.63 = private unnamed_addr constant [61 x i8] c" is too small to store the required region accessed by loop \00", align 1
@.str.64.153 = private unnamed_addr constant [3 x i8] c").\00", align 1
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
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 8
@_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE = linkonce global [4 x i64] zeroinitializer, align 8
@.str.166 = private unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@0 = private constant [4 x i64*] zeroinitializer
@str = private constant [6 x i8] c"input\00", align 32
@1 = private constant [4 x i64*] zeroinitializer
@str.170 = private constant [7 x i8] c"output\00", align 32
@2 = private constant [2 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @0, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.170, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @1, i32 0, i32 0) }]
@str.171 = private constant [85 x i8] c"x86-64-noos-avx-avx2-avx512-avx512_skylake-f16c-fma-no_asserts-no_bounds_query-sse41\00", align 64
@str.172 = private constant [12 x i8] c"gaussian5x5\00", align 32
@gaussian5x5_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 2, %struct.halide_filter_argument_t* getelementptr inbounds ([2 x %struct.halide_filter_argument_t], [2 x %struct.halide_filter_argument_t]* @2, i32 0, i32 0), i8* getelementptr inbounds ([85 x i8], [85 x i8]* @str.171, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.172, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14.76, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15.75, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16.74, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17.73, i64 0, i64 0)], align 8

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %idx, i8* %closure) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #0 {
entry:
  %call = tail call i32 %f(i8* %user_context, i32 %min, i32 %extent, i8* %closure, i8* %task_parent) #16
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
  br i1 %cmp, label %for.body, label %cleanup1, !llvm.loop !10

for.body:                                         ; preds = %entry, %for.cond
  %x.012 = phi i32 [ %inc, %for.cond ], [ %min, %entry ]
  %call = tail call i32 @halide_do_task(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %x.012, i8* %closure) #17
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
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !12
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %idx, i8* %closure) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str, i64 0, i64 0)) #16
  ret i32 -1
}

declare void @halide_error(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1, i64 0, i64 0)) #16
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.2, i64 0, i64 0)) #16
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %s, i32 %n) #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i64 0, i64 0)) #16
  ret i1 false
}

; Function Attrs: nounwind mustprogress
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %f, i8* %closure) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i64 0, i64 0)) #16
  ret %struct.halide_thread* null
}

; Function Attrs: nounwind mustprogress
define weak void @halide_join_thread(%struct.halide_thread* %thread_arg) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.5, i64 0, i64 0)) #16
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
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.6, i64 0, i64 0)) #16
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 1
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_set_custom_do_task(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f) local_unnamed_addr #2 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !12
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !12
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_set_custom_do_par_for(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f) local_unnamed_addr #2 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !12
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %f, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !12
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_par_for(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !12
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i8*)* %f, i32 %min, i32 %size, i8* %closure) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_loop_task(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !12
  %call = tail call i32 %0(i8* %user_context, i32 (i8*, i32, i32, i8*, i8*)* %f, i32 %min, i32 %size, i8* %closure, i8* %task_parent) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_parallel_tasks(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !12
  %call = tail call i32 %0(i8* %user_context, i32 %num_tasks, %struct.halide_parallel_task_t* %tasks, i8* %task_parent) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !12
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !12
  %call = tail call i32 %0(%struct.halide_semaphore_t* %sema, i32 %count) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t* %sema, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !12
  %call = tail call zeroext i1 %0(%struct.halide_semaphore_t* %sema, i32 %count) #16
  ret i1 %call
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare void @halide_free(i8*, i8*) local_unnamed_addr #1

declare i8* @halide_malloc(i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_gpu_device(i32 %d) local_unnamed_addr #2 {
entry:
  store i32 %d, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !16
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
  %.pre = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !16
  br label %if.end4

if.then:                                          ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0)) #16
  %tobool1.not = icmp eq i8* %call, null
  br i1 %tobool1.not, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call3 = tail call i32 @atoi(i8* nonnull %call) #16
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %storemerge = phi i32 [ %call3, %if.then2 ], [ -1, %if.then ]
  store i32 %storemerge, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !16
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
define weak i32 @halide_default_trace(i8* %user_context, %struct.halide_trace_event_t* %e) #4 {
entry:
  %0 = atomicrmw add i32* @_ZZ20halide_default_traceE3ids, i32 1 seq_cst
  %call = tail call i32 @halide_get_trace_file(i8* %user_context) #17
  %cmp = icmp sgt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %type = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 4
  %lanes = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 4, i32 2
  %1 = load i16, i16* %lanes, align 2, !tbaa !22
  %conv = zext i16 %1 to i32
  %bits.i = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 4, i32 1
  %2 = load i8, i8* %bits.i, align 1, !tbaa !28
  %conv.i = zext i8 %2 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %mul = mul nuw nsw i32 %div.i, %conv
  %dimensions = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 8
  %3 = load i32, i32* %dimensions, align 8, !tbaa !29
  %mul3 = shl i32 %3, 2
  %func = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 0
  %4 = load i8*, i8** %func, align 8, !tbaa !30
  %call4 = tail call i64 @strlen(i8* %4) #16
  %5 = trunc i64 %call4 to i32
  %conv5 = add i32 %5, 1
  %trace_tag = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 3
  %6 = load i8*, i8** %trace_tag, align 8, !tbaa !31
  %tobool.not = icmp eq i8* %6, null
  br i1 %tobool.not, label %cond.end, label %cond.true

cond.true:                                        ; preds = %if.then
  %call7 = tail call i64 @strlen(i8* nonnull %6) #16
  %7 = trunc i64 %call7 to i32
  %phi.cast = add i32 %7, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.true, %if.then
  %cond = phi i32 [ %phi.cast, %cond.true ], [ 1, %if.then ]
  %add11 = add i32 %mul3, 31
  %add12 = add i32 %add11, %mul
  %add13 = add i32 %add12, %conv5
  %add14 = add i32 %add13, %cond
  %and = and i32 %add14, -4
  %8 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %lock.i.i.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %8, i64 0, i32 0, i32 0
  %cmp.i.i = icmp ult i32 %and, 1048577
  %cursor.i.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %8, i64 0, i32 1
  %overage.i.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %8, i64 0, i32 2
  %arraydecay.i.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %8, i64 0, i32 3, i64 0
  br i1 %cmp.i.i, label %while.body.i.i.us.i, label %while.body.i.i.i

while.body.i.i.us.i:                              ; preds = %cond.end, %while.body.i.i.us.i.backedge
  %9 = load volatile i32, i32* %lock.i.i.i, align 4, !tbaa !32
  %and.i.i.us.i = and i32 %9, 1073741823
  %add.i.i.us.i = add nuw nsw i32 %and.i.i.us.i, 1
  %10 = cmpxchg i32* %lock.i.i.i, i32 %and.i.i.us.i, i32 %add.i.i.us.i seq_cst seq_cst
  %11 = extractvalue { i32, i1 } %10, 1
  br i1 %11, label %do.end.i.us.i, label %while.body.i.i.us.i.backedge

do.end.i.us.i:                                    ; preds = %while.body.i.i.us.i
  %12 = atomicrmw add i32* %cursor.i.i, i32 %and seq_cst
  %add.i.us.i = add i32 %12, %and
  %cmp2.i.us.i = icmp ugt i32 %add.i.us.i, 1048576
  br i1 %cmp2.i.us.i, label %while.body.us.i, label %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit

while.body.us.i:                                  ; preds = %do.end.i.us.i
  %13 = atomicrmw add i32* %overage.i.i, i32 %and seq_cst
  %14 = atomicrmw sub i32* %lock.i.i.i, i32 1 seq_cst
  br label %while.body.i.i5.us.i

while.body.i.i5.us.i:                             ; preds = %while.body.i.i5.us.i, %while.body.us.i
  %15 = atomicrmw or i32* %lock.i.i.i, i32 1073741824 seq_cst
  %16 = cmpxchg i32* %lock.i.i.i, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %17 = extractvalue { i32, i1 } %16, 1
  br i1 %17, label %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i, label %while.body.i.i5.us.i

_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i: ; preds = %while.body.i.i5.us.i
  %18 = load i32, i32* %cursor.i.i, align 4, !tbaa !34
  %tobool.not.i.us.i = icmp eq i32 %18, 0
  br i1 %tobool.not.i.us.i, label %do.end.critedge.i.us.i, label %if.then.i9.us.i

if.then.i9.us.i:                                  ; preds = %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i
  %19 = load i32, i32* %overage.i.i, align 4, !tbaa !36
  %sub.i.us.i = sub i32 %18, %19
  store i32 %sub.i.us.i, i32* %cursor.i.i, align 4, !tbaa !34
  %conv.i.us.i = zext i32 %sub.i.us.i to i64
  %call.i.us.i = tail call i64 @write(i32 %call, i8* nonnull %arraydecay.i.i, i64 %conv.i.us.i) #16
  %conv5.i.us.i = trunc i64 %call.i.us.i to i32
  %cmp.i8.us.i = icmp eq i32 %sub.i.us.i, %conv5.i.us.i
  store i32 0, i32* %cursor.i.i, align 4, !tbaa !34
  store i32 0, i32* %overage.i.i, align 4, !tbaa !36
  %20 = atomicrmw and i32* %lock.i.i.i, i32 2147483647 seq_cst
  br i1 %cmp.i8.us.i, label %while.body.i.i.us.i.backedge, label %if.then10.i.us.i

if.then10.i.us.i:                                 ; preds = %if.then.i9.us.i
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([172 x i8], [172 x i8]* @.str.32, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %while.body.i.i.us.i.backedge

do.end.critedge.i.us.i:                           ; preds = %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i
  %21 = atomicrmw and i32* %lock.i.i.i, i32 2147483647 seq_cst
  br label %while.body.i.i.us.i.backedge

while.body.i.i.us.i.backedge:                     ; preds = %do.end.critedge.i.us.i, %if.then10.i.us.i, %if.then.i9.us.i, %while.body.i.i.us.i
  br label %while.body.i.i.us.i, !llvm.loop !37

while.body.i.i.i:                                 ; preds = %cond.end, %while.body.i.i.i.backedge
  %22 = load volatile i32, i32* %lock.i.i.i, align 4, !tbaa !32
  %and.i.i.i = and i32 %22, 1073741823
  %add.i.i.i = add nuw nsw i32 %and.i.i.i, 1
  %23 = cmpxchg i32* %lock.i.i.i, i32 %and.i.i.i, i32 %add.i.i.i seq_cst seq_cst
  %24 = extractvalue { i32, i1 } %23, 1
  br i1 %24, label %if.then.i.i, label %while.body.i.i.i.backedge

if.then.i.i:                                      ; preds = %while.body.i.i.i
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([148 x i8], [148 x i8]* @.str.31, i64 0, i64 0)) #16
  tail call void @abort() #16
  %25 = atomicrmw add i32* %cursor.i.i, i32 %and seq_cst
  %add.i.i400 = add i32 %25, %and
  %cmp2.i.i = icmp ugt i32 %add.i.i400, 1048576
  br i1 %cmp2.i.i, label %while.body.i, label %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit

while.body.i:                                     ; preds = %if.then.i.i
  %26 = atomicrmw add i32* %overage.i.i, i32 %and seq_cst
  %27 = atomicrmw sub i32* %lock.i.i.i, i32 1 seq_cst
  br label %while.body.i.i5.i

while.body.i.i5.i:                                ; preds = %while.body.i.i5.i, %while.body.i
  %28 = atomicrmw or i32* %lock.i.i.i, i32 1073741824 seq_cst
  %29 = cmpxchg i32* %lock.i.i.i, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %30 = extractvalue { i32, i1 } %29, 1
  br i1 %30, label %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i, label %while.body.i.i5.i

_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i: ; preds = %while.body.i.i5.i
  %31 = load i32, i32* %cursor.i.i, align 4, !tbaa !34
  %tobool.not.i.i = icmp eq i32 %31, 0
  br i1 %tobool.not.i.i, label %do.end.critedge.i.i, label %if.then.i9.i

if.then.i9.i:                                     ; preds = %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i
  %32 = load i32, i32* %overage.i.i, align 4, !tbaa !36
  %sub.i.i = sub i32 %31, %32
  store i32 %sub.i.i, i32* %cursor.i.i, align 4, !tbaa !34
  %conv.i.i = zext i32 %sub.i.i to i64
  %call.i.i401 = tail call i64 @write(i32 %call, i8* nonnull %arraydecay.i.i, i64 %conv.i.i) #16
  %conv5.i.i = trunc i64 %call.i.i401 to i32
  %cmp.i8.i = icmp eq i32 %sub.i.i, %conv5.i.i
  store i32 0, i32* %cursor.i.i, align 4, !tbaa !34
  store i32 0, i32* %overage.i.i, align 4, !tbaa !36
  %33 = atomicrmw and i32* %lock.i.i.i, i32 2147483647 seq_cst
  br i1 %cmp.i8.i, label %while.body.i.i.i.backedge, label %if.then10.i.i

if.then10.i.i:                                    ; preds = %if.then.i9.i
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([172 x i8], [172 x i8]* @.str.32, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %while.body.i.i.i.backedge

do.end.critedge.i.i:                              ; preds = %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i
  %34 = atomicrmw and i32* %lock.i.i.i, i32 2147483647 seq_cst
  br label %while.body.i.i.i.backedge

while.body.i.i.i.backedge:                        ; preds = %do.end.critedge.i.i, %if.then10.i.i, %if.then.i9.i, %while.body.i.i.i
  br label %while.body.i.i.i, !llvm.loop !37

_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit: ; preds = %if.then.i.i, %do.end.i.us.i
  %.lcssa.i = phi i32 [ %12, %do.end.i.us.i ], [ %25, %if.then.i.i ]
  %idx.ext.i.i = zext i32 %.lcssa.i to i64
  %add.ptr.i.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %8, i64 0, i32 3, i64 %idx.ext.i.i
  %cmp16 = icmp ugt i32 %and, 4096
  br i1 %cmp16, label %if.then17, label %if.end

if.then17:                                        ; preds = %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i404 = icmp eq i8* %call.i, null
  br i1 %tobool.not.i404, label %if.then.i415, label %if.else.i421

if.then.i415:                                     ; preds = %if.then17
  %conv.i4071 = zext i32 %and to i64
  %call.i4082 = tail call i8* @halide_uint64_to_string(i8* null, i8* null, i64 %conv.i4071, i32 1) #16
  %call.i41117 = tail call i8* @halide_string_to_string(i8* %call.i4082, i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)) #16
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE0ELy1024EED2Ev.exit

if.else.i421:                                     ; preds = %if.then17
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %conv.i4073 = zext i32 %and to i64
  %call.i4084 = tail call i8* @halide_uint64_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i64 %conv.i4073, i32 1) #16
  %call.i411 = tail call i8* @halide_string_to_string(i8* %call.i4084, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)) #16
  %sub.ptr.lhs.cast.i.i416 = ptrtoint i8* %call.i411 to i64
  %sub.ptr.rhs.cast.i.i417 = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i418 = sub i64 1, %sub.ptr.rhs.cast.i.i417
  %add.i.i419 = add i64 %sub.ptr.sub.i.i418, %sub.ptr.lhs.cast.i.i416
  %call.i.i420 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* null, i8* nonnull %call.i, i64 %add.i.i419) #16
  tail call void @halide_print(i8* null, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE0ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE0ELy1024EED2Ev.exit: ; preds = %if.else.i421, %if.then.i415
  tail call void @free(i8* %call.i) #16
  br label %if.end

if.end:                                           ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE0ELy1024EED2Ev.exit, %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit
  %size = bitcast i8* %add.ptr.i.i to i32*
  store i32 %and, i32* %size, align 4, !tbaa !39
  %id = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 4
  %35 = bitcast i8* %id to i32*
  store i32 %0, i32* %35, align 4, !tbaa !41
  %36 = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 8
  %37 = bitcast %struct.halide_type_t* %type to i32*
  %38 = bitcast i8* %36 to i32*
  %39 = load i32, i32* %37, align 8
  store i32 %39, i32* %38, align 4
  %event = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 5
  %event22 = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 12
  %40 = bitcast i32* %event to <4 x i32>*
  %41 = load <4 x i32>, <4 x i32>* %40, align 4, !tbaa !38
  %dimensions26 = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 24
  %42 = bitcast i8* %dimensions26 to i32*
  %43 = bitcast i8* %event22 to <4 x i32>*
  store <4 x i32> %41, <4 x i32>* %43, align 4, !tbaa !38
  %coordinates = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 2
  %44 = load i32*, i32** %coordinates, align 8, !tbaa !42
  %tobool27.not = icmp eq i32* %44, null
  br i1 %tobool27.not, label %if.end33, label %if.then28

if.then28:                                        ; preds = %if.end
  %45 = bitcast i32* %44 to i8*
  %46 = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 28
  %conv31 = zext i32 %mul3 to i64
  %call32 = tail call i8* @memcpy(i8* nonnull %46, i8* nonnull %45, i64 %conv31) #16
  br label %if.end33

if.end33:                                         ; preds = %if.then28, %if.end
  %value = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 1
  %47 = load i8*, i8** %value, align 8, !tbaa !43
  %tobool34.not = icmp eq i8* %47, null
  br i1 %tobool34.not, label %if.end40, label %if.then35

if.then35:                                        ; preds = %if.end33
  %48 = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 28
  %49 = bitcast i8* %48 to i32*
  %50 = load i32, i32* %42, align 4, !tbaa !44
  %idx.ext.i = sext i32 %50 to i64
  %add.ptr.i424 = getelementptr inbounds i32, i32* %49, i64 %idx.ext.i
  %51 = bitcast i32* %add.ptr.i424 to i8*
  %conv38 = zext i32 %mul to i64
  %call39 = tail call i8* @memcpy(i8* nonnull %51, i8* nonnull %47, i64 %conv38) #16
  br label %if.end40

if.end40:                                         ; preds = %if.end33, %if.then35
  %52 = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 28
  %53 = bitcast i8* %52 to i32*
  %54 = load i32, i32* %42, align 4, !tbaa !44
  %idx.ext.i.i425 = sext i32 %54 to i64
  %add.ptr.i.i426 = getelementptr inbounds i32, i32* %53, i64 %idx.ext.i.i425
  %55 = bitcast i32* %add.ptr.i.i426 to i8*
  %lanes.i = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 10
  %56 = bitcast i8* %lanes.i to i16*
  %57 = load i16, i16* %56, align 2, !tbaa !45
  %conv.i427 = zext i16 %57 to i32
  %58 = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 9
  %59 = load i8, i8* %58, align 1, !tbaa !28
  %conv.i.i428 = zext i8 %59 to i32
  %add.i.i429 = add nuw nsw i32 %conv.i.i428, 7
  %div.i.i = lshr i32 %add.i.i429, 3
  %mul.i = mul nuw nsw i32 %div.i.i, %conv.i427
  %idx.ext.i430 = zext i32 %mul.i to i64
  %add.ptr.i431 = getelementptr inbounds i8, i8* %55, i64 %idx.ext.i430
  %60 = load i8*, i8** %func, align 8, !tbaa !30
  %conv43 = zext i32 %conv5 to i64
  %call44 = tail call i8* @memcpy(i8* nonnull %add.ptr.i431, i8* %60, i64 %conv43) #16
  %61 = load i32, i32* %42, align 4, !tbaa !44
  %idx.ext.i.i.i = sext i32 %61 to i64
  %add.ptr.i.i.i = getelementptr inbounds i32, i32* %53, i64 %idx.ext.i.i.i
  %62 = bitcast i32* %add.ptr.i.i.i to i8*
  %63 = load i16, i16* %56, align 2, !tbaa !45
  %conv.i.i432 = zext i16 %63 to i32
  %64 = load i8, i8* %58, align 1, !tbaa !28
  %conv.i.i.i = zext i8 %64 to i32
  %add.i.i.i433 = add nuw nsw i32 %conv.i.i.i, 7
  %div.i.i.i = lshr i32 %add.i.i.i433, 3
  %mul.i.i = mul nuw nsw i32 %div.i.i.i, %conv.i.i432
  %idx.ext.i.i434 = zext i32 %mul.i.i to i64
  %add.ptr.i.i435 = getelementptr inbounds i8, i8* %62, i64 %idx.ext.i.i434
  br label %while.cond.i437

while.cond.i437:                                  ; preds = %while.cond.i437, %if.end40
  %f.0.i = phi i8* [ %add.ptr.i.i435, %if.end40 ], [ %incdec.ptr.i, %while.cond.i437 ]
  %incdec.ptr.i = getelementptr inbounds i8, i8* %f.0.i, i64 1
  %65 = load i8, i8* %f.0.i, align 1, !tbaa !38
  %tobool.not.i436 = icmp eq i8 %65, 0
  br i1 %tobool.not.i436, label %_ZN21halide_trace_packet_t9trace_tagEv.exit, label %while.cond.i437, !llvm.loop !46

_ZN21halide_trace_packet_t9trace_tagEv.exit:      ; preds = %while.cond.i437
  %66 = load i8*, i8** %trace_tag, align 8, !tbaa !31
  %tobool47.not = icmp eq i8* %66, null
  %spec.select = select i1 %tobool47.not, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.9, i64 0, i64 0), i8* %66
  %conv53 = zext i32 %cond to i64
  %call54 = tail call i8* @memcpy(i8* nonnull %incdec.ptr.i, i8* %spec.select, i64 %conv53) #16
  %67 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  fence seq_cst
  %lock.i.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %67, i64 0, i32 0, i32 0
  %68 = atomicrmw sub i32* %lock.i.i, i32 1 seq_cst
  %69 = load i32, i32* %event, align 4, !tbaa !47
  %cmp56 = icmp eq i32 %69, 9
  br i1 %cmp56, label %if.then57, label %if.end277

if.then57:                                        ; preds = %_ZN21halide_trace_packet_t9trace_tagEv.exit
  %70 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %lock.i.i438 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %70, i64 0, i32 0, i32 0
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %while.body.i.i, %if.then57
  %71 = atomicrmw or i32* %lock.i.i438, i32 1073741824 seq_cst
  %72 = cmpxchg i32* %lock.i.i438, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %73 = extractvalue { i32, i1 } %72, 1
  br i1 %73, label %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i, label %while.body.i.i

_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i: ; preds = %while.body.i.i
  %cursor.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %70, i64 0, i32 1
  %74 = load i32, i32* %cursor.i, align 4, !tbaa !34
  %tobool.not.i439 = icmp eq i32 %74, 0
  br i1 %tobool.not.i439, label %do.end.critedge.i, label %if.then.i442

if.then.i442:                                     ; preds = %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i
  %overage.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %70, i64 0, i32 2
  %75 = load i32, i32* %overage.i, align 4, !tbaa !36
  %sub.i = sub i32 %74, %75
  store i32 %sub.i, i32* %cursor.i, align 4, !tbaa !34
  %arraydecay.i = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %70, i64 0, i32 3, i64 0
  %conv.i440 = zext i32 %sub.i to i64
  %call.i441 = tail call i64 @write(i32 %call, i8* nonnull %arraydecay.i, i64 %conv.i440) #16
  %conv5.i = trunc i64 %call.i441 to i32
  %cmp.i = icmp eq i32 %sub.i, %conv5.i
  store i32 0, i32* %cursor.i, align 4, !tbaa !34
  store i32 0, i32* %overage.i, align 4, !tbaa !36
  %76 = atomicrmw and i32* %lock.i.i438, i32 2147483647 seq_cst
  br i1 %cmp.i, label %if.end277, label %if.then10.i

if.then10.i:                                      ; preds = %if.then.i442
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([172 x i8], [172 x i8]* @.str.32, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %if.end277

do.end.critedge.i:                                ; preds = %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i
  %77 = atomicrmw and i32* %lock.i.i438, i32 2147483647 seq_cst
  br label %if.end277

if.else:                                          ; preds = %entry
  %call.i445 = tail call i8* @malloc(i64 4096) #16
  %tobool.not.i448 = icmp eq i8* %call.i445, null
  br i1 %tobool.not.i448, label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EEC2EPvPc.exit, label %if.then6.i451

if.then6.i451:                                    ; preds = %if.else
  %add.ptr.i449 = getelementptr inbounds i8, i8* %call.i445, i64 4095
  store i8 0, i8* %add.ptr.i449, align 1, !tbaa !38
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EEC2EPvPc.exit: ; preds = %if.then6.i451, %if.else
  %ss.sroa.74.0 = phi i8* [ %add.ptr.i449, %if.then6.i451 ], [ null, %if.else ]
  %bits = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 4, i32 1
  %78 = load i8, i8* %bits, align 1, !tbaa !48
  %conv60 = zext i8 %78 to i32
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EEC2EPvPc.exit
  %print_bits.0 = phi i32 [ 8, %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EEC2EPvPc.exit ], [ %shl, %while.cond ]
  %cmp61 = icmp slt i32 %print_bits.0, %conv60
  %shl = shl i32 %print_bits.0, 1
  br i1 %cmp61, label %while.cond, label %do.body, !llvm.loop !49

do.body:                                          ; preds = %while.cond
  %cmp62 = icmp slt i32 %print_bits.0, 65
  br i1 %cmp62, label %do.end, label %if.then63

if.then63:                                        ; preds = %do.body
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([168 x i8], [168 x i8]* @.str.2.10, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end

do.end:                                           ; preds = %if.then63, %do.body
  %event65 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 5
  %79 = load i32, i32* %event65, align 4, !tbaa !47
  %cmp66 = icmp slt i32 %79, 2
  %idxprom = zext i32 %79 to i64
  %arrayidx = getelementptr inbounds [11 x i8*], [11 x i8*]* @__const.halide_default_trace.event_types, i64 0, i64 %idxprom
  %80 = load i8*, i8** %arrayidx, align 8, !tbaa !12
  %call.i456 = tail call i8* @halide_string_to_string(i8* %call.i445, i8* %ss.sroa.74.0, i8* %80) #16
  %call.i459 = tail call i8* @halide_string_to_string(i8* %call.i456, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0)) #16
  %func70 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 0
  %81 = load i8*, i8** %func70, align 8, !tbaa !30
  %call.i462 = tail call i8* @halide_string_to_string(i8* %call.i459, i8* %ss.sroa.74.0, i8* %81) #16
  %call.i465 = tail call i8* @halide_string_to_string(i8* %call.i462, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.141, i64 0, i64 0)) #16
  %value_index73 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 7
  %82 = load i32, i32* %value_index73, align 4, !tbaa !50
  %conv.i468 = sext i32 %82 to i64
  %call.i469 = tail call i8* @halide_int64_to_string(i8* %call.i465, i8* %ss.sroa.74.0, i64 %conv.i468, i32 1) #16
  %call.i472 = tail call i8* @halide_string_to_string(i8* %call.i469, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i64 0, i64 0)) #16
  %lanes77 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 4, i32 2
  %83 = load i16, i16* %lanes77, align 2, !tbaa !22
  %cmp79 = icmp ugt i16 %83, 1
  br i1 %cmp79, label %if.then80, label %if.end82

if.then80:                                        ; preds = %do.end
  %call.i475 = tail call i8* @halide_string_to_string(i8* %call.i472, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0)) #16
  br label %if.end82

if.end82:                                         ; preds = %if.then80, %do.end
  %ss.sroa.7.0 = phi i8* [ %call.i475, %if.then80 ], [ %call.i472, %do.end ]
  %dimensions83 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 8
  %84 = load i32, i32* %dimensions83, align 8, !tbaa !29
  %cmp84660 = icmp sgt i32 %84, 0
  br i1 %cmp84660, label %if.end100.peel, label %for.cond.cleanup

if.end100.peel:                                   ; preds = %if.end82
  %coordinates101 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 2
  %.pre = load i32*, i32** %coordinates101, align 8, !tbaa !42
  %.pre673 = load i32, i32* %.pre, align 4, !tbaa !16
  %conv.i484.peel = sext i32 %.pre673 to i64
  %call.i485.peel = tail call i8* @halide_int64_to_string(i8* %ss.sroa.7.0, i8* %ss.sroa.74.0, i64 %conv.i484.peel, i32 1) #16
  %85 = load i32, i32* %dimensions83, align 8, !tbaa !29
  %cmp84.peel = icmp sgt i32 %85, 1
  br i1 %cmp84.peel, label %if.then86, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %if.end100, %if.end100.peel, %if.end82
  %ss.sroa.7.1.lcssa = phi i8* [ %ss.sroa.7.0, %if.end82 ], [ %call.i485.peel, %if.end100.peel ], [ %call.i485, %if.end100 ]
  %86 = load i16, i16* %lanes77, align 2, !tbaa !22
  %cmp108 = icmp ugt i16 %86, 1
  %.sink684 = select i1 %cmp108, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.119, i64 0, i64 0)
  %call.i491 = tail call i8* @halide_string_to_string(i8* %ss.sroa.7.1.lcssa, i8* %ss.sroa.74.0, i8* %.sink684) #16
  br i1 %cmp66, label %if.then115, label %if.end263

if.then86:                                        ; preds = %if.end100.peel, %if.end100
  %indvars.iv670 = phi i64 [ %indvars.iv.next671, %if.end100 ], [ 1, %if.end100.peel ]
  %ss.sroa.7.1661 = phi i8* [ %call.i485, %if.end100 ], [ %call.i485.peel, %if.end100.peel ]
  %87 = load i16, i16* %lanes77, align 2, !tbaa !22
  %cmp90 = icmp ugt i16 %87, 1
  br i1 %cmp90, label %land.lhs.true, label %if.else97.split

land.lhs.true:                                    ; preds = %if.then86
  %conv89 = zext i16 %87 to i32
  %88 = trunc i64 %indvars.iv670 to i32
  %rem = urem i32 %88, %conv89
  %cmp94 = icmp eq i32 %rem, 0
  br i1 %cmp94, label %if.end100, label %if.else97.split

if.else97.split:                                  ; preds = %if.then86, %land.lhs.true
  br label %if.end100

if.end100:                                        ; preds = %land.lhs.true, %if.else97.split
  %.sink = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0), %if.else97.split ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i64 0, i64 0), %land.lhs.true ]
  %call.i4786 = tail call i8* @halide_string_to_string(i8* %ss.sroa.7.1661, i8* %ss.sroa.74.0, i8* %.sink) #16
  %89 = load i32*, i32** %coordinates101, align 8, !tbaa !42
  %arrayidx103 = getelementptr inbounds i32, i32* %89, i64 %indvars.iv670
  %90 = load i32, i32* %arrayidx103, align 4, !tbaa !16
  %conv.i484 = sext i32 %90 to i64
  %call.i485 = tail call i8* @halide_int64_to_string(i8* %call.i4786, i8* %ss.sroa.74.0, i64 %conv.i484, i32 1) #16
  %indvars.iv.next671 = add nuw nsw i64 %indvars.iv670, 1
  %91 = load i32, i32* %dimensions83, align 8, !tbaa !29
  %92 = sext i32 %91 to i64
  %cmp84 = icmp slt i64 %indvars.iv.next671, %92
  br i1 %cmp84, label %if.then86, label %for.cond.cleanup, !llvm.loop !51

if.then115:                                       ; preds = %for.cond.cleanup
  %93 = load i16, i16* %lanes77, align 2, !tbaa !22
  %cmp119 = icmp ugt i16 %93, 1
  %.sink685 = select i1 %cmp119, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0)
  %call.i497 = tail call i8* @halide_string_to_string(i8* %call.i491, i8* %ss.sroa.74.0, i8* %.sink685) #16
  %94 = load i16, i16* %lanes77, align 2, !tbaa !22
  %cmp130655.not = icmp eq i16 %94, 0
  br i1 %cmp130655.not, label %if.end263, label %if.end136.peel

if.end136.peel:                                   ; preds = %if.then115
  %code = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 4, i32 0
  %value245 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 1
  %95 = bitcast i8** %value245 to i8***
  %cmp214 = icmp sgt i32 %print_bits.0, 15
  %96 = bitcast i8** %value245 to i16**
  %97 = bitcast i8** %value245 to float**
  %98 = bitcast i8** %value245 to double**
  %99 = bitcast i8** %value245 to i32**
  %100 = bitcast i8** %value245 to i64**
  %.pre674 = load i8, i8* %code, align 8, !tbaa !53
  switch i8 %.pre674, label %for.inc253.peel [
    i8 0, label %if.then140.peel
    i8 1, label %if.then176.peel
    i8 2, label %do.body213.peel
    i8 3, label %if.then244.peel
  ]

if.then244.peel:                                  ; preds = %if.end136.peel
  %101 = load i8**, i8*** %95, align 8, !tbaa !43
  %102 = load i8*, i8** %101, align 8, !tbaa !12
  %call.i543.peel = tail call i8* @halide_pointer_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i8* %102) #16
  br label %for.inc253.peel

do.body213.peel:                                  ; preds = %if.end136.peel
  br i1 %cmp214, label %do.end218.peel, label %if.then215.peel

if.then215.peel:                                  ; preds = %do.body213.peel
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([170 x i8], [170 x i8]* @.str.24, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end218.peel

do.end218.peel:                                   ; preds = %if.then215.peel, %do.body213.peel
  switch i32 %print_bits.0, label %if.else232.peel [
    i32 32, label %if.then220.peel
    i32 16, label %if.then227.peel
  ]

if.then227.peel:                                  ; preds = %do.end218.peel
  %103 = load i16*, i16** %96, align 8, !tbaa !43
  %104 = load i16, i16* %103, align 2, !tbaa !54
  %call.i535.peel = tail call double @halide_float16_bits_to_double(i16 zeroext %104) #16
  %call2.i.peel = tail call i8* @halide_double_to_string(i8* %call.i497, i8* %ss.sroa.74.0, double %call.i535.peel, i32 1) #16
  br label %for.inc253.peel

if.then220.peel:                                  ; preds = %do.end218.peel
  %105 = load float*, float** %97, align 8, !tbaa !43
  %106 = load float, float* %105, align 4, !tbaa !55
  %conv.i533.peel = fpext float %106 to double
  %call.i534.peel = tail call i8* @halide_double_to_string(i8* %call.i497, i8* %ss.sroa.74.0, double %conv.i533.peel, i32 0) #16
  br label %for.inc253.peel

if.else232.peel:                                  ; preds = %do.end218.peel
  %107 = load double*, double** %98, align 8, !tbaa !43
  %108 = load double, double* %107, align 8, !tbaa !57
  %call.i540.peel = tail call i8* @halide_double_to_string(i8* %call.i497, i8* %ss.sroa.74.0, double %108, i32 1) #16
  br label %for.inc253.peel

if.then176.peel:                                  ; preds = %if.end136.peel
  switch i32 %print_bits.0, label %if.else199.peel [
    i32 8, label %if.then178.peel
    i32 16, label %if.then186.peel
    i32 32, label %if.then194.peel
  ]

if.then194.peel:                                  ; preds = %if.then176.peel
  %109 = load i32*, i32** %99, align 8, !tbaa !43
  %110 = load i32, i32* %109, align 4, !tbaa !16
  %conv.i526.peel = zext i32 %110 to i64
  %call.i527.peel = tail call i8* @halide_uint64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %conv.i526.peel, i32 1) #16
  br label %for.inc253.peel

if.then186.peel:                                  ; preds = %if.then176.peel
  %111 = load i16*, i16** %96, align 8, !tbaa !43
  %112 = load i16, i16* %111, align 2, !tbaa !54
  %conv.i522.peel = zext i16 %112 to i64
  %call.i523.peel = tail call i8* @halide_int64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %conv.i522.peel, i32 1) #16
  br label %for.inc253.peel

if.then178.peel:                                  ; preds = %if.then176.peel
  %113 = load i8*, i8** %value245, align 8, !tbaa !43
  %114 = load i8, i8* %113, align 1, !tbaa !38
  %conv.i518.peel = zext i8 %114 to i64
  %call.i519.peel = tail call i8* @halide_int64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %conv.i518.peel, i32 1) #16
  br label %for.inc253.peel

if.else199.peel:                                  ; preds = %if.then176.peel
  %115 = load i64*, i64** %100, align 8, !tbaa !43
  %116 = load i64, i64* %115, align 8, !tbaa !59
  %call.i530.peel = tail call i8* @halide_uint64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %116, i32 1) #16
  br label %for.inc253.peel

if.then140.peel:                                  ; preds = %if.end136.peel
  switch i32 %print_bits.0, label %if.else163.peel [
    i32 8, label %if.then142.peel
    i32 16, label %if.then150.peel
    i32 32, label %if.then158.peel
  ]

if.then158.peel:                                  ; preds = %if.then140.peel
  %117 = load i32*, i32** %99, align 8, !tbaa !43
  %118 = load i32, i32* %117, align 4, !tbaa !16
  %conv.i511.peel = sext i32 %118 to i64
  %call.i512.peel = tail call i8* @halide_int64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %conv.i511.peel, i32 1) #16
  br label %for.inc253.peel

if.then150.peel:                                  ; preds = %if.then140.peel
  %119 = load i16*, i16** %96, align 8, !tbaa !43
  %120 = load i16, i16* %119, align 2, !tbaa !54
  %conv.i507.peel = sext i16 %120 to i64
  %call.i508.peel = tail call i8* @halide_int64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %conv.i507.peel, i32 1) #16
  br label %for.inc253.peel

if.then142.peel:                                  ; preds = %if.then140.peel
  %121 = load i8*, i8** %value245, align 8, !tbaa !43
  %122 = load i8, i8* %121, align 1, !tbaa !38
  %conv.i503.peel = sext i8 %122 to i64
  %call.i504.peel = tail call i8* @halide_int64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %conv.i503.peel, i32 1) #16
  br label %for.inc253.peel

if.else163.peel:                                  ; preds = %if.then140.peel
  %123 = load i64*, i64** %100, align 8, !tbaa !43
  %124 = load i64, i64* %123, align 8, !tbaa !59
  %call.i515.peel = tail call i8* @halide_int64_to_string(i8* %call.i497, i8* %ss.sroa.74.0, i64 %124, i32 1) #16
  br label %for.inc253.peel

for.inc253.peel:                                  ; preds = %if.else163.peel, %if.then142.peel, %if.then150.peel, %if.then158.peel, %if.else199.peel, %if.then178.peel, %if.then186.peel, %if.then194.peel, %if.else232.peel, %if.then220.peel, %if.then227.peel, %if.then244.peel, %if.end136.peel
  %ss.sroa.7.7.peel = phi i8* [ %call.i497, %if.end136.peel ], [ %call.i543.peel, %if.then244.peel ], [ %call.i540.peel, %if.else232.peel ], [ %call2.i.peel, %if.then227.peel ], [ %call.i534.peel, %if.then220.peel ], [ %call.i530.peel, %if.else199.peel ], [ %call.i527.peel, %if.then194.peel ], [ %call.i523.peel, %if.then186.peel ], [ %call.i519.peel, %if.then178.peel ], [ %call.i515.peel, %if.else163.peel ], [ %call.i512.peel, %if.then158.peel ], [ %call.i508.peel, %if.then150.peel ], [ %call.i504.peel, %if.then142.peel ]
  %125 = load i16, i16* %lanes77, align 2, !tbaa !22
  %cmp130.peel = icmp ugt i16 %125, 1
  br i1 %cmp130.peel, label %if.end136, label %if.end263

for.cond.cleanup131:                              ; preds = %for.inc253
  %cmp259 = icmp ugt i16 %151, 1
  br i1 %cmp259, label %if.then260, label %if.end263

if.end136:                                        ; preds = %for.inc253.peel, %for.inc253
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc253 ], [ 1, %for.inc253.peel ]
  %ss.sroa.7.5656 = phi i8* [ %ss.sroa.7.7, %for.inc253 ], [ %ss.sroa.7.7.peel, %for.inc253.peel ]
  %call.i500 = tail call i8* @halide_string_to_string(i8* %ss.sroa.7.5656, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  %126 = load i8, i8* %code, align 8, !tbaa !53
  switch i8 %126, label %for.inc253 [
    i8 0, label %if.then140
    i8 1, label %if.then176
    i8 2, label %do.body213
    i8 3, label %if.then244
  ]

if.then140:                                       ; preds = %if.end136
  switch i32 %print_bits.0, label %if.else163 [
    i32 8, label %if.then142
    i32 16, label %if.then150
    i32 32, label %if.then158
  ]

if.then142:                                       ; preds = %if.then140
  %127 = load i8*, i8** %value245, align 8, !tbaa !43
  %arrayidx145 = getelementptr inbounds i8, i8* %127, i64 %indvars.iv
  %128 = load i8, i8* %arrayidx145, align 1, !tbaa !38
  %conv.i503 = sext i8 %128 to i64
  %call.i504 = tail call i8* @halide_int64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %conv.i503, i32 1) #16
  br label %for.inc253

if.then150:                                       ; preds = %if.then140
  %129 = load i16*, i16** %96, align 8, !tbaa !43
  %arrayidx153 = getelementptr inbounds i16, i16* %129, i64 %indvars.iv
  %130 = load i16, i16* %arrayidx153, align 2, !tbaa !54
  %conv.i507 = sext i16 %130 to i64
  %call.i508 = tail call i8* @halide_int64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %conv.i507, i32 1) #16
  br label %for.inc253

if.then158:                                       ; preds = %if.then140
  %131 = load i32*, i32** %99, align 8, !tbaa !43
  %arrayidx161 = getelementptr inbounds i32, i32* %131, i64 %indvars.iv
  %132 = load i32, i32* %arrayidx161, align 4, !tbaa !16
  %conv.i511 = sext i32 %132 to i64
  %call.i512 = tail call i8* @halide_int64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %conv.i511, i32 1) #16
  br label %for.inc253

if.else163:                                       ; preds = %if.then140
  %133 = load i64*, i64** %100, align 8, !tbaa !43
  %arrayidx166 = getelementptr inbounds i64, i64* %133, i64 %indvars.iv
  %134 = load i64, i64* %arrayidx166, align 8, !tbaa !59
  %call.i515 = tail call i8* @halide_int64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %134, i32 1) #16
  br label %for.inc253

if.then176:                                       ; preds = %if.end136
  switch i32 %print_bits.0, label %if.else199 [
    i32 8, label %if.then178
    i32 16, label %if.then186
    i32 32, label %if.then194
  ]

if.then178:                                       ; preds = %if.then176
  %135 = load i8*, i8** %value245, align 8, !tbaa !43
  %arrayidx181 = getelementptr inbounds i8, i8* %135, i64 %indvars.iv
  %136 = load i8, i8* %arrayidx181, align 1, !tbaa !38
  %conv.i518 = zext i8 %136 to i64
  %call.i519 = tail call i8* @halide_int64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %conv.i518, i32 1) #16
  br label %for.inc253

if.then186:                                       ; preds = %if.then176
  %137 = load i16*, i16** %96, align 8, !tbaa !43
  %arrayidx189 = getelementptr inbounds i16, i16* %137, i64 %indvars.iv
  %138 = load i16, i16* %arrayidx189, align 2, !tbaa !54
  %conv.i522 = zext i16 %138 to i64
  %call.i523 = tail call i8* @halide_int64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %conv.i522, i32 1) #16
  br label %for.inc253

if.then194:                                       ; preds = %if.then176
  %139 = load i32*, i32** %99, align 8, !tbaa !43
  %arrayidx197 = getelementptr inbounds i32, i32* %139, i64 %indvars.iv
  %140 = load i32, i32* %arrayidx197, align 4, !tbaa !16
  %conv.i526 = zext i32 %140 to i64
  %call.i527 = tail call i8* @halide_uint64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %conv.i526, i32 1) #16
  br label %for.inc253

if.else199:                                       ; preds = %if.then176
  %141 = load i64*, i64** %100, align 8, !tbaa !43
  %arrayidx202 = getelementptr inbounds i64, i64* %141, i64 %indvars.iv
  %142 = load i64, i64* %arrayidx202, align 8, !tbaa !59
  %call.i530 = tail call i8* @halide_uint64_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i64 %142, i32 1) #16
  br label %for.inc253

do.body213:                                       ; preds = %if.end136
  br i1 %cmp214, label %do.end218, label %if.then215

if.then215:                                       ; preds = %do.body213
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([170 x i8], [170 x i8]* @.str.24, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end218

do.end218:                                        ; preds = %if.then215, %do.body213
  switch i32 %print_bits.0, label %if.else232 [
    i32 32, label %if.then220
    i32 16, label %if.then227
  ]

if.then220:                                       ; preds = %do.end218
  %143 = load float*, float** %97, align 8, !tbaa !43
  %arrayidx223 = getelementptr inbounds float, float* %143, i64 %indvars.iv
  %144 = load float, float* %arrayidx223, align 4, !tbaa !55
  %conv.i533 = fpext float %144 to double
  %call.i534 = tail call i8* @halide_double_to_string(i8* %call.i500, i8* %ss.sroa.74.0, double %conv.i533, i32 0) #16
  br label %for.inc253

if.then227:                                       ; preds = %do.end218
  %145 = load i16*, i16** %96, align 8, !tbaa !43
  %arrayidx230 = getelementptr inbounds i16, i16* %145, i64 %indvars.iv
  %146 = load i16, i16* %arrayidx230, align 2, !tbaa !54
  %call.i535 = tail call double @halide_float16_bits_to_double(i16 zeroext %146) #16
  %call2.i = tail call i8* @halide_double_to_string(i8* %call.i500, i8* %ss.sroa.74.0, double %call.i535, i32 1) #16
  br label %for.inc253

if.else232:                                       ; preds = %do.end218
  %147 = load double*, double** %98, align 8, !tbaa !43
  %arrayidx235 = getelementptr inbounds double, double* %147, i64 %indvars.iv
  %148 = load double, double* %arrayidx235, align 8, !tbaa !57
  %call.i540 = tail call i8* @halide_double_to_string(i8* %call.i500, i8* %ss.sroa.74.0, double %148, i32 1) #16
  br label %for.inc253

if.then244:                                       ; preds = %if.end136
  %149 = load i8**, i8*** %95, align 8, !tbaa !43
  %arrayidx247 = getelementptr inbounds i8*, i8** %149, i64 %indvars.iv
  %150 = load i8*, i8** %arrayidx247, align 8, !tbaa !12
  %call.i543 = tail call i8* @halide_pointer_to_string(i8* %call.i500, i8* %ss.sroa.74.0, i8* %150) #16
  br label %for.inc253

for.inc253:                                       ; preds = %if.then244, %if.else232, %if.then227, %if.then220, %if.else199, %if.then194, %if.then186, %if.then178, %if.else163, %if.then158, %if.then150, %if.then142, %if.end136
  %ss.sroa.7.7 = phi i8* [ %call.i500, %if.end136 ], [ %call.i543, %if.then244 ], [ %call.i540, %if.else232 ], [ %call2.i, %if.then227 ], [ %call.i534, %if.then220 ], [ %call.i530, %if.else199 ], [ %call.i527, %if.then194 ], [ %call.i523, %if.then186 ], [ %call.i519, %if.then178 ], [ %call.i515, %if.else163 ], [ %call.i512, %if.then158 ], [ %call.i508, %if.then150 ], [ %call.i504, %if.then142 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %151 = load i16, i16* %lanes77, align 2, !tbaa !22
  %152 = zext i16 %151 to i64
  %cmp130 = icmp ult i64 %indvars.iv.next, %152
  br i1 %cmp130, label %if.end136, label %for.cond.cleanup131, !llvm.loop !61

if.then260:                                       ; preds = %for.cond.cleanup131
  %call.i546 = tail call i8* @halide_string_to_string(i8* %ss.sroa.7.7, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i64 0, i64 0)) #16
  br label %if.end263

if.end263:                                        ; preds = %if.then260, %for.cond.cleanup131, %for.inc253.peel, %if.then115, %for.cond.cleanup
  %ss.sroa.7.8 = phi i8* [ %call.i546, %if.then260 ], [ %ss.sroa.7.7, %for.cond.cleanup131 ], [ %call.i491, %for.cond.cleanup ], [ %ss.sroa.7.7.peel, %for.inc253.peel ], [ %call.i497, %if.then115 ]
  %trace_tag264 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %e, i64 0, i32 3
  %153 = load i8*, i8** %trace_tag264, align 8, !tbaa !31
  %tobool265.not = icmp eq i8* %153, null
  br i1 %tobool265.not, label %if.end274, label %land.lhs.true266

land.lhs.true266:                                 ; preds = %if.end263
  %154 = load i8, i8* %153, align 1, !tbaa !38
  %tobool268.not = icmp eq i8 %154, 0
  br i1 %tobool268.not, label %if.end274, label %if.then269

if.then269:                                       ; preds = %land.lhs.true266
  %call.i549 = tail call i8* @halide_string_to_string(i8* %ss.sroa.7.8, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i64 0, i64 0)) #16
  %155 = load i8*, i8** %trace_tag264, align 8, !tbaa !31
  %call.i552 = tail call i8* @halide_string_to_string(i8* %call.i549, i8* %ss.sroa.74.0, i8* %155) #16
  %call.i555 = tail call i8* @halide_string_to_string(i8* %call.i552, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i64 0, i64 0)) #16
  br label %if.end274

if.end274:                                        ; preds = %if.then269, %land.lhs.true266, %if.end263
  %ss.sroa.7.9 = phi i8* [ %ss.sroa.7.8, %if.end263 ], [ %ss.sroa.7.8, %land.lhs.true266 ], [ %call.i555, %if.then269 ]
  %call.i558 = tail call i8* @halide_string_to_string(i8* %ss.sroa.7.9, i8* %ss.sroa.74.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)) #16
  br label %while.cond.i560

while.cond.i560:                                  ; preds = %while.cond.i560, %if.end274
  %156 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i8 1 acquire
  %tobool.not.i559 = icmp eq i8 %156, 0
  br i1 %tobool.not.i559, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit, label %while.cond.i560, !llvm.loop !62

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit: ; preds = %while.cond.i560
  br i1 %tobool.not.i448, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 1
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %sub.ptr.lhs.cast.i.i563 = ptrtoint i8* %call.i558 to i64
  %sub.ptr.rhs.cast.i.i564 = ptrtoint i8* %call.i445 to i64
  %sub.ptr.sub.i.i565 = sub i64 1, %sub.ptr.rhs.cast.i.i564
  %add.i.i566 = add i64 %sub.ptr.sub.i.i565, %sub.ptr.lhs.cast.i.i563
  %call.i.i567 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i445, i64 %add.i.i566) #16
  tail call void @halide_print(i8* %user_context, i8* nonnull %call.i445) #16
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 1
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i445, i64 %add.i.i566) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i445) #16
  br label %if.end277

if.end277:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE2ELy4096EED2Ev.exit, %do.end.critedge.i, %if.then10.i, %if.then.i442, %_ZN21halide_trace_packet_t9trace_tagEv.exit
  ret i32 %0
}

; Function Attrs: nounwind
define weak i32 @halide_get_trace_file(i8* %user_context) local_unnamed_addr #4 {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i, %entry
  %0 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i8 1 acquire
  %tobool.not.i = icmp eq i8 %0, 0
  br i1 %tobool.not.i, label %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit, label %while.cond.i, !llvm.loop !62

_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit: ; preds = %while.cond.i
  %1 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end11

if.then:                                          ; preds = %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %call = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.28, i64 0, i64 0)) #16
  %tobool.not = icmp eq i8* %call, null
  br i1 %tobool.not, label %if.else, label %if.then1

if.then1:                                         ; preds = %if.then
  %call2 = tail call i8* @fopen(i8* nonnull %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i64 0, i64 0)) #16
  %tobool3.not = icmp eq i8* %call2, null
  br i1 %tobool3.not, label %if.then4, label %do.end

if.then4:                                         ; preds = %if.then1
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([167 x i8], [167 x i8]* @.str.30, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end

do.end:                                           ; preds = %if.then4, %if.then1
  %call5 = tail call i32 @fileno(i8* %call2) #16
  tail call void @halide_set_trace_file(i32 %call5) #17
  store i8* %call2, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !12
  %2 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %tobool6.not = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %2, null
  br i1 %tobool6.not, label %if.then7, label %if.end11

if.then7:                                         ; preds = %do.end
  %call8 = tail call i8* @malloc(i64 1048588) #16
  store i8* %call8, i8** bitcast (%"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE to i8**), align 8, !tbaa !12
  %cursor.i = getelementptr inbounds i8, i8* %call8, i64 4
  %3 = bitcast i8* %cursor.i to i32*
  store i32 0, i32* %3, align 4, !tbaa !34
  %overage.i = getelementptr inbounds i8, i8* %call8, i64 8
  %4 = bitcast i8* %overage.i to i32*
  store i32 0, i32* %4, align 4, !tbaa !36
  %lock.i.i = bitcast i8* %call8 to i32*
  store volatile i32 0, i32* %lock.i.i, align 4, !tbaa !32
  br label %if.end11

if.else:                                          ; preds = %if.then
  tail call void @halide_set_trace_file(i32 0) #17
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then7, %do.end, %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
  %5 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 1
  ret i32 %5
}

declare i64 @strlen(i8*) local_unnamed_addr #1

declare i64 @write(i32, i8*, i64) local_unnamed_addr #1

declare void @halide_print(i8*, i8*) local_unnamed_addr #1

declare void @abort() local_unnamed_addr #1

declare i8* @malloc(i64) local_unnamed_addr #1

declare void @free(i8*) local_unnamed_addr #1

declare i8* @memcpy(i8*, i8*, i64) local_unnamed_addr #1

declare i8* @fopen(i8*, i8*) local_unnamed_addr #1

declare i32 @fileno(i8*) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_trace_file(i32 %fd) local_unnamed_addr #2 {
entry:
  store i32 %fd, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_trace_cleanup() #0 {
entry:
  %call = tail call i32 @halide_shutdown_trace() #17
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_shutdown_trace() local_unnamed_addr #0 {
entry:
  %0 = load i8*, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !12
  %tobool.not = icmp eq i8* %0, null
  br i1 %tobool.not, label %return, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 @fclose(i8* nonnull %0) #16
  store i32 0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  store i8 0, i8* @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, align 1, !tbaa !18
  store i8* null, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !12
  %1 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %tobool1.not = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %1, null
  br i1 %tobool1.not, label %return, label %if.then2

if.then2:                                         ; preds = %if.then
  %2 = bitcast %"class.Halide::Runtime::Internal::TraceBuffer"* %1 to i8*
  tail call void @free(i8* nonnull %2) #16
  br label %return

return:                                           ; preds = %if.then2, %if.then, %entry
  %retval.0 = phi i32 [ %call, %if.then2 ], [ %call, %if.then ], [ 0, %entry ]
  ret i32 %retval.0
}

declare i32 @fclose(i8*) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, %struct.halide_trace_event_t*)* @halide_set_custom_trace(i32 (i8*, %struct.halide_trace_event_t*)* %t) local_unnamed_addr #2 {
entry:
  %0 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !12
  store i32 (i8*, %struct.halide_trace_event_t*)* %t, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !12
  ret i32 (i8*, %struct.halide_trace_event_t*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_trace(i8* %user_context, %struct.halide_trace_event_t* %e) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !12
  %call = tail call i32 %0(i8* %user_context, %struct.halide_trace_event_t* %e) #16
  ret i32 %call
}

; Function Attrs: nounwind
define weak i32 @halide_trace_helper(i8* %user_context, i8* %func, i8* %value, i32* %coords, i32 %type_code, i32 %type_bits, i32 %type_lanes, i32 %code, i32 %parent_id, i32 %value_index, i32 %dimensions, i8* %trace_tag) local_unnamed_addr #4 {
entry:
  %event = alloca %struct.halide_trace_event_t, align 8
  %0 = bitcast %struct.halide_trace_event_t* %event to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %0) #11
  %code.i.i = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 4, i32 0
  %bits.i.i = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 4, i32 1
  %lanes.i.i = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 4, i32 2
  %func1 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 0
  store i8* %func, i8** %func1, align 8, !tbaa !30
  %value2 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 1
  store i8* %value, i8** %value2, align 8, !tbaa !43
  %coordinates = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 2
  store i32* %coords, i32** %coordinates, align 8, !tbaa !42
  %trace_tag3 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 3
  store i8* %trace_tag, i8** %trace_tag3, align 8, !tbaa !31
  %conv = trunc i32 %type_code to i8
  store i8 %conv, i8* %code.i.i, align 8, !tbaa !53
  %conv5 = trunc i32 %type_bits to i8
  store i8 %conv5, i8* %bits.i.i, align 1, !tbaa !48
  %conv7 = trunc i32 %type_lanes to i16
  store i16 %conv7, i16* %lanes.i.i, align 2, !tbaa !22
  %event9 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 5
  store i32 %code, i32* %event9, align 4, !tbaa !47
  %parent_id10 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 6
  store i32 %parent_id, i32* %parent_id10, align 8, !tbaa !63
  %value_index11 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 7
  store i32 %value_index, i32* %value_index11, align 4, !tbaa !50
  %dimensions12 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %event, i64 0, i32 8
  store i32 %dimensions, i32* %dimensions12, align 8, !tbaa !29
  %call = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %0, i64 56) #16
  %add = add nsw i32 %type_bits, 7
  %div = sdiv i32 %add, 8
  %mul = mul nsw i32 %div, %type_lanes
  %conv13 = sext i32 %mul to i64
  %call14 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* %value, i64 %conv13) #16
  %1 = bitcast i32* %coords to i8*
  %conv15 = sext i32 %dimensions to i64
  %mul16 = shl nsw i64 %conv15, 2
  %call17 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* %1, i64 %mul16) #16
  %call18 = call i32 @halide_trace(i8* %user_context, %struct.halide_trace_event_t* nonnull %event) #16
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %0) #11
  ret i32 %call18
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %filename, i8* %suffix) local_unnamed_addr #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %f.0 = phi i8* [ %filename, %entry ], [ %incdec.ptr, %while.cond ]
  %0 = load i8, i8* %f.0, align 1, !tbaa !38
  %tobool.not = icmp eq i8 %0, 0
  %incdec.ptr = getelementptr inbounds i8, i8* %f.0, i64 1
  br i1 %tobool.not, label %while.cond1, label %while.cond, !llvm.loop !64

while.cond1:                                      ; preds = %while.cond, %while.cond1
  %s.0 = phi i8* [ %incdec.ptr4, %while.cond1 ], [ %suffix, %while.cond ]
  %1 = load i8, i8* %s.0, align 1, !tbaa !38
  %tobool2.not = icmp eq i8 %1, 0
  %incdec.ptr4 = getelementptr inbounds i8, i8* %s.0, i64 1
  br i1 %tobool2.not, label %while.cond6.preheader, label %while.cond1, !llvm.loop !65

while.cond6.preheader:                            ; preds = %while.cond1
  %cmp34 = icmp ne i8* %s.0, %suffix
  %cmp735 = icmp ne i8* %f.0, %filename
  %2 = and i1 %cmp735, %cmp34
  br i1 %2, label %if.end, label %while.end13

if.end:                                           ; preds = %while.cond6.preheader, %if.end.while.body8_crit_edge
  %f.13649 = phi i8* [ %incdec.ptr11, %if.end.while.body8_crit_edge ], [ %f.0, %while.cond6.preheader ]
  %s.13748 = phi i8* [ %incdec.ptr12, %if.end.while.body8_crit_edge ], [ %s.0, %while.cond6.preheader ]
  %incdec.ptr11 = getelementptr inbounds i8, i8* %f.13649, i64 -1
  %incdec.ptr12 = getelementptr inbounds i8, i8* %s.13748, i64 -1
  %cmp = icmp ne i8* %incdec.ptr12, %suffix
  %cmp7 = icmp ne i8* %incdec.ptr11, %filename
  %3 = and i1 %cmp7, %cmp
  %.pre = load i8, i8* %incdec.ptr11, align 1, !tbaa !38
  %.pre45 = load i8, i8* %incdec.ptr12, align 1, !tbaa !38
  br i1 %3, label %if.end.while.body8_crit_edge, label %while.end13, !llvm.loop !66

if.end.while.body8_crit_edge:                     ; preds = %if.end
  %cmp10.not = icmp eq i8 %.pre, %.pre45
  br i1 %cmp10.not, label %if.end, label %cleanup

while.end13:                                      ; preds = %if.end, %while.cond6.preheader
  %4 = phi i8 [ 0, %while.cond6.preheader ], [ %.pre45, %if.end ]
  %5 = phi i8 [ 0, %while.cond6.preheader ], [ %.pre, %if.end ]
  %cmp16 = icmp eq i8 %5, %4
  br label %cleanup

cleanup:                                          ; preds = %if.end.while.body8_crit_edge, %while.end13
  %retval.0 = phi i1 [ %cmp16, %while.end13 ], [ false, %if.end.while.body8_crit_edge ]
  ret i1 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_debug_to_file(i8* %user_context, i8* %filename, i32 %type_code, %struct.halide_buffer_t* %buf) local_unnamed_addr #4 {
entry:
  %shape = alloca [4 x %struct.halide_dimension_t], align 4
  %header = alloca %"struct.Halide::Runtime::Internal::halide_tiff_header", align 2
  %offset = alloca i32, align 4
  %count = alloca i32, align 4
  %array_name = alloca [256 x i8], align 1
  %array_name42 = getelementptr inbounds [256 x i8], [256 x i8]* %array_name, i64 0, i64 0
  %header198 = alloca [129 x i8], align 1
  %tags = alloca [8 x i32], align 4
  %extents = alloca [4 x i32], align 4
  %name_header = alloca [2 x i32], align 4
  %payload_header = alloca [2 x i32], align 4
  %header289 = alloca [5 x i32], align 4
  %temp = alloca [4096 x i8], align 1
  %idx = alloca [4 x i32], align 4
  %zero = alloca i64, align 8
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 2
  %0 = load i8*, i8** %host.i, align 8, !tbaa !67
  %cmp.i = icmp eq i8* %0, null
  br i1 %cmp.i, label %_ZNK15halide_buffer_t15is_bounds_queryEv.exit, label %if.end

_ZNK15halide_buffer_t15is_bounds_queryEv.exit:    ; preds = %entry
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp2.i = icmp eq i64 %1, 0
  br i1 %cmp2.i, label %if.then, label %if.end

if.then:                                          ; preds = %_ZNK15halide_buffer_t15is_bounds_queryEv.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.34, i64 0, i64 0)) #16
  br label %return

if.end:                                           ; preds = %_ZNK15halide_buffer_t15is_bounds_queryEv.exit, %entry
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !70
  %cmp = icmp sgt i32 %2, 4
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.1.35, i64 0, i64 0)) #16
  br label %return

if.end2:                                          ; preds = %if.end
  %call3 = tail call i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %cmp4.not = icmp eq i32 %call3, 0
  br i1 %cmp4.not, label %if.end6, label %return

if.end6:                                          ; preds = %if.end2
  %call.i598 = tail call i8* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2.36, i64 0, i64 0)) #16
  %cmp.i601.not = icmp eq i8* %call.i598, null
  br i1 %cmp.i601.not, label %return, label %if.end9

if.end9:                                          ; preds = %if.end6
  %3 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #11
  %min.i = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 0, i32 0
  %extent.i = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 0, i32 1
  %min.i.1 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 1, i32 0
  %extent.i.1 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 1, i32 1
  %4 = bitcast [4 x %struct.halide_dimension_t]* %shape to <8 x i32>*
  store <8 x i32> zeroinitializer, <8 x i32>* %4, align 4, !tbaa !16
  %min.i.2 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 2, i32 0
  %extent.i.2 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 2, i32 1
  %min.i.3 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 3, i32 0
  %extent.i.3 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 3, i32 1
  %5 = bitcast i32* %min.i.2 to <8 x i32>*
  store <8 x i32> zeroinitializer, <8 x i32>* %5, align 4, !tbaa !16
  %6 = load i32, i32* %dimensions, align 4, !tbaa !70
  %cmp11875 = icmp sgt i32 %6, 0
  br i1 %cmp11875, label %for.body.lr.ph, label %for.body22.preheader

for.body.lr.ph:                                   ; preds = %if.end9
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 6
  %7 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !71
  %8 = zext i32 %6 to i64
  %9 = add nsw i64 %8, -1
  %10 = icmp ult i64 %9, 3
  %11 = select i1 %10, i64 %8, i64 4
  %12 = bitcast [4 x %struct.halide_dimension_t]* %shape to i8*
  %13 = bitcast %struct.halide_dimension_t* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %12, i8* nonnull align 4 dereferenceable(16) %13, i64 16, i1 false), !tbaa.struct !72
  %extent = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 0, i32 1
  %14 = load i32, i32* %extent, align 4, !tbaa !73
  %conv903 = zext i32 %14 to i64
  %exitcond.not17 = icmp eq i64 %11, 1
  br i1 %exitcond.not17, label %for.cond19.preheader, label %for.body.1, !llvm.loop !75

for.cond19.preheader:                             ; preds = %for.body.3, %for.body.2, %for.body.1, %for.body.lr.ph
  %mul.lcssa = phi i64 [ %conv903, %for.body.lr.ph ], [ %mul.1, %for.body.1 ], [ %mul.2, %for.body.2 ], [ %mul.3, %for.body.3 ]
  %cmp20873 = icmp slt i32 %6, 4
  br i1 %cmp20873, label %for.body22.preheader, label %for.cond.cleanup21

for.body22.preheader:                             ; preds = %for.cond19.preheader, %if.end9
  %elts.0.lcssa907 = phi i64 [ %mul.lcssa, %for.cond19.preheader ], [ 1, %if.end9 ]
  %15 = sext i32 %6 to i64
  %16 = sub i32 3, %6
  %17 = zext i32 %16 to i64
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i32 %16, 7
  br i1 %min.iters.check, label %for.body22.preheader214, label %vector.ph

vector.ph:                                        ; preds = %for.body22.preheader
  %n.vec = and i64 %18, 8589934584
  %ind.end = add nsw i64 %n.vec, %15
  %.splatinsert = insertelement <8 x i64> poison, i64 %15, i32 0
  %.splat = shufflevector <8 x i64> %.splatinsert, <8 x i64> poison, <8 x i32> zeroinitializer
  %induction = add <8 x i64> %.splat, <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7>
  %19 = add nsw i64 %n.vec, -8
  %20 = lshr exact i64 %19, 3
  %21 = add nuw nsw i64 %20, 1
  %xtraiter = and i64 %21, 3
  %22 = icmp ult i64 %19, 24
  br i1 %22, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %21, 4611686018427387900
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %vec.ind = phi <8 x i64> [ %induction, %vector.ph.new ], [ %vec.ind.next.3, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.3, %vector.body ]
  %23 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %23, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !76
  %24 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %24, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !73
  %25 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %25, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !77
  %vec.ind.next = add <8 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8>
  %26 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %26, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !76
  %27 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %27, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !73
  %28 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %28, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !77
  %vec.ind.next.1 = add <8 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16>
  %29 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next.1, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %29, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !76
  %30 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next.1, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %30, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !73
  %31 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next.1, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %31, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !77
  %vec.ind.next.2 = add <8 x i64> %vec.ind, <i64 24, i64 24, i64 24, i64 24, i64 24, i64 24, i64 24, i64 24>
  %32 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next.2, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %32, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !76
  %33 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next.2, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %33, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !73
  %34 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.next.2, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %34, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !77
  %vec.ind.next.3 = add <8 x i64> %vec.ind, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !78

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %vec.ind.unr = phi <8 x i64> [ %induction, %vector.ph ], [ %vec.ind.next.3, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %vec.ind.epil = phi <8 x i64> [ %vec.ind.next.epil, %vector.body.epil ], [ %vec.ind.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %vector.body.epil ], [ %xtraiter, %middle.block.unr-lcssa ]
  %35 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.epil, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %35, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !76
  %36 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.epil, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %36, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !73
  %37 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, <8 x i64> %vec.ind.epil, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %37, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !77
  %vec.ind.next.epil = add <8 x i64> %vec.ind.epil, <i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8>
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %middle.block, label %vector.body.epil, !llvm.loop !80

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %18, %n.vec
  br i1 %cmp.n, label %for.cond.cleanup21, label %for.body22.preheader214

for.body22.preheader214:                          ; preds = %for.body22.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %15, %for.body22.preheader ], [ %ind.end, %middle.block ]
  br label %for.body22

for.cond.cleanup21:                               ; preds = %for.body22, %middle.block, %for.cond19.preheader
  %elts.0.lcssa906 = phi i64 [ %mul.lcssa, %for.cond19.preheader ], [ %elts.0.lcssa907, %middle.block ], [ %elts.0.lcssa907, %for.body22 ]
  %bits.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 4, i32 1
  %38 = load i8, i8* %bits.i, align 1, !tbaa !28
  %conv.i = zext i8 %38 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %call34 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %filename, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3.37, i64 0, i64 0)) #17
  br i1 %call34, label %if.then36, label %lor.lhs.false

for.body22:                                       ; preds = %for.body22.preheader214, %for.body22
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body22 ], [ %indvars.iv.ph, %for.body22.preheader214 ]
  %min = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 %indvars.iv, i32 0
  store i32 0, i32* %min, align 4, !tbaa !76
  %extent27 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 %indvars.iv, i32 1
  store i32 1, i32* %extent27, align 4, !tbaa !73
  %stride = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 %indvars.iv, i32 2
  store i32 0, i32* %stride, align 4, !tbaa !77
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond886.not = icmp eq i32 %lftr.wideiv, 4
  br i1 %exitcond886.not, label %for.cond.cleanup21, label %for.body22, !llvm.loop !82

lor.lhs.false:                                    ; preds = %for.cond.cleanup21
  %call35 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %filename, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.38, i64 0, i64 0)) #17
  br i1 %call35, label %if.then36, label %if.else164

if.then36:                                        ; preds = %lor.lhs.false, %for.cond.cleanup21
  %39 = load i32, i32* %extent.i, align 4, !tbaa !73
  %40 = load i32, i32* %extent.i.1, align 4, !tbaa !73
  %41 = load i32, i32* %extent.i.3, align 4, !tbaa !73
  %switch = icmp ult i32 %41, 2
  %42 = load i32, i32* %extent.i.2, align 4, !tbaa !73
  %cmp50 = icmp slt i32 %42, 5
  %or.cond = and i1 %switch, %cmp50
  %depth.0 = select i1 %or.cond, i32 1, i32 %42
  %channels.0 = select i1 %or.cond, i32 %42, i32 %41
  %43 = bitcast %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header to i8*
  call void @llvm.lifetime.start.p0i8(i64 210, i8* nonnull %43) #11
  %byte_order_marker = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 0
  store i16 18761, i16* %byte_order_marker, align 2, !tbaa !84
  %version = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 1
  store i16 42, i16* %version, align 2, !tbaa !86
  %ifd0_offset = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 2
  store i32 8, i32* %ifd0_offset, align 2, !tbaa !87
  %entry_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 3
  store i16 15, i16* %entry_count, align 2, !tbaa !88
  %tag_code2.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 0, i32 0
  store i16 256, i16* %tag_code2.i, align 2, !tbaa !89
  %type_code.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 0, i32 1
  store i16 4, i16* %type_code.i, align 2, !tbaa !91
  %count3.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 0, i32 2
  store i32 1, i32* %count3.i, align 2, !tbaa !92
  %i32.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 0, i32 3, i32 0
  store i32 %39, i32* %i32.i, align 2, !tbaa !38
  %tag_code2.i632 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 1, i32 0
  store i16 257, i16* %tag_code2.i632, align 2, !tbaa !89
  %type_code.i633 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 1, i32 1
  store i16 4, i16* %type_code.i633, align 2, !tbaa !91
  %count3.i634 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 1, i32 2
  store i32 1, i32* %count3.i634, align 2, !tbaa !92
  %i32.i635 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 1, i32 3, i32 0
  store i32 %40, i32* %i32.i635, align 2, !tbaa !38
  %44 = trunc i32 %add.i to i16
  %conv68 = and i16 %44, 504
  %tag_code2.i643 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 2, i32 0
  store i16 258, i16* %tag_code2.i643, align 2, !tbaa !89
  %type_code.i644 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 2, i32 1
  store i16 3, i16* %type_code.i644, align 2, !tbaa !91
  %count3.i645 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 2, i32 2
  store i32 1, i32* %count3.i645, align 2, !tbaa !92
  %value4.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 2, i32 3
  %i16.i = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %value4.i to i16*
  store i16 %conv68, i16* %i16.i, align 2, !tbaa !38
  %tag_code2.i653 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 3, i32 0
  store i16 259, i16* %tag_code2.i653, align 2, !tbaa !89
  %type_code.i654 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 3, i32 1
  store i16 3, i16* %type_code.i654, align 2, !tbaa !91
  %count3.i655 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 3, i32 2
  store i32 1, i32* %count3.i655, align 2, !tbaa !92
  %value4.i656 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 3, i32 3
  %i16.i657 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %value4.i656 to i16*
  store i16 1, i16* %i16.i657, align 2, !tbaa !38
  %cmp71 = icmp sgt i32 %channels.0, 2
  %conv72 = select i1 %cmp71, i16 2, i16 1
  %tag_code2.i665 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 4, i32 0
  store i16 262, i16* %tag_code2.i665, align 2, !tbaa !89
  %type_code.i666 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 4, i32 1
  store i16 3, i16* %type_code.i666, align 2, !tbaa !91
  %count3.i667 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 4, i32 2
  store i32 1, i32* %count3.i667, align 2, !tbaa !92
  %value4.i668 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 4, i32 3
  %i16.i669 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %value4.i668 to i16*
  store i16 %conv72, i16* %i16.i669, align 2, !tbaa !38
  %tag_code2.i677 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 5, i32 0
  store i16 273, i16* %tag_code2.i677, align 2, !tbaa !89
  %type_code.i678 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 5, i32 1
  store i16 4, i16* %type_code.i678, align 2, !tbaa !91
  %count3.i679 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 5, i32 2
  store i32 %channels.0, i32* %count3.i679, align 2, !tbaa !92
  %i32.i680 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 5, i32 3, i32 0
  store i32 210, i32* %i32.i680, align 2, !tbaa !38
  %conv75 = trunc i32 %channels.0 to i16
  %tag_code2.i688 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 6, i32 0
  store i16 277, i16* %tag_code2.i688, align 2, !tbaa !89
  %type_code.i689 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 6, i32 1
  store i16 3, i16* %type_code.i689, align 2, !tbaa !91
  %count3.i690 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 6, i32 2
  store i32 1, i32* %count3.i690, align 2, !tbaa !92
  %value4.i691 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 6, i32 3
  %i16.i692 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %value4.i691 to i16*
  store i16 %conv75, i16* %i16.i692, align 2, !tbaa !38
  %tag_code2.i706 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 7, i32 0
  store i16 278, i16* %tag_code2.i706, align 2, !tbaa !89
  %type_code.i707 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 7, i32 1
  store i16 4, i16* %type_code.i707, align 2, !tbaa !91
  %count3.i708 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 7, i32 2
  store i32 1, i32* %count3.i708, align 2, !tbaa !92
  %i32.i709 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 7, i32 3, i32 0
  store i32 %40, i32* %i32.i709, align 2, !tbaa !38
  %cmp80 = icmp eq i32 %channels.0, 1
  %45 = trunc i64 %elts.0.lcssa906 to i32
  %conv86595 = mul i32 %div.i, %45
  %mul84 = shl i32 %channels.0, 2
  %add = add i32 %mul84, 210
  %add.sink = select i1 %cmp80, i32 %conv86595, i32 %add
  %46 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 8, i32 0
  store i16 279, i16* %46, align 2
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 8, i32 1
  store i16 4, i16* %47, align 2
  %48 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 8, i32 2
  store i32 %channels.0, i32* %48, align 2
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 8, i32 3, i32 0
  store i32 %add.sink, i32* %49, align 2
  %tag_code2.i732 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 9, i32 0
  store i16 282, i16* %tag_code2.i732, align 2, !tbaa !89
  %type_code3.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 9, i32 1
  store i16 5, i16* %type_code3.i, align 2, !tbaa !91
  %count4.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 9, i32 2
  store i32 1, i32* %count4.i, align 2, !tbaa !92
  %i32.i733 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 9, i32 3, i32 0
  store i32 194, i32* %i32.i733, align 2, !tbaa !38
  %tag_code2.i741 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 10, i32 0
  store i16 283, i16* %tag_code2.i741, align 2, !tbaa !89
  %type_code3.i742 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 10, i32 1
  store i16 5, i16* %type_code3.i742, align 2, !tbaa !91
  %count4.i743 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 10, i32 2
  store i32 1, i32* %count4.i743, align 2, !tbaa !92
  %i32.i744 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 10, i32 3, i32 0
  store i32 202, i32* %i32.i744, align 2, !tbaa !38
  %tag_code2.i759 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 11, i32 0
  store i16 284, i16* %tag_code2.i759, align 2, !tbaa !89
  %type_code.i760 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 11, i32 1
  store i16 3, i16* %type_code.i760, align 2, !tbaa !91
  %count3.i761 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 11, i32 2
  store i32 1, i32* %count3.i761, align 2, !tbaa !92
  %value4.i762 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 11, i32 3
  %i16.i763 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %value4.i762 to i16*
  store i16 2, i16* %i16.i763, align 2, !tbaa !38
  %tag_code2.i754 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 12, i32 0
  store i16 296, i16* %tag_code2.i754, align 2, !tbaa !89
  %type_code.i755 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 12, i32 1
  store i16 3, i16* %type_code.i755, align 2, !tbaa !91
  %count3.i756 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 12, i32 2
  store i32 1, i32* %count3.i756, align 2, !tbaa !92
  %value4.i757 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 12, i32 3
  %i16.i758 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %value4.i757 to i16*
  store i16 1, i16* %i16.i758, align 2, !tbaa !38
  %idxprom92 = sext i32 %type_code to i64
  %arrayidx93 = getelementptr inbounds [10 x i16], [10 x i16]* @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, i64 0, i64 %idxprom92
  %50 = load i16, i16* %arrayidx93, align 2, !tbaa !54
  %tag_code2.i749 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 13, i32 0
  store i16 339, i16* %tag_code2.i749, align 2, !tbaa !89
  %type_code.i750 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 13, i32 1
  store i16 3, i16* %type_code.i750, align 2, !tbaa !91
  %count3.i751 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 13, i32 2
  store i32 1, i32* %count3.i751, align 2, !tbaa !92
  %value4.i752 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 13, i32 3
  %i16.i753 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %value4.i752 to i16*
  store i16 %50, i16* %i16.i753, align 2, !tbaa !38
  %tag_code2.i745 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 14, i32 0
  store i16 -32539, i16* %tag_code2.i745, align 2, !tbaa !89
  %type_code.i746 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 14, i32 1
  store i16 4, i16* %type_code.i746, align 2, !tbaa !91
  %count3.i747 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 14, i32 2
  store i32 1, i32* %count3.i747, align 2, !tbaa !92
  %i32.i748 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 4, i64 14, i32 3, i32 0
  store i32 %depth.0, i32* %i32.i748, align 2, !tbaa !38
  %ifd0_end = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 5
  %51 = bitcast i32* %ifd0_end to <4 x i32>*
  store <4 x i32> <i32 0, i32 1, i32 1, i32 1>, <4 x i32>* %51, align 2, !tbaa !16
  %arrayidx100 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %header, i64 0, i32 7, i64 1
  store i32 1, i32* %arrayidx100, align 2, !tbaa !16
  %call.i736 = call i64 @fwrite(i8* nonnull %43, i64 210, i64 1, i8* nonnull %call.i598) #16
  %cmp.i737.not = icmp eq i64 %call.i736, 0
  br i1 %cmp.i737.not, label %cleanup154, label %if.end103

if.end103:                                        ; preds = %if.then36
  %cmp104 = icmp sgt i32 %channels.0, 1
  br i1 %cmp104, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731.lr.ph, label %cleanup154.thread

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731.lr.ph: ; preds = %if.end103
  %52 = bitcast i32* %offset to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %52) #11
  %mul108 = shl i32 %channels.0, 3
  %add109 = add i32 %mul108, 210
  store i32 %add109, i32* %offset, align 4, !tbaa !16
  %mul123 = mul i32 %depth.0, %div.i
  br label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731: ; preds = %if.end118, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731.lr.ph
  %i111.0865 = phi i32 [ 0, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731.lr.ph ], [ %inc128, %if.end118 ]
  %call.i727 = call i64 @fwrite(i8* nonnull %52, i64 4, i64 1, i8* nonnull %call.i598) #16
  %cmp.i728.not = icmp eq i64 %call.i727, 0
  br i1 %cmp.i728.not, label %cleanup151.thread, label %if.end118

if.end118:                                        ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731
  %53 = load i32, i32* %extent.i, align 4, !tbaa !73
  %54 = load i32, i32* %extent.i.1, align 4, !tbaa !73
  %mul124 = mul i32 %mul123, %53
  %mul125 = mul i32 %mul124, %54
  %55 = load i32, i32* %offset, align 4, !tbaa !16
  %add126 = add nsw i32 %mul125, %55
  store i32 %add126, i32* %offset, align 4, !tbaa !16
  %inc128 = add nuw nsw i32 %i111.0865, 1
  %exitcond881.not = icmp eq i32 %inc128, %channels.0
  br i1 %exitcond881.not, label %for.end129, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731, !llvm.loop !93

for.end129:                                       ; preds = %if.end118
  %56 = bitcast i32* %count to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %56) #11
  store i32 %mul125, i32* %count, align 4, !tbaa !16
  br label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit720

for.cond138:                                      ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit720
  %exitcond.not = icmp eq i32 %inc146, %channels.0
  br i1 %exitcond.not, label %cleanup151, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit720, !llvm.loop !94

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit720: ; preds = %for.end129, %for.cond138
  %i137.0863 = phi i32 [ %inc146, %for.cond138 ], [ 0, %for.end129 ]
  %call.i716 = call i64 @fwrite(i8* nonnull %56, i64 4, i64 1, i8* nonnull %call.i598) #16
  %cmp.i717.not = icmp eq i64 %call.i716, 0
  %inc146 = add nuw nsw i32 %i137.0863, 1
  br i1 %cmp.i717.not, label %select.unfold, label %for.cond138

select.unfold:                                    ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit720
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %56) #11
  br label %cleanup151.thread

cleanup151.thread:                                ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731, %select.unfold
  %retval.2.ph = phi i32 [ -5, %select.unfold ], [ -4, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit731 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %52) #11
  br label %cleanup154

cleanup151:                                       ; preds = %for.cond138
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %56) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %52) #11
  br label %cleanup154.thread

cleanup154.thread:                                ; preds = %cleanup151, %if.end103
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %43) #11
  br label %if.end311

cleanup154:                                       ; preds = %cleanup151.thread, %if.then36
  %retval.4 = phi i32 [ -3, %if.then36 ], [ %retval.2.ph, %cleanup151.thread ]
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %43) #11
  br label %cleanup433

if.else164:                                       ; preds = %lor.lhs.false
  %call165 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %filename, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5.39, i64 0, i64 0)) #17
  br i1 %call165, label %while.cond, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit631

while.cond:                                       ; preds = %if.else164, %while.cond
  %end.0 = phi i8* [ %incdec.ptr167, %while.cond ], [ %filename, %if.else164 ]
  %57 = load i8, i8* %end.0, align 1, !tbaa !38
  %tobool.not = icmp eq i8 %57, 0
  %incdec.ptr167 = getelementptr inbounds i8, i8* %end.0, i64 1
  br i1 %tobool.not, label %while.body171, label %while.cond, !llvm.loop !95

while.cond174.preheader:                          ; preds = %while.body171
  %end.1872.lcssa883 = ptrtoint i8* %end.1872 to i64
  %58 = ptrtoint i8* %filename to i64
  %59 = sub i64 %58, %end.1872.lcssa883
  br label %while.cond174

while.body171:                                    ; preds = %while.cond, %while.body171
  %end.1872 = phi i8* [ %incdec.ptr172.ptr, %while.body171 ], [ %end.0, %while.cond ]
  %incdec.ptr172.ptr = getelementptr inbounds i8, i8* %end.1872, i64 -1
  %.pr = load i8, i8* %incdec.ptr172.ptr, align 1, !tbaa !38
  %cmp170.not = icmp eq i8 %.pr, 46
  br i1 %cmp170.not, label %while.cond174.preheader, label %while.body171, !llvm.loop !96

while.cond174:                                    ; preds = %land.rhs176, %while.cond174.preheader
  %start.0.idx = phi i64 [ %start.0.add, %land.rhs176 ], [ -1, %while.cond174.preheader ]
  %start.0.ptr.ptr = getelementptr inbounds i8, i8* %end.1872, i64 %start.0.idx
  %cmp175.not = icmp eq i8* %start.0.ptr.ptr, %filename
  br i1 %cmp175.not, label %while.end183, label %land.rhs176

land.rhs176:                                      ; preds = %while.cond174
  %start.0.add = add nsw i64 %start.0.idx, -1
  %arrayidx177.ptr = getelementptr inbounds i8, i8* %end.1872, i64 %start.0.add
  %60 = load i8, i8* %arrayidx177.ptr, align 1, !tbaa !38
  %cmp179.not = icmp eq i8 %60, 47
  br i1 %cmp179.not, label %while.end183, label %while.cond174, !llvm.loop !97

while.end183:                                     ; preds = %land.rhs176, %while.cond174
  %start.0.idx.lcssa = phi i64 [ %59, %while.cond174 ], [ %start.0.idx, %land.rhs176 ]
  %61 = trunc i64 %start.0.idx.lcssa to i32
  %conv184 = xor i32 %61, -1
  %62 = getelementptr inbounds [256 x i8], [256 x i8]* %array_name, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %62) #11
  %cmp186.not868 = icmp eq i64 %start.0.idx.lcssa, -1
  br i1 %cmp186.not868, label %iter.check, label %while.body187.preheader

while.body187.preheader:                          ; preds = %while.end183
  %63 = xor i64 %start.0.idx.lcssa, -1
  %min.iters.check39 = icmp ugt i64 %start.0.idx.lcssa, -129
  br i1 %min.iters.check39, label %while.body187.preheader212, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body187.preheader
  %64 = xor i64 %start.0.idx.lcssa, -1
  %scevgep43 = getelementptr [256 x i8], [256 x i8]* %array_name, i64 0, i64 %64
  %scevgep44 = getelementptr i8, i8* %end.1872, i64 %start.0.idx.lcssa
  %scevgep45 = getelementptr i8, i8* %end.1872, i64 -1
  %bound0 = icmp ult i8* %array_name42, %scevgep45
  %bound1 = icmp ult i8* %scevgep44, %scevgep43
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %while.body187.preheader212, label %vector.ph41

vector.ph41:                                      ; preds = %vector.memcheck
  %n.vec47 = and i64 %63, -128
  %ind.end51 = getelementptr [256 x i8], [256 x i8]* %array_name, i64 0, i64 %n.vec47
  %ind.end53 = add i64 %start.0.idx.lcssa, %n.vec47
  %65 = add i64 %n.vec47, -128
  %66 = lshr exact i64 %65, 7
  %67 = add nuw nsw i64 %66, 1
  %xtraiter215 = and i64 %67, 3
  %68 = icmp ult i64 %65, 384
  br i1 %68, label %middle.block36.unr-lcssa, label %vector.ph41.new

vector.ph41.new:                                  ; preds = %vector.ph41
  %unroll_iter218 = and i64 %67, 288230376151711740
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38, %vector.ph41.new
  %index48 = phi i64 [ 0, %vector.ph41.new ], [ %index.next49.3, %vector.body38 ]
  %niter219 = phi i64 [ %unroll_iter218, %vector.ph41.new ], [ %niter219.nsub.3, %vector.body38 ]
  %next.gep = getelementptr [256 x i8], [256 x i8]* %array_name, i64 0, i64 %index48
  %offset.idx = add i64 %start.0.idx.lcssa, %index48
  %69 = getelementptr inbounds i8, i8* %end.1872, i64 %offset.idx
  %70 = bitcast i8* %69 to <32 x i8>*
  %wide.load = load <32 x i8>, <32 x i8>* %70, align 1, !tbaa !38, !alias.scope !98
  %71 = getelementptr inbounds i8, i8* %69, i64 32
  %72 = bitcast i8* %71 to <32 x i8>*
  %wide.load58 = load <32 x i8>, <32 x i8>* %72, align 1, !tbaa !38, !alias.scope !98
  %73 = getelementptr inbounds i8, i8* %69, i64 64
  %74 = bitcast i8* %73 to <32 x i8>*
  %wide.load59 = load <32 x i8>, <32 x i8>* %74, align 1, !tbaa !38, !alias.scope !98
  %75 = getelementptr inbounds i8, i8* %69, i64 96
  %76 = bitcast i8* %75 to <32 x i8>*
  %wide.load60 = load <32 x i8>, <32 x i8>* %76, align 1, !tbaa !38, !alias.scope !98
  %77 = bitcast i8* %next.gep to <32 x i8>*
  store <32 x i8> %wide.load, <32 x i8>* %77, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %78 = getelementptr i8, i8* %next.gep, i64 32
  %79 = bitcast i8* %78 to <32 x i8>*
  store <32 x i8> %wide.load58, <32 x i8>* %79, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %80 = getelementptr i8, i8* %next.gep, i64 64
  %81 = bitcast i8* %80 to <32 x i8>*
  store <32 x i8> %wide.load59, <32 x i8>* %81, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %82 = getelementptr i8, i8* %next.gep, i64 96
  %83 = bitcast i8* %82 to <32 x i8>*
  store <32 x i8> %wide.load60, <32 x i8>* %83, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %index.next49 = or i64 %index48, 128
  %next.gep.1 = getelementptr [256 x i8], [256 x i8]* %array_name, i64 0, i64 %index.next49
  %offset.idx.1 = add i64 %start.0.idx.lcssa, %index.next49
  %84 = getelementptr inbounds i8, i8* %end.1872, i64 %offset.idx.1
  %85 = bitcast i8* %84 to <32 x i8>*
  %wide.load.1 = load <32 x i8>, <32 x i8>* %85, align 1, !tbaa !38, !alias.scope !98
  %86 = getelementptr inbounds i8, i8* %84, i64 32
  %87 = bitcast i8* %86 to <32 x i8>*
  %wide.load58.1 = load <32 x i8>, <32 x i8>* %87, align 1, !tbaa !38, !alias.scope !98
  %88 = getelementptr inbounds i8, i8* %84, i64 64
  %89 = bitcast i8* %88 to <32 x i8>*
  %wide.load59.1 = load <32 x i8>, <32 x i8>* %89, align 1, !tbaa !38, !alias.scope !98
  %90 = getelementptr inbounds i8, i8* %84, i64 96
  %91 = bitcast i8* %90 to <32 x i8>*
  %wide.load60.1 = load <32 x i8>, <32 x i8>* %91, align 1, !tbaa !38, !alias.scope !98
  %92 = bitcast i8* %next.gep.1 to <32 x i8>*
  store <32 x i8> %wide.load.1, <32 x i8>* %92, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %93 = getelementptr i8, i8* %next.gep.1, i64 32
  %94 = bitcast i8* %93 to <32 x i8>*
  store <32 x i8> %wide.load58.1, <32 x i8>* %94, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %95 = getelementptr i8, i8* %next.gep.1, i64 64
  %96 = bitcast i8* %95 to <32 x i8>*
  store <32 x i8> %wide.load59.1, <32 x i8>* %96, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %97 = getelementptr i8, i8* %next.gep.1, i64 96
  %98 = bitcast i8* %97 to <32 x i8>*
  store <32 x i8> %wide.load60.1, <32 x i8>* %98, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %index.next49.1 = or i64 %index48, 256
  %next.gep.2 = getelementptr [256 x i8], [256 x i8]* %array_name, i64 0, i64 %index.next49.1
  %offset.idx.2 = add i64 %start.0.idx.lcssa, %index.next49.1
  %99 = getelementptr inbounds i8, i8* %end.1872, i64 %offset.idx.2
  %100 = bitcast i8* %99 to <32 x i8>*
  %wide.load.2 = load <32 x i8>, <32 x i8>* %100, align 1, !tbaa !38, !alias.scope !98
  %101 = getelementptr inbounds i8, i8* %99, i64 32
  %102 = bitcast i8* %101 to <32 x i8>*
  %wide.load58.2 = load <32 x i8>, <32 x i8>* %102, align 1, !tbaa !38, !alias.scope !98
  %103 = getelementptr inbounds i8, i8* %99, i64 64
  %104 = bitcast i8* %103 to <32 x i8>*
  %wide.load59.2 = load <32 x i8>, <32 x i8>* %104, align 1, !tbaa !38, !alias.scope !98
  %105 = getelementptr inbounds i8, i8* %99, i64 96
  %106 = bitcast i8* %105 to <32 x i8>*
  %wide.load60.2 = load <32 x i8>, <32 x i8>* %106, align 1, !tbaa !38, !alias.scope !98
  %107 = bitcast i8* %next.gep.2 to <32 x i8>*
  store <32 x i8> %wide.load.2, <32 x i8>* %107, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %108 = getelementptr i8, i8* %next.gep.2, i64 32
  %109 = bitcast i8* %108 to <32 x i8>*
  store <32 x i8> %wide.load58.2, <32 x i8>* %109, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %110 = getelementptr i8, i8* %next.gep.2, i64 64
  %111 = bitcast i8* %110 to <32 x i8>*
  store <32 x i8> %wide.load59.2, <32 x i8>* %111, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %112 = getelementptr i8, i8* %next.gep.2, i64 96
  %113 = bitcast i8* %112 to <32 x i8>*
  store <32 x i8> %wide.load60.2, <32 x i8>* %113, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %index.next49.2 = or i64 %index48, 384
  %next.gep.3 = getelementptr [256 x i8], [256 x i8]* %array_name, i64 0, i64 %index.next49.2
  %offset.idx.3 = add i64 %start.0.idx.lcssa, %index.next49.2
  %114 = getelementptr inbounds i8, i8* %end.1872, i64 %offset.idx.3
  %115 = bitcast i8* %114 to <32 x i8>*
  %wide.load.3 = load <32 x i8>, <32 x i8>* %115, align 1, !tbaa !38, !alias.scope !98
  %116 = getelementptr inbounds i8, i8* %114, i64 32
  %117 = bitcast i8* %116 to <32 x i8>*
  %wide.load58.3 = load <32 x i8>, <32 x i8>* %117, align 1, !tbaa !38, !alias.scope !98
  %118 = getelementptr inbounds i8, i8* %114, i64 64
  %119 = bitcast i8* %118 to <32 x i8>*
  %wide.load59.3 = load <32 x i8>, <32 x i8>* %119, align 1, !tbaa !38, !alias.scope !98
  %120 = getelementptr inbounds i8, i8* %114, i64 96
  %121 = bitcast i8* %120 to <32 x i8>*
  %wide.load60.3 = load <32 x i8>, <32 x i8>* %121, align 1, !tbaa !38, !alias.scope !98
  %122 = bitcast i8* %next.gep.3 to <32 x i8>*
  store <32 x i8> %wide.load.3, <32 x i8>* %122, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %123 = getelementptr i8, i8* %next.gep.3, i64 32
  %124 = bitcast i8* %123 to <32 x i8>*
  store <32 x i8> %wide.load58.3, <32 x i8>* %124, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %125 = getelementptr i8, i8* %next.gep.3, i64 64
  %126 = bitcast i8* %125 to <32 x i8>*
  store <32 x i8> %wide.load59.3, <32 x i8>* %126, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %127 = getelementptr i8, i8* %next.gep.3, i64 96
  %128 = bitcast i8* %127 to <32 x i8>*
  store <32 x i8> %wide.load60.3, <32 x i8>* %128, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %index.next49.3 = add i64 %index48, 512
  %niter219.nsub.3 = add i64 %niter219, -4
  %niter219.ncmp.3 = icmp eq i64 %niter219.nsub.3, 0
  br i1 %niter219.ncmp.3, label %middle.block36.unr-lcssa, label %vector.body38, !llvm.loop !103

middle.block36.unr-lcssa:                         ; preds = %vector.body38, %vector.ph41
  %index48.unr = phi i64 [ 0, %vector.ph41 ], [ %index.next49.3, %vector.body38 ]
  %lcmp.mod217.not = icmp eq i64 %xtraiter215, 0
  br i1 %lcmp.mod217.not, label %middle.block36, label %vector.body38.epil

vector.body38.epil:                               ; preds = %middle.block36.unr-lcssa, %vector.body38.epil
  %index48.epil = phi i64 [ %index.next49.epil, %vector.body38.epil ], [ %index48.unr, %middle.block36.unr-lcssa ]
  %epil.iter216 = phi i64 [ %epil.iter216.sub, %vector.body38.epil ], [ %xtraiter215, %middle.block36.unr-lcssa ]
  %next.gep.epil = getelementptr [256 x i8], [256 x i8]* %array_name, i64 0, i64 %index48.epil
  %offset.idx.epil = add i64 %start.0.idx.lcssa, %index48.epil
  %129 = getelementptr inbounds i8, i8* %end.1872, i64 %offset.idx.epil
  %130 = bitcast i8* %129 to <32 x i8>*
  %wide.load.epil = load <32 x i8>, <32 x i8>* %130, align 1, !tbaa !38, !alias.scope !98
  %131 = getelementptr inbounds i8, i8* %129, i64 32
  %132 = bitcast i8* %131 to <32 x i8>*
  %wide.load58.epil = load <32 x i8>, <32 x i8>* %132, align 1, !tbaa !38, !alias.scope !98
  %133 = getelementptr inbounds i8, i8* %129, i64 64
  %134 = bitcast i8* %133 to <32 x i8>*
  %wide.load59.epil = load <32 x i8>, <32 x i8>* %134, align 1, !tbaa !38, !alias.scope !98
  %135 = getelementptr inbounds i8, i8* %129, i64 96
  %136 = bitcast i8* %135 to <32 x i8>*
  %wide.load60.epil = load <32 x i8>, <32 x i8>* %136, align 1, !tbaa !38, !alias.scope !98
  %137 = bitcast i8* %next.gep.epil to <32 x i8>*
  store <32 x i8> %wide.load.epil, <32 x i8>* %137, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %138 = getelementptr i8, i8* %next.gep.epil, i64 32
  %139 = bitcast i8* %138 to <32 x i8>*
  store <32 x i8> %wide.load58.epil, <32 x i8>* %139, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %140 = getelementptr i8, i8* %next.gep.epil, i64 64
  %141 = bitcast i8* %140 to <32 x i8>*
  store <32 x i8> %wide.load59.epil, <32 x i8>* %141, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %142 = getelementptr i8, i8* %next.gep.epil, i64 96
  %143 = bitcast i8* %142 to <32 x i8>*
  store <32 x i8> %wide.load60.epil, <32 x i8>* %143, align 1, !tbaa !38, !alias.scope !101, !noalias !98
  %index.next49.epil = add i64 %index48.epil, 128
  %epil.iter216.sub = add i64 %epil.iter216, -1
  %epil.iter216.cmp.not = icmp eq i64 %epil.iter216.sub, 0
  br i1 %epil.iter216.cmp.not, label %middle.block36, label %vector.body38.epil, !llvm.loop !104

middle.block36:                                   ; preds = %vector.body38.epil, %middle.block36.unr-lcssa
  %cmp.n54 = icmp eq i64 %n.vec47, %63
  br i1 %cmp.n54, label %while.cond191.preheader, label %while.body187.preheader212

while.body187.preheader212:                       ; preds = %vector.memcheck, %while.body187.preheader, %middle.block36
  %dst.0870.ph = phi i8* [ %62, %vector.memcheck ], [ %62, %while.body187.preheader ], [ %ind.end51, %middle.block36 ]
  %start.1869.idx.ph = phi i64 [ %start.0.idx.lcssa, %vector.memcheck ], [ %start.0.idx.lcssa, %while.body187.preheader ], [ %ind.end53, %middle.block36 ]
  %144 = sub i64 -2, %start.1869.idx.ph
  %145 = and i64 %start.1869.idx.ph, 7
  %xtraiter220 = xor i64 %145, 7
  %lcmp.mod221.not = icmp eq i64 %xtraiter220, 0
  br i1 %lcmp.mod221.not, label %while.body187.prol.loopexit, label %while.body187.prol

while.body187.prol:                               ; preds = %while.body187.preheader212, %while.body187.prol
  %dst.0870.prol = phi i8* [ %incdec.ptr189.prol, %while.body187.prol ], [ %dst.0870.ph, %while.body187.preheader212 ]
  %start.1869.idx.prol = phi i64 [ %start.1869.add.prol, %while.body187.prol ], [ %start.1869.idx.ph, %while.body187.preheader212 ]
  %prol.iter = phi i64 [ %prol.iter.sub, %while.body187.prol ], [ %xtraiter220, %while.body187.preheader212 ]
  %start.1869.ptr.prol = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.idx.prol
  %start.1869.add.prol = add nuw nsw i64 %start.1869.idx.prol, 1
  %146 = load i8, i8* %start.1869.ptr.prol, align 1, !tbaa !38
  %incdec.ptr189.prol = getelementptr inbounds i8, i8* %dst.0870.prol, i64 1
  store i8 %146, i8* %dst.0870.prol, align 1, !tbaa !38
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %while.body187.prol.loopexit, label %while.body187.prol, !llvm.loop !105

while.body187.prol.loopexit:                      ; preds = %while.body187.prol, %while.body187.preheader212
  %incdec.ptr189.lcssa213.unr = phi i8* [ undef, %while.body187.preheader212 ], [ %incdec.ptr189.prol, %while.body187.prol ]
  %dst.0870.unr = phi i8* [ %dst.0870.ph, %while.body187.preheader212 ], [ %incdec.ptr189.prol, %while.body187.prol ]
  %start.1869.idx.unr = phi i64 [ %start.1869.idx.ph, %while.body187.preheader212 ], [ %start.1869.add.prol, %while.body187.prol ]
  %147 = icmp ult i64 %144, 7
  br i1 %147, label %while.cond191.preheader, label %while.body187

while.cond191.preheader:                          ; preds = %while.body187.prol.loopexit, %while.body187, %middle.block36
  %incdec.ptr189.lcssa = phi i8* [ %ind.end51, %middle.block36 ], [ %incdec.ptr189.lcssa213.unr, %while.body187.prol.loopexit ], [ %incdec.ptr189.7, %while.body187 ]
  %add.ptr = getelementptr inbounds [256 x i8], [256 x i8]* %array_name, i64 0, i64 256
  %cmp193866 = icmp ult i8* %incdec.ptr189.lcssa, %add.ptr
  br i1 %cmp193866, label %iter.check, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705

iter.check:                                       ; preds = %while.cond191.preheader, %while.end183
  %dst.0.lcssa911 = phi i8* [ %incdec.ptr189.lcssa, %while.cond191.preheader ], [ %62, %while.end183 ]
  %dst.0.lcssa91164 = ptrtoint i8* %dst.0.lcssa911 to i64
  %scevgep = getelementptr inbounds [256 x i8], [256 x i8]* %array_name, i64 1, i64 0
  %148 = sub i64 0, %dst.0.lcssa91164
  %scevgep65 = getelementptr [256 x i8], [256 x i8]* %array_name, i64 1, i64 %148
  %exitcount.ptrcnt.to.int = ptrtoint i8* %scevgep65 to i64
  %min.iters.check67 = icmp ult i8* %scevgep65, inttoptr (i64 4 to i8*)
  br i1 %min.iters.check67, label %while.body194.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check69 = icmp ult i8* %scevgep65, inttoptr (i64 128 to i8*)
  br i1 %min.iters.check69, label %vec.epilog.ph, label %vector.ph70

vector.ph70:                                      ; preds = %vector.main.loop.iter.check
  %n.vec72 = and i64 %exitcount.ptrcnt.to.int, -128
  %149 = add i64 %n.vec72, -128
  %150 = lshr exact i64 %149, 7
  %151 = add nuw nsw i64 %150, 1
  %xtraiter222 = and i64 %151, 7
  %152 = icmp ult i64 %149, 896
  br i1 %152, label %middle.block61.unr-lcssa, label %vector.ph70.new

vector.ph70.new:                                  ; preds = %vector.ph70
  %unroll_iter225 = and i64 %151, 288230376151711736
  br label %vector.body63

vector.body63:                                    ; preds = %vector.body63, %vector.ph70.new
  %index73 = phi i64 [ 0, %vector.ph70.new ], [ %index.next74.7, %vector.body63 ]
  %niter226 = phi i64 [ %unroll_iter225, %vector.ph70.new ], [ %niter226.nsub.7, %vector.body63 ]
  %next.gep76 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index73
  %153 = bitcast i8* %next.gep76 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %153, align 1, !tbaa !38
  %154 = getelementptr i8, i8* %next.gep76, i64 32
  %155 = bitcast i8* %154 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %155, align 1, !tbaa !38
  %156 = getelementptr i8, i8* %next.gep76, i64 64
  %157 = bitcast i8* %156 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %157, align 1, !tbaa !38
  %158 = getelementptr i8, i8* %next.gep76, i64 96
  %159 = bitcast i8* %158 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %159, align 1, !tbaa !38
  %index.next74 = or i64 %index73, 128
  %next.gep76.1 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index.next74
  %160 = bitcast i8* %next.gep76.1 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %160, align 1, !tbaa !38
  %161 = getelementptr i8, i8* %next.gep76.1, i64 32
  %162 = bitcast i8* %161 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %162, align 1, !tbaa !38
  %163 = getelementptr i8, i8* %next.gep76.1, i64 64
  %164 = bitcast i8* %163 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %164, align 1, !tbaa !38
  %165 = getelementptr i8, i8* %next.gep76.1, i64 96
  %166 = bitcast i8* %165 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %166, align 1, !tbaa !38
  %index.next74.1 = or i64 %index73, 256
  %next.gep76.2 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index.next74.1
  %167 = bitcast i8* %next.gep76.2 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %167, align 1, !tbaa !38
  %168 = getelementptr i8, i8* %next.gep76.2, i64 32
  %169 = bitcast i8* %168 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %169, align 1, !tbaa !38
  %170 = getelementptr i8, i8* %next.gep76.2, i64 64
  %171 = bitcast i8* %170 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %171, align 1, !tbaa !38
  %172 = getelementptr i8, i8* %next.gep76.2, i64 96
  %173 = bitcast i8* %172 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %173, align 1, !tbaa !38
  %index.next74.2 = or i64 %index73, 384
  %next.gep76.3 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index.next74.2
  %174 = bitcast i8* %next.gep76.3 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %174, align 1, !tbaa !38
  %175 = getelementptr i8, i8* %next.gep76.3, i64 32
  %176 = bitcast i8* %175 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %176, align 1, !tbaa !38
  %177 = getelementptr i8, i8* %next.gep76.3, i64 64
  %178 = bitcast i8* %177 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %178, align 1, !tbaa !38
  %179 = getelementptr i8, i8* %next.gep76.3, i64 96
  %180 = bitcast i8* %179 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %180, align 1, !tbaa !38
  %index.next74.3 = or i64 %index73, 512
  %next.gep76.4 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index.next74.3
  %181 = bitcast i8* %next.gep76.4 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %181, align 1, !tbaa !38
  %182 = getelementptr i8, i8* %next.gep76.4, i64 32
  %183 = bitcast i8* %182 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %183, align 1, !tbaa !38
  %184 = getelementptr i8, i8* %next.gep76.4, i64 64
  %185 = bitcast i8* %184 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %185, align 1, !tbaa !38
  %186 = getelementptr i8, i8* %next.gep76.4, i64 96
  %187 = bitcast i8* %186 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %187, align 1, !tbaa !38
  %index.next74.4 = or i64 %index73, 640
  %next.gep76.5 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index.next74.4
  %188 = bitcast i8* %next.gep76.5 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %188, align 1, !tbaa !38
  %189 = getelementptr i8, i8* %next.gep76.5, i64 32
  %190 = bitcast i8* %189 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %190, align 1, !tbaa !38
  %191 = getelementptr i8, i8* %next.gep76.5, i64 64
  %192 = bitcast i8* %191 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %192, align 1, !tbaa !38
  %193 = getelementptr i8, i8* %next.gep76.5, i64 96
  %194 = bitcast i8* %193 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %194, align 1, !tbaa !38
  %index.next74.5 = or i64 %index73, 768
  %next.gep76.6 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index.next74.5
  %195 = bitcast i8* %next.gep76.6 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %195, align 1, !tbaa !38
  %196 = getelementptr i8, i8* %next.gep76.6, i64 32
  %197 = bitcast i8* %196 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %197, align 1, !tbaa !38
  %198 = getelementptr i8, i8* %next.gep76.6, i64 64
  %199 = bitcast i8* %198 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %199, align 1, !tbaa !38
  %200 = getelementptr i8, i8* %next.gep76.6, i64 96
  %201 = bitcast i8* %200 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %201, align 1, !tbaa !38
  %index.next74.6 = or i64 %index73, 896
  %next.gep76.7 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index.next74.6
  %202 = bitcast i8* %next.gep76.7 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %202, align 1, !tbaa !38
  %203 = getelementptr i8, i8* %next.gep76.7, i64 32
  %204 = bitcast i8* %203 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %204, align 1, !tbaa !38
  %205 = getelementptr i8, i8* %next.gep76.7, i64 64
  %206 = bitcast i8* %205 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %206, align 1, !tbaa !38
  %207 = getelementptr i8, i8* %next.gep76.7, i64 96
  %208 = bitcast i8* %207 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %208, align 1, !tbaa !38
  %index.next74.7 = add i64 %index73, 1024
  %niter226.nsub.7 = add i64 %niter226, -8
  %niter226.ncmp.7 = icmp eq i64 %niter226.nsub.7, 0
  br i1 %niter226.ncmp.7, label %middle.block61.unr-lcssa, label %vector.body63, !llvm.loop !106

middle.block61.unr-lcssa:                         ; preds = %vector.body63, %vector.ph70
  %index73.unr = phi i64 [ 0, %vector.ph70 ], [ %index.next74.7, %vector.body63 ]
  %lcmp.mod224.not = icmp eq i64 %xtraiter222, 0
  br i1 %lcmp.mod224.not, label %middle.block61, label %vector.body63.epil

vector.body63.epil:                               ; preds = %middle.block61.unr-lcssa, %vector.body63.epil
  %index73.epil = phi i64 [ %index.next74.epil, %vector.body63.epil ], [ %index73.unr, %middle.block61.unr-lcssa ]
  %epil.iter223 = phi i64 [ %epil.iter223.sub, %vector.body63.epil ], [ %xtraiter222, %middle.block61.unr-lcssa ]
  %next.gep76.epil = getelementptr i8, i8* %dst.0.lcssa911, i64 %index73.epil
  %209 = bitcast i8* %next.gep76.epil to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %209, align 1, !tbaa !38
  %210 = getelementptr i8, i8* %next.gep76.epil, i64 32
  %211 = bitcast i8* %210 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %211, align 1, !tbaa !38
  %212 = getelementptr i8, i8* %next.gep76.epil, i64 64
  %213 = bitcast i8* %212 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %213, align 1, !tbaa !38
  %214 = getelementptr i8, i8* %next.gep76.epil, i64 96
  %215 = bitcast i8* %214 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %215, align 1, !tbaa !38
  %index.next74.epil = add i64 %index73.epil, 128
  %epil.iter223.sub = add i64 %epil.iter223, -1
  %epil.iter223.cmp.not = icmp eq i64 %epil.iter223.sub, 0
  br i1 %epil.iter223.cmp.not, label %middle.block61, label %vector.body63.epil, !llvm.loop !107

middle.block61:                                   ; preds = %vector.body63.epil, %middle.block61.unr-lcssa
  %cmp.n75 = icmp eq i64 %n.vec72, %exitcount.ptrcnt.to.int
  br i1 %cmp.n75, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block61
  %ind.end89 = getelementptr i8, i8* %dst.0.lcssa911, i64 %n.vec72
  %n.vec.remaining = and i64 %exitcount.ptrcnt.to.int, 124
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %while.body194.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec72, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %216 = sub i64 0, %dst.0.lcssa91164
  %scevgep80 = getelementptr [256 x i8], [256 x i8]* %array_name, i64 1, i64 %216
  %exitcount.ptrcnt.to.int82 = ptrtoint i8* %scevgep80 to i64
  %n.vec84 = and i64 %exitcount.ptrcnt.to.int82, -4
  %ind.end88 = getelementptr i8, i8* %dst.0.lcssa911, i64 %n.vec84
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index85 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next86, %vec.epilog.vector.body ]
  %next.gep91 = getelementptr i8, i8* %dst.0.lcssa911, i64 %index85
  %217 = bitcast i8* %next.gep91 to <4 x i8>*
  store <4 x i8> zeroinitializer, <4 x i8>* %217, align 1, !tbaa !38
  %index.next86 = add i64 %index85, 4
  %218 = icmp eq i64 %index.next86, %n.vec84
  br i1 %218, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !108

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n90 = icmp eq i64 %n.vec84, %exitcount.ptrcnt.to.int82
  br i1 %cmp.n90, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705, label %while.body194.preheader

while.body194.preheader:                          ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %dst.1867.ph = phi i8* [ %dst.0.lcssa911, %iter.check ], [ %ind.end89, %vec.epilog.iter.check ], [ %ind.end88, %vec.epilog.middle.block ]
  br label %while.body194

while.body187:                                    ; preds = %while.body187.prol.loopexit, %while.body187
  %dst.0870 = phi i8* [ %incdec.ptr189.7, %while.body187 ], [ %dst.0870.unr, %while.body187.prol.loopexit ]
  %start.1869.idx = phi i64 [ %start.1869.add.7, %while.body187 ], [ %start.1869.idx.unr, %while.body187.prol.loopexit ]
  %start.1869.ptr = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.idx
  %start.1869.add = add nuw nsw i64 %start.1869.idx, 1
  %219 = load i8, i8* %start.1869.ptr, align 1, !tbaa !38
  %incdec.ptr189 = getelementptr inbounds i8, i8* %dst.0870, i64 1
  store i8 %219, i8* %dst.0870, align 1, !tbaa !38
  %start.1869.ptr.1 = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.add
  %start.1869.add.1 = add nuw nsw i64 %start.1869.idx, 2
  %220 = load i8, i8* %start.1869.ptr.1, align 1, !tbaa !38
  %incdec.ptr189.1 = getelementptr inbounds i8, i8* %dst.0870, i64 2
  store i8 %220, i8* %incdec.ptr189, align 1, !tbaa !38
  %start.1869.ptr.2 = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.add.1
  %start.1869.add.2 = add nuw nsw i64 %start.1869.idx, 3
  %221 = load i8, i8* %start.1869.ptr.2, align 1, !tbaa !38
  %incdec.ptr189.2 = getelementptr inbounds i8, i8* %dst.0870, i64 3
  store i8 %221, i8* %incdec.ptr189.1, align 1, !tbaa !38
  %start.1869.ptr.3 = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.add.2
  %start.1869.add.3 = add nuw nsw i64 %start.1869.idx, 4
  %222 = load i8, i8* %start.1869.ptr.3, align 1, !tbaa !38
  %incdec.ptr189.3 = getelementptr inbounds i8, i8* %dst.0870, i64 4
  store i8 %222, i8* %incdec.ptr189.2, align 1, !tbaa !38
  %start.1869.ptr.4 = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.add.3
  %start.1869.add.4 = add nuw nsw i64 %start.1869.idx, 5
  %223 = load i8, i8* %start.1869.ptr.4, align 1, !tbaa !38
  %incdec.ptr189.4 = getelementptr inbounds i8, i8* %dst.0870, i64 5
  store i8 %223, i8* %incdec.ptr189.3, align 1, !tbaa !38
  %start.1869.ptr.5 = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.add.4
  %start.1869.add.5 = add nuw nsw i64 %start.1869.idx, 6
  %224 = load i8, i8* %start.1869.ptr.5, align 1, !tbaa !38
  %incdec.ptr189.5 = getelementptr inbounds i8, i8* %dst.0870, i64 6
  store i8 %224, i8* %incdec.ptr189.4, align 1, !tbaa !38
  %start.1869.ptr.6 = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.add.5
  %start.1869.add.6 = add nuw nsw i64 %start.1869.idx, 7
  %225 = load i8, i8* %start.1869.ptr.6, align 1, !tbaa !38
  %incdec.ptr189.6 = getelementptr inbounds i8, i8* %dst.0870, i64 7
  store i8 %225, i8* %incdec.ptr189.5, align 1, !tbaa !38
  %start.1869.ptr.7 = getelementptr inbounds i8, i8* %end.1872, i64 %start.1869.add.6
  %start.1869.add.7 = add nuw nsw i64 %start.1869.idx, 8
  %226 = load i8, i8* %start.1869.ptr.7, align 1, !tbaa !38
  %incdec.ptr189.7 = getelementptr inbounds i8, i8* %dst.0870, i64 8
  store i8 %226, i8* %incdec.ptr189.6, align 1, !tbaa !38
  %cmp186.not.7 = icmp eq i64 %start.1869.add.7, -1
  br i1 %cmp186.not.7, label %while.cond191.preheader, label %while.body187, !llvm.loop !109

while.body194:                                    ; preds = %while.body194.preheader, %while.body194
  %dst.1867 = phi i8* [ %incdec.ptr195, %while.body194 ], [ %dst.1867.ph, %while.body194.preheader ]
  %incdec.ptr195 = getelementptr inbounds i8, i8* %dst.1867, i64 1
  store i8 0, i8* %dst.1867, align 1, !tbaa !38
  %exitcond882.not = icmp eq i8* %incdec.ptr195, %scevgep
  br i1 %exitcond882.not, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705, label %while.body194, !llvm.loop !110

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705: ; preds = %while.body194, %middle.block61, %vec.epilog.middle.block, %while.cond191.preheader
  %add197 = sub i32 6, %61
  %and = and i32 %add197, -8
  %227 = getelementptr inbounds [129 x i8], [129 x i8]* %header198, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 129, i8* nonnull %227) #11
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(129) %227, i8* nonnull align 1 dereferenceable(129) getelementptr inbounds ([129 x i8], [129 x i8]* @__const.halide_debug_to_file.header, i64 0, i64 0), i64 129, i1 false)
  %call.i701 = call i64 @fwrite(i8* nonnull %227, i64 128, i64 1, i8* nonnull %call.i598) #16
  %228 = load i32, i32* %dimensions, align 4, !tbaa !70
  %cmp19.i.i = icmp sgt i32 %228, 0
  br i1 %cmp19.i.i, label %for.body.lr.ph.i.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.lr.ph.i.i:                               ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 6
  %229 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8, !tbaa !71
  %wide.trip.count.i.i = zext i32 %228 to i64
  %min.iters.check95 = icmp ult i32 %228, 17
  br i1 %min.iters.check95, label %for.body.i.i.preheader, label %vector.ph96

vector.ph96:                                      ; preds = %for.body.lr.ph.i.i
  %n.mod.vf97 = and i64 %wide.trip.count.i.i, 15
  %230 = icmp eq i64 %n.mod.vf97, 0
  %231 = select i1 %230, i64 16, i64 %n.mod.vf97
  %n.vec98 = sub nsw i64 %wide.trip.count.i.i, %231
  br label %vector.body94

vector.body94:                                    ; preds = %vector.body94, %vector.ph96
  %index99 = phi i64 [ 0, %vector.ph96 ], [ %index.next100, %vector.body94 ]
  %vec.ind103 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph96 ], [ %vec.ind.next107, %vector.body94 ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph96 ], [ %predphi, %vector.body94 ]
  %vec.phi108 = phi <4 x i64> [ zeroinitializer, %vector.ph96 ], [ %predphi120, %vector.body94 ]
  %vec.phi109 = phi <4 x i64> [ zeroinitializer, %vector.ph96 ], [ %predphi121, %vector.body94 ]
  %vec.phi110 = phi <4 x i64> [ zeroinitializer, %vector.ph96 ], [ %predphi122, %vector.body94 ]
  %step.add = add <4 x i64> %vec.ind103, <i64 4, i64 4, i64 4, i64 4>
  %step.add104 = add <4 x i64> %vec.ind103, <i64 8, i64 8, i64 8, i64 8>
  %step.add105 = add <4 x i64> %vec.ind103, <i64 12, i64 12, i64 12, i64 12>
  %232 = or i64 %index99, 4
  %233 = or i64 %index99, 8
  %234 = or i64 %index99, 12
  %235 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %index99, i32 2
  %236 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %232, i32 2
  %237 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %233, i32 2
  %238 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %234, i32 2
  %239 = bitcast i32* %235 to <16 x i32>*
  %240 = bitcast i32* %236 to <16 x i32>*
  %241 = bitcast i32* %237 to <16 x i32>*
  %242 = bitcast i32* %238 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %239, align 4, !tbaa !77
  %wide.vec111 = load <16 x i32>, <16 x i32>* %240, align 4, !tbaa !77
  %wide.vec112 = load <16 x i32>, <16 x i32>* %241, align 4, !tbaa !77
  %wide.vec113 = load <16 x i32>, <16 x i32>* %242, align 4, !tbaa !77
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec114 = shufflevector <16 x i32> %wide.vec111, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec115 = shufflevector <16 x i32> %wide.vec112, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec116 = shufflevector <16 x i32> %wide.vec113, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %243 = icmp sgt <4 x i32> %strided.vec, zeroinitializer
  %244 = icmp sgt <4 x i32> %strided.vec114, zeroinitializer
  %245 = icmp sgt <4 x i32> %strided.vec115, zeroinitializer
  %246 = icmp sgt <4 x i32> %strided.vec116, zeroinitializer
  %247 = zext <4 x i32> %strided.vec to <4 x i64>
  %248 = zext <4 x i32> %strided.vec114 to <4 x i64>
  %249 = zext <4 x i32> %strided.vec115 to <4 x i64>
  %250 = zext <4 x i32> %strided.vec116 to <4 x i64>
  %251 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %vec.ind103, i32 1
  %252 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %step.add, i32 1
  %253 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %step.add104, i32 1
  %254 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %step.add105, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %251, i32 4, <4 x i1> %243, <4 x i32> undef), !tbaa !73
  %wide.masked.gather117 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %252, i32 4, <4 x i1> %244, <4 x i32> undef), !tbaa !73
  %wide.masked.gather118 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %253, i32 4, <4 x i1> %245, <4 x i32> undef), !tbaa !73
  %wide.masked.gather119 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %254, i32 4, <4 x i1> %246, <4 x i32> undef), !tbaa !73
  %255 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %256 = add nsw <4 x i32> %wide.masked.gather117, <i32 -1, i32 -1, i32 -1, i32 -1>
  %257 = add nsw <4 x i32> %wide.masked.gather118, <i32 -1, i32 -1, i32 -1, i32 -1>
  %258 = add nsw <4 x i32> %wide.masked.gather119, <i32 -1, i32 -1, i32 -1, i32 -1>
  %259 = sext <4 x i32> %255 to <4 x i64>
  %260 = sext <4 x i32> %256 to <4 x i64>
  %261 = sext <4 x i32> %257 to <4 x i64>
  %262 = sext <4 x i32> %258 to <4 x i64>
  %263 = mul nsw <4 x i64> %259, %247
  %264 = mul nsw <4 x i64> %260, %248
  %265 = mul nsw <4 x i64> %261, %249
  %266 = mul nsw <4 x i64> %262, %250
  %267 = select <4 x i1> %243, <4 x i64> %263, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %267
  %268 = select <4 x i1> %244, <4 x i64> %264, <4 x i64> zeroinitializer
  %predphi120 = add <4 x i64> %vec.phi108, %268
  %269 = select <4 x i1> %245, <4 x i64> %265, <4 x i64> zeroinitializer
  %predphi121 = add <4 x i64> %vec.phi109, %269
  %270 = select <4 x i1> %246, <4 x i64> %266, <4 x i64> zeroinitializer
  %predphi122 = add <4 x i64> %vec.phi110, %270
  %index.next100 = add i64 %index99, 16
  %vec.ind.next107 = add <4 x i64> %vec.ind103, <i64 16, i64 16, i64 16, i64 16>
  %271 = icmp eq i64 %index.next100, %n.vec98
  br i1 %271, label %middle.block92, label %vector.body94, !llvm.loop !111

middle.block92:                                   ; preds = %vector.body94
  %bin.rdx = add <4 x i64> %predphi120, %predphi
  %bin.rdx123 = add <4 x i64> %predphi121, %bin.rdx
  %bin.rdx124 = add <4 x i64> %predphi122, %bin.rdx123
  %272 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx124)
  br label %for.body.i.i.preheader

for.body.i.i.preheader:                           ; preds = %middle.block92, %for.body.lr.ph.i.i
  %indvars.iv.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %n.vec98, %middle.block92 ]
  %index.021.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %272, %middle.block92 ]
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.preheader, %if.end.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %if.end.i.i ], [ %indvars.iv.i.i.ph, %for.body.i.i.preheader ]
  %index.021.i.i = phi i64 [ %index.1.i.i, %if.end.i.i ], [ %index.021.i.i.ph, %for.body.i.i.preheader ]
  %stride2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %indvars.iv.i.i, i32 2
  %273 = load i32, i32* %stride2.i.i, align 4, !tbaa !77
  %cmp3.i.i = icmp sgt i32 %273, 0
  br i1 %cmp3.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %conv18.i.i = zext i32 %273 to i64
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %indvars.iv.i.i, i32 1
  %274 = load i32, i32* %extent.i.i, align 4, !tbaa !73
  %sub.i.i = add nsw i32 %274, -1
  %conv7.i.i = sext i32 %sub.i.i to i64
  %mul.i.i = mul nsw i64 %conv7.i.i, %conv18.i.i
  %add.i.i693 = add nsw i64 %mul.i.i, %index.021.i.i
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i64 [ %add.i.i693, %if.then.i.i ], [ %index.021.i.i, %for.body.i.i ]
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.not.i.i = icmp eq i64 %indvars.iv.next.i.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i.i, label %for.body.i13.i.preheader, label %for.body.i.i, !llvm.loop !112

for.body.i13.i.preheader:                         ; preds = %if.end.i.i
  %min.iters.check128 = icmp ult i32 %228, 17
  br i1 %min.iters.check128, label %for.body.i13.i.preheader211, label %vector.ph129

vector.ph129:                                     ; preds = %for.body.i13.i.preheader
  %n.mod.vf130 = and i64 %wide.trip.count.i.i, 15
  %275 = icmp eq i64 %n.mod.vf130, 0
  %276 = select i1 %275, i64 16, i64 %n.mod.vf130
  %n.vec131 = sub nsw i64 %wide.trip.count.i.i, %276
  br label %vector.body127

vector.body127:                                   ; preds = %vector.body127, %vector.ph129
  %index132 = phi i64 [ 0, %vector.ph129 ], [ %index.next133, %vector.body127 ]
  %vec.ind136 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph129 ], [ %vec.ind.next141, %vector.body127 ]
  %vec.phi142 = phi <4 x i64> [ zeroinitializer, %vector.ph129 ], [ %predphi158, %vector.body127 ]
  %vec.phi143 = phi <4 x i64> [ zeroinitializer, %vector.ph129 ], [ %predphi159, %vector.body127 ]
  %vec.phi144 = phi <4 x i64> [ zeroinitializer, %vector.ph129 ], [ %predphi160, %vector.body127 ]
  %vec.phi145 = phi <4 x i64> [ zeroinitializer, %vector.ph129 ], [ %predphi161, %vector.body127 ]
  %step.add137 = add <4 x i64> %vec.ind136, <i64 4, i64 4, i64 4, i64 4>
  %step.add138 = add <4 x i64> %vec.ind136, <i64 8, i64 8, i64 8, i64 8>
  %step.add139 = add <4 x i64> %vec.ind136, <i64 12, i64 12, i64 12, i64 12>
  %277 = or i64 %index132, 4
  %278 = or i64 %index132, 8
  %279 = or i64 %index132, 12
  %280 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %index132, i32 2
  %281 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %277, i32 2
  %282 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %278, i32 2
  %283 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %279, i32 2
  %284 = bitcast i32* %280 to <16 x i32>*
  %285 = bitcast i32* %281 to <16 x i32>*
  %286 = bitcast i32* %282 to <16 x i32>*
  %287 = bitcast i32* %283 to <16 x i32>*
  %wide.vec146 = load <16 x i32>, <16 x i32>* %284, align 4, !tbaa !77
  %wide.vec147 = load <16 x i32>, <16 x i32>* %285, align 4, !tbaa !77
  %wide.vec148 = load <16 x i32>, <16 x i32>* %286, align 4, !tbaa !77
  %wide.vec149 = load <16 x i32>, <16 x i32>* %287, align 4, !tbaa !77
  %strided.vec150 = shufflevector <16 x i32> %wide.vec146, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec151 = shufflevector <16 x i32> %wide.vec147, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec152 = shufflevector <16 x i32> %wide.vec148, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec153 = shufflevector <16 x i32> %wide.vec149, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %288 = icmp slt <4 x i32> %strided.vec150, zeroinitializer
  %289 = icmp slt <4 x i32> %strided.vec151, zeroinitializer
  %290 = icmp slt <4 x i32> %strided.vec152, zeroinitializer
  %291 = icmp slt <4 x i32> %strided.vec153, zeroinitializer
  %292 = sext <4 x i32> %strided.vec150 to <4 x i64>
  %293 = sext <4 x i32> %strided.vec151 to <4 x i64>
  %294 = sext <4 x i32> %strided.vec152 to <4 x i64>
  %295 = sext <4 x i32> %strided.vec153 to <4 x i64>
  %296 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %vec.ind136, i32 1
  %297 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %step.add137, i32 1
  %298 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %step.add138, i32 1
  %299 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, <4 x i64> %step.add139, i32 1
  %wide.masked.gather154 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %296, i32 4, <4 x i1> %288, <4 x i32> undef), !tbaa !73
  %wide.masked.gather155 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %297, i32 4, <4 x i1> %289, <4 x i32> undef), !tbaa !73
  %wide.masked.gather156 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %298, i32 4, <4 x i1> %290, <4 x i32> undef), !tbaa !73
  %wide.masked.gather157 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %299, i32 4, <4 x i1> %291, <4 x i32> undef), !tbaa !73
  %300 = add nsw <4 x i32> %wide.masked.gather154, <i32 -1, i32 -1, i32 -1, i32 -1>
  %301 = add nsw <4 x i32> %wide.masked.gather155, <i32 -1, i32 -1, i32 -1, i32 -1>
  %302 = add nsw <4 x i32> %wide.masked.gather156, <i32 -1, i32 -1, i32 -1, i32 -1>
  %303 = add nsw <4 x i32> %wide.masked.gather157, <i32 -1, i32 -1, i32 -1, i32 -1>
  %304 = sext <4 x i32> %300 to <4 x i64>
  %305 = sext <4 x i32> %301 to <4 x i64>
  %306 = sext <4 x i32> %302 to <4 x i64>
  %307 = sext <4 x i32> %303 to <4 x i64>
  %308 = mul nsw <4 x i64> %304, %292
  %309 = mul nsw <4 x i64> %305, %293
  %310 = mul nsw <4 x i64> %306, %294
  %311 = mul nsw <4 x i64> %307, %295
  %312 = select <4 x i1> %288, <4 x i64> %308, <4 x i64> zeroinitializer
  %predphi158 = add <4 x i64> %vec.phi142, %312
  %313 = select <4 x i1> %289, <4 x i64> %309, <4 x i64> zeroinitializer
  %predphi159 = add <4 x i64> %vec.phi143, %313
  %314 = select <4 x i1> %290, <4 x i64> %310, <4 x i64> zeroinitializer
  %predphi160 = add <4 x i64> %vec.phi144, %314
  %315 = select <4 x i1> %291, <4 x i64> %311, <4 x i64> zeroinitializer
  %predphi161 = add <4 x i64> %vec.phi145, %315
  %index.next133 = add i64 %index132, 16
  %vec.ind.next141 = add <4 x i64> %vec.ind136, <i64 16, i64 16, i64 16, i64 16>
  %316 = icmp eq i64 %index.next133, %n.vec131
  br i1 %316, label %middle.block125, label %vector.body127, !llvm.loop !113

middle.block125:                                  ; preds = %vector.body127
  %bin.rdx162 = add <4 x i64> %predphi159, %predphi158
  %bin.rdx163 = add <4 x i64> %predphi160, %bin.rdx162
  %bin.rdx164 = add <4 x i64> %predphi161, %bin.rdx163
  %317 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx164)
  br label %for.body.i13.i.preheader211

for.body.i13.i.preheader211:                      ; preds = %middle.block125, %for.body.i13.i.preheader
  %indvars.iv.i10.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %n.vec131, %middle.block125 ]
  %index.018.i.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %317, %middle.block125 ]
  br label %for.body.i13.i

for.body.i13.i:                                   ; preds = %for.body.i13.i.preheader211, %if.end.i24.i
  %indvars.iv.i10.i = phi i64 [ %indvars.iv.next.i22.i, %if.end.i24.i ], [ %indvars.iv.i10.i.ph, %for.body.i13.i.preheader211 ]
  %index.018.i.i = phi i64 [ %index.1.i21.i, %if.end.i24.i ], [ %index.018.i.i.ph, %for.body.i13.i.preheader211 ]
  %stride2.i11.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %indvars.iv.i10.i, i32 2
  %318 = load i32, i32* %stride2.i11.i, align 4, !tbaa !77
  %cmp3.i12.i = icmp slt i32 %318, 0
  br i1 %cmp3.i12.i, label %if.then.i20.i, label %if.end.i24.i

if.then.i20.i:                                    ; preds = %for.body.i13.i
  %conv.i14.i = sext i32 %318 to i64
  %extent.i15.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %229, i64 %indvars.iv.i10.i, i32 1
  %319 = load i32, i32* %extent.i15.i, align 4, !tbaa !73
  %sub.i16.i = add nsw i32 %319, -1
  %conv7.i17.i = sext i32 %sub.i16.i to i64
  %mul.i18.i = mul nsw i64 %conv7.i17.i, %conv.i14.i
  %add.i19.i = add nsw i64 %mul.i18.i, %index.018.i.i
  br label %if.end.i24.i

if.end.i24.i:                                     ; preds = %if.then.i20.i, %for.body.i13.i
  %index.1.i21.i = phi i64 [ %add.i19.i, %if.then.i20.i ], [ %index.018.i.i, %for.body.i13.i ]
  %indvars.iv.next.i22.i = add nuw nsw i64 %indvars.iv.i10.i, 1
  %exitcond.not.i23.i = icmp eq i64 %indvars.iv.next.i22.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i23.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i13.i, !llvm.loop !114

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %if.end.i24.i
  %add8.i.i = add nsw i64 %index.1.i.i, 1
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705
  %add8.i27.i = phi i64 [ 1, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705 ], [ %add8.i.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %index.0.lcssa.i9.i = phi i64 [ 0, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit705 ], [ %index.1.i21.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %sub.i694 = sub nsw i64 %add8.i27.i, %index.0.lcssa.i9.i
  %320 = load i8, i8* %bits.i, align 1, !tbaa !28
  %conv.i.i696 = zext i8 %320 to i64
  %add.i4.i = add nuw nsw i64 %conv.i.i696, 7
  %div.i.i697 = lshr i64 %add.i4.i, 3
  %mul.i698 = mul i64 %div.i.i697, %sub.i694
  %321 = trunc i64 %mul.i698 to i32
  %322 = add i32 %321, 7
  %323 = and i32 %322, 7
  %conv204 = xor i32 %323, 7
  %conv205 = zext i32 %conv204 to i64
  %add206 = add i64 %mul.i698, %conv205
  %tobool207.not = icmp ult i64 %add206, 4294967296
  br i1 %tobool207.not, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit687, label %cleanup278.thread

cleanup278.thread:                                ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.6.40, i64 0, i64 0)) #16
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %227) #11
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %62) #11
  br label %cleanup433

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit687: ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %324 = icmp sgt i32 %228, 2
  %spec.store.select = select i1 %324, i32 %228, i32 2
  %325 = bitcast [8 x i32]* %tags to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %325) #11
  %arrayinit.begin = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 0
  store i32 14, i32* %arrayinit.begin, align 4, !tbaa !16
  %arrayinit.element = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 1
  %add214 = shl i32 %spec.store.select, 2
  %and215 = add i32 %add214, 4
  %mul216 = and i32 %and215, -8
  %add217 = add i32 %and, 40
  %add218 = add i32 %add217, %mul216
  %add220 = add i32 %add218, %321
  %add221 = add i32 %add220, %conv204
  store i32 %add221, i32* %arrayinit.element, align 4, !tbaa !16
  %arrayinit.element222 = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 2
  store i32 6, i32* %arrayinit.element222, align 4, !tbaa !16
  %arrayinit.element223 = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 3
  store i32 8, i32* %arrayinit.element223, align 4, !tbaa !16
  %arrayinit.element224 = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 4
  %idxprom225 = sext i32 %type_code to i64
  %arrayidx226 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, i64 0, i64 %idxprom225
  %326 = load i8, i8* %arrayidx226, align 1, !tbaa !38
  %conv227 = zext i8 %326 to i32
  store i32 %conv227, i32* %arrayinit.element224, align 4, !tbaa !16
  %arrayinit.element228 = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 5
  store i32 1, i32* %arrayinit.element228, align 4, !tbaa !16
  %arrayinit.element229 = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 6
  store i32 5, i32* %arrayinit.element229, align 4, !tbaa !16
  %arrayinit.element230 = getelementptr inbounds [8 x i32], [8 x i32]* %tags, i64 0, i64 7
  store i32 %add214, i32* %arrayinit.element230, align 4, !tbaa !16
  %call.i683 = call i64 @fwrite(i8* nonnull %325, i64 32, i64 1, i8* nonnull %call.i598) #16
  %cmp.i684.not = icmp eq i64 %call.i683, 0
  br i1 %cmp.i684.not, label %cleanup278, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit676

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit676: ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit687
  %327 = bitcast [4 x i32]* %extents to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %327) #11
  %arrayinit.begin235 = getelementptr inbounds [4 x i32], [4 x i32]* %extents, i64 0, i64 0
  %328 = load i32, i32* %extent.i, align 4, !tbaa !73
  store i32 %328, i32* %arrayinit.begin235, align 4, !tbaa !16
  %arrayinit.element238 = getelementptr inbounds [4 x i32], [4 x i32]* %extents, i64 0, i64 1
  %329 = load i32, i32* %extent.i.1, align 4, !tbaa !73
  store i32 %329, i32* %arrayinit.element238, align 4, !tbaa !16
  %arrayinit.element241 = getelementptr inbounds [4 x i32], [4 x i32]* %extents, i64 0, i64 2
  %330 = load i32, i32* %extent.i.2, align 4, !tbaa !73
  store i32 %330, i32* %arrayinit.element241, align 4, !tbaa !16
  %arrayinit.element244 = getelementptr inbounds [4 x i32], [4 x i32]* %extents, i64 0, i64 3
  %331 = load i32, i32* %extent.i.3, align 4, !tbaa !73
  store i32 %331, i32* %arrayinit.element244, align 4, !tbaa !16
  %conv248 = sext i32 %mul216 to i64
  %call.i672 = call i64 @fwrite(i8* nonnull %327, i64 %conv248, i64 1, i8* nonnull %call.i598) #16
  %cmp.i673.not = icmp eq i64 %call.i672, 0
  br i1 %cmp.i673.not, label %cleanup274, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit664

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit664: ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit676
  %332 = bitcast [2 x i32]* %name_header to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %332) #11
  %arrayinit.begin252 = getelementptr inbounds [2 x i32], [2 x i32]* %name_header, i64 0, i64 0
  store i32 1, i32* %arrayinit.begin252, align 4, !tbaa !16
  %arrayinit.element253 = getelementptr inbounds [2 x i32], [2 x i32]* %name_header, i64 0, i64 1
  store i32 %conv184, i32* %arrayinit.element253, align 4, !tbaa !16
  %call.i660 = call i64 @fwrite(i8* nonnull %332, i64 8, i64 1, i8* nonnull %call.i598) #16
  %cmp.i661.not = icmp eq i64 %call.i660, 0
  br i1 %cmp.i661.not, label %cleanup273, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit652

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit652: ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit664
  %conv258 = zext i32 %and to i64
  %call.i648 = call i64 @fwrite(i8* nonnull %62, i64 %conv258, i64 1, i8* nonnull %call.i598) #16
  %cmp.i649.not = icmp eq i64 %call.i648, 0
  br i1 %cmp.i649.not, label %cleanup273, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit642

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit642: ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit652
  %333 = bitcast [2 x i32]* %payload_header to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %333) #11
  %arrayinit.begin262 = getelementptr inbounds [2 x i32], [2 x i32]* %payload_header, i64 0, i64 0
  %arrayidx264 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, i64 0, i64 %idxprom225
  %334 = load i8, i8* %arrayidx264, align 1, !tbaa !38
  %conv265 = zext i8 %334 to i32
  store i32 %conv265, i32* %arrayinit.begin262, align 4, !tbaa !16
  %arrayinit.element266 = getelementptr inbounds [2 x i32], [2 x i32]* %payload_header, i64 0, i64 1
  store i32 %321, i32* %arrayinit.element266, align 4, !tbaa !16
  %call.i638 = call i64 @fwrite(i8* nonnull %333, i64 8, i64 1, i8* nonnull %call.i598) #16
  %cmp.i639.not = icmp eq i64 %call.i638, 0
  %cleanup.dest.slot.5 = zext i1 %cmp.i639.not to i32
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %333) #11
  br label %cleanup273

cleanup273:                                       ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit642, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit652, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit664
  %cleanup.dest.slot.6 = phi i32 [ %cleanup.dest.slot.5, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit642 ], [ 1, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit664 ], [ 1, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit652 ]
  %retval.6 = phi i32 [ -11, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit642 ], [ -9, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit664 ], [ -10, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit652 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %332) #11
  br label %cleanup274

cleanup274:                                       ; preds = %cleanup273, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit676
  %cleanup.dest.slot.7 = phi i32 [ %cleanup.dest.slot.6, %cleanup273 ], [ 1, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit676 ]
  %retval.7 = phi i32 [ %retval.6, %cleanup273 ], [ -8, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit676 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %327) #11
  br label %cleanup278

cleanup278:                                       ; preds = %cleanup274, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit687
  %cleanup.dest.slot.8 = phi i32 [ %cleanup.dest.slot.7, %cleanup274 ], [ 1, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit687 ]
  %retval.8 = phi i32 [ %retval.7, %cleanup274 ], [ -7, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit687 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %325) #11
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %227) #11
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %62) #11
  %cond442 = icmp eq i32 %cleanup.dest.slot.8, 0
  br i1 %cond442, label %if.end311, label %cleanup433

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit631: ; preds = %if.else164
  %335 = bitcast [5 x i32]* %header289 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %335) #11
  %arrayinit.begin290 = getelementptr inbounds [5 x i32], [5 x i32]* %header289, i64 0, i64 0
  %336 = load i32, i32* %extent.i, align 4, !tbaa !73
  store i32 %336, i32* %arrayinit.begin290, align 4, !tbaa !16
  %arrayinit.element293 = getelementptr inbounds [5 x i32], [5 x i32]* %header289, i64 0, i64 1
  %337 = load i32, i32* %extent.i.1, align 4, !tbaa !73
  store i32 %337, i32* %arrayinit.element293, align 4, !tbaa !16
  %arrayinit.element296 = getelementptr inbounds [5 x i32], [5 x i32]* %header289, i64 0, i64 2
  %338 = load i32, i32* %extent.i.2, align 4, !tbaa !73
  store i32 %338, i32* %arrayinit.element296, align 4, !tbaa !16
  %arrayinit.element299 = getelementptr inbounds [5 x i32], [5 x i32]* %header289, i64 0, i64 3
  %339 = load i32, i32* %extent.i.3, align 4, !tbaa !73
  store i32 %339, i32* %arrayinit.element299, align 4, !tbaa !16
  %arrayinit.element302 = getelementptr inbounds [5 x i32], [5 x i32]* %header289, i64 0, i64 4
  store i32 %type_code, i32* %arrayinit.element302, align 4, !tbaa !16
  %call.i627 = call i64 @fwrite(i8* nonnull %335, i64 20, i64 1, i8* nonnull %call.i598) #16
  %cmp.i628.not = icmp eq i64 %call.i627, 0
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %335) #11
  br i1 %cmp.i628.not, label %cleanup433, label %if.end311

if.end311:                                        ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit631, %cleanup278, %cleanup154.thread
  %final_padding_bytes.0 = phi i32 [ %conv204, %cleanup278 ], [ 0, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit631 ], [ 0, %cleanup154.thread ]
  %340 = getelementptr inbounds [4096 x i8], [4096 x i8]* %temp, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %340) #11
  %div = udiv i32 4096, %div.i
  %341 = load i32, i32* %extent.i.3, align 4, !tbaa !73
  %cmp320856 = icmp sgt i32 %341, 0
  br i1 %cmp320856, label %for.body322.lr.ph, label %if.end412

for.body322.lr.ph:                                ; preds = %if.end311
  %342 = load i32, i32* %min.i.3, align 4, !tbaa !76
  %343 = bitcast [4 x i32]* %idx to i8*
  %arrayinit.begin357 = getelementptr inbounds [4 x i32], [4 x i32]* %idx, i64 0, i64 0
  %arrayinit.element358 = getelementptr inbounds [4 x i32], [4 x i32]* %idx, i64 0, i64 1
  %arrayinit.element359 = getelementptr inbounds [4 x i32], [4 x i32]* %idx, i64 0, i64 2
  %arrayinit.element360 = getelementptr inbounds [4 x i32], [4 x i32]* %idx, i64 0, i64 3
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 6
  %conv368 = zext i32 %div.i to i64
  %mul373 = mul nuw nsw i32 %div, %div.i
  %conv374 = zext i32 %mul373 to i64
  %.pre891 = load i32, i32* %min.i.2, align 4, !tbaa !76
  %.pre892 = load i32, i32* %extent.i.2, align 4, !tbaa !73
  br label %for.body322

for.body322:                                      ; preds = %for.inc399, %for.body322.lr.ph
  %344 = phi i32 [ %342, %for.body322.lr.ph ], [ %430, %for.inc399 ]
  %345 = phi i32 [ %341, %for.body322.lr.ph ], [ %431, %for.inc399 ]
  %346 = phi i32 [ %.pre891, %for.body322.lr.ph ], [ %432, %for.inc399 ]
  %347 = phi i32 [ %.pre892, %for.body322.lr.ph ], [ %433, %for.inc399 ]
  %348 = phi i32 [ %.pre892, %for.body322.lr.ph ], [ %434, %for.inc399 ]
  %349 = phi i32 [ %.pre891, %for.body322.lr.ph ], [ %435, %for.inc399 ]
  %dim3.0858 = phi i32 [ %342, %for.body322.lr.ph ], [ %inc400, %for.inc399 ]
  %counter.0857 = phi i32 [ 0, %for.body322.lr.ph ], [ %counter.1.lcssa, %for.inc399 ]
  %cmp331848 = icmp sgt i32 %348, 0
  br i1 %cmp331848, label %for.body333.preheader, label %for.inc399

for.body333.preheader:                            ; preds = %for.body322
  %.pre893 = load i32, i32* %min.i.1, align 4, !tbaa !76
  %.pre894 = load i32, i32* %extent.i.1, align 4, !tbaa !73
  br label %for.body333

for.body333:                                      ; preds = %for.inc394, %for.body333.preheader
  %350 = phi i32 [ %424, %for.inc394 ], [ %.pre893, %for.body333.preheader ]
  %351 = phi i32 [ %425, %for.inc394 ], [ %.pre894, %for.body333.preheader ]
  %352 = phi i32 [ %426, %for.inc394 ], [ %346, %for.body333.preheader ]
  %353 = phi i32 [ %427, %for.inc394 ], [ %347, %for.body333.preheader ]
  %354 = phi i32 [ %428, %for.inc394 ], [ %.pre894, %for.body333.preheader ]
  %355 = phi i32 [ %429, %for.inc394 ], [ %.pre893, %for.body333.preheader ]
  %dim2.0850 = phi i32 [ %inc395, %for.inc394 ], [ %349, %for.body333.preheader ]
  %counter.1849 = phi i32 [ %counter.2.lcssa, %for.inc394 ], [ %counter.0857, %for.body333.preheader ]
  %cmp342839 = icmp sgt i32 %354, 0
  br i1 %cmp342839, label %for.body344.preheader, label %for.inc394

for.body344.preheader:                            ; preds = %for.body333
  %.pre = load i32, i32* %extent.i, align 4, !tbaa !73
  br label %for.body344

for.body344:                                      ; preds = %for.body344.preheader, %for.inc389
  %356 = phi i32 [ %421, %for.inc389 ], [ %350, %for.body344.preheader ]
  %357 = phi i32 [ %422, %for.inc389 ], [ %351, %for.body344.preheader ]
  %358 = phi i32 [ %423, %for.inc389 ], [ %.pre, %for.body344.preheader ]
  %dim1.0841 = phi i32 [ %inc390, %for.inc389 ], [ %355, %for.body344.preheader ]
  %counter.2840 = phi i32 [ %counter.6797, %for.inc389 ], [ %counter.1849, %for.body344.preheader ]
  %cmp353834 = icmp sgt i32 %358, 0
  br i1 %cmp353834, label %for.body355.preheader, label %for.inc389

for.body355.preheader:                            ; preds = %for.body344
  %359 = load i32, i32* %min.i, align 4, !tbaa !76
  br label %for.body355

for.body355:                                      ; preds = %for.inc384, %for.body355.preheader
  %dim0.0836 = phi i32 [ %inc385, %for.inc384 ], [ %359, %for.body355.preheader ]
  %counter.3835 = phi i32 [ %counter.4, %for.inc384 ], [ %counter.2840, %for.body355.preheader ]
  %inc356 = add nsw i32 %counter.3835, 1
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %343) #11
  store i32 %dim0.0836, i32* %arrayinit.begin357, align 4, !tbaa !16
  store i32 %dim1.0841, i32* %arrayinit.element358, align 4, !tbaa !16
  store i32 %dim2.0850, i32* %arrayinit.element359, align 4, !tbaa !16
  store i32 %dim3.0858, i32* %arrayinit.element360, align 4, !tbaa !16
  %360 = load i32, i32* %dimensions, align 4, !tbaa !70
  %cmp17.i = icmp sgt i32 %360, 0
  br i1 %cmp17.i, label %for.body.lr.ph.i, label %_ZNK15halide_buffer_t10address_ofEPKi.exit

for.body.lr.ph.i:                                 ; preds = %for.body355
  %361 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !71
  %wide.trip.count.i = zext i32 %360 to i64
  %stride.i621920 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 0, i32 2
  %362 = load i32, i32* %stride.i621920, align 4, !tbaa !77
  %conv.i622921 = sext i32 %362 to i64
  %min.i623922 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 0, i32 0
  %363 = load i32, i32* %min.i623922, align 4, !tbaa !76
  %sub.i923 = sub nsw i32 %dim0.0836, %363
  %conv7.i924 = sext i32 %sub.i923 to i64
  %mul.i925 = mul nsw i64 %conv7.i924, %conv.i622921
  %exitcond.not.i927 = icmp eq i32 %360, 1
  br i1 %exitcond.not.i927, label %_ZNK15halide_buffer_t10address_ofEPKi.exit, label %for.body.i.for.body.i_crit_edge.preheader, !llvm.loop !115

for.body.i.for.body.i_crit_edge.preheader:        ; preds = %for.body.lr.ph.i
  %stride.i62126 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 1, i32 2
  %364 = load i32, i32* %stride.i62126, align 4, !tbaa !77
  %conv.i62227 = sext i32 %364 to i64
  %min.i62328 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 1, i32 0
  %365 = load i32, i32* %min.i62328, align 4, !tbaa !76
  %sub.i29 = sub nsw i32 %dim1.0841, %365
  %conv7.i30 = sext i32 %sub.i29 to i64
  %mul.i31 = mul nsw i64 %conv7.i30, %conv.i62227
  %add.i62432 = add nsw i64 %mul.i31, %mul.i925
  %exitcond.not.i33 = icmp eq i32 %360, 2
  br i1 %exitcond.not.i33, label %_ZNK15halide_buffer_t10address_ofEPKi.exit, label %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph, !llvm.loop !115

for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph: ; preds = %for.body.i.for.body.i_crit_edge.preheader
  %366 = add nsw i64 %wide.trip.count.i, -2
  %min.iters.check169 = icmp ult i64 %366, 17
  br i1 %min.iters.check169, label %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader, label %vector.ph170

vector.ph170:                                     ; preds = %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph
  %n.mod.vf171 = and i64 %366, 15
  %367 = icmp eq i64 %n.mod.vf171, 0
  %368 = select i1 %367, i64 16, i64 %n.mod.vf171
  %n.vec172 = sub nsw i64 %366, %368
  %ind.end176 = add nsw i64 %n.vec172, 2
  %369 = insertelement <4 x i64> <i64 poison, i64 0, i64 0, i64 0>, i64 %add.i62432, i32 0
  br label %vector.body168

vector.body168:                                   ; preds = %vector.body168, %vector.ph170
  %index173 = phi i64 [ 0, %vector.ph170 ], [ %index.next174, %vector.body168 ]
  %vec.phi179 = phi <4 x i64> [ %369, %vector.ph170 ], [ %409, %vector.body168 ]
  %vec.phi180 = phi <4 x i64> [ zeroinitializer, %vector.ph170 ], [ %410, %vector.body168 ]
  %vec.phi181 = phi <4 x i64> [ zeroinitializer, %vector.ph170 ], [ %411, %vector.body168 ]
  %vec.phi182 = phi <4 x i64> [ zeroinitializer, %vector.ph170 ], [ %412, %vector.body168 ]
  %offset.idx178 = or i64 %index173, 2
  %370 = or i64 %index173, 6
  %371 = or i64 %index173, 10
  %372 = or i64 %index173, 14
  %373 = getelementptr inbounds [4 x i32], [4 x i32]* %idx, i64 0, i64 %offset.idx178
  %374 = bitcast i32* %373 to <4 x i32>*
  %wide.load183 = load <4 x i32>, <4 x i32>* %374, align 4, !tbaa !16
  %375 = getelementptr inbounds i32, i32* %373, i64 4
  %376 = bitcast i32* %375 to <4 x i32>*
  %wide.load184 = load <4 x i32>, <4 x i32>* %376, align 4, !tbaa !16
  %377 = getelementptr inbounds i32, i32* %373, i64 8
  %378 = bitcast i32* %377 to <4 x i32>*
  %wide.load185 = load <4 x i32>, <4 x i32>* %378, align 4, !tbaa !16
  %379 = getelementptr inbounds i32, i32* %373, i64 12
  %380 = bitcast i32* %379 to <4 x i32>*
  %wide.load186 = load <4 x i32>, <4 x i32>* %380, align 4, !tbaa !16
  %381 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 %offset.idx178, i32 2
  %382 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 %370, i32 2
  %383 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 %371, i32 2
  %384 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 %372, i32 2
  %385 = getelementptr inbounds i32, i32* %381, i64 -2
  %386 = bitcast i32* %385 to <16 x i32>*
  %387 = getelementptr inbounds i32, i32* %382, i64 -2
  %388 = bitcast i32* %387 to <16 x i32>*
  %389 = getelementptr inbounds i32, i32* %383, i64 -2
  %390 = bitcast i32* %389 to <16 x i32>*
  %391 = getelementptr inbounds i32, i32* %384, i64 -2
  %392 = bitcast i32* %391 to <16 x i32>*
  %wide.vec187 = load <16 x i32>, <16 x i32>* %386, align 4, !tbaa !16
  %wide.vec188 = load <16 x i32>, <16 x i32>* %388, align 4, !tbaa !16
  %wide.vec189 = load <16 x i32>, <16 x i32>* %390, align 4, !tbaa !16
  %wide.vec190 = load <16 x i32>, <16 x i32>* %392, align 4, !tbaa !16
  %strided.vec191 = shufflevector <16 x i32> %wide.vec187, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec192 = shufflevector <16 x i32> %wide.vec188, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec193 = shufflevector <16 x i32> %wide.vec189, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec194 = shufflevector <16 x i32> %wide.vec190, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec195 = shufflevector <16 x i32> %wide.vec187, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec196 = shufflevector <16 x i32> %wide.vec188, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec197 = shufflevector <16 x i32> %wide.vec189, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec198 = shufflevector <16 x i32> %wide.vec190, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %393 = sext <4 x i32> %strided.vec195 to <4 x i64>
  %394 = sext <4 x i32> %strided.vec196 to <4 x i64>
  %395 = sext <4 x i32> %strided.vec197 to <4 x i64>
  %396 = sext <4 x i32> %strided.vec198 to <4 x i64>
  %397 = sub nsw <4 x i32> %wide.load183, %strided.vec191
  %398 = sub nsw <4 x i32> %wide.load184, %strided.vec192
  %399 = sub nsw <4 x i32> %wide.load185, %strided.vec193
  %400 = sub nsw <4 x i32> %wide.load186, %strided.vec194
  %401 = sext <4 x i32> %397 to <4 x i64>
  %402 = sext <4 x i32> %398 to <4 x i64>
  %403 = sext <4 x i32> %399 to <4 x i64>
  %404 = sext <4 x i32> %400 to <4 x i64>
  %405 = mul nsw <4 x i64> %401, %393
  %406 = mul nsw <4 x i64> %402, %394
  %407 = mul nsw <4 x i64> %403, %395
  %408 = mul nsw <4 x i64> %404, %396
  %409 = add <4 x i64> %405, %vec.phi179
  %410 = add <4 x i64> %406, %vec.phi180
  %411 = add <4 x i64> %407, %vec.phi181
  %412 = add <4 x i64> %408, %vec.phi182
  %index.next174 = add i64 %index173, 16
  %413 = icmp eq i64 %index.next174, %n.vec172
  br i1 %413, label %middle.block166, label %vector.body168, !llvm.loop !116

middle.block166:                                  ; preds = %vector.body168
  %bin.rdx199 = add <4 x i64> %410, %409
  %bin.rdx200 = add <4 x i64> %411, %bin.rdx199
  %bin.rdx201 = add <4 x i64> %412, %bin.rdx200
  %414 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx201)
  br label %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader

for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader: ; preds = %middle.block166, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph
  %indvars.iv.next.i35.ph = phi i64 [ 2, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph ], [ %ind.end176, %middle.block166 ]
  %add.i62434.ph = phi i64 [ %add.i62432, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph ], [ %414, %middle.block166 ]
  br label %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge

for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge: ; preds = %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge
  %indvars.iv.next.i35 = phi i64 [ %indvars.iv.next.i, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge ], [ %indvars.iv.next.i35.ph, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader ]
  %add.i62434 = phi i64 [ %add.i624, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge ], [ %add.i62434.ph, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader ]
  %arrayidx3.i.phi.trans.insert.phi.trans.insert = getelementptr inbounds [4 x i32], [4 x i32]* %idx, i64 0, i64 %indvars.iv.next.i35
  %.pre895.pre = load i32, i32* %arrayidx3.i.phi.trans.insert.phi.trans.insert, align 4, !tbaa !16
  %stride.i621 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 %indvars.iv.next.i35, i32 2
  %415 = load i32, i32* %stride.i621, align 4, !tbaa !77
  %conv.i622 = sext i32 %415 to i64
  %min.i623 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %361, i64 %indvars.iv.next.i35, i32 0
  %416 = load i32, i32* %min.i623, align 4, !tbaa !76
  %sub.i = sub nsw i32 %.pre895.pre, %416
  %conv7.i = sext i32 %sub.i to i64
  %mul.i = mul nsw i64 %conv7.i, %conv.i622
  %add.i624 = add nsw i64 %mul.i, %add.i62434
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.next.i35, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i
  br i1 %exitcond.not.i, label %_ZNK15halide_buffer_t10address_ofEPKi.exit, label %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge, !llvm.loop !117

_ZNK15halide_buffer_t10address_ofEPKi.exit:       ; preds = %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge, %for.body.i.for.body.i_crit_edge.preheader, %for.body.lr.ph.i, %for.body355
  %index.0.lcssa.i = phi i64 [ 0, %for.body355 ], [ %mul.i925, %for.body.lr.ph.i ], [ %add.i62432, %for.body.i.for.body.i_crit_edge.preheader ], [ %add.i624, %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge ]
  %417 = load i8*, i8** %host.i, align 8, !tbaa !67
  %418 = load i8, i8* %bits.i, align 1, !tbaa !28
  %conv.i.i = zext i8 %418 to i64
  %add.i.i = add nuw nsw i64 %conv.i.i, 7
  %div.i.i = lshr i64 %add.i.i, 3
  %mul9.i = mul nsw i64 %div.i.i, %index.0.lcssa.i
  %add.ptr.i = getelementptr inbounds i8, i8* %417, i64 %mul9.i
  %mul366 = mul nsw i32 %counter.3835, %div.i
  %idx.ext = sext i32 %mul366 to i64
  %add.ptr367 = getelementptr inbounds [4096 x i8], [4096 x i8]* %temp, i64 0, i64 %idx.ext
  %call369 = call i8* @memcpy(i8* nonnull %add.ptr367, i8* %add.ptr.i, i64 %conv368) #16
  %cmp370 = icmp eq i32 %inc356, %div
  br i1 %cmp370, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit619, label %for.inc384

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit619: ; preds = %_ZNK15halide_buffer_t10address_ofEPKi.exit
  %call.i615 = call i64 @fwrite(i8* nonnull %340, i64 %conv374, i64 1, i8* nonnull %call.i598) #16
  %cmp.i616.not = icmp eq i64 %call.i615, 0
  br i1 %cmp.i616.not, label %cleanup425.loopexit, label %for.inc384

for.inc384:                                       ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit619, %_ZNK15halide_buffer_t10address_ofEPKi.exit
  %counter.4 = phi i32 [ 0, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit619 ], [ %inc356, %_ZNK15halide_buffer_t10address_ofEPKi.exit ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %343) #11
  %inc385 = add nsw i32 %dim0.0836, 1
  %419 = load i32, i32* %extent.i, align 4, !tbaa !73
  %420 = load i32, i32* %min.i, align 4, !tbaa !76
  %add352 = add nsw i32 %420, %419
  %cmp353 = icmp slt i32 %inc385, %add352
  br i1 %cmp353, label %for.body355, label %for.inc389.loopexit, !llvm.loop !118

for.inc389.loopexit:                              ; preds = %for.inc384
  %.pre15 = load i32, i32* %extent.i.1, align 4, !tbaa !73
  %.pre16 = load i32, i32* %min.i.1, align 4, !tbaa !76
  br label %for.inc389

for.inc389:                                       ; preds = %for.inc389.loopexit, %for.body344
  %421 = phi i32 [ %356, %for.body344 ], [ %.pre16, %for.inc389.loopexit ]
  %422 = phi i32 [ %357, %for.body344 ], [ %.pre15, %for.inc389.loopexit ]
  %423 = phi i32 [ %358, %for.body344 ], [ %419, %for.inc389.loopexit ]
  %counter.6797 = phi i32 [ %counter.2840, %for.body344 ], [ %counter.4, %for.inc389.loopexit ]
  %inc390 = add nsw i32 %dim1.0841, 1
  %add341 = add nsw i32 %421, %422
  %cmp342 = icmp slt i32 %inc390, %add341
  br i1 %cmp342, label %for.body344, label %for.inc394.loopexit, !llvm.loop !119

for.inc394.loopexit:                              ; preds = %for.inc389
  %.pre896 = load i32, i32* %extent.i.2, align 4, !tbaa !73
  %.pre897 = load i32, i32* %min.i.2, align 4, !tbaa !76
  br label %for.inc394

for.inc394:                                       ; preds = %for.inc394.loopexit, %for.body333
  %424 = phi i32 [ %350, %for.body333 ], [ %421, %for.inc394.loopexit ]
  %425 = phi i32 [ %351, %for.body333 ], [ %422, %for.inc394.loopexit ]
  %426 = phi i32 [ %352, %for.body333 ], [ %.pre897, %for.inc394.loopexit ]
  %427 = phi i32 [ %353, %for.body333 ], [ %.pre896, %for.inc394.loopexit ]
  %428 = phi i32 [ %354, %for.body333 ], [ %422, %for.inc394.loopexit ]
  %429 = phi i32 [ %355, %for.body333 ], [ %421, %for.inc394.loopexit ]
  %counter.2.lcssa = phi i32 [ %counter.1849, %for.body333 ], [ %counter.6797, %for.inc394.loopexit ]
  %inc395 = add nsw i32 %dim2.0850, 1
  %add330 = add nsw i32 %427, %426
  %cmp331 = icmp slt i32 %inc395, %add330
  br i1 %cmp331, label %for.body333, label %for.inc399.loopexit, !llvm.loop !120

for.inc399.loopexit:                              ; preds = %for.inc394
  %.pre898 = load i32, i32* %extent.i.3, align 4, !tbaa !73
  %.pre899 = load i32, i32* %min.i.3, align 4, !tbaa !76
  br label %for.inc399

for.inc399:                                       ; preds = %for.inc399.loopexit, %for.body322
  %430 = phi i32 [ %344, %for.body322 ], [ %.pre899, %for.inc399.loopexit ]
  %431 = phi i32 [ %345, %for.body322 ], [ %.pre898, %for.inc399.loopexit ]
  %432 = phi i32 [ %346, %for.body322 ], [ %426, %for.inc399.loopexit ]
  %433 = phi i32 [ %347, %for.body322 ], [ %427, %for.inc399.loopexit ]
  %434 = phi i32 [ %348, %for.body322 ], [ %427, %for.inc399.loopexit ]
  %435 = phi i32 [ %349, %for.body322 ], [ %426, %for.inc399.loopexit ]
  %counter.1.lcssa = phi i32 [ %counter.0857, %for.body322 ], [ %counter.2.lcssa, %for.inc399.loopexit ]
  %inc400 = add nsw i32 %dim3.0858, 1
  %add319 = add nsw i32 %431, %430
  %cmp320 = icmp slt i32 %inc400, %add319
  br i1 %cmp320, label %for.body322, label %for.end403, !llvm.loop !121

for.end403:                                       ; preds = %for.inc399
  %cmp404 = icmp sgt i32 %counter.1.lcssa, 0
  br i1 %cmp404, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit612, label %if.end412

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit612: ; preds = %for.end403
  %mul407 = mul nsw i32 %counter.1.lcssa, %div.i
  %conv408 = sext i32 %mul407 to i64
  %call.i608 = call i64 @fwrite(i8* nonnull %340, i64 %conv408, i64 1, i8* nonnull %call.i598) #16
  %cmp.i609.not = icmp eq i64 %call.i608, 0
  br i1 %cmp.i609.not, label %cleanup425, label %if.end412

if.end412:                                        ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit612, %for.end403, %if.end311
  %436 = bitcast i64* %zero to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %436) #11
  store i64 0, i64* %zero, align 8, !tbaa !59
  %tobool413.not = icmp eq i32 %final_padding_bytes.0, 0
  br i1 %tobool413.not, label %if.end423, label %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit

_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit: ; preds = %if.end412
  %conv415 = zext i32 %final_padding_bytes.0 to i64
  %call.i604 = call i64 @fwrite(i8* nonnull %436, i64 %conv415, i64 1, i8* nonnull %call.i598) #16
  %cmp.i605.not = icmp eq i64 %call.i604, 0
  br i1 %cmp.i605.not, label %cleanup424, label %if.end423

if.end423:                                        ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit, %if.end412
  br label %cleanup424

cleanup424:                                       ; preds = %if.end423, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit
  %retval.21 = phi i32 [ 0, %if.end423 ], [ -16, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %436) #11
  br label %cleanup425

cleanup425.loopexit:                              ; preds = %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit619
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %343) #11
  br label %cleanup425

cleanup425:                                       ; preds = %cleanup425.loopexit, %cleanup424, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit612
  %retval.22 = phi i32 [ %retval.21, %cleanup424 ], [ -14, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit612 ], [ -13, %cleanup425.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %340) #11
  br label %cleanup433

cleanup433:                                       ; preds = %cleanup425, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit631, %cleanup278, %cleanup278.thread, %cleanup154
  %retval.23 = phi i32 [ %retval.22, %cleanup425 ], [ %retval.4, %cleanup154 ], [ %retval.8, %cleanup278 ], [ -12, %_ZN6Halide7Runtime8Internal10ScopedFile5writeEPKvm.exit631 ], [ -6, %cleanup278.thread ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %3) #11
  %call.i = call i32 @fclose(i8* nonnull %call.i598) #16
  br label %return

return:                                           ; preds = %cleanup433, %if.end6, %if.end2, %if.then1, %if.then
  %retval.26 = phi i32 [ -1, %if.then ], [ -1, %if.then1 ], [ %call3, %if.end2 ], [ %retval.23, %cleanup433 ], [ -2, %if.end6 ]
  ret i32 %retval.26

for.body.1:                                       ; preds = %for.body.lr.ph
  %arrayidx.1 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i64 1
  %arrayidx14.1 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 1
  %437 = bitcast %struct.halide_dimension_t* %arrayidx14.1 to i8*
  %438 = bitcast %struct.halide_dimension_t* %arrayidx.1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %437, i8* nonnull align 4 dereferenceable(16) %438, i64 16, i1 false), !tbaa.struct !72
  %extent.1 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 1, i32 1
  %439 = load i32, i32* %extent.1, align 4, !tbaa !73
  %conv903.1 = zext i32 %439 to i64
  %mul.1 = mul nuw i64 %conv903, %conv903.1
  %exitcond.not17.1 = icmp eq i64 %11, 2
  br i1 %exitcond.not17.1, label %for.cond19.preheader, label %for.body.2, !llvm.loop !75

for.body.2:                                       ; preds = %for.body.1
  %arrayidx.2 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i64 2
  %arrayidx14.2 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 2
  %440 = bitcast %struct.halide_dimension_t* %arrayidx14.2 to i8*
  %441 = bitcast %struct.halide_dimension_t* %arrayidx.2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %440, i8* nonnull align 4 dereferenceable(16) %441, i64 16, i1 false), !tbaa.struct !72
  %extent.2 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 2, i32 1
  %442 = load i32, i32* %extent.2, align 4, !tbaa !73
  %conv903.2 = zext i32 %442 to i64
  %mul.2 = mul i64 %mul.1, %conv903.2
  %exitcond.not17.2 = icmp eq i64 %11, 3
  br i1 %exitcond.not17.2, label %for.cond19.preheader, label %for.body.3, !llvm.loop !75

for.body.3:                                       ; preds = %for.body.2
  %arrayidx.3 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %7, i64 3
  %arrayidx14.3 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 3
  %443 = bitcast %struct.halide_dimension_t* %arrayidx14.3 to i8*
  %444 = bitcast %struct.halide_dimension_t* %arrayidx.3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %443, i8* nonnull align 4 dereferenceable(16) %444, i64 16, i1 false), !tbaa.struct !72
  %extent.3 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %shape, i64 0, i64 3, i32 1
  %445 = load i32, i32* %extent.3, align 4, !tbaa !73
  %conv903.3 = zext i32 %445 to i64
  %mul.3 = mul i64 %mul.2, %conv903.3
  br label %for.cond19.preheader
}

declare i64 @fwrite(i8*, i64, i64, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_cache_cleanup() #0 {
entry:
  tail call void @halide_memoization_cache_cleanup() #17
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_memoization_cache_cleanup() local_unnamed_addr #0 {
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %while.end
  store i64 0, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  ret void

for.body:                                         ; preds = %while.end, %entry
  %__begin1.018 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ getelementptr inbounds ([256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 0), %entry ], [ %incdec.ptr, %while.end ]
  %0 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %__begin1.018, align 8, !tbaa !12
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %__begin1.018, align 8, !tbaa !12
  %cmp2.not16 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %0, null
  br i1 %cmp2.not16, label %while.end, label %while.body

while.body:                                       ; preds = %for.body, %while.body
  %entry1.017 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %1, %while.body ], [ %0, %for.body ]
  %next3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.017, i64 0, i32 0
  %1 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next3, align 8, !tbaa !122
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %entry1.017) #17
  %2 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.017 to i8*
  tail call void @halide_free(i8* null, i8* nonnull %2) #16
  %cmp2.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %1, null
  br i1 %cmp2.not, label %while.end, label %while.body, !llvm.loop !125

while.end:                                        ; preds = %while.body, %for.body
  %incdec.ptr = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %__begin1.018, i64 1
  %cmp.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"** %incdec.ptr, getelementptr inbounds ([256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 1, i64 0)
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %this) local_unnamed_addr #0 align 2 {
entry:
  %tuple_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 8
  %0 = load i32, i32* %tuple_count, align 8, !tbaa !126
  %cmp11.not = icmp eq i32 %0, 0
  br i1 %cmp11.not, label %for.cond.cleanup, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %buf = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 11
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %metadata_storage = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 3
  %1 = load i8*, i8** %metadata_storage, align 8, !tbaa !127
  tail call void @halide_free(i8* null, i8* %1) #16
  ret void

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf, align 8, !tbaa !128
  %arrayidx = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 %indvars.iv
  %call = tail call i32 @halide_device_free(i8* null, %struct.halide_buffer_t* %arrayidx) #16
  %3 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf, align 8, !tbaa !128
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 %indvars.iv, i32 2
  %4 = load i8*, i8** %host, align 8, !tbaa !67
  %call6 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %4) #17
  %5 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call6 to i8*
  tail call void @halide_free(i8* null, i8* %5) #16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = load i32, i32* %tuple_count, align 8, !tbaa !126
  %7 = zext i32 %6 to i64
  %cmp = icmp ult i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !llvm.loop !129
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %host) local_unnamed_addr #2 {
entry:
  %add.ptr = getelementptr inbounds i8, i8* %host, i64 -64
  %0 = bitcast i8* %add.ptr to %"struct.Halide::Runtime::Internal::CacheBlockHeader"*
  ret %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %0
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %d, i64 %src_off, i64 %dst_off) local_unnamed_addr #0 {
entry:
  %cmp41 = icmp sgt i32 %d, -1
  br i1 %cmp41, label %land.rhs, label %while.end

land.rhs:                                         ; preds = %entry, %while.body
  %d.addr.042 = phi i32 [ %dec, %while.body ], [ %d, %entry ]
  %idxprom36 = zext i32 %d.addr.042 to i64
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 3, i64 %idxprom36
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !59
  %cmp1 = icmp eq i64 %0, 1
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %land.rhs
  %dec = add nsw i32 %d.addr.042, -1
  %cmp = icmp sgt i32 %d.addr.042, 0
  br i1 %cmp, label %land.rhs, label %if.then, !llvm.loop !130

while.end:                                        ; preds = %land.rhs, %entry
  %d.addr.0.lcssa = phi i32 [ %d, %entry ], [ %d.addr.042, %land.rhs ]
  %cmp2 = icmp eq i32 %d.addr.0.lcssa, -1
  br i1 %cmp2, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %while.end
  %idxprom5 = sext i32 %d.addr.0.lcssa to i64
  %arrayidx6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 3, i64 %idxprom5
  %1 = load i64, i64* %arrayidx6, align 8, !tbaa !59
  %cmp737.not = icmp eq i64 %1, 0
  br i1 %cmp737.not, label %if.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %sub = add nsw i32 %d.addr.0.lcssa, -1
  %arrayidx9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 4, i64 %idxprom5
  %arrayidx12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 5, i64 %idxprom5
  br label %for.body

if.then:                                          ; preds = %while.body, %while.end
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 0
  %2 = load i64, i64* %src, align 8, !tbaa !131
  %add = add i64 %2, %src_off
  %3 = inttoptr i64 %add to i8*
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 1
  %4 = load i64, i64* %dst, align 8, !tbaa !133
  %add3 = add i64 %4, %dst_off
  %5 = inttoptr i64 %add3 to i8*
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 6
  %6 = load i64, i64* %chunk_size, align 8, !tbaa !134
  %call = tail call i8* @memcpy(i8* %5, i8* %3, i64 %6) #16
  br label %if.end

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.040 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %src_off.addr.039 = phi i64 [ %src_off, %for.body.lr.ph ], [ %add10, %for.body ]
  %dst_off.addr.038 = phi i64 [ %dst_off, %for.body.lr.ph ], [ %add13, %for.body ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 %sub, i64 %src_off.addr.039, i64 %dst_off.addr.038) #17
  %7 = load i64, i64* %arrayidx9, align 8, !tbaa !59
  %add10 = add i64 %7, %src_off.addr.039
  %8 = load i64, i64* %arrayidx12, align 8, !tbaa !59
  %add13 = add i64 %8, %dst_off.addr.038
  %inc = add nuw i64 %i.040, 1
  %9 = load i64, i64* %arrayidx6, align 8, !tbaa !59
  %cmp7 = icmp ult i64 %inc, %9
  br i1 %cmp7, label %for.body, label %if.end, !llvm.loop !135

if.end:                                           ; preds = %for.body, %if.then, %for.cond.preheader
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i8* %user_context) local_unnamed_addr #0 {
entry:
  %src = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 0
  %0 = load i64, i64* %src, align 8, !tbaa !131
  %dst = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 1
  %1 = load i64, i64* %dst, align 8, !tbaa !133
  %cmp.not = icmp eq i64 %0, %1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %copy, i64 0, i32 2
  %2 = load i64, i64* %src_begin, align 8, !tbaa !136
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %copy, i32 15, i64 %2, i64 0) #17
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
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 2
  %1 = load i8*, i8** %host, align 8, !tbaa !67
  %2 = ptrtoint i8* %1 to i64
  br label %cond.end

cond.false:                                       ; preds = %entry
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 0
  %3 = load i64, i64* %device, align 8, !tbaa !69
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %2, %cond.true ], [ %3, %cond.false ]
  %src2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 0
  store i64 %cond, i64* %src2, align 8, !tbaa !131
  br i1 %dst_host, label %cond.true4, label %cond.false6

cond.true4:                                       ; preds = %cond.end
  %host5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 2
  %4 = load i8*, i8** %host5, align 8, !tbaa !67
  %5 = ptrtoint i8* %4 to i64
  br label %cond.end8

cond.false6:                                      ; preds = %cond.end
  %device7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 0
  %6 = load i64, i64* %device7, align 8, !tbaa !69
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true4
  %cond9 = phi i64 [ %5, %cond.true4 ], [ %6, %cond.false6 ]
  %dst10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 1
  store i64 %cond9, i64* %dst10, align 8, !tbaa !133
  %bits.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 4, i32 1
  %7 = load i8, i8* %bits.i, align 1, !tbaa !28
  %conv.i = zext i8 %7 to i32
  %add.i = add nuw nsw i32 %conv.i, 7
  %div.i = lshr i32 %add.i, 3
  %conv = zext i32 %div.i to i64
  %chunk_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 6
  store i64 %conv, i64* %chunk_size, align 8, !tbaa !134
  %arrayidx = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 0
  %arrayidx12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 0
  %arrayidx14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 0
  %arrayidx.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 1
  %arrayidx12.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 1
  %arrayidx14.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 1
  %8 = bitcast i64* %arrayidx to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %8, align 8, !tbaa !59
  %9 = bitcast i64* %arrayidx12 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %9, align 8, !tbaa !59
  %10 = bitcast i64* %arrayidx14 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %10, align 8, !tbaa !59
  %arrayidx.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 4
  %arrayidx12.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 4
  %arrayidx14.4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 4
  %arrayidx.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 5
  %arrayidx12.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 5
  %arrayidx14.5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 5
  %11 = bitcast i64* %arrayidx.4 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %11, align 8, !tbaa !59
  %12 = bitcast i64* %arrayidx12.4 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %12, align 8, !tbaa !59
  %13 = bitcast i64* %arrayidx14.4 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %13, align 8, !tbaa !59
  %arrayidx.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 8
  %arrayidx12.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 8
  %arrayidx14.8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 8
  %arrayidx.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 9
  %arrayidx12.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 9
  %arrayidx14.9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 9
  %14 = bitcast i64* %arrayidx.8 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %14, align 8, !tbaa !59
  %15 = bitcast i64* %arrayidx12.8 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %15, align 8, !tbaa !59
  %16 = bitcast i64* %arrayidx14.8 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %16, align 8, !tbaa !59
  %arrayidx.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 12
  %arrayidx12.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 12
  %arrayidx14.12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 12
  %arrayidx.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 13
  %arrayidx12.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 13
  %arrayidx14.13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 13
  %arrayidx.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 14
  %arrayidx12.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 14
  %arrayidx14.14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 14
  %arrayidx.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 15
  %17 = bitcast i64* %arrayidx.12 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %17, align 8, !tbaa !59
  %arrayidx12.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 15
  %18 = bitcast i64* %arrayidx12.12 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %18, align 8, !tbaa !59
  %arrayidx14.15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 15
  %19 = bitcast i64* %arrayidx14.12 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %19, align 8, !tbaa !59
  %src_begin = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 2
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 5
  %20 = load i32, i32* %dimensions, align 4, !tbaa !70
  %cmp17272 = icmp sgt i32 %20, 0
  br i1 %cmp17272, label %for.body19.lr.ph, label %for.cond.cleanup18

for.body19.lr.ph:                                 ; preds = %cond.end8
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 6
  %21 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !71
  %dim23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 6
  %22 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim23, align 8, !tbaa !71
  %wide.trip.count = zext i32 %20 to i64
  %min.iters.check = icmp ult i32 %20, 17
  br i1 %min.iters.check, label %for.body19.preheader, label %vector.ph

for.body19.preheader:                             ; preds = %middle.block, %for.body19.lr.ph
  %indvars.iv284.ph = phi i64 [ 0, %for.body19.lr.ph ], [ %n.vec, %middle.block ]
  %.ph = phi i64 [ 0, %for.body19.lr.ph ], [ %73, %middle.block ]
  br label %for.body19

vector.ph:                                        ; preds = %for.body19.lr.ph
  %n.mod.vf = and i64 %wide.trip.count, 15
  %23 = icmp eq i64 %n.mod.vf, 0
  %24 = select i1 %23, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %wide.trip.count, %24
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %68, %vector.body ]
  %vec.phi2 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %69, %vector.body ]
  %vec.phi3 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %70, %vector.body ]
  %vec.phi4 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %71, %vector.body ]
  %25 = or i64 %index, 4
  %26 = or i64 %index, 8
  %27 = or i64 %index, 12
  %28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %index, i32 2
  %29 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %25, i32 2
  %30 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %26, i32 2
  %31 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %27, i32 2
  %32 = getelementptr inbounds i32, i32* %28, i64 -2
  %33 = bitcast i32* %32 to <16 x i32>*
  %34 = getelementptr inbounds i32, i32* %29, i64 -2
  %35 = bitcast i32* %34 to <16 x i32>*
  %36 = getelementptr inbounds i32, i32* %30, i64 -2
  %37 = bitcast i32* %36 to <16 x i32>*
  %38 = getelementptr inbounds i32, i32* %31, i64 -2
  %39 = bitcast i32* %38 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %33, align 4, !tbaa !16
  %wide.vec5 = load <16 x i32>, <16 x i32>* %35, align 4, !tbaa !16
  %wide.vec6 = load <16 x i32>, <16 x i32>* %37, align 4, !tbaa !16
  %wide.vec7 = load <16 x i32>, <16 x i32>* %39, align 4, !tbaa !16
  %strided.vec11 = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec12 = shufflevector <16 x i32> %wide.vec5, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec13 = shufflevector <16 x i32> %wide.vec6, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec14 = shufflevector <16 x i32> %wide.vec7, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %40 = sext <4 x i32> %strided.vec11 to <4 x i64>
  %41 = sext <4 x i32> %strided.vec12 to <4 x i64>
  %42 = sext <4 x i32> %strided.vec13 to <4 x i64>
  %43 = sext <4 x i32> %strided.vec14 to <4 x i64>
  %44 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %index, i32 0
  %45 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %25, i32 0
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %26, i32 0
  %47 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %27, i32 0
  %48 = bitcast i32* %44 to <16 x i32>*
  %49 = bitcast i32* %45 to <16 x i32>*
  %50 = bitcast i32* %46 to <16 x i32>*
  %51 = bitcast i32* %47 to <16 x i32>*
  %wide.vec15 = load <16 x i32>, <16 x i32>* %48, align 4, !tbaa !76
  %wide.vec16 = load <16 x i32>, <16 x i32>* %49, align 4, !tbaa !76
  %wide.vec17 = load <16 x i32>, <16 x i32>* %50, align 4, !tbaa !76
  %wide.vec18 = load <16 x i32>, <16 x i32>* %51, align 4, !tbaa !76
  %52 = sub nsw <16 x i32> %wide.vec15, %wide.vec
  %53 = shufflevector <16 x i32> %52, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %54 = sub nsw <16 x i32> %wide.vec16, %wide.vec5
  %55 = shufflevector <16 x i32> %54, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %56 = sub nsw <16 x i32> %wide.vec17, %wide.vec6
  %57 = shufflevector <16 x i32> %56, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %58 = sub nsw <16 x i32> %wide.vec18, %wide.vec7
  %59 = shufflevector <16 x i32> %58, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %60 = sext <4 x i32> %53 to <4 x i64>
  %61 = sext <4 x i32> %55 to <4 x i64>
  %62 = sext <4 x i32> %57 to <4 x i64>
  %63 = sext <4 x i32> %59 to <4 x i64>
  %64 = mul nsw <4 x i64> %60, %40
  %65 = mul nsw <4 x i64> %61, %41
  %66 = mul nsw <4 x i64> %62, %42
  %67 = mul nsw <4 x i64> %63, %43
  %68 = add <4 x i64> %64, %vec.phi
  %69 = add <4 x i64> %65, %vec.phi2
  %70 = add <4 x i64> %66, %vec.phi3
  %71 = add <4 x i64> %67, %vec.phi4
  %index.next = add i64 %index, 16
  %72 = icmp eq i64 %index.next, %n.vec
  br i1 %72, label %middle.block, label %vector.body, !llvm.loop !137

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %69, %68
  %bin.rdx23 = add <4 x i64> %70, %bin.rdx
  %bin.rdx24 = add <4 x i64> %71, %bin.rdx23
  %73 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx24)
  br label %for.body19.preheader

for.cond.cleanup18:                               ; preds = %for.body19, %cond.end8
  %74 = phi i64 [ 0, %cond.end8 ], [ %add, %for.body19 ]
  %mul37 = mul i64 %74, %conv
  store i64 %mul37, i64* %src_begin, align 8, !tbaa !136
  %dimensions39 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 5
  %75 = load i32, i32* %dimensions39, align 4, !tbaa !70
  %cmp40.not = icmp eq i32 %20, %75
  br i1 %cmp40.not, label %lor.lhs.false, label %if.then

for.body19:                                       ; preds = %for.body19.preheader, %for.body19
  %indvars.iv284 = phi i64 [ %indvars.iv.next285, %for.body19 ], [ %indvars.iv284.ph, %for.body19.preheader ]
  %76 = phi i64 [ %add, %for.body19 ], [ %.ph, %for.body19.preheader ]
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %indvars.iv284, i32 2
  %77 = load i32, i32* %stride, align 4, !tbaa !77
  %conv22 = sext i32 %77 to i64
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %indvars.iv284, i32 0
  %78 = load i32, i32* %min, align 4, !tbaa !76
  %min29 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %indvars.iv284, i32 0
  %79 = load i32, i32* %min29, align 4, !tbaa !76
  %sub = sub nsw i32 %78, %79
  %conv30 = sext i32 %sub to i64
  %mul = mul nsw i64 %conv30, %conv22
  %add = add i64 %mul, %76
  %indvars.iv.next285 = add nuw nsw i64 %indvars.iv284, 1
  %exitcond286.not = icmp eq i64 %indvars.iv.next285, %wide.trip.count
  br i1 %exitcond286.not, label %for.cond.cleanup18, label %for.body19, !llvm.loop !138

lor.lhs.false:                                    ; preds = %for.cond.cleanup18
  %bits.i253 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 4, i32 1
  %80 = load i8, i8* %bits.i253, align 1, !tbaa !28
  %conv.i254 = zext i8 %80 to i32
  %add.i255 = add nuw nsw i32 %conv.i254, 7
  %div.i256 = lshr i32 %add.i255, 3
  %cmp45.not = icmp ne i32 %div.i, %div.i256
  %cmp48 = icmp sgt i32 %20, 16
  %or.cond261 = or i1 %cmp48, %cmp45.not
  br i1 %or.cond261, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.cond.cleanup18
  %81 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %81, i8 0, i64 416, i1 false)
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %cmp50 = icmp eq i32 %div.i, 0
  br i1 %cmp50, label %if.then51, label %for.cond54.preheader

for.cond54.preheader:                             ; preds = %if.end
  br i1 %cmp17272, label %for.body58.lr.ph, label %while.end

for.body58.lr.ph:                                 ; preds = %for.cond54.preheader
  %dim60 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 6
  %82 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim60, align 8, !tbaa !71
  %dim70 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 6
  %83 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim70, align 8, !tbaa !71
  %wide.trip.count282 = zext i32 %20 to i64
  br label %for.body58

if.then51:                                        ; preds = %if.end
  %84 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %84, i8 0, i64 416, i1 false)
  br label %cleanup

while.cond.preheader:                             ; preds = %for.cond.cleanup94
  %.pre = load i64, i64* %chunk_size, align 8, !tbaa !134
  %.pre290 = load i64, i64* %arrayidx12, align 8, !tbaa !59
  %cmp139263 = icmp eq i64 %.pre, %.pre290
  br i1 %cmp139263, label %land.rhs.lr.ph, label %while.end

land.rhs.lr.ph:                                   ; preds = %while.cond.preheader
  %.pre291 = load i64, i64* %arrayidx14, align 8, !tbaa !59
  %85 = bitcast i64* %arrayidx.1 to <4 x i64>*
  %86 = bitcast i64* %arrayidx to <4 x i64>*
  %87 = bitcast i64* %arrayidx12.1 to <4 x i64>*
  %88 = bitcast i64* %arrayidx12 to <4 x i64>*
  %89 = bitcast i64* %arrayidx14.1 to <4 x i64>*
  %90 = bitcast i64* %arrayidx14 to <4 x i64>*
  %91 = bitcast i64* %arrayidx.5 to <4 x i64>*
  %92 = bitcast i64* %arrayidx.4 to <4 x i64>*
  %93 = bitcast i64* %arrayidx12.5 to <4 x i64>*
  %94 = bitcast i64* %arrayidx12.4 to <4 x i64>*
  %95 = bitcast i64* %arrayidx14.5 to <4 x i64>*
  %96 = bitcast i64* %arrayidx14.4 to <4 x i64>*
  %97 = bitcast i64* %arrayidx.9 to <4 x i64>*
  %98 = bitcast i64* %arrayidx.8 to <4 x i64>*
  %99 = bitcast i64* %arrayidx12.9 to <4 x i64>*
  %100 = bitcast i64* %arrayidx12.8 to <4 x i64>*
  %101 = bitcast i64* %arrayidx14.9 to <4 x i64>*
  %102 = bitcast i64* %arrayidx14.8 to <4 x i64>*
  %103 = bitcast i64* %arrayidx.13 to <2 x i64>*
  %104 = bitcast i64* %arrayidx.12 to <2 x i64>*
  %105 = bitcast i64* %arrayidx12.13 to <2 x i64>*
  %106 = bitcast i64* %arrayidx12.12 to <2 x i64>*
  %107 = bitcast i64* %arrayidx14.13 to <2 x i64>*
  %108 = bitcast i64* %arrayidx14.12 to <2 x i64>*
  br label %land.rhs

for.body58:                                       ; preds = %for.cond.cleanup94, %for.body58.lr.ph
  %indvars.iv278 = phi i64 [ 0, %for.body58.lr.ph ], [ %indvars.iv.next279, %for.cond.cleanup94 ]
  %stride63 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %82, i64 %indvars.iv278, i32 2
  %109 = load i32, i32* %stride63, align 4, !tbaa !77
  %conv64 = sext i32 %109 to i64
  %mul68 = mul nsw i64 %conv64, %conv
  %stride73 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %indvars.iv278, i32 2
  %110 = load i32, i32* %stride73, align 4, !tbaa !77
  %conv74 = sext i32 %110 to i64
  %mul78 = mul nsw i64 %conv74, %conv
  %cmp80264.not = icmp eq i64 %indvars.iv278, 0
  br i1 %cmp80264.not, label %for.end91, label %for.body81.lr.ph

for.body81.lr.ph:                                 ; preds = %for.body58
  %cmp86.not = icmp eq i64 %mul68, 0
  br i1 %cmp86.not, label %for.body81.preheader, label %for.body81.us

for.body81.preheader:                             ; preds = %for.body81.lr.ph
  %111 = trunc i64 %indvars.iv278 to i32
  br label %for.end91

for.body81.us:                                    ; preds = %for.body81.lr.ph, %for.inc89.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc89.us ], [ 0, %for.body81.lr.ph ]
  %arrayidx84.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv
  %112 = load i64, i64* %arrayidx84.us, align 8, !tbaa !59
  %cmp85.us = icmp ult i64 %mul68, %112
  br i1 %cmp85.us, label %for.end91.loopexit, label %for.inc89.us

for.inc89.us:                                     ; preds = %for.body81.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %indvars.iv278
  br i1 %exitcond.not, label %for.end91.loopexit, label %for.body81.us, !llvm.loop !139

for.end91.loopexit:                               ; preds = %for.inc89.us, %for.body81.us
  %insert.0.lcssa.ph.in = phi i64 [ %indvars.iv278, %for.inc89.us ], [ %indvars.iv, %for.body81.us ]
  %insert.0.lcssa.ph = trunc i64 %insert.0.lcssa.ph.in to i32
  br label %for.end91

for.end91:                                        ; preds = %for.end91.loopexit, %for.body81.preheader, %for.body58
  %insert.0.lcssa = phi i32 [ 0, %for.body58 ], [ %insert.0.lcssa.ph, %for.end91.loopexit ], [ %111, %for.body81.preheader ]
  %113 = zext i32 %insert.0.lcssa to i64
  %cmp93267 = icmp ugt i64 %indvars.iv278, %113
  br i1 %cmp93267, label %for.body95.preheader, label %for.cond.cleanup94

for.body95.preheader:                             ; preds = %for.end91
  %114 = sext i32 %insert.0.lcssa to i64
  %115 = sub i64 %indvars.iv278, %114
  %116 = xor i64 %114, -1
  %117 = add i64 %indvars.iv278, %116
  %xtraiter = and i64 %115, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body95.prol.loopexit, label %for.body95.prol

for.body95.prol:                                  ; preds = %for.body95.preheader, %for.body95.prol
  %indvars.iv280.prol = phi i64 [ %indvars.iv.next281.prol, %for.body95.prol ], [ %indvars.iv278, %for.body95.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body95.prol ], [ %xtraiter, %for.body95.preheader ]
  %indvars.iv.next281.prol = add nsw i64 %indvars.iv280.prol, -1
  %arrayidx99.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281.prol
  %118 = load i64, i64* %arrayidx99.prol, align 8, !tbaa !59
  %arrayidx102.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv280.prol
  store i64 %118, i64* %arrayidx102.prol, align 8, !tbaa !59
  %arrayidx106.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281.prol
  %119 = load i64, i64* %arrayidx106.prol, align 8, !tbaa !59
  %arrayidx109.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv280.prol
  store i64 %119, i64* %arrayidx109.prol, align 8, !tbaa !59
  %arrayidx113.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281.prol
  %120 = load i64, i64* %arrayidx113.prol, align 8, !tbaa !59
  %arrayidx116.prol = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv280.prol
  store i64 %120, i64* %arrayidx116.prol, align 8, !tbaa !59
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %for.body95.prol.loopexit, label %for.body95.prol, !llvm.loop !140

for.body95.prol.loopexit:                         ; preds = %for.body95.prol, %for.body95.preheader
  %indvars.iv280.unr = phi i64 [ %indvars.iv278, %for.body95.preheader ], [ %indvars.iv.next281.prol, %for.body95.prol ]
  %121 = icmp ult i64 %117, 3
  br i1 %121, label %for.cond.cleanup94, label %for.body95

for.cond.cleanup94:                               ; preds = %for.body95.prol.loopexit, %for.body95, %for.end91
  %extent122 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %82, i64 %indvars.iv278, i32 1
  %122 = load i32, i32* %extent122, align 4, !tbaa !73
  %conv123 = sext i32 %122 to i64
  %arrayidx126 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %113
  store i64 %conv123, i64* %arrayidx126, align 8, !tbaa !59
  %arrayidx129 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %113
  store i64 %mul68, i64* %arrayidx129, align 8, !tbaa !59
  %arrayidx132 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %113
  store i64 %mul78, i64* %arrayidx132, align 8, !tbaa !59
  %indvars.iv.next279 = add nuw nsw i64 %indvars.iv278, 1
  %exitcond283.not = icmp eq i64 %indvars.iv.next279, %wide.trip.count282
  br i1 %exitcond283.not, label %while.cond.preheader, label %for.body58, !llvm.loop !141

for.body95:                                       ; preds = %for.body95.prol.loopexit, %for.body95
  %indvars.iv280 = phi i64 [ %indvars.iv.next281.3, %for.body95 ], [ %indvars.iv280.unr, %for.body95.prol.loopexit ]
  %indvars.iv.next281 = add nsw i64 %indvars.iv280, -1
  %arrayidx99 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281
  %123 = load i64, i64* %arrayidx99, align 8, !tbaa !59
  %arrayidx102 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv280
  store i64 %123, i64* %arrayidx102, align 8, !tbaa !59
  %arrayidx106 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281
  %124 = load i64, i64* %arrayidx106, align 8, !tbaa !59
  %arrayidx109 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv280
  store i64 %124, i64* %arrayidx109, align 8, !tbaa !59
  %arrayidx113 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281
  %125 = load i64, i64* %arrayidx113, align 8, !tbaa !59
  %arrayidx116 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv280
  store i64 %125, i64* %arrayidx116, align 8, !tbaa !59
  %indvars.iv.next281.1 = add nsw i64 %indvars.iv280, -2
  %arrayidx99.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281.1
  %126 = load i64, i64* %arrayidx99.1, align 8, !tbaa !59
  %arrayidx102.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281
  store i64 %126, i64* %arrayidx102.1, align 8, !tbaa !59
  %arrayidx106.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281.1
  %127 = load i64, i64* %arrayidx106.1, align 8, !tbaa !59
  %arrayidx109.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281
  store i64 %127, i64* %arrayidx109.1, align 8, !tbaa !59
  %arrayidx113.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281.1
  %128 = load i64, i64* %arrayidx113.1, align 8, !tbaa !59
  %arrayidx116.1 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281
  store i64 %128, i64* %arrayidx116.1, align 8, !tbaa !59
  %indvars.iv.next281.2 = add nsw i64 %indvars.iv280, -3
  %arrayidx99.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281.2
  %129 = load i64, i64* %arrayidx99.2, align 8, !tbaa !59
  %arrayidx102.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281.1
  store i64 %129, i64* %arrayidx102.2, align 8, !tbaa !59
  %arrayidx106.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281.2
  %130 = load i64, i64* %arrayidx106.2, align 8, !tbaa !59
  %arrayidx109.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281.1
  store i64 %130, i64* %arrayidx109.2, align 8, !tbaa !59
  %arrayidx113.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281.2
  %131 = load i64, i64* %arrayidx113.2, align 8, !tbaa !59
  %arrayidx116.2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281.1
  store i64 %131, i64* %arrayidx116.2, align 8, !tbaa !59
  %indvars.iv.next281.3 = add nsw i64 %indvars.iv280, -4
  %arrayidx99.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281.3
  %132 = load i64, i64* %arrayidx99.3, align 8, !tbaa !59
  %arrayidx102.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 3, i64 %indvars.iv.next281.2
  store i64 %132, i64* %arrayidx102.3, align 8, !tbaa !59
  %arrayidx106.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281.3
  %133 = load i64, i64* %arrayidx106.3, align 8, !tbaa !59
  %arrayidx109.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 5, i64 %indvars.iv.next281.2
  store i64 %133, i64* %arrayidx109.3, align 8, !tbaa !59
  %arrayidx113.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281.3
  %134 = load i64, i64* %arrayidx113.3, align 8, !tbaa !59
  %arrayidx116.3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %c, i64 0, i32 4, i64 %indvars.iv.next281.2
  store i64 %134, i64* %arrayidx116.3, align 8, !tbaa !59
  %cmp93.3 = icmp sgt i64 %indvars.iv.next281.3, %114
  br i1 %cmp93.3, label %for.body95, label %for.cond.cleanup94, !llvm.loop !142

land.rhs:                                         ; preds = %while.body, %land.rhs.lr.ph
  %135 = phi i64 [ %.pre291, %land.rhs.lr.ph ], [ %154, %while.body ]
  %136 = phi i64 [ %.pre, %land.rhs.lr.ph ], [ %mul147, %while.body ]
  %cmp143 = icmp eq i64 %136, %135
  br i1 %cmp143, label %while.body, label %while.end

while.body:                                       ; preds = %land.rhs
  %137 = load i64, i64* %arrayidx, align 8, !tbaa !59
  %mul147 = mul i64 %137, %135
  store i64 %mul147, i64* %chunk_size, align 8, !tbaa !134
  %138 = load <4 x i64>, <4 x i64>* %85, align 8, !tbaa !59
  store <4 x i64> %138, <4 x i64>* %86, align 8, !tbaa !59
  %139 = load <4 x i64>, <4 x i64>* %87, align 8, !tbaa !59
  store <4 x i64> %139, <4 x i64>* %88, align 8, !tbaa !59
  %140 = load <4 x i64>, <4 x i64>* %89, align 8, !tbaa !59
  store <4 x i64> %140, <4 x i64>* %90, align 8, !tbaa !59
  %141 = load <4 x i64>, <4 x i64>* %91, align 8, !tbaa !59
  store <4 x i64> %141, <4 x i64>* %92, align 8, !tbaa !59
  %142 = load <4 x i64>, <4 x i64>* %93, align 8, !tbaa !59
  store <4 x i64> %142, <4 x i64>* %94, align 8, !tbaa !59
  %143 = load <4 x i64>, <4 x i64>* %95, align 8, !tbaa !59
  store <4 x i64> %143, <4 x i64>* %96, align 8, !tbaa !59
  %144 = load <4 x i64>, <4 x i64>* %97, align 8, !tbaa !59
  store <4 x i64> %144, <4 x i64>* %98, align 8, !tbaa !59
  %145 = load <4 x i64>, <4 x i64>* %99, align 8, !tbaa !59
  store <4 x i64> %145, <4 x i64>* %100, align 8, !tbaa !59
  %146 = load <4 x i64>, <4 x i64>* %101, align 8, !tbaa !59
  store <4 x i64> %146, <4 x i64>* %102, align 8, !tbaa !59
  %147 = load <2 x i64>, <2 x i64>* %103, align 8, !tbaa !59
  store <2 x i64> %147, <2 x i64>* %104, align 8, !tbaa !59
  %148 = load <2 x i64>, <2 x i64>* %105, align 8, !tbaa !59
  store <2 x i64> %148, <2 x i64>* %106, align 8, !tbaa !59
  %149 = load <2 x i64>, <2 x i64>* %107, align 8, !tbaa !59
  store <2 x i64> %149, <2 x i64>* %108, align 8, !tbaa !59
  %150 = load i64, i64* %arrayidx.15, align 8, !tbaa !59
  store i64 %150, i64* %arrayidx.14, align 8, !tbaa !59
  %151 = load i64, i64* %arrayidx12.15, align 8, !tbaa !59
  store i64 %151, i64* %arrayidx12.14, align 8, !tbaa !59
  %152 = load i64, i64* %arrayidx14.15, align 8, !tbaa !59
  store i64 %152, i64* %arrayidx14.14, align 8, !tbaa !59
  store i64 1, i64* %arrayidx.15, align 8, !tbaa !59
  store i64 0, i64* %arrayidx12.15, align 8, !tbaa !59
  store i64 0, i64* %arrayidx14.15, align 8, !tbaa !59
  %153 = extractelement <4 x i64> %139, i32 0
  %cmp139 = icmp eq i64 %mul147, %153
  %154 = extractelement <4 x i64> %140, i32 0
  br i1 %cmp139, label %land.rhs, label %while.end, !llvm.loop !143

while.end:                                        ; preds = %while.body, %land.rhs, %while.cond.preheader, %for.cond54.preheader
  %155 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %155, i8* nonnull align 8 dereferenceable(416) %0, i64 416, i1 false), !tbaa.struct !144
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.then51, %if.then
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %0) #11
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %key1, i8* %key2, i64 %key_size) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @memcmp(i8* %key1, i8* %key2, i64 %key_size) #16
  %cmp = icmp eq i32 %call, 0
  ret i1 %cmp
}

declare i32 @memcmp(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %buf, %struct.halide_dimension_t* %shape) local_unnamed_addr #0 {
entry:
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 5
  %0 = load i32, i32* %dimensions, align 4, !tbaa !70
  %cmp9 = icmp sgt i32 %0, 0
  br i1 %cmp9, label %for.body.lr.ph, label %return

for.body.lr.ph:                                   ; preds = %entry
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 6
  %1 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !71
  %2 = zext i32 %0 to i64
  br label %for.body

for.cond:                                         ; preds = %_ZNK18halide_dimension_tneERKS_.exit
  %exitcond.not = icmp eq i64 %indvars.iv.next, %2
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !145

for.body:                                         ; preds = %for.cond, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.cond ]
  %min.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %indvars.iv, i32 0
  %3 = load i32, i32* %min.i.i, align 4, !tbaa !76
  %min2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %shape, i64 %indvars.iv, i32 0
  %4 = load i32, i32* %min2.i.i, align 4, !tbaa !76
  %cmp.i.i = icmp eq i32 %3, %4
  br i1 %cmp.i.i, label %land.lhs.true.i.i, label %return

land.lhs.true.i.i:                                ; preds = %for.body
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %indvars.iv, i32 1
  %5 = load i32, i32* %extent.i.i, align 4, !tbaa !73
  %extent3.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %shape, i64 %indvars.iv, i32 1
  %6 = load i32, i32* %extent3.i.i, align 4, !tbaa !73
  %cmp4.i.i = icmp eq i32 %5, %6
  br i1 %cmp4.i.i, label %land.lhs.true5.i.i, label %return

land.lhs.true5.i.i:                               ; preds = %land.lhs.true.i.i
  %stride.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %indvars.iv, i32 2
  %7 = load i32, i32* %stride.i.i, align 4, !tbaa !77
  %stride6.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %shape, i64 %indvars.iv, i32 2
  %8 = load i32, i32* %stride6.i.i, align 4, !tbaa !77
  %cmp7.i.i = icmp eq i32 %7, %8
  br i1 %cmp7.i.i, label %_ZNK18halide_dimension_tneERKS_.exit, label %return

_ZNK18halide_dimension_tneERKS_.exit:             ; preds = %land.lhs.true5.i.i
  %flags.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %indvars.iv, i32 3
  %9 = load i32, i32* %flags.i.i, align 4, !tbaa !146
  %flags8.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %shape, i64 %indvars.iv, i32 3
  %10 = load i32, i32* %flags8.i.i, align 4, !tbaa !146
  %cmp9.i.i.not = icmp eq i32 %9, %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %cmp9.i.i.not, label %for.cond, label %return

return:                                           ; preds = %_ZNK18halide_dimension_tneERKS_.exit, %land.lhs.true5.i.i, %land.lhs.true.i.i, %for.body, %for.cond, %entry
  %cmp.lcssa = phi i1 [ true, %entry ], [ false, %_ZNK18halide_dimension_tneERKS_.exit ], [ true, %for.cond ], [ false, %land.lhs.true5.i.i ], [ false, %land.lhs.true.i.i ], [ false, %for.body ]
  ret i1 %cmp.lcssa
}

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %this, i8* %cache_key, i64 %cache_key_size, i32 %key_hash, %struct.halide_buffer_t* %computed_bounds_buf, i32 %tuples, %struct.halide_buffer_t** %tuple_buffers, i1 zeroext %has_eviction_key_arg, i64 %eviction_key_arg) local_unnamed_addr #0 align 2 {
entry:
  %frombool = zext i1 %has_eviction_key_arg to i8
  %0 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %this to <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*>*
  store <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*> zeroinitializer, <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*>* %0, align 8, !tbaa !12
  %less_recent = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent, align 8, !tbaa !147
  %key_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 4
  store i64 %cache_key_size, i64* %key_size, align 8, !tbaa !148
  %hash = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 6
  store i32 %key_hash, i32* %hash, align 8, !tbaa !149
  %in_use_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 7
  store i32 0, i32* %in_use_count, align 4, !tbaa !150
  %tuple_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 8
  store i32 %tuples, i32* %tuple_count, align 8, !tbaa !126
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %computed_bounds_buf, i64 0, i32 5
  %1 = load i32, i32* %dimensions, align 4, !tbaa !70
  %dimensions2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 9
  store i32 %1, i32* %dimensions2, align 4, !tbaa !151
  %conv = zext i32 %tuples to i64
  %mul = mul nuw nsw i64 %conv, 56
  %conv5 = sext i32 %1 to i64
  %add8 = add i32 %tuples, 1
  %conv9 = zext i32 %add8 to i64
  %mul6 = shl nuw nsw i64 %conv9, 4
  %mul10 = mul i64 %mul6, %conv5
  %add11 = add i64 %mul10, %mul
  %add13 = add i64 %add11, %cache_key_size
  %call = tail call i8* @halide_malloc(i8* null, i64 %add13) #16
  %metadata_storage = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 3
  store i8* %call, i8** %metadata_storage, align 8, !tbaa !127
  %tobool.not = icmp eq i8* %call, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %buf = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 11
  %2 = bitcast %struct.halide_buffer_t** %buf to i8**
  store i8* %call, i8** %2, align 8, !tbaa !128
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 %mul
  %computed_bounds = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 10
  %3 = bitcast %struct.halide_dimension_t** %computed_bounds to i8**
  store i8* %add.ptr, i8** %3, align 8, !tbaa !152
  %add.ptr18 = getelementptr inbounds i8, i8* %call, i64 %add11
  %key = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 5
  store i8* %add.ptr18, i8** %key, align 8, !tbaa !153
  %4 = load i64, i64* %key_size, align 8, !tbaa !148
  %cmp117.not = icmp eq i64 %4, 0
  br i1 %cmp117.not, label %for.cond23.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %if.end
  %5 = load i8, i8* %cache_key, align 1, !tbaa !38
  store i8 %5, i8* %add.ptr18, align 1, !tbaa !38
  %6 = load i64, i64* %key_size, align 8, !tbaa !148
  %cmp130 = icmp ugt i64 %6, 1
  br i1 %cmp130, label %for.body.for.body_crit_edge, label %for.cond23.preheader, !llvm.loop !154

for.cond23.preheader:                             ; preds = %for.body.for.body_crit_edge, %for.body.preheader, %if.end
  %7 = load i32, i32* %dimensions2, align 4, !tbaa !151
  %cmp25115 = icmp sgt i32 %7, 0
  br i1 %cmp25115, label %for.body27.lr.ph, label %for.cond36.preheader

for.body27.lr.ph:                                 ; preds = %for.cond23.preheader
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %computed_bounds_buf, i64 0, i32 6
  br label %for.body27

for.body.for.body_crit_edge:                      ; preds = %for.body.preheader, %for.body.for.body_crit_edge
  %inc131 = phi i64 [ %inc, %for.body.for.body_crit_edge ], [ 1, %for.body.preheader ]
  %.pre = load i8*, i8** %key, align 8, !tbaa !153
  %arrayidx = getelementptr inbounds i8, i8* %cache_key, i64 %inc131
  %8 = load i8, i8* %arrayidx, align 1, !tbaa !38
  %arrayidx21 = getelementptr inbounds i8, i8* %.pre, i64 %inc131
  store i8 %8, i8* %arrayidx21, align 1, !tbaa !38
  %inc = add nuw i64 %inc131, 1
  %9 = load i64, i64* %key_size, align 8, !tbaa !148
  %cmp = icmp ult i64 %inc, %9
  br i1 %cmp, label %for.body.for.body_crit_edge, label %for.cond23.preheader, !llvm.loop !154

for.cond36.preheader:                             ; preds = %for.body27, %for.cond23.preheader
  %10 = load i32, i32* %tuple_count, align 8, !tbaa !126
  %cmp38113.not = icmp eq i32 %10, 0
  br i1 %cmp38113.not, label %for.cond.cleanup39, label %for.body40

for.body27:                                       ; preds = %for.body27, %for.body27.lr.ph
  %indvars.iv121 = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next122, %for.body27 ]
  %11 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !71
  %arrayidx28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %11, i64 %indvars.iv121
  %12 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %computed_bounds, align 8, !tbaa !152
  %arrayidx31 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %12, i64 %indvars.iv121
  %13 = bitcast %struct.halide_dimension_t* %arrayidx31 to i8*
  %14 = bitcast %struct.halide_dimension_t* %arrayidx28 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %13, i8* nonnull align 4 dereferenceable(16) %14, i64 16, i1 false), !tbaa.struct !72
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %15 = load i32, i32* %dimensions2, align 4, !tbaa !151
  %16 = sext i32 %15 to i64
  %cmp25 = icmp slt i64 %indvars.iv.next122, %16
  br i1 %cmp25, label %for.body27, label %for.cond36.preheader, !llvm.loop !155

for.cond36.loopexit:                              ; preds = %for.body59.for.body59_crit_edge, %for.body59.preheader, %for.body40
  %17 = load i32, i32* %tuple_count, align 8, !tbaa !126
  %18 = zext i32 %17 to i64
  %cmp38 = icmp ult i64 %indvars.iv.next120, %18
  br i1 %cmp38, label %for.body40, label %for.cond.cleanup39, !llvm.loop !156

for.cond.cleanup39:                               ; preds = %for.cond36.loopexit, %for.cond36.preheader
  %has_eviction_key = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 13
  store i8 %frombool, i8* %has_eviction_key, align 8, !tbaa !157
  %eviction_key = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %this, i64 0, i32 12
  store i64 %eviction_key_arg, i64* %eviction_key, align 8, !tbaa !158
  br label %cleanup

for.body40:                                       ; preds = %for.cond36.preheader, %for.cond36.loopexit
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %for.cond36.loopexit ], [ 0, %for.cond36.preheader ]
  %arrayidx42 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv119
  %19 = bitcast %struct.halide_buffer_t** %arrayidx42 to i8**
  %20 = load i8*, i8** %19, align 8, !tbaa !12
  %21 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf, align 8, !tbaa !128
  %arrayidx45 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %21, i64 %indvars.iv119
  %22 = bitcast %struct.halide_buffer_t* %arrayidx45 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %22, i8* nonnull align 8 dereferenceable(56) %20, i64 56, i1 false), !tbaa.struct !159
  %23 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %computed_bounds, align 8, !tbaa !152
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %24 = load i32, i32* %dimensions2, align 4, !tbaa !151
  %25 = trunc i64 %indvars.iv.next120 to i32
  %mul49 = mul i32 %24, %25
  %idx.ext = zext i32 %mul49 to i64
  %add.ptr50 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %23, i64 %idx.ext
  %26 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf, align 8, !tbaa !128
  %dim54 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %26, i64 %indvars.iv119, i32 6
  store %struct.halide_dimension_t* %add.ptr50, %struct.halide_dimension_t** %dim54, align 8, !tbaa !71
  %cmp57111 = icmp sgt i32 %24, 0
  br i1 %cmp57111, label %for.body59.preheader, label %for.cond36.loopexit

for.body59.preheader:                             ; preds = %for.body40
  %27 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx42, align 8, !tbaa !12
  %dim62125 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %27, i64 0, i32 6
  %28 = bitcast %struct.halide_dimension_t** %dim62125 to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !71
  %30 = bitcast %struct.halide_dimension_t* %add.ptr50 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %30, i8* nonnull align 4 dereferenceable(16) %29, i64 16, i1 false), !tbaa.struct !72
  %31 = load i32, i32* %dimensions2, align 4, !tbaa !151
  %cmp57128 = icmp sgt i32 %31, 1
  br i1 %cmp57128, label %for.body59.for.body59_crit_edge, label %for.cond36.loopexit, !llvm.loop !161

for.body59.for.body59_crit_edge:                  ; preds = %for.body59.preheader, %for.body59.for.body59_crit_edge
  %indvars.iv.next129 = phi i64 [ %indvars.iv.next, %for.body59.for.body59_crit_edge ], [ 1, %for.body59.preheader ]
  %.pre123 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf, align 8, !tbaa !128
  %dim68.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %.pre123, i64 %indvars.iv119, i32 6
  %.pre124 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim68.phi.trans.insert, align 8, !tbaa !71
  %32 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx42, align 8, !tbaa !12
  %dim62 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %32, i64 0, i32 6
  %33 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim62, align 8, !tbaa !71
  %arrayidx64 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %33, i64 %indvars.iv.next129
  %arrayidx70 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %.pre124, i64 %indvars.iv.next129
  %34 = bitcast %struct.halide_dimension_t* %arrayidx70 to i8*
  %35 = bitcast %struct.halide_dimension_t* %arrayidx64 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %34, i8* nonnull align 4 dereferenceable(16) %35, i64 16, i1 false), !tbaa.struct !72
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.next129, 1
  %36 = load i32, i32* %dimensions2, align 4, !tbaa !151
  %37 = sext i32 %36 to i64
  %cmp57 = icmp slt i64 %indvars.iv.next, %37
  br i1 %cmp57, label %for.body59.for.body59_crit_edge, label %for.cond36.loopexit, !llvm.loop !161

cleanup:                                          ; preds = %for.cond.cleanup39, %entry
  %38 = xor i1 %tobool.not, true
  ret i1 %38
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %key, i64 %key_size) local_unnamed_addr #0 {
entry:
  %cmp8.not = icmp eq i64 %key_size, 0
  br i1 %cmp8.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = add i64 %key_size, -1
  %xtraiter = and i64 %key_size, 7
  %1 = icmp ult i64 %0, 7
  br i1 %1, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %key_size, -8
  %add.0 = mul i32 5381, 33
  br label %for.body

for.cond.cleanup.loopexit.unr-lcssa:              ; preds = %for.body, %for.body.preheader
  %add1.lcssa.ph = phi i32 [ undef, %for.body.preheader ], [ %add1.7, %for.body ]
  %i.010.unr = phi i64 [ 0, %for.body.preheader ], [ %inc.7, %for.body ]
  %h.09.unr = phi i32 [ 5381, %for.body.preheader ], [ %add1.7, %for.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup, label %for.body.epil

for.body.epil:                                    ; preds = %for.cond.cleanup.loopexit.unr-lcssa, %for.body.epil
  %i.010.epil = phi i64 [ %inc.epil, %for.body.epil ], [ %i.010.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %h.09.epil = phi i32 [ %add1.epil, %for.body.epil ], [ %h.09.unr, %for.cond.cleanup.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body.epil ], [ %xtraiter, %for.cond.cleanup.loopexit.unr-lcssa ]
  %add.epil = mul i32 %h.09.epil, 33
  %arrayidx.epil = getelementptr inbounds i8, i8* %key, i64 %i.010.epil
  %2 = load i8, i8* %arrayidx.epil, align 1, !tbaa !38
  %conv.epil = zext i8 %2 to i32
  %add1.epil = add i32 %add.epil, %conv.epil
  %inc.epil = add nuw i64 %i.010.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup, label %for.body.epil, !llvm.loop !162

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit.unr-lcssa, %for.body.epil, %entry
  %h.0.lcssa = phi i32 [ 5381, %entry ], [ %add1.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %add1.epil, %for.body.epil ]
  ret i32 %h.0.lcssa

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader.new
  %i.010 = phi i64 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body.for.body_crit_edge ]
  %add.phi = phi i32 [ %add.0, %for.body.preheader.new ], [ %add.12, %for.body.for.body_crit_edge ]
  %niter = phi i64 [ %unroll_iter, %for.body.preheader.new ], [ %niter.nsub.7, %for.body.for.body_crit_edge ]
  %arrayidx = getelementptr inbounds i8, i8* %key, i64 %i.010
  %3 = load i8, i8* %arrayidx, align 1, !tbaa !38
  %conv = zext i8 %3 to i32
  %add1 = add i32 %add.phi, %conv
  %inc = or i64 %i.010, 1
  %add.1 = mul i32 %add1, 33
  %arrayidx.1 = getelementptr inbounds i8, i8* %key, i64 %inc
  %4 = load i8, i8* %arrayidx.1, align 1, !tbaa !38
  %conv.1 = zext i8 %4 to i32
  %add1.1 = add i32 %add.1, %conv.1
  %inc.1 = or i64 %i.010, 2
  %add.2 = mul i32 %add1.1, 33
  %arrayidx.2 = getelementptr inbounds i8, i8* %key, i64 %inc.1
  %5 = load i8, i8* %arrayidx.2, align 1, !tbaa !38
  %conv.2 = zext i8 %5 to i32
  %add1.2 = add i32 %add.2, %conv.2
  %inc.2 = or i64 %i.010, 3
  %add.3 = mul i32 %add1.2, 33
  %arrayidx.3 = getelementptr inbounds i8, i8* %key, i64 %inc.2
  %6 = load i8, i8* %arrayidx.3, align 1, !tbaa !38
  %conv.3 = zext i8 %6 to i32
  %add1.3 = add i32 %add.3, %conv.3
  %inc.3 = or i64 %i.010, 4
  %add.4 = mul i32 %add1.3, 33
  %arrayidx.4 = getelementptr inbounds i8, i8* %key, i64 %inc.3
  %7 = load i8, i8* %arrayidx.4, align 1, !tbaa !38
  %conv.4 = zext i8 %7 to i32
  %add1.4 = add i32 %add.4, %conv.4
  %inc.4 = or i64 %i.010, 5
  %add.5 = mul i32 %add1.4, 33
  %arrayidx.5 = getelementptr inbounds i8, i8* %key, i64 %inc.4
  %8 = load i8, i8* %arrayidx.5, align 1, !tbaa !38
  %conv.5 = zext i8 %8 to i32
  %add1.5 = add i32 %add.5, %conv.5
  %inc.5 = or i64 %i.010, 6
  %add.6 = mul i32 %add1.5, 33
  %arrayidx.6 = getelementptr inbounds i8, i8* %key, i64 %inc.5
  %9 = load i8, i8* %arrayidx.6, align 1, !tbaa !38
  %conv.6 = zext i8 %9 to i32
  %add1.6 = add i32 %add.6, %conv.6
  %inc.6 = or i64 %i.010, 7
  %add.7 = mul i32 %add1.6, 33
  %arrayidx.7 = getelementptr inbounds i8, i8* %key, i64 %inc.6
  %10 = load i8, i8* %arrayidx.7, align 1, !tbaa !38
  %conv.7 = zext i8 %10 to i32
  %add1.7 = add i32 %add.7, %conv.7
  %inc.7 = add nuw i64 %i.010, 8
  %niter.nsub.7 = add i64 %niter, -8
  %niter.ncmp.7 = icmp eq i64 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.body.for.body_crit_edge, !llvm.loop !163

for.body.for.body_crit_edge:                      ; preds = %for.body
  %add.12 = mul i32 %add1.7, 33
  br label %for.body
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal11prune_cacheEv() local_unnamed_addr #0 {
entry:
  %0 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %1 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  %2 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !59
  %cmp84 = icmp sgt i64 %1, %2
  %cmp185 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %0, null
  %3 = and i1 %cmp185, %cmp84
  br i1 %3, label %while.body, label %while.end42

while.body:                                       ; preds = %entry, %if.end41
  %4 = phi i64 [ %114, %if.end41 ], [ %2, %entry ]
  %5 = phi i64 [ %115, %if.end41 ], [ %1, %entry ]
  %prune_candidate.086 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %6, %if.end41 ], [ %0, %entry ]
  %more_recent2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 1
  %6 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent2, align 8, !tbaa !164
  %in_use_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 7
  %7 = load i32, i32* %in_use_count, align 4, !tbaa !150
  %cmp3 = icmp eq i32 %7, 0
  br i1 %cmp3, label %if.then, label %if.end41

if.then:                                          ; preds = %while.body
  %hash = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 6
  %8 = load i32, i32* %hash, align 8, !tbaa !149
  %9 = and i32 %8, 255
  %idxprom = zext i32 %9 to i64
  %arrayidx = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %idxprom
  %10 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %arrayidx, align 8, !tbaa !12
  %cmp5 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %10, %prune_candidate.086
  br i1 %cmp5, label %if.then6, label %while.cond9

if.then6:                                         ; preds = %if.then
  %next = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 0
  %11 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next, align 8, !tbaa !122
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %11, %"struct.Halide::Runtime::Internal::CacheEntry"** %arrayidx, align 8, !tbaa !12
  br label %if.end21

while.cond9:                                      ; preds = %if.then, %land.rhs11
  %prev_hash_entry.0 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %12, %land.rhs11 ], [ %10, %if.then ]
  %cmp10.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %prev_hash_entry.0, null
  br i1 %cmp10.not, label %if.then18, label %land.rhs11

land.rhs11:                                       ; preds = %while.cond9
  %next12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prev_hash_entry.0, i64 0, i32 0
  %12 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next12, align 8, !tbaa !122
  %cmp13.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %12, %prune_candidate.086
  br i1 %cmp13.not, label %do.end, label %while.cond9, !llvm.loop !165

if.then18:                                        ; preds = %while.cond9
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([154 x i8], [154 x i8]* @.str.2.42, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end

do.end:                                           ; preds = %land.rhs11, %if.then18
  %next19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 0
  %13 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next19, align 8, !tbaa !122
  %next20 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prev_hash_entry.0, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %13, %"struct.Halide::Runtime::Internal::CacheEntry"** %next20, align 8, !tbaa !122
  br label %if.end21

if.end21:                                         ; preds = %do.end, %if.then6
  %14 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %cmp22 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %14, %prune_candidate.086
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %6, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end21
  %cmp25.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %6, null
  br i1 %cmp25.not, label %if.end28, label %if.then26

if.then26:                                        ; preds = %if.end24
  %less_recent = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 2
  %15 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent, align 8, !tbaa !147
  %less_recent27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %6, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %15, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent27, align 8, !tbaa !147
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %if.end24
  %16 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  %cmp29 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %16, %prune_candidate.086
  %less_recent31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 2
  %17 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent31, align 8, !tbaa !147
  br i1 %cmp29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.end28
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %17, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.end28
  %cmp34.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %17, null
  br i1 %cmp34.not, label %if.end37, label %if.then35

if.then35:                                        ; preds = %if.end32
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %6, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent31, align 8, !tbaa !147
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %if.end32
  %tuple_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 8
  %18 = load i32, i32* %tuple_count, align 8, !tbaa !126
  %cmp3882.not = icmp eq i32 %18, 0
  br i1 %cmp3882.not, label %for.cond.cleanup, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.end37
  %buf = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086, i64 0, i32 11
  %19 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf, align 8, !tbaa !128
  %_ZN6Halide7Runtime8Internal18current_cache_sizeE.promoted = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  %wide.trip.count = zext i32 %18 to i64
  br label %for.body

for.cond.for.cond.cleanup_crit_edge:              ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  store i64 %sub, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.for.cond.cleanup_crit_edge, %if.end37
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %prune_candidate.086) #17
  %20 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %prune_candidate.086 to i8*
  tail call void @halide_free(i8* null, i8* nonnull %20) #16
  %.pre92 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  %.pre93 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !59
  br label %if.end41

for.body:                                         ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ]
  %sub89 = phi i64 [ %_ZN6Halide7Runtime8Internal18current_cache_sizeE.promoted, %for.body.lr.ph ], [ %sub, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ]
  %dimensions.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %19, i64 %indvars.iv, i32 5
  %21 = load i32, i32* %dimensions.i.i, align 4, !tbaa !70
  %cmp19.i.i = icmp sgt i32 %21, 0
  br i1 %cmp19.i.i, label %for.body.lr.ph.i.i, label %for.body._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge

for.body._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge: ; preds = %for.body
  %sub.i.neg.0 = add i64 0, -1
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.lr.ph.i.i:                               ; preds = %for.body
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %19, i64 %indvars.iv, i32 6
  %22 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8, !tbaa !71
  %wide.trip.count.i.i = zext i32 %21 to i64
  %min.iters.check43 = icmp ult i32 %21, 17
  br i1 %min.iters.check43, label %for.body.i.i.preheader, label %vector.ph44

vector.ph44:                                      ; preds = %for.body.lr.ph.i.i
  %n.mod.vf45 = and i64 %wide.trip.count.i.i, 15
  %23 = icmp eq i64 %n.mod.vf45, 0
  %24 = select i1 %23, i64 16, i64 %n.mod.vf45
  %n.vec46 = sub nsw i64 %wide.trip.count.i.i, %24
  br label %vector.body42

vector.body42:                                    ; preds = %vector.body42, %vector.ph44
  %index47 = phi i64 [ 0, %vector.ph44 ], [ %index.next48, %vector.body42 ]
  %vec.ind51 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph44 ], [ %vec.ind.next56, %vector.body42 ]
  %vec.phi57 = phi <4 x i64> [ zeroinitializer, %vector.ph44 ], [ %predphi73, %vector.body42 ]
  %vec.phi58 = phi <4 x i64> [ zeroinitializer, %vector.ph44 ], [ %predphi74, %vector.body42 ]
  %vec.phi59 = phi <4 x i64> [ zeroinitializer, %vector.ph44 ], [ %predphi75, %vector.body42 ]
  %vec.phi60 = phi <4 x i64> [ zeroinitializer, %vector.ph44 ], [ %predphi76, %vector.body42 ]
  %step.add52 = add <4 x i64> %vec.ind51, <i64 4, i64 4, i64 4, i64 4>
  %step.add53 = add <4 x i64> %vec.ind51, <i64 8, i64 8, i64 8, i64 8>
  %step.add54 = add <4 x i64> %vec.ind51, <i64 12, i64 12, i64 12, i64 12>
  %25 = or i64 %index47, 4
  %26 = or i64 %index47, 8
  %27 = or i64 %index47, 12
  %28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %index47, i32 2
  %29 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %25, i32 2
  %30 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %26, i32 2
  %31 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %27, i32 2
  %32 = bitcast i32* %28 to <16 x i32>*
  %33 = bitcast i32* %29 to <16 x i32>*
  %34 = bitcast i32* %30 to <16 x i32>*
  %35 = bitcast i32* %31 to <16 x i32>*
  %wide.vec61 = load <16 x i32>, <16 x i32>* %32, align 4, !tbaa !77
  %wide.vec62 = load <16 x i32>, <16 x i32>* %33, align 4, !tbaa !77
  %wide.vec63 = load <16 x i32>, <16 x i32>* %34, align 4, !tbaa !77
  %wide.vec64 = load <16 x i32>, <16 x i32>* %35, align 4, !tbaa !77
  %strided.vec65 = shufflevector <16 x i32> %wide.vec61, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec66 = shufflevector <16 x i32> %wide.vec62, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec67 = shufflevector <16 x i32> %wide.vec63, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec68 = shufflevector <16 x i32> %wide.vec64, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %36 = icmp sgt <4 x i32> %strided.vec65, zeroinitializer
  %37 = icmp sgt <4 x i32> %strided.vec66, zeroinitializer
  %38 = icmp sgt <4 x i32> %strided.vec67, zeroinitializer
  %39 = icmp sgt <4 x i32> %strided.vec68, zeroinitializer
  %40 = zext <4 x i32> %strided.vec65 to <4 x i64>
  %41 = zext <4 x i32> %strided.vec66 to <4 x i64>
  %42 = zext <4 x i32> %strided.vec67 to <4 x i64>
  %43 = zext <4 x i32> %strided.vec68 to <4 x i64>
  %44 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %vec.ind51, i32 1
  %45 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %step.add52, i32 1
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %step.add53, i32 1
  %47 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %step.add54, i32 1
  %wide.masked.gather69 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %44, i32 4, <4 x i1> %36, <4 x i32> undef), !tbaa !73
  %wide.masked.gather70 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %45, i32 4, <4 x i1> %37, <4 x i32> undef), !tbaa !73
  %wide.masked.gather71 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %46, i32 4, <4 x i1> %38, <4 x i32> undef), !tbaa !73
  %wide.masked.gather72 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %47, i32 4, <4 x i1> %39, <4 x i32> undef), !tbaa !73
  %48 = add nsw <4 x i32> %wide.masked.gather69, <i32 -1, i32 -1, i32 -1, i32 -1>
  %49 = add nsw <4 x i32> %wide.masked.gather70, <i32 -1, i32 -1, i32 -1, i32 -1>
  %50 = add nsw <4 x i32> %wide.masked.gather71, <i32 -1, i32 -1, i32 -1, i32 -1>
  %51 = add nsw <4 x i32> %wide.masked.gather72, <i32 -1, i32 -1, i32 -1, i32 -1>
  %52 = sext <4 x i32> %48 to <4 x i64>
  %53 = sext <4 x i32> %49 to <4 x i64>
  %54 = sext <4 x i32> %50 to <4 x i64>
  %55 = sext <4 x i32> %51 to <4 x i64>
  %56 = mul nsw <4 x i64> %52, %40
  %57 = mul nsw <4 x i64> %53, %41
  %58 = mul nsw <4 x i64> %54, %42
  %59 = mul nsw <4 x i64> %55, %43
  %60 = select <4 x i1> %36, <4 x i64> %56, <4 x i64> zeroinitializer
  %predphi73 = add <4 x i64> %vec.phi57, %60
  %61 = select <4 x i1> %37, <4 x i64> %57, <4 x i64> zeroinitializer
  %predphi74 = add <4 x i64> %vec.phi58, %61
  %62 = select <4 x i1> %38, <4 x i64> %58, <4 x i64> zeroinitializer
  %predphi75 = add <4 x i64> %vec.phi59, %62
  %63 = select <4 x i1> %39, <4 x i64> %59, <4 x i64> zeroinitializer
  %predphi76 = add <4 x i64> %vec.phi60, %63
  %index.next48 = add i64 %index47, 16
  %vec.ind.next56 = add <4 x i64> %vec.ind51, <i64 16, i64 16, i64 16, i64 16>
  %64 = icmp eq i64 %index.next48, %n.vec46
  br i1 %64, label %middle.block40, label %vector.body42, !llvm.loop !166

middle.block40:                                   ; preds = %vector.body42
  %bin.rdx77 = add <4 x i64> %predphi74, %predphi73
  %bin.rdx78 = add <4 x i64> %predphi75, %bin.rdx77
  %bin.rdx79 = add <4 x i64> %predphi76, %bin.rdx78
  %65 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx79)
  br label %for.body.i.i.preheader

for.body.i.i.preheader:                           ; preds = %middle.block40, %for.body.lr.ph.i.i
  %indvars.iv.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %n.vec46, %middle.block40 ]
  %index.021.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %65, %middle.block40 ]
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.preheader, %if.end.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %if.end.i.i ], [ %indvars.iv.i.i.ph, %for.body.i.i.preheader ]
  %index.021.i.i = phi i64 [ %index.1.i.i, %if.end.i.i ], [ %index.021.i.i.ph, %for.body.i.i.preheader ]
  %stride2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %indvars.iv.i.i, i32 2
  %66 = load i32, i32* %stride2.i.i, align 4, !tbaa !77
  %cmp3.i.i = icmp sgt i32 %66, 0
  br i1 %cmp3.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %conv18.i.i = zext i32 %66 to i64
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %indvars.iv.i.i, i32 1
  %67 = load i32, i32* %extent.i.i, align 4, !tbaa !73
  %sub.i.i = add nsw i32 %67, -1
  %conv7.i.i = sext i32 %sub.i.i to i64
  %mul.i.i = mul nsw i64 %conv7.i.i, %conv18.i.i
  %add.i.i = add nsw i64 %mul.i.i, %index.021.i.i
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i64 [ %add.i.i, %if.then.i.i ], [ %index.021.i.i, %for.body.i.i ]
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.not.i.i = icmp eq i64 %indvars.iv.next.i.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i.i, label %for.body.i13.i.preheader, label %for.body.i.i, !llvm.loop !167

for.body.i13.i.preheader:                         ; preds = %if.end.i.i
  %min.iters.check = icmp ult i32 %21, 17
  br i1 %min.iters.check, label %for.body.i13.i.preheader81, label %vector.ph

vector.ph:                                        ; preds = %for.body.i13.i.preheader
  %n.mod.vf = and i64 %wide.trip.count.i.i, 15
  %68 = icmp eq i64 %n.mod.vf, 0
  %69 = select i1 %68, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %wide.trip.count.i.i, %69
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi23 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi35, %vector.body ]
  %vec.phi24 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi36, %vector.body ]
  %vec.phi25 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi37, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add20 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add21 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %70 = or i64 %index, 4
  %71 = or i64 %index, 8
  %72 = or i64 %index, 12
  %73 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %index, i32 2
  %74 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %70, i32 2
  %75 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %71, i32 2
  %76 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %72, i32 2
  %77 = bitcast i32* %73 to <16 x i32>*
  %78 = bitcast i32* %74 to <16 x i32>*
  %79 = bitcast i32* %75 to <16 x i32>*
  %80 = bitcast i32* %76 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %77, align 4, !tbaa !77
  %wide.vec26 = load <16 x i32>, <16 x i32>* %78, align 4, !tbaa !77
  %wide.vec27 = load <16 x i32>, <16 x i32>* %79, align 4, !tbaa !77
  %wide.vec28 = load <16 x i32>, <16 x i32>* %80, align 4, !tbaa !77
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec29 = shufflevector <16 x i32> %wide.vec26, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec30 = shufflevector <16 x i32> %wide.vec27, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec31 = shufflevector <16 x i32> %wide.vec28, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %81 = icmp slt <4 x i32> %strided.vec, zeroinitializer
  %82 = icmp slt <4 x i32> %strided.vec29, zeroinitializer
  %83 = icmp slt <4 x i32> %strided.vec30, zeroinitializer
  %84 = icmp slt <4 x i32> %strided.vec31, zeroinitializer
  %85 = sext <4 x i32> %strided.vec to <4 x i64>
  %86 = sext <4 x i32> %strided.vec29 to <4 x i64>
  %87 = sext <4 x i32> %strided.vec30 to <4 x i64>
  %88 = sext <4 x i32> %strided.vec31 to <4 x i64>
  %89 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %vec.ind, i32 1
  %90 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %step.add, i32 1
  %91 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %step.add20, i32 1
  %92 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, <4 x i64> %step.add21, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %89, i32 4, <4 x i1> %81, <4 x i32> undef), !tbaa !73
  %wide.masked.gather32 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %90, i32 4, <4 x i1> %82, <4 x i32> undef), !tbaa !73
  %wide.masked.gather33 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %91, i32 4, <4 x i1> %83, <4 x i32> undef), !tbaa !73
  %wide.masked.gather34 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %92, i32 4, <4 x i1> %84, <4 x i32> undef), !tbaa !73
  %93 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %94 = add nsw <4 x i32> %wide.masked.gather32, <i32 -1, i32 -1, i32 -1, i32 -1>
  %95 = add nsw <4 x i32> %wide.masked.gather33, <i32 -1, i32 -1, i32 -1, i32 -1>
  %96 = add nsw <4 x i32> %wide.masked.gather34, <i32 -1, i32 -1, i32 -1, i32 -1>
  %97 = sext <4 x i32> %93 to <4 x i64>
  %98 = sext <4 x i32> %94 to <4 x i64>
  %99 = sext <4 x i32> %95 to <4 x i64>
  %100 = sext <4 x i32> %96 to <4 x i64>
  %101 = mul nsw <4 x i64> %97, %85
  %102 = mul nsw <4 x i64> %98, %86
  %103 = mul nsw <4 x i64> %99, %87
  %104 = mul nsw <4 x i64> %100, %88
  %105 = select <4 x i1> %81, <4 x i64> %101, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %105
  %106 = select <4 x i1> %82, <4 x i64> %102, <4 x i64> zeroinitializer
  %predphi35 = add <4 x i64> %vec.phi23, %106
  %107 = select <4 x i1> %83, <4 x i64> %103, <4 x i64> zeroinitializer
  %predphi36 = add <4 x i64> %vec.phi24, %107
  %108 = select <4 x i1> %84, <4 x i64> %104, <4 x i64> zeroinitializer
  %predphi37 = add <4 x i64> %vec.phi25, %108
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %109 = icmp eq i64 %index.next, %n.vec
  br i1 %109, label %middle.block, label %vector.body, !llvm.loop !168

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi35, %predphi
  %bin.rdx38 = add <4 x i64> %predphi36, %bin.rdx
  %bin.rdx39 = add <4 x i64> %predphi37, %bin.rdx38
  %110 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx39)
  br label %for.body.i13.i.preheader81

for.body.i13.i.preheader81:                       ; preds = %middle.block, %for.body.i13.i.preheader
  %indvars.iv.i10.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %n.vec, %middle.block ]
  %index.018.i.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %110, %middle.block ]
  br label %for.body.i13.i

for.body.i13.i:                                   ; preds = %for.body.i13.i.preheader81, %if.end.i24.i
  %indvars.iv.i10.i = phi i64 [ %indvars.iv.next.i22.i, %if.end.i24.i ], [ %indvars.iv.i10.i.ph, %for.body.i13.i.preheader81 ]
  %index.018.i.i = phi i64 [ %index.1.i21.i, %if.end.i24.i ], [ %index.018.i.i.ph, %for.body.i13.i.preheader81 ]
  %stride2.i11.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %indvars.iv.i10.i, i32 2
  %111 = load i32, i32* %stride2.i11.i, align 4, !tbaa !77
  %cmp3.i12.i = icmp slt i32 %111, 0
  br i1 %cmp3.i12.i, label %if.then.i20.i, label %if.end.i24.i

if.then.i20.i:                                    ; preds = %for.body.i13.i
  %conv.i14.i = sext i32 %111 to i64
  %extent.i15.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %22, i64 %indvars.iv.i10.i, i32 1
  %112 = load i32, i32* %extent.i15.i, align 4, !tbaa !73
  %sub.i16.i = add nsw i32 %112, -1
  %conv7.i17.i = sext i32 %sub.i16.i to i64
  %mul.i18.i = mul nsw i64 %conv7.i17.i, %conv.i14.i
  %add.i19.i = add nsw i64 %mul.i18.i, %index.018.i.i
  br label %if.end.i24.i

if.end.i24.i:                                     ; preds = %if.then.i20.i, %for.body.i13.i
  %index.1.i21.i = phi i64 [ %add.i19.i, %if.then.i20.i ], [ %index.018.i.i, %for.body.i13.i ]
  %indvars.iv.next.i22.i = add nuw nsw i64 %indvars.iv.i10.i, 1
  %exitcond.not.i23.i = icmp eq i64 %indvars.iv.next.i22.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i23.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i13.i, !llvm.loop !169

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %if.end.i24.i
  %add8.i.i.neg = xor i64 %index.1.i.i, -1
  %sub.i.neg.1 = add i64 %index.1.i21.i, %add8.i.i.neg
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %for.body._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
  %sub.i.neg.phi = phi i64 [ %sub.i.neg.0, %for.body._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge ], [ %sub.i.neg.1, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %index.0.lcssa.i9.i = phi i64 [ 0, %for.body._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge ], [ %index.1.i21.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %bits.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %19, i64 %indvars.iv, i32 4, i32 1
  %113 = load i8, i8* %bits.i.i, align 1, !tbaa !28
  %conv.i.i = zext i8 %113 to i64
  %add.i4.i = add nuw nsw i64 %conv.i.i, 7
  %div.i.i = lshr i64 %add.i4.i, 3
  %mul.i.neg = mul i64 %div.i.i, %sub.i.neg.phi
  %sub = add i64 %mul.i.neg, %sub89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.for.cond.cleanup_crit_edge, label %for.body, !llvm.loop !170

if.end41:                                         ; preds = %for.cond.cleanup, %while.body
  %114 = phi i64 [ %.pre93, %for.cond.cleanup ], [ %4, %while.body ]
  %115 = phi i64 [ %.pre92, %for.cond.cleanup ], [ %5, %while.body ]
  %cmp = icmp sgt i64 %115, %114
  %cmp1 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %6, null
  %116 = and i1 %cmp1, %cmp
  br i1 %116, label %while.body, label %while.end42, !llvm.loop !171

while.end42:                                      ; preds = %if.end41, %entry
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_set_size(i64 %size) local_unnamed_addr #4 {
entry:
  %cmp = icmp eq i64 %size, 0
  %spec.store.select = select i1 %cmp, i64 1048576, i64 %size
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  store i64 %spec.store.select, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !59
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #17
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_lookup(i8* %user_context, i8* %cache_key, i32 %size, %struct.halide_buffer_t* %computed_bounds, i32 %tuple_count, %struct.halide_buffer_t** %tuple_buffers) local_unnamed_addr #4 {
entry:
  %conv = sext i32 %size to i64
  %call = tail call i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %cache_key, i64 %conv) #17
  %0 = and i32 %call, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  %idxprom = zext i32 %0 to i64
  %arrayidx = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %idxprom
  %entry3.0220 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %arrayidx, align 8, !tbaa !12
  %cmp.not221 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0220, null
  br i1 %cmp.not221, label %for.cond75.preheader, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %cmp16215 = icmp sgt i32 %tuple_count, 0
  %1 = sext i32 %tuple_count to i64
  br i1 %cmp16215, label %while.body.us, label %while.body

while.body.us:                                    ; preds = %while.body.lr.ph, %if.end73.us
  %entry3.0222.us = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %entry3.0.us, %if.end73.us ], [ %entry3.0220, %while.body.lr.ph ]
  %hash.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222.us, i64 0, i32 6
  %2 = load i32, i32* %hash.us, align 8, !tbaa !149
  %cmp4.us = icmp eq i32 %2, %call
  br i1 %cmp4.us, label %land.lhs.true.us, label %if.end73.us

land.lhs.true.us:                                 ; preds = %while.body.us
  %key_size.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222.us, i64 0, i32 4
  %3 = load i64, i64* %key_size.us, align 8, !tbaa !148
  %cmp6.us = icmp eq i64 %3, %conv
  br i1 %cmp6.us, label %land.lhs.true7.us, label %if.end73.us

land.lhs.true7.us:                                ; preds = %land.lhs.true.us
  %key.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222.us, i64 0, i32 5
  %4 = load i8*, i8** %key.us, align 8, !tbaa !153
  %call9.us = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %4, i8* %cache_key, i64 %conv) #17
  br i1 %call9.us, label %land.lhs.true10.us, label %if.end73.us

land.lhs.true10.us:                               ; preds = %land.lhs.true7.us
  %computed_bounds11.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222.us, i64 0, i32 10
  %5 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %computed_bounds11.us, align 8, !tbaa !152
  %call12.us = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %computed_bounds, %struct.halide_dimension_t* %5) #17
  br i1 %call12.us, label %land.lhs.true13.us, label %if.end73.us

land.lhs.true13.us:                               ; preds = %land.lhs.true10.us
  %tuple_count14.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222.us, i64 0, i32 8
  %6 = load i32, i32* %tuple_count14.us, align 8, !tbaa !126
  %cmp15.us = icmp eq i32 %6, %tuple_count
  br i1 %cmp15.us, label %for.cond.preheader.us, label %if.end73.us

for.cond.preheader.us:                            ; preds = %land.lhs.true13.us
  %buf.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222.us, i64 0, i32 11
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us, %for.cond.preheader.us
  %indvars.iv226.us = phi i64 [ 0, %for.cond.preheader.us ], [ %indvars.iv.next227.us, %for.body.us ]
  %arrayidx18.us = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv226.us
  %7 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx18.us, align 8, !tbaa !12
  %8 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf.us, align 8, !tbaa !128
  %dim.us = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %8, i64 %indvars.iv226.us, i32 6
  %9 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.us, align 8, !tbaa !71
  %call21.us = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %7, %struct.halide_dimension_t* %9) #17
  %indvars.iv.next227.us = add nuw nsw i64 %indvars.iv226.us, 1
  %cmp16.us = icmp slt i64 %indvars.iv.next227.us, %1
  %10 = and i1 %cmp16.us, %call21.us
  br i1 %10, label %for.body.us, label %for.cond.cleanup.us, !llvm.loop !172

for.cond.cleanup.us:                              ; preds = %for.body.us
  br i1 %call21.us, label %if.then23, label %if.end73.us

if.end73.us:                                      ; preds = %for.cond.cleanup.us, %land.lhs.true13.us, %land.lhs.true10.us, %land.lhs.true7.us, %land.lhs.true.us, %while.body.us
  %next.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222.us, i64 0, i32 0
  %entry3.0.us = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next.us, align 8, !tbaa !12
  %cmp.not.us = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0.us, null
  br i1 %cmp.not.us, label %for.cond75.preheader, label %while.body.us, !llvm.loop !173

for.cond75.preheader:                             ; preds = %if.end73, %if.end73.us, %entry
  %cmp76210 = icmp sgt i32 %tuple_count, 0
  br i1 %cmp76210, label %for.body78.preheader, label %cleanup119

for.body78.preheader:                             ; preds = %for.cond75.preheader
  %wide.trip.count = zext i32 %tuple_count to i64
  br label %for.body78

while.body:                                       ; preds = %while.body.lr.ph, %if.end73
  %entry3.0222 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %entry3.0, %if.end73 ], [ %entry3.0220, %while.body.lr.ph ]
  %hash = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222, i64 0, i32 6
  %11 = load i32, i32* %hash, align 8, !tbaa !149
  %cmp4 = icmp eq i32 %11, %call
  br i1 %cmp4, label %land.lhs.true, label %if.end73

land.lhs.true:                                    ; preds = %while.body
  %key_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222, i64 0, i32 4
  %12 = load i64, i64* %key_size, align 8, !tbaa !148
  %cmp6 = icmp eq i64 %12, %conv
  br i1 %cmp6, label %land.lhs.true7, label %if.end73

land.lhs.true7:                                   ; preds = %land.lhs.true
  %key = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222, i64 0, i32 5
  %13 = load i8*, i8** %key, align 8, !tbaa !153
  %call9 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %13, i8* %cache_key, i64 %conv) #17
  br i1 %call9, label %land.lhs.true10, label %if.end73

land.lhs.true10:                                  ; preds = %land.lhs.true7
  %computed_bounds11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222, i64 0, i32 10
  %14 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %computed_bounds11, align 8, !tbaa !152
  %call12 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %computed_bounds, %struct.halide_dimension_t* %14) #17
  br i1 %call12, label %land.lhs.true13, label %if.end73

land.lhs.true13:                                  ; preds = %land.lhs.true10
  %tuple_count14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222, i64 0, i32 8
  %15 = load i32, i32* %tuple_count14, align 8, !tbaa !126
  %cmp15 = icmp eq i32 %15, %tuple_count
  br i1 %cmp15, label %if.then23, label %if.end73

if.then23:                                        ; preds = %land.lhs.true13, %for.cond.cleanup.us
  %.us-phi = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %entry3.0222.us, %for.cond.cleanup.us ], [ %entry3.0222, %land.lhs.true13 ]
  %16 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  %cmp24.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %16
  br i1 %cmp24.not, label %if.end57, label %do.body

do.body:                                          ; preds = %if.then23
  %more_recent = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 1
  %17 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent, align 8, !tbaa !164
  %cmp26.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %17, null
  br i1 %cmp26.not, label %if.then27, label %do.end

if.then27:                                        ; preds = %do.body
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.3.43, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end

do.end:                                           ; preds = %if.then27, %do.body
  %less_recent = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 2
  %18 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent, align 8, !tbaa !147
  %cmp28.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %18, null
  br i1 %cmp28.not, label %do.body33, label %if.then29

if.then29:                                        ; preds = %do.end
  %19 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent, align 8, !tbaa !164
  %more_recent32 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %18, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %19, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent32, align 8, !tbaa !164
  %.pr = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent, align 8, !tbaa !164
  br label %do.body41

do.body33:                                        ; preds = %do.end
  %20 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %cmp34 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %20, %.us-phi
  br i1 %cmp34, label %do.end38, label %if.then35

if.then35:                                        ; preds = %do.body33
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([156 x i8], [156 x i8]* @.str.4.44, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end38

do.end38:                                         ; preds = %if.then35, %do.body33
  %21 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent, align 8, !tbaa !164
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %21, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  br label %do.body41

do.body41:                                        ; preds = %do.end38, %if.then29
  %22 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %.pr, %if.then29 ], [ %21, %do.end38 ]
  %cmp43.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %22, null
  br i1 %cmp43.not, label %if.then44, label %do.end47

if.then44:                                        ; preds = %do.body41
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.5.45, i64 0, i64 0)) #16
  tail call void @abort() #16
  %.pre = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent, align 8, !tbaa !164
  br label %do.end47

do.end47:                                         ; preds = %if.then44, %do.body41
  %23 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %.pre, %if.then44 ], [ %22, %do.body41 ]
  %24 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent, align 8, !tbaa !147
  %less_recent50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %23, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %24, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent50, align 8, !tbaa !147
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent, align 8, !tbaa !164
  %25 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %25, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent, align 8, !tbaa !147
  %cmp53.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %25, null
  br i1 %cmp53.not, label %if.end56, label %if.then54

if.then54:                                        ; preds = %do.end47
  %more_recent55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %25, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent55, align 8, !tbaa !164
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %do.end47
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then23
  br i1 %cmp16215, label %for.body62.lr.ph, label %cleanup119.loopexit223

for.body62.lr.ph:                                 ; preds = %if.end57
  %buf66 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 11
  %wide.trip.count230 = zext i32 %tuple_count to i64
  %26 = add nsw i64 %wide.trip.count230, -1
  %xtraiter = and i64 %wide.trip.count230, 3
  %27 = icmp ult i64 %26, 3
  br i1 %27, label %cleanup119.loopexit223.loopexit.unr-lcssa, label %for.body62.lr.ph.new

for.body62.lr.ph.new:                             ; preds = %for.body62.lr.ph
  %unroll_iter = and i64 %wide.trip.count230, 4294967292
  br label %for.body62

for.body62:                                       ; preds = %for.body62, %for.body62.lr.ph.new
  %indvars.iv228 = phi i64 [ 0, %for.body62.lr.ph.new ], [ %indvars.iv.next229.3, %for.body62 ]
  %niter = phi i64 [ %unroll_iter, %for.body62.lr.ph.new ], [ %niter.nsub.3, %for.body62 ]
  %arrayidx65 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv228
  %28 = bitcast %struct.halide_buffer_t** %arrayidx65 to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !12
  %30 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf66, align 8, !tbaa !128
  %arrayidx68 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %30, i64 %indvars.iv228
  %31 = bitcast %struct.halide_buffer_t* %arrayidx68 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %29, i8* nonnull align 8 dereferenceable(56) %31, i64 56, i1 false), !tbaa.struct !159
  %indvars.iv.next229 = or i64 %indvars.iv228, 1
  %arrayidx65.1 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv.next229
  %32 = bitcast %struct.halide_buffer_t** %arrayidx65.1 to i8**
  %33 = load i8*, i8** %32, align 8, !tbaa !12
  %34 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf66, align 8, !tbaa !128
  %arrayidx68.1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %34, i64 %indvars.iv.next229
  %35 = bitcast %struct.halide_buffer_t* %arrayidx68.1 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %33, i8* nonnull align 8 dereferenceable(56) %35, i64 56, i1 false), !tbaa.struct !159
  %indvars.iv.next229.1 = or i64 %indvars.iv228, 2
  %arrayidx65.2 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv.next229.1
  %36 = bitcast %struct.halide_buffer_t** %arrayidx65.2 to i8**
  %37 = load i8*, i8** %36, align 8, !tbaa !12
  %38 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf66, align 8, !tbaa !128
  %arrayidx68.2 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %38, i64 %indvars.iv.next229.1
  %39 = bitcast %struct.halide_buffer_t* %arrayidx68.2 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %37, i8* nonnull align 8 dereferenceable(56) %39, i64 56, i1 false), !tbaa.struct !159
  %indvars.iv.next229.2 = or i64 %indvars.iv228, 3
  %arrayidx65.3 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv.next229.2
  %40 = bitcast %struct.halide_buffer_t** %arrayidx65.3 to i8**
  %41 = load i8*, i8** %40, align 8, !tbaa !12
  %42 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf66, align 8, !tbaa !128
  %arrayidx68.3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %42, i64 %indvars.iv.next229.2
  %43 = bitcast %struct.halide_buffer_t* %arrayidx68.3 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %41, i8* nonnull align 8 dereferenceable(56) %43, i64 56, i1 false), !tbaa.struct !159
  %indvars.iv.next229.3 = add nuw nsw i64 %indvars.iv228, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %cleanup119.loopexit223.loopexit.unr-lcssa, label %for.body62, !llvm.loop !174

if.end73:                                         ; preds = %land.lhs.true13, %land.lhs.true10, %land.lhs.true7, %land.lhs.true, %while.body
  %next = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0222, i64 0, i32 0
  %entry3.0 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next, align 8, !tbaa !12
  %cmp.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %entry3.0, null
  br i1 %cmp.not, label %for.cond75.preheader, label %while.body, !llvm.loop !173

for.body78:                                       ; preds = %for.inc114, %for.body78.preheader
  %indvars.iv = phi i64 [ 0, %for.body78.preheader ], [ %indvars.iv.next, %for.inc114 ]
  %arrayidx81 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv
  %44 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx81, align 8, !tbaa !12
  %dimensions.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %44, i64 0, i32 5
  %45 = load i32, i32* %dimensions.i.i, align 4, !tbaa !70
  %cmp19.i.i = icmp sgt i32 %45, 0
  br i1 %cmp19.i.i, label %for.body.lr.ph.i.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.lr.ph.i.i:                               ; preds = %for.body78
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %44, i64 0, i32 6
  %46 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8, !tbaa !71
  %wide.trip.count.i.i = zext i32 %45 to i64
  %min.iters.check53 = icmp ult i32 %45, 17
  br i1 %min.iters.check53, label %for.body.i.i.preheader, label %vector.ph54

vector.ph54:                                      ; preds = %for.body.lr.ph.i.i
  %n.mod.vf55 = and i64 %wide.trip.count.i.i, 15
  %47 = icmp eq i64 %n.mod.vf55, 0
  %48 = select i1 %47, i64 16, i64 %n.mod.vf55
  %n.vec56 = sub nsw i64 %wide.trip.count.i.i, %48
  br label %vector.body52

vector.body52:                                    ; preds = %vector.body52, %vector.ph54
  %index57 = phi i64 [ 0, %vector.ph54 ], [ %index.next58, %vector.body52 ]
  %vec.ind61 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph54 ], [ %vec.ind.next66, %vector.body52 ]
  %vec.phi67 = phi <4 x i64> [ zeroinitializer, %vector.ph54 ], [ %predphi83, %vector.body52 ]
  %vec.phi68 = phi <4 x i64> [ zeroinitializer, %vector.ph54 ], [ %predphi84, %vector.body52 ]
  %vec.phi69 = phi <4 x i64> [ zeroinitializer, %vector.ph54 ], [ %predphi85, %vector.body52 ]
  %vec.phi70 = phi <4 x i64> [ zeroinitializer, %vector.ph54 ], [ %predphi86, %vector.body52 ]
  %step.add62 = add <4 x i64> %vec.ind61, <i64 4, i64 4, i64 4, i64 4>
  %step.add63 = add <4 x i64> %vec.ind61, <i64 8, i64 8, i64 8, i64 8>
  %step.add64 = add <4 x i64> %vec.ind61, <i64 12, i64 12, i64 12, i64 12>
  %49 = or i64 %index57, 4
  %50 = or i64 %index57, 8
  %51 = or i64 %index57, 12
  %52 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %index57, i32 2
  %53 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %49, i32 2
  %54 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %50, i32 2
  %55 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %51, i32 2
  %56 = bitcast i32* %52 to <16 x i32>*
  %57 = bitcast i32* %53 to <16 x i32>*
  %58 = bitcast i32* %54 to <16 x i32>*
  %59 = bitcast i32* %55 to <16 x i32>*
  %wide.vec71 = load <16 x i32>, <16 x i32>* %56, align 4, !tbaa !77
  %wide.vec72 = load <16 x i32>, <16 x i32>* %57, align 4, !tbaa !77
  %wide.vec73 = load <16 x i32>, <16 x i32>* %58, align 4, !tbaa !77
  %wide.vec74 = load <16 x i32>, <16 x i32>* %59, align 4, !tbaa !77
  %strided.vec75 = shufflevector <16 x i32> %wide.vec71, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec76 = shufflevector <16 x i32> %wide.vec72, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec77 = shufflevector <16 x i32> %wide.vec73, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec78 = shufflevector <16 x i32> %wide.vec74, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %60 = icmp sgt <4 x i32> %strided.vec75, zeroinitializer
  %61 = icmp sgt <4 x i32> %strided.vec76, zeroinitializer
  %62 = icmp sgt <4 x i32> %strided.vec77, zeroinitializer
  %63 = icmp sgt <4 x i32> %strided.vec78, zeroinitializer
  %64 = zext <4 x i32> %strided.vec75 to <4 x i64>
  %65 = zext <4 x i32> %strided.vec76 to <4 x i64>
  %66 = zext <4 x i32> %strided.vec77 to <4 x i64>
  %67 = zext <4 x i32> %strided.vec78 to <4 x i64>
  %68 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %vec.ind61, i32 1
  %69 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %step.add62, i32 1
  %70 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %step.add63, i32 1
  %71 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %step.add64, i32 1
  %wide.masked.gather79 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %68, i32 4, <4 x i1> %60, <4 x i32> undef), !tbaa !73
  %wide.masked.gather80 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %69, i32 4, <4 x i1> %61, <4 x i32> undef), !tbaa !73
  %wide.masked.gather81 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %70, i32 4, <4 x i1> %62, <4 x i32> undef), !tbaa !73
  %wide.masked.gather82 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %71, i32 4, <4 x i1> %63, <4 x i32> undef), !tbaa !73
  %72 = add nsw <4 x i32> %wide.masked.gather79, <i32 -1, i32 -1, i32 -1, i32 -1>
  %73 = add nsw <4 x i32> %wide.masked.gather80, <i32 -1, i32 -1, i32 -1, i32 -1>
  %74 = add nsw <4 x i32> %wide.masked.gather81, <i32 -1, i32 -1, i32 -1, i32 -1>
  %75 = add nsw <4 x i32> %wide.masked.gather82, <i32 -1, i32 -1, i32 -1, i32 -1>
  %76 = sext <4 x i32> %72 to <4 x i64>
  %77 = sext <4 x i32> %73 to <4 x i64>
  %78 = sext <4 x i32> %74 to <4 x i64>
  %79 = sext <4 x i32> %75 to <4 x i64>
  %80 = mul nsw <4 x i64> %76, %64
  %81 = mul nsw <4 x i64> %77, %65
  %82 = mul nsw <4 x i64> %78, %66
  %83 = mul nsw <4 x i64> %79, %67
  %84 = select <4 x i1> %60, <4 x i64> %80, <4 x i64> zeroinitializer
  %predphi83 = add <4 x i64> %vec.phi67, %84
  %85 = select <4 x i1> %61, <4 x i64> %81, <4 x i64> zeroinitializer
  %predphi84 = add <4 x i64> %vec.phi68, %85
  %86 = select <4 x i1> %62, <4 x i64> %82, <4 x i64> zeroinitializer
  %predphi85 = add <4 x i64> %vec.phi69, %86
  %87 = select <4 x i1> %63, <4 x i64> %83, <4 x i64> zeroinitializer
  %predphi86 = add <4 x i64> %vec.phi70, %87
  %index.next58 = add i64 %index57, 16
  %vec.ind.next66 = add <4 x i64> %vec.ind61, <i64 16, i64 16, i64 16, i64 16>
  %88 = icmp eq i64 %index.next58, %n.vec56
  br i1 %88, label %middle.block50, label %vector.body52, !llvm.loop !175

middle.block50:                                   ; preds = %vector.body52
  %bin.rdx87 = add <4 x i64> %predphi84, %predphi83
  %bin.rdx88 = add <4 x i64> %predphi85, %bin.rdx87
  %bin.rdx89 = add <4 x i64> %predphi86, %bin.rdx88
  %89 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx89)
  br label %for.body.i.i.preheader

for.body.i.i.preheader:                           ; preds = %middle.block50, %for.body.lr.ph.i.i
  %indvars.iv.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %n.vec56, %middle.block50 ]
  %index.021.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %89, %middle.block50 ]
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.preheader, %if.end.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %if.end.i.i ], [ %indvars.iv.i.i.ph, %for.body.i.i.preheader ]
  %index.021.i.i = phi i64 [ %index.1.i.i, %if.end.i.i ], [ %index.021.i.i.ph, %for.body.i.i.preheader ]
  %stride2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %indvars.iv.i.i, i32 2
  %90 = load i32, i32* %stride2.i.i, align 4, !tbaa !77
  %cmp3.i.i = icmp sgt i32 %90, 0
  br i1 %cmp3.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %conv18.i.i = zext i32 %90 to i64
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %indvars.iv.i.i, i32 1
  %91 = load i32, i32* %extent.i.i, align 4, !tbaa !73
  %sub.i.i = add nsw i32 %91, -1
  %conv7.i.i = sext i32 %sub.i.i to i64
  %mul.i.i = mul nsw i64 %conv7.i.i, %conv18.i.i
  %add.i.i = add nsw i64 %mul.i.i, %index.021.i.i
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i64 [ %add.i.i, %if.then.i.i ], [ %index.021.i.i, %for.body.i.i ]
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.not.i.i = icmp eq i64 %indvars.iv.next.i.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i.i, label %for.body.i13.i.preheader, label %for.body.i.i, !llvm.loop !176

for.body.i13.i.preheader:                         ; preds = %if.end.i.i
  %min.iters.check = icmp ult i32 %45, 17
  br i1 %min.iters.check, label %for.body.i13.i.preheader91, label %vector.ph

vector.ph:                                        ; preds = %for.body.i13.i.preheader
  %n.mod.vf = and i64 %wide.trip.count.i.i, 15
  %92 = icmp eq i64 %n.mod.vf, 0
  %93 = select i1 %92, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %wide.trip.count.i.i, %93
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi33 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi45, %vector.body ]
  %vec.phi34 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi46, %vector.body ]
  %vec.phi35 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi47, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add30 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add31 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %94 = or i64 %index, 4
  %95 = or i64 %index, 8
  %96 = or i64 %index, 12
  %97 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %index, i32 2
  %98 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %94, i32 2
  %99 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %95, i32 2
  %100 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %96, i32 2
  %101 = bitcast i32* %97 to <16 x i32>*
  %102 = bitcast i32* %98 to <16 x i32>*
  %103 = bitcast i32* %99 to <16 x i32>*
  %104 = bitcast i32* %100 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %101, align 4, !tbaa !77
  %wide.vec36 = load <16 x i32>, <16 x i32>* %102, align 4, !tbaa !77
  %wide.vec37 = load <16 x i32>, <16 x i32>* %103, align 4, !tbaa !77
  %wide.vec38 = load <16 x i32>, <16 x i32>* %104, align 4, !tbaa !77
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec39 = shufflevector <16 x i32> %wide.vec36, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec40 = shufflevector <16 x i32> %wide.vec37, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec41 = shufflevector <16 x i32> %wide.vec38, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %105 = icmp slt <4 x i32> %strided.vec, zeroinitializer
  %106 = icmp slt <4 x i32> %strided.vec39, zeroinitializer
  %107 = icmp slt <4 x i32> %strided.vec40, zeroinitializer
  %108 = icmp slt <4 x i32> %strided.vec41, zeroinitializer
  %109 = sext <4 x i32> %strided.vec to <4 x i64>
  %110 = sext <4 x i32> %strided.vec39 to <4 x i64>
  %111 = sext <4 x i32> %strided.vec40 to <4 x i64>
  %112 = sext <4 x i32> %strided.vec41 to <4 x i64>
  %113 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %vec.ind, i32 1
  %114 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %step.add, i32 1
  %115 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %step.add30, i32 1
  %116 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, <4 x i64> %step.add31, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %113, i32 4, <4 x i1> %105, <4 x i32> undef), !tbaa !73
  %wide.masked.gather42 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %114, i32 4, <4 x i1> %106, <4 x i32> undef), !tbaa !73
  %wide.masked.gather43 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %115, i32 4, <4 x i1> %107, <4 x i32> undef), !tbaa !73
  %wide.masked.gather44 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %116, i32 4, <4 x i1> %108, <4 x i32> undef), !tbaa !73
  %117 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %118 = add nsw <4 x i32> %wide.masked.gather42, <i32 -1, i32 -1, i32 -1, i32 -1>
  %119 = add nsw <4 x i32> %wide.masked.gather43, <i32 -1, i32 -1, i32 -1, i32 -1>
  %120 = add nsw <4 x i32> %wide.masked.gather44, <i32 -1, i32 -1, i32 -1, i32 -1>
  %121 = sext <4 x i32> %117 to <4 x i64>
  %122 = sext <4 x i32> %118 to <4 x i64>
  %123 = sext <4 x i32> %119 to <4 x i64>
  %124 = sext <4 x i32> %120 to <4 x i64>
  %125 = mul nsw <4 x i64> %121, %109
  %126 = mul nsw <4 x i64> %122, %110
  %127 = mul nsw <4 x i64> %123, %111
  %128 = mul nsw <4 x i64> %124, %112
  %129 = select <4 x i1> %105, <4 x i64> %125, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %129
  %130 = select <4 x i1> %106, <4 x i64> %126, <4 x i64> zeroinitializer
  %predphi45 = add <4 x i64> %vec.phi33, %130
  %131 = select <4 x i1> %107, <4 x i64> %127, <4 x i64> zeroinitializer
  %predphi46 = add <4 x i64> %vec.phi34, %131
  %132 = select <4 x i1> %108, <4 x i64> %128, <4 x i64> zeroinitializer
  %predphi47 = add <4 x i64> %vec.phi35, %132
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %133 = icmp eq i64 %index.next, %n.vec
  br i1 %133, label %middle.block, label %vector.body, !llvm.loop !177

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi45, %predphi
  %bin.rdx48 = add <4 x i64> %predphi46, %bin.rdx
  %bin.rdx49 = add <4 x i64> %predphi47, %bin.rdx48
  %134 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx49)
  br label %for.body.i13.i.preheader91

for.body.i13.i.preheader91:                       ; preds = %middle.block, %for.body.i13.i.preheader
  %indvars.iv.i10.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %n.vec, %middle.block ]
  %index.018.i.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %134, %middle.block ]
  br label %for.body.i13.i

for.body.i13.i:                                   ; preds = %for.body.i13.i.preheader91, %if.end.i24.i
  %indvars.iv.i10.i = phi i64 [ %indvars.iv.next.i22.i, %if.end.i24.i ], [ %indvars.iv.i10.i.ph, %for.body.i13.i.preheader91 ]
  %index.018.i.i = phi i64 [ %index.1.i21.i, %if.end.i24.i ], [ %index.018.i.i.ph, %for.body.i13.i.preheader91 ]
  %stride2.i11.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %indvars.iv.i10.i, i32 2
  %135 = load i32, i32* %stride2.i11.i, align 4, !tbaa !77
  %cmp3.i12.i = icmp slt i32 %135, 0
  br i1 %cmp3.i12.i, label %if.then.i20.i, label %if.end.i24.i

if.then.i20.i:                                    ; preds = %for.body.i13.i
  %conv.i14.i = sext i32 %135 to i64
  %extent.i15.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %46, i64 %indvars.iv.i10.i, i32 1
  %136 = load i32, i32* %extent.i15.i, align 4, !tbaa !73
  %sub.i16.i = add nsw i32 %136, -1
  %conv7.i17.i = sext i32 %sub.i16.i to i64
  %mul.i18.i = mul nsw i64 %conv7.i17.i, %conv.i14.i
  %add.i19.i = add nsw i64 %mul.i18.i, %index.018.i.i
  br label %if.end.i24.i

if.end.i24.i:                                     ; preds = %if.then.i20.i, %for.body.i13.i
  %index.1.i21.i = phi i64 [ %add.i19.i, %if.then.i20.i ], [ %index.018.i.i, %for.body.i13.i ]
  %indvars.iv.next.i22.i = add nuw nsw i64 %indvars.iv.i10.i, 1
  %exitcond.not.i23.i = icmp eq i64 %indvars.iv.next.i22.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i23.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i13.i, !llvm.loop !178

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %if.end.i24.i
  %add8.i.i = add nsw i64 %index.1.i.i, 1
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, %for.body78
  %add8.i27.i = phi i64 [ 1, %for.body78 ], [ %add8.i.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %index.0.lcssa.i9.i = phi i64 [ 0, %for.body78 ], [ %index.1.i21.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %sub.i = sub nsw i64 %add8.i27.i, %index.0.lcssa.i9.i
  %bits.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %44, i64 0, i32 4, i32 1
  %137 = load i8, i8* %bits.i.i, align 1, !tbaa !28
  %conv.i.i = zext i8 %137 to i64
  %add.i4.i = add nuw nsw i64 %conv.i.i, 7
  %div.i.i = lshr i64 %add.i4.i, 3
  %mul.i = mul i64 %div.i.i, %sub.i
  %add84 = add i64 %mul.i, 64
  %call85 = tail call i8* @halide_malloc(i8* %user_context, i64 %add84) #16
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %44, i64 0, i32 2
  store i8* %call85, i8** %host, align 8, !tbaa !67
  %cmp87 = icmp eq i8* %call85, null
  br i1 %cmp87, label %for.cond89.preheader, label %for.inc114

for.cond89.preheader:                             ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %cmp90208.not = icmp eq i64 %indvars.iv, 0
  br i1 %cmp90208.not, label %cleanup119, label %for.body92

for.body92:                                       ; preds = %for.cond89.preheader, %for.body92
  %indvars.iv224 = phi i64 [ %indvars.iv.next225, %for.body92 ], [ %indvars.iv, %for.cond89.preheader ]
  %sub = add nuw nsw i64 %indvars.iv224, 4294967295
  %138 = and i64 %sub, 4294967295
  %arrayidx94 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %138
  %139 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx94, align 8, !tbaa !12
  %host95 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %139, i64 0, i32 2
  %140 = load i8*, i8** %host95, align 8, !tbaa !67
  %call96 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %140) #17
  %141 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call96 to i8*
  tail call void @halide_free(i8* %user_context, i8* %141) #16
  %142 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx94, align 8, !tbaa !12
  %host100 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %142, i64 0, i32 2
  store i8* null, i8** %host100, align 8, !tbaa !67
  %143 = icmp sgt i64 %indvars.iv224, 1
  %indvars.iv.next225 = add nsw i64 %indvars.iv224, -1
  br i1 %143, label %for.body92, label %cleanup119, !llvm.loop !179

for.inc114:                                       ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %add.ptr = getelementptr inbounds i8, i8* %call85, i64 64
  store i8* %add.ptr, i8** %host, align 8, !tbaa !67
  %call108 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* nonnull %add.ptr) #17
  %hash109 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call108, i64 0, i32 1
  store i32 %call, i32* %hash109, align 8, !tbaa !180
  %entry110 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call108, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %entry110, align 8, !tbaa !182
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %cleanup119, label %for.body78, !llvm.loop !183

cleanup119.loopexit223.loopexit.unr-lcssa:        ; preds = %for.body62, %for.body62.lr.ph
  %indvars.iv228.unr = phi i64 [ 0, %for.body62.lr.ph ], [ %indvars.iv.next229.3, %for.body62 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %cleanup119.loopexit223, label %for.body62.epil

for.body62.epil:                                  ; preds = %cleanup119.loopexit223.loopexit.unr-lcssa, %for.body62.epil
  %indvars.iv228.epil = phi i64 [ %indvars.iv.next229.epil, %for.body62.epil ], [ %indvars.iv228.unr, %cleanup119.loopexit223.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body62.epil ], [ %xtraiter, %cleanup119.loopexit223.loopexit.unr-lcssa ]
  %arrayidx65.epil = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv228.epil
  %144 = bitcast %struct.halide_buffer_t** %arrayidx65.epil to i8**
  %145 = load i8*, i8** %144, align 8, !tbaa !12
  %146 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf66, align 8, !tbaa !128
  %arrayidx68.epil = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %146, i64 %indvars.iv228.epil
  %147 = bitcast %struct.halide_buffer_t* %arrayidx68.epil to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %145, i8* nonnull align 8 dereferenceable(56) %147, i64 56, i1 false), !tbaa.struct !159
  %indvars.iv.next229.epil = add nuw nsw i64 %indvars.iv228.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %cleanup119.loopexit223, label %for.body62.epil, !llvm.loop !184

cleanup119.loopexit223:                           ; preds = %cleanup119.loopexit223.loopexit.unr-lcssa, %for.body62.epil, %if.end57
  %in_use_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 7
  %148 = load i32, i32* %in_use_count, align 4, !tbaa !150
  %add = add i32 %148, %tuple_count
  store i32 %add, i32* %in_use_count, align 4, !tbaa !150
  br label %cleanup119

cleanup119:                                       ; preds = %for.inc114, %for.body92, %cleanup119.loopexit223, %for.cond89.preheader, %for.cond75.preheader
  %retval.6 = phi i32 [ 1, %for.cond75.preheader ], [ 0, %cleanup119.loopexit223 ], [ -1, %for.cond89.preheader ], [ -1, %for.body92 ], [ 1, %for.inc114 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret i32 %retval.6
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_store(i8* %user_context, i8* %cache_key, i32 %size, %struct.halide_buffer_t* %computed_bounds, i32 %tuple_count, %struct.halide_buffer_t** %tuple_buffers, i1 zeroext %has_eviction_key, i64 %eviction_key) local_unnamed_addr #4 {
entry:
  %0 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, align 8, !tbaa !12
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %0, i64 0, i32 2
  %1 = load i8*, i8** %host, align 8, !tbaa !67
  %call = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %1) #17
  %hash = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call, i64 0, i32 1
  %2 = load i32, i32* %hash, align 8, !tbaa !180
  %3 = and i32 %2, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  %idxprom = zext i32 %3 to i64
  %arrayidx7 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %idxprom
  %entry6.0228 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %arrayidx7, align 8, !tbaa !12
  %cmp.not229 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0228, null
  br i1 %cmp.not229, label %for.cond61.preheader, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %conv10 = sext i32 %size to i64
  %cmp22221 = icmp sgt i32 %tuple_count, 0
  br i1 %cmp22221, label %while.body.us.preheader, label %while.body

while.body.us.preheader:                          ; preds = %while.body.lr.ph
  %4 = zext i32 %tuple_count to i64
  br label %while.body.us

while.body.us:                                    ; preds = %if.end59.us, %while.body.us.preheader
  %entry6.0230.us = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %entry6.0.us, %if.end59.us ], [ %entry6.0228, %while.body.us.preheader ]
  %hash8.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230.us, i64 0, i32 6
  %5 = load i32, i32* %hash8.us, align 8, !tbaa !149
  %cmp9.us = icmp eq i32 %5, %2
  br i1 %cmp9.us, label %land.lhs.true.us, label %if.end59.us

land.lhs.true.us:                                 ; preds = %while.body.us
  %key_size.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230.us, i64 0, i32 4
  %6 = load i64, i64* %key_size.us, align 8, !tbaa !148
  %cmp11.us = icmp eq i64 %6, %conv10
  br i1 %cmp11.us, label %land.lhs.true12.us, label %if.end59.us

land.lhs.true12.us:                               ; preds = %land.lhs.true.us
  %key.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230.us, i64 0, i32 5
  %7 = load i8*, i8** %key.us, align 8, !tbaa !153
  %call14.us = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %7, i8* %cache_key, i64 %conv10) #17
  br i1 %call14.us, label %land.lhs.true15.us, label %if.end59.us

land.lhs.true15.us:                               ; preds = %land.lhs.true12.us
  %computed_bounds16.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230.us, i64 0, i32 10
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %computed_bounds16.us, align 8, !tbaa !152
  %call17.us = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %computed_bounds, %struct.halide_dimension_t* %8) #17
  br i1 %call17.us, label %land.lhs.true18.us, label %if.end59.us

land.lhs.true18.us:                               ; preds = %land.lhs.true15.us
  %tuple_count19.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230.us, i64 0, i32 8
  %9 = load i32, i32* %tuple_count19.us, align 8, !tbaa !126
  %cmp20.us = icmp eq i32 %9, %tuple_count
  br i1 %cmp20.us, label %for.body.lr.ph.us, label %if.end59.us

for.cond.cleanup.us:                              ; preds = %for.body.us
  br i1 %call30.us, label %do.body.us, label %if.end59.us

do.body.us:                                       ; preds = %for.cond.cleanup.us
  %10 = and i8 %spec.select.us, 1
  %tobool41.not.us = icmp eq i8 %10, 0
  br i1 %tobool41.not.us, label %if.then42.us, label %for.body48.us.preheader

for.body48.us.preheader:                          ; preds = %if.then42.us, %do.body.us
  br label %for.body48.us

if.then42.us:                                     ; preds = %do.body.us
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([150 x i8], [150 x i8]* @.str.9.46, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %for.body48.us.preheader

if.end59.us:                                      ; preds = %for.cond.cleanup.us, %land.lhs.true18.us, %land.lhs.true15.us, %land.lhs.true12.us, %land.lhs.true.us, %while.body.us
  %next.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230.us, i64 0, i32 0
  %entry6.0.us = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next.us, align 8, !tbaa !12
  %cmp.not.us = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0.us, null
  br i1 %cmp.not.us, label %for.cond61.preheader, label %while.body.us, !llvm.loop !185

for.body48.us:                                    ; preds = %for.body48.us.preheader, %for.body48.us
  %indvars.iv244 = phi i64 [ %indvars.iv.next245, %for.body48.us ], [ 0, %for.body48.us.preheader ]
  %arrayidx50.us = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv244
  %11 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx50.us, align 8, !tbaa !12
  %host51.us = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %11, i64 0, i32 2
  %12 = load i8*, i8** %host51.us, align 8, !tbaa !67
  %call52.us = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %12) #17
  %entry53.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call52.us, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %entry53.us, align 8, !tbaa !182
  %indvars.iv.next245 = add nuw nsw i64 %indvars.iv244, 1
  %exitcond247.not = icmp eq i64 %indvars.iv.next245, %4
  br i1 %exitcond247.not, label %cleanup132, label %for.body48.us, !llvm.loop !186

for.body.us:                                      ; preds = %for.body.lr.ph.us, %for.body.us
  %13 = phi %struct.halide_buffer_t* [ %.pre, %for.body.lr.ph.us ], [ %16, %for.body.us ]
  %indvars.iv242 = phi i64 [ 0, %for.body.lr.ph.us ], [ %indvars.iv.next243, %for.body.us ]
  %no_host_pointers_equal.0222.us = phi i8 [ 1, %for.body.lr.ph.us ], [ %spec.select.us, %for.body.us ]
  %arrayidx24.us = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv242
  %14 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx24.us, align 8, !tbaa !12
  %dim.us = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %13, i64 %indvars.iv242, i32 6
  %15 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.us, align 8, !tbaa !71
  %call30.us = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %14, %struct.halide_dimension_t* %15) #17
  %16 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf27.us, align 8, !tbaa !128
  %host35.us = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %16, i64 %indvars.iv242, i32 2
  %17 = load i8*, i8** %host35.us, align 8, !tbaa !67
  %host36.us = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %14, i64 0, i32 2
  %18 = load i8*, i8** %host36.us, align 8, !tbaa !67
  %cmp37.us = icmp eq i8* %17, %18
  %spec.select.us = select i1 %cmp37.us, i8 0, i8 %no_host_pointers_equal.0222.us
  %indvars.iv.next243 = add nuw nsw i64 %indvars.iv242, 1
  %cmp22.us = icmp ult i64 %indvars.iv.next243, %4
  %19 = and i1 %cmp22.us, %call30.us
  br i1 %19, label %for.body.us, label %for.cond.cleanup.us, !llvm.loop !187

for.body.lr.ph.us:                                ; preds = %land.lhs.true18.us
  %buf27.us = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230.us, i64 0, i32 11
  %.pre = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %buf27.us, align 8, !tbaa !128
  br label %for.body.us

for.cond61.preheader:                             ; preds = %if.end59, %if.end59.us, %entry
  %cmp62218 = icmp sgt i32 %tuple_count, 0
  br i1 %cmp62218, label %for.body64.preheader, label %for.cond.cleanup63

for.body64.preheader:                             ; preds = %for.cond61.preheader
  %wide.trip.count240 = zext i32 %tuple_count to i64
  br label %for.body64

while.body:                                       ; preds = %while.body.lr.ph, %if.end59
  %entry6.0230 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %entry6.0, %if.end59 ], [ %entry6.0228, %while.body.lr.ph ]
  %hash8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230, i64 0, i32 6
  %20 = load i32, i32* %hash8, align 8, !tbaa !149
  %cmp9 = icmp eq i32 %20, %2
  br i1 %cmp9, label %land.lhs.true, label %if.end59

land.lhs.true:                                    ; preds = %while.body
  %key_size = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230, i64 0, i32 4
  %21 = load i64, i64* %key_size, align 8, !tbaa !148
  %cmp11 = icmp eq i64 %21, %conv10
  br i1 %cmp11, label %land.lhs.true12, label %if.end59

land.lhs.true12:                                  ; preds = %land.lhs.true
  %key = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230, i64 0, i32 5
  %22 = load i8*, i8** %key, align 8, !tbaa !153
  %call14 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %22, i8* %cache_key, i64 %conv10) #17
  br i1 %call14, label %land.lhs.true15, label %if.end59

land.lhs.true15:                                  ; preds = %land.lhs.true12
  %computed_bounds16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230, i64 0, i32 10
  %23 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %computed_bounds16, align 8, !tbaa !152
  %call17 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %computed_bounds, %struct.halide_dimension_t* %23) #17
  br i1 %call17, label %land.lhs.true18, label %if.end59

land.lhs.true18:                                  ; preds = %land.lhs.true15
  %tuple_count19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230, i64 0, i32 8
  %24 = load i32, i32* %tuple_count19, align 8, !tbaa !126
  %cmp20 = icmp eq i32 %24, %tuple_count
  br i1 %cmp20, label %cleanup132, label %if.end59

if.end59:                                         ; preds = %land.lhs.true18, %land.lhs.true15, %land.lhs.true12, %land.lhs.true, %while.body
  %next = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0230, i64 0, i32 0
  %entry6.0 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next, align 8, !tbaa !12
  %cmp.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %entry6.0, null
  br i1 %cmp.not, label %for.cond61.preheader, label %while.body, !llvm.loop !185

for.cond.cleanup63:                               ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit, %for.cond61.preheader
  %added_size.0.lcssa = phi i64 [ 0, %for.cond61.preheader ], [ %add, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ]
  %25 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  %add73 = add i64 %25, %added_size.0.lcssa
  store i64 %add73, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #17
  %call74 = tail call i8* @halide_malloc(i8* null, i64 96) #16
  %tobool75.not = icmp eq i8* %call74, null
  br i1 %tobool75.not, label %if.then83, label %if.then76

for.body64:                                       ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit, %for.body64.preheader
  %indvars.iv238 = phi i64 [ 0, %for.body64.preheader ], [ %indvars.iv.next239, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ]
  %added_size.0219 = phi i64 [ 0, %for.body64.preheader ], [ %add, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ]
  %arrayidx67 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv238
  %26 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx67, align 8, !tbaa !12
  %dimensions.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %26, i64 0, i32 5
  %27 = load i32, i32* %dimensions.i.i, align 4, !tbaa !70
  %cmp19.i.i = icmp sgt i32 %27, 0
  br i1 %cmp19.i.i, label %for.body.lr.ph.i.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.lr.ph.i.i:                               ; preds = %for.body64
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %26, i64 0, i32 6
  %28 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8, !tbaa !71
  %wide.trip.count.i.i = zext i32 %27 to i64
  %min.iters.check39 = icmp ult i32 %27, 17
  br i1 %min.iters.check39, label %for.body.i.i.preheader, label %vector.ph40

vector.ph40:                                      ; preds = %for.body.lr.ph.i.i
  %n.mod.vf41 = and i64 %wide.trip.count.i.i, 15
  %29 = icmp eq i64 %n.mod.vf41, 0
  %30 = select i1 %29, i64 16, i64 %n.mod.vf41
  %n.vec42 = sub nsw i64 %wide.trip.count.i.i, %30
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38, %vector.ph40
  %index43 = phi i64 [ 0, %vector.ph40 ], [ %index.next44, %vector.body38 ]
  %vec.ind47 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph40 ], [ %vec.ind.next52, %vector.body38 ]
  %vec.phi53 = phi <4 x i64> [ zeroinitializer, %vector.ph40 ], [ %predphi69, %vector.body38 ]
  %vec.phi54 = phi <4 x i64> [ zeroinitializer, %vector.ph40 ], [ %predphi70, %vector.body38 ]
  %vec.phi55 = phi <4 x i64> [ zeroinitializer, %vector.ph40 ], [ %predphi71, %vector.body38 ]
  %vec.phi56 = phi <4 x i64> [ zeroinitializer, %vector.ph40 ], [ %predphi72, %vector.body38 ]
  %step.add48 = add <4 x i64> %vec.ind47, <i64 4, i64 4, i64 4, i64 4>
  %step.add49 = add <4 x i64> %vec.ind47, <i64 8, i64 8, i64 8, i64 8>
  %step.add50 = add <4 x i64> %vec.ind47, <i64 12, i64 12, i64 12, i64 12>
  %31 = or i64 %index43, 4
  %32 = or i64 %index43, 8
  %33 = or i64 %index43, 12
  %34 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %index43, i32 2
  %35 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %31, i32 2
  %36 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %32, i32 2
  %37 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %33, i32 2
  %38 = bitcast i32* %34 to <16 x i32>*
  %39 = bitcast i32* %35 to <16 x i32>*
  %40 = bitcast i32* %36 to <16 x i32>*
  %41 = bitcast i32* %37 to <16 x i32>*
  %wide.vec57 = load <16 x i32>, <16 x i32>* %38, align 4, !tbaa !77
  %wide.vec58 = load <16 x i32>, <16 x i32>* %39, align 4, !tbaa !77
  %wide.vec59 = load <16 x i32>, <16 x i32>* %40, align 4, !tbaa !77
  %wide.vec60 = load <16 x i32>, <16 x i32>* %41, align 4, !tbaa !77
  %strided.vec61 = shufflevector <16 x i32> %wide.vec57, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec62 = shufflevector <16 x i32> %wide.vec58, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec63 = shufflevector <16 x i32> %wide.vec59, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec64 = shufflevector <16 x i32> %wide.vec60, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %42 = icmp sgt <4 x i32> %strided.vec61, zeroinitializer
  %43 = icmp sgt <4 x i32> %strided.vec62, zeroinitializer
  %44 = icmp sgt <4 x i32> %strided.vec63, zeroinitializer
  %45 = icmp sgt <4 x i32> %strided.vec64, zeroinitializer
  %46 = zext <4 x i32> %strided.vec61 to <4 x i64>
  %47 = zext <4 x i32> %strided.vec62 to <4 x i64>
  %48 = zext <4 x i32> %strided.vec63 to <4 x i64>
  %49 = zext <4 x i32> %strided.vec64 to <4 x i64>
  %50 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %vec.ind47, i32 1
  %51 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %step.add48, i32 1
  %52 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %step.add49, i32 1
  %53 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %step.add50, i32 1
  %wide.masked.gather65 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %50, i32 4, <4 x i1> %42, <4 x i32> undef), !tbaa !73
  %wide.masked.gather66 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %51, i32 4, <4 x i1> %43, <4 x i32> undef), !tbaa !73
  %wide.masked.gather67 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %52, i32 4, <4 x i1> %44, <4 x i32> undef), !tbaa !73
  %wide.masked.gather68 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %53, i32 4, <4 x i1> %45, <4 x i32> undef), !tbaa !73
  %54 = add nsw <4 x i32> %wide.masked.gather65, <i32 -1, i32 -1, i32 -1, i32 -1>
  %55 = add nsw <4 x i32> %wide.masked.gather66, <i32 -1, i32 -1, i32 -1, i32 -1>
  %56 = add nsw <4 x i32> %wide.masked.gather67, <i32 -1, i32 -1, i32 -1, i32 -1>
  %57 = add nsw <4 x i32> %wide.masked.gather68, <i32 -1, i32 -1, i32 -1, i32 -1>
  %58 = sext <4 x i32> %54 to <4 x i64>
  %59 = sext <4 x i32> %55 to <4 x i64>
  %60 = sext <4 x i32> %56 to <4 x i64>
  %61 = sext <4 x i32> %57 to <4 x i64>
  %62 = mul nsw <4 x i64> %58, %46
  %63 = mul nsw <4 x i64> %59, %47
  %64 = mul nsw <4 x i64> %60, %48
  %65 = mul nsw <4 x i64> %61, %49
  %66 = select <4 x i1> %42, <4 x i64> %62, <4 x i64> zeroinitializer
  %predphi69 = add <4 x i64> %vec.phi53, %66
  %67 = select <4 x i1> %43, <4 x i64> %63, <4 x i64> zeroinitializer
  %predphi70 = add <4 x i64> %vec.phi54, %67
  %68 = select <4 x i1> %44, <4 x i64> %64, <4 x i64> zeroinitializer
  %predphi71 = add <4 x i64> %vec.phi55, %68
  %69 = select <4 x i1> %45, <4 x i64> %65, <4 x i64> zeroinitializer
  %predphi72 = add <4 x i64> %vec.phi56, %69
  %index.next44 = add i64 %index43, 16
  %vec.ind.next52 = add <4 x i64> %vec.ind47, <i64 16, i64 16, i64 16, i64 16>
  %70 = icmp eq i64 %index.next44, %n.vec42
  br i1 %70, label %middle.block36, label %vector.body38, !llvm.loop !188

middle.block36:                                   ; preds = %vector.body38
  %bin.rdx73 = add <4 x i64> %predphi70, %predphi69
  %bin.rdx74 = add <4 x i64> %predphi71, %bin.rdx73
  %bin.rdx75 = add <4 x i64> %predphi72, %bin.rdx74
  %71 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx75)
  br label %for.body.i.i.preheader

for.body.i.i.preheader:                           ; preds = %middle.block36, %for.body.lr.ph.i.i
  %indvars.iv.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %n.vec42, %middle.block36 ]
  %index.021.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %71, %middle.block36 ]
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.preheader, %if.end.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %if.end.i.i ], [ %indvars.iv.i.i.ph, %for.body.i.i.preheader ]
  %index.021.i.i = phi i64 [ %index.1.i.i, %if.end.i.i ], [ %index.021.i.i.ph, %for.body.i.i.preheader ]
  %stride2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %indvars.iv.i.i, i32 2
  %72 = load i32, i32* %stride2.i.i, align 4, !tbaa !77
  %cmp3.i.i = icmp sgt i32 %72, 0
  br i1 %cmp3.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %conv18.i.i = zext i32 %72 to i64
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %indvars.iv.i.i, i32 1
  %73 = load i32, i32* %extent.i.i, align 4, !tbaa !73
  %sub.i.i = add nsw i32 %73, -1
  %conv7.i.i = sext i32 %sub.i.i to i64
  %mul.i.i = mul nsw i64 %conv7.i.i, %conv18.i.i
  %add.i.i = add nsw i64 %mul.i.i, %index.021.i.i
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i64 [ %add.i.i, %if.then.i.i ], [ %index.021.i.i, %for.body.i.i ]
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.not.i.i = icmp eq i64 %indvars.iv.next.i.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i.i, label %for.body.i13.i.preheader, label %for.body.i.i, !llvm.loop !189

for.body.i13.i.preheader:                         ; preds = %if.end.i.i
  %min.iters.check = icmp ult i32 %27, 17
  br i1 %min.iters.check, label %for.body.i13.i.preheader77, label %vector.ph

vector.ph:                                        ; preds = %for.body.i13.i.preheader
  %n.mod.vf = and i64 %wide.trip.count.i.i, 15
  %74 = icmp eq i64 %n.mod.vf, 0
  %75 = select i1 %74, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %wide.trip.count.i.i, %75
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi19 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi31, %vector.body ]
  %vec.phi20 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi32, %vector.body ]
  %vec.phi21 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi33, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add16 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add17 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %76 = or i64 %index, 4
  %77 = or i64 %index, 8
  %78 = or i64 %index, 12
  %79 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %index, i32 2
  %80 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %76, i32 2
  %81 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %77, i32 2
  %82 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %78, i32 2
  %83 = bitcast i32* %79 to <16 x i32>*
  %84 = bitcast i32* %80 to <16 x i32>*
  %85 = bitcast i32* %81 to <16 x i32>*
  %86 = bitcast i32* %82 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %83, align 4, !tbaa !77
  %wide.vec22 = load <16 x i32>, <16 x i32>* %84, align 4, !tbaa !77
  %wide.vec23 = load <16 x i32>, <16 x i32>* %85, align 4, !tbaa !77
  %wide.vec24 = load <16 x i32>, <16 x i32>* %86, align 4, !tbaa !77
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec25 = shufflevector <16 x i32> %wide.vec22, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec26 = shufflevector <16 x i32> %wide.vec23, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec27 = shufflevector <16 x i32> %wide.vec24, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %87 = icmp slt <4 x i32> %strided.vec, zeroinitializer
  %88 = icmp slt <4 x i32> %strided.vec25, zeroinitializer
  %89 = icmp slt <4 x i32> %strided.vec26, zeroinitializer
  %90 = icmp slt <4 x i32> %strided.vec27, zeroinitializer
  %91 = sext <4 x i32> %strided.vec to <4 x i64>
  %92 = sext <4 x i32> %strided.vec25 to <4 x i64>
  %93 = sext <4 x i32> %strided.vec26 to <4 x i64>
  %94 = sext <4 x i32> %strided.vec27 to <4 x i64>
  %95 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %vec.ind, i32 1
  %96 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %step.add, i32 1
  %97 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %step.add16, i32 1
  %98 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, <4 x i64> %step.add17, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %95, i32 4, <4 x i1> %87, <4 x i32> undef), !tbaa !73
  %wide.masked.gather28 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %96, i32 4, <4 x i1> %88, <4 x i32> undef), !tbaa !73
  %wide.masked.gather29 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %97, i32 4, <4 x i1> %89, <4 x i32> undef), !tbaa !73
  %wide.masked.gather30 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %98, i32 4, <4 x i1> %90, <4 x i32> undef), !tbaa !73
  %99 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %100 = add nsw <4 x i32> %wide.masked.gather28, <i32 -1, i32 -1, i32 -1, i32 -1>
  %101 = add nsw <4 x i32> %wide.masked.gather29, <i32 -1, i32 -1, i32 -1, i32 -1>
  %102 = add nsw <4 x i32> %wide.masked.gather30, <i32 -1, i32 -1, i32 -1, i32 -1>
  %103 = sext <4 x i32> %99 to <4 x i64>
  %104 = sext <4 x i32> %100 to <4 x i64>
  %105 = sext <4 x i32> %101 to <4 x i64>
  %106 = sext <4 x i32> %102 to <4 x i64>
  %107 = mul nsw <4 x i64> %103, %91
  %108 = mul nsw <4 x i64> %104, %92
  %109 = mul nsw <4 x i64> %105, %93
  %110 = mul nsw <4 x i64> %106, %94
  %111 = select <4 x i1> %87, <4 x i64> %107, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %111
  %112 = select <4 x i1> %88, <4 x i64> %108, <4 x i64> zeroinitializer
  %predphi31 = add <4 x i64> %vec.phi19, %112
  %113 = select <4 x i1> %89, <4 x i64> %109, <4 x i64> zeroinitializer
  %predphi32 = add <4 x i64> %vec.phi20, %113
  %114 = select <4 x i1> %90, <4 x i64> %110, <4 x i64> zeroinitializer
  %predphi33 = add <4 x i64> %vec.phi21, %114
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %115 = icmp eq i64 %index.next, %n.vec
  br i1 %115, label %middle.block, label %vector.body, !llvm.loop !190

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi31, %predphi
  %bin.rdx34 = add <4 x i64> %predphi32, %bin.rdx
  %bin.rdx35 = add <4 x i64> %predphi33, %bin.rdx34
  %116 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx35)
  br label %for.body.i13.i.preheader77

for.body.i13.i.preheader77:                       ; preds = %middle.block, %for.body.i13.i.preheader
  %indvars.iv.i10.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %n.vec, %middle.block ]
  %index.018.i.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %116, %middle.block ]
  br label %for.body.i13.i

for.body.i13.i:                                   ; preds = %for.body.i13.i.preheader77, %if.end.i24.i
  %indvars.iv.i10.i = phi i64 [ %indvars.iv.next.i22.i, %if.end.i24.i ], [ %indvars.iv.i10.i.ph, %for.body.i13.i.preheader77 ]
  %index.018.i.i = phi i64 [ %index.1.i21.i, %if.end.i24.i ], [ %index.018.i.i.ph, %for.body.i13.i.preheader77 ]
  %stride2.i11.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %indvars.iv.i10.i, i32 2
  %117 = load i32, i32* %stride2.i11.i, align 4, !tbaa !77
  %cmp3.i12.i = icmp slt i32 %117, 0
  br i1 %cmp3.i12.i, label %if.then.i20.i, label %if.end.i24.i

if.then.i20.i:                                    ; preds = %for.body.i13.i
  %conv.i14.i = sext i32 %117 to i64
  %extent.i15.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %28, i64 %indvars.iv.i10.i, i32 1
  %118 = load i32, i32* %extent.i15.i, align 4, !tbaa !73
  %sub.i16.i = add nsw i32 %118, -1
  %conv7.i17.i = sext i32 %sub.i16.i to i64
  %mul.i18.i = mul nsw i64 %conv7.i17.i, %conv.i14.i
  %add.i19.i = add nsw i64 %mul.i18.i, %index.018.i.i
  br label %if.end.i24.i

if.end.i24.i:                                     ; preds = %if.then.i20.i, %for.body.i13.i
  %index.1.i21.i = phi i64 [ %add.i19.i, %if.then.i20.i ], [ %index.018.i.i, %for.body.i13.i ]
  %indvars.iv.next.i22.i = add nuw nsw i64 %indvars.iv.i10.i, 1
  %exitcond.not.i23.i = icmp eq i64 %indvars.iv.next.i22.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i23.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i13.i, !llvm.loop !191

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %if.end.i24.i
  %add8.i.i = add nsw i64 %index.1.i.i, 1
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, %for.body64
  %add8.i27.i = phi i64 [ 1, %for.body64 ], [ %add8.i.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %index.0.lcssa.i9.i = phi i64 [ 0, %for.body64 ], [ %index.1.i21.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %sub.i = sub nsw i64 %add8.i27.i, %index.0.lcssa.i9.i
  %bits.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %26, i64 0, i32 4, i32 1
  %119 = load i8, i8* %bits.i.i, align 1, !tbaa !28
  %conv.i.i = zext i8 %119 to i64
  %add.i4.i = add nuw nsw i64 %conv.i.i, 7
  %div.i.i = lshr i64 %add.i4.i, 3
  %mul.i = mul i64 %div.i.i, %sub.i
  %add = add i64 %mul.i, %added_size.0219
  %indvars.iv.next239 = add nuw nsw i64 %indvars.iv238, 1
  %exitcond241.not = icmp eq i64 %indvars.iv.next239, %wide.trip.count240
  br i1 %exitcond241.not, label %for.cond.cleanup63, label %for.body64, !llvm.loop !192

if.then76:                                        ; preds = %for.cond.cleanup63
  %120 = bitcast i8* %call74 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  %conv77 = sext i32 %size to i64
  %call79 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %120, i8* %cache_key, i64 %conv77, i32 %2, %struct.halide_buffer_t* %computed_bounds, i32 %tuple_count, %struct.halide_buffer_t** nonnull %tuple_buffers, i1 zeroext %has_eviction_key, i64 %eviction_key) #17
  br i1 %call79, label %if.end101, label %if.then83

if.then83:                                        ; preds = %if.then76, %for.cond.cleanup63
  %121 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  %sub = sub i64 %121, %added_size.0.lcssa
  store i64 %sub, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !59
  br i1 %cmp62218, label %for.body88.preheader, label %for.cond.cleanup87

for.body88.preheader:                             ; preds = %if.then83
  %wide.trip.count = zext i32 %tuple_count to i64
  br label %for.body88

for.cond.cleanup87:                               ; preds = %for.body88, %if.then83
  br i1 %tobool75.not, label %cleanup132, label %if.then99

for.body88:                                       ; preds = %for.body88, %for.body88.preheader
  %indvars.iv = phi i64 [ 0, %for.body88.preheader ], [ %indvars.iv.next, %for.body88 ]
  %arrayidx90 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv
  %122 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx90, align 8, !tbaa !12
  %host91 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %122, i64 0, i32 2
  %123 = load i8*, i8** %host91, align 8, !tbaa !67
  %call92 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %123) #17
  %entry93 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call92, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %entry93, align 8, !tbaa !182
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup87, label %for.body88, !llvm.loop !193

if.then99:                                        ; preds = %for.cond.cleanup87
  tail call void @halide_free(i8* %user_context, i8* nonnull %call74) #16
  br label %cleanup132

if.end101:                                        ; preds = %if.then76
  %124 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %arrayidx7, align 8, !tbaa !12
  %next104 = bitcast i8* %call74 to %"struct.Halide::Runtime::Internal::CacheEntry"**
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %124, %"struct.Halide::Runtime::Internal::CacheEntry"** %next104, align 8, !tbaa !122
  %125 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  %less_recent = getelementptr inbounds i8, i8* %call74, i64 16
  %126 = bitcast i8* %less_recent to %"struct.Halide::Runtime::Internal::CacheEntry"**
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %125, %"struct.Halide::Runtime::Internal::CacheEntry"** %126, align 8, !tbaa !147
  %cmp105.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %125, null
  br i1 %cmp105.not, label %if.end107, label %if.then106

if.then106:                                       ; preds = %if.end101
  %more_recent = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %125, i64 0, i32 1
  %127 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent to i8**
  store i8* %call74, i8** %127, align 8, !tbaa !164
  br label %if.end107

if.end107:                                        ; preds = %if.then106, %if.end101
  store i8* %call74, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE to i8**), align 8, !tbaa !12
  %128 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %cmp108 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %128, null
  br i1 %cmp108, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.end107
  store i8* %call74, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE to i8**), align 8, !tbaa !12
  br label %if.end110

if.end110:                                        ; preds = %if.then109, %if.end107
  %129 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %arrayidx7 to i8**
  store i8* %call74, i8** %129, align 8, !tbaa !12
  %in_use_count = getelementptr inbounds i8, i8* %call74, i64 52
  %130 = bitcast i8* %in_use_count to i32*
  store i32 %tuple_count, i32* %130, align 4, !tbaa !150
  br i1 %cmp62218, label %for.body117.preheader, label %cleanup132

for.body117.preheader:                            ; preds = %if.end110
  %wide.trip.count236 = zext i32 %tuple_count to i64
  br label %for.body117

for.body117:                                      ; preds = %for.body117, %for.body117.preheader
  %indvars.iv234 = phi i64 [ 0, %for.body117.preheader ], [ %indvars.iv.next235, %for.body117 ]
  %arrayidx119 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %tuple_buffers, i64 %indvars.iv234
  %131 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %arrayidx119, align 8, !tbaa !12
  %host120 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %131, i64 0, i32 2
  %132 = load i8*, i8** %host120, align 8, !tbaa !67
  %call121 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %132) #17
  %133 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call121 to i8**
  store i8* %call74, i8** %133, align 8, !tbaa !182
  %indvars.iv.next235 = add nuw nsw i64 %indvars.iv234, 1
  %exitcond237.not = icmp eq i64 %indvars.iv.next235, %wide.trip.count236
  br i1 %exitcond237.not, label %cleanup132, label %for.body117, !llvm.loop !194

cleanup132:                                       ; preds = %land.lhs.true18, %for.body48.us, %for.body117, %if.end110, %if.then99, %for.cond.cleanup87
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret i32 0
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_release(i8* %user_context, i8* %host) local_unnamed_addr #4 {
entry:
  %call = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %host) #17
  %entry2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call, i64 0, i32 0
  %0 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %entry2, align 8, !tbaa !182
  %cmp = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %call to i8*
  tail call void @halide_free(i8* %user_context, i8* %1) #16
  br label %if.end6

if.else:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  %in_use_count = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 7
  %2 = load i32, i32* %in_use_count, align 4, !tbaa !150
  %cmp3.not = icmp eq i32 %2, 0
  br i1 %cmp3.not, label %if.then4, label %do.end

if.then4:                                         ; preds = %if.else
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([151 x i8], [151 x i8]* @.str.12.47, i64 0, i64 0)) #16
  tail call void @abort() #16
  %.pre = load i32, i32* %in_use_count, align 4, !tbaa !150
  br label %do.end

do.end:                                           ; preds = %if.then4, %if.else
  %3 = phi i32 [ %.pre, %if.then4 ], [ %2, %if.else ]
  %dec = add i32 %3, -1
  store i32 %dec, i32* %in_use_count, align 4, !tbaa !150
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  br label %if.end6

if.end6:                                          ; preds = %do.end, %if.then
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_evict(i8* %user_context, i64 %eviction_key) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  br label %for.body

for.cond.cleanup:                                 ; preds = %if.end25
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret void

for.body:                                         ; preds = %if.end25, %entry
  %__begin1.059 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ getelementptr inbounds ([256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 0), %entry ], [ %incdec.ptr, %if.end25 ]
  %0 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %__begin1.059, align 8, !tbaa !12
  %cmp2.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %0, null
  br i1 %cmp2.not, label %if.end25, label %while.body

while.body:                                       ; preds = %for.body, %if.end24
  %prev.058 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ %prev.1, %if.end24 ], [ %__begin1.059, %for.body ]
  %entry1.056 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %1, %if.end24 ], [ %0, %for.body ]
  %next4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.056, i64 0, i32 0
  %1 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %next4, align 8, !tbaa !122
  %has_eviction_key = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.056, i64 0, i32 13
  %2 = load i8, i8* %has_eviction_key, align 8, !tbaa !157, !range !21
  %tobool.not = icmp eq i8 %2, 0
  br i1 %tobool.not, label %if.end24, label %land.lhs.true

land.lhs.true:                                    ; preds = %while.body
  %eviction_key5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.056, i64 0, i32 12
  %3 = load i64, i64* %eviction_key5, align 8, !tbaa !158
  %cmp6 = icmp eq i64 %3, %eviction_key
  br i1 %cmp6, label %if.then7, label %if.end24

if.then7:                                         ; preds = %land.lhs.true
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %1, %"struct.Halide::Runtime::Internal::CacheEntry"** %prev.058, align 8, !tbaa !12
  %more_recent = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.056, i64 0, i32 1
  %4 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent, align 8, !tbaa !164
  %cmp8.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %4, null
  %less_recent12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.056, i64 0, i32 2
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent12, align 8, !tbaa !147
  br i1 %cmp8.not, label %if.else, label %if.then9

if.then9:                                         ; preds = %if.then7
  %less_recent11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %4, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %5, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent11, align 8, !tbaa !147
  %.pre = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %less_recent12, align 8, !tbaa !147
  br label %if.end

if.else:                                          ; preds = %if.then7
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %5, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then9
  %6 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %5, %if.else ], [ %.pre, %if.then9 ]
  %cmp14.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %6, null
  %more_recent18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %6, i64 0, i32 1
  %_ZN6Halide7Runtime8Internal19least_recently_usedE.sink = select i1 %cmp14.not, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, %"struct.Halide::Runtime::Internal::CacheEntry"** %more_recent18
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %4, %"struct.Halide::Runtime::Internal::CacheEntry"** %_ZN6Halide7Runtime8Internal19least_recently_usedE.sink, align 8, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %entry1.056) #17
  %7 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %entry1.056 to i8*
  tail call void @halide_free(i8* %user_context, i8* nonnull %7) #16
  br label %if.end24

if.end24:                                         ; preds = %if.end, %land.lhs.true, %while.body
  %prev.1 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ %prev.058, %if.end ], [ %next4, %land.lhs.true ], [ %next4, %while.body ]
  %cmp3.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %1, null
  br i1 %cmp3.not, label %if.end25, label %while.body, !llvm.loop !195

if.end25:                                         ; preds = %if.end24, %for.body
  %incdec.ptr = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %__begin1.059, i64 1
  %cmp.not = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"** %incdec.ptr, getelementptr inbounds ([256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 1, i64 0)
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body
}

; Function Attrs: nounwind
define weak i8* @halide_string_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #4 {
entry:
  %cmp.not = icmp ult i8* %dst, %end
  br i1 %cmp.not, label %if.end, label %return

if.end:                                           ; preds = %entry
  %tobool.not = icmp eq i8* %arg, null
  %spec.select = select i1 %tobool.not, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.50, i64 0, i64 0), i8* %arg
  br label %if.end5

if.then4:                                         ; preds = %if.end8
  store i8 0, i8* %dst.addr.023, align 1, !tbaa !38
  br label %return

if.end5:                                          ; preds = %if.end8, %if.end
  %arg.addr.124 = phi i8* [ %spec.select, %if.end ], [ %incdec.ptr9, %if.end8 ]
  %dst.addr.023 = phi i8* [ %dst, %if.end ], [ %incdec.ptr, %if.end8 ]
  %0 = load i8, i8* %arg.addr.124, align 1, !tbaa !38
  store i8 %0, i8* %dst.addr.023, align 1, !tbaa !38
  %cmp6 = icmp eq i8 %0, 0
  br i1 %cmp6, label %return, label %if.end8

if.end8:                                          ; preds = %if.end5
  %incdec.ptr = getelementptr inbounds i8, i8* %dst.addr.023, i64 1
  %incdec.ptr9 = getelementptr inbounds i8, i8* %arg.addr.124, i64 1
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
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #11
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 31
  store i8 0, i8* %arrayidx, align 1, !tbaa !38
  %add.ptr = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 30
  %cmp13 = icmp sgt i32 %min_digits, 0
  %tobool14 = icmp ne i64 %arg, 0
  %1 = or i1 %tobool14, %cmp13
  br i1 %1, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %digits.0.lcssa = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.body ]
  %incdec.ptr1 = getelementptr inbounds i8, i8* %digits.0.lcssa, i64 1
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #17
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #11
  ret i8* %call

for.body:                                         ; preds = %entry, %for.body
  %arg.addr.017 = phi i64 [ %div, %for.body ], [ %arg, %entry ]
  %digits.016 = phi i8* [ %incdec.ptr, %for.body ], [ %add.ptr, %entry ]
  %i.015 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %div = udiv i64 %arg.addr.017, 10
  %mul.neg = mul i64 %div, -10
  %sub = add i64 %mul.neg, %arg.addr.017
  %2 = trunc i64 %sub to i8
  %conv = add i8 %2, 48
  store i8 %conv, i8* %digits.016, align 1, !tbaa !38
  %incdec.ptr = getelementptr inbounds i8, i8* %digits.016, i64 -1
  %inc = add nuw nsw i32 %i.015, 1
  %cmp = icmp slt i32 %inc, %min_digits
  %3 = icmp ugt i64 %arg.addr.017, 9
  %4 = or i1 %3, %cmp
  br i1 %4, label %for.body, label %for.cond.cleanup, !llvm.loop !196
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_int64_to_string(i8* %dst, i8* %end, i64 %arg, i32 %min_digits) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i64 %arg, 0
  %cmp1 = icmp ult i8* %dst, %end
  %or.cond = and i1 %cmp1, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %incdec.ptr = getelementptr inbounds i8, i8* %dst, i64 1
  store i8 45, i8* %dst, align 1, !tbaa !38
  %sub = sub nsw i64 0, %arg
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arg.addr.0 = phi i64 [ %sub, %if.then ], [ %arg, %entry ]
  %dst.addr.0 = phi i8* [ %incdec.ptr, %if.then ], [ %dst, %entry ]
  %call = tail call i8* @halide_uint64_to_string(i8* %dst.addr.0, i8* %end, i64 %arg.addr.0, i32 %min_digits) #17
  ret i8* %call
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_double_to_string(i8* %dst, i8* %end, double %arg, i32 %scientific) local_unnamed_addr #0 {
entry:
  %arg.addr = alloca double, align 8
  %bits = alloca i64, align 8
  %buf = alloca [512 x i8], align 1
  store double %arg, double* %arg.addr, align 8, !tbaa !57
  %0 = bitcast i64* %bits to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #11
  store i64 0, i64* %bits, align 8, !tbaa !59
  %1 = bitcast double* %arg.addr to i8*
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %1, i64 8) #16
  %2 = load i64, i64* %bits, align 8, !tbaa !59
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
  %call7 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.57, i64 0, i64 0)) #17
  br label %cleanup147

if.else:                                          ; preds = %if.then4
  %call8 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2.58, i64 0, i64 0)) #17
  br label %cleanup147

if.else9:                                         ; preds = %if.then
  br i1 %tobool10.not, label %if.else13, label %if.then11

if.then11:                                        ; preds = %if.else9
  %call12 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.59, i64 0, i64 0)) #17
  br label %cleanup147

if.else13:                                        ; preds = %if.else9
  %call14 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4.60, i64 0, i64 0)) #17
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
  %call23 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5.61, i64 0, i64 0)) #17
  br label %cleanup147

if.else24:                                        ; preds = %if.then20
  %call25 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6.62, i64 0, i64 0)) #17
  br label %cleanup147

if.else26:                                        ; preds = %if.then18
  br i1 %tobool27.not, label %if.else30, label %if.then28

if.then28:                                        ; preds = %if.else26
  %call29 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7.63, i64 0, i64 0)) #17
  br label %cleanup147

if.else30:                                        ; preds = %if.else26
  %call31 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8.64, i64 0, i64 0)) #17
  br label %cleanup147

if.end32:                                         ; preds = %if.else15
  %tobool33.not = icmp sgt i64 %2, -1
  br i1 %tobool33.not, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.end32
  %call35 = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9.65, i64 0, i64 0)) #17
  %4 = load double, double* %arg.addr, align 8, !tbaa !57
  %fneg = fneg double %4
  store double %fneg, double* %arg.addr, align 8, !tbaa !57
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.end32
  %dst.addr.0 = phi i8* [ %call35, %if.then34 ], [ %dst, %if.end32 ]
  %tobool37.not = icmp eq i32 %scientific, 0
  br i1 %tobool37.not, label %if.else61, label %while.condthread-pre-split

while.condthread-pre-split:                       ; preds = %if.end36
  %.pr = load double, double* %arg.addr, align 8, !tbaa !57
  %cmp39276 = fcmp olt double %.pr, 1.000000e+00
  br i1 %cmp39276, label %while.body, label %while.cond40thread-pre-split

while.body:                                       ; preds = %while.condthread-pre-split, %while.body
  %exponent_base_10.0277 = phi i32 [ %dec, %while.body ], [ 0, %while.condthread-pre-split ]
  %5 = phi double [ %mul, %while.body ], [ %.pr, %while.condthread-pre-split ]
  %mul = fmul double %5, 1.000000e+01
  %dec = add nsw i32 %exponent_base_10.0277, -1
  %cmp39 = fcmp olt double %mul, 1.000000e+00
  br i1 %cmp39, label %while.body, label %while.cond.while.cond40thread-pre-split_crit_edge, !llvm.loop !197

while.cond.while.cond40thread-pre-split_crit_edge: ; preds = %while.body
  store double %mul, double* %arg.addr, align 8, !tbaa !57
  br label %while.cond40thread-pre-split

while.cond40thread-pre-split:                     ; preds = %while.cond.while.cond40thread-pre-split_crit_edge, %while.condthread-pre-split
  %.pr261 = phi double [ %mul, %while.cond.while.cond40thread-pre-split_crit_edge ], [ %.pr, %while.condthread-pre-split ]
  %exponent_base_10.0.lcssa = phi i32 [ %dec, %while.cond.while.cond40thread-pre-split_crit_edge ], [ 0, %while.condthread-pre-split ]
  %cmp41272 = fcmp ult double %.pr261, 1.000000e+01
  br i1 %cmp41272, label %while.end43, label %while.body42

while.body42:                                     ; preds = %while.cond40thread-pre-split, %while.body42
  %exponent_base_10.1273 = phi i32 [ %inc, %while.body42 ], [ %exponent_base_10.0.lcssa, %while.cond40thread-pre-split ]
  %6 = phi double [ %div, %while.body42 ], [ %.pr261, %while.cond40thread-pre-split ]
  %div = fdiv double %6, 1.000000e+01
  %inc = add nsw i32 %exponent_base_10.1273, 1
  %cmp41 = fcmp ult double %div, 1.000000e+01
  br i1 %cmp41, label %while.cond40.while.end43_crit_edge, label %while.body42, !llvm.loop !198

while.cond40.while.end43_crit_edge:               ; preds = %while.body42
  store double %div, double* %arg.addr, align 8, !tbaa !57
  br label %while.end43

while.end43:                                      ; preds = %while.cond40.while.end43_crit_edge, %while.cond40thread-pre-split
  %.lcssa = phi double [ %div, %while.cond40.while.end43_crit_edge ], [ %.pr261, %while.cond40thread-pre-split ]
  %exponent_base_10.1.lcssa = phi i32 [ %inc, %while.cond40.while.end43_crit_edge ], [ %exponent_base_10.0.lcssa, %while.cond40thread-pre-split ]
  %mul44 = fmul double %.lcssa, 1.000000e+06
  %add = fadd double %mul44, 5.000000e-01
  %conv45 = fptoui double %add to i64
  %div46 = udiv i64 %conv45, 1000000
  %mul47.neg = mul i64 %div46, -1000000
  %sub48 = add i64 %mul47.neg, %conv45
  %call49 = call i8* @halide_int64_to_string(i8* %dst.addr.0, i8* %end, i64 %div46, i32 1) #17
  %call50 = call i8* @halide_string_to_string(i8* %call49, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.141, i64 0, i64 0)) #17
  %call51 = call i8* @halide_int64_to_string(i8* %call50, i8* %end, i64 %sub48, i32 6) #17
  %cmp52 = icmp sgt i32 %exponent_base_10.1.lcssa, -1
  br i1 %cmp52, label %if.then53, label %if.else55

if.then53:                                        ; preds = %while.end43
  %call54 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.67, i64 0, i64 0)) #17
  br label %if.end58

if.else55:                                        ; preds = %while.end43
  %call56 = call i8* @halide_string_to_string(i8* %call51, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12.68, i64 0, i64 0)) #17
  %sub57 = sub nsw i32 0, %exponent_base_10.1.lcssa
  br label %if.end58

if.end58:                                         ; preds = %if.else55, %if.then53
  %exponent_base_10.2 = phi i32 [ %exponent_base_10.1.lcssa, %if.then53 ], [ %sub57, %if.else55 ]
  %dst.addr.1 = phi i8* [ %call54, %if.then53 ], [ %call56, %if.else55 ]
  %conv59262 = zext i32 %exponent_base_10.2 to i64
  %call60 = call i8* @halide_int64_to_string(i8* %dst.addr.1, i8* %end, i64 %conv59262, i32 2) #17
  br label %cleanup147

if.else61:                                        ; preds = %if.end36
  br i1 %cmp16, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.else61
  %call64 = call i8* @halide_double_to_string(i8* %dst.addr.0, i8* %end, double 0.000000e+00, i32 0) #17
  br label %cleanup147

if.end65:                                         ; preds = %if.else61
  %add67 = or i64 %and, 4503599627370496
  %sub69 = add nsw i32 %conv, -1075
  %cmp70 = icmp ult i32 %conv, 1075
  br i1 %cmp70, label %if.then71, label %if.end104

if.then71:                                        ; preds = %if.end65
  %cmp72 = icmp ult i32 %conv, 1023
  %sub76 = sub nuw nsw i32 1075, %conv
  %sh_prom = zext i32 %sub76 to i64
  %shr77 = lshr i64 %add67, %sh_prom
  %shl80 = shl i64 %shr77, %sh_prom
  %integer_part.0 = select i1 %cmp72, i64 0, i64 %shr77
  %sub81 = select i1 %cmp72, i64 0, i64 %shl80
  %f.0.in = sub i64 %add67, %sub81
  %f.0 = uitofp i64 %f.0.in to double
  %conv84258 = zext i32 %sub69 to i64
  %shl85 = shl i64 %conv84258, 52
  %add87 = add i64 %shl85, 4696837146684686336
  %7 = bitcast i64 %add87 to double
  %mul89 = fmul double %7, %f.0
  %add90 = fadd double %mul89, 5.000000e-01
  %conv91 = fptoui double %add90 to i64
  %conv92 = uitofp i64 %conv91 to double
  %cmp93 = fcmp oeq double %add90, %conv92
  %and95 = and i64 %conv91, 1
  %tobool96.not = icmp ne i64 %and95, 0
  %not.or.cond259 = and i1 %cmp93, %tobool96.not
  %dec98 = sext i1 %not.or.cond259 to i64
  %fractional_part.0 = add i64 %dec98, %conv91
  %cmp100 = icmp eq i64 %fractional_part.0, 1000000
  %inc102 = zext i1 %cmp100 to i64
  %spec.select = add nuw i64 %integer_part.0, %inc102
  %spec.select260 = select i1 %cmp100, i64 0, i64 %fractional_part.0
  br label %if.end104

if.end104:                                        ; preds = %if.then71, %if.end65
  %integer_part.2 = phi i64 [ %spec.select, %if.then71 ], [ %add67, %if.end65 ]
  %integer_exponent.0 = phi i32 [ 0, %if.then71 ], [ %sub69, %if.end65 ]
  %fractional_part.2 = phi i64 [ %spec.select260, %if.then71 ], [ 0, %if.end65 ]
  %8 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %8) #11
  %add.ptr = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 512
  %add.ptr105 = getelementptr inbounds [512 x i8], [512 x i8]* %buf, i64 0, i64 480
  %call108 = call i8* @halide_int64_to_string(i8* nonnull %add.ptr105, i8* nonnull %add.ptr, i64 %integer_part.2, i32 1) #17
  %cmp109267 = icmp sgt i32 %integer_exponent.0, 0
  br i1 %cmp109267, label %for.cond111.preheader.preheader, label %for.cond.cleanup

for.cond111.preheader.preheader:                  ; preds = %if.end104
  %xtraiter = and i32 %integer_exponent.0, 1
  %9 = icmp eq i32 %integer_exponent.0, 1
  br i1 %9, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.cond111.preheader.preheader.new

for.cond111.preheader.preheader.new:              ; preds = %for.cond111.preheader.preheader
  %unroll_iter = and i32 %integer_exponent.0, -2
  br label %for.cond111.preheader

for.cond111.preheader:                            ; preds = %if.end137.1, %for.cond111.preheader.preheader.new
  %int_part_ptr.0268 = phi i8* [ %add.ptr105, %for.cond111.preheader.preheader.new ], [ %int_part_ptr.1.1, %if.end137.1 ]
  %niter = phi i32 [ %unroll_iter, %for.cond111.preheader.preheader.new ], [ %niter.nsub.1, %if.end137.1 ]
  %cmp113.not264 = icmp eq i8* %call108, %int_part_ptr.0268
  br i1 %cmp113.not264, label %if.end137, label %for.body115

for.cond.cleanup.loopexit.unr-lcssa:              ; preds = %if.end137.1, %for.cond111.preheader.preheader
  %int_part_ptr.1.lcssa.ph = phi i8* [ undef, %for.cond111.preheader.preheader ], [ %int_part_ptr.1.1, %if.end137.1 ]
  %int_part_ptr.0268.unr = phi i8* [ %add.ptr105, %for.cond111.preheader.preheader ], [ %int_part_ptr.1.1, %if.end137.1 ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond.cleanup, label %for.cond111.preheader.epil

for.cond111.preheader.epil:                       ; preds = %for.cond.cleanup.loopexit.unr-lcssa
  %cmp113.not264.epil = icmp eq i8* %call108, %int_part_ptr.0268.unr
  br i1 %cmp113.not264.epil, label %for.cond.cleanup, label %for.body115.epil

for.body115.epil:                                 ; preds = %for.cond111.preheader.epil, %for.body115.epil
  %p.0266.pn.epil = phi i8* [ %p.0266.epil, %for.body115.epil ], [ %call108, %for.cond111.preheader.epil ]
  %carry.0265.epil = phi i32 [ %carry.1.epil, %for.body115.epil ], [ 0, %for.cond111.preheader.epil ]
  %p.0266.epil = getelementptr inbounds i8, i8* %p.0266.pn.epil, i64 -1
  %10 = load i8, i8* %p.0266.epil, align 1, !tbaa !38
  %sub117.epil = add i8 %10, -48
  %conv119.epil = sext i8 %sub117.epil to i32
  %mul120.epil = shl nsw i32 %conv119.epil, 1
  %add121.epil = or i32 %mul120.epil, %carry.0265.epil
  %11 = trunc i32 %add121.epil to i8
  %cmp124.epil = icmp sgt i8 %11, 9
  %sub127.epil = add nsw i32 %add121.epil, 246
  %carry.1.epil = zext i1 %cmp124.epil to i32
  %new_digit.0.in.epil = select i1 %cmp124.epil, i32 %sub127.epil, i32 %add121.epil
  %12 = trunc i32 %new_digit.0.in.epil to i8
  %conv133.epil = add i8 %12, 48
  store i8 %conv133.epil, i8* %p.0266.epil, align 1, !tbaa !38
  %cmp113.not.epil = icmp eq i8* %p.0266.epil, %int_part_ptr.0268.unr
  br i1 %cmp113.not.epil, label %for.cond.cleanup114.epil, label %for.body115.epil, !llvm.loop !199

for.cond.cleanup114.epil:                         ; preds = %for.body115.epil
  br i1 %cmp124.epil, label %if.then135.epil, label %for.cond.cleanup

if.then135.epil:                                  ; preds = %for.cond.cleanup114.epil
  %incdec.ptr136.epil = getelementptr inbounds i8, i8* %int_part_ptr.0268.unr, i64 -1
  store i8 49, i8* %incdec.ptr136.epil, align 1, !tbaa !38
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit.unr-lcssa, %for.cond111.preheader.epil, %for.cond.cleanup114.epil, %if.then135.epil, %if.end104
  %int_part_ptr.0.lcssa = phi i8* [ %add.ptr105, %if.end104 ], [ %int_part_ptr.1.lcssa.ph, %for.cond.cleanup.loopexit.unr-lcssa ], [ %incdec.ptr136.epil, %if.then135.epil ], [ %int_part_ptr.0268.unr, %for.cond.cleanup114.epil ], [ %call108, %for.cond111.preheader.epil ]
  %call141 = call i8* @halide_string_to_string(i8* %dst.addr.0, i8* %end, i8* %int_part_ptr.0.lcssa) #17
  %call142 = call i8* @halide_string_to_string(i8* %call141, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.141, i64 0, i64 0)) #17
  %call143 = call i8* @halide_int64_to_string(i8* %call142, i8* %end, i64 %fractional_part.2, i32 6) #17
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %8) #11
  br label %cleanup147

for.cond.cleanup114:                              ; preds = %for.body115
  br i1 %cmp124, label %if.then135, label %if.end137

for.body115:                                      ; preds = %for.cond111.preheader, %for.body115
  %p.0266.pn = phi i8* [ %p.0266, %for.body115 ], [ %call108, %for.cond111.preheader ]
  %carry.0265 = phi i32 [ %carry.1, %for.body115 ], [ 0, %for.cond111.preheader ]
  %p.0266 = getelementptr inbounds i8, i8* %p.0266.pn, i64 -1
  %13 = load i8, i8* %p.0266, align 1, !tbaa !38
  %sub117 = add i8 %13, -48
  %conv119 = sext i8 %sub117 to i32
  %mul120 = shl nsw i32 %conv119, 1
  %add121 = or i32 %mul120, %carry.0265
  %14 = trunc i32 %add121 to i8
  %cmp124 = icmp sgt i8 %14, 9
  %sub127 = add nsw i32 %add121, 246
  %carry.1 = zext i1 %cmp124 to i32
  %new_digit.0.in = select i1 %cmp124, i32 %sub127, i32 %add121
  %15 = trunc i32 %new_digit.0.in to i8
  %conv133 = add i8 %15, 48
  store i8 %conv133, i8* %p.0266, align 1, !tbaa !38
  %cmp113.not = icmp eq i8* %p.0266, %int_part_ptr.0268
  br i1 %cmp113.not, label %for.cond.cleanup114, label %for.body115, !llvm.loop !199

if.then135:                                       ; preds = %for.cond.cleanup114
  %incdec.ptr136 = getelementptr inbounds i8, i8* %int_part_ptr.0268, i64 -1
  store i8 49, i8* %incdec.ptr136, align 1, !tbaa !38
  br label %if.end137

if.end137:                                        ; preds = %if.then135, %for.cond.cleanup114, %for.cond111.preheader
  %int_part_ptr.1 = phi i8* [ %incdec.ptr136, %if.then135 ], [ %int_part_ptr.0268, %for.cond.cleanup114 ], [ %call108, %for.cond111.preheader ]
  %cmp113.not264.1 = icmp eq i8* %call108, %int_part_ptr.1
  br i1 %cmp113.not264.1, label %if.end137.1, label %for.body115.1

cleanup147:                                       ; preds = %for.cond.cleanup, %if.then63, %if.end58, %if.else30, %if.then28, %if.else24, %if.then22, %if.else13, %if.then11, %if.else, %if.then6
  %retval.1 = phi i8* [ %call7, %if.then6 ], [ %call8, %if.else ], [ %call12, %if.then11 ], [ %call14, %if.else13 ], [ %call23, %if.then22 ], [ %call25, %if.else24 ], [ %call29, %if.then28 ], [ %call31, %if.else30 ], [ %call64, %if.then63 ], [ %call60, %if.end58 ], [ %call143, %for.cond.cleanup ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #11
  ret i8* %retval.1

for.body115.1:                                    ; preds = %if.end137, %for.body115.1
  %p.0266.pn.1 = phi i8* [ %p.0266.1, %for.body115.1 ], [ %call108, %if.end137 ]
  %carry.0265.1 = phi i32 [ %carry.1.1, %for.body115.1 ], [ 0, %if.end137 ]
  %p.0266.1 = getelementptr inbounds i8, i8* %p.0266.pn.1, i64 -1
  %16 = load i8, i8* %p.0266.1, align 1, !tbaa !38
  %sub117.1 = add i8 %16, -48
  %conv119.1 = sext i8 %sub117.1 to i32
  %mul120.1 = shl nsw i32 %conv119.1, 1
  %add121.1 = or i32 %mul120.1, %carry.0265.1
  %17 = trunc i32 %add121.1 to i8
  %cmp124.1 = icmp sgt i8 %17, 9
  %sub127.1 = add nsw i32 %add121.1, 246
  %carry.1.1 = zext i1 %cmp124.1 to i32
  %new_digit.0.in.1 = select i1 %cmp124.1, i32 %sub127.1, i32 %add121.1
  %18 = trunc i32 %new_digit.0.in.1 to i8
  %conv133.1 = add i8 %18, 48
  store i8 %conv133.1, i8* %p.0266.1, align 1, !tbaa !38
  %cmp113.not.1 = icmp eq i8* %p.0266.1, %int_part_ptr.1
  br i1 %cmp113.not.1, label %for.cond.cleanup114.1, label %for.body115.1, !llvm.loop !199

for.cond.cleanup114.1:                            ; preds = %for.body115.1
  br i1 %cmp124.1, label %if.then135.1, label %if.end137.1

if.then135.1:                                     ; preds = %for.cond.cleanup114.1
  %incdec.ptr136.1 = getelementptr inbounds i8, i8* %int_part_ptr.1, i64 -1
  store i8 49, i8* %incdec.ptr136.1, align 1, !tbaa !38
  br label %if.end137.1

if.end137.1:                                      ; preds = %if.then135.1, %for.cond.cleanup114.1, %if.end137
  %int_part_ptr.1.1 = phi i8* [ %incdec.ptr136.1, %if.then135.1 ], [ %int_part_ptr.1, %for.cond.cleanup114.1 ], [ %call108, %if.end137 ]
  %niter.nsub.1 = add i32 %niter, -2
  %niter.ncmp.1 = icmp eq i32 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.cond111.preheader, !llvm.loop !200
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_pointer_to_string(i8* %dst, i8* %end, i8* %arg) local_unnamed_addr #0 {
entry:
  %buf = alloca [20 x i8], align 1
  %0 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %0) #11
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(20) %0, i8 0, i64 20, i1 false)
  %add.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 18
  %1 = ptrtoint i8* %arg to i64
  %and = and i64 %1, 15
  %arrayidx = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !38
  %incdec.ptr = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 17
  store i8 %2, i8* %add.ptr, align 1, !tbaa !38
  %shr = lshr i64 %1, 4
  %tobool.not = icmp eq i64 %shr, 0
  br i1 %tobool.not, label %cleanup, label %for.cond

for.cond:                                         ; preds = %entry
  %and.1 = and i64 %shr, 15
  %arrayidx.1 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.1
  %3 = load i8, i8* %arrayidx.1, align 1, !tbaa !38
  %incdec.ptr.1 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 16
  store i8 %3, i8* %incdec.ptr, align 1, !tbaa !38
  %shr.1 = lshr i64 %1, 8
  %tobool.not.1 = icmp eq i64 %shr.1, 0
  br i1 %tobool.not.1, label %cleanup, label %for.cond.1

cleanup:                                          ; preds = %for.cond.14, %for.cond.13, %for.cond.12, %for.cond.11, %for.cond.10, %for.cond.9, %for.cond.8, %for.cond.7, %for.cond.6, %for.cond.5, %for.cond.4, %for.cond.3, %for.cond.2, %for.cond.1, %for.cond, %entry
  %buf_ptr.016.lcssa = phi i8* [ %add.ptr, %entry ], [ %incdec.ptr, %for.cond ], [ %incdec.ptr.1, %for.cond.1 ], [ %incdec.ptr.2, %for.cond.2 ], [ %incdec.ptr.3, %for.cond.3 ], [ %incdec.ptr.4, %for.cond.4 ], [ %incdec.ptr.5, %for.cond.5 ], [ %incdec.ptr.6, %for.cond.6 ], [ %incdec.ptr.7, %for.cond.7 ], [ %incdec.ptr.8, %for.cond.8 ], [ %incdec.ptr.9, %for.cond.9 ], [ %incdec.ptr.10, %for.cond.10 ], [ %incdec.ptr.11, %for.cond.11 ], [ %incdec.ptr.12, %for.cond.12 ], [ %incdec.ptr.13, %for.cond.13 ], [ %incdec.ptr.14, %for.cond.14 ]
  %incdec.ptr.lcssa = phi i8* [ %incdec.ptr, %entry ], [ %incdec.ptr.1, %for.cond ], [ %incdec.ptr.2, %for.cond.1 ], [ %incdec.ptr.3, %for.cond.2 ], [ %incdec.ptr.4, %for.cond.3 ], [ %incdec.ptr.5, %for.cond.4 ], [ %incdec.ptr.6, %for.cond.5 ], [ %incdec.ptr.7, %for.cond.6 ], [ %incdec.ptr.8, %for.cond.7 ], [ %incdec.ptr.9, %for.cond.8 ], [ %incdec.ptr.10, %for.cond.9 ], [ %incdec.ptr.11, %for.cond.10 ], [ %incdec.ptr.12, %for.cond.11 ], [ %incdec.ptr.13, %for.cond.12 ], [ %incdec.ptr.14, %for.cond.13 ], [ %incdec.ptr.15, %for.cond.14 ]
  %incdec.ptr1 = getelementptr inbounds i8, i8* %buf_ptr.016.lcssa, i64 -2
  store i8 120, i8* %incdec.ptr.lcssa, align 1, !tbaa !38
  store i8 48, i8* %incdec.ptr1, align 1, !tbaa !38
  %call = call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %incdec.ptr1) #17
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %0) #11
  ret i8* %call

for.cond.1:                                       ; preds = %for.cond
  %and.2 = and i64 %shr.1, 15
  %arrayidx.2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.2
  %4 = load i8, i8* %arrayidx.2, align 1, !tbaa !38
  %incdec.ptr.2 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 15
  store i8 %4, i8* %incdec.ptr.1, align 1, !tbaa !38
  %shr.2 = lshr i64 %1, 12
  %tobool.not.2 = icmp eq i64 %shr.2, 0
  br i1 %tobool.not.2, label %cleanup, label %for.cond.2

for.cond.2:                                       ; preds = %for.cond.1
  %and.3 = and i64 %shr.2, 15
  %arrayidx.3 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.3
  %5 = load i8, i8* %arrayidx.3, align 1, !tbaa !38
  %incdec.ptr.3 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 14
  store i8 %5, i8* %incdec.ptr.2, align 1, !tbaa !38
  %shr.3 = lshr i64 %1, 16
  %tobool.not.3 = icmp eq i64 %shr.3, 0
  br i1 %tobool.not.3, label %cleanup, label %for.cond.3

for.cond.3:                                       ; preds = %for.cond.2
  %and.4 = and i64 %shr.3, 15
  %arrayidx.4 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.4
  %6 = load i8, i8* %arrayidx.4, align 1, !tbaa !38
  %incdec.ptr.4 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 13
  store i8 %6, i8* %incdec.ptr.3, align 1, !tbaa !38
  %shr.4 = lshr i64 %1, 20
  %tobool.not.4 = icmp eq i64 %shr.4, 0
  br i1 %tobool.not.4, label %cleanup, label %for.cond.4

for.cond.4:                                       ; preds = %for.cond.3
  %and.5 = and i64 %shr.4, 15
  %arrayidx.5 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.5
  %7 = load i8, i8* %arrayidx.5, align 1, !tbaa !38
  %incdec.ptr.5 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 12
  store i8 %7, i8* %incdec.ptr.4, align 1, !tbaa !38
  %shr.5 = lshr i64 %1, 24
  %tobool.not.5 = icmp eq i64 %shr.5, 0
  br i1 %tobool.not.5, label %cleanup, label %for.cond.5

for.cond.5:                                       ; preds = %for.cond.4
  %and.6 = and i64 %shr.5, 15
  %arrayidx.6 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.6
  %8 = load i8, i8* %arrayidx.6, align 1, !tbaa !38
  %incdec.ptr.6 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 11
  store i8 %8, i8* %incdec.ptr.5, align 1, !tbaa !38
  %shr.6 = lshr i64 %1, 28
  %tobool.not.6 = icmp eq i64 %shr.6, 0
  br i1 %tobool.not.6, label %cleanup, label %for.cond.6

for.cond.6:                                       ; preds = %for.cond.5
  %and.7 = and i64 %shr.6, 15
  %arrayidx.7 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.7
  %9 = load i8, i8* %arrayidx.7, align 1, !tbaa !38
  %incdec.ptr.7 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 10
  store i8 %9, i8* %incdec.ptr.6, align 1, !tbaa !38
  %shr.7 = lshr i64 %1, 32
  %tobool.not.7 = icmp eq i64 %shr.7, 0
  br i1 %tobool.not.7, label %cleanup, label %for.cond.7

for.cond.7:                                       ; preds = %for.cond.6
  %and.8 = and i64 %shr.7, 15
  %arrayidx.8 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.8
  %10 = load i8, i8* %arrayidx.8, align 1, !tbaa !38
  %incdec.ptr.8 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 9
  store i8 %10, i8* %incdec.ptr.7, align 1, !tbaa !38
  %shr.8 = lshr i64 %1, 36
  %tobool.not.8 = icmp eq i64 %shr.8, 0
  br i1 %tobool.not.8, label %cleanup, label %for.cond.8

for.cond.8:                                       ; preds = %for.cond.7
  %and.9 = and i64 %shr.8, 15
  %arrayidx.9 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.9
  %11 = load i8, i8* %arrayidx.9, align 1, !tbaa !38
  %incdec.ptr.9 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 8
  store i8 %11, i8* %incdec.ptr.8, align 1, !tbaa !38
  %shr.9 = lshr i64 %1, 40
  %tobool.not.9 = icmp eq i64 %shr.9, 0
  br i1 %tobool.not.9, label %cleanup, label %for.cond.9

for.cond.9:                                       ; preds = %for.cond.8
  %and.10 = and i64 %shr.9, 15
  %arrayidx.10 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.10
  %12 = load i8, i8* %arrayidx.10, align 1, !tbaa !38
  %incdec.ptr.10 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 7
  store i8 %12, i8* %incdec.ptr.9, align 1, !tbaa !38
  %shr.10 = lshr i64 %1, 44
  %tobool.not.10 = icmp eq i64 %shr.10, 0
  br i1 %tobool.not.10, label %cleanup, label %for.cond.10

for.cond.10:                                      ; preds = %for.cond.9
  %and.11 = and i64 %shr.10, 15
  %arrayidx.11 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.11
  %13 = load i8, i8* %arrayidx.11, align 1, !tbaa !38
  %incdec.ptr.11 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 6
  store i8 %13, i8* %incdec.ptr.10, align 1, !tbaa !38
  %shr.11 = lshr i64 %1, 48
  %tobool.not.11 = icmp eq i64 %shr.11, 0
  br i1 %tobool.not.11, label %cleanup, label %for.cond.11

for.cond.11:                                      ; preds = %for.cond.10
  %and.12 = and i64 %shr.11, 15
  %arrayidx.12 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.12
  %14 = load i8, i8* %arrayidx.12, align 1, !tbaa !38
  %incdec.ptr.12 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 5
  store i8 %14, i8* %incdec.ptr.11, align 1, !tbaa !38
  %shr.12 = lshr i64 %1, 52
  %tobool.not.12 = icmp eq i64 %shr.12, 0
  br i1 %tobool.not.12, label %cleanup, label %for.cond.12

for.cond.12:                                      ; preds = %for.cond.11
  %and.13 = and i64 %shr.12, 15
  %arrayidx.13 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.13
  %15 = load i8, i8* %arrayidx.13, align 1, !tbaa !38
  %incdec.ptr.13 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 4
  store i8 %15, i8* %incdec.ptr.12, align 1, !tbaa !38
  %shr.13 = lshr i64 %1, 56
  %tobool.not.13 = icmp eq i64 %shr.13, 0
  br i1 %tobool.not.13, label %cleanup, label %for.cond.13

for.cond.13:                                      ; preds = %for.cond.12
  %and.14 = and i64 %shr.13, 15
  %arrayidx.14 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %and.14
  %16 = load i8, i8* %arrayidx.14, align 1, !tbaa !38
  %incdec.ptr.14 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 3
  store i8 %16, i8* %incdec.ptr.13, align 1, !tbaa !38
  %shr.14 = lshr i64 %1, 60
  %tobool.not.14 = icmp eq i64 %shr.14, 0
  br i1 %tobool.not.14, label %cleanup, label %for.cond.14

for.cond.14:                                      ; preds = %for.cond.13
  %arrayidx.15 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.13.71, i64 0, i64 %shr.14
  %17 = load i8, i8* %arrayidx.15, align 1, !tbaa !38
  %incdec.ptr.15 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 2
  store i8 %17, i8* %incdec.ptr.14, align 1, !tbaa !38
  br label %cleanup
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_type_to_string(i8* %dst, i8* %end, %struct.halide_type_t* %t) local_unnamed_addr #0 {
entry:
  %code = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i64 0, i32 0
  %0 = load i8, i8* %code, align 2, !tbaa !201
  %1 = icmp ult i8 %0, 4
  br i1 %1, label %switch.lookup, label %sw.epilog

switch.lookup:                                    ; preds = %entry
  %2 = sext i8 %0 to i64
  %switch.gep = getelementptr inbounds [4 x i8*], [4 x i8*]* @switch.table.halide_type_to_string, i64 0, i64 %2
  %switch.load = load i8*, i8** %switch.gep, align 8
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %switch.lookup
  %code_name.0 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18.72, i64 0, i64 0), %entry ]
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* nonnull %code_name.0) #17
  %bits = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i64 0, i32 1
  %3 = load i8, i8* %bits, align 1, !tbaa !28
  %conv4 = zext i8 %3 to i64
  %call5 = tail call i8* @halide_uint64_to_string(i8* %call, i8* %end, i64 %conv4, i32 1) #17
  %lanes = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %t, i64 0, i32 2
  %4 = load i16, i16* %lanes, align 2, !tbaa !202
  %cmp.not = icmp eq i16 %4, 1
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %sw.epilog
  %call7 = tail call i8* @halide_string_to_string(i8* %call5, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19.77, i64 0, i64 0)) #17
  %5 = load i16, i16* %lanes, align 2, !tbaa !202
  %conv9 = zext i16 %5 to i64
  %call10 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %conv9, i32 1) #17
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
  %call = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20.78, i64 0, i64 0)) #17
  br label %return

if.end:                                           ; preds = %entry
  %call1 = tail call i8* @halide_string_to_string(i8* %dst, i8* %end, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21.79, i64 0, i64 0)) #17
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !69
  %call2 = tail call i8* @halide_uint64_to_string(i8* %call1, i8* %end, i64 %0, i32 1) #17
  %call3 = tail call i8* @halide_string_to_string(i8* %call2, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %1 = bitcast %struct.halide_device_interface_t** %device_interface to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !203
  %call4 = tail call i8* @halide_pointer_to_string(i8* %call3, i8* %end, i8* %2) #17
  %call5 = tail call i8* @halide_string_to_string(i8* %call4, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 2
  %3 = load i8*, i8** %host, align 8, !tbaa !67
  %call6 = tail call i8* @halide_pointer_to_string(i8* %call5, i8* %end, i8* %3) #17
  %call7 = tail call i8* @halide_string_to_string(i8* %call6, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %flags = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %4 = load i64, i64* %flags, align 8, !tbaa !204
  %call8 = tail call i8* @halide_uint64_to_string(i8* %call7, i8* %end, i64 %4, i32 1) #17
  %call9 = tail call i8* @halide_string_to_string(i8* %call8, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %type = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 4
  %call10 = tail call i8* @halide_type_to_string(i8* %call9, i8* %end, %struct.halide_type_t* nonnull %type) #17
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 5
  %5 = load i32, i32* %dimensions, align 4, !tbaa !70
  %cmp1179 = icmp sgt i32 %5, 0
  br i1 %cmp1179, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %dim = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 6
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %dst.addr.0.lcssa = phi i8* [ %call10, %if.end ], [ %call26, %for.body ]
  %call27 = tail call i8* @halide_string_to_string(i8* %dst.addr.0.lcssa, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.119, i64 0, i64 0)) #17
  br label %return

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %dst.addr.080 = phi i8* [ %call10, %for.body.lr.ph ], [ %call26, %for.body ]
  %call12 = tail call i8* @halide_string_to_string(i8* %dst.addr.080, i8* %end, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23.82, i64 0, i64 0)) #17
  %6 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !71
  %min = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %6, i64 %indvars.iv, i32 0
  %7 = load i32, i32* %min, align 4, !tbaa !76
  %conv = sext i32 %7 to i64
  %call13 = tail call i8* @halide_int64_to_string(i8* %call12, i8* %end, i64 %conv, i32 1) #17
  %call14 = tail call i8* @halide_string_to_string(i8* %call13, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !71
  %extent = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %indvars.iv, i32 1
  %9 = load i32, i32* %extent, align 4, !tbaa !73
  %conv18 = sext i32 %9 to i64
  %call19 = tail call i8* @halide_int64_to_string(i8* %call14, i8* %end, i64 %conv18, i32 1) #17
  %call20 = tail call i8* @halide_string_to_string(i8* %call19, i8* %end, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %10 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim, align 8, !tbaa !71
  %stride = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %10, i64 %indvars.iv, i32 2
  %11 = load i32, i32* %stride, align 4, !tbaa !77
  %conv24 = sext i32 %11 to i64
  %call25 = tail call i8* @halide_int64_to_string(i8* %call20, i8* %end, i64 %conv24, i32 1) #17
  %call26 = tail call i8* @halide_string_to_string(i8* %call25, i8* %end, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.24.83, i64 0, i64 0)) #17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = load i32, i32* %dimensions, align 4, !tbaa !70
  %13 = sext i32 %12 to i64
  %cmp11 = icmp slt i64 %indvars.iv.next, %13
  br i1 %cmp11, label %for.body, label %for.cond.cleanup, !llvm.loop !205

return:                                           ; preds = %for.cond.cleanup, %if.then
  %retval.0 = phi i8* [ %call, %if.then ], [ %call27, %for.cond.cleanup ]
  ret i8* %retval.0
}

; Function Attrs: alwaysinline nounwind willreturn mustprogress
define weak i32 @halide_malloc_alignment() local_unnamed_addr #6 {
entry:
  ret i32 64
}

; Function Attrs: nounwind
define weak i32 @halide_reuse_device_allocations(i8* %user_context, i1 zeroext %flag) local_unnamed_addr #4 {
entry:
  %frombool = zext i1 %flag to i8
  store i8 %frombool, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !18
  br i1 %flag, label %if.end5, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  %p.014 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !12
  %cmp.not15 = icmp eq %struct.halide_device_allocation_pool* %p.014, null
  br i1 %cmp.not15, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.then
  %err.0.lcssa = phi i32 [ 0, %if.then ], [ %spec.select, %for.body ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  br label %if.end5

for.body:                                         ; preds = %if.then, %for.body
  %p.017 = phi %struct.halide_device_allocation_pool* [ %p.0, %for.body ], [ %p.014, %if.then ]
  %err.016 = phi i32 [ %spec.select, %for.body ], [ 0, %if.then ]
  %release_unused = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i64 0, i32 0
  %0 = load i32 (i8*)*, i32 (i8*)** %release_unused, align 8, !tbaa !206
  %call = tail call i32 %0(i8* %user_context) #16
  %tobool3.not = icmp eq i32 %call, 0
  %spec.select = select i1 %tobool3.not, i32 %err.016, i32 %call
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %p.017, i64 0, i32 1
  %p.0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** %next, align 8, !tbaa !12
  %cmp.not = icmp eq %struct.halide_device_allocation_pool* %p.0, null
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body, !llvm.loop !208

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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  %0 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !12
  %next = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %pool, i64 0, i32 1
  store %struct.halide_device_allocation_pool* %0, %struct.halide_device_allocation_pool** %next, align 8, !tbaa !209
  store %struct.halide_device_allocation_pool* %pool, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %0 = load i64, i64* %flags.i.i, align 8, !tbaa !204
  %and.i.i = and i64 %0, 2
  %cmp.i.i.not = icmp eq i64 %and.i.i, 0
  br i1 %cmp.i.i.not, label %return, label %if.end

if.end:                                           ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %and.i.i46 = and i64 %0, 1
  %cmp.i.i47.not = icmp eq i64 %and.i.i46, 0
  br i1 %cmp.i.i47.not, label %if.end9, label %return

if.end9:                                          ; preds = %if.end
  %cmp = icmp eq %struct.halide_device_interface_t* %1, null
  br i1 %cmp, label %return, label %if.end15

if.end15:                                         ; preds = %if.end9
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i64 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %copy_to_host = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i64 0, i32 6
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_host, align 8, !tbaa !212
  %call16 = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %cmp17.not = icmp eq i32 %call16, 0
  br i1 %cmp17.not, label %if.end23, label %return

if.end23:                                         ; preds = %if.end15
  %4 = load i64, i64* %flags.i.i, align 8, !tbaa !204
  %and.i.i44 = and i64 %4, -3
  store i64 %and.i.i44, i64* %flags.i.i, align 8, !tbaa !204
  %call24 = tail call i32 @halide_msan_annotate_buffer_is_initialized(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  br label %return

return:                                           ; preds = %if.end23, %if.end15, %if.end9, %if.end, %entry
  %retval.2 = phi i32 [ 0, %entry ], [ 0, %if.end23 ], [ -14, %if.end ], [ -19, %if.end9 ], [ -14, %if.end15 ]
  ret i32 %retval.2
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_release(i8* %user_context, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i64 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %device_release = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i64 0, i32 5
  %1 = load i32 (i8*)*, i32 (i8*)** %device_release, align 8, !tbaa !214
  %call = tail call i32 %1(i8* %user_context) #16
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6.88, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #17
  br label %cleanup

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* %buf) #17
  br label %cleanup

cleanup:                                          ; preds = %if.end16.i.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.89, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %if.end, label %cleanup

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i
  %cmp1 = icmp eq %struct.halide_device_interface_t* %device_interface, null
  br i1 %cmp1, label %if.then2, label %if.end11

if.then2:                                         ; preds = %if.end
  %device_interface5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface5, align 8, !tbaa !203
  %cmp6 = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.then2
  %call8 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %cleanup

if.end11:                                         ; preds = %if.then2, %if.end
  %device_interface.addr.0 = phi %struct.halide_device_interface_t* [ %device_interface, %if.end ], [ %4, %if.then2 ]
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %5 = load i64, i64* %device, align 8, !tbaa !69
  %tobool.not = icmp eq i64 %5, 0
  br i1 %tobool.not, label %if.then18, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end11
  %device_interface12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface12, align 8, !tbaa !203
  %cmp13.not = icmp eq %struct.halide_device_interface_t* %6, %device_interface.addr.0
  br i1 %cmp13.not, label %if.end27, label %if.then14

if.then14:                                        ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9.90, i64 0, i64 0)) #16
  br label %cleanup

if.then18:                                        ; preds = %if.end11
  %call19 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* nonnull %device_interface.addr.0) #17
  %cmp20.not = icmp eq i32 %call19, 0
  br i1 %cmp20.not, label %if.end27, label %cleanup

if.end27:                                         ; preds = %if.then18, %land.lhs.true
  %flags.i.i97 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %7 = load i64, i64* %flags.i.i97, align 8, !tbaa !204
  %and.i.i98 = and i64 %7, 1
  %cmp.i.i99.not = icmp eq i64 %and.i.i98, 0
  br i1 %cmp.i.i99.not, label %cleanup, label %if.then29

if.then29:                                        ; preds = %if.end27
  %and.i.i96 = and i64 %7, 2
  %cmp.i.i.not = icmp eq i64 %and.i.i96, 0
  br i1 %cmp.i.i.not, label %if.else, label %cleanup

if.else:                                          ; preds = %if.then29
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface.addr.0, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %copy_to_device = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 7
  %9 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %copy_to_device, align 8, !tbaa !215
  %call44 = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %cmp45 = icmp eq i32 %call44, 0
  br i1 %cmp45, label %if.then46, label %cleanup

if.then46:                                        ; preds = %if.else
  %10 = load i64, i64* %flags.i.i97, align 8, !tbaa !204
  %and.i.i = and i64 %10, -2
  store i64 %and.i.i, i64* %flags.i.i97, align 8, !tbaa !204
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17.91, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !203
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp4.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp5.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = or i1 %cmp4.not, %cmp5.not
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.92, i64 0, i64 0)) #16
  br label %cleanup12

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %device_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i64 0, i32 2
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_malloc, align 8, !tbaa !217
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i64 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %10() #16
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
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %call = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) #17
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_sync(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16.93, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup8

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !203
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2 = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %cleanup8

if.end5:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %device_sync = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 4
  %6 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_sync, align 8, !tbaa !219
  %call6 = tail call i32 %6(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.96, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !203
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %if.end11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %device_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i64 0, i32 3
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_free, align 8, !tbaa !220
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i64 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %10() #16
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !69
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([155 x i8], [155 x i8]* @.str.22.97, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -18
  ret i32 %spec.select

if.end11:                                         ; preds = %if.end
  %flags3.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %12 = load i64, i64* %flags3.i.i, align 8, !tbaa !204
  %and.i.i = and i64 %12, -3
  store i64 %and.i.i, i64* %flags3.i.i, align 8, !tbaa !204
  br label %cleanup12

cleanup12:                                        ; preds = %if.end11, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end11 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %0) #17
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_malloc(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.98, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup14

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface3.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface3.phi.trans.insert, align 8, !tbaa !203
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp4.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp5.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = or i1 %cmp4.not, %cmp5.not
  br i1 %or.cond, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.99, i64 0, i64 0)) #16
  br label %cleanup14

if.end7:                                          ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %device_and_host_malloc = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i64 0, i32 8
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_malloc, align 8, !tbaa !221
  %call9 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i64 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %10() #16
  %cmp11.not = icmp eq i32 %call9, 0
  br i1 %cmp11.not, label %cleanup14, label %if.then12

if.then12:                                        ; preds = %if.end7
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26.100, i64 0, i64 0)) #16
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27.101, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup18

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !203
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %if.else11, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %device_and_host_free = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i64 0, i32 9
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_and_host_free, align 8, !tbaa !222
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i64 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %10() #16
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !69
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([155 x i8], [155 x i8]* @.str.28.102, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %do.end

do.end:                                           ; preds = %if.then8, %if.then3
  %tobool.not = icmp eq i32 %call5, 0
  %spec.select = select i1 %tobool.not, i32 0, i32 -18
  ret i32 %spec.select

if.else11:                                        ; preds = %if.end
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 2
  %12 = load i8*, i8** %host, align 8, !tbaa !67
  %tobool12.not = icmp eq i8* %12, null
  br i1 %tobool12.not, label %if.end17, label %if.then13

if.then13:                                        ; preds = %if.else11
  tail call void @halide_free(i8* %user_context, i8* nonnull %12) #16
  store i8* null, i8** %host, align 8, !tbaa !67
  br label %if.end17

if.end17:                                         ; preds = %if.then13, %if.else11
  %flags3.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %13 = load i64, i64* %flags3.i.i, align 8, !tbaa !204
  %and.i.i = and i64 %13, -3
  store i64 %and.i.i, i64* %flags3.i.i, align 8, !tbaa !204
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29.103, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %if.end, label %cleanup13

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit, %if.end16.i
  %dimensions.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 5
  %4 = load i32, i32* %dimensions.i.i, align 4, !tbaa !70
  %cmp19.i.i = icmp sgt i32 %4, 0
  br i1 %cmp19.i.i, label %for.body.lr.ph.i.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

for.body.lr.ph.i.i:                               ; preds = %if.end
  %dim.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 6
  %5 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i.i, align 8, !tbaa !71
  %wide.trip.count.i.i = zext i32 %4 to i64
  %min.iters.check = icmp ult i32 %4, 17
  br i1 %min.iters.check, label %for.body.i.i.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.body.lr.ph.i.i
  %n.mod.vf = and i64 %wide.trip.count.i.i, 15
  %6 = icmp eq i64 %n.mod.vf, 0
  %7 = select i1 %6, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %wide.trip.count.i.i, %7
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi6 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi18, %vector.body ]
  %vec.phi7 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi19, %vector.body ]
  %vec.phi8 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi20, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add3 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add4 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %8 = or i64 %index, 4
  %9 = or i64 %index, 8
  %10 = or i64 %index, 12
  %11 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %index, i32 2
  %12 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %8, i32 2
  %13 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %9, i32 2
  %14 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %10, i32 2
  %15 = bitcast i32* %11 to <16 x i32>*
  %16 = bitcast i32* %12 to <16 x i32>*
  %17 = bitcast i32* %13 to <16 x i32>*
  %18 = bitcast i32* %14 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %15, align 4, !tbaa !77
  %wide.vec9 = load <16 x i32>, <16 x i32>* %16, align 4, !tbaa !77
  %wide.vec10 = load <16 x i32>, <16 x i32>* %17, align 4, !tbaa !77
  %wide.vec11 = load <16 x i32>, <16 x i32>* %18, align 4, !tbaa !77
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec12 = shufflevector <16 x i32> %wide.vec9, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec13 = shufflevector <16 x i32> %wide.vec10, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec14 = shufflevector <16 x i32> %wide.vec11, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %19 = icmp sgt <4 x i32> %strided.vec, zeroinitializer
  %20 = icmp sgt <4 x i32> %strided.vec12, zeroinitializer
  %21 = icmp sgt <4 x i32> %strided.vec13, zeroinitializer
  %22 = icmp sgt <4 x i32> %strided.vec14, zeroinitializer
  %23 = zext <4 x i32> %strided.vec to <4 x i64>
  %24 = zext <4 x i32> %strided.vec12 to <4 x i64>
  %25 = zext <4 x i32> %strided.vec13 to <4 x i64>
  %26 = zext <4 x i32> %strided.vec14 to <4 x i64>
  %27 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %vec.ind, i32 1
  %28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %step.add, i32 1
  %29 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %step.add3, i32 1
  %30 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %step.add4, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %27, i32 4, <4 x i1> %19, <4 x i32> undef), !tbaa !73
  %wide.masked.gather15 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %28, i32 4, <4 x i1> %20, <4 x i32> undef), !tbaa !73
  %wide.masked.gather16 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %29, i32 4, <4 x i1> %21, <4 x i32> undef), !tbaa !73
  %wide.masked.gather17 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %30, i32 4, <4 x i1> %22, <4 x i32> undef), !tbaa !73
  %31 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %32 = add nsw <4 x i32> %wide.masked.gather15, <i32 -1, i32 -1, i32 -1, i32 -1>
  %33 = add nsw <4 x i32> %wide.masked.gather16, <i32 -1, i32 -1, i32 -1, i32 -1>
  %34 = add nsw <4 x i32> %wide.masked.gather17, <i32 -1, i32 -1, i32 -1, i32 -1>
  %35 = sext <4 x i32> %31 to <4 x i64>
  %36 = sext <4 x i32> %32 to <4 x i64>
  %37 = sext <4 x i32> %33 to <4 x i64>
  %38 = sext <4 x i32> %34 to <4 x i64>
  %39 = mul nsw <4 x i64> %35, %23
  %40 = mul nsw <4 x i64> %36, %24
  %41 = mul nsw <4 x i64> %37, %25
  %42 = mul nsw <4 x i64> %38, %26
  %43 = select <4 x i1> %19, <4 x i64> %39, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %43
  %44 = select <4 x i1> %20, <4 x i64> %40, <4 x i64> zeroinitializer
  %predphi18 = add <4 x i64> %vec.phi6, %44
  %45 = select <4 x i1> %21, <4 x i64> %41, <4 x i64> zeroinitializer
  %predphi19 = add <4 x i64> %vec.phi7, %45
  %46 = select <4 x i1> %22, <4 x i64> %42, <4 x i64> zeroinitializer
  %predphi20 = add <4 x i64> %vec.phi8, %46
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !223

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi18, %predphi
  %bin.rdx21 = add <4 x i64> %predphi19, %bin.rdx
  %bin.rdx22 = add <4 x i64> %predphi20, %bin.rdx21
  %48 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx22)
  br label %for.body.i.i.preheader

for.body.i.i.preheader:                           ; preds = %middle.block, %for.body.lr.ph.i.i
  %indvars.iv.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %n.vec, %middle.block ]
  %index.021.i.i.ph = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %48, %middle.block ]
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.preheader, %if.end.i.i
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %if.end.i.i ], [ %indvars.iv.i.i.ph, %for.body.i.i.preheader ]
  %index.021.i.i = phi i64 [ %index.1.i.i, %if.end.i.i ], [ %index.021.i.i.ph, %for.body.i.i.preheader ]
  %stride2.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %indvars.iv.i.i, i32 2
  %49 = load i32, i32* %stride2.i.i, align 4, !tbaa !77
  %cmp3.i.i = icmp sgt i32 %49, 0
  br i1 %cmp3.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %conv18.i.i = zext i32 %49 to i64
  %extent.i.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %indvars.iv.i.i, i32 1
  %50 = load i32, i32* %extent.i.i, align 4, !tbaa !73
  %sub.i.i = add nsw i32 %50, -1
  %conv7.i.i = sext i32 %sub.i.i to i64
  %mul.i.i = mul nsw i64 %conv7.i.i, %conv18.i.i
  %add.i.i = add nsw i64 %mul.i.i, %index.021.i.i
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %for.body.i.i
  %index.1.i.i = phi i64 [ %add.i.i, %if.then.i.i ], [ %index.021.i.i, %for.body.i.i ]
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.not.i.i = icmp eq i64 %indvars.iv.next.i.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i.i, label %for.body.i13.i.preheader, label %for.body.i.i, !llvm.loop !224

for.body.i13.i.preheader:                         ; preds = %if.end.i.i
  %min.iters.check26 = icmp ult i32 %4, 17
  br i1 %min.iters.check26, label %for.body.i13.i.preheader64, label %vector.ph27

vector.ph27:                                      ; preds = %for.body.i13.i.preheader
  %n.mod.vf28 = and i64 %wide.trip.count.i.i, 15
  %51 = icmp eq i64 %n.mod.vf28, 0
  %52 = select i1 %51, i64 16, i64 %n.mod.vf28
  %n.vec29 = sub nsw i64 %wide.trip.count.i.i, %52
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25, %vector.ph27
  %index30 = phi i64 [ 0, %vector.ph27 ], [ %index.next31, %vector.body25 ]
  %vec.ind34 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph27 ], [ %vec.ind.next39, %vector.body25 ]
  %vec.phi40 = phi <4 x i64> [ zeroinitializer, %vector.ph27 ], [ %predphi56, %vector.body25 ]
  %vec.phi41 = phi <4 x i64> [ zeroinitializer, %vector.ph27 ], [ %predphi57, %vector.body25 ]
  %vec.phi42 = phi <4 x i64> [ zeroinitializer, %vector.ph27 ], [ %predphi58, %vector.body25 ]
  %vec.phi43 = phi <4 x i64> [ zeroinitializer, %vector.ph27 ], [ %predphi59, %vector.body25 ]
  %step.add35 = add <4 x i64> %vec.ind34, <i64 4, i64 4, i64 4, i64 4>
  %step.add36 = add <4 x i64> %vec.ind34, <i64 8, i64 8, i64 8, i64 8>
  %step.add37 = add <4 x i64> %vec.ind34, <i64 12, i64 12, i64 12, i64 12>
  %53 = or i64 %index30, 4
  %54 = or i64 %index30, 8
  %55 = or i64 %index30, 12
  %56 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %index30, i32 2
  %57 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %53, i32 2
  %58 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %54, i32 2
  %59 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %55, i32 2
  %60 = bitcast i32* %56 to <16 x i32>*
  %61 = bitcast i32* %57 to <16 x i32>*
  %62 = bitcast i32* %58 to <16 x i32>*
  %63 = bitcast i32* %59 to <16 x i32>*
  %wide.vec44 = load <16 x i32>, <16 x i32>* %60, align 4, !tbaa !77
  %wide.vec45 = load <16 x i32>, <16 x i32>* %61, align 4, !tbaa !77
  %wide.vec46 = load <16 x i32>, <16 x i32>* %62, align 4, !tbaa !77
  %wide.vec47 = load <16 x i32>, <16 x i32>* %63, align 4, !tbaa !77
  %strided.vec48 = shufflevector <16 x i32> %wide.vec44, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec49 = shufflevector <16 x i32> %wide.vec45, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec50 = shufflevector <16 x i32> %wide.vec46, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec51 = shufflevector <16 x i32> %wide.vec47, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %64 = icmp slt <4 x i32> %strided.vec48, zeroinitializer
  %65 = icmp slt <4 x i32> %strided.vec49, zeroinitializer
  %66 = icmp slt <4 x i32> %strided.vec50, zeroinitializer
  %67 = icmp slt <4 x i32> %strided.vec51, zeroinitializer
  %68 = sext <4 x i32> %strided.vec48 to <4 x i64>
  %69 = sext <4 x i32> %strided.vec49 to <4 x i64>
  %70 = sext <4 x i32> %strided.vec50 to <4 x i64>
  %71 = sext <4 x i32> %strided.vec51 to <4 x i64>
  %72 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %vec.ind34, i32 1
  %73 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %step.add35, i32 1
  %74 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %step.add36, i32 1
  %75 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, <4 x i64> %step.add37, i32 1
  %wide.masked.gather52 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %72, i32 4, <4 x i1> %64, <4 x i32> undef), !tbaa !73
  %wide.masked.gather53 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %73, i32 4, <4 x i1> %65, <4 x i32> undef), !tbaa !73
  %wide.masked.gather54 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %74, i32 4, <4 x i1> %66, <4 x i32> undef), !tbaa !73
  %wide.masked.gather55 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %75, i32 4, <4 x i1> %67, <4 x i32> undef), !tbaa !73
  %76 = add nsw <4 x i32> %wide.masked.gather52, <i32 -1, i32 -1, i32 -1, i32 -1>
  %77 = add nsw <4 x i32> %wide.masked.gather53, <i32 -1, i32 -1, i32 -1, i32 -1>
  %78 = add nsw <4 x i32> %wide.masked.gather54, <i32 -1, i32 -1, i32 -1, i32 -1>
  %79 = add nsw <4 x i32> %wide.masked.gather55, <i32 -1, i32 -1, i32 -1, i32 -1>
  %80 = sext <4 x i32> %76 to <4 x i64>
  %81 = sext <4 x i32> %77 to <4 x i64>
  %82 = sext <4 x i32> %78 to <4 x i64>
  %83 = sext <4 x i32> %79 to <4 x i64>
  %84 = mul nsw <4 x i64> %80, %68
  %85 = mul nsw <4 x i64> %81, %69
  %86 = mul nsw <4 x i64> %82, %70
  %87 = mul nsw <4 x i64> %83, %71
  %88 = select <4 x i1> %64, <4 x i64> %84, <4 x i64> zeroinitializer
  %predphi56 = add <4 x i64> %vec.phi40, %88
  %89 = select <4 x i1> %65, <4 x i64> %85, <4 x i64> zeroinitializer
  %predphi57 = add <4 x i64> %vec.phi41, %89
  %90 = select <4 x i1> %66, <4 x i64> %86, <4 x i64> zeroinitializer
  %predphi58 = add <4 x i64> %vec.phi42, %90
  %91 = select <4 x i1> %67, <4 x i64> %87, <4 x i64> zeroinitializer
  %predphi59 = add <4 x i64> %vec.phi43, %91
  %index.next31 = add i64 %index30, 16
  %vec.ind.next39 = add <4 x i64> %vec.ind34, <i64 16, i64 16, i64 16, i64 16>
  %92 = icmp eq i64 %index.next31, %n.vec29
  br i1 %92, label %middle.block23, label %vector.body25, !llvm.loop !225

middle.block23:                                   ; preds = %vector.body25
  %bin.rdx60 = add <4 x i64> %predphi57, %predphi56
  %bin.rdx61 = add <4 x i64> %predphi58, %bin.rdx60
  %bin.rdx62 = add <4 x i64> %predphi59, %bin.rdx61
  %93 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx62)
  br label %for.body.i13.i.preheader64

for.body.i13.i.preheader64:                       ; preds = %middle.block23, %for.body.i13.i.preheader
  %indvars.iv.i10.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %n.vec29, %middle.block23 ]
  %index.018.i.i.ph = phi i64 [ 0, %for.body.i13.i.preheader ], [ %93, %middle.block23 ]
  br label %for.body.i13.i

for.body.i13.i:                                   ; preds = %for.body.i13.i.preheader64, %if.end.i24.i
  %indvars.iv.i10.i = phi i64 [ %indvars.iv.next.i22.i, %if.end.i24.i ], [ %indvars.iv.i10.i.ph, %for.body.i13.i.preheader64 ]
  %index.018.i.i = phi i64 [ %index.1.i21.i, %if.end.i24.i ], [ %index.018.i.i.ph, %for.body.i13.i.preheader64 ]
  %stride2.i11.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %indvars.iv.i10.i, i32 2
  %94 = load i32, i32* %stride2.i11.i, align 4, !tbaa !77
  %cmp3.i12.i = icmp slt i32 %94, 0
  br i1 %cmp3.i12.i, label %if.then.i20.i, label %if.end.i24.i

if.then.i20.i:                                    ; preds = %for.body.i13.i
  %conv.i14.i = sext i32 %94 to i64
  %extent.i15.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %5, i64 %indvars.iv.i10.i, i32 1
  %95 = load i32, i32* %extent.i15.i, align 4, !tbaa !73
  %sub.i16.i = add nsw i32 %95, -1
  %conv7.i17.i = sext i32 %sub.i16.i to i64
  %mul.i18.i = mul nsw i64 %conv7.i17.i, %conv.i14.i
  %add.i19.i = add nsw i64 %mul.i18.i, %index.018.i.i
  br label %if.end.i24.i

if.end.i24.i:                                     ; preds = %if.then.i20.i, %for.body.i13.i
  %index.1.i21.i = phi i64 [ %add.i19.i, %if.then.i20.i ], [ %index.018.i.i, %for.body.i13.i ]
  %indvars.iv.next.i22.i = add nuw nsw i64 %indvars.iv.i10.i, 1
  %exitcond.not.i23.i = icmp eq i64 %indvars.iv.next.i22.i, %wide.trip.count.i.i
  br i1 %exitcond.not.i23.i, label %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, label %for.body.i13.i, !llvm.loop !226

_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit: ; preds = %if.end.i24.i
  %add8.i.i = add nsw i64 %index.1.i.i, 1
  br label %_ZNK15halide_buffer_t13size_in_bytesEv.exit

_ZNK15halide_buffer_t13size_in_bytesEv.exit:      ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit, %if.end
  %add8.i27.i = phi i64 [ 1, %if.end ], [ %add8.i.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %index.0.lcssa.i9.i = phi i64 [ 0, %if.end ], [ %index.1.i21.i, %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit ]
  %sub.i = sub nsw i64 %add8.i27.i, %index.0.lcssa.i9.i
  %bits.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 4, i32 1
  %96 = load i8, i8* %bits.i.i, align 1, !tbaa !28
  %conv.i.i = zext i8 %96 to i64
  %add.i4.i = add nuw nsw i64 %conv.i.i, 7
  %div.i.i = lshr i64 %add.i4.i, 3
  %mul.i = mul i64 %div.i.i, %sub.i
  %call2 = tail call i8* @halide_malloc(i8* %user_context, i64 %mul.i) #16
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 2
  store i8* %call2, i8** %host, align 8, !tbaa !67
  %cmp4 = icmp eq i8* %call2, null
  br i1 %cmp4, label %cleanup13, label %if.end6

if.end6:                                          ; preds = %_ZNK15halide_buffer_t13size_in_bytesEv.exit
  %call7 = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, %struct.halide_device_interface_t* %device_interface) #17
  %cmp8.not = icmp eq i32 %call7, 0
  br i1 %cmp8.not, label %cleanup13, label %if.then9

if.then9:                                         ; preds = %if.end6
  %97 = load i8*, i8** %host, align 8, !tbaa !67
  tail call void @halide_free(i8* %user_context, i8* %97) #16
  store i8* null, i8** %host, align 8, !tbaa !67
  br label %cleanup13

cleanup13:                                        ; preds = %if.then9, %if.end6, %_ZNK15halide_buffer_t13size_in_bytesEv.exit, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.1 = phi i32 [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ -1, %_ZNK15halide_buffer_t13size_in_bytesEv.exit ], [ %call7, %if.then9 ], [ 0, %if.end6 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %buf, %struct.halide_device_interface_t* %device_interface) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq %struct.halide_buffer_t* %buf, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30.104, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end16.i.split

if.end16.i.split:                                 ; preds = %if.end16.i
  %call11 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #17
  br label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %call12 = tail call i32 @halide_device_free(i8* %user_context, %struct.halide_buffer_t* %buf) #17
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split, %if.end16.i.split
  %phi.call = phi i32 [ %call11, %if.end16.i.split ], [ %call12, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split ]
  %host = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 2
  %4 = load i8*, i8** %host, align 8, !tbaa !67
  %tobool.not = icmp eq i8* %4, null
  br i1 %tobool.not, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @halide_free(i8* %user_context, i8* nonnull %4) #16
  store i8* null, i8** %host, align 8, !tbaa !67
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %flags3.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %5 = load i64, i64* %flags3.i.i, align 8, !tbaa !204
  %and.i.i18 = and i64 %5, -4
  store i64 %and.i.i18, i64* %flags3.i.i, align 8, !tbaa !204
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31.105, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup12

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !203
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  %cmp3.not = icmp eq %struct.halide_device_interface_t* %4, %device_interface
  %or.cond = or i1 %cmp2.not, %cmp3.not
  br i1 %or.cond, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32.106, i64 0, i64 0)) #16
  br label %cleanup12

if.end5:                                          ; preds = %if.end
  %device_interface1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %device_interface, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  store %struct.halide_device_interface_t* %device_interface, %struct.halide_device_interface_t** %device_interface1, align 8, !tbaa !203
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %wrap_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i64 0, i32 14
  %8 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %wrap_native, align 8, !tbaa !227
  %call8 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf, i64 %handle) #16
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i64 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %10() #16
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33.107, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device_interface1.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %.pre = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface1.phi.trans.insert, align 8, !tbaa !203
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi %struct.halide_device_interface_t* [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %0, %if.end16.i ]
  %cmp2.not = icmp eq %struct.halide_device_interface_t* %4, null
  br i1 %cmp2.not, label %cleanup, label %if.then3

if.then3:                                         ; preds = %if.end
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  %7 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %detach_native = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %7, i64 0, i32 15
  %8 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %detach_native, align 8, !tbaa !228
  %call5 = tail call i32 %8(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  %9 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %9, i64 0, i32 1
  %10 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %10() #16
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %11 = load i64, i64* %device, align 8, !tbaa !69
  %cmp7 = icmp eq i64 %11, 0
  br i1 %cmp7, label %do.end, label %if.then8

if.then8:                                         ; preds = %if.then3
  tail call void @halide_print(i8* %user_context, i8* getelementptr inbounds ([155 x i8], [155 x i8]* @.str.34.108, i64 0, i64 0)) #16
  tail call void @abort() #16
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
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !69
  %cmp.not = icmp eq i64 %0, 0
  br i1 %cmp.not, label %if.end, label %return

if.end:                                           ; preds = %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i64 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i64 0, i32 0
  %3 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %3() #16
  store i64 %handle, i64* %device, align 8, !tbaa !69
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
  %call.i = tail call i32 @halide_error_buffer_is_null(i8* %user_context, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.35, i64 0, i64 0)) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end.i:                                         ; preds = %entry
  %device_interface.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface.i, align 8, !tbaa !203
  %cmp4.not.i = icmp eq %struct.halide_device_interface_t* %0, null
  %device.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %1 = load i64, i64* %device.i, align 8, !tbaa !69
  %cmp5.not.i = icmp eq i64 %1, 0
  %cmp4.not.not.i = xor i1 %cmp4.not.i, true
  %brmerge.i = or i1 %cmp5.not.i, %cmp4.not.not.i
  br i1 %brmerge.i, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %if.end.i
  %call9.i = tail call i32 @halide_error_no_device_interface(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end10.i:                                       ; preds = %if.end.i
  %cmp5.not.not.i = xor i1 %cmp5.not.i, true
  %brmerge44.i = or i1 %cmp4.not.i, %cmp5.not.not.i
  br i1 %brmerge44.i, label %if.end16.i, label %if.then14.i

if.then14.i:                                      ; preds = %if.end10.i
  %call15.i = tail call i32 @halide_error_device_interface_no_device(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

if.end16.i:                                       ; preds = %if.end10.i
  %flags.i.i46.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 3
  %2 = load i64, i64* %flags.i.i46.i, align 8, !tbaa !204
  %3 = and i64 %2, 3
  %.not.i = icmp eq i64 %3, 3
  br i1 %.not.i, label %if.then24.i, label %if.end

if.then24.i:                                      ; preds = %if.end16.i
  %call25.i = tail call i32 @halide_error_host_and_device_dirty(i8* %user_context) #16
  br label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit: ; preds = %if.then24.i, %if.then14.i, %if.then8.i, %if.then.i
  %retval.2.i = phi i32 [ %call.i, %if.then.i ], [ %call15.i, %if.then14.i ], [ %call9.i, %if.then8.i ], [ %call25.i, %if.then24.i ]
  %cmp.not = icmp eq i32 %retval.2.i, 0
  br i1 %cmp.not, label %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, label %cleanup

_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge: ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %device.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %.pre = load i64, i64* %device.phi.trans.insert, align 8, !tbaa !69
  br label %if.end

if.end:                                           ; preds = %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge, %if.end16.i
  %4 = phi i64 [ %.pre, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge ], [ %1, %if.end16.i ]
  %cmp1 = icmp eq i64 %4, 0
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %5 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %5, i64 0, i32 15
  %6 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %6, i64 0, i32 1
  %7 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %7() #16
  store i64 0, i64* %device, align 8, !tbaa !69
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  br label %cleanup

cleanup:                                          ; preds = %if.end3, %if.end, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit
  %retval.0 = phi i32 [ 0, %if.end3 ], [ %retval.2.i, %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_and_host_free_as_destructor(i8* %user_context, i8* %obj) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %obj to %struct.halide_buffer_t*
  %call = tail call i32 @halide_device_and_host_free(i8* %user_context, %struct.halide_buffer_t* %0) #17
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
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 1
  %0 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %tobool1.not = icmp eq %struct.halide_device_interface_t* %0, null
  %cmp.not = icmp eq %struct.halide_device_interface_t* %0, %dst_device_interface
  %or.cond = or i1 %tobool1.not, %cmp.not
  br i1 %or.cond, label %land.lhs.true5, label %if.then

if.then:                                          ; preds = %land.lhs.true
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.41, i64 0, i64 0)) #16
  br label %cleanup143

land.lhs.true5:                                   ; preds = %land.lhs.true
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 0
  %1 = load i64, i64* %device, align 8, !tbaa !69
  %tobool6.not = icmp eq i64 %1, 0
  br i1 %tobool6.not, label %if.then7, label %if.end13

if.then7:                                         ; preds = %land.lhs.true5
  %call = tail call i32 @halide_device_malloc(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* nonnull %dst_device_interface) #17
  %tobool10.not = icmp eq i32 %call, 0
  br i1 %tobool10.not, label %if.end13, label %cleanup143

if.end13:                                         ; preds = %if.then7, %land.lhs.true5, %entry
  %device14 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 0
  %2 = load i64, i64* %device14, align 8, !tbaa !69
  %cmp15.not = icmp eq i64 %2, 0
  %host22.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 2
  %.pre = load i8*, i8** %host22.phi.trans.insert, align 8, !tbaa !67
  %cmp23.not = icmp eq i8* %.pre, null
  br i1 %cmp15.not, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.thread264

land.end.thread264:                               ; preds = %land.rhs
  %flags.i.i243 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 3
  %3 = load i64, i64* %flags.i.i243, align 8, !tbaa !204
  %and.i.i244 = and i64 %3, 1
  %cmp.i.i.not = icmp ne i64 %and.i.i244, 0
  br label %land.rhs26

land.end:                                         ; preds = %if.end13
  br i1 %cmp23.not, label %land.end32, label %land.end.land.rhs26_crit_edge

land.end.land.rhs26_crit_edge:                    ; preds = %land.end
  %flags.i.i247.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 3
  %.pre1 = load i64, i64* %flags.i.i247.phi.trans.insert, align 8, !tbaa !204
  br label %land.rhs26

land.rhs26:                                       ; preds = %land.end.land.rhs26_crit_edge, %land.end.thread264
  %4 = phi i64 [ %3, %land.end.thread264 ], [ %.pre1, %land.end.land.rhs26_crit_edge ]
  %5 = phi i1 [ %cmp.i.i.not, %land.end.thread264 ], [ true, %land.end.land.rhs26_crit_edge ]
  %and.i.i248 = and i64 %4, 2
  %cmp.i.i249.not = icmp eq i64 %and.i.i248, 0
  br i1 %cmp.i.i249.not, label %land.end32, label %lor.rhs28

lor.rhs28:                                        ; preds = %land.rhs26
  %device_interface29 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 1
  %6 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface29, align 8, !tbaa !203
  %cmp30 = icmp ne %struct.halide_device_interface_t* %6, null
  br label %land.end32

land.end32:                                       ; preds = %lor.rhs28, %land.rhs26, %land.end, %land.rhs
  %cmp23.not263 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ false, %lor.rhs28 ], [ true, %land.rhs ]
  %7 = phi i1 [ true, %land.end ], [ %5, %land.rhs26 ], [ %5, %lor.rhs28 ], [ false, %land.rhs ]
  %8 = phi i1 [ true, %land.end ], [ false, %land.rhs26 ], [ %cmp30, %lor.rhs28 ], [ true, %land.rhs ]
  %host34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 2
  %9 = load i8*, i8** %host34, align 8, !tbaa !67
  %cmp35.not = icmp eq i8* %9, null
  %cmp20.not = xor i1 %tobool.not, true
  %10 = and i1 %tobool.not, %cmp35.not
  br i1 %10, label %cleanup143, label %if.end41

if.end41:                                         ; preds = %land.end32
  %brmerge229 = or i1 %tobool.not, %7
  br i1 %brmerge229, label %if.then51, label %if.end49

if.end49:                                         ; preds = %if.end41
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i64 0, i32 15
  %11 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %buffer_copy = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %11, i64 0, i32 10
  %12 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy, align 8, !tbaa !229
  %call48 = tail call i32 %12(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #16
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
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %c, %struct.halide_buffer_t* nonnull %src, i1 zeroext true, %struct.halide_buffer_t* nonnull %dst, i1 zeroext true) #17
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %c, i8* %user_context) #17
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %13) #11
  br label %land.lhs.true126

if.else:                                          ; preds = %if.end58
  %brmerge237 = or i1 %7, %cmp20.not
  br i1 %brmerge237, label %if.else81, label %if.then66

if.then66:                                        ; preds = %if.else
  %device_interface69 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 1
  %14 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface69, align 8, !tbaa !203
  %impl70 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %14, i64 0, i32 15
  %15 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl70, align 8, !tbaa !210
  %buffer_copy71 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %15, i64 0, i32 10
  %16 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy71, align 8, !tbaa !229
  %call72 = tail call i32 %16(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #16
  %cmp73 = icmp eq i32 %call72, -42
  br i1 %cmp73, label %if.then74, label %if.end117

if.then74:                                        ; preds = %if.then66
  %call75 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #17
  %tobool76.not = icmp eq i32 %call75, 0
  br i1 %tobool76.not, label %if.then77, label %cleanup143

if.then77:                                        ; preds = %if.then74
  %call78 = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #17
  br label %if.end117

if.else81:                                        ; preds = %if.else
  %brmerge239 = or i1 %7, %cmp35.not
  br i1 %brmerge239, label %if.else98, label %if.then85

if.then85:                                        ; preds = %if.else81
  %device_interface90 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 1
  %17 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface90, align 8, !tbaa !203
  %impl91 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %17, i64 0, i32 15
  %18 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl91, align 8, !tbaa !210
  %buffer_copy92 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %18, i64 0, i32 10
  %19 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy92, align 8, !tbaa !229
  %call93 = tail call i32 %19(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %dst) #16
  %cmp94 = icmp eq i32 %call93, 0
  br i1 %cmp94, label %if.then95, label %cleanup143

if.then95:                                        ; preds = %if.then85
  %flags.i.i245 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 3
  %20 = load i64, i64* %flags.i.i245, align 8, !tbaa !204
  %or.i.i246 = or i64 %20, 1
  store i64 %or.i.i246, i64* %flags.i.i245, align 8, !tbaa !204
  %call96 = tail call i32 @copy_to_device_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %dst, %struct.halide_device_interface_t* %dst_device_interface) #17
  br label %if.end117

if.else98:                                        ; preds = %if.else81
  br i1 %tobool.not, label %cleanup143, label %if.then100

if.then100:                                       ; preds = %if.else98
  %call103 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %user_context, %struct.halide_buffer_t* nonnull %src) #17
  %cmp104 = icmp eq i32 %call103, 0
  br i1 %cmp104, label %if.then105, label %cleanup143

if.then105:                                       ; preds = %if.then100
  %impl106 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i64 0, i32 15
  %21 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl106, align 8, !tbaa !210
  %buffer_copy107 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %21, i64 0, i32 10
  %22 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %buffer_copy107, align 8, !tbaa !229
  %call108 = tail call i32 %22(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* nonnull %dst_device_interface, %struct.halide_buffer_t* nonnull %dst) #16
  br label %if.end117

if.end117:                                        ; preds = %if.then105, %if.then95, %if.then77, %if.then66, %if.end49
  %err.1 = phi i32 [ %call78, %if.then77 ], [ %call72, %if.then66 ], [ %call96, %if.then95 ], [ %call108, %if.then105 ], [ %call48, %if.end49 ]
  %cond = icmp eq i32 %err.1, 0
  br i1 %cond, label %land.lhs.true126, label %cleanup143

land.lhs.true126:                                 ; preds = %if.end117, %if.end117.thread258
  %cmp127.not.old = icmp eq %struct.halide_buffer_t* %dst, %src
  br i1 %cmp127.not.old, label %cleanup143, label %if.then128

if.then128:                                       ; preds = %land.lhs.true126
  %flags.i.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 3
  %23 = load i64, i64* %flags.i.i, align 8, !tbaa !204
  %or.i.i = and i64 %23, -4
  br i1 %tobool.not, label %if.else133, label %if.then130

if.then130:                                       ; preds = %if.then128
  %or.i.i242 = or i64 %or.i.i, 2
  store i64 %or.i.i242, i64* %flags.i.i, align 8, !tbaa !204
  br label %cleanup143

if.else133:                                       ; preds = %if.then128
  %and.i.i251 = or i64 %or.i.i, 1
  store i64 %and.i.i251, i64* %flags.i.i, align 8, !tbaa !204
  br label %cleanup143

cleanup143:                                       ; preds = %if.else133, %if.then130, %land.lhs.true126, %if.end117, %if.then100, %if.else98, %if.then85, %if.then74, %if.then51, %land.end32, %if.then7, %if.then
  %retval.1 = phi i32 [ -42, %if.then ], [ %call, %if.then7 ], [ -34, %land.end32 ], [ 0, %if.then130 ], [ 0, %if.else133 ], [ 0, %land.lhs.true126 ], [ -42, %if.then51 ], [ %err.1, %if.end117 ], [ -42, %if.else98 ], [ %call103, %if.then100 ], [ %call93, %if.then85 ], [ %call75, %if.then74 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %tobool.not = icmp eq %struct.halide_device_interface_t* %dst_device_interface, null
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i64 0, i32 15
  %0 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %0, i64 0, i32 0
  %1 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %1() #16
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 1
  %2 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %tobool11.not = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %tobool11.not, label %if.end16, label %if.then12

if.then12:                                        ; preds = %if.end
  %impl14 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %3 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl14, align 8, !tbaa !210
  %use_module15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %3, i64 0, i32 0
  %4 = load void ()*, void ()** %use_module15, align 8, !tbaa !216
  tail call void %4() #16
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end
  %call = tail call i32 @halide_buffer_copy_already_locked(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_device_interface_t* %dst_device_interface, %struct.halide_buffer_t* %dst) #17
  br i1 %tobool.not, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.end16
  %impl19 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %dst_device_interface, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl19, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 1
  %6 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %6() #16
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end16
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %tobool22.not = icmp eq %struct.halide_device_interface_t* %7, null
  br i1 %tobool22.not, label %if.end27, label %if.then23

if.then23:                                        ; preds = %if.end20
  %impl25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl25, align 8, !tbaa !210
  %release_module26 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 1
  %9 = load void ()*, void ()** %release_module26, align 8, !tbaa !218
  tail call void %9() #16
  br label %if.end27

if.end27:                                         ; preds = %if.then23, %if.end20
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %call
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #16
  ret i32 -40
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i64 0, i64 0)) #16
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %user_context, %struct.halide_buffer_t* %src, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !69
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !69
  %tobool2.not = icmp eq i64 %1, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #16
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !70
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !70
  %cmp.not = icmp eq i32 %2, %3
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i64 0, i64 0)) #16
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 8, !tbaa !210
  %device_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 11
  %9 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %device_crop, align 8, !tbaa !230
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, %struct.halide_buffer_t* nonnull %dst) #16
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %user_context, %struct.halide_buffer_t* %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* %dst) local_unnamed_addr #4 {
entry:
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !69
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %device1 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 0
  %1 = load i64, i64* %device1, align 8, !tbaa !69
  %tobool2.not = icmp eq i64 %1, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #16
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %dimensions = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 5
  %2 = load i32, i32* %dimensions, align 4, !tbaa !70
  %dimensions5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %dst, i64 0, i32 5
  %3 = load i32, i32* %dimensions5, align 4, !tbaa !70
  %add = add nsw i32 %3, 1
  %cmp.not = icmp eq i32 %2, %add
  br i1 %cmp.not, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i64 0, i64 0)) #16
  br label %cleanup

if.end7:                                          ; preds = %if.end4
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %src, i64 0, i32 1
  %4 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %4, i64 0, i32 15
  %5 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %use_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %5, i64 0, i32 0
  %6 = load void ()*, void ()** %use_module, align 8, !tbaa !216
  tail call void %6() #16
  %7 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %impl9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %7, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl9, align 8, !tbaa !210
  %device_slice = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 12
  %9 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %device_slice, align 8, !tbaa !231
  %call = tail call i32 %9(i8* %user_context, %struct.halide_buffer_t* nonnull %src, i32 %slice_dim, i32 %slice_pos, %struct.halide_buffer_t* nonnull %dst) #16
  br label %cleanup

cleanup:                                          ; preds = %if.end7, %if.then6, %if.then3, %entry
  %retval.0 = phi i32 [ -41, %if.then3 ], [ -41, %if.then6 ], [ %call, %if.end7 ], [ 0, %entry ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %retval.0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #0 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !69
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %return, label %if.end

if.end:                                           ; preds = %entry
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #16
  br label %return

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ -40, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define weak i32 @halide_device_release_crop(i8* %user_context, %struct.halide_buffer_t* %buf) local_unnamed_addr #4 {
entry:
  %device = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 0
  %0 = load i64, i64* %device, align 8, !tbaa !69
  %tobool.not = icmp eq i64 %0, 0
  br i1 %tobool.not, label %return, label %if.then

if.then:                                          ; preds = %entry
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %device_interface = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %buf, i64 0, i32 1
  %1 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  %impl = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i64 0, i32 15
  %2 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %device_release_crop = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %2, i64 0, i32 13
  %3 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %device_release_crop, align 8, !tbaa !232
  %call = tail call i32 %3(i8* %user_context, %struct.halide_buffer_t* nonnull %buf) #16
  store i64 0, i64* %device, align 8, !tbaa !69
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %impl, align 8, !tbaa !210
  %release_module = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i64 0, i32 1
  %5 = load void ()*, void ()** %release_module, align 8, !tbaa !218
  tail call void %5() #16
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %device_interface, align 8, !tbaa !203
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
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
  %1 = tail call i32 @llvm.ctlz.i32(i32 %and2, i1 true), !range !233
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
  %call = tail call float @halide_float16_bits_to_float(i16 zeroext %bits) #17
  %conv = fpext float %call to double
  ret double %conv
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.111, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.111, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #16
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.112, i64 0, i64 0)) #16
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i16 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %user_context, i8* %extern_stage_name, i32 %result) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.113, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.113, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %extern_stage_name) #16
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.112, i64 0, i64 0)) #16
  %conv.i = sext i32 %result to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.16.0, i64 %conv.i, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i16 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 %result
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %min_bound, i32 %max_bound, i32 %min_required, i32 %max_required) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i151 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.114, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i152 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.114, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i151, %entry.split ], [ %call.i152, %if.then6.i ]
  %ref.tmp.sroa.34.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.34.0, i8* %var_name) #16
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.115, i64 0, i64 0)) #16
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.34.0, i8* %func_name) #16
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.116, i64 0, i64 0)) #16
  %conv.i = sext i32 %min_bound to i64
  %call.i30 = tail call i8* @halide_int64_to_string(i8* %call.i27, i8* %ref.tmp.sroa.34.0, i64 %conv.i, i32 1) #16
  %call.i33 = tail call i8* @halide_string_to_string(i8* %call.i30, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.117, i64 0, i64 0)) #16
  %conv.i36 = sext i32 %max_bound to i64
  %call.i37 = tail call i8* @halide_int64_to_string(i8* %call.i33, i8* %ref.tmp.sroa.34.0, i64 %conv.i36, i32 1) #16
  %call.i40 = tail call i8* @halide_string_to_string(i8* %call.i37, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.118, i64 0, i64 0)) #16
  %conv.i43 = sext i32 %min_required to i64
  %call.i44 = tail call i8* @halide_int64_to_string(i8* %call.i40, i8* %ref.tmp.sroa.34.0, i64 %conv.i43, i32 1) #16
  %call.i47 = tail call i8* @halide_string_to_string(i8* %call.i44, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.117, i64 0, i64 0)) #16
  %conv.i50 = sext i32 %max_required to i64
  %call.i51 = tail call i8* @halide_int64_to_string(i8* %call.i47, i8* %ref.tmp.sroa.34.0, i64 %conv.i50, i32 1) #16
  %call.i54 = tail call i8* @halide_string_to_string(i8* %call.i51, i8* %ref.tmp.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.119, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i54 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -2
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_type(i8* %user_context, i8* %func_name, i32 %type_given_bits, i32 %correct_type_bits) local_unnamed_addr #4 {
entry:
  %type_given_bits.addr = alloca i32, align 4
  %correct_type_bits.addr = alloca i32, align 4
  %correct_type = alloca %struct.halide_type_t, align 2
  %type_given = alloca %struct.halide_type_t, align 2
  store i32 %type_given_bits, i32* %type_given_bits.addr, align 4, !tbaa !16
  store i32 %correct_type_bits, i32* %correct_type_bits.addr, align 4, !tbaa !16
  %0 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #11
  store i8 0, i8* %0, align 2, !tbaa !201
  %bits.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i64 0, i32 1
  store i8 0, i8* %bits.i, align 1, !tbaa !28
  %lanes.i = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %correct_type, i64 0, i32 2
  store i16 0, i16* %lanes.i, align 2, !tbaa !202
  %1 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #11
  store i8 0, i8* %1, align 2, !tbaa !201
  %bits.i8 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i64 0, i32 1
  store i8 0, i8* %bits.i8, align 1, !tbaa !28
  %lanes.i9 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %type_given, i64 0, i32 2
  store i16 0, i16* %lanes.i9, align 2, !tbaa !202
  %2 = bitcast i32* %correct_type_bits.addr to i8*
  %call = call i8* @memcpy(i8* nonnull %0, i8* nonnull %2, i64 4) #16
  %3 = bitcast i32* %type_given_bits.addr to i8*
  %call1 = call i8* @memcpy(i8* nonnull %1, i8* nonnull %3, i64 4) #16
  %call.i = call i8* @malloc(i64 1024) #16
  %tobool.not.i12 = icmp eq i8* %call.i, null
  br i1 %tobool.not.i12, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i151 = call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i152 = call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i151, %entry.split ], [ %call.i152, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i18 = call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.120, i64 0, i64 0)) #16
  %call.i21 = call i8* @halide_type_to_string(i8* %call.i18, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %correct_type) #16
  %call.i24 = call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.121, i64 0, i64 0)) #16
  %call.i27 = call i8* @halide_type_to_string(i8* %call.i24, i8* %ref.tmp.sroa.18.0, %struct.halide_type_t* nonnull %type_given) #16
  br i1 %tobool.not.i12, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i27 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  call void @free(i8* %call.i) #16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %user_context, i8* %func_name, i32 %dimensions_given, i32 %correct_dimensions) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.122, i64 0, i64 0)) #16
  %conv.i = sext i32 %correct_dimensions to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #16
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.123, i64 0, i64 0)) #16
  %conv.i20 = sext i32 %dimensions_given to i64
  %call.i21 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i64 %conv.i20, i32 1) #16
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.124, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i24 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %user_context, i8* %func_name, i32 %dimension, i32 %min_touched, i32 %max_touched, i32 %min_valid, i32 %max_valid) local_unnamed_addr #4 {
entry:
  %cmp = icmp slt i32 %min_touched, %min_valid
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i271 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i272 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then.split, %if.then6.i
  %phi.call = phi i8* [ %call.i271, %if.then.split ], [ %call.i272, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i30 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.125, i64 0, i64 0)) #16
  %conv.i = sext i32 %min_touched to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i30, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #16
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.126, i64 0, i64 0)) #16
  %conv.i39 = sext i32 %min_valid to i64
  %call.i40 = tail call i8* @halide_int64_to_string(i8* %call.i36, i8* %ref.tmp.sroa.22.0, i64 %conv.i39, i32 1) #16
  %call.i43 = tail call i8* @halide_string_to_string(i8* %call.i40, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.127, i64 0, i64 0)) #16
  %conv.i46 = sext i32 %dimension to i64
  %call.i47 = tail call i8* @halide_int64_to_string(i8* %call.i43, i8* %ref.tmp.sroa.22.0, i64 %conv.i46, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %if.end17.sink.split

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i47 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %if.end17.sink.split

if.else:                                          ; preds = %entry
  %cmp7 = icmp sgt i32 %max_touched, %max_valid
  br i1 %cmp7, label %if.then8, label %if.end17

if.then8:                                         ; preds = %if.else
  %call.i53 = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i56 = icmp eq i8* %call.i53, null
  br i1 %tobool.not.i56, label %if.then8.split, label %if.then6.i59

if.then8.split:                                   ; preds = %if.then8
  %call.i653 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

if.then6.i59:                                     ; preds = %if.then8
  %add.ptr.i57 = getelementptr inbounds i8, i8* %call.i53, i64 1023
  store i8 0, i8* %add.ptr.i57, align 1, !tbaa !38
  %call.i654 = tail call i8* @halide_string_to_string(i8* nonnull %call.i53, i8* nonnull %add.ptr.i57, i8* %func_name) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62: ; preds = %if.then8.split, %if.then6.i59
  %phi.call5 = phi i8* [ %call.i653, %if.then8.split ], [ %call.i654, %if.then6.i59 ]
  %ref.tmp9.sroa.22.0 = phi i8* [ null, %if.then8.split ], [ %add.ptr.i57, %if.then6.i59 ]
  %call.i68 = tail call i8* @halide_string_to_string(i8* %phi.call5, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.125, i64 0, i64 0)) #16
  %conv.i71 = sext i32 %max_touched to i64
  %call.i72 = tail call i8* @halide_int64_to_string(i8* %call.i68, i8* %ref.tmp9.sroa.22.0, i64 %conv.i71, i32 1) #16
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i72, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.128, i64 0, i64 0)) #16
  %conv.i78 = sext i32 %max_valid to i64
  %call.i79 = tail call i8* @halide_int64_to_string(i8* %call.i75, i8* %ref.tmp9.sroa.22.0, i64 %conv.i78, i32 1) #16
  %call.i82 = tail call i8* @halide_string_to_string(i8* %call.i79, i8* %ref.tmp9.sroa.22.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.127, i64 0, i64 0)) #16
  %conv.i85 = sext i32 %dimension to i64
  %call.i86 = tail call i8* @halide_int64_to_string(i8* %call.i82, i8* %ref.tmp9.sroa.22.0, i64 %conv.i85, i32 1) #16
  br i1 %tobool.not.i56, label %if.then.i90, label %if.else.i100

if.then.i90:                                      ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %if.end17.sink.split

if.else.i100:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit62
  %sub.ptr.lhs.cast.i.i95 = ptrtoint i8* %call.i86 to i64
  %sub.ptr.rhs.cast.i.i96 = ptrtoint i8* %call.i53 to i64
  %sub.ptr.sub.i.i97 = sub i64 1, %sub.ptr.rhs.cast.i.i96
  %add.i.i98 = add i64 %sub.ptr.sub.i.i97, %sub.ptr.lhs.cast.i.i95
  %call.i.i99 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i53, i64 %add.i.i98) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i53) #16
  br label %if.end17.sink.split

if.end17.sink.split:                              ; preds = %if.else.i100, %if.then.i90, %if.else.i, %if.then.i
  %call.i53.sink = phi i8* [ %call.i, %if.else.i ], [ null, %if.then.i ], [ %call.i53, %if.else.i100 ], [ null, %if.then.i90 ]
  tail call void @free(i8* %call.i53.sink) #16
  br label %if.end17

if.end17:                                         ; preds = %if.end17.sink.split, %if.else
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %user_context, i8* %buffer_name, i64 %allocation_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.129, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.129, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %allocation_size, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.131, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.132, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.132, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %buffer_name) #16
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.133, i64 0, i64 0)) #16
  %conv.i = sext i32 %dimension to i64
  %call.i18 = tail call i8* @halide_int64_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i64 %conv.i, i32 1) #16
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.134, i64 0, i64 0)) #16
  %conv.i24 = sext i32 %extent to i64
  %call.i25 = tail call i8* @halide_int64_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i64 %conv.i24, i32 1) #16
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.119, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i28 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %user_context, i8* %buffer_name, i64 %actual_size, i64 %max_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.135, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.135, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %buffer_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %actual_size, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.131, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_size, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %user_context, i8* %buffer_name, i32 %dimension, i32 %constrained_min, i32 %constrained_extent, i32 %required_min, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %add = add i32 %required_min, -1
  %sub = add i32 %add, %required_extent
  %add1 = add i32 %constrained_min, -1
  %sub2 = add i32 %add1, %constrained_extent
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i231 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.136, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i232 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.136, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i231, %entry.split ], [ %call.i232, %if.then6.i ]
  %ref.tmp.sroa.38.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i26 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.38.0, i8* %buffer_name) #16
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.137, i64 0, i64 0)) #16
  %conv.i = sext i32 %dimension to i64
  %call.i32 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.38.0, i64 %conv.i, i32 1) #16
  %call.i35 = tail call i8* @halide_string_to_string(i8* %call.i32, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.138, i64 0, i64 0)) #16
  %call.i38 = tail call i8* @halide_string_to_string(i8* %call.i35, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.139, i64 0, i64 0)) #16
  %conv.i41 = sext i32 %required_min to i64
  %call.i42 = tail call i8* @halide_int64_to_string(i8* %call.i38, i8* %ref.tmp.sroa.38.0, i64 %conv.i41, i32 1) #16
  %call.i45 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.117, i64 0, i64 0)) #16
  %conv.i48 = sext i32 %sub to i64
  %call.i49 = tail call i8* @halide_int64_to_string(i8* %call.i45, i8* %ref.tmp.sroa.38.0, i64 %conv.i48, i32 1) #16
  %call.i52 = tail call i8* @halide_string_to_string(i8* %call.i49, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.138, i64 0, i64 0)) #16
  %call.i55 = tail call i8* @halide_string_to_string(i8* %call.i52, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.140, i64 0, i64 0)) #16
  %conv.i58 = sext i32 %constrained_min to i64
  %call.i59 = tail call i8* @halide_int64_to_string(i8* %call.i55, i8* %ref.tmp.sroa.38.0, i64 %conv.i58, i32 1) #16
  %call.i62 = tail call i8* @halide_string_to_string(i8* %call.i59, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.117, i64 0, i64 0)) #16
  %conv.i65 = sext i32 %sub2 to i64
  %call.i66 = tail call i8* @halide_int64_to_string(i8* %call.i62, i8* %ref.tmp.sroa.38.0, i64 %conv.i65, i32 1) #16
  %call.i69 = tail call i8* @halide_string_to_string(i8* %call.i66, i8* %ref.tmp.sroa.38.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.141, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i69 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %user_context, i8* %var, i32 %val, i8* %constrained_var, i32 %constrained_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.142, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.142, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i8* %var) #16
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.143, i64 0, i64 0)) #16
  %conv.i = sext i32 %val to i64
  %call.i20 = tail call i8* @halide_int64_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #16
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.144, i64 0, i64 0)) #16
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %constrained_var) #16
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.143, i64 0, i64 0)) #16
  %conv.i32 = sext i32 %constrained_val to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #16
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.119, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i36 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.146, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.146, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %min_val, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %user_context, i8* %param_name, double %val, double %min_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.146, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %min_val, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_int64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %user_context, i8* %param_name, i64 %val, i64 %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_uint64_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i64 %val, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_uint64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %max_val, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %user_context, i8* %param_name, double %val, double %max_val) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.145, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %param_name) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.130, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_double_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, double %val, i32 1) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36, i64 0, i64 0)) #16
  %call.i23 = tail call i8* @halide_double_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, double %max_val, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -10
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_error_out_of_memory(i8* %user_context) local_unnamed_addr #0 {
entry:
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.37, i64 0, i64 0)) #16
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %user_context, i8* %buffer_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %buffer_name) #16
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %user_context, i8* %func, i8* %filename, i32 %error_code) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i81 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i82 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i81, %entry.split ], [ %call.i82, %if.then6.i ]
  %ref.tmp.sroa.20.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i11 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.20.0, i8* %func) #16
  %call.i14 = tail call i8* @halide_string_to_string(i8* %call.i11, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41.147, i64 0, i64 0)) #16
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.20.0, i8* %filename) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.20.0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42, i64 0, i64 0)) #16
  %conv.i = sext i32 %error_code to i64
  %call.i23 = tail call i8* @halide_int64_to_string(i8* %call.i20, i8* %ref.tmp.sroa.20.0, i64 %conv.i, i32 1) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i23 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %user_context, i8* %func, i32 %alignment) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i71 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i72 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i71, %entry.split ], [ %call.i72, %if.then6.i ]
  %ref.tmp.sroa.18.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i10 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.18.0, i8* %func) #16
  %call.i13 = tail call i8* @halide_string_to_string(i8* %call.i10, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i64 0, i64 0)) #16
  %conv.i = sext i32 %alignment to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %call.i13, i8* %ref.tmp.sroa.18.0, i64 %conv.i, i32 1) #16
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.18.0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.45, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i19 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_dirty_with_no_device_support(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %func) #16
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.47, i64 0, i64 0)) #16
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.48, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i15 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -44
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %user_context, i8* %func) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %func) #16
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %user_context, i8* %func_name, i8* %var_name, i8* %loop_name) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i91 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50.148, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i92 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50.148, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i91, %entry.split ], [ %call.i92, %if.then6.i ]
  %ref.tmp.sroa.22.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.22.0, i8* %var_name) #16
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %call.i18 = tail call i8* @halide_string_to_string(i8* %call.i15, i8* %ref.tmp.sroa.22.0, i8* %func_name) #16
  %call.i21 = tail call i8* @halide_string_to_string(i8* %call.i18, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i64 0, i64 0)) #16
  %call.i24 = tail call i8* @halide_string_to_string(i8* %call.i21, i8* %ref.tmp.sroa.22.0, i8* %loop_name) #16
  %call.i27 = tail call i8* @halide_string_to_string(i8* %call.i24, i8* %ref.tmp.sroa.22.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.141, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i27 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
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
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.split, label %if.then6.i

if.then.split:                                    ; preds = %if.then
  %call.i521 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %if.then
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i522 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %if.then.split, %if.then6.i
  %phi.call = phi i8* [ %call.i521, %if.then.split ], [ %call.i522, %if.then6.i ]
  %ref.tmp.sroa.36.0 = phi i8* [ null, %if.then.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %dim to i64
  %call.i55 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.36.0, i64 %conv.i, i32 1) #16
  %call.i58 = tail call i8* @halide_string_to_string(i8* %call.i55, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %call.i61 = tail call i8* @halide_string_to_string(i8* %call.i58, i8* %ref.tmp.sroa.36.0, i8* %func_name) #16
  %call.i64 = tail call i8* @halide_string_to_string(i8* %call.i61, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #16
  %conv.i67 = sext i32 %min to i64
  %call.i68 = tail call i8* @halide_int64_to_string(i8* %call.i64, i8* %ref.tmp.sroa.36.0, i64 %conv.i67, i32 1) #16
  %call.i71 = tail call i8* @halide_string_to_string(i8* %call.i68, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  %add9 = add nsw i32 %extent, %min
  %sub = add nsw i32 %add9, -1
  %conv.i74 = sext i32 %sub to i64
  %call.i75 = tail call i8* @halide_int64_to_string(i8* %call.i71, i8* %ref.tmp.sroa.36.0, i64 %conv.i74, i32 1) #16
  %call.i78 = tail call i8* @halide_string_to_string(i8* %call.i75, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #16
  %call.i81 = tail call i8* @halide_string_to_string(i8* %call.i78, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57, i64 0, i64 0)) #16
  %conv.i84 = sext i32 %valid_min to i64
  %call.i85 = tail call i8* @halide_int64_to_string(i8* %call.i81, i8* %ref.tmp.sroa.36.0, i64 %conv.i84, i32 1) #16
  %call.i88 = tail call i8* @halide_string_to_string(i8* %call.i85, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  %add15 = add nsw i32 %fold_factor, %valid_min
  %sub16 = add nsw i32 %add15, -1
  %conv.i91 = sext i32 %sub16 to i64
  %call.i92 = tail call i8* @halide_int64_to_string(i8* %call.i88, i8* %ref.tmp.sroa.36.0, i64 %conv.i91, i32 1) #16
  %call.i95 = tail call i8* @halide_string_to_string(i8* %call.i92, i8* %ref.tmp.sroa.36.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.149, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %if.end

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i95 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %call.i101 = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i104 = icmp eq i8* %call.i101, null
  br i1 %tobool.not.i104, label %if.else.split, label %if.then6.i107

if.else.split:                                    ; preds = %if.else
  %call.i1133 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

if.then6.i107:                                    ; preds = %if.else
  %add.ptr.i105 = getelementptr inbounds i8, i8* %call.i101, i64 1023
  store i8 0, i8* %add.ptr.i105, align 1, !tbaa !38
  %call.i1134 = tail call i8* @halide_string_to_string(i8* nonnull %call.i101, i8* nonnull %add.ptr.i105, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110: ; preds = %if.else.split, %if.then6.i107
  %phi.call5 = phi i8* [ %call.i1133, %if.else.split ], [ %call.i1134, %if.then6.i107 ]
  %ref.tmp19.sroa.34.0 = phi i8* [ null, %if.else.split ], [ %add.ptr.i105, %if.then6.i107 ]
  %conv.i116 = sext i32 %dim to i64
  %call.i117 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %ref.tmp19.sroa.34.0, i64 %conv.i116, i32 1) #16
  %call.i120 = tail call i8* @halide_string_to_string(i8* %call.i117, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %call.i123 = tail call i8* @halide_string_to_string(i8* %call.i120, i8* %ref.tmp19.sroa.34.0, i8* %func_name) #16
  %call.i126 = tail call i8* @halide_string_to_string(i8* %call.i123, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #16
  %conv.i129 = sext i32 %min to i64
  %call.i130 = tail call i8* @halide_int64_to_string(i8* %call.i126, i8* %ref.tmp19.sroa.34.0, i64 %conv.i129, i32 1) #16
  %call.i133 = tail call i8* @halide_string_to_string(i8* %call.i130, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  %sub28 = add nsw i32 %add, -1
  %conv.i136 = sext i32 %sub28 to i64
  %call.i137 = tail call i8* @halide_int64_to_string(i8* %call.i133, i8* %ref.tmp19.sroa.34.0, i64 %conv.i136, i32 1) #16
  %call.i140 = tail call i8* @halide_string_to_string(i8* %call.i137, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #16
  %call.i143 = tail call i8* @halide_string_to_string(i8* %call.i140, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.150, i64 0, i64 0)) #16
  %call.i146 = tail call i8* @halide_string_to_string(i8* %call.i143, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.151, i64 0, i64 0)) #16
  %conv.i149 = sext i32 %fold_factor to i64
  %call.i150 = tail call i8* @halide_int64_to_string(i8* %call.i146, i8* %ref.tmp19.sroa.34.0, i64 %conv.i149, i32 1) #16
  %call.i153 = tail call i8* @halide_string_to_string(i8* %call.i150, i8* %ref.tmp19.sroa.34.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.141, i64 0, i64 0)) #16
  br i1 %tobool.not.i104, label %if.then.i157, label %if.else.i167

if.then.i157:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %if.end

if.else.i167:                                     ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit110
  %sub.ptr.lhs.cast.i.i162 = ptrtoint i8* %call.i153 to i64
  %sub.ptr.rhs.cast.i.i163 = ptrtoint i8* %call.i101 to i64
  %sub.ptr.sub.i.i164 = sub i64 1, %sub.ptr.rhs.cast.i.i163
  %add.i.i165 = add i64 %sub.ptr.sub.i.i164, %sub.ptr.lhs.cast.i.i162
  %call.i.i166 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i101, i64 %add.i.i165) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i101) #16
  br label %if.end

if.end:                                           ; preds = %if.else.i167, %if.then.i157, %if.else.i, %if.then.i
  %call.i101.sink = phi i8* [ %call.i, %if.else.i ], [ null, %if.then.i ], [ %call.i101, %if.else.i167 ], [ null, %if.then.i157 ]
  tail call void @free(i8* %call.i101.sink) #16
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %fold_factor, i8* %loop_name, i32 %required_extent) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i131 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.152, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i132 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.152, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i131, %entry.split ], [ %call.i132, %if.then6.i ]
  %ref.tmp.sroa.30.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %fold_factor to i64
  %call.i16 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.30.0, i64 %conv.i, i32 1) #16
  %call.i19 = tail call i8* @halide_string_to_string(i8* %call.i16, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i64 0, i64 0)) #16
  %call.i22 = tail call i8* @halide_string_to_string(i8* %call.i19, i8* %ref.tmp.sroa.30.0, i8* %var_name) #16
  %call.i25 = tail call i8* @halide_string_to_string(i8* %call.i22, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %call.i28 = tail call i8* @halide_string_to_string(i8* %call.i25, i8* %ref.tmp.sroa.30.0, i8* %func_name) #16
  %call.i31 = tail call i8* @halide_string_to_string(i8* %call.i28, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i64 0, i64 0)) #16
  %call.i34 = tail call i8* @halide_string_to_string(i8* %call.i31, i8* %ref.tmp.sroa.30.0, i8* %loop_name) #16
  %call.i37 = tail call i8* @halide_string_to_string(i8* %call.i34, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.143, i64 0, i64 0)) #16
  %conv.i40 = sext i32 %required_extent to i64
  %call.i41 = tail call i8* @halide_int64_to_string(i8* %call.i37, i8* %ref.tmp.sroa.30.0, i64 %conv.i40, i32 1) #16
  %call.i44 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* %ref.tmp.sroa.30.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.153, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i44 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %user_context, i8* %condition, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i61 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i62 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i61, %entry.split ], [ %call.i62, %if.then6.i ]
  %ref.tmp.sroa.16.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i9 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.16.0, i8* %condition) #16
  %call.i12 = tail call i8* @halide_string_to_string(i8* %call.i9, i8* %ref.tmp.sroa.16.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0)) #16
  %call.i15 = tail call i8* @halide_string_to_string(i8* %call.i12, i8* %ref.tmp.sroa.16.0, i8* %message) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i15 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %user_context, i8* %message) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i41 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #16
  %call.i75 = tail call i8* @halide_string_to_string(i8* %call.i41, i8* null, i8* %message) #16
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i42 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #16
  %call.i7 = tail call i8* @halide_string_to_string(i8* %call.i42, i8* nonnull %add.ptr.i, i8* %message) #16
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i7 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #16
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #16
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i64 0, i64 0)) #16
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i64 0, i64 0)) #16
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #16
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #16
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %user_context, i8* %routine) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i51 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i52 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i51, %entry.split ], [ %call.i52, %if.then6.i ]
  %ref.tmp.sroa.14.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %call.i8 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %ref.tmp.sroa.14.0, i8* %routine) #16
  %call.i11 = tail call i8* @halide_string_to_string(i8* %call.i8, i8* %ref.tmp.sroa.14.0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i11 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -38
}

; Function Attrs: nounwind
define weak i32 @halide_error_storage_bound_too_small(i8* %user_context, i8* %func_name, i8* %var_name, i32 %provided_size, i32 %required_size) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %entry.split, label %if.then6.i

entry.split:                                      ; preds = %entry
  %call.i111 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

if.then6.i:                                       ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i112 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit: ; preds = %entry.split, %if.then6.i
  %phi.call = phi i8* [ %call.i111, %entry.split ], [ %call.i112, %if.then6.i ]
  %ref.tmp.sroa.26.0 = phi i8* [ null, %entry.split ], [ %add.ptr.i, %if.then6.i ]
  %conv.i = sext i32 %provided_size to i64
  %call.i14 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %ref.tmp.sroa.26.0, i64 %conv.i, i32 1) #16
  %call.i17 = tail call i8* @halide_string_to_string(i8* %call.i14, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i64 0, i64 0)) #16
  %call.i20 = tail call i8* @halide_string_to_string(i8* %call.i17, i8* %ref.tmp.sroa.26.0, i8* %var_name) #16
  %call.i23 = tail call i8* @halide_string_to_string(i8* %call.i20, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %call.i26 = tail call i8* @halide_string_to_string(i8* %call.i23, i8* %ref.tmp.sroa.26.0, i8* %func_name) #16
  %call.i29 = tail call i8* @halide_string_to_string(i8* %call.i26, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.74, i64 0, i64 0)) #16
  %conv.i32 = sext i32 %required_size to i64
  %call.i33 = tail call i8* @halide_int64_to_string(i8* %call.i29, i8* %ref.tmp.sroa.26.0, i64 %conv.i32, i32 1) #16
  %call.i36 = tail call i8* @halide_string_to_string(i8* %call.i33, i8* %ref.tmp.sroa.26.0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.153, i64 0, i64 0)) #16
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EEC2EPvPc.exit
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i36 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
  ret i32 -45
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_crop_failed(i8* %user_context) local_unnamed_addr #4 {
entry:
  %call.i = tail call i8* @malloc(i64 1024) #16
  %tobool.not.i = icmp eq i8* %call.i, null
  br i1 %tobool.not.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  %call.i316 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i64 0, i64 0)) #16
  tail call void @halide_error(i8* %user_context, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.76, i64 0, i64 0)) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

if.else.i:                                        ; preds = %entry
  %add.ptr.i = getelementptr inbounds i8, i8* %call.i, i64 1023
  store i8 0, i8* %add.ptr.i, align 1, !tbaa !38
  %call.i3 = tail call i8* @halide_string_to_string(i8* nonnull %call.i, i8* nonnull %add.ptr.i, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.75, i64 0, i64 0)) #16
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %call.i3 to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %call.i to i64
  %sub.ptr.sub.i.i = sub i64 1, %sub.ptr.rhs.cast.i.i
  %add.i.i = add i64 %sub.ptr.sub.i.i, %sub.ptr.lhs.cast.i.i
  %call.i.i = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %user_context, i8* nonnull %call.i, i64 %add.i.i) #16
  tail call void @halide_error(i8* %user_context, i8* nonnull %call.i) #16
  br label %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit

_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILNS1_11PrinterTypeE1ELy1024EED2Ev.exit: ; preds = %if.else.i, %if.then.i
  tail call void @free(i8* %call.i) #16
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
define weak i32 @halide_default_can_use_target_features(i32 %count, i64* %features) #4 {
entry:
  %tmp = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #16
  %0 = load i8, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18, !range !21
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #11
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %tmp) #16
  %call = call i8* @memcpy(i8* bitcast ([4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE to i8*), i8* nonnull %1, i64 32) #16
  store i8 1, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #16
  %cmp.not = icmp eq i32 %count, 2
  br i1 %cmp.not, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.166, i64 0, i64 0)) #16
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %2 = load i64, i64* %features, align 8, !tbaa !59
  %3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 0), align 8, !tbaa !59
  %and = and i64 %3, %2
  %cmp6.not = icmp eq i64 %and, 0
  br i1 %cmp6.not, label %for.inc.critedge, label %if.then7

if.then7:                                         ; preds = %if.end2
  %4 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 2), align 8, !tbaa !59
  %and10 = and i64 %4, %and
  %cmp11.not = icmp eq i64 %and10, %and
  br i1 %cmp11.not, label %for.inc.critedge, label %cleanup15

for.inc.critedge:                                 ; preds = %if.then7, %if.end2
  %arrayidx.1 = getelementptr inbounds i64, i64* %features, i64 1
  %5 = load i64, i64* %arrayidx.1, align 8, !tbaa !59
  %6 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 1), align 8, !tbaa !59
  %and.1 = and i64 %6, %5
  %cmp6.not.1 = icmp eq i64 %and.1, 0
  br i1 %cmp6.not.1, label %for.inc.critedge.1, label %if.then7.1

cleanup15:                                        ; preds = %for.inc.critedge.1, %if.then7.1, %if.then7
  %cmp3.lcssa = phi i32 [ 0, %if.then7 ], [ 0, %if.then7.1 ], [ 1, %for.inc.critedge.1 ]
  ret i32 %cmp3.lcssa

if.then7.1:                                       ; preds = %for.inc.critedge
  %7 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 3), align 8, !tbaa !59
  %and10.1 = and i64 %7, %and.1
  %cmp11.not.1 = icmp eq i64 %and10.1, %and.1
  br i1 %cmp11.not.1, label %for.inc.critedge.1, label %cleanup15

for.inc.critedge.1:                               ; preds = %if.then7.1, %for.inc.critedge
  br label %cleanup15
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i32, i64*)* @halide_set_custom_can_use_target_features(i32 (i32, i64*)* %fn) local_unnamed_addr #2 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !12
  store i32 (i32, i64*)* %fn, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !12
  ret i32 (i32, i64*)* %0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_can_use_target_features(i32 %count, i64* %features) local_unnamed_addr #0 {
entry:
  %0 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !12
  %call = tail call i32 %0(i32 %count, i64* %features) #16
  ret i32 %call
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* noalias sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %agg.result) local_unnamed_addr #9 {
entry:
  %info = alloca [4 x i32], align 4
  %info2 = alloca [4 x i32], align 4
  %info3 = alloca [4 x i32], align 4
  %arrayidx3.i = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result, i64 0, i32 1, i64 0
  %0 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %agg.result to <4 x i64>*
  store <4 x i64> <i64 34084860461808, i64 0, i64 0, i64 0>, <4 x i64>* %0, align 8, !tbaa !59
  %1 = bitcast [4 x i32]* %info to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1) #11
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %info, i64 0, i64 0
  store i32 1, i32* %arraydecay, align 4, !tbaa !16
  %arrayidx1.i110 = getelementptr inbounds [4 x i32], [4 x i32]* %info, i64 0, i64 1
  store i32 0, i32* %arrayidx1.i110, align 4, !tbaa !16
  call void asm sideeffect inteldialect "xchg rbx, rsi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg rbx, rsi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %arraydecay) #11
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %info, i64 0, i64 2
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !16
  %and = lshr i32 %2, 15
  %3 = and i32 %and, 16
  %and2 = lshr i32 %2, 23
  %4 = and i32 %and2, 32
  %5 = or i32 %4, %3
  %and6 = lshr i32 %2, 20
  %6 = and i32 %and6, 512
  %7 = or i32 %5, %6
  %and14 = lshr i32 %2, 5
  %8 = and i32 %and14, 128
  %9 = or i32 %7, %8
  %10 = zext i32 %9 to i64
  %11 = and i32 %2, 805834752
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %14, label %13

13:                                               ; preds = %entry
  store i64 %10, i64* %arrayidx3.i, align 8, !tbaa !59
  br label %14

14:                                               ; preds = %13, %entry
  %15 = and i32 %2, 1879048192
  %.not = icmp eq i32 %15, 1879048192
  br i1 %.not, label %if.then30, label %if.end67

if.then30:                                        ; preds = %14
  %16 = bitcast [4 x i32]* %info2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %16) #11
  %arraydecay31 = getelementptr inbounds [4 x i32], [4 x i32]* %info2, i64 0, i64 0
  store i32 7, i32* %arraydecay31, align 4, !tbaa !16
  %arrayidx1.i99 = getelementptr inbounds [4 x i32], [4 x i32]* %info2, i64 0, i64 1
  store i32 0, i32* %arrayidx1.i99, align 4, !tbaa !16
  call void asm sideeffect inteldialect "xchg rbx, rsi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg rbx, rsi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %arraydecay31) #11
  %17 = load i32, i32* %arrayidx1.i99, align 4, !tbaa !16
  %and33 = and i32 %17, 32
  %cmp34.not = icmp eq i32 %and33, 0
  br i1 %cmp34.not, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.then30
  %or.i98 = or i64 %10, 64
  store i64 %or.i98, i64* %arrayidx3.i, align 8, !tbaa !59
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.then30
  %18 = phi i64 [ %or.i98, %if.then35 ], [ %10, %if.then30 ]
  %and38 = and i32 %17, 268500992
  %cmp39 = icmp eq i32 %and38, 268500992
  br i1 %cmp39, label %if.then40, label %if.end66

if.then40:                                        ; preds = %if.end36
  %and42 = and i32 %17, 469827584
  %cmp43 = icmp eq i32 %and42, 469827584
  %spec.select.v = select i1 %cmp43, i64 3298534883328, i64 1099511627776
  %spec.select = or i64 %18, %spec.select.v
  %and47 = and i32 %17, -805109760
  %cmp48 = icmp eq i32 %and47, -805109760
  %or.i92 = or i64 %spec.select, 4398046511104
  %spec.select130 = select i1 %cmp48, i64 %or.i92, i64 %spec.select
  store i64 %spec.select130, i64* %arrayidx3.i, align 8, !tbaa !59
  %and52 = and i32 %17, -803012608
  %cmp53 = icmp eq i32 %and52, -803012608
  br i1 %cmp53, label %if.then54, label %if.end66

if.then54:                                        ; preds = %if.then40
  %or.i90 = or i64 %spec.select130, 8796093022208
  store i64 %or.i90, i64* %arrayidx3.i, align 8, !tbaa !59
  %19 = bitcast [4 x i32]* %info3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %19) #11
  %arraydecay55 = getelementptr inbounds [4 x i32], [4 x i32]* %info3, i64 0, i64 0
  store i32 7, i32* %arraydecay55, align 4, !tbaa !16
  %arrayidx1.i = getelementptr inbounds [4 x i32], [4 x i32]* %info3, i64 0, i64 1
  store i32 1, i32* %arrayidx1.i, align 4, !tbaa !16
  call void asm sideeffect inteldialect "xchg rbx, rsi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg rbx, rsi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %arraydecay55) #11
  %arrayidx56 = getelementptr inbounds [4 x i32], [4 x i32]* %info2, i64 0, i64 2
  %20 = load i32, i32* %arrayidx56, align 4, !tbaa !16
  %and57 = and i32 %20, 2048
  %cmp58.not = icmp eq i32 %and57, 0
  br i1 %cmp58.not, label %if.end64, label %land.lhs.true59

land.lhs.true59:                                  ; preds = %if.then54
  %21 = load i32, i32* %arraydecay55, align 4, !tbaa !16
  %and61 = and i32 %21, 32
  %cmp62.not = icmp eq i32 %and61, 0
  br i1 %cmp62.not, label %if.end64, label %if.then63

if.then63:                                        ; preds = %land.lhs.true59
  %or.i = or i64 %spec.select130, 26388279066624
  store i64 %or.i, i64* %arrayidx3.i, align 8, !tbaa !59
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %land.lhs.true59, %if.then54
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #11
  br label %if.end66

if.end66:                                         ; preds = %if.end64, %if.then40, %if.end36
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %16) #11
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %14
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #11
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

; Function Attrs: nounwind
define i32 @gaussian5x5_par_for_output_s0_y_y(i8* %__user_context, i32 %output.s0.y.y, i8* readonly %closure_arg) #10 {
if.end.i:
  %rows148 = alloca [144 x i16], align 64
  %0 = bitcast i8* %closure_arg to i8**
  %input = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds i8, i8* %closure_arg, i64 8
  %2 = bitcast i8* %1 to i8**
  %output = load i8*, i8** %2, align 8
  %3 = getelementptr inbounds i8, i8* %closure_arg, i64 16
  %4 = bitcast i8* %3 to i32*
  %input.extent.1 = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %closure_arg, i64 20
  %6 = bitcast i8* %5 to i32*
  %input.min.0 = load i32, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %closure_arg, i64 24
  %8 = bitcast i8* %7 to i32*
  %a26 = load i32, i32* %8, align 4
  %9 = getelementptr inbounds i8, i8* %closure_arg, i64 28
  %10 = bitcast i8* %9 to i32*
  %input.stride.1 = load i32, i32* %10, align 4
  %11 = getelementptr inbounds i8, i8* %closure_arg, i64 32
  %12 = bitcast i8* %11 to i32*
  %output.extent.0 = load i32, i32* %12, align 4
  %13 = getelementptr inbounds i8, i8* %closure_arg, i64 36
  %14 = bitcast i8* %13 to i32*
  %output.extent.1 = load i32, i32* %14, align 4
  %15 = getelementptr inbounds i8, i8* %closure_arg, i64 40
  %16 = bitcast i8* %15 to i32*
  %output.min.1 = load i32, i32* %16, align 4
  %17 = getelementptr inbounds i8, i8* %closure_arg, i64 44
  %18 = bitcast i8* %17 to i32*
  %output.stride.1 = load i32, i32* %18, align 4
  %19 = getelementptr inbounds i8, i8* %closure_arg, i64 48
  %20 = bitcast i8* %19 to i32*
  %a2 = load i32, i32* %20, align 4
  %21 = getelementptr inbounds i8, i8* %closure_arg, i64 52
  %22 = bitcast i8* %21 to i32*
  %t282 = load i32, i32* %22, align 4
  %23 = getelementptr inbounds i8, i8* %closure_arg, i64 56
  %24 = bitcast i8* %23 to i32*
  %a24 = load i32, i32* %24, align 4
  %25 = getelementptr inbounds i8, i8* %closure_arg, i64 60
  %26 = bitcast i8* %25 to i32*
  %t287 = load i32, i32* %26, align 4
  %27 = getelementptr inbounds i8, i8* %closure_arg, i64 64
  %28 = bitcast i8* %27 to i32*
  %t288 = load i32, i32* %28, align 4
  %29 = getelementptr inbounds i8, i8* %closure_arg, i64 68
  %30 = bitcast i8* %29 to i32*
  %t290 = load i32, i32* %30, align 4
  %31 = getelementptr inbounds i8, i8* %closure_arg, i64 72
  %32 = bitcast i8* %31 to i32*
  %t291 = load i32, i32* %32, align 4
  %33 = getelementptr inbounds i8, i8* %closure_arg, i64 76
  %34 = bitcast i8* %33 to i32*
  %t292 = load i32, i32* %34, align 4
  %35 = getelementptr inbounds i8, i8* %closure_arg, i64 80
  %36 = bitcast i8* %35 to i32*
  %t293 = load i32, i32* %36, align 4
  %37 = getelementptr inbounds i8, i8* %closure_arg, i64 84
  %38 = bitcast i8* %37 to i32*
  %t295 = load i32, i32* %38, align 4
  %39 = getelementptr inbounds i8, i8* %closure_arg, i64 88
  %40 = bitcast i8* %39 to i32*
  %t296 = load i32, i32* %40, align 4
  %a0 = mul nsw i32 %output.s0.y.y, 36
  %b2 = add nsw i32 %output.extent.1, -36
  %41 = icmp sgt i32 %b2, %a0
  %output.s0.y.yi.base.s = select i1 %41, i32 %a0, i32 %b2
  %42 = icmp sgt i32 %a2, -32
  %t335 = select i1 %42, i32 %a2, i32 -32
  %43 = add nsw i32 %t335, 32
  %44 = zext i32 %43 to i64
  %45 = shl nuw nsw i64 %44, 4
  %46 = or i64 %45, 3
  %cmp7.i = icmp ugt i64 %46, 16384
  br i1 %cmp7.i, label %pseudostack_alloc.exit, label %then_bb

pseudostack_alloc.exit:                           ; preds = %if.end.i
  %call.i = tail call i8* @halide_malloc(i8* %__user_context, i64 %46) #16
  %.not = icmp eq i8* %call.i, null
  br i1 %.not, label %then_bb, label %after_bb, !prof !234

after_bb:                                         ; preds = %then_bb, %pseudostack_alloc.exit
  %repeat_edge = phi i8* [ %73, %then_bb ], [ %call.i, %pseudostack_alloc.exit ]
  %47 = sub i32 %a26, %output.min.1
  %t299 = sub i32 %47, %output.s0.y.yi.base.s
  %b36 = sub nsw i32 %a24, %output.s0.y.yi.base.s
  %t300 = add nsw i32 %output.s0.y.yi.base.s, %output.min.1
  %b12 = add nsw i32 %a26, %input.extent.1
  %48 = add nsw i32 %a2, 32
  %b20 = add nsw i32 %input.extent.1, 6
  %49 = icmp sgt i32 %t295, 0
  %b21 = add nsw i32 %t292, 100
  %50 = add nsw i32 %t291, -1
  %51 = insertelement <32 x i32> undef, i32 %50, i32 0
  %52 = shufflevector <32 x i32> %51, <32 x i32> undef, <16 x i32> zeroinitializer
  %53 = insertelement <32 x i32> undef, i32 %input.min.0, i32 0
  %54 = shufflevector <32 x i32> %53, <32 x i32> undef, <16 x i32> zeroinitializer
  %t314 = sub nsw i32 %t295, %t287
  %55 = icmp sgt i32 %t296, 0
  %t320 = sub nsw i32 %t287, %t296
  %56 = icmp sgt i32 %t320, 0
  %57 = icmp sgt i32 %t314, 0
  %58 = add i32 %output.min.1, -7
  %b39 = add nsw i32 %input.extent.1, -1
  %59 = icmp sgt i32 %t288, 0
  %b43 = add nsw i32 %output.extent.0, -128
  %60 = sext i32 %a2 to i64
  %61 = add nsw i64 %60, 32
  %62 = sext i32 %output.stride.1 to i64
  %63 = zext i32 %t320 to i64
  %64 = sext i32 %input.stride.1 to i64
  %65 = sext i32 %input.min.0 to i64
  %66 = sext i32 %t300 to i64
  %67 = getelementptr inbounds i8, i8* %input, i64 -130
  %rows148.0.rows148.0..sroa_cast437 = bitcast [144 x i16]* %rows148 to <16 x i16>*
  %rows148.32.rows148.32..sroa_idx448 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 16
  %rows148.32.rows148.32..sroa_cast449 = bitcast i16* %rows148.32.rows148.32..sroa_idx448 to <16 x i16>*
  %rows148.64.rows148.64..sroa_idx460 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 32
  %rows148.64.rows148.64..sroa_cast461 = bitcast i16* %rows148.64.rows148.64..sroa_idx460 to <16 x i16>*
  %rows148.96.rows148.96..sroa_idx472 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 48
  %rows148.96.rows148.96..sroa_cast473 = bitcast i16* %rows148.96.rows148.96..sroa_idx472 to <16 x i16>*
  %rows148.128.rows148.128..sroa_idx484 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 64
  %rows148.128.rows148.128..sroa_cast485 = bitcast i16* %rows148.128.rows148.128..sroa_idx484 to <16 x i16>*
  %rows148.160.rows148.160..sroa_idx496 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 80
  %rows148.160.rows148.160..sroa_cast497 = bitcast i16* %rows148.160.rows148.160..sroa_idx496 to <16 x i16>*
  %rows148.192.rows148.192..sroa_idx508 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 96
  %rows148.192.rows148.192..sroa_cast509 = bitcast i16* %rows148.192.rows148.192..sroa_idx508 to <16 x i16>*
  %rows148.224.rows148.224..sroa_idx520 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 112
  %rows148.224.rows148.224..sroa_cast521 = bitcast i16* %rows148.224.rows148.224..sroa_idx520 to <16 x i16>*
  %rows148.256.rows148.256..sroa_idx530 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 128
  %rows148.256.rows148.256..sroa_cast531 = bitcast i16* %rows148.256.rows148.256..sroa_idx530 to <16 x i16>*
  %rows148.2.rows148.2..sroa_idx438 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 1
  %rows148.2.rows148.2..sroa_cast439 = bitcast i16* %rows148.2.rows148.2..sroa_idx438 to <16 x i16>*
  %rows148.4.rows148.4..sroa_idx440 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 2
  %rows148.4.rows148.4..sroa_cast441 = bitcast i16* %rows148.4.rows148.4..sroa_idx440 to <16 x i16>*
  %rows148.8.rows148.8..sroa_idx444 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 4
  %rows148.8.rows148.8..sroa_cast445 = bitcast i16* %rows148.8.rows148.8..sroa_idx444 to <16 x i16>*
  %rows148.6.rows148.6..sroa_idx442 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 3
  %rows148.6.rows148.6..sroa_cast443 = bitcast i16* %rows148.6.rows148.6..sroa_idx442 to <16 x i16>*
  %rows148.34.rows148.34..sroa_idx450 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 17
  %rows148.34.rows148.34..sroa_cast451 = bitcast i16* %rows148.34.rows148.34..sroa_idx450 to <16 x i16>*
  %rows148.36.rows148.36..sroa_idx452 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 18
  %rows148.36.rows148.36..sroa_cast453 = bitcast i16* %rows148.36.rows148.36..sroa_idx452 to <16 x i16>*
  %rows148.40.rows148.40..sroa_idx456 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 20
  %rows148.40.rows148.40..sroa_cast457 = bitcast i16* %rows148.40.rows148.40..sroa_idx456 to <16 x i16>*
  %rows148.38.rows148.38..sroa_idx454 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 19
  %rows148.38.rows148.38..sroa_cast455 = bitcast i16* %rows148.38.rows148.38..sroa_idx454 to <16 x i16>*
  %rows148.66.rows148.66..sroa_idx462 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 33
  %rows148.66.rows148.66..sroa_cast463 = bitcast i16* %rows148.66.rows148.66..sroa_idx462 to <16 x i16>*
  %rows148.68.rows148.68..sroa_idx464 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 34
  %rows148.68.rows148.68..sroa_cast465 = bitcast i16* %rows148.68.rows148.68..sroa_idx464 to <16 x i16>*
  %rows148.72.rows148.72..sroa_idx468 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 36
  %rows148.72.rows148.72..sroa_cast469 = bitcast i16* %rows148.72.rows148.72..sroa_idx468 to <16 x i16>*
  %rows148.70.rows148.70..sroa_idx466 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 35
  %rows148.70.rows148.70..sroa_cast467 = bitcast i16* %rows148.70.rows148.70..sroa_idx466 to <16 x i16>*
  %rows148.98.rows148.98..sroa_idx474 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 49
  %rows148.98.rows148.98..sroa_cast475 = bitcast i16* %rows148.98.rows148.98..sroa_idx474 to <16 x i16>*
  %rows148.100.rows148.100..sroa_idx476 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 50
  %rows148.100.rows148.100..sroa_cast477 = bitcast i16* %rows148.100.rows148.100..sroa_idx476 to <16 x i16>*
  %rows148.104.rows148.104..sroa_idx480 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 52
  %rows148.104.rows148.104..sroa_cast481 = bitcast i16* %rows148.104.rows148.104..sroa_idx480 to <16 x i16>*
  %rows148.102.rows148.102..sroa_idx478 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 51
  %rows148.102.rows148.102..sroa_cast479 = bitcast i16* %rows148.102.rows148.102..sroa_idx478 to <16 x i16>*
  %rows148.130.rows148.130..sroa_idx486 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 65
  %rows148.130.rows148.130..sroa_cast487 = bitcast i16* %rows148.130.rows148.130..sroa_idx486 to <16 x i16>*
  %rows148.132.rows148.132..sroa_idx488 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 66
  %rows148.132.rows148.132..sroa_cast489 = bitcast i16* %rows148.132.rows148.132..sroa_idx488 to <16 x i16>*
  %rows148.136.rows148.136..sroa_idx492 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 68
  %rows148.136.rows148.136..sroa_cast493 = bitcast i16* %rows148.136.rows148.136..sroa_idx492 to <16 x i16>*
  %rows148.134.rows148.134..sroa_idx490 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 67
  %rows148.134.rows148.134..sroa_cast491 = bitcast i16* %rows148.134.rows148.134..sroa_idx490 to <16 x i16>*
  %rows148.162.rows148.162..sroa_idx498 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 81
  %rows148.162.rows148.162..sroa_cast499 = bitcast i16* %rows148.162.rows148.162..sroa_idx498 to <16 x i16>*
  %rows148.164.rows148.164..sroa_idx500 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 82
  %rows148.164.rows148.164..sroa_cast501 = bitcast i16* %rows148.164.rows148.164..sroa_idx500 to <16 x i16>*
  %rows148.168.rows148.168..sroa_idx504 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 84
  %rows148.168.rows148.168..sroa_cast505 = bitcast i16* %rows148.168.rows148.168..sroa_idx504 to <16 x i16>*
  %rows148.166.rows148.166..sroa_idx502 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 83
  %rows148.166.rows148.166..sroa_cast503 = bitcast i16* %rows148.166.rows148.166..sroa_idx502 to <16 x i16>*
  %rows148.194.rows148.194..sroa_idx510 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 97
  %rows148.194.rows148.194..sroa_cast511 = bitcast i16* %rows148.194.rows148.194..sroa_idx510 to <16 x i16>*
  %rows148.196.rows148.196..sroa_idx512 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 98
  %rows148.196.rows148.196..sroa_cast513 = bitcast i16* %rows148.196.rows148.196..sroa_idx512 to <16 x i16>*
  %rows148.200.rows148.200..sroa_idx516 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 100
  %rows148.200.rows148.200..sroa_cast517 = bitcast i16* %rows148.200.rows148.200..sroa_idx516 to <16 x i16>*
  %rows148.198.rows148.198..sroa_idx514 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 99
  %rows148.198.rows148.198..sroa_cast515 = bitcast i16* %rows148.198.rows148.198..sroa_idx514 to <16 x i16>*
  %rows148.226.rows148.226..sroa_idx522 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 113
  %rows148.226.rows148.226..sroa_cast523 = bitcast i16* %rows148.226.rows148.226..sroa_idx522 to <16 x i16>*
  %rows148.228.rows148.228..sroa_idx524 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 114
  %rows148.228.rows148.228..sroa_cast525 = bitcast i16* %rows148.228.rows148.228..sroa_idx524 to <16 x i16>*
  %rows148.232.rows148.232..sroa_idx528 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 116
  %rows148.232.rows148.232..sroa_cast529 = bitcast i16* %rows148.232.rows148.232..sroa_idx528 to <16 x i16>*
  %rows148.230.rows148.230..sroa_idx526 = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 115
  %rows148.230.rows148.230..sroa_cast527 = bitcast i16* %rows148.230.rows148.230..sroa_idx526 to <16 x i16>*
  %68 = add nsw i64 %63, -1
  %xtraiter = and i64 %63, 3
  %69 = icmp ult i64 %68, 3
  %unroll_iter = and i64 %63, 4294967292
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %70 = insertelement <4 x i64> poison, i64 %61, i32 0
  %71 = shufflevector <4 x i64> %70, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %"for output.s0.y.yi.yi.$n.rebased"

then_bb:                                          ; preds = %if.end.i, %pseudostack_alloc.exit
  %72 = alloca i8*, i64 %46, align 64
  %73 = bitcast i8** %72 to i8*
  br label %after_bb

"for output.s0.y.yi.yi.$n.rebased":               ; preds = %after_bb, %after_bb20
  %indvars.iv416 = phi i64 [ 0, %after_bb ], [ %indvars.iv.next417, %after_bb20 ]
  %74 = mul nuw nsw i64 %indvars.iv416, 9
  %75 = trunc i64 %74 to i32
  %76 = icmp ugt i64 %74, 5
  %77 = select i1 %76, i64 %74, i64 5
  %78 = trunc i64 %77 to i32
  %t333 = add nsw i32 %t300, %78
  %a6 = add nsw i32 %t333, -7
  %79 = icmp sgt i32 %a6, %a26
  %a5 = select i1 %79, i32 %a6, i32 %a26
  %80 = icmp ult i64 %74, 5
  %81 = select i1 %80, i64 %74, i64 5
  %82 = trunc i64 %81 to i32
  %83 = add nsw i32 %82, -3
  %b7 = add i32 %83, %t333
  %84 = icmp sgt i32 %b7, %a5
  %repeat_edge.s0._1.prologue = select i1 %84, i32 %a5, i32 %b7
  %85 = icmp sgt i32 %a5, %b12
  %a9 = select i1 %85, i32 %a5, i32 %b12
  %86 = icmp sgt i32 %b7, %a9
  %repeat_edge.s0._1.epilogue = select i1 %86, i32 %a9, i32 %b7
  %a16 = sub i32 %t299, %78
  %87 = icmp sgt i32 %a16, -7
  %88 = select i1 %87, i32 %a16, i32 -7
  %a15 = add nsw i32 %88, 3
  %89 = sext i32 %a15 to i64
  %90 = icmp sgt i64 %74, %89
  %a14 = select i1 %90, i32 %a15, i32 %75
  %91 = icmp slt i32 %a14, 5
  %t305 = select i1 %91, i32 %a14, i32 5
  %92 = icmp sgt i32 %t305, -4
  br i1 %92, label %"for repeat_edge.s0._1.rebased.preheader", label %"end for repeat_edge.s0._1.rebased", !prof !235

"for repeat_edge.s0._1.rebased.preheader":        ; preds = %"for output.s0.y.yi.yi.$n.rebased"
  %93 = add i32 %t333, 9
  %94 = sub nsw i32 %t333, %a26
  %95 = add nsw i32 %t305, 3
  br label %"for repeat_edge.s0._1.rebased"

"end for output.s0.y.yi.yi.$n.rebased":           ; preds = %after_bb20
  %input29 = load i8*, i8** %0, align 8
  %output30 = load i8*, i8** %2, align 8
  %input.extent.131 = load i32, i32* %4, align 4
  %input.min.032 = load i32, i32* %6, align 4
  %a68 = load i32, i32* %8, align 4
  %input.stride.133 = load i32, i32* %10, align 4
  %output.extent.034 = load i32, i32* %12, align 4
  %output.extent.135 = load i32, i32* %14, align 4
  %output.min.136 = load i32, i32* %16, align 4
  %output.stride.137 = load i32, i32* %18, align 4
  %a44 = load i32, i32* %20, align 4
  %t28238 = load i32, i32* %22, align 4
  %a66 = load i32, i32* %24, align 4
  %t28739 = load i32, i32* %26, align 4
  %t28840 = load i32, i32* %28, align 4
  %t29041 = load i32, i32* %30, align 4
  %t29142 = load i32, i32* %32, align 4
  %t29243 = load i32, i32* %34, align 4
  %t29344 = load i32, i32* %36, align 4
  %t29545 = load i32, i32* %38, align 4
  %t29646 = load i32, i32* %40, align 4
  %b44 = add nsw i32 %output.extent.135, -36
  %96 = icmp sgt i32 %b44, %a0
  %output.s0.y.yi.base.s47 = select i1 %96, i32 %a0, i32 %b44
  %97 = icmp sgt i32 %a44, -32
  %t721 = select i1 %97, i32 %a44, i32 -32
  %98 = add nsw i32 %t721, 32
  %99 = zext i32 %98 to i64
  %100 = shl nuw nsw i64 %99, 4
  %101 = or i64 %100, 3
  %cmp.i176 = icmp ult i64 %46, %101
  br i1 %cmp.i176, label %if.then.i179, label %pseudostack_alloc.exit192, !prof !236

if.then.i179:                                     ; preds = %"end for output.s0.y.yi.yi.$n.rebased"
  %tobool1.not.i178 = icmp ne i8* %repeat_edge, null
  %or.cond405 = and i1 %tobool1.not.i178, %cmp7.i
  br i1 %or.cond405, label %if.then3.i183, label %if.end.i187

if.then3.i183:                                    ; preds = %if.then.i179
  call void @halide_free(i8* %__user_context, i8* nonnull %repeat_edge) #16
  br label %if.end.i187

if.end.i187:                                      ; preds = %if.then3.i183, %if.then.i179
  %add.i185 = add nuw nsw i64 %46, %101
  %cmp7.i186 = icmp ugt i64 %add.i185, 16384
  br i1 %cmp7.i186, label %if.then8.i189, label %then_bb49

if.then8.i189:                                    ; preds = %if.end.i187
  %call.i188 = call i8* @halide_malloc(i8* %__user_context, i64 %101) #16
  br label %pseudostack_alloc.exit192

pseudostack_alloc.exit192:                        ; preds = %if.then8.i189, %"end for output.s0.y.yi.yi.$n.rebased"
  %repeat_edge.pseudostack_slot.sroa.15.0 = phi i64 [ %46, %"end for output.s0.y.yi.yi.$n.rebased" ], [ %add.i185, %if.then8.i189 ]
  %102 = phi i8* [ %repeat_edge, %"end for output.s0.y.yi.yi.$n.rebased" ], [ %call.i188, %if.then8.i189 ]
  %.not151 = icmp eq i8* %102, null
  br i1 %.not151, label %then_bb49, label %after_bb48, !prof !234

"for repeat_edge.s0._1.rebased":                  ; preds = %"for repeat_edge.s0._1.rebased.preheader", %"end for repeat_edge.s0._0._0"
  %repeat_edge.s0._1.rebased = phi i32 [ %309, %"end for repeat_edge.s0._0._0" ], [ 0, %"for repeat_edge.s0._1.rebased.preheader" ]
  %a18 = add nsw i32 %repeat_edge.s0._1.rebased, %94
  %103 = icmp sgt i32 %b20, %a18
  %a17 = select i1 %103, i32 %a18, i32 %b20
  br i1 %49, label %"for repeat_edge.s0._0._0.preheader", label %"end for repeat_edge.s0._0._0", !prof !235

"for repeat_edge.s0._0._0.preheader":             ; preds = %"for repeat_edge.s0._1.rebased"
  %104 = icmp sgt i32 %a17, 7
  %105 = select i1 %104, i32 %a17, i32 7
  %106 = add nsw i32 %105, -7
  %107 = mul nsw i32 %106, %input.stride.1
  %t309 = sub nsw i32 %107, %input.min.0
  %108 = add i32 %93, %repeat_edge.s0._1.rebased
  %109 = and i32 %108, 15
  %110 = mul nsw i32 %109, %48
  %t310 = sub nsw i32 %110, %t282
  %111 = insertelement <32 x i32> undef, i32 %t309, i32 0
  %112 = shufflevector <32 x i32> %111, <32 x i32> undef, <32 x i32> zeroinitializer
  %113 = sext i32 %t310 to i64
  br label %"for repeat_edge.s0._0._0"

"end for repeat_edge.s0._1.rebased":              ; preds = %"end for repeat_edge.s0._0._0", %"for output.s0.y.yi.yi.$n.rebased"
  %114 = add nsw i64 %74, %66
  %115 = add nsw i64 %114, 2
  %116 = icmp sgt i32 %a24, %a6
  %a23 = select i1 %116, i32 %a24, i32 %a6
  %117 = sext i32 %a23 to i64
  %118 = icmp sgt i64 %115, %117
  %119 = trunc i64 %115 to i32
  %120 = select i1 %118, i32 %a23, i32 %119
  %121 = sext i32 %a5 to i64
  %122 = icmp sgt i64 %115, %121
  %123 = select i1 %122, i32 %a5, i32 %119
  %t311 = sub nsw i32 %120, %123
  %124 = icmp sgt i32 %t311, 0
  br i1 %124, label %"for repeat_edge.s0._1.rebased1.preheader", label %"end for repeat_edge.s0._1.rebased2", !prof !235

"for repeat_edge.s0._1.rebased1.preheader":       ; preds = %"end for repeat_edge.s0._1.rebased"
  %t312 = sub i32 %repeat_edge.s0._1.prologue, %a26
  %125 = sext i32 %t312 to i64
  %126 = zext i32 %t311 to i64
  br label %"for repeat_edge.s0._1.rebased1"

"for repeat_edge.s0._0._0":                       ; preds = %"for repeat_edge.s0._0._0.preheader", %"for repeat_edge.s0._0._0"
  %repeat_edge.s0._0._0 = phi i32 [ %308, %"for repeat_edge.s0._0._0" ], [ 0, %"for repeat_edge.s0._0._0.preheader" ]
  %127 = shl nsw i32 %repeat_edge.s0._0._0, 5
  %a19 = add nsw i32 %127, %t282
  %128 = icmp sgt i32 %b21, %a19
  %repeat_edge.s0._0._0i.base.s = select i1 %128, i32 %a19, i32 %b21
  %129 = add nsw i32 %repeat_edge.s0._0._0i.base.s, -130
  %130 = insertelement <32 x i32> undef, i32 %129, i32 0
  %131 = shufflevector <32 x i32> %130, <32 x i32> undef, <32 x i32> zeroinitializer
  %a21 = add nsw <32 x i32> %131, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %132 = shufflevector <32 x i32> %a21, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %133 = icmp sgt <16 x i32> %52, %132
  %134 = shufflevector <32 x i32> %a21, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %135 = icmp sgt <16 x i32> %52, %134
  %136 = select <16 x i1> %133, <16 x i32> %132, <16 x i32> %52
  %137 = select <16 x i1> %135, <16 x i32> %134, <16 x i32> %52
  %138 = icmp sgt <16 x i32> %136, %54
  %139 = icmp sgt <16 x i32> %137, %54
  %140 = select <16 x i1> %138, <16 x i32> %136, <16 x i32> %54
  %141 = select <16 x i1> %139, <16 x i32> %137, <16 x i32> %54
  %142 = shufflevector <16 x i32> %140, <16 x i32> %141, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %143 = add nsw <32 x i32> %142, %112
  %144 = extractelement <32 x i32> %143, i32 0
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8* %input, i64 %145
  %147 = load i8, i8* %146, align 1, !tbaa !237
  %148 = insertelement <32 x i8> undef, i8 %147, i32 0
  %149 = extractelement <32 x i32> %143, i32 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8* %input, i64 %150
  %152 = load i8, i8* %151, align 1, !tbaa !237
  %153 = insertelement <32 x i8> %148, i8 %152, i32 1
  %154 = extractelement <32 x i32> %143, i32 2
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8* %input, i64 %155
  %157 = load i8, i8* %156, align 1, !tbaa !237
  %158 = insertelement <32 x i8> %153, i8 %157, i32 2
  %159 = extractelement <32 x i32> %143, i32 3
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8* %input, i64 %160
  %162 = load i8, i8* %161, align 1, !tbaa !237
  %163 = insertelement <32 x i8> %158, i8 %162, i32 3
  %164 = extractelement <32 x i32> %143, i32 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i8, i8* %input, i64 %165
  %167 = load i8, i8* %166, align 1, !tbaa !237
  %168 = insertelement <32 x i8> %163, i8 %167, i32 4
  %169 = extractelement <32 x i32> %143, i32 5
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8* %input, i64 %170
  %172 = load i8, i8* %171, align 1, !tbaa !237
  %173 = insertelement <32 x i8> %168, i8 %172, i32 5
  %174 = extractelement <32 x i32> %143, i32 6
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i8, i8* %input, i64 %175
  %177 = load i8, i8* %176, align 1, !tbaa !237
  %178 = insertelement <32 x i8> %173, i8 %177, i32 6
  %179 = extractelement <32 x i32> %143, i32 7
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i8, i8* %input, i64 %180
  %182 = load i8, i8* %181, align 1, !tbaa !237
  %183 = insertelement <32 x i8> %178, i8 %182, i32 7
  %184 = extractelement <32 x i32> %143, i32 8
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8* %input, i64 %185
  %187 = load i8, i8* %186, align 1, !tbaa !237
  %188 = insertelement <32 x i8> %183, i8 %187, i32 8
  %189 = extractelement <32 x i32> %143, i32 9
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i8, i8* %input, i64 %190
  %192 = load i8, i8* %191, align 1, !tbaa !237
  %193 = insertelement <32 x i8> %188, i8 %192, i32 9
  %194 = extractelement <32 x i32> %143, i32 10
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8* %input, i64 %195
  %197 = load i8, i8* %196, align 1, !tbaa !237
  %198 = insertelement <32 x i8> %193, i8 %197, i32 10
  %199 = extractelement <32 x i32> %143, i32 11
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8* %input, i64 %200
  %202 = load i8, i8* %201, align 1, !tbaa !237
  %203 = insertelement <32 x i8> %198, i8 %202, i32 11
  %204 = extractelement <32 x i32> %143, i32 12
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8* %input, i64 %205
  %207 = load i8, i8* %206, align 1, !tbaa !237
  %208 = insertelement <32 x i8> %203, i8 %207, i32 12
  %209 = extractelement <32 x i32> %143, i32 13
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8* %input, i64 %210
  %212 = load i8, i8* %211, align 1, !tbaa !237
  %213 = insertelement <32 x i8> %208, i8 %212, i32 13
  %214 = extractelement <32 x i32> %143, i32 14
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i8, i8* %input, i64 %215
  %217 = load i8, i8* %216, align 1, !tbaa !237
  %218 = insertelement <32 x i8> %213, i8 %217, i32 14
  %219 = extractelement <32 x i32> %143, i32 15
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i8, i8* %input, i64 %220
  %222 = load i8, i8* %221, align 1, !tbaa !237
  %223 = insertelement <32 x i8> %218, i8 %222, i32 15
  %224 = extractelement <32 x i32> %143, i32 16
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i8, i8* %input, i64 %225
  %227 = load i8, i8* %226, align 1, !tbaa !237
  %228 = insertelement <32 x i8> %223, i8 %227, i32 16
  %229 = extractelement <32 x i32> %143, i32 17
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i8, i8* %input, i64 %230
  %232 = load i8, i8* %231, align 1, !tbaa !237
  %233 = insertelement <32 x i8> %228, i8 %232, i32 17
  %234 = extractelement <32 x i32> %143, i32 18
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i8, i8* %input, i64 %235
  %237 = load i8, i8* %236, align 1, !tbaa !237
  %238 = insertelement <32 x i8> %233, i8 %237, i32 18
  %239 = extractelement <32 x i32> %143, i32 19
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i8, i8* %input, i64 %240
  %242 = load i8, i8* %241, align 1, !tbaa !237
  %243 = insertelement <32 x i8> %238, i8 %242, i32 19
  %244 = extractelement <32 x i32> %143, i32 20
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i8, i8* %input, i64 %245
  %247 = load i8, i8* %246, align 1, !tbaa !237
  %248 = insertelement <32 x i8> %243, i8 %247, i32 20
  %249 = extractelement <32 x i32> %143, i32 21
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i8, i8* %input, i64 %250
  %252 = load i8, i8* %251, align 1, !tbaa !237
  %253 = insertelement <32 x i8> %248, i8 %252, i32 21
  %254 = extractelement <32 x i32> %143, i32 22
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds i8, i8* %input, i64 %255
  %257 = load i8, i8* %256, align 1, !tbaa !237
  %258 = insertelement <32 x i8> %253, i8 %257, i32 22
  %259 = extractelement <32 x i32> %143, i32 23
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i8, i8* %input, i64 %260
  %262 = load i8, i8* %261, align 1, !tbaa !237
  %263 = insertelement <32 x i8> %258, i8 %262, i32 23
  %264 = extractelement <32 x i32> %143, i32 24
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i8, i8* %input, i64 %265
  %267 = load i8, i8* %266, align 1, !tbaa !237
  %268 = insertelement <32 x i8> %263, i8 %267, i32 24
  %269 = extractelement <32 x i32> %143, i32 25
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i8, i8* %input, i64 %270
  %272 = load i8, i8* %271, align 1, !tbaa !237
  %273 = insertelement <32 x i8> %268, i8 %272, i32 25
  %274 = extractelement <32 x i32> %143, i32 26
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i8, i8* %input, i64 %275
  %277 = load i8, i8* %276, align 1, !tbaa !237
  %278 = insertelement <32 x i8> %273, i8 %277, i32 26
  %279 = extractelement <32 x i32> %143, i32 27
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i8, i8* %input, i64 %280
  %282 = load i8, i8* %281, align 1, !tbaa !237
  %283 = insertelement <32 x i8> %278, i8 %282, i32 27
  %284 = extractelement <32 x i32> %143, i32 28
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i8, i8* %input, i64 %285
  %287 = load i8, i8* %286, align 1, !tbaa !237
  %288 = insertelement <32 x i8> %283, i8 %287, i32 28
  %289 = extractelement <32 x i32> %143, i32 29
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8* %input, i64 %290
  %292 = load i8, i8* %291, align 1, !tbaa !237
  %293 = insertelement <32 x i8> %288, i8 %292, i32 29
  %294 = extractelement <32 x i32> %143, i32 30
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i8, i8* %input, i64 %295
  %297 = load i8, i8* %296, align 1, !tbaa !237
  %298 = insertelement <32 x i8> %293, i8 %297, i32 30
  %299 = extractelement <32 x i32> %143, i32 31
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds i8, i8* %input, i64 %300
  %302 = load i8, i8* %301, align 1, !tbaa !237
  %303 = insertelement <32 x i8> %298, i8 %302, i32 31
  %304 = sext i32 %repeat_edge.s0._0._0i.base.s to i64
  %305 = add nsw i64 %304, %113
  %306 = getelementptr inbounds i8, i8* %repeat_edge, i64 %305
  %307 = bitcast i8* %306 to <32 x i8>*
  store <32 x i8> %303, <32 x i8>* %307, align 1, !tbaa !240
  %308 = add nuw nsw i32 %repeat_edge.s0._0._0, 1
  %.not173 = icmp eq i32 %308, %t295
  br i1 %.not173, label %"end for repeat_edge.s0._0._0", label %"for repeat_edge.s0._0._0"

"end for repeat_edge.s0._0._0":                   ; preds = %"for repeat_edge.s0._0._0", %"for repeat_edge.s0._1.rebased"
  %309 = add nuw nsw i32 %repeat_edge.s0._1.rebased, 1
  %.not172 = icmp eq i32 %repeat_edge.s0._1.rebased, %95
  br i1 %.not172, label %"end for repeat_edge.s0._1.rebased", label %"for repeat_edge.s0._1.rebased"

"for repeat_edge.s0._1.rebased1":                 ; preds = %"for repeat_edge.s0._1.rebased1.preheader", %"end for repeat_edge.s0._0._0.rebased10"
  %indvars.iv410 = phi i64 [ 0, %"for repeat_edge.s0._1.rebased1.preheader" ], [ %indvars.iv.next411, %"end for repeat_edge.s0._0._0.rebased10" ]
  %310 = trunc i64 %indvars.iv410 to i32
  %311 = add i32 %repeat_edge.s0._1.prologue, %310
  %312 = and i32 %311, 15
  %313 = mul nsw i32 %312, %48
  %t319 = sub nsw i32 %313, %t282
  %314 = add nsw i64 %indvars.iv410, %125
  %315 = mul nsw i64 %314, %64
  %316 = sub nsw i64 %315, %65
  br i1 %55, label %"for repeat_edge.s0._0._04.preheader", label %"end for repeat_edge.s0._0._05", !prof !235

"for repeat_edge.s0._0._04.preheader":            ; preds = %"for repeat_edge.s0._1.rebased1"
  %317 = trunc i64 %316 to i32
  %318 = insertelement <32 x i32> undef, i32 %317, i32 0
  %319 = shufflevector <32 x i32> %318, <32 x i32> undef, <32 x i32> zeroinitializer
  %320 = sext i32 %t319 to i64
  br label %"for repeat_edge.s0._0._04"

"end for repeat_edge.s0._1.rebased2":             ; preds = %"end for repeat_edge.s0._0._0.rebased10", %"end for repeat_edge.s0._1.rebased"
  %a34 = add i32 %58, %78
  %321 = icmp sgt i32 %a34, %b36
  %322 = select i1 %321, i32 %a34, i32 %b36
  %323 = trunc i64 %74 to i32
  %324 = add i32 %output.min.1, %323
  %a33 = sub i32 %324, %322
  %325 = icmp sgt i32 %a33, -2
  %t326 = sub nsw i32 %repeat_edge.s0._1.epilogue, %a26
  br i1 %325, label %"for repeat_edge.s0._1.rebased13.preheader", label %"end for repeat_edge.s0._1.rebased14", !prof !235

"for repeat_edge.s0._1.rebased13.preheader":      ; preds = %"end for repeat_edge.s0._1.rebased2"
  %a33.op = add i32 %a33, 1
  br label %"for repeat_edge.s0._1.rebased13"

"for repeat_edge.s0._0._04":                      ; preds = %"for repeat_edge.s0._0._04.preheader", %"for repeat_edge.s0._0._04"
  %repeat_edge.s0._0._06 = phi i32 [ %507, %"for repeat_edge.s0._0._04" ], [ 0, %"for repeat_edge.s0._0._04.preheader" ]
  %326 = shl nsw i32 %repeat_edge.s0._0._06, 5
  %a27 = add nsw i32 %326, %t282
  %327 = icmp sgt i32 %b21, %a27
  %repeat_edge.s0._0._0i.base.s7 = select i1 %327, i32 %a27, i32 %b21
  %328 = add nsw i32 %repeat_edge.s0._0._0i.base.s7, -130
  %329 = insertelement <32 x i32> undef, i32 %328, i32 0
  %330 = shufflevector <32 x i32> %329, <32 x i32> undef, <32 x i32> zeroinitializer
  %a29 = add nsw <32 x i32> %330, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %331 = shufflevector <32 x i32> %a29, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %332 = icmp sgt <16 x i32> %52, %331
  %333 = shufflevector <32 x i32> %a29, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %334 = icmp sgt <16 x i32> %52, %333
  %335 = select <16 x i1> %332, <16 x i32> %331, <16 x i32> %52
  %336 = select <16 x i1> %334, <16 x i32> %333, <16 x i32> %52
  %337 = icmp sgt <16 x i32> %335, %54
  %338 = icmp sgt <16 x i32> %336, %54
  %339 = select <16 x i1> %337, <16 x i32> %335, <16 x i32> %54
  %340 = select <16 x i1> %338, <16 x i32> %336, <16 x i32> %54
  %341 = shufflevector <16 x i32> %339, <16 x i32> %340, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %342 = add nsw <32 x i32> %341, %319
  %343 = extractelement <32 x i32> %342, i32 0
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds i8, i8* %input, i64 %344
  %346 = load i8, i8* %345, align 1, !tbaa !237
  %347 = insertelement <32 x i8> undef, i8 %346, i32 0
  %348 = extractelement <32 x i32> %342, i32 1
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds i8, i8* %input, i64 %349
  %351 = load i8, i8* %350, align 1, !tbaa !237
  %352 = insertelement <32 x i8> %347, i8 %351, i32 1
  %353 = extractelement <32 x i32> %342, i32 2
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds i8, i8* %input, i64 %354
  %356 = load i8, i8* %355, align 1, !tbaa !237
  %357 = insertelement <32 x i8> %352, i8 %356, i32 2
  %358 = extractelement <32 x i32> %342, i32 3
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds i8, i8* %input, i64 %359
  %361 = load i8, i8* %360, align 1, !tbaa !237
  %362 = insertelement <32 x i8> %357, i8 %361, i32 3
  %363 = extractelement <32 x i32> %342, i32 4
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds i8, i8* %input, i64 %364
  %366 = load i8, i8* %365, align 1, !tbaa !237
  %367 = insertelement <32 x i8> %362, i8 %366, i32 4
  %368 = extractelement <32 x i32> %342, i32 5
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds i8, i8* %input, i64 %369
  %371 = load i8, i8* %370, align 1, !tbaa !237
  %372 = insertelement <32 x i8> %367, i8 %371, i32 5
  %373 = extractelement <32 x i32> %342, i32 6
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i8, i8* %input, i64 %374
  %376 = load i8, i8* %375, align 1, !tbaa !237
  %377 = insertelement <32 x i8> %372, i8 %376, i32 6
  %378 = extractelement <32 x i32> %342, i32 7
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds i8, i8* %input, i64 %379
  %381 = load i8, i8* %380, align 1, !tbaa !237
  %382 = insertelement <32 x i8> %377, i8 %381, i32 7
  %383 = extractelement <32 x i32> %342, i32 8
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds i8, i8* %input, i64 %384
  %386 = load i8, i8* %385, align 1, !tbaa !237
  %387 = insertelement <32 x i8> %382, i8 %386, i32 8
  %388 = extractelement <32 x i32> %342, i32 9
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds i8, i8* %input, i64 %389
  %391 = load i8, i8* %390, align 1, !tbaa !237
  %392 = insertelement <32 x i8> %387, i8 %391, i32 9
  %393 = extractelement <32 x i32> %342, i32 10
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds i8, i8* %input, i64 %394
  %396 = load i8, i8* %395, align 1, !tbaa !237
  %397 = insertelement <32 x i8> %392, i8 %396, i32 10
  %398 = extractelement <32 x i32> %342, i32 11
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds i8, i8* %input, i64 %399
  %401 = load i8, i8* %400, align 1, !tbaa !237
  %402 = insertelement <32 x i8> %397, i8 %401, i32 11
  %403 = extractelement <32 x i32> %342, i32 12
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds i8, i8* %input, i64 %404
  %406 = load i8, i8* %405, align 1, !tbaa !237
  %407 = insertelement <32 x i8> %402, i8 %406, i32 12
  %408 = extractelement <32 x i32> %342, i32 13
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds i8, i8* %input, i64 %409
  %411 = load i8, i8* %410, align 1, !tbaa !237
  %412 = insertelement <32 x i8> %407, i8 %411, i32 13
  %413 = extractelement <32 x i32> %342, i32 14
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds i8, i8* %input, i64 %414
  %416 = load i8, i8* %415, align 1, !tbaa !237
  %417 = insertelement <32 x i8> %412, i8 %416, i32 14
  %418 = extractelement <32 x i32> %342, i32 15
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i8, i8* %input, i64 %419
  %421 = load i8, i8* %420, align 1, !tbaa !237
  %422 = insertelement <32 x i8> %417, i8 %421, i32 15
  %423 = extractelement <32 x i32> %342, i32 16
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds i8, i8* %input, i64 %424
  %426 = load i8, i8* %425, align 1, !tbaa !237
  %427 = insertelement <32 x i8> %422, i8 %426, i32 16
  %428 = extractelement <32 x i32> %342, i32 17
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds i8, i8* %input, i64 %429
  %431 = load i8, i8* %430, align 1, !tbaa !237
  %432 = insertelement <32 x i8> %427, i8 %431, i32 17
  %433 = extractelement <32 x i32> %342, i32 18
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds i8, i8* %input, i64 %434
  %436 = load i8, i8* %435, align 1, !tbaa !237
  %437 = insertelement <32 x i8> %432, i8 %436, i32 18
  %438 = extractelement <32 x i32> %342, i32 19
  %439 = sext i32 %438 to i64
  %440 = getelementptr inbounds i8, i8* %input, i64 %439
  %441 = load i8, i8* %440, align 1, !tbaa !237
  %442 = insertelement <32 x i8> %437, i8 %441, i32 19
  %443 = extractelement <32 x i32> %342, i32 20
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds i8, i8* %input, i64 %444
  %446 = load i8, i8* %445, align 1, !tbaa !237
  %447 = insertelement <32 x i8> %442, i8 %446, i32 20
  %448 = extractelement <32 x i32> %342, i32 21
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds i8, i8* %input, i64 %449
  %451 = load i8, i8* %450, align 1, !tbaa !237
  %452 = insertelement <32 x i8> %447, i8 %451, i32 21
  %453 = extractelement <32 x i32> %342, i32 22
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds i8, i8* %input, i64 %454
  %456 = load i8, i8* %455, align 1, !tbaa !237
  %457 = insertelement <32 x i8> %452, i8 %456, i32 22
  %458 = extractelement <32 x i32> %342, i32 23
  %459 = sext i32 %458 to i64
  %460 = getelementptr inbounds i8, i8* %input, i64 %459
  %461 = load i8, i8* %460, align 1, !tbaa !237
  %462 = insertelement <32 x i8> %457, i8 %461, i32 23
  %463 = extractelement <32 x i32> %342, i32 24
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds i8, i8* %input, i64 %464
  %466 = load i8, i8* %465, align 1, !tbaa !237
  %467 = insertelement <32 x i8> %462, i8 %466, i32 24
  %468 = extractelement <32 x i32> %342, i32 25
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds i8, i8* %input, i64 %469
  %471 = load i8, i8* %470, align 1, !tbaa !237
  %472 = insertelement <32 x i8> %467, i8 %471, i32 25
  %473 = extractelement <32 x i32> %342, i32 26
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds i8, i8* %input, i64 %474
  %476 = load i8, i8* %475, align 1, !tbaa !237
  %477 = insertelement <32 x i8> %472, i8 %476, i32 26
  %478 = extractelement <32 x i32> %342, i32 27
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds i8, i8* %input, i64 %479
  %481 = load i8, i8* %480, align 1, !tbaa !237
  %482 = insertelement <32 x i8> %477, i8 %481, i32 27
  %483 = extractelement <32 x i32> %342, i32 28
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds i8, i8* %input, i64 %484
  %486 = load i8, i8* %485, align 1, !tbaa !237
  %487 = insertelement <32 x i8> %482, i8 %486, i32 28
  %488 = extractelement <32 x i32> %342, i32 29
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds i8, i8* %input, i64 %489
  %491 = load i8, i8* %490, align 1, !tbaa !237
  %492 = insertelement <32 x i8> %487, i8 %491, i32 29
  %493 = extractelement <32 x i32> %342, i32 30
  %494 = sext i32 %493 to i64
  %495 = getelementptr inbounds i8, i8* %input, i64 %494
  %496 = load i8, i8* %495, align 1, !tbaa !237
  %497 = insertelement <32 x i8> %492, i8 %496, i32 30
  %498 = extractelement <32 x i32> %342, i32 31
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds i8, i8* %input, i64 %499
  %501 = load i8, i8* %500, align 1, !tbaa !237
  %502 = insertelement <32 x i8> %497, i8 %501, i32 31
  %503 = sext i32 %repeat_edge.s0._0._0i.base.s7 to i64
  %504 = add nsw i64 %503, %320
  %505 = getelementptr inbounds i8, i8* %repeat_edge, i64 %504
  %506 = bitcast i8* %505 to <32 x i8>*
  store <32 x i8> %502, <32 x i8>* %506, align 1, !tbaa !240
  %507 = add nuw nsw i32 %repeat_edge.s0._0._06, 1
  %.not171 = icmp eq i32 %507, %t296
  br i1 %.not171, label %"end for repeat_edge.s0._0._05", label %"for repeat_edge.s0._0._04"

"end for repeat_edge.s0._0._05":                  ; preds = %"for repeat_edge.s0._0._04", %"for repeat_edge.s0._1.rebased1"
  br i1 %56, label %"for repeat_edge.s0._0._0.rebased.preheader", label %"end for repeat_edge.s0._0._0.rebased", !prof !235

"for repeat_edge.s0._0._0.rebased.preheader":     ; preds = %"end for repeat_edge.s0._0._05"
  %508 = sext i32 %t319 to i64
  br i1 %69, label %"end for repeat_edge.s0._0._0.rebased.loopexit.unr-lcssa", label %"for repeat_edge.s0._0._0.rebased"

"for repeat_edge.s0._0._0.rebased":               ; preds = %"for repeat_edge.s0._0._0.rebased.preheader", %"for repeat_edge.s0._0._0.rebased"
  %repeat_edge.s0._0._0.rebased = phi i32 [ %552, %"for repeat_edge.s0._0._0.rebased" ], [ 0, %"for repeat_edge.s0._0._0.rebased.preheader" ]
  %niter = phi i64 [ %niter.nsub.3, %"for repeat_edge.s0._0._0.rebased" ], [ %unroll_iter, %"for repeat_edge.s0._0._0.rebased.preheader" ]
  %509 = add nsw i32 %repeat_edge.s0._0._0.rebased, %t296
  %510 = shl nsw i32 %509, 5
  %repeat_edge.s0._0._0i.base.s8 = add nsw i32 %510, %t282
  %511 = sext i32 %repeat_edge.s0._0._0i.base.s8 to i64
  %512 = add nsw i64 %316, %511
  %513 = getelementptr inbounds i8, i8* %67, i64 %512
  %514 = bitcast i8* %513 to <32 x i8>*
  %515 = load <32 x i8>, <32 x i8>* %514, align 1, !tbaa !237
  %516 = add nsw i64 %511, %508
  %517 = getelementptr inbounds i8, i8* %repeat_edge, i64 %516
  %518 = bitcast i8* %517 to <32 x i8>*
  store <32 x i8> %515, <32 x i8>* %518, align 1, !tbaa !240
  %519 = or i32 %repeat_edge.s0._0._0.rebased, 1
  %520 = add nsw i32 %519, %t296
  %521 = shl nsw i32 %520, 5
  %repeat_edge.s0._0._0i.base.s8.1 = add nsw i32 %521, %t282
  %522 = sext i32 %repeat_edge.s0._0._0i.base.s8.1 to i64
  %523 = add nsw i64 %316, %522
  %524 = getelementptr inbounds i8, i8* %67, i64 %523
  %525 = bitcast i8* %524 to <32 x i8>*
  %526 = load <32 x i8>, <32 x i8>* %525, align 1, !tbaa !237
  %527 = add nsw i64 %522, %508
  %528 = getelementptr inbounds i8, i8* %repeat_edge, i64 %527
  %529 = bitcast i8* %528 to <32 x i8>*
  store <32 x i8> %526, <32 x i8>* %529, align 1, !tbaa !240
  %530 = or i32 %repeat_edge.s0._0._0.rebased, 2
  %531 = add nsw i32 %530, %t296
  %532 = shl nsw i32 %531, 5
  %repeat_edge.s0._0._0i.base.s8.2 = add nsw i32 %532, %t282
  %533 = sext i32 %repeat_edge.s0._0._0i.base.s8.2 to i64
  %534 = add nsw i64 %316, %533
  %535 = getelementptr inbounds i8, i8* %67, i64 %534
  %536 = bitcast i8* %535 to <32 x i8>*
  %537 = load <32 x i8>, <32 x i8>* %536, align 1, !tbaa !237
  %538 = add nsw i64 %533, %508
  %539 = getelementptr inbounds i8, i8* %repeat_edge, i64 %538
  %540 = bitcast i8* %539 to <32 x i8>*
  store <32 x i8> %537, <32 x i8>* %540, align 1, !tbaa !240
  %541 = or i32 %repeat_edge.s0._0._0.rebased, 3
  %542 = add nsw i32 %541, %t296
  %543 = shl nsw i32 %542, 5
  %repeat_edge.s0._0._0i.base.s8.3 = add nsw i32 %543, %t282
  %544 = sext i32 %repeat_edge.s0._0._0i.base.s8.3 to i64
  %545 = add nsw i64 %316, %544
  %546 = getelementptr inbounds i8, i8* %67, i64 %545
  %547 = bitcast i8* %546 to <32 x i8>*
  %548 = load <32 x i8>, <32 x i8>* %547, align 1, !tbaa !237
  %549 = add nsw i64 %544, %508
  %550 = getelementptr inbounds i8, i8* %repeat_edge, i64 %549
  %551 = bitcast i8* %550 to <32 x i8>*
  store <32 x i8> %548, <32 x i8>* %551, align 1, !tbaa !240
  %552 = add nuw nsw i32 %repeat_edge.s0._0._0.rebased, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %"end for repeat_edge.s0._0._0.rebased.loopexit.unr-lcssa", label %"for repeat_edge.s0._0._0.rebased"

"end for repeat_edge.s0._0._0.rebased.loopexit.unr-lcssa": ; preds = %"for repeat_edge.s0._0._0.rebased", %"for repeat_edge.s0._0._0.rebased.preheader"
  %repeat_edge.s0._0._0.rebased.unr = phi i32 [ 0, %"for repeat_edge.s0._0._0.rebased.preheader" ], [ %552, %"for repeat_edge.s0._0._0.rebased" ]
  br i1 %lcmp.mod.not, label %"end for repeat_edge.s0._0._0.rebased", label %"for repeat_edge.s0._0._0.rebased.epil"

"for repeat_edge.s0._0._0.rebased.epil":          ; preds = %"end for repeat_edge.s0._0._0.rebased.loopexit.unr-lcssa", %"for repeat_edge.s0._0._0.rebased.epil"
  %repeat_edge.s0._0._0.rebased.epil = phi i32 [ %563, %"for repeat_edge.s0._0._0.rebased.epil" ], [ %repeat_edge.s0._0._0.rebased.unr, %"end for repeat_edge.s0._0._0.rebased.loopexit.unr-lcssa" ]
  %epil.iter = phi i64 [ %epil.iter.sub, %"for repeat_edge.s0._0._0.rebased.epil" ], [ %xtraiter, %"end for repeat_edge.s0._0._0.rebased.loopexit.unr-lcssa" ]
  %553 = add nsw i32 %repeat_edge.s0._0._0.rebased.epil, %t296
  %554 = shl nsw i32 %553, 5
  %repeat_edge.s0._0._0i.base.s8.epil = add nsw i32 %554, %t282
  %555 = sext i32 %repeat_edge.s0._0._0i.base.s8.epil to i64
  %556 = add nsw i64 %316, %555
  %557 = getelementptr inbounds i8, i8* %67, i64 %556
  %558 = bitcast i8* %557 to <32 x i8>*
  %559 = load <32 x i8>, <32 x i8>* %558, align 1, !tbaa !237
  %560 = add nsw i64 %555, %508
  %561 = getelementptr inbounds i8, i8* %repeat_edge, i64 %560
  %562 = bitcast i8* %561 to <32 x i8>*
  store <32 x i8> %559, <32 x i8>* %562, align 1, !tbaa !240
  %563 = add nuw nsw i32 %repeat_edge.s0._0._0.rebased.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %"end for repeat_edge.s0._0._0.rebased", label %"for repeat_edge.s0._0._0.rebased.epil", !llvm.loop !242

"end for repeat_edge.s0._0._0.rebased":           ; preds = %"end for repeat_edge.s0._0._0.rebased.loopexit.unr-lcssa", %"for repeat_edge.s0._0._0.rebased.epil", %"end for repeat_edge.s0._0._05"
  br i1 %57, label %"for repeat_edge.s0._0._0.rebased9.preheader", label %"end for repeat_edge.s0._0._0.rebased10", !prof !235

"for repeat_edge.s0._0._0.rebased9.preheader":    ; preds = %"end for repeat_edge.s0._0._0.rebased"
  %564 = trunc i64 %316 to i32
  %565 = insertelement <32 x i32> undef, i32 %564, i32 0
  %566 = shufflevector <32 x i32> %565, <32 x i32> undef, <32 x i32> zeroinitializer
  %567 = sext i32 %t319 to i64
  br label %"for repeat_edge.s0._0._0.rebased9"

"for repeat_edge.s0._0._0.rebased9":              ; preds = %"for repeat_edge.s0._0._0.rebased9.preheader", %"for repeat_edge.s0._0._0.rebased9"
  %repeat_edge.s0._0._0.rebased11 = phi i32 [ %750, %"for repeat_edge.s0._0._0.rebased9" ], [ 0, %"for repeat_edge.s0._0._0.rebased9.preheader" ]
  %568 = add nsw i32 %repeat_edge.s0._0._0.rebased11, %t287
  %569 = shl nsw i32 %568, 5
  %a30 = add nsw i32 %569, %t282
  %570 = icmp sgt i32 %b21, %a30
  %repeat_edge.s0._0._0i.base.s12 = select i1 %570, i32 %a30, i32 %b21
  %571 = add nsw i32 %repeat_edge.s0._0._0i.base.s12, -130
  %572 = insertelement <32 x i32> undef, i32 %571, i32 0
  %573 = shufflevector <32 x i32> %572, <32 x i32> undef, <32 x i32> zeroinitializer
  %a32 = add nsw <32 x i32> %573, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %574 = shufflevector <32 x i32> %a32, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %575 = icmp sgt <16 x i32> %52, %574
  %576 = shufflevector <32 x i32> %a32, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %577 = icmp sgt <16 x i32> %52, %576
  %578 = select <16 x i1> %575, <16 x i32> %574, <16 x i32> %52
  %579 = select <16 x i1> %577, <16 x i32> %576, <16 x i32> %52
  %580 = icmp sgt <16 x i32> %578, %54
  %581 = icmp sgt <16 x i32> %579, %54
  %582 = select <16 x i1> %580, <16 x i32> %578, <16 x i32> %54
  %583 = select <16 x i1> %581, <16 x i32> %579, <16 x i32> %54
  %584 = shufflevector <16 x i32> %582, <16 x i32> %583, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %585 = add nsw <32 x i32> %584, %566
  %586 = extractelement <32 x i32> %585, i32 0
  %587 = sext i32 %586 to i64
  %588 = getelementptr inbounds i8, i8* %input, i64 %587
  %589 = load i8, i8* %588, align 1, !tbaa !237
  %590 = insertelement <32 x i8> undef, i8 %589, i32 0
  %591 = extractelement <32 x i32> %585, i32 1
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds i8, i8* %input, i64 %592
  %594 = load i8, i8* %593, align 1, !tbaa !237
  %595 = insertelement <32 x i8> %590, i8 %594, i32 1
  %596 = extractelement <32 x i32> %585, i32 2
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds i8, i8* %input, i64 %597
  %599 = load i8, i8* %598, align 1, !tbaa !237
  %600 = insertelement <32 x i8> %595, i8 %599, i32 2
  %601 = extractelement <32 x i32> %585, i32 3
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds i8, i8* %input, i64 %602
  %604 = load i8, i8* %603, align 1, !tbaa !237
  %605 = insertelement <32 x i8> %600, i8 %604, i32 3
  %606 = extractelement <32 x i32> %585, i32 4
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds i8, i8* %input, i64 %607
  %609 = load i8, i8* %608, align 1, !tbaa !237
  %610 = insertelement <32 x i8> %605, i8 %609, i32 4
  %611 = extractelement <32 x i32> %585, i32 5
  %612 = sext i32 %611 to i64
  %613 = getelementptr inbounds i8, i8* %input, i64 %612
  %614 = load i8, i8* %613, align 1, !tbaa !237
  %615 = insertelement <32 x i8> %610, i8 %614, i32 5
  %616 = extractelement <32 x i32> %585, i32 6
  %617 = sext i32 %616 to i64
  %618 = getelementptr inbounds i8, i8* %input, i64 %617
  %619 = load i8, i8* %618, align 1, !tbaa !237
  %620 = insertelement <32 x i8> %615, i8 %619, i32 6
  %621 = extractelement <32 x i32> %585, i32 7
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds i8, i8* %input, i64 %622
  %624 = load i8, i8* %623, align 1, !tbaa !237
  %625 = insertelement <32 x i8> %620, i8 %624, i32 7
  %626 = extractelement <32 x i32> %585, i32 8
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds i8, i8* %input, i64 %627
  %629 = load i8, i8* %628, align 1, !tbaa !237
  %630 = insertelement <32 x i8> %625, i8 %629, i32 8
  %631 = extractelement <32 x i32> %585, i32 9
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds i8, i8* %input, i64 %632
  %634 = load i8, i8* %633, align 1, !tbaa !237
  %635 = insertelement <32 x i8> %630, i8 %634, i32 9
  %636 = extractelement <32 x i32> %585, i32 10
  %637 = sext i32 %636 to i64
  %638 = getelementptr inbounds i8, i8* %input, i64 %637
  %639 = load i8, i8* %638, align 1, !tbaa !237
  %640 = insertelement <32 x i8> %635, i8 %639, i32 10
  %641 = extractelement <32 x i32> %585, i32 11
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds i8, i8* %input, i64 %642
  %644 = load i8, i8* %643, align 1, !tbaa !237
  %645 = insertelement <32 x i8> %640, i8 %644, i32 11
  %646 = extractelement <32 x i32> %585, i32 12
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds i8, i8* %input, i64 %647
  %649 = load i8, i8* %648, align 1, !tbaa !237
  %650 = insertelement <32 x i8> %645, i8 %649, i32 12
  %651 = extractelement <32 x i32> %585, i32 13
  %652 = sext i32 %651 to i64
  %653 = getelementptr inbounds i8, i8* %input, i64 %652
  %654 = load i8, i8* %653, align 1, !tbaa !237
  %655 = insertelement <32 x i8> %650, i8 %654, i32 13
  %656 = extractelement <32 x i32> %585, i32 14
  %657 = sext i32 %656 to i64
  %658 = getelementptr inbounds i8, i8* %input, i64 %657
  %659 = load i8, i8* %658, align 1, !tbaa !237
  %660 = insertelement <32 x i8> %655, i8 %659, i32 14
  %661 = extractelement <32 x i32> %585, i32 15
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds i8, i8* %input, i64 %662
  %664 = load i8, i8* %663, align 1, !tbaa !237
  %665 = insertelement <32 x i8> %660, i8 %664, i32 15
  %666 = extractelement <32 x i32> %585, i32 16
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds i8, i8* %input, i64 %667
  %669 = load i8, i8* %668, align 1, !tbaa !237
  %670 = insertelement <32 x i8> %665, i8 %669, i32 16
  %671 = extractelement <32 x i32> %585, i32 17
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds i8, i8* %input, i64 %672
  %674 = load i8, i8* %673, align 1, !tbaa !237
  %675 = insertelement <32 x i8> %670, i8 %674, i32 17
  %676 = extractelement <32 x i32> %585, i32 18
  %677 = sext i32 %676 to i64
  %678 = getelementptr inbounds i8, i8* %input, i64 %677
  %679 = load i8, i8* %678, align 1, !tbaa !237
  %680 = insertelement <32 x i8> %675, i8 %679, i32 18
  %681 = extractelement <32 x i32> %585, i32 19
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds i8, i8* %input, i64 %682
  %684 = load i8, i8* %683, align 1, !tbaa !237
  %685 = insertelement <32 x i8> %680, i8 %684, i32 19
  %686 = extractelement <32 x i32> %585, i32 20
  %687 = sext i32 %686 to i64
  %688 = getelementptr inbounds i8, i8* %input, i64 %687
  %689 = load i8, i8* %688, align 1, !tbaa !237
  %690 = insertelement <32 x i8> %685, i8 %689, i32 20
  %691 = extractelement <32 x i32> %585, i32 21
  %692 = sext i32 %691 to i64
  %693 = getelementptr inbounds i8, i8* %input, i64 %692
  %694 = load i8, i8* %693, align 1, !tbaa !237
  %695 = insertelement <32 x i8> %690, i8 %694, i32 21
  %696 = extractelement <32 x i32> %585, i32 22
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds i8, i8* %input, i64 %697
  %699 = load i8, i8* %698, align 1, !tbaa !237
  %700 = insertelement <32 x i8> %695, i8 %699, i32 22
  %701 = extractelement <32 x i32> %585, i32 23
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds i8, i8* %input, i64 %702
  %704 = load i8, i8* %703, align 1, !tbaa !237
  %705 = insertelement <32 x i8> %700, i8 %704, i32 23
  %706 = extractelement <32 x i32> %585, i32 24
  %707 = sext i32 %706 to i64
  %708 = getelementptr inbounds i8, i8* %input, i64 %707
  %709 = load i8, i8* %708, align 1, !tbaa !237
  %710 = insertelement <32 x i8> %705, i8 %709, i32 24
  %711 = extractelement <32 x i32> %585, i32 25
  %712 = sext i32 %711 to i64
  %713 = getelementptr inbounds i8, i8* %input, i64 %712
  %714 = load i8, i8* %713, align 1, !tbaa !237
  %715 = insertelement <32 x i8> %710, i8 %714, i32 25
  %716 = extractelement <32 x i32> %585, i32 26
  %717 = sext i32 %716 to i64
  %718 = getelementptr inbounds i8, i8* %input, i64 %717
  %719 = load i8, i8* %718, align 1, !tbaa !237
  %720 = insertelement <32 x i8> %715, i8 %719, i32 26
  %721 = extractelement <32 x i32> %585, i32 27
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds i8, i8* %input, i64 %722
  %724 = load i8, i8* %723, align 1, !tbaa !237
  %725 = insertelement <32 x i8> %720, i8 %724, i32 27
  %726 = extractelement <32 x i32> %585, i32 28
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds i8, i8* %input, i64 %727
  %729 = load i8, i8* %728, align 1, !tbaa !237
  %730 = insertelement <32 x i8> %725, i8 %729, i32 28
  %731 = extractelement <32 x i32> %585, i32 29
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds i8, i8* %input, i64 %732
  %734 = load i8, i8* %733, align 1, !tbaa !237
  %735 = insertelement <32 x i8> %730, i8 %734, i32 29
  %736 = extractelement <32 x i32> %585, i32 30
  %737 = sext i32 %736 to i64
  %738 = getelementptr inbounds i8, i8* %input, i64 %737
  %739 = load i8, i8* %738, align 1, !tbaa !237
  %740 = insertelement <32 x i8> %735, i8 %739, i32 30
  %741 = extractelement <32 x i32> %585, i32 31
  %742 = sext i32 %741 to i64
  %743 = getelementptr inbounds i8, i8* %input, i64 %742
  %744 = load i8, i8* %743, align 1, !tbaa !237
  %745 = insertelement <32 x i8> %740, i8 %744, i32 31
  %746 = sext i32 %repeat_edge.s0._0._0i.base.s12 to i64
  %747 = add nsw i64 %746, %567
  %748 = getelementptr inbounds i8, i8* %repeat_edge, i64 %747
  %749 = bitcast i8* %748 to <32 x i8>*
  store <32 x i8> %745, <32 x i8>* %749, align 1, !tbaa !240
  %750 = add nuw nsw i32 %repeat_edge.s0._0._0.rebased11, 1
  %.not169 = icmp eq i32 %750, %t314
  br i1 %.not169, label %"end for repeat_edge.s0._0._0.rebased10", label %"for repeat_edge.s0._0._0.rebased9"

"end for repeat_edge.s0._0._0.rebased10":         ; preds = %"for repeat_edge.s0._0._0.rebased9", %"end for repeat_edge.s0._0._0.rebased"
  %indvars.iv.next411 = add nuw nsw i64 %indvars.iv410, 1
  %.not168 = icmp eq i64 %indvars.iv.next411, %126
  br i1 %.not168, label %"end for repeat_edge.s0._1.rebased2", label %"for repeat_edge.s0._1.rebased1"

"for repeat_edge.s0._1.rebased13":                ; preds = %"for repeat_edge.s0._1.rebased13.preheader", %"end for repeat_edge.s0._0._017"
  %repeat_edge.s0._1.rebased15 = phi i32 [ %944, %"end for repeat_edge.s0._0._017" ], [ 0, %"for repeat_edge.s0._1.rebased13.preheader" ]
  %a37 = add nsw i32 %repeat_edge.s0._1.rebased15, %t326
  %751 = icmp sgt i32 %b39, %a37
  %a36 = select i1 %751, i32 %a37, i32 %b39
  br i1 %49, label %"for repeat_edge.s0._0._016.preheader", label %"end for repeat_edge.s0._0._017", !prof !235

"for repeat_edge.s0._0._016.preheader":           ; preds = %"for repeat_edge.s0._1.rebased13"
  %752 = add nsw i32 %repeat_edge.s0._1.rebased15, %repeat_edge.s0._1.epilogue
  %753 = and i32 %752, 15
  %754 = mul nsw i32 %753, %48
  %t329 = sub nsw i32 %754, %t282
  %755 = icmp sgt i32 %a36, 0
  %756 = select i1 %755, i32 %a36, i32 0
  %757 = mul nsw i32 %756, %input.stride.1
  %t328 = sub nsw i32 %757, %input.min.0
  %758 = insertelement <32 x i32> undef, i32 %t328, i32 0
  %759 = shufflevector <32 x i32> %758, <32 x i32> undef, <32 x i32> zeroinitializer
  %760 = sext i32 %t329 to i64
  br label %"for repeat_edge.s0._0._016"

"end for repeat_edge.s0._1.rebased14":            ; preds = %"end for repeat_edge.s0._0._017", %"end for repeat_edge.s0._1.rebased2"
  %.not149 = icmp ne i64 %indvars.iv416, 0
  %or.cond = and i1 %59, %.not149
  br i1 %or.cond, label %"for output.s0.x.x.preheader", label %after_bb20, !prof !243

"for output.s0.x.x.preheader":                    ; preds = %"end for repeat_edge.s0._1.rebased14"
  %761 = add nsw i64 %114, -9
  br label %"for output.s0.x.x"

"for repeat_edge.s0._0._016":                     ; preds = %"for repeat_edge.s0._0._016.preheader", %"for repeat_edge.s0._0._016"
  %repeat_edge.s0._0._018 = phi i32 [ %943, %"for repeat_edge.s0._0._016" ], [ 0, %"for repeat_edge.s0._0._016.preheader" ]
  %762 = shl nsw i32 %repeat_edge.s0._0._018, 5
  %a38 = add nsw i32 %762, %t282
  %763 = icmp sgt i32 %b21, %a38
  %repeat_edge.s0._0._0i.base.s19 = select i1 %763, i32 %a38, i32 %b21
  %764 = add nsw i32 %repeat_edge.s0._0._0i.base.s19, -130
  %765 = insertelement <32 x i32> undef, i32 %764, i32 0
  %766 = shufflevector <32 x i32> %765, <32 x i32> undef, <32 x i32> zeroinitializer
  %a40 = add nsw <32 x i32> %766, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %767 = shufflevector <32 x i32> %a40, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %768 = icmp sgt <16 x i32> %52, %767
  %769 = shufflevector <32 x i32> %a40, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %770 = icmp sgt <16 x i32> %52, %769
  %771 = select <16 x i1> %768, <16 x i32> %767, <16 x i32> %52
  %772 = select <16 x i1> %770, <16 x i32> %769, <16 x i32> %52
  %773 = icmp sgt <16 x i32> %771, %54
  %774 = icmp sgt <16 x i32> %772, %54
  %775 = select <16 x i1> %773, <16 x i32> %771, <16 x i32> %54
  %776 = select <16 x i1> %774, <16 x i32> %772, <16 x i32> %54
  %777 = shufflevector <16 x i32> %775, <16 x i32> %776, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %778 = add nsw <32 x i32> %777, %759
  %779 = extractelement <32 x i32> %778, i32 0
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds i8, i8* %input, i64 %780
  %782 = load i8, i8* %781, align 1, !tbaa !237
  %783 = insertelement <32 x i8> undef, i8 %782, i32 0
  %784 = extractelement <32 x i32> %778, i32 1
  %785 = sext i32 %784 to i64
  %786 = getelementptr inbounds i8, i8* %input, i64 %785
  %787 = load i8, i8* %786, align 1, !tbaa !237
  %788 = insertelement <32 x i8> %783, i8 %787, i32 1
  %789 = extractelement <32 x i32> %778, i32 2
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds i8, i8* %input, i64 %790
  %792 = load i8, i8* %791, align 1, !tbaa !237
  %793 = insertelement <32 x i8> %788, i8 %792, i32 2
  %794 = extractelement <32 x i32> %778, i32 3
  %795 = sext i32 %794 to i64
  %796 = getelementptr inbounds i8, i8* %input, i64 %795
  %797 = load i8, i8* %796, align 1, !tbaa !237
  %798 = insertelement <32 x i8> %793, i8 %797, i32 3
  %799 = extractelement <32 x i32> %778, i32 4
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds i8, i8* %input, i64 %800
  %802 = load i8, i8* %801, align 1, !tbaa !237
  %803 = insertelement <32 x i8> %798, i8 %802, i32 4
  %804 = extractelement <32 x i32> %778, i32 5
  %805 = sext i32 %804 to i64
  %806 = getelementptr inbounds i8, i8* %input, i64 %805
  %807 = load i8, i8* %806, align 1, !tbaa !237
  %808 = insertelement <32 x i8> %803, i8 %807, i32 5
  %809 = extractelement <32 x i32> %778, i32 6
  %810 = sext i32 %809 to i64
  %811 = getelementptr inbounds i8, i8* %input, i64 %810
  %812 = load i8, i8* %811, align 1, !tbaa !237
  %813 = insertelement <32 x i8> %808, i8 %812, i32 6
  %814 = extractelement <32 x i32> %778, i32 7
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds i8, i8* %input, i64 %815
  %817 = load i8, i8* %816, align 1, !tbaa !237
  %818 = insertelement <32 x i8> %813, i8 %817, i32 7
  %819 = extractelement <32 x i32> %778, i32 8
  %820 = sext i32 %819 to i64
  %821 = getelementptr inbounds i8, i8* %input, i64 %820
  %822 = load i8, i8* %821, align 1, !tbaa !237
  %823 = insertelement <32 x i8> %818, i8 %822, i32 8
  %824 = extractelement <32 x i32> %778, i32 9
  %825 = sext i32 %824 to i64
  %826 = getelementptr inbounds i8, i8* %input, i64 %825
  %827 = load i8, i8* %826, align 1, !tbaa !237
  %828 = insertelement <32 x i8> %823, i8 %827, i32 9
  %829 = extractelement <32 x i32> %778, i32 10
  %830 = sext i32 %829 to i64
  %831 = getelementptr inbounds i8, i8* %input, i64 %830
  %832 = load i8, i8* %831, align 1, !tbaa !237
  %833 = insertelement <32 x i8> %828, i8 %832, i32 10
  %834 = extractelement <32 x i32> %778, i32 11
  %835 = sext i32 %834 to i64
  %836 = getelementptr inbounds i8, i8* %input, i64 %835
  %837 = load i8, i8* %836, align 1, !tbaa !237
  %838 = insertelement <32 x i8> %833, i8 %837, i32 11
  %839 = extractelement <32 x i32> %778, i32 12
  %840 = sext i32 %839 to i64
  %841 = getelementptr inbounds i8, i8* %input, i64 %840
  %842 = load i8, i8* %841, align 1, !tbaa !237
  %843 = insertelement <32 x i8> %838, i8 %842, i32 12
  %844 = extractelement <32 x i32> %778, i32 13
  %845 = sext i32 %844 to i64
  %846 = getelementptr inbounds i8, i8* %input, i64 %845
  %847 = load i8, i8* %846, align 1, !tbaa !237
  %848 = insertelement <32 x i8> %843, i8 %847, i32 13
  %849 = extractelement <32 x i32> %778, i32 14
  %850 = sext i32 %849 to i64
  %851 = getelementptr inbounds i8, i8* %input, i64 %850
  %852 = load i8, i8* %851, align 1, !tbaa !237
  %853 = insertelement <32 x i8> %848, i8 %852, i32 14
  %854 = extractelement <32 x i32> %778, i32 15
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds i8, i8* %input, i64 %855
  %857 = load i8, i8* %856, align 1, !tbaa !237
  %858 = insertelement <32 x i8> %853, i8 %857, i32 15
  %859 = extractelement <32 x i32> %778, i32 16
  %860 = sext i32 %859 to i64
  %861 = getelementptr inbounds i8, i8* %input, i64 %860
  %862 = load i8, i8* %861, align 1, !tbaa !237
  %863 = insertelement <32 x i8> %858, i8 %862, i32 16
  %864 = extractelement <32 x i32> %778, i32 17
  %865 = sext i32 %864 to i64
  %866 = getelementptr inbounds i8, i8* %input, i64 %865
  %867 = load i8, i8* %866, align 1, !tbaa !237
  %868 = insertelement <32 x i8> %863, i8 %867, i32 17
  %869 = extractelement <32 x i32> %778, i32 18
  %870 = sext i32 %869 to i64
  %871 = getelementptr inbounds i8, i8* %input, i64 %870
  %872 = load i8, i8* %871, align 1, !tbaa !237
  %873 = insertelement <32 x i8> %868, i8 %872, i32 18
  %874 = extractelement <32 x i32> %778, i32 19
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds i8, i8* %input, i64 %875
  %877 = load i8, i8* %876, align 1, !tbaa !237
  %878 = insertelement <32 x i8> %873, i8 %877, i32 19
  %879 = extractelement <32 x i32> %778, i32 20
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds i8, i8* %input, i64 %880
  %882 = load i8, i8* %881, align 1, !tbaa !237
  %883 = insertelement <32 x i8> %878, i8 %882, i32 20
  %884 = extractelement <32 x i32> %778, i32 21
  %885 = sext i32 %884 to i64
  %886 = getelementptr inbounds i8, i8* %input, i64 %885
  %887 = load i8, i8* %886, align 1, !tbaa !237
  %888 = insertelement <32 x i8> %883, i8 %887, i32 21
  %889 = extractelement <32 x i32> %778, i32 22
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds i8, i8* %input, i64 %890
  %892 = load i8, i8* %891, align 1, !tbaa !237
  %893 = insertelement <32 x i8> %888, i8 %892, i32 22
  %894 = extractelement <32 x i32> %778, i32 23
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds i8, i8* %input, i64 %895
  %897 = load i8, i8* %896, align 1, !tbaa !237
  %898 = insertelement <32 x i8> %893, i8 %897, i32 23
  %899 = extractelement <32 x i32> %778, i32 24
  %900 = sext i32 %899 to i64
  %901 = getelementptr inbounds i8, i8* %input, i64 %900
  %902 = load i8, i8* %901, align 1, !tbaa !237
  %903 = insertelement <32 x i8> %898, i8 %902, i32 24
  %904 = extractelement <32 x i32> %778, i32 25
  %905 = sext i32 %904 to i64
  %906 = getelementptr inbounds i8, i8* %input, i64 %905
  %907 = load i8, i8* %906, align 1, !tbaa !237
  %908 = insertelement <32 x i8> %903, i8 %907, i32 25
  %909 = extractelement <32 x i32> %778, i32 26
  %910 = sext i32 %909 to i64
  %911 = getelementptr inbounds i8, i8* %input, i64 %910
  %912 = load i8, i8* %911, align 1, !tbaa !237
  %913 = insertelement <32 x i8> %908, i8 %912, i32 26
  %914 = extractelement <32 x i32> %778, i32 27
  %915 = sext i32 %914 to i64
  %916 = getelementptr inbounds i8, i8* %input, i64 %915
  %917 = load i8, i8* %916, align 1, !tbaa !237
  %918 = insertelement <32 x i8> %913, i8 %917, i32 27
  %919 = extractelement <32 x i32> %778, i32 28
  %920 = sext i32 %919 to i64
  %921 = getelementptr inbounds i8, i8* %input, i64 %920
  %922 = load i8, i8* %921, align 1, !tbaa !237
  %923 = insertelement <32 x i8> %918, i8 %922, i32 28
  %924 = extractelement <32 x i32> %778, i32 29
  %925 = sext i32 %924 to i64
  %926 = getelementptr inbounds i8, i8* %input, i64 %925
  %927 = load i8, i8* %926, align 1, !tbaa !237
  %928 = insertelement <32 x i8> %923, i8 %927, i32 29
  %929 = extractelement <32 x i32> %778, i32 30
  %930 = sext i32 %929 to i64
  %931 = getelementptr inbounds i8, i8* %input, i64 %930
  %932 = load i8, i8* %931, align 1, !tbaa !237
  %933 = insertelement <32 x i8> %928, i8 %932, i32 30
  %934 = extractelement <32 x i32> %778, i32 31
  %935 = sext i32 %934 to i64
  %936 = getelementptr inbounds i8, i8* %input, i64 %935
  %937 = load i8, i8* %936, align 1, !tbaa !237
  %938 = insertelement <32 x i8> %933, i8 %937, i32 31
  %939 = sext i32 %repeat_edge.s0._0._0i.base.s19 to i64
  %940 = add nsw i64 %939, %760
  %941 = getelementptr inbounds i8, i8* %repeat_edge, i64 %940
  %942 = bitcast i8* %941 to <32 x i8>*
  store <32 x i8> %938, <32 x i8>* %942, align 1, !tbaa !240
  %943 = add nuw nsw i32 %repeat_edge.s0._0._018, 1
  %.not167 = icmp eq i32 %943, %t295
  br i1 %.not167, label %"end for repeat_edge.s0._0._017", label %"for repeat_edge.s0._0._016"

"end for repeat_edge.s0._0._017":                 ; preds = %"for repeat_edge.s0._0._016", %"for repeat_edge.s0._1.rebased13"
  %944 = add nuw nsw i32 %repeat_edge.s0._1.rebased15, 1
  %.not166 = icmp eq i32 %repeat_edge.s0._1.rebased15, %a33.op
  br i1 %.not166, label %"end for repeat_edge.s0._1.rebased14", label %"for repeat_edge.s0._1.rebased13"

after_bb20:                                       ; preds = %"end for output.s0.y.yi.yii", %"end for repeat_edge.s0._1.rebased14"
  %indvars.iv.next417 = add nuw nsw i64 %indvars.iv416, 1
  %.not150 = icmp eq i64 %indvars.iv.next417, 5
  br i1 %.not150, label %"end for output.s0.y.yi.yi.$n.rebased", label %"for output.s0.y.yi.yi.$n.rebased"

"for output.s0.x.x":                              ; preds = %"for output.s0.x.x.preheader", %"end for output.s0.y.yi.yii"
  %output.s0.x.x = phi i32 [ %1279, %"end for output.s0.y.yi.yii" ], [ 0, %"for output.s0.x.x.preheader" ]
  %a41 = shl nsw i32 %output.s0.x.x, 7
  %945 = icmp sgt i32 %b43, %a41
  %output.s0.x.xi.base.s = select i1 %945, i32 %a41, i32 %b43
  %t331 = sub nsw i32 %output.s0.x.xi.base.s, %t293
  %t332 = add nsw i32 %output.s0.x.xi.base.s, %t290
  %946 = sext i32 %t331 to i64
  %947 = sext i32 %t332 to i64
  %948 = insertelement <4 x i64> poison, i64 %946, i32 0
  %949 = shufflevector <4 x i64> %948, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %"for output.s0.y.yi.yii"

"for output.s0.y.yi.yii":                         ; preds = %"for output.s0.x.x", %"for output.s0.y.yi.yii"
  %indvars.iv413 = phi i64 [ 0, %"for output.s0.x.x" ], [ %indvars.iv.next414, %"for output.s0.y.yi.yii" ]
  %950 = add nsw i64 %indvars.iv413, %114
  %951 = insertelement <4 x i64> poison, i64 %950, i32 0
  %952 = shufflevector <4 x i64> %951, <4 x i64> undef, <4 x i32> zeroinitializer
  %953 = add <4 x i64> %952, <i64 6, i64 8, i64 7, i64 5>
  %954 = and <4 x i64> %953, <i64 15, i64 15, i64 15, i64 15>
  %955 = mul nsw <4 x i64> %71, %954
  %956 = add nsw <4 x i64> %955, %949
  %957 = extractelement <4 x i64> %956, i32 0
  %958 = getelementptr inbounds i8, i8* %repeat_edge, i64 %957
  %959 = getelementptr inbounds i8, i8* %958, i64 128
  %960 = bitcast i8* %959 to <16 x i8>*
  %961 = load <16 x i8>, <16 x i8>* %960, align 1, !tbaa !240
  %962 = zext <16 x i8> %961 to <16 x i16>
  %963 = extractelement <4 x i64> %956, i32 1
  %964 = getelementptr inbounds i8, i8* %repeat_edge, i64 %963
  %965 = getelementptr inbounds i8, i8* %964, i64 128
  %966 = bitcast i8* %965 to <16 x i8>*
  %967 = load <16 x i8>, <16 x i8>* %966, align 1, !tbaa !240
  %968 = zext <16 x i8> %967 to <16 x i16>
  %969 = extractelement <4 x i64> %956, i32 2
  %970 = getelementptr inbounds i8, i8* %repeat_edge, i64 %969
  %971 = getelementptr inbounds i8, i8* %970, i64 128
  %972 = bitcast i8* %971 to <16 x i8>*
  %973 = load <16 x i8>, <16 x i8>* %972, align 1, !tbaa !240
  %974 = zext <16 x i8> %973 to <16 x i16>
  %975 = mul nuw nsw <16 x i16> %974, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %976 = extractelement <4 x i64> %956, i32 3
  %977 = getelementptr inbounds i8, i8* %repeat_edge, i64 %976
  %978 = getelementptr inbounds i8, i8* %977, i64 128
  %979 = bitcast i8* %978 to <16 x i8>*
  %980 = load <16 x i8>, <16 x i8>* %979, align 1, !tbaa !240
  %981 = zext <16 x i8> %980 to <16 x i16>
  %982 = add i64 %950, 9
  %983 = and i64 %982, 15
  %984 = mul nsw i64 %61, %983
  %985 = add nsw i64 %984, %946
  %986 = getelementptr inbounds i8, i8* %repeat_edge, i64 %985
  %987 = getelementptr inbounds i8, i8* %986, i64 128
  %988 = bitcast i8* %987 to <16 x i8>*
  %989 = load <16 x i8>, <16 x i8>* %988, align 1, !tbaa !240
  %990 = zext <16 x i8> %989 to <16 x i16>
  %991 = add nuw nsw <16 x i16> %968, %962
  %992 = shl nuw nsw <16 x i16> %991, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %993 = add nuw nsw <16 x i16> %992, %975
  %994 = add nuw nsw <16 x i16> %993, %981
  %995 = add nuw nsw <16 x i16> %994, %990
  store <16 x i16> %995, <16 x i16>* %rows148.0.rows148.0..sroa_cast437, align 64, !tbaa !244
  %996 = getelementptr inbounds i8, i8* %958, i64 144
  %997 = bitcast i8* %996 to <16 x i8>*
  %998 = load <16 x i8>, <16 x i8>* %997, align 1, !tbaa !240
  %999 = zext <16 x i8> %998 to <16 x i16>
  %1000 = getelementptr inbounds i8, i8* %964, i64 144
  %1001 = bitcast i8* %1000 to <16 x i8>*
  %1002 = load <16 x i8>, <16 x i8>* %1001, align 1, !tbaa !240
  %1003 = zext <16 x i8> %1002 to <16 x i16>
  %1004 = getelementptr inbounds i8, i8* %970, i64 144
  %1005 = bitcast i8* %1004 to <16 x i8>*
  %1006 = load <16 x i8>, <16 x i8>* %1005, align 1, !tbaa !240
  %1007 = zext <16 x i8> %1006 to <16 x i16>
  %1008 = mul nuw nsw <16 x i16> %1007, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1009 = getelementptr inbounds i8, i8* %977, i64 144
  %1010 = bitcast i8* %1009 to <16 x i8>*
  %1011 = load <16 x i8>, <16 x i8>* %1010, align 1, !tbaa !240
  %1012 = zext <16 x i8> %1011 to <16 x i16>
  %1013 = getelementptr inbounds i8, i8* %986, i64 144
  %1014 = bitcast i8* %1013 to <16 x i8>*
  %1015 = load <16 x i8>, <16 x i8>* %1014, align 1, !tbaa !240
  %1016 = zext <16 x i8> %1015 to <16 x i16>
  %1017 = add nuw nsw <16 x i16> %1003, %999
  %1018 = shl nuw nsw <16 x i16> %1017, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1019 = add nuw nsw <16 x i16> %1018, %1008
  %1020 = add nuw nsw <16 x i16> %1019, %1012
  %1021 = add nuw nsw <16 x i16> %1020, %1016
  store <16 x i16> %1021, <16 x i16>* %rows148.32.rows148.32..sroa_cast449, align 32, !tbaa !253
  %1022 = getelementptr inbounds i8, i8* %958, i64 160
  %1023 = bitcast i8* %1022 to <16 x i8>*
  %1024 = load <16 x i8>, <16 x i8>* %1023, align 1, !tbaa !240
  %1025 = zext <16 x i8> %1024 to <16 x i16>
  %1026 = getelementptr inbounds i8, i8* %964, i64 160
  %1027 = bitcast i8* %1026 to <16 x i8>*
  %1028 = load <16 x i8>, <16 x i8>* %1027, align 1, !tbaa !240
  %1029 = zext <16 x i8> %1028 to <16 x i16>
  %1030 = getelementptr inbounds i8, i8* %970, i64 160
  %1031 = bitcast i8* %1030 to <16 x i8>*
  %1032 = load <16 x i8>, <16 x i8>* %1031, align 1, !tbaa !240
  %1033 = zext <16 x i8> %1032 to <16 x i16>
  %1034 = mul nuw nsw <16 x i16> %1033, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1035 = getelementptr inbounds i8, i8* %977, i64 160
  %1036 = bitcast i8* %1035 to <16 x i8>*
  %1037 = load <16 x i8>, <16 x i8>* %1036, align 1, !tbaa !240
  %1038 = zext <16 x i8> %1037 to <16 x i16>
  %1039 = getelementptr inbounds i8, i8* %986, i64 160
  %1040 = bitcast i8* %1039 to <16 x i8>*
  %1041 = load <16 x i8>, <16 x i8>* %1040, align 1, !tbaa !240
  %1042 = zext <16 x i8> %1041 to <16 x i16>
  %1043 = add nuw nsw <16 x i16> %1029, %1025
  %1044 = shl nuw nsw <16 x i16> %1043, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1045 = add nuw nsw <16 x i16> %1044, %1034
  %1046 = add nuw nsw <16 x i16> %1045, %1038
  %1047 = add nuw nsw <16 x i16> %1046, %1042
  store <16 x i16> %1047, <16 x i16>* %rows148.64.rows148.64..sroa_cast461, align 64, !tbaa !255
  %1048 = getelementptr inbounds i8, i8* %958, i64 176
  %1049 = bitcast i8* %1048 to <16 x i8>*
  %1050 = load <16 x i8>, <16 x i8>* %1049, align 1, !tbaa !240
  %1051 = zext <16 x i8> %1050 to <16 x i16>
  %1052 = getelementptr inbounds i8, i8* %964, i64 176
  %1053 = bitcast i8* %1052 to <16 x i8>*
  %1054 = load <16 x i8>, <16 x i8>* %1053, align 1, !tbaa !240
  %1055 = zext <16 x i8> %1054 to <16 x i16>
  %1056 = getelementptr inbounds i8, i8* %970, i64 176
  %1057 = bitcast i8* %1056 to <16 x i8>*
  %1058 = load <16 x i8>, <16 x i8>* %1057, align 1, !tbaa !240
  %1059 = zext <16 x i8> %1058 to <16 x i16>
  %1060 = mul nuw nsw <16 x i16> %1059, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1061 = getelementptr inbounds i8, i8* %977, i64 176
  %1062 = bitcast i8* %1061 to <16 x i8>*
  %1063 = load <16 x i8>, <16 x i8>* %1062, align 1, !tbaa !240
  %1064 = zext <16 x i8> %1063 to <16 x i16>
  %1065 = getelementptr inbounds i8, i8* %986, i64 176
  %1066 = bitcast i8* %1065 to <16 x i8>*
  %1067 = load <16 x i8>, <16 x i8>* %1066, align 1, !tbaa !240
  %1068 = zext <16 x i8> %1067 to <16 x i16>
  %1069 = add nuw nsw <16 x i16> %1055, %1051
  %1070 = shl nuw nsw <16 x i16> %1069, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1071 = add nuw nsw <16 x i16> %1070, %1060
  %1072 = add nuw nsw <16 x i16> %1071, %1064
  %1073 = add nuw nsw <16 x i16> %1072, %1068
  store <16 x i16> %1073, <16 x i16>* %rows148.96.rows148.96..sroa_cast473, align 32, !tbaa !258
  %1074 = getelementptr inbounds i8, i8* %958, i64 192
  %1075 = bitcast i8* %1074 to <16 x i8>*
  %1076 = load <16 x i8>, <16 x i8>* %1075, align 1, !tbaa !240
  %1077 = zext <16 x i8> %1076 to <16 x i16>
  %1078 = getelementptr inbounds i8, i8* %964, i64 192
  %1079 = bitcast i8* %1078 to <16 x i8>*
  %1080 = load <16 x i8>, <16 x i8>* %1079, align 1, !tbaa !240
  %1081 = zext <16 x i8> %1080 to <16 x i16>
  %1082 = getelementptr inbounds i8, i8* %970, i64 192
  %1083 = bitcast i8* %1082 to <16 x i8>*
  %1084 = load <16 x i8>, <16 x i8>* %1083, align 1, !tbaa !240
  %1085 = zext <16 x i8> %1084 to <16 x i16>
  %1086 = mul nuw nsw <16 x i16> %1085, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1087 = getelementptr inbounds i8, i8* %977, i64 192
  %1088 = bitcast i8* %1087 to <16 x i8>*
  %1089 = load <16 x i8>, <16 x i8>* %1088, align 1, !tbaa !240
  %1090 = zext <16 x i8> %1089 to <16 x i16>
  %1091 = getelementptr inbounds i8, i8* %986, i64 192
  %1092 = bitcast i8* %1091 to <16 x i8>*
  %1093 = load <16 x i8>, <16 x i8>* %1092, align 1, !tbaa !240
  %1094 = zext <16 x i8> %1093 to <16 x i16>
  %1095 = add nuw nsw <16 x i16> %1081, %1077
  %1096 = shl nuw nsw <16 x i16> %1095, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1097 = add nuw nsw <16 x i16> %1096, %1086
  %1098 = add nuw nsw <16 x i16> %1097, %1090
  %1099 = add nuw nsw <16 x i16> %1098, %1094
  store <16 x i16> %1099, <16 x i16>* %rows148.128.rows148.128..sroa_cast485, align 64, !tbaa !260
  %1100 = getelementptr inbounds i8, i8* %958, i64 208
  %1101 = bitcast i8* %1100 to <16 x i8>*
  %1102 = load <16 x i8>, <16 x i8>* %1101, align 1, !tbaa !240
  %1103 = zext <16 x i8> %1102 to <16 x i16>
  %1104 = getelementptr inbounds i8, i8* %964, i64 208
  %1105 = bitcast i8* %1104 to <16 x i8>*
  %1106 = load <16 x i8>, <16 x i8>* %1105, align 1, !tbaa !240
  %1107 = zext <16 x i8> %1106 to <16 x i16>
  %1108 = getelementptr inbounds i8, i8* %970, i64 208
  %1109 = bitcast i8* %1108 to <16 x i8>*
  %1110 = load <16 x i8>, <16 x i8>* %1109, align 1, !tbaa !240
  %1111 = zext <16 x i8> %1110 to <16 x i16>
  %1112 = mul nuw nsw <16 x i16> %1111, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1113 = getelementptr inbounds i8, i8* %977, i64 208
  %1114 = bitcast i8* %1113 to <16 x i8>*
  %1115 = load <16 x i8>, <16 x i8>* %1114, align 1, !tbaa !240
  %1116 = zext <16 x i8> %1115 to <16 x i16>
  %1117 = getelementptr inbounds i8, i8* %986, i64 208
  %1118 = bitcast i8* %1117 to <16 x i8>*
  %1119 = load <16 x i8>, <16 x i8>* %1118, align 1, !tbaa !240
  %1120 = zext <16 x i8> %1119 to <16 x i16>
  %1121 = add nuw nsw <16 x i16> %1107, %1103
  %1122 = shl nuw nsw <16 x i16> %1121, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1123 = add nuw nsw <16 x i16> %1122, %1112
  %1124 = add nuw nsw <16 x i16> %1123, %1116
  %1125 = add nuw nsw <16 x i16> %1124, %1120
  store <16 x i16> %1125, <16 x i16>* %rows148.160.rows148.160..sroa_cast497, align 32, !tbaa !264
  %1126 = getelementptr inbounds i8, i8* %958, i64 224
  %1127 = bitcast i8* %1126 to <16 x i8>*
  %1128 = load <16 x i8>, <16 x i8>* %1127, align 1, !tbaa !240
  %1129 = zext <16 x i8> %1128 to <16 x i16>
  %1130 = getelementptr inbounds i8, i8* %964, i64 224
  %1131 = bitcast i8* %1130 to <16 x i8>*
  %1132 = load <16 x i8>, <16 x i8>* %1131, align 1, !tbaa !240
  %1133 = zext <16 x i8> %1132 to <16 x i16>
  %1134 = getelementptr inbounds i8, i8* %970, i64 224
  %1135 = bitcast i8* %1134 to <16 x i8>*
  %1136 = load <16 x i8>, <16 x i8>* %1135, align 1, !tbaa !240
  %1137 = zext <16 x i8> %1136 to <16 x i16>
  %1138 = mul nuw nsw <16 x i16> %1137, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1139 = getelementptr inbounds i8, i8* %977, i64 224
  %1140 = bitcast i8* %1139 to <16 x i8>*
  %1141 = load <16 x i8>, <16 x i8>* %1140, align 1, !tbaa !240
  %1142 = zext <16 x i8> %1141 to <16 x i16>
  %1143 = getelementptr inbounds i8, i8* %986, i64 224
  %1144 = bitcast i8* %1143 to <16 x i8>*
  %1145 = load <16 x i8>, <16 x i8>* %1144, align 1, !tbaa !240
  %1146 = zext <16 x i8> %1145 to <16 x i16>
  %1147 = add nuw nsw <16 x i16> %1133, %1129
  %1148 = shl nuw nsw <16 x i16> %1147, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1149 = add nuw nsw <16 x i16> %1148, %1138
  %1150 = add nuw nsw <16 x i16> %1149, %1142
  %1151 = add nuw nsw <16 x i16> %1150, %1146
  store <16 x i16> %1151, <16 x i16>* %rows148.192.rows148.192..sroa_cast509, align 64, !tbaa !266
  %1152 = getelementptr inbounds i8, i8* %958, i64 240
  %1153 = bitcast i8* %1152 to <16 x i8>*
  %1154 = load <16 x i8>, <16 x i8>* %1153, align 1, !tbaa !240
  %1155 = zext <16 x i8> %1154 to <16 x i16>
  %1156 = getelementptr inbounds i8, i8* %964, i64 240
  %1157 = bitcast i8* %1156 to <16 x i8>*
  %1158 = load <16 x i8>, <16 x i8>* %1157, align 1, !tbaa !240
  %1159 = zext <16 x i8> %1158 to <16 x i16>
  %1160 = getelementptr inbounds i8, i8* %970, i64 240
  %1161 = bitcast i8* %1160 to <16 x i8>*
  %1162 = load <16 x i8>, <16 x i8>* %1161, align 1, !tbaa !240
  %1163 = zext <16 x i8> %1162 to <16 x i16>
  %1164 = mul nuw nsw <16 x i16> %1163, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1165 = getelementptr inbounds i8, i8* %977, i64 240
  %1166 = bitcast i8* %1165 to <16 x i8>*
  %1167 = load <16 x i8>, <16 x i8>* %1166, align 1, !tbaa !240
  %1168 = zext <16 x i8> %1167 to <16 x i16>
  %1169 = getelementptr inbounds i8, i8* %986, i64 240
  %1170 = bitcast i8* %1169 to <16 x i8>*
  %1171 = load <16 x i8>, <16 x i8>* %1170, align 1, !tbaa !240
  %1172 = zext <16 x i8> %1171 to <16 x i16>
  %1173 = add nuw nsw <16 x i16> %1159, %1155
  %1174 = shl nuw nsw <16 x i16> %1173, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1175 = add nuw nsw <16 x i16> %1174, %1164
  %1176 = add nuw nsw <16 x i16> %1175, %1168
  %1177 = add nuw nsw <16 x i16> %1176, %1172
  store <16 x i16> %1177, <16 x i16>* %rows148.224.rows148.224..sroa_cast521, align 32, !tbaa !269
  %1178 = getelementptr inbounds i8, i8* %958, i64 256
  %1179 = bitcast i8* %1178 to <16 x i8>*
  %1180 = load <16 x i8>, <16 x i8>* %1179, align 1, !tbaa !240
  %1181 = zext <16 x i8> %1180 to <16 x i16>
  %1182 = getelementptr inbounds i8, i8* %964, i64 256
  %1183 = bitcast i8* %1182 to <16 x i8>*
  %1184 = load <16 x i8>, <16 x i8>* %1183, align 1, !tbaa !240
  %1185 = zext <16 x i8> %1184 to <16 x i16>
  %1186 = getelementptr inbounds i8, i8* %970, i64 256
  %1187 = bitcast i8* %1186 to <16 x i8>*
  %1188 = load <16 x i8>, <16 x i8>* %1187, align 1, !tbaa !240
  %1189 = zext <16 x i8> %1188 to <16 x i16>
  %1190 = mul nuw nsw <16 x i16> %1189, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %1191 = getelementptr inbounds i8, i8* %977, i64 256
  %1192 = bitcast i8* %1191 to <16 x i8>*
  %1193 = load <16 x i8>, <16 x i8>* %1192, align 1, !tbaa !240
  %1194 = zext <16 x i8> %1193 to <16 x i16>
  %1195 = getelementptr inbounds i8, i8* %986, i64 256
  %1196 = bitcast i8* %1195 to <16 x i8>*
  %1197 = load <16 x i8>, <16 x i8>* %1196, align 1, !tbaa !240
  %1198 = zext <16 x i8> %1197 to <16 x i16>
  %1199 = add nuw nsw <16 x i16> %1185, %1181
  %1200 = shl nuw nsw <16 x i16> %1199, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1201 = add nuw nsw <16 x i16> %1200, %1190
  %1202 = add nuw nsw <16 x i16> %1201, %1194
  %1203 = add nuw nsw <16 x i16> %1202, %1198
  store <16 x i16> %1203, <16 x i16>* %rows148.256.rows148.256..sroa_cast531, align 64, !tbaa !271
  %rows148.2.rows148.2.208 = load <16 x i16>, <16 x i16>* %rows148.2.rows148.2..sroa_cast439, align 2, !tbaa !276
  %1204 = shl <16 x i16> %rows148.2.rows148.2.208, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.4.rows148.4.211 = load <16 x i16>, <16 x i16>* %rows148.4.rows148.4..sroa_cast441, align 4, !tbaa !276
  %1205 = mul <16 x i16> %rows148.4.rows148.4.211, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.8.rows148.8.217 = load <16 x i16>, <16 x i16>* %rows148.8.rows148.8..sroa_cast445, align 8, !tbaa !276
  %rows148.6.rows148.6.214 = load <16 x i16>, <16 x i16>* %rows148.6.rows148.6..sroa_cast443, align 2, !tbaa !276
  %1206 = shl <16 x i16> %rows148.6.rows148.6.214, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1207 = add <16 x i16> %1204, %995
  %1208 = add <16 x i16> %1207, %rows148.8.rows148.8.217
  %1209 = add <16 x i16> %1208, %1205
  %1210 = add <16 x i16> %1209, %1206
  %cols147.0.vec.expand371 = shufflevector <16 x i16> %1210, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.34.rows148.34.227 = load <16 x i16>, <16 x i16>* %rows148.34.rows148.34..sroa_cast451, align 2, !tbaa !277
  %1211 = shl <16 x i16> %rows148.34.rows148.34.227, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.36.rows148.36.230 = load <16 x i16>, <16 x i16>* %rows148.36.rows148.36..sroa_cast453, align 4, !tbaa !277
  %1212 = mul <16 x i16> %rows148.36.rows148.36.230, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.40.rows148.40.236 = load <16 x i16>, <16 x i16>* %rows148.40.rows148.40..sroa_cast457, align 8, !tbaa !277
  %rows148.38.rows148.38.233 = load <16 x i16>, <16 x i16>* %rows148.38.rows148.38..sroa_cast455, align 2, !tbaa !277
  %1213 = shl <16 x i16> %rows148.38.rows148.38.233, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1214 = add <16 x i16> %1211, %1021
  %1215 = add <16 x i16> %1214, %rows148.40.rows148.40.236
  %1216 = add <16 x i16> %1215, %1212
  %1217 = add <16 x i16> %1216, %1213
  %cols147.32.vec.expand392 = shufflevector <16 x i16> %1217, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend393 = shufflevector <32 x i16> %cols147.0.vec.expand371, <32 x i16> %cols147.32.vec.expand392, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1218 = lshr <32 x i16> %cols147.32.vecblend393, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %1219 = trunc <32 x i16> %1218 to <32 x i8>
  %1220 = add nsw i64 %761, %indvars.iv413
  %1221 = mul nsw i64 %1220, %62
  %1222 = add nsw i64 %1221, %947
  %1223 = getelementptr inbounds i8, i8* %output, i64 %1222
  %1224 = bitcast i8* %1223 to <32 x i8>*
  store <32 x i8> %1219, <32 x i8>* %1224, align 1, !tbaa !278
  %rows148.66.rows148.66.246 = load <16 x i16>, <16 x i16>* %rows148.66.rows148.66..sroa_cast463, align 2, !tbaa !280
  %1225 = shl <16 x i16> %rows148.66.rows148.66.246, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.68.rows148.68.249 = load <16 x i16>, <16 x i16>* %rows148.68.rows148.68..sroa_cast465, align 4, !tbaa !280
  %1226 = mul <16 x i16> %rows148.68.rows148.68.249, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.72.rows148.72.255 = load <16 x i16>, <16 x i16>* %rows148.72.rows148.72..sroa_cast469, align 8, !tbaa !280
  %rows148.70.rows148.70.252 = load <16 x i16>, <16 x i16>* %rows148.70.rows148.70..sroa_cast467, align 2, !tbaa !280
  %1227 = shl <16 x i16> %rows148.70.rows148.70.252, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1228 = add <16 x i16> %1225, %1047
  %1229 = add <16 x i16> %1228, %rows148.72.rows148.72.255
  %1230 = add <16 x i16> %1229, %1226
  %1231 = add <16 x i16> %1230, %1227
  %cols147.0.vec.expand374 = shufflevector <16 x i16> %1231, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.98.rows148.98.265 = load <16 x i16>, <16 x i16>* %rows148.98.rows148.98..sroa_cast475, align 2, !tbaa !281
  %1232 = shl <16 x i16> %rows148.98.rows148.98.265, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.100.rows148.100.268 = load <16 x i16>, <16 x i16>* %rows148.100.rows148.100..sroa_cast477, align 4, !tbaa !281
  %1233 = mul <16 x i16> %rows148.100.rows148.100.268, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.104.rows148.104.274 = load <16 x i16>, <16 x i16>* %rows148.104.rows148.104..sroa_cast481, align 8, !tbaa !281
  %rows148.102.rows148.102.271 = load <16 x i16>, <16 x i16>* %rows148.102.rows148.102..sroa_cast479, align 2, !tbaa !281
  %1234 = shl <16 x i16> %rows148.102.rows148.102.271, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1235 = add <16 x i16> %1232, %1073
  %1236 = add <16 x i16> %1235, %rows148.104.rows148.104.274
  %1237 = add <16 x i16> %1236, %1233
  %1238 = add <16 x i16> %1237, %1234
  %cols147.32.vec.expand395 = shufflevector <16 x i16> %1238, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend396 = shufflevector <32 x i16> %cols147.0.vec.expand374, <32 x i16> %cols147.32.vec.expand395, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1239 = lshr <32 x i16> %cols147.32.vecblend396, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %1240 = trunc <32 x i16> %1239 to <32 x i8>
  %1241 = getelementptr inbounds i8, i8* %1223, i64 32
  %1242 = bitcast i8* %1241 to <32 x i8>*
  store <32 x i8> %1240, <32 x i8>* %1242, align 1, !tbaa !278
  %rows148.130.rows148.130.284 = load <16 x i16>, <16 x i16>* %rows148.130.rows148.130..sroa_cast487, align 2, !tbaa !282
  %1243 = shl <16 x i16> %rows148.130.rows148.130.284, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.132.rows148.132.287 = load <16 x i16>, <16 x i16>* %rows148.132.rows148.132..sroa_cast489, align 4, !tbaa !282
  %1244 = mul <16 x i16> %rows148.132.rows148.132.287, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.136.rows148.136.293 = load <16 x i16>, <16 x i16>* %rows148.136.rows148.136..sroa_cast493, align 8, !tbaa !282
  %rows148.134.rows148.134.290 = load <16 x i16>, <16 x i16>* %rows148.134.rows148.134..sroa_cast491, align 2, !tbaa !282
  %1245 = shl <16 x i16> %rows148.134.rows148.134.290, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1246 = add <16 x i16> %1243, %1099
  %1247 = add <16 x i16> %1246, %rows148.136.rows148.136.293
  %1248 = add <16 x i16> %1247, %1244
  %1249 = add <16 x i16> %1248, %1245
  %cols147.0.vec.expand377 = shufflevector <16 x i16> %1249, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.162.rows148.162.303 = load <16 x i16>, <16 x i16>* %rows148.162.rows148.162..sroa_cast499, align 2, !tbaa !283
  %1250 = shl <16 x i16> %rows148.162.rows148.162.303, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.164.rows148.164.306 = load <16 x i16>, <16 x i16>* %rows148.164.rows148.164..sroa_cast501, align 4, !tbaa !283
  %1251 = mul <16 x i16> %rows148.164.rows148.164.306, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.168.rows148.168.312 = load <16 x i16>, <16 x i16>* %rows148.168.rows148.168..sroa_cast505, align 8, !tbaa !283
  %rows148.166.rows148.166.309 = load <16 x i16>, <16 x i16>* %rows148.166.rows148.166..sroa_cast503, align 2, !tbaa !283
  %1252 = shl <16 x i16> %rows148.166.rows148.166.309, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1253 = add <16 x i16> %1250, %1125
  %1254 = add <16 x i16> %1253, %rows148.168.rows148.168.312
  %1255 = add <16 x i16> %1254, %1251
  %1256 = add <16 x i16> %1255, %1252
  %cols147.32.vec.expand398 = shufflevector <16 x i16> %1256, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend399 = shufflevector <32 x i16> %cols147.0.vec.expand377, <32 x i16> %cols147.32.vec.expand398, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1257 = lshr <32 x i16> %cols147.32.vecblend399, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %1258 = trunc <32 x i16> %1257 to <32 x i8>
  %1259 = getelementptr inbounds i8, i8* %1223, i64 64
  %1260 = bitcast i8* %1259 to <32 x i8>*
  store <32 x i8> %1258, <32 x i8>* %1260, align 1, !tbaa !278
  %rows148.194.rows148.194.322 = load <16 x i16>, <16 x i16>* %rows148.194.rows148.194..sroa_cast511, align 2, !tbaa !284
  %1261 = shl <16 x i16> %rows148.194.rows148.194.322, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.196.rows148.196.325 = load <16 x i16>, <16 x i16>* %rows148.196.rows148.196..sroa_cast513, align 4, !tbaa !284
  %1262 = mul <16 x i16> %rows148.196.rows148.196.325, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.200.rows148.200.331 = load <16 x i16>, <16 x i16>* %rows148.200.rows148.200..sroa_cast517, align 8, !tbaa !284
  %rows148.198.rows148.198.328 = load <16 x i16>, <16 x i16>* %rows148.198.rows148.198..sroa_cast515, align 2, !tbaa !284
  %1263 = shl <16 x i16> %rows148.198.rows148.198.328, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1264 = add <16 x i16> %1261, %1151
  %1265 = add <16 x i16> %1264, %rows148.200.rows148.200.331
  %1266 = add <16 x i16> %1265, %1262
  %1267 = add <16 x i16> %1266, %1263
  %cols147.0.vec.expand380 = shufflevector <16 x i16> %1267, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.226.rows148.226.341 = load <16 x i16>, <16 x i16>* %rows148.226.rows148.226..sroa_cast523, align 2, !tbaa !285
  %1268 = shl <16 x i16> %rows148.226.rows148.226.341, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %rows148.228.rows148.228.344 = load <16 x i16>, <16 x i16>* %rows148.228.rows148.228..sroa_cast525, align 4, !tbaa !285
  %1269 = mul <16 x i16> %rows148.228.rows148.228.344, <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>
  %rows148.232.rows148.232.350 = load <16 x i16>, <16 x i16>* %rows148.232.rows148.232..sroa_cast529, align 8, !tbaa !285
  %rows148.230.rows148.230.347 = load <16 x i16>, <16 x i16>* %rows148.230.rows148.230..sroa_cast527, align 2, !tbaa !285
  %1270 = shl <16 x i16> %rows148.230.rows148.230.347, <i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %1271 = add <16 x i16> %1268, %1177
  %1272 = add <16 x i16> %1271, %rows148.232.rows148.232.350
  %1273 = add <16 x i16> %1272, %1269
  %1274 = add <16 x i16> %1273, %1270
  %cols147.32.vec.expand401 = shufflevector <16 x i16> %1274, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend402 = shufflevector <32 x i16> %cols147.0.vec.expand380, <32 x i16> %cols147.32.vec.expand401, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %1275 = lshr <32 x i16> %cols147.32.vecblend402, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %1276 = trunc <32 x i16> %1275 to <32 x i8>
  %1277 = getelementptr inbounds i8, i8* %1223, i64 96
  %1278 = bitcast i8* %1277 to <32 x i8>*
  store <32 x i8> %1276, <32 x i8>* %1278, align 1, !tbaa !278
  %indvars.iv.next414 = add nuw nsw i64 %indvars.iv413, 1
  %.not164 = icmp eq i64 %indvars.iv.next414, 9
  br i1 %.not164, label %"end for output.s0.y.yi.yii", label %"for output.s0.y.yi.yii"

"end for output.s0.y.yi.yii":                     ; preds = %"for output.s0.y.yi.yii"
  %1279 = add nuw nsw i32 %output.s0.x.x, 1
  %.not165 = icmp eq i32 %1279, %t288
  br i1 %.not165, label %after_bb20, label %"for output.s0.x.x"

after_bb48:                                       ; preds = %then_bb49, %pseudostack_alloc.exit192
  %repeat_edge.pseudostack_slot.sroa.15.0534 = phi i64 [ %repeat_edge.pseudostack_slot.sroa.15.0535, %then_bb49 ], [ %repeat_edge.pseudostack_slot.sroa.15.0, %pseudostack_alloc.exit192 ]
  %repeat_edge50 = phi i8* [ %1306, %then_bb49 ], [ %102, %pseudostack_alloc.exit192 ]
  %1280 = sub i32 %a68, %output.min.136
  %t29952 = sub i32 %1280, %output.s0.y.yi.base.s47
  %b78 = sub nsw i32 %a66, %output.s0.y.yi.base.s47
  %t30053 = add nsw i32 %output.s0.y.yi.base.s47, %output.min.136
  %b54 = add nsw i32 %a68, %input.extent.131
  %1281 = add nsw i32 %a44, 32
  %b62 = add nsw i32 %input.extent.131, 6
  %1282 = icmp sgt i32 %t29545, 0
  %b63 = add nsw i32 %t29243, 100
  %1283 = add nsw i32 %t29142, -1
  %1284 = insertelement <32 x i32> undef, i32 %1283, i32 0
  %1285 = shufflevector <32 x i32> %1284, <32 x i32> undef, <16 x i32> zeroinitializer
  %1286 = insertelement <32 x i32> undef, i32 %input.min.032, i32 0
  %1287 = shufflevector <32 x i32> %1286, <32 x i32> undef, <16 x i32> zeroinitializer
  %t31476 = sub nsw i32 %t29545, %t28739
  %1288 = icmp sgt i32 %t29646, 0
  %t32089 = sub nsw i32 %t28739, %t29646
  %1289 = icmp sgt i32 %t32089, 0
  %1290 = icmp sgt i32 %t31476, 0
  %1291 = add i32 %output.min.136, -7
  %b81 = add nsw i32 %input.extent.131, -1
  %1292 = icmp sgt i32 %t28840, 0
  %b85 = add nsw i32 %output.extent.034, -128
  %1293 = sext i32 %a44 to i64
  %1294 = add nsw i64 %1293, 32
  %1295 = sext i32 %output.stride.137 to i64
  %1296 = zext i32 %t32089 to i64
  %1297 = sext i32 %input.stride.133 to i64
  %1298 = sext i32 %input.min.032 to i64
  %1299 = sext i32 %t30053 to i64
  %1300 = getelementptr inbounds i8, i8* %input29, i64 -130
  %rows148.0.rows148.0..sroa_cast = bitcast [144 x i16]* %rows148 to <16 x i16>*
  %rows148.32.rows148.32..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 16
  %rows148.32.rows148.32..sroa_cast = bitcast i16* %rows148.32.rows148.32..sroa_idx to <16 x i16>*
  %rows148.64.rows148.64..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 32
  %rows148.64.rows148.64..sroa_cast = bitcast i16* %rows148.64.rows148.64..sroa_idx to <16 x i16>*
  %rows148.96.rows148.96..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 48
  %rows148.96.rows148.96..sroa_cast = bitcast i16* %rows148.96.rows148.96..sroa_idx to <16 x i16>*
  %rows148.128.rows148.128..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 64
  %rows148.128.rows148.128..sroa_cast = bitcast i16* %rows148.128.rows148.128..sroa_idx to <16 x i16>*
  %rows148.160.rows148.160..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 80
  %rows148.160.rows148.160..sroa_cast = bitcast i16* %rows148.160.rows148.160..sroa_idx to <16 x i16>*
  %rows148.192.rows148.192..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 96
  %rows148.192.rows148.192..sroa_cast = bitcast i16* %rows148.192.rows148.192..sroa_idx to <16 x i16>*
  %rows148.224.rows148.224..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 112
  %rows148.224.rows148.224..sroa_cast = bitcast i16* %rows148.224.rows148.224..sroa_idx to <16 x i16>*
  %rows148.256.rows148.256..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 128
  %rows148.256.rows148.256..sroa_cast = bitcast i16* %rows148.256.rows148.256..sroa_idx to <16 x i16>*
  %rows148.2.rows148.2..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 1
  %rows148.2.rows148.2..sroa_cast = bitcast i16* %rows148.2.rows148.2..sroa_idx to <16 x i16>*
  %rows148.4.rows148.4..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 2
  %rows148.4.rows148.4..sroa_cast = bitcast i16* %rows148.4.rows148.4..sroa_idx to <16 x i16>*
  %rows148.8.rows148.8..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 4
  %rows148.8.rows148.8..sroa_cast = bitcast i16* %rows148.8.rows148.8..sroa_idx to <16 x i16>*
  %rows148.6.rows148.6..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 3
  %rows148.6.rows148.6..sroa_cast = bitcast i16* %rows148.6.rows148.6..sroa_idx to <16 x i16>*
  %rows148.34.rows148.34..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 17
  %rows148.34.rows148.34..sroa_cast = bitcast i16* %rows148.34.rows148.34..sroa_idx to <16 x i16>*
  %rows148.36.rows148.36..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 18
  %rows148.36.rows148.36..sroa_cast = bitcast i16* %rows148.36.rows148.36..sroa_idx to <16 x i16>*
  %rows148.40.rows148.40..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 20
  %rows148.40.rows148.40..sroa_cast = bitcast i16* %rows148.40.rows148.40..sroa_idx to <16 x i16>*
  %rows148.38.rows148.38..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 19
  %rows148.38.rows148.38..sroa_cast = bitcast i16* %rows148.38.rows148.38..sroa_idx to <16 x i16>*
  %rows148.66.rows148.66..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 33
  %rows148.66.rows148.66..sroa_cast = bitcast i16* %rows148.66.rows148.66..sroa_idx to <16 x i16>*
  %rows148.68.rows148.68..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 34
  %rows148.68.rows148.68..sroa_cast = bitcast i16* %rows148.68.rows148.68..sroa_idx to <16 x i16>*
  %rows148.72.rows148.72..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 36
  %rows148.72.rows148.72..sroa_cast = bitcast i16* %rows148.72.rows148.72..sroa_idx to <16 x i16>*
  %rows148.70.rows148.70..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 35
  %rows148.70.rows148.70..sroa_cast = bitcast i16* %rows148.70.rows148.70..sroa_idx to <16 x i16>*
  %rows148.98.rows148.98..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 49
  %rows148.98.rows148.98..sroa_cast = bitcast i16* %rows148.98.rows148.98..sroa_idx to <16 x i16>*
  %rows148.100.rows148.100..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 50
  %rows148.100.rows148.100..sroa_cast = bitcast i16* %rows148.100.rows148.100..sroa_idx to <16 x i16>*
  %rows148.104.rows148.104..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 52
  %rows148.104.rows148.104..sroa_cast = bitcast i16* %rows148.104.rows148.104..sroa_idx to <16 x i16>*
  %rows148.102.rows148.102..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 51
  %rows148.102.rows148.102..sroa_cast = bitcast i16* %rows148.102.rows148.102..sroa_idx to <16 x i16>*
  %rows148.130.rows148.130..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 65
  %rows148.130.rows148.130..sroa_cast = bitcast i16* %rows148.130.rows148.130..sroa_idx to <16 x i16>*
  %rows148.132.rows148.132..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 66
  %rows148.132.rows148.132..sroa_cast = bitcast i16* %rows148.132.rows148.132..sroa_idx to <16 x i16>*
  %rows148.136.rows148.136..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 68
  %rows148.136.rows148.136..sroa_cast = bitcast i16* %rows148.136.rows148.136..sroa_idx to <16 x i16>*
  %rows148.134.rows148.134..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 67
  %rows148.134.rows148.134..sroa_cast = bitcast i16* %rows148.134.rows148.134..sroa_idx to <16 x i16>*
  %rows148.162.rows148.162..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 81
  %rows148.162.rows148.162..sroa_cast = bitcast i16* %rows148.162.rows148.162..sroa_idx to <16 x i16>*
  %rows148.164.rows148.164..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 82
  %rows148.164.rows148.164..sroa_cast = bitcast i16* %rows148.164.rows148.164..sroa_idx to <16 x i16>*
  %rows148.168.rows148.168..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 84
  %rows148.168.rows148.168..sroa_cast = bitcast i16* %rows148.168.rows148.168..sroa_idx to <16 x i16>*
  %rows148.166.rows148.166..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 83
  %rows148.166.rows148.166..sroa_cast = bitcast i16* %rows148.166.rows148.166..sroa_idx to <16 x i16>*
  %rows148.194.rows148.194..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 97
  %rows148.194.rows148.194..sroa_cast = bitcast i16* %rows148.194.rows148.194..sroa_idx to <16 x i16>*
  %rows148.196.rows148.196..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 98
  %rows148.196.rows148.196..sroa_cast = bitcast i16* %rows148.196.rows148.196..sroa_idx to <16 x i16>*
  %rows148.200.rows148.200..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 100
  %rows148.200.rows148.200..sroa_cast = bitcast i16* %rows148.200.rows148.200..sroa_idx to <16 x i16>*
  %rows148.198.rows148.198..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 99
  %rows148.198.rows148.198..sroa_cast = bitcast i16* %rows148.198.rows148.198..sroa_idx to <16 x i16>*
  %rows148.226.rows148.226..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 113
  %rows148.226.rows148.226..sroa_cast = bitcast i16* %rows148.226.rows148.226..sroa_idx to <16 x i16>*
  %rows148.228.rows148.228..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 114
  %rows148.228.rows148.228..sroa_cast = bitcast i16* %rows148.228.rows148.228..sroa_idx to <16 x i16>*
  %rows148.232.rows148.232..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 116
  %rows148.232.rows148.232..sroa_cast = bitcast i16* %rows148.232.rows148.232..sroa_idx to <16 x i16>*
  %rows148.230.rows148.230..sroa_idx = getelementptr inbounds [144 x i16], [144 x i16]* %rows148, i64 0, i64 115
  %rows148.230.rows148.230..sroa_cast = bitcast i16* %rows148.230.rows148.230..sroa_idx to <16 x i16>*
  %1301 = add nsw i64 %1296, -1
  %xtraiter537 = and i64 %1296, 3
  %1302 = icmp ult i64 %1301, 3
  %unroll_iter540 = and i64 %1296, 4294967292
  %lcmp.mod539.not = icmp eq i64 %xtraiter537, 0
  %1303 = insertelement <4 x i64> poison, i64 %1294, i32 0
  %1304 = shufflevector <4 x i64> %1303, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %"for output.s0.y.yi.yi.$n.rebased55"

then_bb49:                                        ; preds = %if.end.i187, %pseudostack_alloc.exit192
  %repeat_edge.pseudostack_slot.sroa.15.0535 = phi i64 [ %repeat_edge.pseudostack_slot.sroa.15.0, %pseudostack_alloc.exit192 ], [ %add.i185, %if.end.i187 ]
  %1305 = alloca i8*, i64 %101, align 64
  %1306 = bitcast i8** %1305 to i8*
  br label %after_bb48

"for output.s0.y.yi.yi.$n.rebased55":             ; preds = %after_bb48, %after_bb111
  %indvars.iv429 = phi i64 [ 0, %after_bb48 ], [ %indvars.iv.next430, %after_bb111 ]
  %1307 = mul nuw nsw i64 %indvars.iv429, 9
  %1308 = trunc i64 %1307 to i32
  %1309 = icmp ugt i64 %1307, 5
  %1310 = select i1 %1309, i64 %1307, i64 5
  %1311 = trunc i64 %1310 to i32
  %t33359 = add nsw i32 %t30053, %1311
  %a48 = add nsw i32 %t33359, -7
  %1312 = icmp sgt i32 %a48, %a68
  %a47 = select i1 %1312, i32 %a48, i32 %a68
  %1313 = icmp ult i64 %1307, 5
  %1314 = select i1 %1313, i64 %1307, i64 5
  %1315 = trunc i64 %1314 to i32
  %1316 = add nsw i32 %1315, -3
  %b49 = add i32 %1316, %t33359
  %1317 = icmp sgt i32 %b49, %a47
  %repeat_edge.s0._1.prologue60 = select i1 %1317, i32 %a47, i32 %b49
  %1318 = icmp sgt i32 %a47, %b54
  %a51 = select i1 %1318, i32 %a47, i32 %b54
  %1319 = icmp sgt i32 %b49, %a51
  %repeat_edge.s0._1.epilogue62 = select i1 %1319, i32 %a51, i32 %b49
  %a58 = sub i32 %t29952, %1311
  %1320 = icmp sgt i32 %a58, -7
  %1321 = select i1 %1320, i32 %a58, i32 -7
  %a57 = add nsw i32 %1321, 3
  %1322 = sext i32 %a57 to i64
  %1323 = icmp sgt i64 %1307, %1322
  %a56 = select i1 %1323, i32 %a57, i32 %1308
  %1324 = icmp slt i32 %a56, 5
  %t30564 = select i1 %1324, i32 %a56, i32 5
  %1325 = icmp sgt i32 %t30564, -4
  br i1 %1325, label %"for repeat_edge.s0._1.rebased66.preheader", label %"end for repeat_edge.s0._1.rebased67", !prof !235

"for repeat_edge.s0._1.rebased66.preheader":      ; preds = %"for output.s0.y.yi.yi.$n.rebased55"
  %1326 = add i32 %t33359, 9
  %1327 = sub nsw i32 %t33359, %a68
  %1328 = add nsw i32 %t30564, 3
  br label %"for repeat_edge.s0._1.rebased66"

if.then.i193:                                     ; preds = %after_bb111
  %tobool.not.i195 = icmp ne i8* %repeat_edge50, null
  %cmp.i197 = icmp ugt i64 %repeat_edge.pseudostack_slot.sroa.15.0534, 16384
  %or.cond536 = and i1 %tobool.not.i195, %cmp.i197
  br i1 %or.cond536, label %if.then.i199, label %call_destructor.exit

if.then.i199:                                     ; preds = %if.then.i193
  call void @halide_free(i8* %__user_context, i8* nonnull %repeat_edge50) #16
  br label %call_destructor.exit

call_destructor.exit:                             ; preds = %if.then.i199, %if.then.i193
  ret i32 0

"for repeat_edge.s0._1.rebased66":                ; preds = %"for repeat_edge.s0._1.rebased66.preheader", %"end for repeat_edge.s0._0._072"
  %repeat_edge.s0._1.rebased68 = phi i32 [ %1535, %"end for repeat_edge.s0._0._072" ], [ 0, %"for repeat_edge.s0._1.rebased66.preheader" ]
  %a60 = add nsw i32 %repeat_edge.s0._1.rebased68, %1327
  %1329 = icmp sgt i32 %b62, %a60
  %a59 = select i1 %1329, i32 %a60, i32 %b62
  br i1 %1282, label %"for repeat_edge.s0._0._071.preheader", label %"end for repeat_edge.s0._0._072", !prof !235

"for repeat_edge.s0._0._071.preheader":           ; preds = %"for repeat_edge.s0._1.rebased66"
  %1330 = icmp sgt i32 %a59, 7
  %1331 = select i1 %1330, i32 %a59, i32 7
  %1332 = add nsw i32 %1331, -7
  %1333 = mul nsw i32 %1332, %input.stride.133
  %t30970 = sub nsw i32 %1333, %input.min.032
  %1334 = add i32 %1326, %repeat_edge.s0._1.rebased68
  %1335 = and i32 %1334, 15
  %1336 = mul nsw i32 %1335, %1281
  %t31069 = sub nsw i32 %1336, %t28238
  %1337 = insertelement <32 x i32> undef, i32 %t30970, i32 0
  %1338 = shufflevector <32 x i32> %1337, <32 x i32> undef, <32 x i32> zeroinitializer
  %1339 = sext i32 %t31069 to i64
  br label %"for repeat_edge.s0._0._071"

"end for repeat_edge.s0._1.rebased67":            ; preds = %"end for repeat_edge.s0._0._072", %"for output.s0.y.yi.yi.$n.rebased55"
  %1340 = add nsw i64 %1307, %1299
  %1341 = add nsw i64 %1340, 2
  %1342 = icmp sgt i32 %a66, %a48
  %a65 = select i1 %1342, i32 %a66, i32 %a48
  %1343 = sext i32 %a65 to i64
  %1344 = icmp sgt i64 %1341, %1343
  %1345 = trunc i64 %1341 to i32
  %1346 = select i1 %1344, i32 %a65, i32 %1345
  %1347 = sext i32 %a47 to i64
  %1348 = icmp sgt i64 %1341, %1347
  %1349 = select i1 %1348, i32 %a47, i32 %1345
  %t31175 = sub nsw i32 %1346, %1349
  %1350 = icmp sgt i32 %t31175, 0
  br i1 %1350, label %"for repeat_edge.s0._1.rebased78.preheader", label %"end for repeat_edge.s0._1.rebased79", !prof !235

"for repeat_edge.s0._1.rebased78.preheader":      ; preds = %"end for repeat_edge.s0._1.rebased67"
  %t31277 = sub i32 %repeat_edge.s0._1.prologue60, %a68
  %1351 = sext i32 %t31277 to i64
  %1352 = zext i32 %t31175 to i64
  br label %"for repeat_edge.s0._1.rebased78"

"for repeat_edge.s0._0._071":                     ; preds = %"for repeat_edge.s0._0._071.preheader", %"for repeat_edge.s0._0._071"
  %repeat_edge.s0._0._073 = phi i32 [ %1534, %"for repeat_edge.s0._0._071" ], [ 0, %"for repeat_edge.s0._0._071.preheader" ]
  %1353 = shl nsw i32 %repeat_edge.s0._0._073, 5
  %a61 = add nsw i32 %1353, %t28238
  %1354 = icmp sgt i32 %b63, %a61
  %repeat_edge.s0._0._0i.base.s74 = select i1 %1354, i32 %a61, i32 %b63
  %1355 = add nsw i32 %repeat_edge.s0._0._0i.base.s74, -130
  %1356 = insertelement <32 x i32> undef, i32 %1355, i32 0
  %1357 = shufflevector <32 x i32> %1356, <32 x i32> undef, <32 x i32> zeroinitializer
  %a63 = add nsw <32 x i32> %1357, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1358 = shufflevector <32 x i32> %a63, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1359 = icmp sgt <16 x i32> %1285, %1358
  %1360 = shufflevector <32 x i32> %a63, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1361 = icmp sgt <16 x i32> %1285, %1360
  %1362 = select <16 x i1> %1359, <16 x i32> %1358, <16 x i32> %1285
  %1363 = select <16 x i1> %1361, <16 x i32> %1360, <16 x i32> %1285
  %1364 = icmp sgt <16 x i32> %1362, %1287
  %1365 = icmp sgt <16 x i32> %1363, %1287
  %1366 = select <16 x i1> %1364, <16 x i32> %1362, <16 x i32> %1287
  %1367 = select <16 x i1> %1365, <16 x i32> %1363, <16 x i32> %1287
  %1368 = shufflevector <16 x i32> %1366, <16 x i32> %1367, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1369 = add nsw <32 x i32> %1368, %1338
  %1370 = extractelement <32 x i32> %1369, i32 0
  %1371 = sext i32 %1370 to i64
  %1372 = getelementptr inbounds i8, i8* %input29, i64 %1371
  %1373 = load i8, i8* %1372, align 1, !tbaa !237
  %1374 = insertelement <32 x i8> undef, i8 %1373, i32 0
  %1375 = extractelement <32 x i32> %1369, i32 1
  %1376 = sext i32 %1375 to i64
  %1377 = getelementptr inbounds i8, i8* %input29, i64 %1376
  %1378 = load i8, i8* %1377, align 1, !tbaa !237
  %1379 = insertelement <32 x i8> %1374, i8 %1378, i32 1
  %1380 = extractelement <32 x i32> %1369, i32 2
  %1381 = sext i32 %1380 to i64
  %1382 = getelementptr inbounds i8, i8* %input29, i64 %1381
  %1383 = load i8, i8* %1382, align 1, !tbaa !237
  %1384 = insertelement <32 x i8> %1379, i8 %1383, i32 2
  %1385 = extractelement <32 x i32> %1369, i32 3
  %1386 = sext i32 %1385 to i64
  %1387 = getelementptr inbounds i8, i8* %input29, i64 %1386
  %1388 = load i8, i8* %1387, align 1, !tbaa !237
  %1389 = insertelement <32 x i8> %1384, i8 %1388, i32 3
  %1390 = extractelement <32 x i32> %1369, i32 4
  %1391 = sext i32 %1390 to i64
  %1392 = getelementptr inbounds i8, i8* %input29, i64 %1391
  %1393 = load i8, i8* %1392, align 1, !tbaa !237
  %1394 = insertelement <32 x i8> %1389, i8 %1393, i32 4
  %1395 = extractelement <32 x i32> %1369, i32 5
  %1396 = sext i32 %1395 to i64
  %1397 = getelementptr inbounds i8, i8* %input29, i64 %1396
  %1398 = load i8, i8* %1397, align 1, !tbaa !237
  %1399 = insertelement <32 x i8> %1394, i8 %1398, i32 5
  %1400 = extractelement <32 x i32> %1369, i32 6
  %1401 = sext i32 %1400 to i64
  %1402 = getelementptr inbounds i8, i8* %input29, i64 %1401
  %1403 = load i8, i8* %1402, align 1, !tbaa !237
  %1404 = insertelement <32 x i8> %1399, i8 %1403, i32 6
  %1405 = extractelement <32 x i32> %1369, i32 7
  %1406 = sext i32 %1405 to i64
  %1407 = getelementptr inbounds i8, i8* %input29, i64 %1406
  %1408 = load i8, i8* %1407, align 1, !tbaa !237
  %1409 = insertelement <32 x i8> %1404, i8 %1408, i32 7
  %1410 = extractelement <32 x i32> %1369, i32 8
  %1411 = sext i32 %1410 to i64
  %1412 = getelementptr inbounds i8, i8* %input29, i64 %1411
  %1413 = load i8, i8* %1412, align 1, !tbaa !237
  %1414 = insertelement <32 x i8> %1409, i8 %1413, i32 8
  %1415 = extractelement <32 x i32> %1369, i32 9
  %1416 = sext i32 %1415 to i64
  %1417 = getelementptr inbounds i8, i8* %input29, i64 %1416
  %1418 = load i8, i8* %1417, align 1, !tbaa !237
  %1419 = insertelement <32 x i8> %1414, i8 %1418, i32 9
  %1420 = extractelement <32 x i32> %1369, i32 10
  %1421 = sext i32 %1420 to i64
  %1422 = getelementptr inbounds i8, i8* %input29, i64 %1421
  %1423 = load i8, i8* %1422, align 1, !tbaa !237
  %1424 = insertelement <32 x i8> %1419, i8 %1423, i32 10
  %1425 = extractelement <32 x i32> %1369, i32 11
  %1426 = sext i32 %1425 to i64
  %1427 = getelementptr inbounds i8, i8* %input29, i64 %1426
  %1428 = load i8, i8* %1427, align 1, !tbaa !237
  %1429 = insertelement <32 x i8> %1424, i8 %1428, i32 11
  %1430 = extractelement <32 x i32> %1369, i32 12
  %1431 = sext i32 %1430 to i64
  %1432 = getelementptr inbounds i8, i8* %input29, i64 %1431
  %1433 = load i8, i8* %1432, align 1, !tbaa !237
  %1434 = insertelement <32 x i8> %1429, i8 %1433, i32 12
  %1435 = extractelement <32 x i32> %1369, i32 13
  %1436 = sext i32 %1435 to i64
  %1437 = getelementptr inbounds i8, i8* %input29, i64 %1436
  %1438 = load i8, i8* %1437, align 1, !tbaa !237
  %1439 = insertelement <32 x i8> %1434, i8 %1438, i32 13
  %1440 = extractelement <32 x i32> %1369, i32 14
  %1441 = sext i32 %1440 to i64
  %1442 = getelementptr inbounds i8, i8* %input29, i64 %1441
  %1443 = load i8, i8* %1442, align 1, !tbaa !237
  %1444 = insertelement <32 x i8> %1439, i8 %1443, i32 14
  %1445 = extractelement <32 x i32> %1369, i32 15
  %1446 = sext i32 %1445 to i64
  %1447 = getelementptr inbounds i8, i8* %input29, i64 %1446
  %1448 = load i8, i8* %1447, align 1, !tbaa !237
  %1449 = insertelement <32 x i8> %1444, i8 %1448, i32 15
  %1450 = extractelement <32 x i32> %1369, i32 16
  %1451 = sext i32 %1450 to i64
  %1452 = getelementptr inbounds i8, i8* %input29, i64 %1451
  %1453 = load i8, i8* %1452, align 1, !tbaa !237
  %1454 = insertelement <32 x i8> %1449, i8 %1453, i32 16
  %1455 = extractelement <32 x i32> %1369, i32 17
  %1456 = sext i32 %1455 to i64
  %1457 = getelementptr inbounds i8, i8* %input29, i64 %1456
  %1458 = load i8, i8* %1457, align 1, !tbaa !237
  %1459 = insertelement <32 x i8> %1454, i8 %1458, i32 17
  %1460 = extractelement <32 x i32> %1369, i32 18
  %1461 = sext i32 %1460 to i64
  %1462 = getelementptr inbounds i8, i8* %input29, i64 %1461
  %1463 = load i8, i8* %1462, align 1, !tbaa !237
  %1464 = insertelement <32 x i8> %1459, i8 %1463, i32 18
  %1465 = extractelement <32 x i32> %1369, i32 19
  %1466 = sext i32 %1465 to i64
  %1467 = getelementptr inbounds i8, i8* %input29, i64 %1466
  %1468 = load i8, i8* %1467, align 1, !tbaa !237
  %1469 = insertelement <32 x i8> %1464, i8 %1468, i32 19
  %1470 = extractelement <32 x i32> %1369, i32 20
  %1471 = sext i32 %1470 to i64
  %1472 = getelementptr inbounds i8, i8* %input29, i64 %1471
  %1473 = load i8, i8* %1472, align 1, !tbaa !237
  %1474 = insertelement <32 x i8> %1469, i8 %1473, i32 20
  %1475 = extractelement <32 x i32> %1369, i32 21
  %1476 = sext i32 %1475 to i64
  %1477 = getelementptr inbounds i8, i8* %input29, i64 %1476
  %1478 = load i8, i8* %1477, align 1, !tbaa !237
  %1479 = insertelement <32 x i8> %1474, i8 %1478, i32 21
  %1480 = extractelement <32 x i32> %1369, i32 22
  %1481 = sext i32 %1480 to i64
  %1482 = getelementptr inbounds i8, i8* %input29, i64 %1481
  %1483 = load i8, i8* %1482, align 1, !tbaa !237
  %1484 = insertelement <32 x i8> %1479, i8 %1483, i32 22
  %1485 = extractelement <32 x i32> %1369, i32 23
  %1486 = sext i32 %1485 to i64
  %1487 = getelementptr inbounds i8, i8* %input29, i64 %1486
  %1488 = load i8, i8* %1487, align 1, !tbaa !237
  %1489 = insertelement <32 x i8> %1484, i8 %1488, i32 23
  %1490 = extractelement <32 x i32> %1369, i32 24
  %1491 = sext i32 %1490 to i64
  %1492 = getelementptr inbounds i8, i8* %input29, i64 %1491
  %1493 = load i8, i8* %1492, align 1, !tbaa !237
  %1494 = insertelement <32 x i8> %1489, i8 %1493, i32 24
  %1495 = extractelement <32 x i32> %1369, i32 25
  %1496 = sext i32 %1495 to i64
  %1497 = getelementptr inbounds i8, i8* %input29, i64 %1496
  %1498 = load i8, i8* %1497, align 1, !tbaa !237
  %1499 = insertelement <32 x i8> %1494, i8 %1498, i32 25
  %1500 = extractelement <32 x i32> %1369, i32 26
  %1501 = sext i32 %1500 to i64
  %1502 = getelementptr inbounds i8, i8* %input29, i64 %1501
  %1503 = load i8, i8* %1502, align 1, !tbaa !237
  %1504 = insertelement <32 x i8> %1499, i8 %1503, i32 26
  %1505 = extractelement <32 x i32> %1369, i32 27
  %1506 = sext i32 %1505 to i64
  %1507 = getelementptr inbounds i8, i8* %input29, i64 %1506
  %1508 = load i8, i8* %1507, align 1, !tbaa !237
  %1509 = insertelement <32 x i8> %1504, i8 %1508, i32 27
  %1510 = extractelement <32 x i32> %1369, i32 28
  %1511 = sext i32 %1510 to i64
  %1512 = getelementptr inbounds i8, i8* %input29, i64 %1511
  %1513 = load i8, i8* %1512, align 1, !tbaa !237
  %1514 = insertelement <32 x i8> %1509, i8 %1513, i32 28
  %1515 = extractelement <32 x i32> %1369, i32 29
  %1516 = sext i32 %1515 to i64
  %1517 = getelementptr inbounds i8, i8* %input29, i64 %1516
  %1518 = load i8, i8* %1517, align 1, !tbaa !237
  %1519 = insertelement <32 x i8> %1514, i8 %1518, i32 29
  %1520 = extractelement <32 x i32> %1369, i32 30
  %1521 = sext i32 %1520 to i64
  %1522 = getelementptr inbounds i8, i8* %input29, i64 %1521
  %1523 = load i8, i8* %1522, align 1, !tbaa !237
  %1524 = insertelement <32 x i8> %1519, i8 %1523, i32 30
  %1525 = extractelement <32 x i32> %1369, i32 31
  %1526 = sext i32 %1525 to i64
  %1527 = getelementptr inbounds i8, i8* %input29, i64 %1526
  %1528 = load i8, i8* %1527, align 1, !tbaa !237
  %1529 = insertelement <32 x i8> %1524, i8 %1528, i32 31
  %1530 = sext i32 %repeat_edge.s0._0._0i.base.s74 to i64
  %1531 = add nsw i64 %1530, %1339
  %1532 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1531
  %1533 = bitcast i8* %1532 to <32 x i8>*
  store <32 x i8> %1529, <32 x i8>* %1533, align 1, !tbaa !240
  %1534 = add nuw nsw i32 %repeat_edge.s0._0._073, 1
  %.not163 = icmp eq i32 %1534, %t29545
  br i1 %.not163, label %"end for repeat_edge.s0._0._072", label %"for repeat_edge.s0._0._071"

"end for repeat_edge.s0._0._072":                 ; preds = %"for repeat_edge.s0._0._071", %"for repeat_edge.s0._1.rebased66"
  %1535 = add nuw nsw i32 %repeat_edge.s0._1.rebased68, 1
  %.not162 = icmp eq i32 %repeat_edge.s0._1.rebased68, %1328
  br i1 %.not162, label %"end for repeat_edge.s0._1.rebased67", label %"for repeat_edge.s0._1.rebased66"

"for repeat_edge.s0._1.rebased78":                ; preds = %"for repeat_edge.s0._1.rebased78.preheader", %"end for repeat_edge.s0._0._0.rebased97"
  %indvars.iv423 = phi i64 [ 0, %"for repeat_edge.s0._1.rebased78.preheader" ], [ %indvars.iv.next424, %"end for repeat_edge.s0._0._0.rebased97" ]
  %1536 = trunc i64 %indvars.iv423 to i32
  %1537 = add i32 %repeat_edge.s0._1.prologue60, %1536
  %1538 = and i32 %1537, 15
  %1539 = mul nsw i32 %1538, %1281
  %t31981 = sub nsw i32 %1539, %t28238
  %1540 = add nsw i64 %indvars.iv423, %1351
  %1541 = mul nsw i64 %1540, %1297
  %1542 = sub nsw i64 %1541, %1298
  br i1 %1288, label %"for repeat_edge.s0._0._083.preheader", label %"end for repeat_edge.s0._0._084", !prof !235

"for repeat_edge.s0._0._083.preheader":           ; preds = %"for repeat_edge.s0._1.rebased78"
  %1543 = trunc i64 %1542 to i32
  %1544 = insertelement <32 x i32> undef, i32 %1543, i32 0
  %1545 = shufflevector <32 x i32> %1544, <32 x i32> undef, <32 x i32> zeroinitializer
  %1546 = sext i32 %t31981 to i64
  br label %"for repeat_edge.s0._0._083"

"end for repeat_edge.s0._1.rebased79":            ; preds = %"end for repeat_edge.s0._0._0.rebased97", %"end for repeat_edge.s0._1.rebased67"
  %a76 = add i32 %1291, %1311
  %1547 = icmp sgt i32 %a76, %b78
  %1548 = select i1 %1547, i32 %a76, i32 %b78
  %1549 = trunc i64 %1307 to i32
  %1550 = add i32 %output.min.136, %1549
  %a75 = sub i32 %1550, %1548
  %1551 = icmp sgt i32 %a75, -2
  %t326101 = sub nsw i32 %repeat_edge.s0._1.epilogue62, %a68
  br i1 %1551, label %"for repeat_edge.s0._1.rebased102.preheader", label %"end for repeat_edge.s0._1.rebased103", !prof !235

"for repeat_edge.s0._1.rebased102.preheader":     ; preds = %"end for repeat_edge.s0._1.rebased79"
  %a75.op = add i32 %a75, 1
  br label %"for repeat_edge.s0._1.rebased102"

"for repeat_edge.s0._0._083":                     ; preds = %"for repeat_edge.s0._0._083.preheader", %"for repeat_edge.s0._0._083"
  %repeat_edge.s0._0._085 = phi i32 [ %1733, %"for repeat_edge.s0._0._083" ], [ 0, %"for repeat_edge.s0._0._083.preheader" ]
  %1552 = shl nsw i32 %repeat_edge.s0._0._085, 5
  %a69 = add nsw i32 %1552, %t28238
  %1553 = icmp sgt i32 %b63, %a69
  %repeat_edge.s0._0._0i.base.s86 = select i1 %1553, i32 %a69, i32 %b63
  %1554 = add nsw i32 %repeat_edge.s0._0._0i.base.s86, -130
  %1555 = insertelement <32 x i32> undef, i32 %1554, i32 0
  %1556 = shufflevector <32 x i32> %1555, <32 x i32> undef, <32 x i32> zeroinitializer
  %a71 = add nsw <32 x i32> %1556, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1557 = shufflevector <32 x i32> %a71, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1558 = icmp sgt <16 x i32> %1285, %1557
  %1559 = shufflevector <32 x i32> %a71, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1560 = icmp sgt <16 x i32> %1285, %1559
  %1561 = select <16 x i1> %1558, <16 x i32> %1557, <16 x i32> %1285
  %1562 = select <16 x i1> %1560, <16 x i32> %1559, <16 x i32> %1285
  %1563 = icmp sgt <16 x i32> %1561, %1287
  %1564 = icmp sgt <16 x i32> %1562, %1287
  %1565 = select <16 x i1> %1563, <16 x i32> %1561, <16 x i32> %1287
  %1566 = select <16 x i1> %1564, <16 x i32> %1562, <16 x i32> %1287
  %1567 = shufflevector <16 x i32> %1565, <16 x i32> %1566, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1568 = add nsw <32 x i32> %1567, %1545
  %1569 = extractelement <32 x i32> %1568, i32 0
  %1570 = sext i32 %1569 to i64
  %1571 = getelementptr inbounds i8, i8* %input29, i64 %1570
  %1572 = load i8, i8* %1571, align 1, !tbaa !237
  %1573 = insertelement <32 x i8> undef, i8 %1572, i32 0
  %1574 = extractelement <32 x i32> %1568, i32 1
  %1575 = sext i32 %1574 to i64
  %1576 = getelementptr inbounds i8, i8* %input29, i64 %1575
  %1577 = load i8, i8* %1576, align 1, !tbaa !237
  %1578 = insertelement <32 x i8> %1573, i8 %1577, i32 1
  %1579 = extractelement <32 x i32> %1568, i32 2
  %1580 = sext i32 %1579 to i64
  %1581 = getelementptr inbounds i8, i8* %input29, i64 %1580
  %1582 = load i8, i8* %1581, align 1, !tbaa !237
  %1583 = insertelement <32 x i8> %1578, i8 %1582, i32 2
  %1584 = extractelement <32 x i32> %1568, i32 3
  %1585 = sext i32 %1584 to i64
  %1586 = getelementptr inbounds i8, i8* %input29, i64 %1585
  %1587 = load i8, i8* %1586, align 1, !tbaa !237
  %1588 = insertelement <32 x i8> %1583, i8 %1587, i32 3
  %1589 = extractelement <32 x i32> %1568, i32 4
  %1590 = sext i32 %1589 to i64
  %1591 = getelementptr inbounds i8, i8* %input29, i64 %1590
  %1592 = load i8, i8* %1591, align 1, !tbaa !237
  %1593 = insertelement <32 x i8> %1588, i8 %1592, i32 4
  %1594 = extractelement <32 x i32> %1568, i32 5
  %1595 = sext i32 %1594 to i64
  %1596 = getelementptr inbounds i8, i8* %input29, i64 %1595
  %1597 = load i8, i8* %1596, align 1, !tbaa !237
  %1598 = insertelement <32 x i8> %1593, i8 %1597, i32 5
  %1599 = extractelement <32 x i32> %1568, i32 6
  %1600 = sext i32 %1599 to i64
  %1601 = getelementptr inbounds i8, i8* %input29, i64 %1600
  %1602 = load i8, i8* %1601, align 1, !tbaa !237
  %1603 = insertelement <32 x i8> %1598, i8 %1602, i32 6
  %1604 = extractelement <32 x i32> %1568, i32 7
  %1605 = sext i32 %1604 to i64
  %1606 = getelementptr inbounds i8, i8* %input29, i64 %1605
  %1607 = load i8, i8* %1606, align 1, !tbaa !237
  %1608 = insertelement <32 x i8> %1603, i8 %1607, i32 7
  %1609 = extractelement <32 x i32> %1568, i32 8
  %1610 = sext i32 %1609 to i64
  %1611 = getelementptr inbounds i8, i8* %input29, i64 %1610
  %1612 = load i8, i8* %1611, align 1, !tbaa !237
  %1613 = insertelement <32 x i8> %1608, i8 %1612, i32 8
  %1614 = extractelement <32 x i32> %1568, i32 9
  %1615 = sext i32 %1614 to i64
  %1616 = getelementptr inbounds i8, i8* %input29, i64 %1615
  %1617 = load i8, i8* %1616, align 1, !tbaa !237
  %1618 = insertelement <32 x i8> %1613, i8 %1617, i32 9
  %1619 = extractelement <32 x i32> %1568, i32 10
  %1620 = sext i32 %1619 to i64
  %1621 = getelementptr inbounds i8, i8* %input29, i64 %1620
  %1622 = load i8, i8* %1621, align 1, !tbaa !237
  %1623 = insertelement <32 x i8> %1618, i8 %1622, i32 10
  %1624 = extractelement <32 x i32> %1568, i32 11
  %1625 = sext i32 %1624 to i64
  %1626 = getelementptr inbounds i8, i8* %input29, i64 %1625
  %1627 = load i8, i8* %1626, align 1, !tbaa !237
  %1628 = insertelement <32 x i8> %1623, i8 %1627, i32 11
  %1629 = extractelement <32 x i32> %1568, i32 12
  %1630 = sext i32 %1629 to i64
  %1631 = getelementptr inbounds i8, i8* %input29, i64 %1630
  %1632 = load i8, i8* %1631, align 1, !tbaa !237
  %1633 = insertelement <32 x i8> %1628, i8 %1632, i32 12
  %1634 = extractelement <32 x i32> %1568, i32 13
  %1635 = sext i32 %1634 to i64
  %1636 = getelementptr inbounds i8, i8* %input29, i64 %1635
  %1637 = load i8, i8* %1636, align 1, !tbaa !237
  %1638 = insertelement <32 x i8> %1633, i8 %1637, i32 13
  %1639 = extractelement <32 x i32> %1568, i32 14
  %1640 = sext i32 %1639 to i64
  %1641 = getelementptr inbounds i8, i8* %input29, i64 %1640
  %1642 = load i8, i8* %1641, align 1, !tbaa !237
  %1643 = insertelement <32 x i8> %1638, i8 %1642, i32 14
  %1644 = extractelement <32 x i32> %1568, i32 15
  %1645 = sext i32 %1644 to i64
  %1646 = getelementptr inbounds i8, i8* %input29, i64 %1645
  %1647 = load i8, i8* %1646, align 1, !tbaa !237
  %1648 = insertelement <32 x i8> %1643, i8 %1647, i32 15
  %1649 = extractelement <32 x i32> %1568, i32 16
  %1650 = sext i32 %1649 to i64
  %1651 = getelementptr inbounds i8, i8* %input29, i64 %1650
  %1652 = load i8, i8* %1651, align 1, !tbaa !237
  %1653 = insertelement <32 x i8> %1648, i8 %1652, i32 16
  %1654 = extractelement <32 x i32> %1568, i32 17
  %1655 = sext i32 %1654 to i64
  %1656 = getelementptr inbounds i8, i8* %input29, i64 %1655
  %1657 = load i8, i8* %1656, align 1, !tbaa !237
  %1658 = insertelement <32 x i8> %1653, i8 %1657, i32 17
  %1659 = extractelement <32 x i32> %1568, i32 18
  %1660 = sext i32 %1659 to i64
  %1661 = getelementptr inbounds i8, i8* %input29, i64 %1660
  %1662 = load i8, i8* %1661, align 1, !tbaa !237
  %1663 = insertelement <32 x i8> %1658, i8 %1662, i32 18
  %1664 = extractelement <32 x i32> %1568, i32 19
  %1665 = sext i32 %1664 to i64
  %1666 = getelementptr inbounds i8, i8* %input29, i64 %1665
  %1667 = load i8, i8* %1666, align 1, !tbaa !237
  %1668 = insertelement <32 x i8> %1663, i8 %1667, i32 19
  %1669 = extractelement <32 x i32> %1568, i32 20
  %1670 = sext i32 %1669 to i64
  %1671 = getelementptr inbounds i8, i8* %input29, i64 %1670
  %1672 = load i8, i8* %1671, align 1, !tbaa !237
  %1673 = insertelement <32 x i8> %1668, i8 %1672, i32 20
  %1674 = extractelement <32 x i32> %1568, i32 21
  %1675 = sext i32 %1674 to i64
  %1676 = getelementptr inbounds i8, i8* %input29, i64 %1675
  %1677 = load i8, i8* %1676, align 1, !tbaa !237
  %1678 = insertelement <32 x i8> %1673, i8 %1677, i32 21
  %1679 = extractelement <32 x i32> %1568, i32 22
  %1680 = sext i32 %1679 to i64
  %1681 = getelementptr inbounds i8, i8* %input29, i64 %1680
  %1682 = load i8, i8* %1681, align 1, !tbaa !237
  %1683 = insertelement <32 x i8> %1678, i8 %1682, i32 22
  %1684 = extractelement <32 x i32> %1568, i32 23
  %1685 = sext i32 %1684 to i64
  %1686 = getelementptr inbounds i8, i8* %input29, i64 %1685
  %1687 = load i8, i8* %1686, align 1, !tbaa !237
  %1688 = insertelement <32 x i8> %1683, i8 %1687, i32 23
  %1689 = extractelement <32 x i32> %1568, i32 24
  %1690 = sext i32 %1689 to i64
  %1691 = getelementptr inbounds i8, i8* %input29, i64 %1690
  %1692 = load i8, i8* %1691, align 1, !tbaa !237
  %1693 = insertelement <32 x i8> %1688, i8 %1692, i32 24
  %1694 = extractelement <32 x i32> %1568, i32 25
  %1695 = sext i32 %1694 to i64
  %1696 = getelementptr inbounds i8, i8* %input29, i64 %1695
  %1697 = load i8, i8* %1696, align 1, !tbaa !237
  %1698 = insertelement <32 x i8> %1693, i8 %1697, i32 25
  %1699 = extractelement <32 x i32> %1568, i32 26
  %1700 = sext i32 %1699 to i64
  %1701 = getelementptr inbounds i8, i8* %input29, i64 %1700
  %1702 = load i8, i8* %1701, align 1, !tbaa !237
  %1703 = insertelement <32 x i8> %1698, i8 %1702, i32 26
  %1704 = extractelement <32 x i32> %1568, i32 27
  %1705 = sext i32 %1704 to i64
  %1706 = getelementptr inbounds i8, i8* %input29, i64 %1705
  %1707 = load i8, i8* %1706, align 1, !tbaa !237
  %1708 = insertelement <32 x i8> %1703, i8 %1707, i32 27
  %1709 = extractelement <32 x i32> %1568, i32 28
  %1710 = sext i32 %1709 to i64
  %1711 = getelementptr inbounds i8, i8* %input29, i64 %1710
  %1712 = load i8, i8* %1711, align 1, !tbaa !237
  %1713 = insertelement <32 x i8> %1708, i8 %1712, i32 28
  %1714 = extractelement <32 x i32> %1568, i32 29
  %1715 = sext i32 %1714 to i64
  %1716 = getelementptr inbounds i8, i8* %input29, i64 %1715
  %1717 = load i8, i8* %1716, align 1, !tbaa !237
  %1718 = insertelement <32 x i8> %1713, i8 %1717, i32 29
  %1719 = extractelement <32 x i32> %1568, i32 30
  %1720 = sext i32 %1719 to i64
  %1721 = getelementptr inbounds i8, i8* %input29, i64 %1720
  %1722 = load i8, i8* %1721, align 1, !tbaa !237
  %1723 = insertelement <32 x i8> %1718, i8 %1722, i32 30
  %1724 = extractelement <32 x i32> %1568, i32 31
  %1725 = sext i32 %1724 to i64
  %1726 = getelementptr inbounds i8, i8* %input29, i64 %1725
  %1727 = load i8, i8* %1726, align 1, !tbaa !237
  %1728 = insertelement <32 x i8> %1723, i8 %1727, i32 31
  %1729 = sext i32 %repeat_edge.s0._0._0i.base.s86 to i64
  %1730 = add nsw i64 %1729, %1546
  %1731 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1730
  %1732 = bitcast i8* %1731 to <32 x i8>*
  store <32 x i8> %1728, <32 x i8>* %1732, align 1, !tbaa !240
  %1733 = add nuw nsw i32 %repeat_edge.s0._0._085, 1
  %.not161 = icmp eq i32 %1733, %t29646
  br i1 %.not161, label %"end for repeat_edge.s0._0._084", label %"for repeat_edge.s0._0._083"

"end for repeat_edge.s0._0._084":                 ; preds = %"for repeat_edge.s0._0._083", %"for repeat_edge.s0._1.rebased78"
  br i1 %1289, label %"for repeat_edge.s0._0._0.rebased90.preheader", label %"end for repeat_edge.s0._0._0.rebased91", !prof !235

"for repeat_edge.s0._0._0.rebased90.preheader":   ; preds = %"end for repeat_edge.s0._0._084"
  %1734 = sext i32 %t31981 to i64
  br i1 %1302, label %"end for repeat_edge.s0._0._0.rebased91.loopexit.unr-lcssa", label %"for repeat_edge.s0._0._0.rebased90"

"for repeat_edge.s0._0._0.rebased90":             ; preds = %"for repeat_edge.s0._0._0.rebased90.preheader", %"for repeat_edge.s0._0._0.rebased90"
  %repeat_edge.s0._0._0.rebased92 = phi i32 [ %1778, %"for repeat_edge.s0._0._0.rebased90" ], [ 0, %"for repeat_edge.s0._0._0.rebased90.preheader" ]
  %niter541 = phi i64 [ %niter541.nsub.3, %"for repeat_edge.s0._0._0.rebased90" ], [ %unroll_iter540, %"for repeat_edge.s0._0._0.rebased90.preheader" ]
  %1735 = add nsw i32 %repeat_edge.s0._0._0.rebased92, %t29646
  %1736 = shl nsw i32 %1735, 5
  %repeat_edge.s0._0._0i.base.s93 = add nsw i32 %1736, %t28238
  %1737 = sext i32 %repeat_edge.s0._0._0i.base.s93 to i64
  %1738 = add nsw i64 %1542, %1737
  %1739 = getelementptr inbounds i8, i8* %1300, i64 %1738
  %1740 = bitcast i8* %1739 to <32 x i8>*
  %1741 = load <32 x i8>, <32 x i8>* %1740, align 1, !tbaa !237
  %1742 = add nsw i64 %1737, %1734
  %1743 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1742
  %1744 = bitcast i8* %1743 to <32 x i8>*
  store <32 x i8> %1741, <32 x i8>* %1744, align 1, !tbaa !240
  %1745 = or i32 %repeat_edge.s0._0._0.rebased92, 1
  %1746 = add nsw i32 %1745, %t29646
  %1747 = shl nsw i32 %1746, 5
  %repeat_edge.s0._0._0i.base.s93.1 = add nsw i32 %1747, %t28238
  %1748 = sext i32 %repeat_edge.s0._0._0i.base.s93.1 to i64
  %1749 = add nsw i64 %1542, %1748
  %1750 = getelementptr inbounds i8, i8* %1300, i64 %1749
  %1751 = bitcast i8* %1750 to <32 x i8>*
  %1752 = load <32 x i8>, <32 x i8>* %1751, align 1, !tbaa !237
  %1753 = add nsw i64 %1748, %1734
  %1754 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1753
  %1755 = bitcast i8* %1754 to <32 x i8>*
  store <32 x i8> %1752, <32 x i8>* %1755, align 1, !tbaa !240
  %1756 = or i32 %repeat_edge.s0._0._0.rebased92, 2
  %1757 = add nsw i32 %1756, %t29646
  %1758 = shl nsw i32 %1757, 5
  %repeat_edge.s0._0._0i.base.s93.2 = add nsw i32 %1758, %t28238
  %1759 = sext i32 %repeat_edge.s0._0._0i.base.s93.2 to i64
  %1760 = add nsw i64 %1542, %1759
  %1761 = getelementptr inbounds i8, i8* %1300, i64 %1760
  %1762 = bitcast i8* %1761 to <32 x i8>*
  %1763 = load <32 x i8>, <32 x i8>* %1762, align 1, !tbaa !237
  %1764 = add nsw i64 %1759, %1734
  %1765 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1764
  %1766 = bitcast i8* %1765 to <32 x i8>*
  store <32 x i8> %1763, <32 x i8>* %1766, align 1, !tbaa !240
  %1767 = or i32 %repeat_edge.s0._0._0.rebased92, 3
  %1768 = add nsw i32 %1767, %t29646
  %1769 = shl nsw i32 %1768, 5
  %repeat_edge.s0._0._0i.base.s93.3 = add nsw i32 %1769, %t28238
  %1770 = sext i32 %repeat_edge.s0._0._0i.base.s93.3 to i64
  %1771 = add nsw i64 %1542, %1770
  %1772 = getelementptr inbounds i8, i8* %1300, i64 %1771
  %1773 = bitcast i8* %1772 to <32 x i8>*
  %1774 = load <32 x i8>, <32 x i8>* %1773, align 1, !tbaa !237
  %1775 = add nsw i64 %1770, %1734
  %1776 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1775
  %1777 = bitcast i8* %1776 to <32 x i8>*
  store <32 x i8> %1774, <32 x i8>* %1777, align 1, !tbaa !240
  %1778 = add nuw nsw i32 %repeat_edge.s0._0._0.rebased92, 4
  %niter541.nsub.3 = add i64 %niter541, -4
  %niter541.ncmp.3 = icmp eq i64 %niter541.nsub.3, 0
  br i1 %niter541.ncmp.3, label %"end for repeat_edge.s0._0._0.rebased91.loopexit.unr-lcssa", label %"for repeat_edge.s0._0._0.rebased90"

"end for repeat_edge.s0._0._0.rebased91.loopexit.unr-lcssa": ; preds = %"for repeat_edge.s0._0._0.rebased90", %"for repeat_edge.s0._0._0.rebased90.preheader"
  %repeat_edge.s0._0._0.rebased92.unr = phi i32 [ 0, %"for repeat_edge.s0._0._0.rebased90.preheader" ], [ %1778, %"for repeat_edge.s0._0._0.rebased90" ]
  br i1 %lcmp.mod539.not, label %"end for repeat_edge.s0._0._0.rebased91", label %"for repeat_edge.s0._0._0.rebased90.epil"

"for repeat_edge.s0._0._0.rebased90.epil":        ; preds = %"end for repeat_edge.s0._0._0.rebased91.loopexit.unr-lcssa", %"for repeat_edge.s0._0._0.rebased90.epil"
  %repeat_edge.s0._0._0.rebased92.epil = phi i32 [ %1789, %"for repeat_edge.s0._0._0.rebased90.epil" ], [ %repeat_edge.s0._0._0.rebased92.unr, %"end for repeat_edge.s0._0._0.rebased91.loopexit.unr-lcssa" ]
  %epil.iter538 = phi i64 [ %epil.iter538.sub, %"for repeat_edge.s0._0._0.rebased90.epil" ], [ %xtraiter537, %"end for repeat_edge.s0._0._0.rebased91.loopexit.unr-lcssa" ]
  %1779 = add nsw i32 %repeat_edge.s0._0._0.rebased92.epil, %t29646
  %1780 = shl nsw i32 %1779, 5
  %repeat_edge.s0._0._0i.base.s93.epil = add nsw i32 %1780, %t28238
  %1781 = sext i32 %repeat_edge.s0._0._0i.base.s93.epil to i64
  %1782 = add nsw i64 %1542, %1781
  %1783 = getelementptr inbounds i8, i8* %1300, i64 %1782
  %1784 = bitcast i8* %1783 to <32 x i8>*
  %1785 = load <32 x i8>, <32 x i8>* %1784, align 1, !tbaa !237
  %1786 = add nsw i64 %1781, %1734
  %1787 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1786
  %1788 = bitcast i8* %1787 to <32 x i8>*
  store <32 x i8> %1785, <32 x i8>* %1788, align 1, !tbaa !240
  %1789 = add nuw nsw i32 %repeat_edge.s0._0._0.rebased92.epil, 1
  %epil.iter538.sub = add i64 %epil.iter538, -1
  %epil.iter538.cmp.not = icmp eq i64 %epil.iter538.sub, 0
  br i1 %epil.iter538.cmp.not, label %"end for repeat_edge.s0._0._0.rebased91", label %"for repeat_edge.s0._0._0.rebased90.epil", !llvm.loop !286

"end for repeat_edge.s0._0._0.rebased91":         ; preds = %"end for repeat_edge.s0._0._0.rebased91.loopexit.unr-lcssa", %"for repeat_edge.s0._0._0.rebased90.epil", %"end for repeat_edge.s0._0._084"
  br i1 %1290, label %"for repeat_edge.s0._0._0.rebased96.preheader", label %"end for repeat_edge.s0._0._0.rebased97", !prof !235

"for repeat_edge.s0._0._0.rebased96.preheader":   ; preds = %"end for repeat_edge.s0._0._0.rebased91"
  %1790 = trunc i64 %1542 to i32
  %1791 = insertelement <32 x i32> undef, i32 %1790, i32 0
  %1792 = shufflevector <32 x i32> %1791, <32 x i32> undef, <32 x i32> zeroinitializer
  %1793 = sext i32 %t31981 to i64
  br label %"for repeat_edge.s0._0._0.rebased96"

"for repeat_edge.s0._0._0.rebased96":             ; preds = %"for repeat_edge.s0._0._0.rebased96.preheader", %"for repeat_edge.s0._0._0.rebased96"
  %repeat_edge.s0._0._0.rebased98 = phi i32 [ %1976, %"for repeat_edge.s0._0._0.rebased96" ], [ 0, %"for repeat_edge.s0._0._0.rebased96.preheader" ]
  %1794 = add nsw i32 %repeat_edge.s0._0._0.rebased98, %t28739
  %1795 = shl nsw i32 %1794, 5
  %a72 = add nsw i32 %1795, %t28238
  %1796 = icmp sgt i32 %b63, %a72
  %repeat_edge.s0._0._0i.base.s99 = select i1 %1796, i32 %a72, i32 %b63
  %1797 = add nsw i32 %repeat_edge.s0._0._0i.base.s99, -130
  %1798 = insertelement <32 x i32> undef, i32 %1797, i32 0
  %1799 = shufflevector <32 x i32> %1798, <32 x i32> undef, <32 x i32> zeroinitializer
  %a74 = add nsw <32 x i32> %1799, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1800 = shufflevector <32 x i32> %a74, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1801 = icmp sgt <16 x i32> %1285, %1800
  %1802 = shufflevector <32 x i32> %a74, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1803 = icmp sgt <16 x i32> %1285, %1802
  %1804 = select <16 x i1> %1801, <16 x i32> %1800, <16 x i32> %1285
  %1805 = select <16 x i1> %1803, <16 x i32> %1802, <16 x i32> %1285
  %1806 = icmp sgt <16 x i32> %1804, %1287
  %1807 = icmp sgt <16 x i32> %1805, %1287
  %1808 = select <16 x i1> %1806, <16 x i32> %1804, <16 x i32> %1287
  %1809 = select <16 x i1> %1807, <16 x i32> %1805, <16 x i32> %1287
  %1810 = shufflevector <16 x i32> %1808, <16 x i32> %1809, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1811 = add nsw <32 x i32> %1810, %1792
  %1812 = extractelement <32 x i32> %1811, i32 0
  %1813 = sext i32 %1812 to i64
  %1814 = getelementptr inbounds i8, i8* %input29, i64 %1813
  %1815 = load i8, i8* %1814, align 1, !tbaa !237
  %1816 = insertelement <32 x i8> undef, i8 %1815, i32 0
  %1817 = extractelement <32 x i32> %1811, i32 1
  %1818 = sext i32 %1817 to i64
  %1819 = getelementptr inbounds i8, i8* %input29, i64 %1818
  %1820 = load i8, i8* %1819, align 1, !tbaa !237
  %1821 = insertelement <32 x i8> %1816, i8 %1820, i32 1
  %1822 = extractelement <32 x i32> %1811, i32 2
  %1823 = sext i32 %1822 to i64
  %1824 = getelementptr inbounds i8, i8* %input29, i64 %1823
  %1825 = load i8, i8* %1824, align 1, !tbaa !237
  %1826 = insertelement <32 x i8> %1821, i8 %1825, i32 2
  %1827 = extractelement <32 x i32> %1811, i32 3
  %1828 = sext i32 %1827 to i64
  %1829 = getelementptr inbounds i8, i8* %input29, i64 %1828
  %1830 = load i8, i8* %1829, align 1, !tbaa !237
  %1831 = insertelement <32 x i8> %1826, i8 %1830, i32 3
  %1832 = extractelement <32 x i32> %1811, i32 4
  %1833 = sext i32 %1832 to i64
  %1834 = getelementptr inbounds i8, i8* %input29, i64 %1833
  %1835 = load i8, i8* %1834, align 1, !tbaa !237
  %1836 = insertelement <32 x i8> %1831, i8 %1835, i32 4
  %1837 = extractelement <32 x i32> %1811, i32 5
  %1838 = sext i32 %1837 to i64
  %1839 = getelementptr inbounds i8, i8* %input29, i64 %1838
  %1840 = load i8, i8* %1839, align 1, !tbaa !237
  %1841 = insertelement <32 x i8> %1836, i8 %1840, i32 5
  %1842 = extractelement <32 x i32> %1811, i32 6
  %1843 = sext i32 %1842 to i64
  %1844 = getelementptr inbounds i8, i8* %input29, i64 %1843
  %1845 = load i8, i8* %1844, align 1, !tbaa !237
  %1846 = insertelement <32 x i8> %1841, i8 %1845, i32 6
  %1847 = extractelement <32 x i32> %1811, i32 7
  %1848 = sext i32 %1847 to i64
  %1849 = getelementptr inbounds i8, i8* %input29, i64 %1848
  %1850 = load i8, i8* %1849, align 1, !tbaa !237
  %1851 = insertelement <32 x i8> %1846, i8 %1850, i32 7
  %1852 = extractelement <32 x i32> %1811, i32 8
  %1853 = sext i32 %1852 to i64
  %1854 = getelementptr inbounds i8, i8* %input29, i64 %1853
  %1855 = load i8, i8* %1854, align 1, !tbaa !237
  %1856 = insertelement <32 x i8> %1851, i8 %1855, i32 8
  %1857 = extractelement <32 x i32> %1811, i32 9
  %1858 = sext i32 %1857 to i64
  %1859 = getelementptr inbounds i8, i8* %input29, i64 %1858
  %1860 = load i8, i8* %1859, align 1, !tbaa !237
  %1861 = insertelement <32 x i8> %1856, i8 %1860, i32 9
  %1862 = extractelement <32 x i32> %1811, i32 10
  %1863 = sext i32 %1862 to i64
  %1864 = getelementptr inbounds i8, i8* %input29, i64 %1863
  %1865 = load i8, i8* %1864, align 1, !tbaa !237
  %1866 = insertelement <32 x i8> %1861, i8 %1865, i32 10
  %1867 = extractelement <32 x i32> %1811, i32 11
  %1868 = sext i32 %1867 to i64
  %1869 = getelementptr inbounds i8, i8* %input29, i64 %1868
  %1870 = load i8, i8* %1869, align 1, !tbaa !237
  %1871 = insertelement <32 x i8> %1866, i8 %1870, i32 11
  %1872 = extractelement <32 x i32> %1811, i32 12
  %1873 = sext i32 %1872 to i64
  %1874 = getelementptr inbounds i8, i8* %input29, i64 %1873
  %1875 = load i8, i8* %1874, align 1, !tbaa !237
  %1876 = insertelement <32 x i8> %1871, i8 %1875, i32 12
  %1877 = extractelement <32 x i32> %1811, i32 13
  %1878 = sext i32 %1877 to i64
  %1879 = getelementptr inbounds i8, i8* %input29, i64 %1878
  %1880 = load i8, i8* %1879, align 1, !tbaa !237
  %1881 = insertelement <32 x i8> %1876, i8 %1880, i32 13
  %1882 = extractelement <32 x i32> %1811, i32 14
  %1883 = sext i32 %1882 to i64
  %1884 = getelementptr inbounds i8, i8* %input29, i64 %1883
  %1885 = load i8, i8* %1884, align 1, !tbaa !237
  %1886 = insertelement <32 x i8> %1881, i8 %1885, i32 14
  %1887 = extractelement <32 x i32> %1811, i32 15
  %1888 = sext i32 %1887 to i64
  %1889 = getelementptr inbounds i8, i8* %input29, i64 %1888
  %1890 = load i8, i8* %1889, align 1, !tbaa !237
  %1891 = insertelement <32 x i8> %1886, i8 %1890, i32 15
  %1892 = extractelement <32 x i32> %1811, i32 16
  %1893 = sext i32 %1892 to i64
  %1894 = getelementptr inbounds i8, i8* %input29, i64 %1893
  %1895 = load i8, i8* %1894, align 1, !tbaa !237
  %1896 = insertelement <32 x i8> %1891, i8 %1895, i32 16
  %1897 = extractelement <32 x i32> %1811, i32 17
  %1898 = sext i32 %1897 to i64
  %1899 = getelementptr inbounds i8, i8* %input29, i64 %1898
  %1900 = load i8, i8* %1899, align 1, !tbaa !237
  %1901 = insertelement <32 x i8> %1896, i8 %1900, i32 17
  %1902 = extractelement <32 x i32> %1811, i32 18
  %1903 = sext i32 %1902 to i64
  %1904 = getelementptr inbounds i8, i8* %input29, i64 %1903
  %1905 = load i8, i8* %1904, align 1, !tbaa !237
  %1906 = insertelement <32 x i8> %1901, i8 %1905, i32 18
  %1907 = extractelement <32 x i32> %1811, i32 19
  %1908 = sext i32 %1907 to i64
  %1909 = getelementptr inbounds i8, i8* %input29, i64 %1908
  %1910 = load i8, i8* %1909, align 1, !tbaa !237
  %1911 = insertelement <32 x i8> %1906, i8 %1910, i32 19
  %1912 = extractelement <32 x i32> %1811, i32 20
  %1913 = sext i32 %1912 to i64
  %1914 = getelementptr inbounds i8, i8* %input29, i64 %1913
  %1915 = load i8, i8* %1914, align 1, !tbaa !237
  %1916 = insertelement <32 x i8> %1911, i8 %1915, i32 20
  %1917 = extractelement <32 x i32> %1811, i32 21
  %1918 = sext i32 %1917 to i64
  %1919 = getelementptr inbounds i8, i8* %input29, i64 %1918
  %1920 = load i8, i8* %1919, align 1, !tbaa !237
  %1921 = insertelement <32 x i8> %1916, i8 %1920, i32 21
  %1922 = extractelement <32 x i32> %1811, i32 22
  %1923 = sext i32 %1922 to i64
  %1924 = getelementptr inbounds i8, i8* %input29, i64 %1923
  %1925 = load i8, i8* %1924, align 1, !tbaa !237
  %1926 = insertelement <32 x i8> %1921, i8 %1925, i32 22
  %1927 = extractelement <32 x i32> %1811, i32 23
  %1928 = sext i32 %1927 to i64
  %1929 = getelementptr inbounds i8, i8* %input29, i64 %1928
  %1930 = load i8, i8* %1929, align 1, !tbaa !237
  %1931 = insertelement <32 x i8> %1926, i8 %1930, i32 23
  %1932 = extractelement <32 x i32> %1811, i32 24
  %1933 = sext i32 %1932 to i64
  %1934 = getelementptr inbounds i8, i8* %input29, i64 %1933
  %1935 = load i8, i8* %1934, align 1, !tbaa !237
  %1936 = insertelement <32 x i8> %1931, i8 %1935, i32 24
  %1937 = extractelement <32 x i32> %1811, i32 25
  %1938 = sext i32 %1937 to i64
  %1939 = getelementptr inbounds i8, i8* %input29, i64 %1938
  %1940 = load i8, i8* %1939, align 1, !tbaa !237
  %1941 = insertelement <32 x i8> %1936, i8 %1940, i32 25
  %1942 = extractelement <32 x i32> %1811, i32 26
  %1943 = sext i32 %1942 to i64
  %1944 = getelementptr inbounds i8, i8* %input29, i64 %1943
  %1945 = load i8, i8* %1944, align 1, !tbaa !237
  %1946 = insertelement <32 x i8> %1941, i8 %1945, i32 26
  %1947 = extractelement <32 x i32> %1811, i32 27
  %1948 = sext i32 %1947 to i64
  %1949 = getelementptr inbounds i8, i8* %input29, i64 %1948
  %1950 = load i8, i8* %1949, align 1, !tbaa !237
  %1951 = insertelement <32 x i8> %1946, i8 %1950, i32 27
  %1952 = extractelement <32 x i32> %1811, i32 28
  %1953 = sext i32 %1952 to i64
  %1954 = getelementptr inbounds i8, i8* %input29, i64 %1953
  %1955 = load i8, i8* %1954, align 1, !tbaa !237
  %1956 = insertelement <32 x i8> %1951, i8 %1955, i32 28
  %1957 = extractelement <32 x i32> %1811, i32 29
  %1958 = sext i32 %1957 to i64
  %1959 = getelementptr inbounds i8, i8* %input29, i64 %1958
  %1960 = load i8, i8* %1959, align 1, !tbaa !237
  %1961 = insertelement <32 x i8> %1956, i8 %1960, i32 29
  %1962 = extractelement <32 x i32> %1811, i32 30
  %1963 = sext i32 %1962 to i64
  %1964 = getelementptr inbounds i8, i8* %input29, i64 %1963
  %1965 = load i8, i8* %1964, align 1, !tbaa !237
  %1966 = insertelement <32 x i8> %1961, i8 %1965, i32 30
  %1967 = extractelement <32 x i32> %1811, i32 31
  %1968 = sext i32 %1967 to i64
  %1969 = getelementptr inbounds i8, i8* %input29, i64 %1968
  %1970 = load i8, i8* %1969, align 1, !tbaa !237
  %1971 = insertelement <32 x i8> %1966, i8 %1970, i32 31
  %1972 = sext i32 %repeat_edge.s0._0._0i.base.s99 to i64
  %1973 = add nsw i64 %1972, %1793
  %1974 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %1973
  %1975 = bitcast i8* %1974 to <32 x i8>*
  store <32 x i8> %1971, <32 x i8>* %1975, align 1, !tbaa !240
  %1976 = add nuw nsw i32 %repeat_edge.s0._0._0.rebased98, 1
  %.not159 = icmp eq i32 %1976, %t31476
  br i1 %.not159, label %"end for repeat_edge.s0._0._0.rebased97", label %"for repeat_edge.s0._0._0.rebased96"

"end for repeat_edge.s0._0._0.rebased97":         ; preds = %"for repeat_edge.s0._0._0.rebased96", %"end for repeat_edge.s0._0._0.rebased91"
  %indvars.iv.next424 = add nuw nsw i64 %indvars.iv423, 1
  %.not158 = icmp eq i64 %indvars.iv.next424, %1352
  br i1 %.not158, label %"end for repeat_edge.s0._1.rebased79", label %"for repeat_edge.s0._1.rebased78"

"for repeat_edge.s0._1.rebased102":               ; preds = %"for repeat_edge.s0._1.rebased102.preheader", %"end for repeat_edge.s0._0._0108"
  %repeat_edge.s0._1.rebased104 = phi i32 [ %2170, %"end for repeat_edge.s0._0._0108" ], [ 0, %"for repeat_edge.s0._1.rebased102.preheader" ]
  %a79 = add nsw i32 %repeat_edge.s0._1.rebased104, %t326101
  %1977 = icmp sgt i32 %b81, %a79
  %a78 = select i1 %1977, i32 %a79, i32 %b81
  br i1 %1282, label %"for repeat_edge.s0._0._0107.preheader", label %"end for repeat_edge.s0._0._0108", !prof !235

"for repeat_edge.s0._0._0107.preheader":          ; preds = %"for repeat_edge.s0._1.rebased102"
  %1978 = add nsw i32 %repeat_edge.s0._1.rebased104, %repeat_edge.s0._1.epilogue62
  %1979 = and i32 %1978, 15
  %1980 = mul nsw i32 %1979, %1281
  %t329106 = sub nsw i32 %1980, %t28238
  %1981 = icmp sgt i32 %a78, 0
  %1982 = select i1 %1981, i32 %a78, i32 0
  %1983 = mul nsw i32 %1982, %input.stride.133
  %t328105 = sub nsw i32 %1983, %input.min.032
  %1984 = insertelement <32 x i32> undef, i32 %t328105, i32 0
  %1985 = shufflevector <32 x i32> %1984, <32 x i32> undef, <32 x i32> zeroinitializer
  %1986 = sext i32 %t329106 to i64
  br label %"for repeat_edge.s0._0._0107"

"end for repeat_edge.s0._1.rebased103":           ; preds = %"end for repeat_edge.s0._0._0108", %"end for repeat_edge.s0._1.rebased79"
  %.not152 = icmp ne i64 %indvars.iv429, 0
  %or.cond174 = and i1 %1292, %.not152
  br i1 %or.cond174, label %"for output.s0.x.x116.preheader", label %after_bb111, !prof !243

"for output.s0.x.x116.preheader":                 ; preds = %"end for repeat_edge.s0._1.rebased103"
  %1987 = add nsw i64 %1340, -9
  br label %"for output.s0.x.x116"

"for repeat_edge.s0._0._0107":                    ; preds = %"for repeat_edge.s0._0._0107.preheader", %"for repeat_edge.s0._0._0107"
  %repeat_edge.s0._0._0109 = phi i32 [ %2169, %"for repeat_edge.s0._0._0107" ], [ 0, %"for repeat_edge.s0._0._0107.preheader" ]
  %1988 = shl nsw i32 %repeat_edge.s0._0._0109, 5
  %a80 = add nsw i32 %1988, %t28238
  %1989 = icmp sgt i32 %b63, %a80
  %repeat_edge.s0._0._0i.base.s110 = select i1 %1989, i32 %a80, i32 %b63
  %1990 = add nsw i32 %repeat_edge.s0._0._0i.base.s110, -130
  %1991 = insertelement <32 x i32> undef, i32 %1990, i32 0
  %1992 = shufflevector <32 x i32> %1991, <32 x i32> undef, <32 x i32> zeroinitializer
  %a82 = add nsw <32 x i32> %1992, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1993 = shufflevector <32 x i32> %a82, <32 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %1994 = icmp sgt <16 x i32> %1285, %1993
  %1995 = shufflevector <32 x i32> %a82, <32 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %1996 = icmp sgt <16 x i32> %1285, %1995
  %1997 = select <16 x i1> %1994, <16 x i32> %1993, <16 x i32> %1285
  %1998 = select <16 x i1> %1996, <16 x i32> %1995, <16 x i32> %1285
  %1999 = icmp sgt <16 x i32> %1997, %1287
  %2000 = icmp sgt <16 x i32> %1998, %1287
  %2001 = select <16 x i1> %1999, <16 x i32> %1997, <16 x i32> %1287
  %2002 = select <16 x i1> %2000, <16 x i32> %1998, <16 x i32> %1287
  %2003 = shufflevector <16 x i32> %2001, <16 x i32> %2002, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %2004 = add nsw <32 x i32> %2003, %1985
  %2005 = extractelement <32 x i32> %2004, i32 0
  %2006 = sext i32 %2005 to i64
  %2007 = getelementptr inbounds i8, i8* %input29, i64 %2006
  %2008 = load i8, i8* %2007, align 1, !tbaa !237
  %2009 = insertelement <32 x i8> undef, i8 %2008, i32 0
  %2010 = extractelement <32 x i32> %2004, i32 1
  %2011 = sext i32 %2010 to i64
  %2012 = getelementptr inbounds i8, i8* %input29, i64 %2011
  %2013 = load i8, i8* %2012, align 1, !tbaa !237
  %2014 = insertelement <32 x i8> %2009, i8 %2013, i32 1
  %2015 = extractelement <32 x i32> %2004, i32 2
  %2016 = sext i32 %2015 to i64
  %2017 = getelementptr inbounds i8, i8* %input29, i64 %2016
  %2018 = load i8, i8* %2017, align 1, !tbaa !237
  %2019 = insertelement <32 x i8> %2014, i8 %2018, i32 2
  %2020 = extractelement <32 x i32> %2004, i32 3
  %2021 = sext i32 %2020 to i64
  %2022 = getelementptr inbounds i8, i8* %input29, i64 %2021
  %2023 = load i8, i8* %2022, align 1, !tbaa !237
  %2024 = insertelement <32 x i8> %2019, i8 %2023, i32 3
  %2025 = extractelement <32 x i32> %2004, i32 4
  %2026 = sext i32 %2025 to i64
  %2027 = getelementptr inbounds i8, i8* %input29, i64 %2026
  %2028 = load i8, i8* %2027, align 1, !tbaa !237
  %2029 = insertelement <32 x i8> %2024, i8 %2028, i32 4
  %2030 = extractelement <32 x i32> %2004, i32 5
  %2031 = sext i32 %2030 to i64
  %2032 = getelementptr inbounds i8, i8* %input29, i64 %2031
  %2033 = load i8, i8* %2032, align 1, !tbaa !237
  %2034 = insertelement <32 x i8> %2029, i8 %2033, i32 5
  %2035 = extractelement <32 x i32> %2004, i32 6
  %2036 = sext i32 %2035 to i64
  %2037 = getelementptr inbounds i8, i8* %input29, i64 %2036
  %2038 = load i8, i8* %2037, align 1, !tbaa !237
  %2039 = insertelement <32 x i8> %2034, i8 %2038, i32 6
  %2040 = extractelement <32 x i32> %2004, i32 7
  %2041 = sext i32 %2040 to i64
  %2042 = getelementptr inbounds i8, i8* %input29, i64 %2041
  %2043 = load i8, i8* %2042, align 1, !tbaa !237
  %2044 = insertelement <32 x i8> %2039, i8 %2043, i32 7
  %2045 = extractelement <32 x i32> %2004, i32 8
  %2046 = sext i32 %2045 to i64
  %2047 = getelementptr inbounds i8, i8* %input29, i64 %2046
  %2048 = load i8, i8* %2047, align 1, !tbaa !237
  %2049 = insertelement <32 x i8> %2044, i8 %2048, i32 8
  %2050 = extractelement <32 x i32> %2004, i32 9
  %2051 = sext i32 %2050 to i64
  %2052 = getelementptr inbounds i8, i8* %input29, i64 %2051
  %2053 = load i8, i8* %2052, align 1, !tbaa !237
  %2054 = insertelement <32 x i8> %2049, i8 %2053, i32 9
  %2055 = extractelement <32 x i32> %2004, i32 10
  %2056 = sext i32 %2055 to i64
  %2057 = getelementptr inbounds i8, i8* %input29, i64 %2056
  %2058 = load i8, i8* %2057, align 1, !tbaa !237
  %2059 = insertelement <32 x i8> %2054, i8 %2058, i32 10
  %2060 = extractelement <32 x i32> %2004, i32 11
  %2061 = sext i32 %2060 to i64
  %2062 = getelementptr inbounds i8, i8* %input29, i64 %2061
  %2063 = load i8, i8* %2062, align 1, !tbaa !237
  %2064 = insertelement <32 x i8> %2059, i8 %2063, i32 11
  %2065 = extractelement <32 x i32> %2004, i32 12
  %2066 = sext i32 %2065 to i64
  %2067 = getelementptr inbounds i8, i8* %input29, i64 %2066
  %2068 = load i8, i8* %2067, align 1, !tbaa !237
  %2069 = insertelement <32 x i8> %2064, i8 %2068, i32 12
  %2070 = extractelement <32 x i32> %2004, i32 13
  %2071 = sext i32 %2070 to i64
  %2072 = getelementptr inbounds i8, i8* %input29, i64 %2071
  %2073 = load i8, i8* %2072, align 1, !tbaa !237
  %2074 = insertelement <32 x i8> %2069, i8 %2073, i32 13
  %2075 = extractelement <32 x i32> %2004, i32 14
  %2076 = sext i32 %2075 to i64
  %2077 = getelementptr inbounds i8, i8* %input29, i64 %2076
  %2078 = load i8, i8* %2077, align 1, !tbaa !237
  %2079 = insertelement <32 x i8> %2074, i8 %2078, i32 14
  %2080 = extractelement <32 x i32> %2004, i32 15
  %2081 = sext i32 %2080 to i64
  %2082 = getelementptr inbounds i8, i8* %input29, i64 %2081
  %2083 = load i8, i8* %2082, align 1, !tbaa !237
  %2084 = insertelement <32 x i8> %2079, i8 %2083, i32 15
  %2085 = extractelement <32 x i32> %2004, i32 16
  %2086 = sext i32 %2085 to i64
  %2087 = getelementptr inbounds i8, i8* %input29, i64 %2086
  %2088 = load i8, i8* %2087, align 1, !tbaa !237
  %2089 = insertelement <32 x i8> %2084, i8 %2088, i32 16
  %2090 = extractelement <32 x i32> %2004, i32 17
  %2091 = sext i32 %2090 to i64
  %2092 = getelementptr inbounds i8, i8* %input29, i64 %2091
  %2093 = load i8, i8* %2092, align 1, !tbaa !237
  %2094 = insertelement <32 x i8> %2089, i8 %2093, i32 17
  %2095 = extractelement <32 x i32> %2004, i32 18
  %2096 = sext i32 %2095 to i64
  %2097 = getelementptr inbounds i8, i8* %input29, i64 %2096
  %2098 = load i8, i8* %2097, align 1, !tbaa !237
  %2099 = insertelement <32 x i8> %2094, i8 %2098, i32 18
  %2100 = extractelement <32 x i32> %2004, i32 19
  %2101 = sext i32 %2100 to i64
  %2102 = getelementptr inbounds i8, i8* %input29, i64 %2101
  %2103 = load i8, i8* %2102, align 1, !tbaa !237
  %2104 = insertelement <32 x i8> %2099, i8 %2103, i32 19
  %2105 = extractelement <32 x i32> %2004, i32 20
  %2106 = sext i32 %2105 to i64
  %2107 = getelementptr inbounds i8, i8* %input29, i64 %2106
  %2108 = load i8, i8* %2107, align 1, !tbaa !237
  %2109 = insertelement <32 x i8> %2104, i8 %2108, i32 20
  %2110 = extractelement <32 x i32> %2004, i32 21
  %2111 = sext i32 %2110 to i64
  %2112 = getelementptr inbounds i8, i8* %input29, i64 %2111
  %2113 = load i8, i8* %2112, align 1, !tbaa !237
  %2114 = insertelement <32 x i8> %2109, i8 %2113, i32 21
  %2115 = extractelement <32 x i32> %2004, i32 22
  %2116 = sext i32 %2115 to i64
  %2117 = getelementptr inbounds i8, i8* %input29, i64 %2116
  %2118 = load i8, i8* %2117, align 1, !tbaa !237
  %2119 = insertelement <32 x i8> %2114, i8 %2118, i32 22
  %2120 = extractelement <32 x i32> %2004, i32 23
  %2121 = sext i32 %2120 to i64
  %2122 = getelementptr inbounds i8, i8* %input29, i64 %2121
  %2123 = load i8, i8* %2122, align 1, !tbaa !237
  %2124 = insertelement <32 x i8> %2119, i8 %2123, i32 23
  %2125 = extractelement <32 x i32> %2004, i32 24
  %2126 = sext i32 %2125 to i64
  %2127 = getelementptr inbounds i8, i8* %input29, i64 %2126
  %2128 = load i8, i8* %2127, align 1, !tbaa !237
  %2129 = insertelement <32 x i8> %2124, i8 %2128, i32 24
  %2130 = extractelement <32 x i32> %2004, i32 25
  %2131 = sext i32 %2130 to i64
  %2132 = getelementptr inbounds i8, i8* %input29, i64 %2131
  %2133 = load i8, i8* %2132, align 1, !tbaa !237
  %2134 = insertelement <32 x i8> %2129, i8 %2133, i32 25
  %2135 = extractelement <32 x i32> %2004, i32 26
  %2136 = sext i32 %2135 to i64
  %2137 = getelementptr inbounds i8, i8* %input29, i64 %2136
  %2138 = load i8, i8* %2137, align 1, !tbaa !237
  %2139 = insertelement <32 x i8> %2134, i8 %2138, i32 26
  %2140 = extractelement <32 x i32> %2004, i32 27
  %2141 = sext i32 %2140 to i64
  %2142 = getelementptr inbounds i8, i8* %input29, i64 %2141
  %2143 = load i8, i8* %2142, align 1, !tbaa !237
  %2144 = insertelement <32 x i8> %2139, i8 %2143, i32 27
  %2145 = extractelement <32 x i32> %2004, i32 28
  %2146 = sext i32 %2145 to i64
  %2147 = getelementptr inbounds i8, i8* %input29, i64 %2146
  %2148 = load i8, i8* %2147, align 1, !tbaa !237
  %2149 = insertelement <32 x i8> %2144, i8 %2148, i32 28
  %2150 = extractelement <32 x i32> %2004, i32 29
  %2151 = sext i32 %2150 to i64
  %2152 = getelementptr inbounds i8, i8* %input29, i64 %2151
  %2153 = load i8, i8* %2152, align 1, !tbaa !237
  %2154 = insertelement <32 x i8> %2149, i8 %2153, i32 29
  %2155 = extractelement <32 x i32> %2004, i32 30
  %2156 = sext i32 %2155 to i64
  %2157 = getelementptr inbounds i8, i8* %input29, i64 %2156
  %2158 = load i8, i8* %2157, align 1, !tbaa !237
  %2159 = insertelement <32 x i8> %2154, i8 %2158, i32 30
  %2160 = extractelement <32 x i32> %2004, i32 31
  %2161 = sext i32 %2160 to i64
  %2162 = getelementptr inbounds i8, i8* %input29, i64 %2161
  %2163 = load i8, i8* %2162, align 1, !tbaa !237
  %2164 = insertelement <32 x i8> %2159, i8 %2163, i32 31
  %2165 = sext i32 %repeat_edge.s0._0._0i.base.s110 to i64
  %2166 = add nsw i64 %2165, %1986
  %2167 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %2166
  %2168 = bitcast i8* %2167 to <32 x i8>*
  store <32 x i8> %2164, <32 x i8>* %2168, align 1, !tbaa !240
  %2169 = add nuw nsw i32 %repeat_edge.s0._0._0109, 1
  %.not157 = icmp eq i32 %2169, %t29545
  br i1 %.not157, label %"end for repeat_edge.s0._0._0108", label %"for repeat_edge.s0._0._0107"

"end for repeat_edge.s0._0._0108":                ; preds = %"for repeat_edge.s0._0._0107", %"for repeat_edge.s0._1.rebased102"
  %2170 = add nuw nsw i32 %repeat_edge.s0._1.rebased104, 1
  %.not156 = icmp eq i32 %repeat_edge.s0._1.rebased104, %a75.op
  br i1 %.not156, label %"end for repeat_edge.s0._1.rebased103", label %"for repeat_edge.s0._1.rebased102"

after_bb111:                                      ; preds = %"end for output.s0.y.yi.yii123", %"end for repeat_edge.s0._1.rebased103"
  %indvars.iv.next430 = add nuw nsw i64 %indvars.iv429, 1
  %.not153 = icmp eq i64 %indvars.iv.next430, 5
  br i1 %.not153, label %if.then.i193, label %"for output.s0.y.yi.yi.$n.rebased55"

"for output.s0.x.x116":                           ; preds = %"for output.s0.x.x116.preheader", %"end for output.s0.y.yi.yii123"
  %output.s0.x.x118 = phi i32 [ %2363, %"end for output.s0.y.yi.yii123" ], [ 0, %"for output.s0.x.x116.preheader" ]
  %a83 = shl nsw i32 %output.s0.x.x118, 7
  %2171 = icmp sgt i32 %b85, %a83
  %output.s0.x.xi.base.s119 = select i1 %2171, i32 %a83, i32 %b85
  %t331120 = sub nsw i32 %output.s0.x.xi.base.s119, %t29344
  %t332121 = add nsw i32 %output.s0.x.xi.base.s119, %t29041
  %2172 = sext i32 %t331120 to i64
  %2173 = sext i32 %t332121 to i64
  %2174 = insertelement <4 x i64> poison, i64 %2172, i32 0
  %2175 = shufflevector <4 x i64> %2174, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %"for output.s0.y.yi.yii122"

"for output.s0.y.yi.yii122":                      ; preds = %"for output.s0.x.x116", %"for output.s0.y.yi.yii122"
  %indvars.iv426 = phi i64 [ 0, %"for output.s0.x.x116" ], [ %indvars.iv.next427, %"for output.s0.y.yi.yii122" ]
  %2176 = add nsw i64 %indvars.iv426, %1340
  %2177 = insertelement <4 x i64> poison, i64 %2176, i32 0
  %2178 = shufflevector <4 x i64> %2177, <4 x i64> undef, <4 x i32> zeroinitializer
  %2179 = add <4 x i64> %2178, <i64 6, i64 8, i64 7, i64 5>
  %2180 = and <4 x i64> %2179, <i64 15, i64 15, i64 15, i64 15>
  %2181 = mul nsw <4 x i64> %1304, %2180
  %2182 = add nsw <4 x i64> %2181, %2175
  %2183 = extractelement <4 x i64> %2182, i32 0
  %2184 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %2183
  %2185 = getelementptr inbounds i8, i8* %2184, i64 128
  %2186 = bitcast i8* %2185 to <16 x i8>*
  %2187 = load <16 x i8>, <16 x i8>* %2186, align 1, !tbaa !240
  %2188 = extractelement <4 x i64> %2182, i32 1
  %2189 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %2188
  %2190 = getelementptr inbounds i8, i8* %2189, i64 128
  %2191 = bitcast i8* %2190 to <16 x i8>*
  %2192 = load <16 x i8>, <16 x i8>* %2191, align 1, !tbaa !240
  %2193 = extractelement <4 x i64> %2182, i32 2
  %2194 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %2193
  %2195 = getelementptr inbounds i8, i8* %2194, i64 128
  %2196 = bitcast i8* %2195 to <16 x i8>*
  %2197 = load <16 x i8>, <16 x i8>* %2196, align 1, !tbaa !240
  %2198 = extractelement <4 x i64> %2182, i32 3
  %2199 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %2198
  %2200 = getelementptr inbounds i8, i8* %2199, i64 128
  %2201 = bitcast i8* %2200 to <16 x i8>*
  %2202 = load <16 x i8>, <16 x i8>* %2201, align 1, !tbaa !240
  %2203 = add i64 %2176, 9
  %2204 = and i64 %2203, 15
  %2205 = mul nsw i64 %1294, %2204
  %2206 = add nsw i64 %2205, %2172
  %2207 = getelementptr inbounds i8, i8* %repeat_edge50, i64 %2206
  %2208 = getelementptr inbounds i8, i8* %2207, i64 128
  %2209 = bitcast i8* %2208 to <16 x i8>*
  %2210 = load <16 x i8>, <16 x i8>* %2209, align 1, !tbaa !240
  %2211 = call <16 x i16> @hydride.node.0(<16 x i8> %2187, <16 x i8> %2192, <16 x i8> %2197, <16 x i8> %2202, <16 x i8> %2210) #11
  store <16 x i16> %2211, <16 x i16>* %rows148.0.rows148.0..sroa_cast, align 64, !tbaa !244
  %2212 = getelementptr inbounds i8, i8* %2184, i64 144
  %2213 = bitcast i8* %2212 to <16 x i8>*
  %2214 = load <16 x i8>, <16 x i8>* %2213, align 1, !tbaa !240
  %2215 = getelementptr inbounds i8, i8* %2189, i64 144
  %2216 = bitcast i8* %2215 to <16 x i8>*
  %2217 = load <16 x i8>, <16 x i8>* %2216, align 1, !tbaa !240
  %2218 = getelementptr inbounds i8, i8* %2194, i64 144
  %2219 = bitcast i8* %2218 to <16 x i8>*
  %2220 = load <16 x i8>, <16 x i8>* %2219, align 1, !tbaa !240
  %2221 = getelementptr inbounds i8, i8* %2199, i64 144
  %2222 = bitcast i8* %2221 to <16 x i8>*
  %2223 = load <16 x i8>, <16 x i8>* %2222, align 1, !tbaa !240
  %2224 = getelementptr inbounds i8, i8* %2207, i64 144
  %2225 = bitcast i8* %2224 to <16 x i8>*
  %2226 = load <16 x i8>, <16 x i8>* %2225, align 1, !tbaa !240
  %2227 = call <16 x i16> @hydride.node.1(<16 x i8> %2214, <16 x i8> %2217, <16 x i8> %2220, <16 x i8> %2223, <16 x i8> %2226) #11
  store <16 x i16> %2227, <16 x i16>* %rows148.32.rows148.32..sroa_cast, align 32, !tbaa !253
  %2228 = getelementptr inbounds i8, i8* %2184, i64 160
  %2229 = bitcast i8* %2228 to <16 x i8>*
  %2230 = load <16 x i8>, <16 x i8>* %2229, align 1, !tbaa !240
  %2231 = getelementptr inbounds i8, i8* %2189, i64 160
  %2232 = bitcast i8* %2231 to <16 x i8>*
  %2233 = load <16 x i8>, <16 x i8>* %2232, align 1, !tbaa !240
  %2234 = getelementptr inbounds i8, i8* %2194, i64 160
  %2235 = bitcast i8* %2234 to <16 x i8>*
  %2236 = load <16 x i8>, <16 x i8>* %2235, align 1, !tbaa !240
  %2237 = getelementptr inbounds i8, i8* %2199, i64 160
  %2238 = bitcast i8* %2237 to <16 x i8>*
  %2239 = load <16 x i8>, <16 x i8>* %2238, align 1, !tbaa !240
  %2240 = getelementptr inbounds i8, i8* %2207, i64 160
  %2241 = bitcast i8* %2240 to <16 x i8>*
  %2242 = load <16 x i8>, <16 x i8>* %2241, align 1, !tbaa !240
  %2243 = call <16 x i16> @hydride.node.2(<16 x i8> %2230, <16 x i8> %2233, <16 x i8> %2236, <16 x i8> %2239, <16 x i8> %2242) #11
  store <16 x i16> %2243, <16 x i16>* %rows148.64.rows148.64..sroa_cast, align 64, !tbaa !255
  %2244 = getelementptr inbounds i8, i8* %2184, i64 176
  %2245 = bitcast i8* %2244 to <16 x i8>*
  %2246 = load <16 x i8>, <16 x i8>* %2245, align 1, !tbaa !240
  %2247 = getelementptr inbounds i8, i8* %2189, i64 176
  %2248 = bitcast i8* %2247 to <16 x i8>*
  %2249 = load <16 x i8>, <16 x i8>* %2248, align 1, !tbaa !240
  %2250 = getelementptr inbounds i8, i8* %2194, i64 176
  %2251 = bitcast i8* %2250 to <16 x i8>*
  %2252 = load <16 x i8>, <16 x i8>* %2251, align 1, !tbaa !240
  %2253 = getelementptr inbounds i8, i8* %2199, i64 176
  %2254 = bitcast i8* %2253 to <16 x i8>*
  %2255 = load <16 x i8>, <16 x i8>* %2254, align 1, !tbaa !240
  %2256 = getelementptr inbounds i8, i8* %2207, i64 176
  %2257 = bitcast i8* %2256 to <16 x i8>*
  %2258 = load <16 x i8>, <16 x i8>* %2257, align 1, !tbaa !240
  %2259 = call <16 x i16> @hydride.node.3(<16 x i8> %2246, <16 x i8> %2249, <16 x i8> %2252, <16 x i8> %2255, <16 x i8> %2258) #11
  store <16 x i16> %2259, <16 x i16>* %rows148.96.rows148.96..sroa_cast, align 32, !tbaa !258
  %2260 = getelementptr inbounds i8, i8* %2184, i64 192
  %2261 = bitcast i8* %2260 to <16 x i8>*
  %2262 = load <16 x i8>, <16 x i8>* %2261, align 1, !tbaa !240
  %2263 = getelementptr inbounds i8, i8* %2189, i64 192
  %2264 = bitcast i8* %2263 to <16 x i8>*
  %2265 = load <16 x i8>, <16 x i8>* %2264, align 1, !tbaa !240
  %2266 = getelementptr inbounds i8, i8* %2194, i64 192
  %2267 = bitcast i8* %2266 to <16 x i8>*
  %2268 = load <16 x i8>, <16 x i8>* %2267, align 1, !tbaa !240
  %2269 = getelementptr inbounds i8, i8* %2199, i64 192
  %2270 = bitcast i8* %2269 to <16 x i8>*
  %2271 = load <16 x i8>, <16 x i8>* %2270, align 1, !tbaa !240
  %2272 = getelementptr inbounds i8, i8* %2207, i64 192
  %2273 = bitcast i8* %2272 to <16 x i8>*
  %2274 = load <16 x i8>, <16 x i8>* %2273, align 1, !tbaa !240
  %2275 = call <16 x i16> @hydride.node.4(<16 x i8> %2262, <16 x i8> %2265, <16 x i8> %2268, <16 x i8> %2271, <16 x i8> %2274) #11
  store <16 x i16> %2275, <16 x i16>* %rows148.128.rows148.128..sroa_cast, align 64, !tbaa !260
  %2276 = getelementptr inbounds i8, i8* %2184, i64 208
  %2277 = bitcast i8* %2276 to <16 x i8>*
  %2278 = load <16 x i8>, <16 x i8>* %2277, align 1, !tbaa !240
  %2279 = getelementptr inbounds i8, i8* %2189, i64 208
  %2280 = bitcast i8* %2279 to <16 x i8>*
  %2281 = load <16 x i8>, <16 x i8>* %2280, align 1, !tbaa !240
  %2282 = getelementptr inbounds i8, i8* %2194, i64 208
  %2283 = bitcast i8* %2282 to <16 x i8>*
  %2284 = load <16 x i8>, <16 x i8>* %2283, align 1, !tbaa !240
  %2285 = getelementptr inbounds i8, i8* %2199, i64 208
  %2286 = bitcast i8* %2285 to <16 x i8>*
  %2287 = load <16 x i8>, <16 x i8>* %2286, align 1, !tbaa !240
  %2288 = getelementptr inbounds i8, i8* %2207, i64 208
  %2289 = bitcast i8* %2288 to <16 x i8>*
  %2290 = load <16 x i8>, <16 x i8>* %2289, align 1, !tbaa !240
  %2291 = call <16 x i16> @hydride.node.5(<16 x i8> %2278, <16 x i8> %2281, <16 x i8> %2284, <16 x i8> %2287, <16 x i8> %2290) #11
  store <16 x i16> %2291, <16 x i16>* %rows148.160.rows148.160..sroa_cast, align 32, !tbaa !264
  %2292 = getelementptr inbounds i8, i8* %2184, i64 224
  %2293 = bitcast i8* %2292 to <16 x i8>*
  %2294 = load <16 x i8>, <16 x i8>* %2293, align 1, !tbaa !240
  %2295 = getelementptr inbounds i8, i8* %2189, i64 224
  %2296 = bitcast i8* %2295 to <16 x i8>*
  %2297 = load <16 x i8>, <16 x i8>* %2296, align 1, !tbaa !240
  %2298 = getelementptr inbounds i8, i8* %2194, i64 224
  %2299 = bitcast i8* %2298 to <16 x i8>*
  %2300 = load <16 x i8>, <16 x i8>* %2299, align 1, !tbaa !240
  %2301 = getelementptr inbounds i8, i8* %2199, i64 224
  %2302 = bitcast i8* %2301 to <16 x i8>*
  %2303 = load <16 x i8>, <16 x i8>* %2302, align 1, !tbaa !240
  %2304 = getelementptr inbounds i8, i8* %2207, i64 224
  %2305 = bitcast i8* %2304 to <16 x i8>*
  %2306 = load <16 x i8>, <16 x i8>* %2305, align 1, !tbaa !240
  %2307 = call <16 x i16> @hydride.node.6(<16 x i8> %2294, <16 x i8> %2297, <16 x i8> %2300, <16 x i8> %2303, <16 x i8> %2306) #11
  store <16 x i16> %2307, <16 x i16>* %rows148.192.rows148.192..sroa_cast, align 64, !tbaa !266
  %2308 = getelementptr inbounds i8, i8* %2184, i64 240
  %2309 = bitcast i8* %2308 to <16 x i8>*
  %2310 = load <16 x i8>, <16 x i8>* %2309, align 1, !tbaa !240
  %2311 = getelementptr inbounds i8, i8* %2189, i64 240
  %2312 = bitcast i8* %2311 to <16 x i8>*
  %2313 = load <16 x i8>, <16 x i8>* %2312, align 1, !tbaa !240
  %2314 = getelementptr inbounds i8, i8* %2194, i64 240
  %2315 = bitcast i8* %2314 to <16 x i8>*
  %2316 = load <16 x i8>, <16 x i8>* %2315, align 1, !tbaa !240
  %2317 = getelementptr inbounds i8, i8* %2199, i64 240
  %2318 = bitcast i8* %2317 to <16 x i8>*
  %2319 = load <16 x i8>, <16 x i8>* %2318, align 1, !tbaa !240
  %2320 = getelementptr inbounds i8, i8* %2207, i64 240
  %2321 = bitcast i8* %2320 to <16 x i8>*
  %2322 = load <16 x i8>, <16 x i8>* %2321, align 1, !tbaa !240
  %2323 = call <16 x i16> @hydride.node.7(<16 x i8> %2310, <16 x i8> %2313, <16 x i8> %2316, <16 x i8> %2319, <16 x i8> %2322) #11
  store <16 x i16> %2323, <16 x i16>* %rows148.224.rows148.224..sroa_cast, align 32, !tbaa !269
  %2324 = getelementptr inbounds i8, i8* %2184, i64 256
  %2325 = bitcast i8* %2324 to <16 x i8>*
  %2326 = load <16 x i8>, <16 x i8>* %2325, align 1, !tbaa !240
  %2327 = getelementptr inbounds i8, i8* %2189, i64 256
  %2328 = bitcast i8* %2327 to <16 x i8>*
  %2329 = load <16 x i8>, <16 x i8>* %2328, align 1, !tbaa !240
  %2330 = getelementptr inbounds i8, i8* %2194, i64 256
  %2331 = bitcast i8* %2330 to <16 x i8>*
  %2332 = load <16 x i8>, <16 x i8>* %2331, align 1, !tbaa !240
  %2333 = getelementptr inbounds i8, i8* %2199, i64 256
  %2334 = bitcast i8* %2333 to <16 x i8>*
  %2335 = load <16 x i8>, <16 x i8>* %2334, align 1, !tbaa !240
  %2336 = getelementptr inbounds i8, i8* %2207, i64 256
  %2337 = bitcast i8* %2336 to <16 x i8>*
  %2338 = load <16 x i8>, <16 x i8>* %2337, align 1, !tbaa !240
  %2339 = call <16 x i16> @hydride.node.8(<16 x i8> %2326, <16 x i8> %2329, <16 x i8> %2332, <16 x i8> %2335, <16 x i8> %2338) #11
  store <16 x i16> %2339, <16 x i16>* %rows148.256.rows148.256..sroa_cast, align 64, !tbaa !271
  %rows148.2.rows148.2. = load <16 x i16>, <16 x i16>* %rows148.2.rows148.2..sroa_cast, align 2, !tbaa !276
  %rows148.0.rows148.0. = load <16 x i16>, <16 x i16>* %rows148.0.rows148.0..sroa_cast, align 64, !tbaa !244
  %rows148.4.rows148.4. = load <16 x i16>, <16 x i16>* %rows148.4.rows148.4..sroa_cast, align 4, !tbaa !276
  %rows148.8.rows148.8. = load <16 x i16>, <16 x i16>* %rows148.8.rows148.8..sroa_cast, align 8, !tbaa !276
  %rows148.6.rows148.6. = load <16 x i16>, <16 x i16>* %rows148.6.rows148.6..sroa_cast, align 2, !tbaa !276
  %2340 = call <16 x i16> @hydride.node.9(<16 x i16> %rows148.2.rows148.2., <16 x i16> %rows148.0.rows148.0., <16 x i16> %rows148.4.rows148.4., <16 x i16> %rows148.8.rows148.8., <16 x i16> %rows148.6.rows148.6.) #11
  %cols147.0.vec.expand368 = shufflevector <16 x i16> %2340, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.34.rows148.34. = load <16 x i16>, <16 x i16>* %rows148.34.rows148.34..sroa_cast, align 2, !tbaa !277
  %rows148.32.rows148.32. = load <16 x i16>, <16 x i16>* %rows148.32.rows148.32..sroa_cast, align 32, !tbaa !253
  %rows148.36.rows148.36. = load <16 x i16>, <16 x i16>* %rows148.36.rows148.36..sroa_cast, align 4, !tbaa !277
  %rows148.40.rows148.40. = load <16 x i16>, <16 x i16>* %rows148.40.rows148.40..sroa_cast, align 8, !tbaa !277
  %rows148.38.rows148.38. = load <16 x i16>, <16 x i16>* %rows148.38.rows148.38..sroa_cast, align 2, !tbaa !277
  %2341 = call <16 x i16> @hydride.node.10(<16 x i16> %rows148.34.rows148.34., <16 x i16> %rows148.32.rows148.32., <16 x i16> %rows148.36.rows148.36., <16 x i16> %rows148.40.rows148.40., <16 x i16> %rows148.38.rows148.38.) #11
  %cols147.32.vec.expand = shufflevector <16 x i16> %2341, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend = shufflevector <32 x i16> %cols147.0.vec.expand368, <32 x i16> %cols147.32.vec.expand, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %2342 = call <32 x i8> @hydride.node.11(<32 x i16> %cols147.32.vecblend) #11
  %2343 = add nsw i64 %1987, %indvars.iv426
  %2344 = mul nsw i64 %2343, %1295
  %2345 = add nsw i64 %2344, %2173
  %2346 = getelementptr inbounds i8, i8* %output30, i64 %2345
  %2347 = bitcast i8* %2346 to <32 x i8>*
  store <32 x i8> %2342, <32 x i8>* %2347, align 1, !tbaa !278
  %rows148.66.rows148.66. = load <16 x i16>, <16 x i16>* %rows148.66.rows148.66..sroa_cast, align 2, !tbaa !280
  %rows148.64.rows148.64. = load <16 x i16>, <16 x i16>* %rows148.64.rows148.64..sroa_cast, align 64, !tbaa !255
  %rows148.68.rows148.68. = load <16 x i16>, <16 x i16>* %rows148.68.rows148.68..sroa_cast, align 4, !tbaa !280
  %rows148.72.rows148.72. = load <16 x i16>, <16 x i16>* %rows148.72.rows148.72..sroa_cast, align 8, !tbaa !280
  %rows148.70.rows148.70. = load <16 x i16>, <16 x i16>* %rows148.70.rows148.70..sroa_cast, align 2, !tbaa !280
  %2348 = call <16 x i16> @hydride.node.12(<16 x i16> %rows148.66.rows148.66., <16 x i16> %rows148.64.rows148.64., <16 x i16> %rows148.68.rows148.68., <16 x i16> %rows148.72.rows148.72., <16 x i16> %rows148.70.rows148.70.) #11
  %cols147.0.vec.expand365 = shufflevector <16 x i16> %2348, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.98.rows148.98. = load <16 x i16>, <16 x i16>* %rows148.98.rows148.98..sroa_cast, align 2, !tbaa !281
  %rows148.96.rows148.96. = load <16 x i16>, <16 x i16>* %rows148.96.rows148.96..sroa_cast, align 32, !tbaa !258
  %rows148.100.rows148.100. = load <16 x i16>, <16 x i16>* %rows148.100.rows148.100..sroa_cast, align 4, !tbaa !281
  %rows148.104.rows148.104. = load <16 x i16>, <16 x i16>* %rows148.104.rows148.104..sroa_cast, align 8, !tbaa !281
  %rows148.102.rows148.102. = load <16 x i16>, <16 x i16>* %rows148.102.rows148.102..sroa_cast, align 2, !tbaa !281
  %2349 = call <16 x i16> @hydride.node.13(<16 x i16> %rows148.98.rows148.98., <16 x i16> %rows148.96.rows148.96., <16 x i16> %rows148.100.rows148.100., <16 x i16> %rows148.104.rows148.104., <16 x i16> %rows148.102.rows148.102.) #11
  %cols147.32.vec.expand383 = shufflevector <16 x i16> %2349, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend384 = shufflevector <32 x i16> %cols147.0.vec.expand365, <32 x i16> %cols147.32.vec.expand383, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %2350 = call <32 x i8> @hydride.node.14(<32 x i16> %cols147.32.vecblend384) #11
  %2351 = getelementptr inbounds i8, i8* %2346, i64 32
  %2352 = bitcast i8* %2351 to <32 x i8>*
  store <32 x i8> %2350, <32 x i8>* %2352, align 1, !tbaa !278
  %rows148.130.rows148.130. = load <16 x i16>, <16 x i16>* %rows148.130.rows148.130..sroa_cast, align 2, !tbaa !282
  %rows148.128.rows148.128. = load <16 x i16>, <16 x i16>* %rows148.128.rows148.128..sroa_cast, align 64, !tbaa !260
  %rows148.132.rows148.132. = load <16 x i16>, <16 x i16>* %rows148.132.rows148.132..sroa_cast, align 4, !tbaa !282
  %rows148.136.rows148.136. = load <16 x i16>, <16 x i16>* %rows148.136.rows148.136..sroa_cast, align 8, !tbaa !282
  %rows148.134.rows148.134. = load <16 x i16>, <16 x i16>* %rows148.134.rows148.134..sroa_cast, align 2, !tbaa !282
  %2353 = call <16 x i16> @hydride.node.15(<16 x i16> %rows148.130.rows148.130., <16 x i16> %rows148.128.rows148.128., <16 x i16> %rows148.132.rows148.132., <16 x i16> %rows148.136.rows148.136., <16 x i16> %rows148.134.rows148.134.) #11
  %cols147.0.vec.expand362 = shufflevector <16 x i16> %2353, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.162.rows148.162. = load <16 x i16>, <16 x i16>* %rows148.162.rows148.162..sroa_cast, align 2, !tbaa !283
  %rows148.160.rows148.160. = load <16 x i16>, <16 x i16>* %rows148.160.rows148.160..sroa_cast, align 32, !tbaa !264
  %rows148.164.rows148.164. = load <16 x i16>, <16 x i16>* %rows148.164.rows148.164..sroa_cast, align 4, !tbaa !283
  %rows148.168.rows148.168. = load <16 x i16>, <16 x i16>* %rows148.168.rows148.168..sroa_cast, align 8, !tbaa !283
  %rows148.166.rows148.166. = load <16 x i16>, <16 x i16>* %rows148.166.rows148.166..sroa_cast, align 2, !tbaa !283
  %2354 = call <16 x i16> @hydride.node.16(<16 x i16> %rows148.162.rows148.162., <16 x i16> %rows148.160.rows148.160., <16 x i16> %rows148.164.rows148.164., <16 x i16> %rows148.168.rows148.168., <16 x i16> %rows148.166.rows148.166.) #11
  %cols147.32.vec.expand386 = shufflevector <16 x i16> %2354, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend387 = shufflevector <32 x i16> %cols147.0.vec.expand362, <32 x i16> %cols147.32.vec.expand386, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %2355 = call <32 x i8> @hydride.node.17(<32 x i16> %cols147.32.vecblend387) #11
  %2356 = getelementptr inbounds i8, i8* %2346, i64 64
  %2357 = bitcast i8* %2356 to <32 x i8>*
  store <32 x i8> %2355, <32 x i8>* %2357, align 1, !tbaa !278
  %rows148.194.rows148.194. = load <16 x i16>, <16 x i16>* %rows148.194.rows148.194..sroa_cast, align 2, !tbaa !284
  %rows148.192.rows148.192. = load <16 x i16>, <16 x i16>* %rows148.192.rows148.192..sroa_cast, align 64, !tbaa !266
  %rows148.196.rows148.196. = load <16 x i16>, <16 x i16>* %rows148.196.rows148.196..sroa_cast, align 4, !tbaa !284
  %rows148.200.rows148.200. = load <16 x i16>, <16 x i16>* %rows148.200.rows148.200..sroa_cast, align 8, !tbaa !284
  %rows148.198.rows148.198. = load <16 x i16>, <16 x i16>* %rows148.198.rows148.198..sroa_cast, align 2, !tbaa !284
  %2358 = call <16 x i16> @hydride.node.18(<16 x i16> %rows148.194.rows148.194., <16 x i16> %rows148.192.rows148.192., <16 x i16> %rows148.196.rows148.196., <16 x i16> %rows148.200.rows148.200., <16 x i16> %rows148.198.rows148.198.) #11
  %cols147.0.vec.expand = shufflevector <16 x i16> %2358, <16 x i16> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  %rows148.226.rows148.226. = load <16 x i16>, <16 x i16>* %rows148.226.rows148.226..sroa_cast, align 2, !tbaa !285
  %rows148.224.rows148.224. = load <16 x i16>, <16 x i16>* %rows148.224.rows148.224..sroa_cast, align 32, !tbaa !269
  %rows148.228.rows148.228. = load <16 x i16>, <16 x i16>* %rows148.228.rows148.228..sroa_cast, align 4, !tbaa !285
  %rows148.232.rows148.232. = load <16 x i16>, <16 x i16>* %rows148.232.rows148.232..sroa_cast, align 8, !tbaa !285
  %rows148.230.rows148.230. = load <16 x i16>, <16 x i16>* %rows148.230.rows148.230..sroa_cast, align 2, !tbaa !285
  %2359 = call <16 x i16> @hydride.node.19(<16 x i16> %rows148.226.rows148.226., <16 x i16> %rows148.224.rows148.224., <16 x i16> %rows148.228.rows148.228., <16 x i16> %rows148.232.rows148.232., <16 x i16> %rows148.230.rows148.230.) #11
  %cols147.32.vec.expand389 = shufflevector <16 x i16> %2359, <16 x i16> poison, <32 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %cols147.32.vecblend390 = shufflevector <32 x i16> %cols147.0.vec.expand, <32 x i16> %cols147.32.vec.expand389, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %2360 = call <32 x i8> @hydride.node.20(<32 x i16> %cols147.32.vecblend390) #11
  %2361 = getelementptr inbounds i8, i8* %2346, i64 96
  %2362 = bitcast i8* %2361 to <32 x i8>*
  store <32 x i8> %2360, <32 x i8>* %2362, align 1, !tbaa !278
  %indvars.iv.next427 = add nuw nsw i64 %indvars.iv426, 1
  %.not154 = icmp eq i64 %indvars.iv.next427, 9
  br i1 %.not154, label %"end for output.s0.y.yi.yii123", label %"for output.s0.y.yi.yii122"

"end for output.s0.y.yi.yii123":                  ; preds = %"for output.s0.y.yi.yii122"
  %2363 = add nuw nsw i32 %output.s0.x.x118, 1
  %.not155 = icmp eq i32 %2363, %t28840
  br i1 %.not155, label %after_bb111, label %"for output.s0.x.x116"
}

; Function Attrs: nounwind
define i32 @gaussian5x5(%struct.halide_buffer_t* noalias nocapture readonly %input.buffer, %struct.halide_buffer_t* noalias nocapture readonly %output.buffer) local_unnamed_addr #10 {
entry:
  %parallel_closure22 = alloca { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, align 8
  %parallel_closure = alloca { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, align 8
  %host.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 2
  %0 = load i8*, i8** %host.i, align 8, !tbaa !67
  %dim.i = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 6
  %1 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i, align 8, !tbaa !71
  %min.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 0, i32 0
  %2 = load i32, i32* %min.i, align 4, !tbaa !76
  %extent.i = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 0, i32 1
  %3 = load i32, i32* %extent.i, align 4, !tbaa !73
  %min.i27 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 1, i32 0
  %4 = load i32, i32* %min.i27, align 4, !tbaa !76
  %extent.i29 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 1, i32 1
  %5 = load i32, i32* %extent.i29, align 4, !tbaa !73
  %stride.i31 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 1, i32 2
  %6 = load i32, i32* %stride.i31, align 4, !tbaa !77
  %host.i32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 2
  %7 = load i8*, i8** %host.i32, align 8, !tbaa !67
  %dim.i33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 6
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %dim.i33, align 8, !tbaa !71
  %min.i34 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 0, i32 0
  %9 = load i32, i32* %min.i34, align 4, !tbaa !76
  %extent.i36 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 0, i32 1
  %10 = load i32, i32* %extent.i36, align 4, !tbaa !73
  %min.i40 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 1, i32 0
  %11 = load i32, i32* %min.i40, align 4, !tbaa !76
  %extent.i42 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 1, i32 1
  %12 = load i32, i32* %extent.i42, align 4, !tbaa !73
  %stride.i44 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 1, i32 2
  %13 = load i32, i32* %stride.i44, align 4, !tbaa !77
  %b92 = add nsw i32 %3, %2
  %b93 = add nsw i32 %10, %9
  %14 = icmp slt i32 %10, 128
  %t293 = select i1 %14, i32 %10, i32 128
  %15 = icmp sgt i32 %10, 128
  %b91 = select i1 %15, i32 %10, i32 128
  %16 = add nuw nsw i32 %b91, 35
  %17 = lshr i32 %16, 5
  %18 = add i32 %2, 161
  %19 = sub i32 %18, %9
  %20 = sub i32 %19, %t293
  %a87 = ashr i32 %20, 5
  %21 = icmp sgt i32 %a87, 0
  %a86 = select i1 %21, i32 %a87, i32 0
  %22 = icmp sgt i32 %17, %a86
  %b90 = select i1 %22, i32 %a86, i32 %17
  %a91 = add nsw i32 %b92, 29
  %23 = icmp sgt i32 %b93, %a91
  %24 = select i1 %23, i32 %a91, i32 %b93
  %a90 = add nsw i32 %24, 2
  %25 = icmp sgt i32 %b92, %a90
  %26 = select i1 %25, i32 %a90, i32 %b92
  %27 = sub i32 126, %9
  %28 = sub i32 %27, %t293
  %a89 = add i32 %28, %26
  %29 = icmp sgt i32 %b91, %a89
  %30 = select i1 %29, i32 %a89, i32 %b91
  %31 = add nsw i32 %30, 4
  %a88 = ashr i32 %31, 5
  %32 = icmp sgt i32 %a88, %b90
  %t287 = select i1 %32, i32 %a88, i32 %b90
  %33 = add nsw i32 %12, 35
  %34 = ashr i32 %33, 31
  %35 = xor i32 %34, %33
  %36 = zext i32 %35 to i64
  %37 = mul nuw i64 %36, 3817748708
  %38 = lshr i64 %37, 37
  %39 = trunc i64 %38 to i32
  %t277 = xor i32 %34, %39
  %40 = add nsw i32 %10, 127
  %t288 = ashr i32 %40, 7
  %a93 = add nsw i32 %10, 100
  %41 = add nuw nsw i32 %b91, 3
  %42 = and i32 %41, 2147483616
  %b95 = add nsw i32 %42, %t293
  %43 = icmp sgt i32 %b95, %a93
  %a92 = select i1 %43, i32 %a93, i32 %b95
  %b94 = add nsw i32 %10, 112
  %44 = icmp sgt i32 %a92, %b94
  %45 = select i1 %44, i32 %a92, i32 %b94
  %t278 = sub nsw i32 %45, %t293
  %46 = mul i32 %11, %13
  %t290 = sub i32 0, %46
  %47 = icmp sgt i32 %5, 0
  %48 = select i1 %47, i32 %5, i32 0
  %t285 = add nsw i32 %48, %4
  %t282 = add nsw i32 %t293, %9
  %49 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 0
  store i8* %0, i8** %49, align 8
  %50 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 1
  store i8* %7, i8** %50, align 8
  %51 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 2
  store i32 %5, i32* %51, align 8
  %52 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 3
  store i32 %2, i32* %52, align 4
  %53 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 4
  store i32 %4, i32* %53, align 8
  %54 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 5
  store i32 %6, i32* %54, align 4
  %55 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 6
  store i32 %10, i32* %55, align 8
  %56 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 7
  store i32 %12, i32* %56, align 4
  %57 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 8
  store i32 %11, i32* %57, align 8
  %58 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 9
  store i32 %13, i32* %58, align 4
  %59 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 10
  store i32 %t278, i32* %59, align 8
  %60 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 11
  store i32 %t282, i32* %60, align 4
  %61 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 12
  store i32 %t285, i32* %61, align 8
  %62 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 13
  store i32 %t287, i32* %62, align 4
  %63 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 14
  store i32 %t288, i32* %63, align 8
  %64 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 15
  store i32 %t290, i32* %64, align 4
  %65 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 16
  store i32 %b92, i32* %65, align 8
  %66 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 17
  store i32 %b93, i32* %66, align 4
  %67 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 18
  store i32 %t293, i32* %67, align 8
  %68 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 19
  store i32 %17, i32* %68, align 4
  %69 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure, i64 0, i32 20
  store i32 %b90, i32* %69, align 8
  %70 = bitcast { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure to i8*
  %closure_result = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @gaussian5x5_par_for_output_s0_y_y, i32 0, i32 %t277, i8* nonnull %70) #11
  %71 = load i32, i32* %min.i, align 4, !tbaa !76
  %72 = load i32, i32* %extent.i, align 4, !tbaa !73
  %73 = load i32, i32* %min.i27, align 4, !tbaa !76
  %74 = load i32, i32* %extent.i29, align 4, !tbaa !73
  %75 = load i32, i32* %stride.i31, align 4, !tbaa !77
  %76 = load i32, i32* %min.i34, align 4, !tbaa !76
  %77 = load i32, i32* %extent.i36, align 4, !tbaa !73
  %78 = load i32, i32* %min.i40, align 4, !tbaa !76
  %79 = load i32, i32* %extent.i42, align 4, !tbaa !73
  %80 = load i32, i32* %stride.i44, align 4, !tbaa !77
  %b103 = add nsw i32 %72, %71
  %b104 = add nsw i32 %77, %76
  %81 = icmp slt i32 %77, 128
  %t29314 = select i1 %81, i32 %77, i32 128
  %82 = icmp sgt i32 %77, 128
  %b102 = select i1 %82, i32 %77, i32 128
  %83 = add nuw nsw i32 %b102, 35
  %84 = lshr i32 %83, 5
  %85 = add i32 %71, 161
  %86 = sub i32 %85, %76
  %87 = sub i32 %86, %t29314
  %a98 = ashr i32 %87, 5
  %88 = icmp sgt i32 %a98, 0
  %a97 = select i1 %88, i32 %a98, i32 0
  %89 = icmp sgt i32 %84, %a97
  %b101 = select i1 %89, i32 %a97, i32 %84
  %a102 = add nsw i32 %b103, 29
  %90 = icmp sgt i32 %b104, %a102
  %91 = select i1 %90, i32 %a102, i32 %b104
  %a101 = add nsw i32 %91, 2
  %92 = icmp sgt i32 %b103, %a101
  %93 = select i1 %92, i32 %a101, i32 %b103
  %94 = sub i32 126, %76
  %95 = sub i32 %94, %t29314
  %a100 = add i32 %95, %93
  %96 = icmp sgt i32 %b102, %a100
  %97 = select i1 %96, i32 %a100, i32 %b102
  %98 = add nsw i32 %97, 4
  %a99 = ashr i32 %98, 5
  %99 = icmp sgt i32 %a99, %b101
  %t28715 = select i1 %99, i32 %a99, i32 %b101
  %100 = add nsw i32 %79, 35
  %101 = ashr i32 %100, 31
  %102 = xor i32 %101, %100
  %103 = zext i32 %102 to i64
  %104 = mul nuw i64 %103, 3817748708
  %105 = lshr i64 %104, 37
  %106 = trunc i64 %105 to i32
  %t27716 = xor i32 %101, %106
  %107 = add nsw i32 %77, 127
  %t28817 = ashr i32 %107, 7
  %a104 = add nsw i32 %77, 100
  %108 = add nuw nsw i32 %b102, 3
  %109 = and i32 %108, 2147483616
  %b106 = add nsw i32 %109, %t29314
  %110 = icmp sgt i32 %b106, %a104
  %a103 = select i1 %110, i32 %a104, i32 %b106
  %b105 = add nsw i32 %77, 112
  %111 = icmp sgt i32 %a103, %b105
  %112 = select i1 %111, i32 %a103, i32 %b105
  %t27818 = sub nsw i32 %112, %t29314
  %113 = mul i32 %78, %80
  %t29019 = sub i32 0, %113
  %114 = icmp sgt i32 %74, 0
  %115 = select i1 %114, i32 %74, i32 0
  %t28520 = add nsw i32 %115, %73
  %t28221 = add nsw i32 %t29314, %76
  %116 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 0
  store i8* %0, i8** %116, align 8
  %117 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 1
  store i8* %7, i8** %117, align 8
  %118 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 2
  store i32 %74, i32* %118, align 8
  %119 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 3
  store i32 %71, i32* %119, align 4
  %120 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 4
  store i32 %73, i32* %120, align 8
  %121 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 5
  store i32 %75, i32* %121, align 4
  %122 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 6
  store i32 %77, i32* %122, align 8
  %123 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 7
  store i32 %79, i32* %123, align 4
  %124 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 8
  store i32 %78, i32* %124, align 8
  %125 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 9
  store i32 %80, i32* %125, align 4
  %126 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 10
  store i32 %t27818, i32* %126, align 8
  %127 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 11
  store i32 %t28221, i32* %127, align 4
  %128 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 12
  store i32 %t28520, i32* %128, align 8
  %129 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 13
  store i32 %t28715, i32* %129, align 4
  %130 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 14
  store i32 %t28817, i32* %130, align 8
  %131 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 15
  store i32 %t29019, i32* %131, align 4
  %132 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 16
  store i32 %b103, i32* %132, align 8
  %133 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 17
  store i32 %b104, i32* %133, align 4
  %134 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 18
  store i32 %t29314, i32* %134, align 8
  %135 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 19
  store i32 %84, i32* %135, align 4
  %136 = getelementptr inbounds { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }, { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22, i64 0, i32 20
  store i32 %b101, i32* %136, align 8
  %137 = bitcast { i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }* %parallel_closure22 to i8*
  %closure_result23 = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @gaussian5x5_par_for_output_s0_y_y, i32 0, i32 %t27716, i8* nonnull %137) #11
  ret i32 0
}

; Function Attrs: nounwind
define i32 @gaussian5x5_argv(i8** nocapture readonly %0) local_unnamed_addr #11 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 8
  %3 = getelementptr i8*, i8** %0, i64 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 8
  %6 = tail call i32 @gaussian5x5(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5) #18
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @gaussian5x5_metadata() local_unnamed_addr #12 {
entry:
  ret %struct.halide_filter_metadata_t* @gaussian5x5_metadata_storage
}

declare <16 x i16> @hydride.node.0(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.1(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.2(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.3(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.4(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.5(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.6(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.7(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.8(<16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>) local_unnamed_addr

declare <16 x i16> @hydride.node.9(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <16 x i16> @hydride.node.10(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <32 x i8> @hydride.node.11(<32 x i16>) local_unnamed_addr

declare <16 x i16> @hydride.node.12(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <16 x i16> @hydride.node.13(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <32 x i8> @hydride.node.14(<32 x i16>) local_unnamed_addr

declare <16 x i16> @hydride.node.15(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <16 x i16> @hydride.node.16(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <32 x i8> @hydride.node.17(<32 x i16>) local_unnamed_addr

declare <16 x i16> @hydride.node.18(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <16 x i16> @hydride.node.19(<16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>, <16 x i16>) local_unnamed_addr

declare <32 x i8> @hydride.node.20(<32 x i16>) local_unnamed_addr

; Function Attrs: nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32>, <8 x i32*>, i32 immarg, <8 x i1>) #13

; Function Attrs: nofree nosync nounwind readonly willreturn
declare <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*>, i32 immarg, <4 x i1>, <4 x i32>) #14

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i64 @llvm.vector.reduce.add.v4i64(<4 x i64>) #15

attributes #0 = { nounwind mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { alwaysinline nounwind willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #9 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind "reciprocal-estimates"="none" }
attributes #11 = { nounwind }
attributes #12 = { norecurse nounwind readnone willreturn }
attributes #13 = { nofree nosync nounwind willreturn writeonly }
attributes #14 = { nofree nosync nounwind readonly willreturn }
attributes #15 = { nofree nosync nounwind readnone willreturn }
attributes #16 = { nobuiltin nounwind "no-builtins" }
attributes #17 = { nobuiltin "no-builtins" }
attributes #18 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9, !9}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, !"halide_use_soft_float_abi", i32 0}
!3 = !{i32 2, !"halide_mcpu", !"skylake-avx512"}
!4 = !{i32 2, !"halide_mattrs", !"+fma,+f16c,+avx512f,+avx512cd,+avx512vl,+avx512bw,+avx512dq"}
!5 = !{i32 2, !"halide_mabi", !""}
!6 = !{i32 2, !"halide_use_pic", i32 1}
!7 = !{i32 2, !"halide_use_large_code_model", i32 0}
!8 = !{i32 2, !"halide_per_instruction_fast_math_flags", i32 0}
!9 = !{!"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !14, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"bool", !14, i64 0}
!20 = distinct !{!20, !11}
!21 = !{i8 0, i8 2}
!22 = !{!23, !26, i64 34}
!23 = !{!"_ZTS20halide_trace_event_t", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !24, i64 32, !27, i64 36, !17, i64 40, !17, i64 44, !17, i64 48}
!24 = !{!"_ZTS13halide_type_t", !25, i64 0, !14, i64 1, !26, i64 2}
!25 = !{!"_ZTS18halide_type_code_t", !14, i64 0}
!26 = !{!"short", !14, i64 0}
!27 = !{!"_ZTS25halide_trace_event_code_t", !14, i64 0}
!28 = !{!24, !14, i64 1}
!29 = !{!23, !17, i64 48}
!30 = !{!23, !13, i64 0}
!31 = !{!23, !13, i64 24}
!32 = !{!33, !17, i64 0}
!33 = !{!"_ZTSN6Halide7Runtime8Internal23SharedExclusiveSpinLockE", !17, i64 0}
!34 = !{!35, !17, i64 4}
!35 = !{!"_ZTSN6Halide7Runtime8Internal11TraceBufferE", !33, i64 0, !17, i64 4, !17, i64 8, !14, i64 12}
!36 = !{!35, !17, i64 8}
!37 = distinct !{!37, !11}
!38 = !{!14, !14, i64 0}
!39 = !{!40, !17, i64 0}
!40 = !{!"_ZTS21halide_trace_packet_t", !17, i64 0, !17, i64 4, !24, i64 8, !27, i64 12, !17, i64 16, !17, i64 20, !17, i64 24}
!41 = !{!40, !17, i64 4}
!42 = !{!23, !13, i64 16}
!43 = !{!23, !13, i64 8}
!44 = !{!40, !17, i64 24}
!45 = !{!40, !26, i64 10}
!46 = distinct !{!46, !11}
!47 = !{!23, !27, i64 36}
!48 = !{!23, !14, i64 33}
!49 = distinct !{!49, !11}
!50 = !{!23, !17, i64 44}
!51 = distinct !{!51, !11, !52}
!52 = !{!"llvm.loop.peeled.count", i32 1}
!53 = !{!23, !25, i64 32}
!54 = !{!26, !26, i64 0}
!55 = !{!56, !56, i64 0}
!56 = !{!"float", !14, i64 0}
!57 = !{!58, !58, i64 0}
!58 = !{!"double", !14, i64 0}
!59 = !{!60, !60, i64 0}
!60 = !{!"long long", !14, i64 0}
!61 = distinct !{!61, !11, !52}
!62 = distinct !{!62, !11}
!63 = !{!23, !17, i64 40}
!64 = distinct !{!64, !11}
!65 = distinct !{!65, !11}
!66 = distinct !{!66, !11}
!67 = !{!68, !13, i64 16}
!68 = !{!"_ZTS15halide_buffer_t", !60, i64 0, !13, i64 8, !13, i64 16, !60, i64 24, !24, i64 32, !17, i64 36, !13, i64 40, !13, i64 48}
!69 = !{!68, !60, i64 0}
!70 = !{!68, !17, i64 36}
!71 = !{!68, !13, i64 40}
!72 = !{i64 0, i64 4, !16, i64 4, i64 4, !16, i64 8, i64 4, !16, i64 12, i64 4, !16}
!73 = !{!74, !17, i64 4}
!74 = !{!"_ZTS18halide_dimension_t", !17, i64 0, !17, i64 4, !17, i64 8, !17, i64 12}
!75 = distinct !{!75, !11}
!76 = !{!74, !17, i64 0}
!77 = !{!74, !17, i64 8}
!78 = distinct !{!78, !11, !79}
!79 = !{!"llvm.loop.isvectorized", i32 1}
!80 = distinct !{!80, !81}
!81 = !{!"llvm.loop.unroll.disable"}
!82 = distinct !{!82, !11, !83, !79}
!83 = !{!"llvm.loop.unroll.runtime.disable"}
!84 = !{!85, !26, i64 0}
!85 = !{!"_ZTSN6Halide7Runtime8Internal18halide_tiff_headerE", !26, i64 0, !26, i64 2, !17, i64 4, !26, i64 8, !14, i64 10, !17, i64 190, !14, i64 194, !14, i64 202}
!86 = !{!85, !26, i64 2}
!87 = !{!85, !17, i64 4}
!88 = !{!85, !26, i64 8}
!89 = !{!90, !26, i64 0}
!90 = !{!"_ZTSN6Halide7Runtime8Internal8tiff_tagE", !26, i64 0, !26, i64 2, !17, i64 4, !14, i64 8}
!91 = !{!90, !26, i64 2}
!92 = !{!90, !17, i64 4}
!93 = distinct !{!93, !11}
!94 = distinct !{!94, !11}
!95 = distinct !{!95, !11}
!96 = distinct !{!96, !11}
!97 = distinct !{!97, !11}
!98 = !{!99}
!99 = distinct !{!99, !100}
!100 = distinct !{!100, !"LVerDomain"}
!101 = !{!102}
!102 = distinct !{!102, !100}
!103 = distinct !{!103, !11, !79}
!104 = distinct !{!104, !81}
!105 = distinct !{!105, !81}
!106 = distinct !{!106, !11, !79}
!107 = distinct !{!107, !81}
!108 = distinct !{!108, !11, !79}
!109 = distinct !{!109, !11, !79}
!110 = distinct !{!110, !11, !83, !79}
!111 = distinct !{!111, !11, !79}
!112 = distinct !{!112, !11, !83, !79}
!113 = distinct !{!113, !11, !79}
!114 = distinct !{!114, !11, !83, !79}
!115 = distinct !{!115, !11}
!116 = distinct !{!116, !11, !79}
!117 = distinct !{!117, !11, !83, !79}
!118 = distinct !{!118, !11}
!119 = distinct !{!119, !11}
!120 = distinct !{!120, !11}
!121 = distinct !{!121, !11}
!122 = !{!123, !13, i64 0}
!123 = !{!"_ZTSN6Halide7Runtime8Internal10CacheEntryE", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !124, i64 32, !13, i64 40, !17, i64 48, !17, i64 52, !17, i64 56, !17, i64 60, !13, i64 64, !13, i64 72, !60, i64 80, !19, i64 88}
!124 = !{!"long", !14, i64 0}
!125 = distinct !{!125, !11}
!126 = !{!123, !17, i64 56}
!127 = !{!123, !13, i64 24}
!128 = !{!123, !13, i64 72}
!129 = distinct !{!129, !11}
!130 = distinct !{!130, !11}
!131 = !{!132, !60, i64 0}
!132 = !{!"_ZTSN6Halide7Runtime8Internal11device_copyE", !60, i64 0, !60, i64 8, !60, i64 16, !14, i64 24, !14, i64 152, !14, i64 280, !60, i64 408}
!133 = !{!132, !60, i64 8}
!134 = !{!132, !60, i64 408}
!135 = distinct !{!135, !11}
!136 = !{!132, !60, i64 16}
!137 = distinct !{!137, !11, !79}
!138 = distinct !{!138, !11, !83, !79}
!139 = distinct !{!139, !11}
!140 = distinct !{!140, !81}
!141 = distinct !{!141, !11}
!142 = distinct !{!142, !11}
!143 = distinct !{!143, !11}
!144 = !{i64 0, i64 8, !59, i64 8, i64 8, !59, i64 16, i64 8, !59, i64 24, i64 128, !38, i64 152, i64 128, !38, i64 280, i64 128, !38, i64 408, i64 8, !59}
!145 = distinct !{!145, !11}
!146 = !{!74, !17, i64 12}
!147 = !{!123, !13, i64 16}
!148 = !{!123, !124, i64 32}
!149 = !{!123, !17, i64 48}
!150 = !{!123, !17, i64 52}
!151 = !{!123, !17, i64 60}
!152 = !{!123, !13, i64 64}
!153 = !{!123, !13, i64 40}
!154 = distinct !{!154, !11}
!155 = distinct !{!155, !11}
!156 = distinct !{!156, !11}
!157 = !{!123, !19, i64 88}
!158 = !{!123, !60, i64 80}
!159 = !{i64 0, i64 8, !59, i64 8, i64 8, !12, i64 16, i64 8, !12, i64 24, i64 8, !59, i64 32, i64 1, !160, i64 33, i64 1, !38, i64 34, i64 2, !54, i64 36, i64 4, !16, i64 40, i64 8, !12, i64 48, i64 8, !12}
!160 = !{!25, !25, i64 0}
!161 = distinct !{!161, !11}
!162 = distinct !{!162, !81}
!163 = distinct !{!163, !11}
!164 = !{!123, !13, i64 8}
!165 = distinct !{!165, !11}
!166 = distinct !{!166, !11, !79}
!167 = distinct !{!167, !11, !83, !79}
!168 = distinct !{!168, !11, !79}
!169 = distinct !{!169, !11, !83, !79}
!170 = distinct !{!170, !11}
!171 = distinct !{!171, !11}
!172 = distinct !{!172, !11}
!173 = distinct !{!173, !11}
!174 = distinct !{!174, !11}
!175 = distinct !{!175, !11, !79}
!176 = distinct !{!176, !11, !83, !79}
!177 = distinct !{!177, !11, !79}
!178 = distinct !{!178, !11, !83, !79}
!179 = distinct !{!179, !11}
!180 = !{!181, !17, i64 8}
!181 = !{!"_ZTSN6Halide7Runtime8Internal16CacheBlockHeaderE", !13, i64 0, !17, i64 8}
!182 = !{!181, !13, i64 0}
!183 = distinct !{!183, !11}
!184 = distinct !{!184, !81}
!185 = distinct !{!185, !11}
!186 = distinct !{!186, !11}
!187 = distinct !{!187, !11}
!188 = distinct !{!188, !11, !79}
!189 = distinct !{!189, !11, !83, !79}
!190 = distinct !{!190, !11, !79}
!191 = distinct !{!191, !11, !83, !79}
!192 = distinct !{!192, !11}
!193 = distinct !{!193, !11}
!194 = distinct !{!194, !11}
!195 = distinct !{!195, !11}
!196 = distinct !{!196, !11}
!197 = distinct !{!197, !11}
!198 = distinct !{!198, !11}
!199 = distinct !{!199, !11}
!200 = distinct !{!200, !11}
!201 = !{!24, !25, i64 0}
!202 = !{!24, !26, i64 2}
!203 = !{!68, !13, i64 8}
!204 = !{!68, !60, i64 24}
!205 = distinct !{!205, !11}
!206 = !{!207, !13, i64 0}
!207 = !{!"_ZTS29halide_device_allocation_pool", !13, i64 0, !13, i64 8}
!208 = distinct !{!208, !11}
!209 = !{!207, !13, i64 8}
!210 = !{!211, !13, i64 120}
!211 = !{!"_ZTS25halide_device_interface_t", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !13, i64 32, !13, i64 40, !13, i64 48, !13, i64 56, !13, i64 64, !13, i64 72, !13, i64 80, !13, i64 88, !13, i64 96, !13, i64 104, !13, i64 112, !13, i64 120}
!212 = !{!213, !13, i64 48}
!213 = !{!"_ZTS30halide_device_interface_impl_t", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !13, i64 32, !13, i64 40, !13, i64 48, !13, i64 56, !13, i64 64, !13, i64 72, !13, i64 80, !13, i64 88, !13, i64 96, !13, i64 104, !13, i64 112, !13, i64 120}
!214 = !{!213, !13, i64 40}
!215 = !{!213, !13, i64 56}
!216 = !{!213, !13, i64 0}
!217 = !{!213, !13, i64 16}
!218 = !{!213, !13, i64 8}
!219 = !{!213, !13, i64 32}
!220 = !{!213, !13, i64 24}
!221 = !{!213, !13, i64 64}
!222 = !{!213, !13, i64 72}
!223 = distinct !{!223, !11, !79}
!224 = distinct !{!224, !11, !83, !79}
!225 = distinct !{!225, !11, !79}
!226 = distinct !{!226, !11, !83, !79}
!227 = !{!213, !13, i64 112}
!228 = !{!213, !13, i64 120}
!229 = !{!213, !13, i64 80}
!230 = !{!213, !13, i64 88}
!231 = !{!213, !13, i64 96}
!232 = !{!213, !13, i64 104}
!233 = !{i32 22, i32 33}
!234 = !{!"branch_weights", i32 0, i32 1073741824}
!235 = !{!"branch_weights", i32 1073741824, i32 0}
!236 = !{!"branch_weights", i32 1, i32 2000}
!237 = !{!238, !238, i64 0}
!238 = !{!"input", !239, i64 0}
!239 = !{!"Halide buffer"}
!240 = !{!241, !241, i64 0}
!241 = !{!"repeat_edge", !239, i64 0}
!242 = distinct !{!242, !81}
!243 = !{!"branch_weights", i32 1073741824, i32 1073741824}
!244 = !{!245, !245, i64 0}
!245 = !{!"rows.width16.base0", !246, i64 0}
!246 = !{!"rows.width32.base0", !247, i64 0}
!247 = !{!"rows.width64.base0", !248, i64 0}
!248 = !{!"rows.width128.base0", !249, i64 0}
!249 = !{!"rows.width256.base0", !250, i64 0}
!250 = !{!"rows.width512.base0", !251, i64 0}
!251 = !{!"rows.width1024.base0", !252, i64 0}
!252 = !{!"rows", !239, i64 0}
!253 = !{!254, !254, i64 0}
!254 = !{!"rows.width16.base16", !246, i64 0}
!255 = !{!256, !256, i64 0}
!256 = !{!"rows.width16.base32", !257, i64 0}
!257 = !{!"rows.width32.base32", !247, i64 0}
!258 = !{!259, !259, i64 0}
!259 = !{!"rows.width16.base48", !257, i64 0}
!260 = !{!261, !261, i64 0}
!261 = !{!"rows.width16.base64", !262, i64 0}
!262 = !{!"rows.width32.base64", !263, i64 0}
!263 = !{!"rows.width64.base64", !248, i64 0}
!264 = !{!265, !265, i64 0}
!265 = !{!"rows.width16.base80", !262, i64 0}
!266 = !{!267, !267, i64 0}
!267 = !{!"rows.width16.base96", !268, i64 0}
!268 = !{!"rows.width32.base96", !263, i64 0}
!269 = !{!270, !270, i64 0}
!270 = !{!"rows.width16.base112", !268, i64 0}
!271 = !{!272, !272, i64 0}
!272 = !{!"rows.width16.base128", !273, i64 0}
!273 = !{!"rows.width32.base128", !274, i64 0}
!274 = !{!"rows.width64.base128", !275, i64 0}
!275 = !{!"rows.width128.base128", !249, i64 0}
!276 = !{!246, !246, i64 0}
!277 = !{!247, !247, i64 0}
!278 = !{!279, !279, i64 0}
!279 = !{!"output", !239, i64 0}
!280 = !{!257, !257, i64 0}
!281 = !{!248, !248, i64 0}
!282 = !{!262, !262, i64 0}
!283 = !{!263, !263, i64 0}
!284 = !{!268, !268, i64 0}
!285 = !{!249, !249, i64 0}
!286 = distinct !{!286, !81}
