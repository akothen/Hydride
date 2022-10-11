; ModuleID = 'matmul_simple'
source_filename = "/home/sb54/halide-12/src/runtime/fake_thread_pool.cpp"
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
%"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0" = type <{ i8*, i8*, i8*, i8*, i8, [1 x i8], [6 x i8] }>
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
@.str.32 = private unnamed_addr constant [108 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:115 Assert failed: success && \22Could not write to trace file\22\0A\00", align 1
@.str.31 = private unnamed_addr constant [84 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:87 Assert failed: size <= buffer_size\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1.9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2.10 = private unnamed_addr constant [104 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:219 Assert failed: print_bits <= 64 && \22Tracing bad type\22\0A\00", align 1
@__const.halide_default_trace.event_types = private unnamed_addr constant [11 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.11, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.12, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5.13, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6.14, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7.15, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8.16, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0)], align 8
@.str.14 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c">)\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c">, <\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c" = <\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c" = \00", align 1
@.str.24 = private unnamed_addr constant [106 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:288 Assert failed: print_bits >= 16 && \22Tracing a bad type\22\0A\00", align 1
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
@.str.30 = private unnamed_addr constant [103 x i8] c"/home/sb54/halide-12/src/runtime/tracing.cpp:353 Assert failed: file && \22Failed to open trace file\\n\22\0A\00", align 1
@llvm.global_dtors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @halide_trace_cleanup, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @halide_cache_cleanup, i8* null }]
@_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE = linkonce local_unnamed_addr global [10 x i16] [i16 3, i16 3, i16 1, i16 2, i16 1, i16 2, i16 1, i16 2, i16 1, i16 2], align 2
@_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE = linkonce local_unnamed_addr global [10 x i8] c"\07\06\09\08\0B\0A\0D\0C\0F\0E", align 1
@_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE = linkonce local_unnamed_addr global [10 x i8] c"\07\09\02\01\04\03\06\05\0D\0C", align 1
@.str.35 = private unnamed_addr constant [51 x i8] c"Bounds query buffer passed to halide_debug_to_file\00", align 1
@.str.1.36 = private unnamed_addr constant [59 x i8] c"Can't debug_to_file a Func with more than four dimensions\0A\00", align 1
@.str.2.37 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.3.38 = private unnamed_addr constant [6 x i8] c".tiff\00", align 1
@.str.4.39 = private unnamed_addr constant [5 x i8] c".tif\00", align 1
@.str.5.40 = private unnamed_addr constant [5 x i8] c".mat\00", align 1
@__const.halide_debug_to_file.header = private unnamed_addr constant [129 x i8] c"MATLAB 5.0 MAT-file, produced by Halide                                                                                     \00\01IM\00", align 1
@.str.6.41 = private unnamed_addr constant [53 x i8] c"Can't debug_to_file to a .mat file greater than 4GB\0A\00", align 1
@_ZN6Halide7Runtime8Internal16memoization_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal13cache_entriesE = linkonce local_unnamed_addr global [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*] zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal18most_recently_usedE = linkonce local_unnamed_addr global %"struct.Halide::Runtime::Internal::CacheEntry"* null, align 8
@_ZN6Halide7Runtime8Internal19least_recently_usedE = linkonce local_unnamed_addr global %"struct.Halide::Runtime::Internal::CacheEntry"* null, align 8
@_ZN6Halide7Runtime8Internal14max_cache_sizeE = linkonce local_unnamed_addr global i64 1048576, align 8
@_ZN6Halide7Runtime8Internal18current_cache_sizeE = linkonce local_unnamed_addr global i64 0, align 8
@.str.1.43 = private unnamed_addr constant [90 x i8] c"/home/sb54/halide-12/src/runtime/cache.cpp:281 Assert failed: prev_hash_entry != nullptr\0A\00", align 1
@.str.2.44 = private unnamed_addr constant [93 x i8] c"/home/sb54/halide-12/src/runtime/cache.cpp:370 Assert failed: entry->more_recent != nullptr\0A\00", align 1
@.str.3.45 = private unnamed_addr constant [92 x i8] c"/home/sb54/halide-12/src/runtime/cache.cpp:374 Assert failed: least_recently_used == entry\0A\00", align 1
@.str.4.46 = private unnamed_addr constant [93 x i8] c"/home/sb54/halide-12/src/runtime/cache.cpp:377 Assert failed: entry->more_recent != nullptr\0A\00", align 1
@.str.8.47 = private unnamed_addr constant [86 x i8] c"/home/sb54/halide-12/src/runtime/cache.cpp:469 Assert failed: no_host_pointers_equal\0A\00", align 1
@.str.11.48 = private unnamed_addr constant [87 x i8] c"/home/sb54/halide-12/src/runtime/cache.cpp:547 Assert failed: entry->in_use_count > 0\0A\00", align 1
@.str.57 = private unnamed_addr constant [5 x i8] c"-nan\00", align 1
@.str.1.58 = private unnamed_addr constant [4 x i8] c"nan\00", align 1
@.str.2.59 = private unnamed_addr constant [5 x i8] c"-inf\00", align 1
@.str.3.60 = private unnamed_addr constant [4 x i8] c"inf\00", align 1
@.str.4.61 = private unnamed_addr constant [14 x i8] c"-0.000000e+00\00", align 1
@.str.5.62 = private unnamed_addr constant [13 x i8] c"0.000000e+00\00", align 1
@.str.6.63 = private unnamed_addr constant [10 x i8] c"-0.000000\00", align 1
@.str.7.64 = private unnamed_addr constant [9 x i8] c"0.000000\00", align 1
@.str.8.65 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.10.67 = private unnamed_addr constant [3 x i8] c"e+\00", align 1
@.str.11.68 = private unnamed_addr constant [3 x i8] c"e-\00", align 1
@.str.12.71 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1
@.str.17.72 = private unnamed_addr constant [14 x i8] c"bad_type_code\00", align 1
@.str.16.73 = private unnamed_addr constant [7 x i8] c"handle\00", align 1
@.str.15.74 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.14.75 = private unnamed_addr constant [5 x i8] c"uint\00", align 1
@.str.13.76 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.18.77 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.19.78 = private unnamed_addr constant [8 x i8] c"nullptr\00", align 1
@.str.20.79 = private unnamed_addr constant [8 x i8] c"buffer(\00", align 1
@.str.22.82 = private unnamed_addr constant [4 x i8] c", {\00", align 1
@.str.23.83 = private unnamed_addr constant [2 x i8] c"}\00", align 1
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
@.str.22.97 = private unnamed_addr constant [91 x i8] c"/home/sb54/halide-12/src/runtime/device_interface.cpp:252 Assert failed: buf->device == 0\0A\00", align 1
@.str.23.98 = private unnamed_addr constant [30 x i8] c"halide_device_and_host_malloc\00", align 1
@.str.25.99 = private unnamed_addr constant [68 x i8] c"halide_device_and_host_malloc doesn't support switching interfaces\0A\00", align 1
@.str.26.100 = private unnamed_addr constant [42 x i8] c"allocating host and device memory failed\0A\00", align 1
@.str.27.101 = private unnamed_addr constant [28 x i8] c"halide_device_and_host_free\00", align 1
@.str.28.102 = private unnamed_addr constant [91 x i8] c"/home/sb54/halide-12/src/runtime/device_interface.cpp:317 Assert failed: buf->device == 0\0A\00", align 1
@.str.29.103 = private unnamed_addr constant [38 x i8] c"halide_default_device_and_host_malloc\00", align 1
@.str.30.104 = private unnamed_addr constant [36 x i8] c"halide_default_device_and_host_free\00", align 1
@.str.31.105 = private unnamed_addr constant [26 x i8] c"halide_device_wrap_native\00", align 1
@.str.32.106 = private unnamed_addr constant [64 x i8] c"halide_device_wrap_native doesn't support switching interfaces\0A\00", align 1
@.str.33.107 = private unnamed_addr constant [28 x i8] c"halide_device_detach_native\00", align 1
@.str.34.108 = private unnamed_addr constant [91 x i8] c"/home/sb54/halide-12/src/runtime/device_interface.cpp:403 Assert failed: buf->device == 0\0A\00", align 1
@.str.35.109 = private unnamed_addr constant [34 x i8] c"halide_default_device_wrap_native\00", align 1
@.str.36 = private unnamed_addr constant [36 x i8] c"halide_default_device_detach_native\00", align 1
@.str.42 = private unnamed_addr constant [64 x i8] c"halide_buffer_copy does not support switching device interfaces\00", align 1
@.str.58 = private unnamed_addr constant [44 x i8] c"device_interface does not support cropping\0A\00", align 1
@.str.59 = private unnamed_addr constant [43 x i8] c"device_interface does not support slicing\0A\00", align 1
@.str.60 = private unnamed_addr constant [52 x i8] c"destination buffer already has a device allocation\0A\00", align 1
@.str.61 = private unnamed_addr constant [48 x i8] c"src and dst must have identical dimensionality\0A\00", align 1
@.str.64 = private unnamed_addr constant [52 x i8] c"dst must have exactly one fewer dimension than src\0A\00", align 1
@.str.112 = private unnamed_addr constant [41 x i8] c"Bounds inference call to external stage \00", align 1
@.str.74 = private unnamed_addr constant [10 x i8] c"<nullptr>\00", align 1
@.str.1.113 = private unnamed_addr constant [27 x i8] c" returned non-zero value: \00", align 1
@.str.73 = private unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@.str.2.114 = private unnamed_addr constant [24 x i8] c"Call to external stage \00", align 1
@.str.3.115 = private unnamed_addr constant [18 x i8] c"Bounds given for \00", align 1
@.str.4.116 = private unnamed_addr constant [5 x i8] c" in \00", align 1
@.str.5.117 = private unnamed_addr constant [8 x i8] c" (from \00", align 1
@.str.6.118 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@.str.7.119 = private unnamed_addr constant [38 x i8] c") do not cover required region (from \00", align 1
@.str.8.120 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.9.121 = private unnamed_addr constant [11 x i8] c" has type \00", align 1
@.str.10.122 = private unnamed_addr constant [38 x i8] c" but type of the buffer passed in is \00", align 1
@.str.11.123 = private unnamed_addr constant [31 x i8] c" requires a buffer of exactly \00", align 1
@.str.12.124 = private unnamed_addr constant [43 x i8] c" dimensions, but the buffer passed in has \00", align 1
@.str.13.125 = private unnamed_addr constant [12 x i8] c" dimensions\00", align 1
@.str.14.126 = private unnamed_addr constant [17 x i8] c" is accessed at \00", align 1
@.str.15.127 = private unnamed_addr constant [28 x i8] c", which is before the min (\00", align 1
@.str.16.128 = private unnamed_addr constant [16 x i8] c") in dimension \00", align 1
@.str.17.129 = private unnamed_addr constant [28 x i8] c", which is beyond the max (\00", align 1
@.str.18.130 = private unnamed_addr constant [29 x i8] c"Total allocation for buffer \00", align 1
@.str.19.131 = private unnamed_addr constant [5 x i8] c" is \00", align 1
@.str.20.132 = private unnamed_addr constant [37 x i8] c", which exceeds the maximum size of \00", align 1
@.str.21.133 = private unnamed_addr constant [24 x i8] c"The extents for buffer \00", align 1
@.str.22.134 = private unnamed_addr constant [12 x i8] c" dimension \00", align 1
@.str.23.135 = private unnamed_addr constant [15 x i8] c" is negative (\00", align 1
@.str.24.136 = private unnamed_addr constant [31 x i8] c"Product of extents for buffer \00", align 1
@.str.25.137 = private unnamed_addr constant [29 x i8] c"Applying the constraints on \00", align 1
@.str.26.138 = private unnamed_addr constant [54 x i8] c" to the required region made it smaller in dimension \00", align 1
@.str.27.139 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.28.140 = private unnamed_addr constant [16 x i8] c"Required size: \00", align 1
@.str.29.141 = private unnamed_addr constant [19 x i8] c"Constrained size: \00", align 1
@.str.30.142 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.31.143 = private unnamed_addr constant [22 x i8] c"Constraint violated: \00", align 1
@.str.32.144 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.33.145 = private unnamed_addr constant [6 x i8] c") == \00", align 1
@.str.34.146 = private unnamed_addr constant [11 x i8] c"Parameter \00", align 1
@.str.35.147 = private unnamed_addr constant [23 x i8] c" but must be at least \00", align 1
@.str.36.148 = private unnamed_addr constant [22 x i8] c" but must be at most \00", align 1
@.str.37 = private unnamed_addr constant [47 x i8] c"Out of memory (halide_malloc returned nullptr)\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"Buffer argument \00", align 1
@.str.39 = private unnamed_addr constant [12 x i8] c" is nullptr\00", align 1
@.str.40 = private unnamed_addr constant [25 x i8] c"Failed to dump function \00", align 1
@.str.41 = private unnamed_addr constant [10 x i8] c" to file \00", align 1
@.str.42.149 = private unnamed_addr constant [13 x i8] c" with error \00", align 1
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
@.str.57.150 = private unnamed_addr constant [47 x i8] c" which is outside the range currently valid: [\00", align 1
@.str.58.151 = private unnamed_addr constant [3 x i8] c"].\00", align 1
@.str.59.152 = private unnamed_addr constant [47 x i8] c" which wraps around the boundary of the fold, \00", align 1
@.str.60.153 = private unnamed_addr constant [30 x i8] c"which occurs at multiples of \00", align 1
@.str.61.154 = private unnamed_addr constant [18 x i8] c"The fold factor (\00", align 1
@.str.62 = private unnamed_addr constant [16 x i8] c") of dimension \00", align 1
@.str.63 = private unnamed_addr constant [61 x i8] c" is too small to store the required region accessed by loop \00", align 1
@.str.64.155 = private unnamed_addr constant [3 x i8] c").\00", align 1
@.str.65 = private unnamed_addr constant [22 x i8] c"Requirement Failed: (\00", align 1
@.str.66 = private unnamed_addr constant [3 x i8] c") \00", align 1
@.str.67 = private unnamed_addr constant [59 x i8] c"A schedule specialized with specialize_fail() was chosen: \00", align 1
@.str.68 = private unnamed_addr constant [55 x i8] c"Buffer has a non-zero device but no device interface.\0A\00", align 1
@.str.69 = private unnamed_addr constant [57 x i8] c"Buffer has a non-null device_interface but device is 0.\0A\00", align 1
@.str.70 = private unnamed_addr constant [49 x i8] c"Buffer has both host and device dirty bits set.\0A\00", align 1
@.str.71 = private unnamed_addr constant [26 x i8] c"Buffer pointer passed to \00", align 1
@.str.72 = private unnamed_addr constant [11 x i8] c" is null.\0A\00", align 1
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 8
@_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE = linkonce global [4 x i64] zeroinitializer, align 8
@.str.168 = private unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@0 = private constant [4 x i64*] zeroinitializer
@str = private constant [2 x i8] c"A\00", align 32
@1 = private constant [4 x i64*] zeroinitializer
@str.172 = private constant [2 x i8] c"B\00", align 32
@2 = private constant [4 x i64*] zeroinitializer
@str.173 = private constant [4 x i8] c"res\00", align 32
@3 = private constant [3 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @0, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.172, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @1, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.173, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 0, i8 32, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @2, i32 0, i32 0) }]
@str.174 = private constant [85 x i8] c"x86-64-noos-avx-avx2-avx512-avx512_skylake-f16c-fma-no_asserts-no_bounds_query-sse41\00", align 64
@str.175 = private constant [14 x i8] c"matmul_simple\00", align 32
@matmul_simple_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 3, %struct.halide_filter_argument_t* getelementptr inbounds ([3 x %struct.halide_filter_argument_t], [3 x %struct.halide_filter_argument_t]* @3, i32 0, i32 0), i8* getelementptr inbounds ([85 x i8], [85 x i8]* @str.174, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.175, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13.76, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14.75, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15.74, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16.73, i64 0, i64 0)], align 8

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_task(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) #0 {
  %5 = tail call i32 %1(i8* %0, i32 %2, i8* %3) #16
  ret i32 %5
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_loop_task(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) #0 {
  %7 = tail call i32 %1(i8* %0, i32 %2, i32 %3, i8* %4, i8* %5) #16
  ret i32 %7
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_par_for(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* %4) #0 {
  %6 = add nsw i32 %3, %2
  %7 = icmp sgt i32 %3, 0
  br i1 %7, label %.preheader, label %.loopexit

8:                                                ; preds = %.preheader
  %9 = icmp slt i32 %13, %6
  br i1 %9, label %.preheader, label %.loopexit, !llvm.loop !10

.preheader:                                       ; preds = %5, %8
  %10 = phi i32 [ %13, %8 ], [ %2, %5 ]
  %11 = tail call i32 @halide_do_task(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %10, i8* %4) #17
  %12 = icmp eq i32 %11, 0
  %13 = add nsw i32 %10, 1
  br i1 %12, label %8, label %.loopexit

.loopexit:                                        ; preds = %.preheader, %8, %5
  %14 = phi i32 [ 0, %5 ], [ %11, %.preheader ], [ 0, %8 ]
  ret i32 %14
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_task(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !12
  %6 = tail call i32 %5(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) #16
  ret i32 %6
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_do_parallel_tasks(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) #0 {
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str, i64 0, i64 0)) #16
  ret i32 -1
}

declare void @halide_error(i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t* %0, i32 %1) #0 {
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1, i64 0, i64 0)) #16
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t* %0, i32 %1) #0 {
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.2, i64 0, i64 0)) #16
  ret i32 0
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %0, i32 %1) #0 {
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.3, i64 0, i64 0)) #16
  ret i1 false
}

; Function Attrs: nounwind mustprogress
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)* %0, i8* %1) local_unnamed_addr #0 {
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i64 0, i64 0)) #16
  ret %struct.halide_thread* null
}

; Function Attrs: nounwind mustprogress
define weak void @halide_join_thread(%struct.halide_thread* %0) local_unnamed_addr #0 {
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.5, i64 0, i64 0)) #16
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_mutex_lock(%struct.halide_mutex* %0) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_mutex_unlock(%struct.halide_mutex* %0) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak %struct.halide_mutex_array* @halide_mutex_array_create(i32 %0) local_unnamed_addr #2 {
  ret %struct.halide_mutex_array* @_ZN6Halide7Runtime8Internal23halide_fake_mutex_arrayE
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_mutex_array_destroy(i8* %0, i8* %1) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_mutex_array_lock(%struct.halide_mutex_array* %0, i32 %1) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_mutex_array_unlock(%struct.halide_mutex_array* %0, i32 %1) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_shutdown_thread_pool() local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_set_num_threads(i32 %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %4, label %3

3:                                                ; preds = %1
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.6, i64 0, i64 0)) #16
  br label %4

4:                                                ; preds = %3, %1
  ret i32 1
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_set_custom_do_task(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !12
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !12
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %2
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_set_custom_do_par_for(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !12
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !12
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_par_for(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* %4) local_unnamed_addr #0 {
  %6 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !12
  %7 = tail call i32 %6(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* %4) #16
  ret i32 %7
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_loop_task(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) local_unnamed_addr #0 {
  %7 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !12
  %8 = tail call i32 %7(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) #16
  ret i32 %8
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_do_parallel_tasks(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !12
  %6 = tail call i32 %5(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) #16
  ret i32 %6
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t* %0, i32 %1) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !12
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #16
  ret i32 %4
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t* %0, i32 %1) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !12
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #16
  ret i32 %4
}

; Function Attrs: nounwind mustprogress
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t* %0, i32 %1) local_unnamed_addr #0 {
  %3 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !12
  %4 = tail call zeroext i1 %3(%struct.halide_semaphore_t* %0, i32 %1) #16
  ret i1 %4
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i8* @memcpy(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare void @halide_free(i8*, i8*) local_unnamed_addr #1

declare i8* @halide_malloc(i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_gpu_device(i32 %0) local_unnamed_addr #2 {
  store i32 %0, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !16
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !18
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_get_gpu_device(i8* %0) local_unnamed_addr #4 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, i8 1 acquire
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %2, !llvm.loop !20

5:                                                ; preds = %2
  %6 = load i8, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !18, !range !21
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  %9 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !16
  br label %17

10:                                               ; preds = %5
  %11 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0)) #16
  %12 = icmp eq i8* %11, null
  br i1 %12, label %15, label %13

13:                                               ; preds = %10
  %14 = tail call i32 @atoi(i8* nonnull %11) #16
  br label %15

15:                                               ; preds = %13, %10
  %16 = phi i32 [ %14, %13 ], [ -1, %10 ]
  store i32 %16, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !16
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !18
  br label %17

17:                                               ; preds = %15, %8
  %18 = phi i32 [ %9, %8 ], [ %16, %15 ]
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE release, align 1
  ret i32 %18
}

declare i8* @getenv(i8*) local_unnamed_addr #1

declare i32 @atoi(i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define weak i32 @halide_default_trace(i8* %0, %struct.halide_trace_event_t* %1) #4 {
  %3 = alloca [4096 x i8], align 1
  %4 = alloca %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", align 8
  %5 = atomicrmw add i32* @_ZZ20halide_default_traceE3ids, i32 1 seq_cst
  %6 = tail call i32 @halide_get_trace_file(i8* %0) #17
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %239

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4
  %10 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 2
  %11 = load i16, i16* %10, align 2, !tbaa !22
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 1
  %14 = load i8, i8* %13, align 1, !tbaa !28
  %15 = zext i8 %14 to i32
  %16 = add nuw nsw i32 %15, 7
  %17 = lshr i32 %16, 3
  %18 = mul nuw nsw i32 %17, %12
  %19 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 8
  %20 = load i32, i32* %19, align 8, !tbaa !29
  %21 = shl i32 %20, 2
  %22 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 0
  %23 = load i8*, i8** %22, align 8, !tbaa !30
  %24 = tail call i64 @strlen(i8* %23) #16
  %25 = trunc i64 %24 to i32
  %26 = add i32 %25, 1
  %27 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 3
  %28 = load i8*, i8** %27, align 8, !tbaa !31
  %29 = icmp eq i8* %28, null
  br i1 %29, label %34, label %30

30:                                               ; preds = %8
  %31 = tail call i64 @strlen(i8* nonnull %28) #16
  %32 = trunc i64 %31 to i32
  %33 = add i32 %32, 1
  br label %34

34:                                               ; preds = %30, %8
  %35 = phi i32 [ %33, %30 ], [ 1, %8 ]
  %36 = add i32 %21, 31
  %37 = add i32 %36, %18
  %38 = add i32 %37, %26
  %39 = add i32 %38, %35
  %40 = and i32 %39, -4
  %41 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %42 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 0, i32 0
  %43 = icmp ult i32 %40, 1048577
  %44 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 1
  %45 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 2
  %46 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 3, i64 0
  br i1 %43, label %.preheader, label %.preheader23

.preheader:                                       ; preds = %34, %.preheader.backedge
  %47 = load volatile i32, i32* %42, align 4, !tbaa !32
  %48 = and i32 %47, 1073741823
  %49 = add nuw nsw i32 %48, 1
  %50 = cmpxchg i32* %42, i32 %48, i32 %49 seq_cst seq_cst
  %51 = extractvalue { i32, i1 } %50, 1
  br i1 %51, label %52, label %.preheader.backedge

52:                                               ; preds = %.preheader
  %53 = atomicrmw add i32* %44, i32 %40 seq_cst
  %54 = add i32 %53, %40
  %55 = icmp ugt i32 %54, 1048576
  br i1 %55, label %56, label %.loopexit

56:                                               ; preds = %52
  %57 = atomicrmw add i32* %45, i32 %40 seq_cst
  %58 = atomicrmw sub i32* %42, i32 1 seq_cst
  br label %59

59:                                               ; preds = %59, %56
  %60 = atomicrmw or i32* %42, i32 1073741824 seq_cst
  %61 = cmpxchg i32* %42, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %62 = extractvalue { i32, i1 } %61, 1
  br i1 %62, label %63, label %59

63:                                               ; preds = %59
  %64 = load i32, i32* %44, align 4, !tbaa !34
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %75, label %66

66:                                               ; preds = %63
  %67 = load i32, i32* %45, align 4, !tbaa !36
  %68 = sub i32 %64, %67
  store i32 %68, i32* %44, align 4, !tbaa !34
  %69 = zext i32 %68 to i64
  %70 = tail call i64 @write(i32 %6, i8* nonnull %46, i64 %69) #16
  %71 = trunc i64 %70 to i32
  %72 = icmp eq i32 %68, %71
  store i32 0, i32* %44, align 4, !tbaa !34
  store i32 0, i32* %45, align 4, !tbaa !36
  %73 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br i1 %72, label %.preheader.backedge, label %74

74:                                               ; preds = %66
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([108 x i8], [108 x i8]* @.str.32, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %.preheader.backedge

75:                                               ; preds = %63
  %76 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br label %.preheader.backedge

.preheader.backedge:                              ; preds = %75, %74, %66, %.preheader
  br label %.preheader, !llvm.loop !37

.preheader23:                                     ; preds = %34, %.preheader23.backedge
  %77 = load volatile i32, i32* %42, align 4, !tbaa !32
  %78 = and i32 %77, 1073741823
  %79 = add nuw nsw i32 %78, 1
  %80 = cmpxchg i32* %42, i32 %78, i32 %79 seq_cst seq_cst
  %81 = extractvalue { i32, i1 } %80, 1
  br i1 %81, label %82, label %.preheader23.backedge

82:                                               ; preds = %.preheader23
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.31, i64 0, i64 0)) #16
  tail call void @abort() #16
  %83 = atomicrmw add i32* %44, i32 %40 seq_cst
  %84 = add i32 %83, %40
  %85 = icmp ugt i32 %84, 1048576
  br i1 %85, label %86, label %.loopexit

86:                                               ; preds = %82
  %87 = atomicrmw add i32* %45, i32 %40 seq_cst
  %88 = atomicrmw sub i32* %42, i32 1 seq_cst
  br label %89

89:                                               ; preds = %89, %86
  %90 = atomicrmw or i32* %42, i32 1073741824 seq_cst
  %91 = cmpxchg i32* %42, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %92 = extractvalue { i32, i1 } %91, 1
  br i1 %92, label %93, label %89

93:                                               ; preds = %89
  %94 = load i32, i32* %44, align 4, !tbaa !34
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %105, label %96

96:                                               ; preds = %93
  %97 = load i32, i32* %45, align 4, !tbaa !36
  %98 = sub i32 %94, %97
  store i32 %98, i32* %44, align 4, !tbaa !34
  %99 = zext i32 %98 to i64
  %100 = tail call i64 @write(i32 %6, i8* nonnull %46, i64 %99) #16
  %101 = trunc i64 %100 to i32
  %102 = icmp eq i32 %98, %101
  store i32 0, i32* %44, align 4, !tbaa !34
  store i32 0, i32* %45, align 4, !tbaa !36
  %103 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br i1 %102, label %.preheader23.backedge, label %104

104:                                              ; preds = %96
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([108 x i8], [108 x i8]* @.str.32, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %.preheader23.backedge

105:                                              ; preds = %93
  %106 = atomicrmw and i32* %42, i32 2147483647 seq_cst
  br label %.preheader23.backedge

.preheader23.backedge:                            ; preds = %105, %104, %96, %.preheader23
  br label %.preheader23, !llvm.loop !37

.loopexit:                                        ; preds = %82, %52
  %107 = phi i32 [ %53, %52 ], [ %83, %82 ]
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %41, i64 0, i32 3, i64 %108
  %110 = icmp ugt i32 %40, 4096
  br i1 %110, label %111, label %129

111:                                              ; preds = %.loopexit
  %112 = tail call i8* @malloc(i64 1024) #16
  %113 = icmp eq i8* %112, null
  br i1 %113, label %114, label %118

114:                                              ; preds = %111
  %115 = zext i32 %40 to i64
  %116 = tail call i8* @halide_uint64_to_string(i8* null, i8* null, i64 %115, i32 1) #16
  %117 = tail call i8* @halide_string_to_string(i8* %116, i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)) #16
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %128

118:                                              ; preds = %111
  %119 = getelementptr inbounds i8, i8* %112, i64 1023
  store i8 0, i8* %119, align 1, !tbaa !38
  %120 = zext i32 %40 to i64
  %121 = tail call i8* @halide_uint64_to_string(i8* nonnull %112, i8* nonnull %119, i64 %120, i32 1) #16
  %122 = tail call i8* @halide_string_to_string(i8* %121, i8* nonnull %119, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)) #16
  %123 = ptrtoint i8* %122 to i64
  %124 = ptrtoint i8* %112 to i64
  %125 = sub i64 1, %124
  %126 = add i64 %125, %123
  %127 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* null, i8* nonnull %112, i64 %126) #16
  tail call void @halide_print(i8* null, i8* nonnull %112) #16
  br label %128

128:                                              ; preds = %118, %114
  tail call void @free(i8* %112) #16
  br label %129

129:                                              ; preds = %128, %.loopexit
  %130 = bitcast i8* %109 to i32*
  store i32 %40, i32* %130, align 4, !tbaa !39
  %131 = getelementptr inbounds i8, i8* %109, i64 4
  %132 = bitcast i8* %131 to i32*
  store i32 %5, i32* %132, align 4, !tbaa !41
  %133 = getelementptr inbounds i8, i8* %109, i64 8
  %134 = bitcast %struct.halide_type_t* %9 to i32*
  %135 = bitcast i8* %133 to i32*
  %136 = load i32, i32* %134, align 8
  store i32 %136, i32* %135, align 4
  %137 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 5
  %138 = getelementptr inbounds i8, i8* %109, i64 12
  %139 = bitcast i32* %137 to <4 x i32>*
  %140 = load <4 x i32>, <4 x i32>* %139, align 4, !tbaa !38
  %141 = getelementptr inbounds i8, i8* %109, i64 24
  %142 = bitcast i8* %141 to i32*
  %143 = bitcast i8* %138 to <4 x i32>*
  store <4 x i32> %140, <4 x i32>* %143, align 4, !tbaa !38
  %144 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 2
  %145 = load i32*, i32** %144, align 8, !tbaa !42
  %146 = icmp eq i32* %145, null
  br i1 %146, label %152, label %147

147:                                              ; preds = %129
  %148 = bitcast i32* %145 to i8*
  %149 = getelementptr inbounds i8, i8* %109, i64 28
  %150 = zext i32 %21 to i64
  %151 = tail call i8* @memcpy(i8* nonnull %149, i8* nonnull %148, i64 %150) #16
  br label %152

152:                                              ; preds = %147, %129
  %153 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 1
  %154 = load i8*, i8** %153, align 8, !tbaa !43
  %155 = icmp eq i8* %154, null
  br i1 %155, label %._crit_edge43, label %156

156:                                              ; preds = %152
  %157 = getelementptr inbounds i8, i8* %109, i64 28
  %158 = bitcast i8* %157 to i32*
  %159 = load i32, i32* %142, align 4, !tbaa !44
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32* %158, i64 %160
  %162 = bitcast i32* %161 to i8*
  %163 = zext i32 %18 to i64
  %164 = tail call i8* @memcpy(i8* nonnull %162, i8* nonnull %154, i64 %163) #16
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %152, %156
  %165 = getelementptr inbounds i8, i8* %109, i64 28
  %166 = bitcast i8* %165 to i32*
  %167 = load i32, i32* %142, align 4, !tbaa !44
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32* %166, i64 %168
  %170 = bitcast i32* %169 to i8*
  %171 = getelementptr inbounds i8, i8* %109, i64 10
  %172 = bitcast i8* %171 to i16*
  %173 = load i16, i16* %172, align 2, !tbaa !45
  %174 = zext i16 %173 to i32
  %175 = getelementptr inbounds i8, i8* %109, i64 9
  %176 = load i8, i8* %175, align 1, !tbaa !28
  %177 = zext i8 %176 to i32
  %178 = add nuw nsw i32 %177, 7
  %179 = lshr i32 %178, 3
  %180 = mul nuw nsw i32 %179, %174
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds i8, i8* %170, i64 %181
  %183 = load i8*, i8** %22, align 8, !tbaa !30
  %184 = zext i32 %26 to i64
  %185 = tail call i8* @memcpy(i8* nonnull %182, i8* %183, i64 %184) #16
  %186 = load i32, i32* %142, align 4, !tbaa !44
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32* %166, i64 %187
  %189 = bitcast i32* %188 to i8*
  %190 = load i16, i16* %172, align 2, !tbaa !45
  %191 = zext i16 %190 to i32
  %192 = load i8, i8* %175, align 1, !tbaa !28
  %193 = zext i8 %192 to i32
  %194 = add nuw nsw i32 %193, 7
  %195 = lshr i32 %194, 3
  %196 = mul nuw nsw i32 %195, %191
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds i8, i8* %189, i64 %197
  br label %199

199:                                              ; preds = %199, %._crit_edge43
  %200 = phi i8* [ %198, %._crit_edge43 ], [ %201, %199 ]
  %201 = getelementptr inbounds i8, i8* %200, i64 1
  %202 = load i8, i8* %200, align 1, !tbaa !38
  %203 = icmp eq i8 %202, 0
  br i1 %203, label %204, label %199, !llvm.loop !46

204:                                              ; preds = %199
  %205 = load i8*, i8** %27, align 8, !tbaa !31
  %206 = icmp eq i8* %205, null
  %207 = select i1 %206, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1.9, i64 0, i64 0), i8* %205
  %208 = zext i32 %35 to i64
  %209 = tail call i8* @memcpy(i8* nonnull %201, i8* %207, i64 %208) #16
  %210 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  fence seq_cst
  %211 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %210, i64 0, i32 0, i32 0
  %212 = atomicrmw sub i32* %211, i32 1 seq_cst
  %213 = load i32, i32* %137, align 4, !tbaa !47
  %214 = icmp eq i32 %213, 9
  br i1 %214, label %215, label %603

215:                                              ; preds = %204
  %216 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %217 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 0, i32 0
  br label %218

218:                                              ; preds = %218, %215
  %219 = atomicrmw or i32* %217, i32 1073741824 seq_cst
  %220 = cmpxchg i32* %217, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %221 = extractvalue { i32, i1 } %220, 1
  br i1 %221, label %222, label %218

222:                                              ; preds = %218
  %223 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 1
  %224 = load i32, i32* %223, align 4, !tbaa !34
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %237, label %226

226:                                              ; preds = %222
  %227 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 2
  %228 = load i32, i32* %227, align 4, !tbaa !36
  %229 = sub i32 %224, %228
  store i32 %229, i32* %223, align 4, !tbaa !34
  %230 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %216, i64 0, i32 3, i64 0
  %231 = zext i32 %229 to i64
  %232 = tail call i64 @write(i32 %6, i8* nonnull %230, i64 %231) #16
  %233 = trunc i64 %232 to i32
  %234 = icmp eq i32 %229, %233
  store i32 0, i32* %223, align 4, !tbaa !34
  store i32 0, i32* %227, align 4, !tbaa !36
  %235 = atomicrmw and i32* %217, i32 2147483647 seq_cst
  br i1 %234, label %603, label %236

236:                                              ; preds = %226
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([108 x i8], [108 x i8]* @.str.32, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %603

237:                                              ; preds = %222
  %238 = atomicrmw and i32* %217, i32 2147483647 seq_cst
  br label %603

239:                                              ; preds = %2
  %240 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %240) #18
  %241 = bitcast %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %241) #18
  %242 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 3
  store i8* %0, i8** %242, align 8, !tbaa !48
  %243 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 4
  store i8 0, i8* %243, align 8, !tbaa !50
  %244 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 0
  store i8* %240, i8** %244, align 8
  %245 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 1
  store i8* %240, i8** %245, align 8, !tbaa !51
  %246 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 4095
  %247 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 2
  store i8* %246, i8** %247, align 8, !tbaa !52
  store i8 0, i8* %246, align 1, !tbaa !38
  %248 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 1
  %249 = load i8, i8* %248, align 1, !tbaa !53
  %250 = zext i8 %249 to i32
  br label %251

251:                                              ; preds = %251, %239
  %252 = phi i32 [ 8, %239 ], [ %254, %251 ]
  %253 = icmp slt i32 %252, %250
  %254 = shl i32 %252, 1
  br i1 %253, label %251, label %255, !llvm.loop !54

255:                                              ; preds = %251
  %256 = icmp slt i32 %252, 65
  br i1 %256, label %260, label %257

257:                                              ; preds = %255
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([104 x i8], [104 x i8]* @.str.2.10, i64 0, i64 0)) #16
  call void @abort() #16
  %258 = load i8*, i8** %245, align 8, !tbaa !51
  %259 = load i8*, i8** %247, align 8, !tbaa !52
  br label %260

260:                                              ; preds = %257, %255
  %261 = phi i8* [ %259, %257 ], [ %246, %255 ]
  %262 = phi i8* [ %258, %257 ], [ %240, %255 ]
  %263 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 5
  %264 = load i32, i32* %263, align 4, !tbaa !47
  %265 = icmp slt i32 %264, 2
  %266 = zext i32 %264 to i64
  %267 = getelementptr inbounds [11 x i8*], [11 x i8*]* @__const.halide_default_trace.event_types, i64 0, i64 %266
  %268 = load i8*, i8** %267, align 8, !tbaa !12
  %269 = call i8* @halide_string_to_string(i8* %262, i8* %261, i8* nonnull %268) #16
  store i8* %269, i8** %245, align 8, !tbaa !51
  %270 = load i8*, i8** %247, align 8, !tbaa !52
  %271 = call i8* @halide_string_to_string(i8* %269, i8* %270, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0)) #16
  store i8* %271, i8** %245, align 8, !tbaa !51
  %272 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 0
  %273 = load i8*, i8** %272, align 8, !tbaa !30
  %274 = icmp eq i8* %273, null
  %275 = load i8*, i8** %247, align 8, !tbaa !52
  br i1 %274, label %276, label %278

276:                                              ; preds = %260
  %277 = call i8* @halide_string_to_string(i8* %271, i8* %275, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %280

278:                                              ; preds = %260
  %279 = call i8* @halide_string_to_string(i8* %271, i8* %275, i8* nonnull %273) #16
  br label %280

280:                                              ; preds = %278, %276
  %281 = phi i8* [ %279, %278 ], [ %277, %276 ]
  store i8* %281, i8** %245, align 8, !tbaa !51
  %282 = load i8*, i8** %247, align 8, !tbaa !52
  %283 = call i8* @halide_string_to_string(i8* %281, i8* %282, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #16
  store i8* %283, i8** %245, align 8, !tbaa !51
  %284 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 7
  %285 = load i32, i32* %284, align 4, !tbaa !55
  %286 = load i8*, i8** %247, align 8, !tbaa !52
  %287 = sext i32 %285 to i64
  %288 = call i8* @halide_int64_to_string(i8* %283, i8* %286, i64 %287, i32 1) #16
  store i8* %288, i8** %245, align 8, !tbaa !51
  %289 = load i8*, i8** %247, align 8, !tbaa !52
  %290 = call i8* @halide_string_to_string(i8* %288, i8* %289, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i64 0, i64 0)) #16
  store i8* %290, i8** %245, align 8, !tbaa !51
  %291 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 2
  %292 = load i16, i16* %291, align 2, !tbaa !22
  %293 = icmp ugt i16 %292, 1
  br i1 %293, label %294, label %297

294:                                              ; preds = %280
  %295 = load i8*, i8** %247, align 8, !tbaa !52
  %296 = call i8* @halide_string_to_string(i8* %290, i8* %295, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0)) #16
  store i8* %296, i8** %245, align 8, !tbaa !51
  br label %297

297:                                              ; preds = %294, %280
  %298 = phi i8* [ %296, %294 ], [ %290, %280 ]
  %299 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 8
  %300 = load i32, i32* %299, align 8, !tbaa !29
  %301 = icmp sgt i32 %300, 0
  br i1 %301, label %302, label %.loopexit26

302:                                              ; preds = %297
  %303 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 2
  %304 = load i32*, i32** %303, align 8, !tbaa !42
  %305 = load i32, i32* %304, align 4, !tbaa !16
  %306 = load i8*, i8** %247, align 8, !tbaa !52
  %307 = sext i32 %305 to i64
  %308 = call i8* @halide_int64_to_string(i8* %298, i8* %306, i64 %307, i32 1) #16
  store i8* %308, i8** %245, align 8, !tbaa !51
  %309 = load i32, i32* %299, align 8, !tbaa !29
  %310 = icmp sgt i32 %309, 1
  br i1 %310, label %.preheader25, label %.loopexit26

.loopexit26:                                      ; preds = %327, %302, %297
  %311 = phi i8* [ %298, %297 ], [ %308, %302 ], [ %336, %327 ]
  %312 = load i16, i16* %291, align 2, !tbaa !22
  %313 = icmp ugt i16 %312, 1
  %314 = load i8*, i8** %247, align 8, !tbaa !52
  %315 = select i1 %313, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)
  %316 = call i8* @halide_string_to_string(i8* %311, i8* %314, i8* nonnull %315) #16
  store i8* %316, i8** %245, align 8, !tbaa !51
  br i1 %265, label %341, label %.loopexit41.thread

.preheader25:                                     ; preds = %302, %327
  %317 = phi i8* [ %336, %327 ], [ %308, %302 ]
  %318 = phi i64 [ %337, %327 ], [ 1, %302 ]
  %319 = load i16, i16* %291, align 2, !tbaa !22
  %320 = icmp ugt i16 %319, 1
  br i1 %320, label %321, label %326

321:                                              ; preds = %.preheader25
  %322 = zext i16 %319 to i32
  %323 = trunc i64 %318 to i32
  %324 = urem i32 %323, %322
  %325 = icmp eq i32 %324, 0
  br i1 %325, label %327, label %326

326:                                              ; preds = %321, %.preheader25
  br label %327

327:                                              ; preds = %326, %321
  %328 = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0), %326 ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i64 0, i64 0), %321 ]
  %329 = load i8*, i8** %247, align 8, !tbaa !52
  %330 = call i8* @halide_string_to_string(i8* %317, i8* %329, i8* nonnull %328) #16
  store i8* %330, i8** %245, align 8, !tbaa !51
  %331 = load i32*, i32** %303, align 8, !tbaa !42
  %332 = getelementptr inbounds i32, i32* %331, i64 %318
  %333 = load i32, i32* %332, align 4, !tbaa !16
  %334 = load i8*, i8** %247, align 8, !tbaa !52
  %335 = sext i32 %333 to i64
  %336 = call i8* @halide_int64_to_string(i8* %330, i8* %334, i64 %335, i32 1) #16
  store i8* %336, i8** %245, align 8, !tbaa !51
  %337 = add nuw nsw i64 %318, 1
  %338 = load i32, i32* %299, align 8, !tbaa !29
  %339 = sext i32 %338 to i64
  %340 = icmp slt i64 %337, %339
  br i1 %340, label %.preheader25, label %.loopexit26, !llvm.loop !56

341:                                              ; preds = %.loopexit26
  %342 = load i16, i16* %291, align 2, !tbaa !22
  %343 = icmp ugt i16 %342, 1
  %344 = load i8*, i8** %247, align 8, !tbaa !52
  %345 = select i1 %343, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0)
  %346 = call i8* @halide_string_to_string(i8* %316, i8* %344, i8* nonnull %345) #16
  store i8* %346, i8** %245, align 8, !tbaa !51
  %347 = load i16, i16* %291, align 2, !tbaa !22
  %348 = icmp eq i16 %347, 0
  br i1 %348, label %.loopexit41.thread, label %349

349:                                              ; preds = %341
  %350 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 0
  %351 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 1
  %352 = bitcast i8** %351 to i8***
  %353 = icmp sgt i32 %252, 15
  %354 = bitcast i8** %351 to i16**
  %355 = bitcast i8** %351 to float**
  %356 = bitcast i8** %351 to double**
  %357 = bitcast i8** %351 to i32**
  %358 = bitcast i8** %351 to i64**
  %.pre = load i8, i8* %350, align 8, !tbaa !58
  switch i8 %.pre, label %437 [
    i8 0, label %411
    i8 1, label %387
    i8 2, label %364
    i8 3, label %359
  ]

359:                                              ; preds = %349
  %360 = load i8**, i8*** %352, align 8, !tbaa !43
  %361 = load i8*, i8** %360, align 8, !tbaa !12
  %362 = load i8*, i8** %247, align 8, !tbaa !52
  %363 = call i8* @halide_pointer_to_string(i8* %346, i8* %362, i8* %361) #16
  br label %435

364:                                              ; preds = %349
  br i1 %353, label %366, label %365

365:                                              ; preds = %364
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @.str.24, i64 0, i64 0)) #16
  call void @abort() #16
  br label %366

366:                                              ; preds = %365, %364
  switch i32 %252, label %381 [
    i32 32, label %374
    i32 16, label %367
  ]

367:                                              ; preds = %366
  %368 = load i16*, i16** %354, align 8, !tbaa !43
  %369 = load i16, i16* %368, align 2, !tbaa !59
  %370 = call double @halide_float16_bits_to_double(i16 zeroext %369) #16
  %371 = load i8*, i8** %245, align 8, !tbaa !51
  %372 = load i8*, i8** %247, align 8, !tbaa !52
  %373 = call i8* @halide_double_to_string(i8* %371, i8* %372, double %370, i32 1) #16
  br label %435

374:                                              ; preds = %366
  %375 = load float*, float** %355, align 8, !tbaa !43
  %376 = load float, float* %375, align 4, !tbaa !60
  %377 = load i8*, i8** %245, align 8, !tbaa !51
  %378 = load i8*, i8** %247, align 8, !tbaa !52
  %379 = fpext float %376 to double
  %380 = call i8* @halide_double_to_string(i8* %377, i8* %378, double %379, i32 0) #16
  br label %435

381:                                              ; preds = %366
  %382 = load double*, double** %356, align 8, !tbaa !43
  %383 = load double, double* %382, align 8, !tbaa !62
  %384 = load i8*, i8** %245, align 8, !tbaa !51
  %385 = load i8*, i8** %247, align 8, !tbaa !52
  %386 = call i8* @halide_double_to_string(i8* %384, i8* %385, double %383, i32 1) #16
  br label %435

387:                                              ; preds = %349
  switch i32 %252, label %406 [
    i32 8, label %400
    i32 16, label %394
    i32 32, label %388
  ]

388:                                              ; preds = %387
  %389 = load i32*, i32** %357, align 8, !tbaa !43
  %390 = load i32, i32* %389, align 4, !tbaa !16
  %391 = load i8*, i8** %247, align 8, !tbaa !52
  %392 = zext i32 %390 to i64
  %393 = call i8* @halide_uint64_to_string(i8* %346, i8* %391, i64 %392, i32 1) #16
  br label %435

394:                                              ; preds = %387
  %395 = load i16*, i16** %354, align 8, !tbaa !43
  %396 = load i16, i16* %395, align 2, !tbaa !59
  %397 = load i8*, i8** %247, align 8, !tbaa !52
  %398 = zext i16 %396 to i64
  %399 = call i8* @halide_int64_to_string(i8* %346, i8* %397, i64 %398, i32 1) #16
  br label %435

400:                                              ; preds = %387
  %401 = load i8*, i8** %351, align 8, !tbaa !43
  %402 = load i8, i8* %401, align 1, !tbaa !38
  %403 = load i8*, i8** %247, align 8, !tbaa !52
  %404 = zext i8 %402 to i64
  %405 = call i8* @halide_int64_to_string(i8* %346, i8* %403, i64 %404, i32 1) #16
  br label %435

406:                                              ; preds = %387
  %407 = load i64*, i64** %358, align 8, !tbaa !43
  %408 = load i64, i64* %407, align 8, !tbaa !64
  %409 = load i8*, i8** %247, align 8, !tbaa !52
  %410 = call i8* @halide_uint64_to_string(i8* %346, i8* %409, i64 %408, i32 1) #16
  br label %435

411:                                              ; preds = %349
  switch i32 %252, label %430 [
    i32 8, label %424
    i32 16, label %418
    i32 32, label %412
  ]

412:                                              ; preds = %411
  %413 = load i32*, i32** %357, align 8, !tbaa !43
  %414 = load i32, i32* %413, align 4, !tbaa !16
  %415 = load i8*, i8** %247, align 8, !tbaa !52
  %416 = sext i32 %414 to i64
  %417 = call i8* @halide_int64_to_string(i8* %346, i8* %415, i64 %416, i32 1) #16
  br label %435

418:                                              ; preds = %411
  %419 = load i16*, i16** %354, align 8, !tbaa !43
  %420 = load i16, i16* %419, align 2, !tbaa !59
  %421 = load i8*, i8** %247, align 8, !tbaa !52
  %422 = sext i16 %420 to i64
  %423 = call i8* @halide_int64_to_string(i8* %346, i8* %421, i64 %422, i32 1) #16
  br label %435

424:                                              ; preds = %411
  %425 = load i8*, i8** %351, align 8, !tbaa !43
  %426 = load i8, i8* %425, align 1, !tbaa !38
  %427 = load i8*, i8** %247, align 8, !tbaa !52
  %428 = sext i8 %426 to i64
  %429 = call i8* @halide_int64_to_string(i8* %346, i8* %427, i64 %428, i32 1) #16
  br label %435

430:                                              ; preds = %411
  %431 = load i64*, i64** %358, align 8, !tbaa !43
  %432 = load i64, i64* %431, align 8, !tbaa !64
  %433 = load i8*, i8** %247, align 8, !tbaa !52
  %434 = call i8* @halide_int64_to_string(i8* %346, i8* %433, i64 %432, i32 1) #16
  br label %435

435:                                              ; preds = %430, %424, %418, %412, %406, %400, %394, %388, %381, %374, %367, %359
  %436 = phi i8* [ %423, %418 ], [ %434, %430 ], [ %417, %412 ], [ %429, %424 ], [ %373, %367 ], [ %386, %381 ], [ %380, %374 ], [ %363, %359 ], [ %405, %400 ], [ %393, %388 ], [ %410, %406 ], [ %399, %394 ]
  store i8* %436, i8** %245, align 8, !tbaa !51
  %.pre42 = load i16, i16* %291, align 2, !tbaa !22
  br label %437

437:                                              ; preds = %435, %349
  %438 = phi i16 [ %347, %349 ], [ %.pre42, %435 ]
  %439 = phi i8* [ %346, %349 ], [ %436, %435 ]
  %440 = icmp ugt i16 %438, 1
  br i1 %440, label %.peel.next, label %.loopexit41.thread

.loopexit41:                                      ; preds = %537
  %441 = icmp ugt i16 %540, 1
  br i1 %441, label %543, label %.loopexit41.thread

.peel.next:                                       ; preds = %437, %537
  %442 = phi i8* [ %538, %537 ], [ %439, %437 ]
  %443 = phi i64 [ %539, %537 ], [ 1, %437 ]
  %444 = load i8*, i8** %247, align 8, !tbaa !52
  %445 = call i8* @halide_string_to_string(i8* %442, i8* %444, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  store i8* %445, i8** %245, align 8, !tbaa !51
  %446 = load i8, i8* %350, align 8, !tbaa !58
  switch i8 %446, label %537 [
    i8 0, label %447
    i8 1, label %475
    i8 2, label %503
    i8 3, label %529
  ]

447:                                              ; preds = %.peel.next
  switch i32 %252, label %469 [
    i32 8, label %448
    i32 16, label %455
    i32 32, label %462
  ]

448:                                              ; preds = %447
  %449 = load i8*, i8** %351, align 8, !tbaa !43
  %450 = getelementptr inbounds i8, i8* %449, i64 %443
  %451 = load i8, i8* %450, align 1, !tbaa !38
  %452 = load i8*, i8** %247, align 8, !tbaa !52
  %453 = sext i8 %451 to i64
  %454 = call i8* @halide_int64_to_string(i8* %445, i8* %452, i64 %453, i32 1) #16
  br label %535

455:                                              ; preds = %447
  %456 = load i16*, i16** %354, align 8, !tbaa !43
  %457 = getelementptr inbounds i16, i16* %456, i64 %443
  %458 = load i16, i16* %457, align 2, !tbaa !59
  %459 = load i8*, i8** %247, align 8, !tbaa !52
  %460 = sext i16 %458 to i64
  %461 = call i8* @halide_int64_to_string(i8* %445, i8* %459, i64 %460, i32 1) #16
  br label %535

462:                                              ; preds = %447
  %463 = load i32*, i32** %357, align 8, !tbaa !43
  %464 = getelementptr inbounds i32, i32* %463, i64 %443
  %465 = load i32, i32* %464, align 4, !tbaa !16
  %466 = load i8*, i8** %247, align 8, !tbaa !52
  %467 = sext i32 %465 to i64
  %468 = call i8* @halide_int64_to_string(i8* %445, i8* %466, i64 %467, i32 1) #16
  br label %535

469:                                              ; preds = %447
  %470 = load i64*, i64** %358, align 8, !tbaa !43
  %471 = getelementptr inbounds i64, i64* %470, i64 %443
  %472 = load i64, i64* %471, align 8, !tbaa !64
  %473 = load i8*, i8** %247, align 8, !tbaa !52
  %474 = call i8* @halide_int64_to_string(i8* %445, i8* %473, i64 %472, i32 1) #16
  br label %535

475:                                              ; preds = %.peel.next
  switch i32 %252, label %497 [
    i32 8, label %476
    i32 16, label %483
    i32 32, label %490
  ]

476:                                              ; preds = %475
  %477 = load i8*, i8** %351, align 8, !tbaa !43
  %478 = getelementptr inbounds i8, i8* %477, i64 %443
  %479 = load i8, i8* %478, align 1, !tbaa !38
  %480 = load i8*, i8** %247, align 8, !tbaa !52
  %481 = zext i8 %479 to i64
  %482 = call i8* @halide_int64_to_string(i8* %445, i8* %480, i64 %481, i32 1) #16
  br label %535

483:                                              ; preds = %475
  %484 = load i16*, i16** %354, align 8, !tbaa !43
  %485 = getelementptr inbounds i16, i16* %484, i64 %443
  %486 = load i16, i16* %485, align 2, !tbaa !59
  %487 = load i8*, i8** %247, align 8, !tbaa !52
  %488 = zext i16 %486 to i64
  %489 = call i8* @halide_int64_to_string(i8* %445, i8* %487, i64 %488, i32 1) #16
  br label %535

490:                                              ; preds = %475
  %491 = load i32*, i32** %357, align 8, !tbaa !43
  %492 = getelementptr inbounds i32, i32* %491, i64 %443
  %493 = load i32, i32* %492, align 4, !tbaa !16
  %494 = load i8*, i8** %247, align 8, !tbaa !52
  %495 = zext i32 %493 to i64
  %496 = call i8* @halide_uint64_to_string(i8* %445, i8* %494, i64 %495, i32 1) #16
  br label %535

497:                                              ; preds = %475
  %498 = load i64*, i64** %358, align 8, !tbaa !43
  %499 = getelementptr inbounds i64, i64* %498, i64 %443
  %500 = load i64, i64* %499, align 8, !tbaa !64
  %501 = load i8*, i8** %247, align 8, !tbaa !52
  %502 = call i8* @halide_uint64_to_string(i8* %445, i8* %501, i64 %500, i32 1) #16
  br label %535

503:                                              ; preds = %.peel.next
  br i1 %353, label %505, label %504

504:                                              ; preds = %503
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @.str.24, i64 0, i64 0)) #16
  call void @abort() #16
  br label %505

505:                                              ; preds = %504, %503
  switch i32 %252, label %522 [
    i32 32, label %506
    i32 16, label %514
  ]

506:                                              ; preds = %505
  %507 = load float*, float** %355, align 8, !tbaa !43
  %508 = getelementptr inbounds float, float* %507, i64 %443
  %509 = load float, float* %508, align 4, !tbaa !60
  %510 = load i8*, i8** %245, align 8, !tbaa !51
  %511 = load i8*, i8** %247, align 8, !tbaa !52
  %512 = fpext float %509 to double
  %513 = call i8* @halide_double_to_string(i8* %510, i8* %511, double %512, i32 0) #16
  br label %535

514:                                              ; preds = %505
  %515 = load i16*, i16** %354, align 8, !tbaa !43
  %516 = getelementptr inbounds i16, i16* %515, i64 %443
  %517 = load i16, i16* %516, align 2, !tbaa !59
  %518 = call double @halide_float16_bits_to_double(i16 zeroext %517) #16
  %519 = load i8*, i8** %245, align 8, !tbaa !51
  %520 = load i8*, i8** %247, align 8, !tbaa !52
  %521 = call i8* @halide_double_to_string(i8* %519, i8* %520, double %518, i32 1) #16
  br label %535

522:                                              ; preds = %505
  %523 = load double*, double** %356, align 8, !tbaa !43
  %524 = getelementptr inbounds double, double* %523, i64 %443
  %525 = load double, double* %524, align 8, !tbaa !62
  %526 = load i8*, i8** %245, align 8, !tbaa !51
  %527 = load i8*, i8** %247, align 8, !tbaa !52
  %528 = call i8* @halide_double_to_string(i8* %526, i8* %527, double %525, i32 1) #16
  br label %535

529:                                              ; preds = %.peel.next
  %530 = load i8**, i8*** %352, align 8, !tbaa !43
  %531 = getelementptr inbounds i8*, i8** %530, i64 %443
  %532 = load i8*, i8** %531, align 8, !tbaa !12
  %533 = load i8*, i8** %247, align 8, !tbaa !52
  %534 = call i8* @halide_pointer_to_string(i8* %445, i8* %533, i8* %532) #16
  br label %535

535:                                              ; preds = %529, %522, %514, %506, %497, %490, %483, %476, %469, %462, %455, %448
  %536 = phi i8* [ %461, %455 ], [ %474, %469 ], [ %468, %462 ], [ %454, %448 ], [ %521, %514 ], [ %528, %522 ], [ %513, %506 ], [ %534, %529 ], [ %482, %476 ], [ %496, %490 ], [ %502, %497 ], [ %489, %483 ]
  store i8* %536, i8** %245, align 8, !tbaa !51
  br label %537

537:                                              ; preds = %535, %.peel.next
  %538 = phi i8* [ %445, %.peel.next ], [ %536, %535 ]
  %539 = add nuw nsw i64 %443, 1
  %540 = load i16, i16* %291, align 2, !tbaa !22
  %541 = zext i16 %540 to i64
  %542 = icmp ult i64 %539, %541
  br i1 %542, label %.peel.next, label %.loopexit41, !llvm.loop !66

543:                                              ; preds = %.loopexit41
  %544 = load i8*, i8** %247, align 8, !tbaa !52
  %545 = call i8* @halide_string_to_string(i8* %538, i8* %544, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i64 0, i64 0)) #16
  store i8* %545, i8** %245, align 8, !tbaa !51
  br label %.loopexit41.thread

.loopexit41.thread:                               ; preds = %437, %543, %.loopexit41, %341, %.loopexit26
  %546 = phi i8* [ %538, %.loopexit41 ], [ %545, %543 ], [ %316, %.loopexit26 ], [ %346, %341 ], [ %439, %437 ]
  %547 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 3
  %548 = load i8*, i8** %547, align 8, !tbaa !31
  %549 = icmp eq i8* %548, null
  br i1 %549, label %567, label %550

550:                                              ; preds = %.loopexit41.thread
  %551 = load i8, i8* %548, align 1, !tbaa !38
  %552 = icmp eq i8 %551, 0
  br i1 %552, label %567, label %553

553:                                              ; preds = %550
  %554 = load i8*, i8** %247, align 8, !tbaa !52
  %555 = call i8* @halide_string_to_string(i8* %546, i8* %554, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i64 0, i64 0)) #16
  store i8* %555, i8** %245, align 8, !tbaa !51
  %556 = load i8*, i8** %547, align 8, !tbaa !31
  %557 = icmp eq i8* %556, null
  %558 = load i8*, i8** %247, align 8, !tbaa !52
  br i1 %557, label %559, label %561

559:                                              ; preds = %553
  %560 = call i8* @halide_string_to_string(i8* %555, i8* %558, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %563

561:                                              ; preds = %553
  %562 = call i8* @halide_string_to_string(i8* %555, i8* %558, i8* nonnull %556) #16
  br label %563

563:                                              ; preds = %561, %559
  %564 = phi i8* [ %562, %561 ], [ %560, %559 ]
  store i8* %564, i8** %245, align 8, !tbaa !51
  %565 = load i8*, i8** %247, align 8, !tbaa !52
  %566 = call i8* @halide_string_to_string(i8* %564, i8* %565, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i64 0, i64 0)) #16
  store i8* %566, i8** %245, align 8, !tbaa !51
  br label %567

567:                                              ; preds = %563, %550, %.loopexit41.thread
  %568 = phi i8* [ %566, %563 ], [ %546, %550 ], [ %546, %.loopexit41.thread ]
  %569 = load i8*, i8** %247, align 8, !tbaa !52
  %570 = call i8* @halide_string_to_string(i8* %568, i8* %569, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)) #16
  store i8* %570, i8** %245, align 8, !tbaa !51
  %571 = load i8*, i8** %244, align 8, !tbaa !67
  %572 = load i8*, i8** %242, align 8, !tbaa !48
  %573 = ptrtoint i8* %570 to i64
  %574 = ptrtoint i8* %571 to i64
  %575 = add i64 %573, 1
  %576 = sub i64 %575, %574
  %577 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %572, i8* %571, i64 %576) #16
  br label %578

578:                                              ; preds = %578, %567
  %579 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i8 1 acquire
  %580 = icmp eq i8 %579, 0
  br i1 %580, label %581, label %578, !llvm.loop !68

581:                                              ; preds = %578
  call void @halide_print(i8* %0, i8* nonnull %240) #16
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 1
  %582 = load i8*, i8** %244, align 8, !tbaa !67
  %583 = icmp eq i8* %582, null
  br i1 %583, label %584, label %586

584:                                              ; preds = %581
  %585 = load i8*, i8** %242, align 8, !tbaa !48
  call void @halide_error(i8* %585, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %594

586:                                              ; preds = %581
  %587 = load i8*, i8** %245, align 8, !tbaa !51
  %588 = load i8*, i8** %242, align 8, !tbaa !48
  %589 = ptrtoint i8* %587 to i64
  %590 = ptrtoint i8* %582 to i64
  %591 = sub i64 1, %590
  %592 = add i64 %591, %589
  %593 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %588, i8* nonnull %582, i64 %592) #16
  br label %594

594:                                              ; preds = %586, %584
  %595 = load i8, i8* %243, align 8, !tbaa !50, !range !21
  %596 = icmp eq i8 %595, 0
  br i1 %596, label %602, label %597

597:                                              ; preds = %594
  %598 = load i8*, i8** %244, align 8, !tbaa !67
  %599 = getelementptr inbounds %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0", %"class.Halide::Runtime::Internal::(anonymous namespace)::Printer.0"* %4, i64 0, i32 5, i64 0
  %600 = icmp eq i8* %598, %599
  br i1 %600, label %602, label %601

601:                                              ; preds = %597
  call void @free(i8* %598) #16
  br label %602

602:                                              ; preds = %601, %597, %594
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %241) #18
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %240) #18
  br label %603

603:                                              ; preds = %602, %237, %236, %226, %204
  ret i32 %5
}

; Function Attrs: nounwind
define weak i32 @halide_get_trace_file(i8* %0) local_unnamed_addr #4 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = atomicrmw volatile xchg i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i8 1 acquire
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %2, !llvm.loop !68

5:                                                ; preds = %2
  %6 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %27

8:                                                ; preds = %5
  %9 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.28, i64 0, i64 0)) #16
  %10 = icmp eq i8* %9, null
  br i1 %10, label %26, label %11

11:                                               ; preds = %8
  %12 = tail call i8* @fopen(i8* nonnull %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i64 0, i64 0)) #16
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @.str.30, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %15

15:                                               ; preds = %14, %11
  %16 = tail call i32 @fileno(i8* %12) #16
  tail call void @halide_set_trace_file(i32 %16) #17
  store i8* %12, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !12
  %17 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %18 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %17, null
  br i1 %18, label %19, label %27

19:                                               ; preds = %15
  %20 = tail call i8* @malloc(i64 1048588) #16
  store i8* %20, i8** bitcast (%"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE to i8**), align 8, !tbaa !12
  %21 = getelementptr inbounds i8, i8* %20, i64 4
  %22 = bitcast i8* %21 to i32*
  store i32 0, i32* %22, align 4, !tbaa !34
  %23 = getelementptr inbounds i8, i8* %20, i64 8
  %24 = bitcast i8* %23 to i32*
  store i32 0, i32* %24, align 4, !tbaa !36
  %25 = bitcast i8* %20 to i32*
  store volatile i32 0, i32* %25, align 4, !tbaa !32
  br label %27

26:                                               ; preds = %8
  tail call void @halide_set_trace_file(i32 0) #17
  br label %27

27:                                               ; preds = %26, %19, %15, %5
  %28 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  store atomic volatile i8 0, i8* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 1
  ret i32 %28
}

declare i64 @strlen(i8*) local_unnamed_addr #1

declare i64 @write(i32, i8*, i64) local_unnamed_addr #1

declare void @halide_print(i8*, i8*) local_unnamed_addr #1

declare void @abort() local_unnamed_addr #1

declare i8* @malloc(i64) local_unnamed_addr #1

declare void @free(i8*) local_unnamed_addr #1

declare i8* @fopen(i8*, i8*) local_unnamed_addr #1

declare i32 @fileno(i8*) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_set_trace_file(i32 %0) local_unnamed_addr #2 {
  store i32 %0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_trace_cleanup() #0 {
  %1 = tail call i32 @halide_shutdown_trace() #17
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_shutdown_trace() local_unnamed_addr #0 {
  %1 = load i8*, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !12
  %2 = icmp eq i8* %1, null
  br i1 %2, label %9, label %3

3:                                                ; preds = %0
  %4 = tail call i32 @fclose(i8* nonnull %1) #16
  store i32 0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !16
  store i8 0, i8* @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, align 1, !tbaa !18
  store i8* null, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !12
  %5 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !12
  %6 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  %8 = bitcast %"class.Halide::Runtime::Internal::TraceBuffer"* %5 to i8*
  tail call void @free(i8* nonnull %8) #16
  br label %9

9:                                                ; preds = %7, %3, %0
  %10 = phi i32 [ %4, %7 ], [ %4, %3 ], [ 0, %0 ]
  ret i32 %10
}

declare i32 @fclose(i8*) local_unnamed_addr #1

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i8*, %struct.halide_trace_event_t*)* @halide_set_custom_trace(i32 (i8*, %struct.halide_trace_event_t*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !12
  store i32 (i8*, %struct.halide_trace_event_t*)* %0, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !12
  ret i32 (i8*, %struct.halide_trace_event_t*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_trace(i8* %0, %struct.halide_trace_event_t* %1) local_unnamed_addr #0 {
  %3 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !12
  %4 = tail call i32 %3(i8* %0, %struct.halide_trace_event_t* %1) #16
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_trace_helper(i8* %0, i8* %1, i8* %2, i32* %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i8* %11) local_unnamed_addr #4 {
  %13 = alloca %struct.halide_trace_event_t, align 8
  %14 = bitcast %struct.halide_trace_event_t* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %14) #18
  %15 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 0
  %16 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 1
  %17 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 2
  %18 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 0
  store i8* %1, i8** %18, align 8, !tbaa !30
  %19 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 1
  store i8* %2, i8** %19, align 8, !tbaa !43
  %20 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 2
  store i32* %3, i32** %20, align 8, !tbaa !42
  %21 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 3
  store i8* %11, i8** %21, align 8, !tbaa !31
  %22 = trunc i32 %4 to i8
  store i8 %22, i8* %15, align 8, !tbaa !58
  %23 = trunc i32 %5 to i8
  store i8 %23, i8* %16, align 1, !tbaa !53
  %24 = trunc i32 %6 to i16
  store i16 %24, i16* %17, align 2, !tbaa !22
  %25 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 5
  store i32 %7, i32* %25, align 4, !tbaa !47
  %26 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 6
  store i32 %8, i32* %26, align 8, !tbaa !69
  %27 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 7
  store i32 %9, i32* %27, align 4, !tbaa !55
  %28 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 8
  store i32 %10, i32* %28, align 8, !tbaa !29
  %29 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 56) #16
  %30 = add nsw i32 %5, 7
  %31 = sdiv i32 %30, 8
  %32 = mul nsw i32 %31, %6
  %33 = sext i32 %32 to i64
  %34 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %2, i64 %33) #16
  %35 = bitcast i32* %3 to i8*
  %36 = sext i32 %10 to i64
  %37 = shl nsw i64 %36, 2
  %38 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %35, i64 %37) #16
  %39 = call i32 @halide_trace(i8* %0, %struct.halide_trace_event_t* nonnull %13) #16
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %14) #18
  ret i32 %39
}

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %0, i8* %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i8* [ %0, %2 ], [ %7, %3 ]
  %5 = load i8, i8* %4, align 1, !tbaa !38
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds i8, i8* %4, i64 1
  br i1 %6, label %.preheader5, label %3, !llvm.loop !70

.preheader5:                                      ; preds = %3, %.preheader5
  %8 = phi i8* [ %11, %.preheader5 ], [ %1, %3 ]
  %9 = load i8, i8* %8, align 1, !tbaa !38
  %10 = icmp eq i8 %9, 0
  %11 = getelementptr inbounds i8, i8* %8, i64 1
  br i1 %10, label %12, label %.preheader5, !llvm.loop !71

12:                                               ; preds = %.preheader5
  %13 = icmp ne i8* %8, %1
  %14 = icmp ne i8* %4, %0
  %15 = and i1 %14, %13
  br i1 %15, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %12, %25
  %16 = phi i8* [ %18, %25 ], [ %4, %12 ]
  %17 = phi i8* [ %19, %25 ], [ %8, %12 ]
  %18 = getelementptr inbounds i8, i8* %16, i64 -1
  %19 = getelementptr inbounds i8, i8* %17, i64 -1
  %20 = icmp ne i8* %19, %1
  %21 = icmp ne i8* %18, %0
  %22 = and i1 %21, %20
  %23 = load i8, i8* %18, align 1, !tbaa !38
  %24 = load i8, i8* %19, align 1, !tbaa !38
  br i1 %22, label %25, label %.loopexit, !llvm.loop !72

25:                                               ; preds = %.preheader
  %26 = icmp eq i8 %23, %24
  br i1 %26, label %.preheader, label %.loopexit4

.loopexit:                                        ; preds = %.preheader, %12
  %27 = phi i8 [ 0, %12 ], [ %24, %.preheader ]
  %28 = phi i8 [ 0, %12 ], [ %23, %.preheader ]
  %29 = icmp eq i8 %28, %27
  br label %.loopexit4

.loopexit4:                                       ; preds = %25, %.loopexit
  %30 = phi i1 [ %29, %.loopexit ], [ false, %25 ]
  ret i1 %30
}

; Function Attrs: nounwind
define weak i32 @halide_debug_to_file(i8* %0, i8* %1, i32 %2, %struct.halide_buffer_t* %3) local_unnamed_addr #4 {
  %5 = alloca [4 x %struct.halide_dimension_t], align 4
  %6 = alloca %"struct.Halide::Runtime::Internal::halide_tiff_header", align 2
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [256 x i8], align 1
  %10 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  %11 = alloca [129 x i8], align 1
  %12 = alloca [8 x i32], align 4
  %13 = alloca [4 x i32], align 4
  %14 = alloca [2 x i32], align 4
  %15 = alloca [2 x i32], align 4
  %16 = alloca [5 x i32], align 4
  %17 = alloca [4096 x i8], align 1
  %18 = alloca [4 x i32], align 4
  %19 = alloca i64, align 8
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %21 = load i8*, i8** %20, align 8, !tbaa !73
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %28

23:                                               ; preds = %4
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %25 = load i64, i64* %24, align 8, !tbaa !75
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.35, i64 0, i64 0)) #16
  br label %925

28:                                               ; preds = %23, %4
  %29 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 5
  %30 = load i32, i32* %29, align 4, !tbaa !76
  %31 = icmp sgt i32 %30, 4
  br i1 %31, label %32, label %33

32:                                               ; preds = %28
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.1.36, i64 0, i64 0)) #16
  br label %925

33:                                               ; preds = %28
  %34 = tail call i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* nonnull %3) #16
  %35 = tail call i8* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2.37, i64 0, i64 0)) #16
  %36 = icmp eq i8* %35, null
  br i1 %36, label %925, label %37

37:                                               ; preds = %33
  %38 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %38) #18
  %39 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0, i32 0
  %40 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0, i32 1
  %41 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1, i32 0
  %42 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1, i32 1
  %43 = bitcast [4 x %struct.halide_dimension_t]* %5 to <8 x i32>*
  store <8 x i32> zeroinitializer, <8 x i32>* %43, align 4, !tbaa !16
  %44 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2, i32 0
  %45 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2, i32 1
  %46 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3, i32 0
  %47 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3, i32 1
  %48 = bitcast i32* %44 to <8 x i32>*
  store <8 x i32> zeroinitializer, <8 x i32>* %48, align 4, !tbaa !16
  %49 = load i32, i32* %29, align 4, !tbaa !76
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %51, label %65

51:                                               ; preds = %37
  %52 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %53 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %52, align 8, !tbaa !77
  %54 = zext i32 %49 to i64
  %55 = add nsw i64 %54, -1
  %56 = icmp ult i64 %55, 3
  %57 = select i1 %56, i64 %54, i64 4
  %58 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  %59 = bitcast %struct.halide_dimension_t* %53 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %58, i8* nonnull align 4 dereferenceable(16) %59, i64 16, i1 false), !tbaa.struct !78
  %60 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0, i32 1
  %61 = load i32, i32* %60, align 4, !tbaa !79
  %62 = zext i32 %61 to i64
  %exitcond.not = icmp eq i64 %57, 1
  br i1 %exitcond.not, label %63, label %927, !llvm.loop !81

63:                                               ; preds = %945, %936, %927, %51
  %.lcssa293 = phi i64 [ %62, %51 ], [ %935, %927 ], [ %944, %936 ], [ %953, %945 ]
  %64 = icmp slt i32 %49, 4
  br i1 %64, label %65, label %.loopexit32

65:                                               ; preds = %63, %37
  %66 = phi i64 [ %.lcssa293, %63 ], [ 1, %37 ]
  %67 = sext i32 %49 to i64
  %68 = sub i32 3, %49
  %69 = zext i32 %68 to i64
  %70 = add nuw nsw i64 %69, 1
  %min.iters.check = icmp ult i32 %68, 7
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %65
  %n.vec = and i64 %70, 8589934584
  %ind.end = add nsw i64 %n.vec, %67
  %.splatinsert = insertelement <8 x i64> poison, i64 %67, i32 0
  %.splat = shufflevector <8 x i64> %.splatinsert, <8 x i64> poison, <8 x i32> zeroinitializer
  %induction = add <8 x i64> %.splat, <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7>
  %71 = add nsw i64 %n.vec, -8
  %72 = lshr exact i64 %71, 3
  %73 = add nuw nsw i64 %72, 1
  %xtraiter = and i64 %73, 3
  %74 = icmp ult i64 %71, 24
  br i1 %74, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %73, 4611686018427387900
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %vec.ind = phi <8 x i64> [ %induction, %vector.ph.new ], [ %vec.ind.next.3, %vector.body ]
  %niter = phi i64 [ %unroll_iter, %vector.ph.new ], [ %niter.nsub.3, %vector.body ]
  %75 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %75, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !82
  %76 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %76, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !79
  %77 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %77, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !83
  %vec.ind.next = add <8 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8>
  %78 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %78, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !82
  %79 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %79, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !79
  %80 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %80, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !83
  %vec.ind.next.1 = add <8 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16, i64 16>
  %81 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next.1, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %81, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !82
  %82 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next.1, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %82, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !79
  %83 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next.1, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %83, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !83
  %vec.ind.next.2 = add <8 x i64> %vec.ind, <i64 24, i64 24, i64 24, i64 24, i64 24, i64 24, i64 24, i64 24>
  %84 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next.2, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %84, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !82
  %85 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next.2, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %85, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !79
  %86 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.next.2, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %86, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !83
  %vec.ind.next.3 = add <8 x i64> %vec.ind, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !84

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %vec.ind.unr = phi <8 x i64> [ %induction, %vector.ph ], [ %vec.ind.next.3, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %vec.ind.epil = phi <8 x i64> [ %vec.ind.next.epil, %vector.body.epil ], [ %vec.ind.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %vector.body.epil ], [ %xtraiter, %middle.block.unr-lcssa ]
  %87 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.epil, i32 0
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %87, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !82
  %88 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.epil, i32 1
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32*> %88, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !79
  %89 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, <8 x i64> %vec.ind.epil, i32 2
  call void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32> zeroinitializer, <8 x i32*> %89, i32 4, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !83
  %vec.ind.next.epil = add <8 x i64> %vec.ind.epil, <i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8>
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %middle.block, label %vector.body.epil, !llvm.loop !86

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %70, %n.vec
  br i1 %cmp.n, label %.loopexit32, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %65, %middle.block
  %.ph292 = phi i64 [ %67, %65 ], [ %ind.end, %middle.block ]
  br label %scalar.ph

.loopexit32:                                      ; preds = %scalar.ph, %middle.block, %63
  %90 = phi i64 [ %.lcssa293, %63 ], [ %66, %middle.block ], [ %66, %scalar.ph ]
  %91 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4, i32 1
  %92 = load i8, i8* %91, align 1, !tbaa !28
  %93 = zext i8 %92 to i32
  %94 = add nuw nsw i32 %93, 7
  %95 = lshr i32 %94, 3
  %96 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3.38, i64 0, i64 0)) #17
  br i1 %96, label %106, label %104

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %97 = phi i64 [ %101, %scalar.ph ], [ %.ph292, %scalar.ph.preheader ]
  %98 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %97, i32 0
  store i32 0, i32* %98, align 4, !tbaa !82
  %99 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %97, i32 1
  store i32 1, i32* %99, align 4, !tbaa !79
  %100 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %97, i32 2
  store i32 0, i32* %100, align 4, !tbaa !83
  %101 = add nsw i64 %97, 1
  %102 = trunc i64 %101 to i32
  %103 = icmp eq i32 %102, 4
  br i1 %103, label %.loopexit32, label %scalar.ph, !llvm.loop !88

104:                                              ; preds = %.loopexit32
  %105 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.39, i64 0, i64 0)) #17
  br i1 %105, label %106, label %242

106:                                              ; preds = %104, %.loopexit32
  %107 = load i32, i32* %40, align 4, !tbaa !79
  %108 = load i32, i32* %42, align 4, !tbaa !79
  %109 = load i32, i32* %47, align 4, !tbaa !79
  %110 = icmp ult i32 %109, 2
  %111 = load i32, i32* %45, align 4, !tbaa !79
  %112 = icmp slt i32 %111, 5
  %113 = and i1 %110, %112
  %114 = select i1 %113, i32 1, i32 %111
  %115 = select i1 %113, i32 %111, i32 %109
  %116 = bitcast %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 210, i8* nonnull %116) #18
  %117 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 0
  store i16 18761, i16* %117, align 2, !tbaa !90
  %118 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 1
  store i16 42, i16* %118, align 2, !tbaa !92
  %119 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 2
  store i32 8, i32* %119, align 2, !tbaa !93
  %120 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 3
  store i16 15, i16* %120, align 2, !tbaa !94
  %121 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 0
  store i16 256, i16* %121, align 2, !tbaa !95
  %122 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 1
  store i16 4, i16* %122, align 2, !tbaa !97
  %123 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 2
  store i32 1, i32* %123, align 2, !tbaa !98
  %124 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 3, i32 0
  store i32 %107, i32* %124, align 2, !tbaa !38
  %125 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 0
  store i16 257, i16* %125, align 2, !tbaa !95
  %126 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 1
  store i16 4, i16* %126, align 2, !tbaa !97
  %127 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 2
  store i32 1, i32* %127, align 2, !tbaa !98
  %128 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 3, i32 0
  store i32 %108, i32* %128, align 2, !tbaa !38
  %129 = trunc i32 %94 to i16
  %130 = and i16 %129, 504
  %131 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 0
  store i16 258, i16* %131, align 2, !tbaa !95
  %132 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 1
  store i16 3, i16* %132, align 2, !tbaa !97
  %133 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 2
  store i32 1, i32* %133, align 2, !tbaa !98
  %134 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 3
  %135 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %134 to i16*
  store i16 %130, i16* %135, align 2, !tbaa !38
  %136 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 0
  store i16 259, i16* %136, align 2, !tbaa !95
  %137 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 1
  store i16 3, i16* %137, align 2, !tbaa !97
  %138 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 2
  store i32 1, i32* %138, align 2, !tbaa !98
  %139 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 3
  %140 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %139 to i16*
  store i16 1, i16* %140, align 2, !tbaa !38
  %141 = icmp sgt i32 %115, 2
  %142 = select i1 %141, i16 2, i16 1
  %143 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 0
  store i16 262, i16* %143, align 2, !tbaa !95
  %144 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 1
  store i16 3, i16* %144, align 2, !tbaa !97
  %145 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 2
  store i32 1, i32* %145, align 2, !tbaa !98
  %146 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 3
  %147 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %146 to i16*
  store i16 %142, i16* %147, align 2, !tbaa !38
  %148 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 0
  store i16 273, i16* %148, align 2, !tbaa !95
  %149 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 1
  store i16 4, i16* %149, align 2, !tbaa !97
  %150 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 2
  store i32 %115, i32* %150, align 2, !tbaa !98
  %151 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 3, i32 0
  store i32 210, i32* %151, align 2, !tbaa !38
  %152 = trunc i32 %115 to i16
  %153 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 0
  store i16 277, i16* %153, align 2, !tbaa !95
  %154 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 1
  store i16 3, i16* %154, align 2, !tbaa !97
  %155 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 2
  store i32 1, i32* %155, align 2, !tbaa !98
  %156 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 3
  %157 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %156 to i16*
  store i16 %152, i16* %157, align 2, !tbaa !38
  %158 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 0
  store i16 278, i16* %158, align 2, !tbaa !95
  %159 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 1
  store i16 4, i16* %159, align 2, !tbaa !97
  %160 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 2
  store i32 1, i32* %160, align 2, !tbaa !98
  %161 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 3, i32 0
  store i32 %108, i32* %161, align 2, !tbaa !38
  %162 = icmp eq i32 %115, 1
  %163 = trunc i64 %90 to i32
  %164 = mul i32 %95, %163
  %165 = shl i32 %115, 2
  %166 = add i32 %165, 210
  %167 = select i1 %162, i32 %164, i32 %166
  %168 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 0
  store i16 279, i16* %168, align 2
  %169 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 1
  store i16 4, i16* %169, align 2
  %170 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 2
  store i32 %115, i32* %170, align 2
  %171 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 3, i32 0
  store i32 %167, i32* %171, align 2
  %172 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 0
  store i16 282, i16* %172, align 2, !tbaa !95
  %173 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 1
  store i16 5, i16* %173, align 2, !tbaa !97
  %174 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 2
  store i32 1, i32* %174, align 2, !tbaa !98
  %175 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 3, i32 0
  store i32 194, i32* %175, align 2, !tbaa !38
  %176 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 0
  store i16 283, i16* %176, align 2, !tbaa !95
  %177 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 1
  store i16 5, i16* %177, align 2, !tbaa !97
  %178 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 2
  store i32 1, i32* %178, align 2, !tbaa !98
  %179 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 3, i32 0
  store i32 202, i32* %179, align 2, !tbaa !38
  %180 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 0
  store i16 284, i16* %180, align 2, !tbaa !95
  %181 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 1
  store i16 3, i16* %181, align 2, !tbaa !97
  %182 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 2
  store i32 1, i32* %182, align 2, !tbaa !98
  %183 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 3
  %184 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %183 to i16*
  store i16 2, i16* %184, align 2, !tbaa !38
  %185 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 0
  store i16 296, i16* %185, align 2, !tbaa !95
  %186 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 1
  store i16 3, i16* %186, align 2, !tbaa !97
  %187 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 2
  store i32 1, i32* %187, align 2, !tbaa !98
  %188 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 3
  %189 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %188 to i16*
  store i16 1, i16* %189, align 2, !tbaa !38
  %190 = sext i32 %2 to i64
  %191 = getelementptr inbounds [10 x i16], [10 x i16]* @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, i64 0, i64 %190
  %192 = load i16, i16* %191, align 2, !tbaa !59
  %193 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 0
  store i16 339, i16* %193, align 2, !tbaa !95
  %194 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 1
  store i16 3, i16* %194, align 2, !tbaa !97
  %195 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 2
  store i32 1, i32* %195, align 2, !tbaa !98
  %196 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 3
  %197 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %196 to i16*
  store i16 %192, i16* %197, align 2, !tbaa !38
  %198 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 0
  store i16 -32539, i16* %198, align 2, !tbaa !95
  %199 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 1
  store i16 4, i16* %199, align 2, !tbaa !97
  %200 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 2
  store i32 1, i32* %200, align 2, !tbaa !98
  %201 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 3, i32 0
  store i32 %114, i32* %201, align 2, !tbaa !38
  %202 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 5
  %203 = bitcast i32* %202 to <4 x i32>*
  store <4 x i32> <i32 0, i32 1, i32 1, i32 1>, <4 x i32>* %203, align 2, !tbaa !16
  %204 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 7, i64 1
  store i32 1, i32* %204, align 2, !tbaa !16
  %205 = call i64 @fwrite(i8* nonnull %116, i64 210, i64 1, i8* nonnull %35) #16
  %206 = icmp eq i64 %205, 0
  br i1 %206, label %240, label %207

207:                                              ; preds = %106
  %208 = icmp sgt i32 %115, 1
  br i1 %208, label %209, label %239

209:                                              ; preds = %207
  %210 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %210) #18
  %211 = shl i32 %115, 3
  %212 = add i32 %211, 210
  store i32 %212, i32* %7, align 4, !tbaa !16
  %213 = mul i32 %114, %95
  br label %214

214:                                              ; preds = %218, %209
  %215 = phi i32 [ 0, %209 ], [ %225, %218 ]
  %216 = call i64 @fwrite(i8* nonnull %210, i64 4, i64 1, i8* nonnull %35) #16
  %217 = icmp eq i64 %216, 0
  br i1 %217, label %.loopexit26, label %218

218:                                              ; preds = %214
  %219 = load i32, i32* %40, align 4, !tbaa !79
  %220 = load i32, i32* %42, align 4, !tbaa !79
  %221 = mul i32 %213, %219
  %222 = mul i32 %221, %220
  %223 = load i32, i32* %7, align 4, !tbaa !16
  %224 = add nsw i32 %222, %223
  store i32 %224, i32* %7, align 4, !tbaa !16
  %225 = add nuw nsw i32 %215, 1
  %226 = icmp eq i32 %225, %115
  br i1 %226, label %227, label %214, !llvm.loop !99

227:                                              ; preds = %218
  %228 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %228) #18
  store i32 %222, i32* %8, align 4, !tbaa !16
  br label %231

229:                                              ; preds = %231
  %230 = icmp eq i32 %235, %115
  br i1 %230, label %238, label %231, !llvm.loop !100

231:                                              ; preds = %227, %229
  %232 = phi i32 [ %235, %229 ], [ 0, %227 ]
  %233 = call i64 @fwrite(i8* nonnull %228, i64 4, i64 1, i8* nonnull %35) #16
  %234 = icmp eq i64 %233, 0
  %235 = add nuw nsw i32 %232, 1
  br i1 %234, label %236, label %229

236:                                              ; preds = %231
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %228) #18
  br label %.loopexit26

.loopexit26:                                      ; preds = %214, %236
  %237 = phi i32 [ -5, %236 ], [ -4, %214 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %210) #18
  br label %240

238:                                              ; preds = %229
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %228) #18
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %210) #18
  br label %239

239:                                              ; preds = %238, %207
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %116) #18
  br label %704

240:                                              ; preds = %.loopexit26, %106
  %241 = phi i32 [ -3, %106 ], [ %237, %.loopexit26 ]
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %116) #18
  br label %922

242:                                              ; preds = %104
  %243 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5.40, i64 0, i64 0)) #17
  br i1 %243, label %.preheader31, label %691

.preheader31:                                     ; preds = %242, %.preheader31
  %244 = phi i8* [ %247, %.preheader31 ], [ %1, %242 ]
  %245 = load i8, i8* %244, align 1, !tbaa !38
  %246 = icmp eq i8 %245, 0
  %247 = getelementptr inbounds i8, i8* %244, i64 1
  br i1 %246, label %.preheader30, label %.preheader31, !llvm.loop !101

248:                                              ; preds = %.preheader30
  %249 = ptrtoint i8* %252 to i64
  %250 = ptrtoint i8* %1 to i64
  %251 = sub i64 %250, %249
  br label %256

.preheader30:                                     ; preds = %.preheader31, %.preheader30
  %252 = phi i8* [ %253, %.preheader30 ], [ %244, %.preheader31 ]
  %253 = getelementptr inbounds i8, i8* %252, i64 -1
  %254 = load i8, i8* %253, align 1, !tbaa !38
  %255 = icmp eq i8 %254, 46
  br i1 %255, label %248, label %.preheader30, !llvm.loop !102

256:                                              ; preds = %260, %248
  %257 = phi i64 [ %261, %260 ], [ -1, %248 ]
  %258 = getelementptr inbounds i8, i8* %252, i64 %257
  %259 = icmp eq i8* %258, %1
  br i1 %259, label %265, label %260

260:                                              ; preds = %256
  %261 = add nsw i64 %257, -1
  %262 = getelementptr inbounds i8, i8* %252, i64 %261
  %263 = load i8, i8* %262, align 1, !tbaa !38
  %264 = icmp eq i8 %263, 47
  br i1 %264, label %265, label %256, !llvm.loop !103

265:                                              ; preds = %260, %256
  %266 = phi i64 [ %251, %256 ], [ %257, %260 ]
  %267 = trunc i64 %266 to i32
  %268 = xor i32 %267, -1
  %269 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %269) #18
  %270 = icmp eq i64 %266, -1
  br i1 %270, label %iter.check, label %.preheader29.preheader

.preheader29.preheader:                           ; preds = %265
  %271 = xor i64 %266, -1
  %min.iters.check101 = icmp ugt i64 %266, -129
  br i1 %min.iters.check101, label %.preheader29.preheader286, label %vector.memcheck

vector.memcheck:                                  ; preds = %.preheader29.preheader
  %272 = xor i64 %266, -1
  %scevgep = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %272
  %scevgep104 = getelementptr i8, i8* %252, i64 %266
  %scevgep105 = getelementptr i8, i8* %252, i64 -1
  %bound0 = icmp ult i8* %10, %scevgep105
  %bound1 = icmp ult i8* %scevgep104, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %.preheader29.preheader286, label %vector.ph103

vector.ph103:                                     ; preds = %vector.memcheck
  %n.vec107 = and i64 %271, -128
  %ind.end111 = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %n.vec107
  %ind.end113 = add i64 %266, %n.vec107
  %273 = add i64 %n.vec107, -128
  %274 = lshr exact i64 %273, 7
  %275 = add nuw nsw i64 %274, 1
  %xtraiter294 = and i64 %275, 3
  %276 = icmp ult i64 %273, 384
  br i1 %276, label %middle.block98.unr-lcssa, label %vector.ph103.new

vector.ph103.new:                                 ; preds = %vector.ph103
  %unroll_iter297 = and i64 %275, 288230376151711740
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100, %vector.ph103.new
  %index108 = phi i64 [ 0, %vector.ph103.new ], [ %index.next109.3, %vector.body100 ]
  %niter298 = phi i64 [ %unroll_iter297, %vector.ph103.new ], [ %niter298.nsub.3, %vector.body100 ]
  %next.gep = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %index108
  %offset.idx = add i64 %266, %index108
  %277 = getelementptr inbounds i8, i8* %252, i64 %offset.idx
  %278 = bitcast i8* %277 to <32 x i8>*
  %wide.load = load <32 x i8>, <32 x i8>* %278, align 1, !tbaa !38, !alias.scope !104
  %279 = getelementptr inbounds i8, i8* %277, i64 32
  %280 = bitcast i8* %279 to <32 x i8>*
  %wide.load118 = load <32 x i8>, <32 x i8>* %280, align 1, !tbaa !38, !alias.scope !104
  %281 = getelementptr inbounds i8, i8* %277, i64 64
  %282 = bitcast i8* %281 to <32 x i8>*
  %wide.load119 = load <32 x i8>, <32 x i8>* %282, align 1, !tbaa !38, !alias.scope !104
  %283 = getelementptr inbounds i8, i8* %277, i64 96
  %284 = bitcast i8* %283 to <32 x i8>*
  %wide.load120 = load <32 x i8>, <32 x i8>* %284, align 1, !tbaa !38, !alias.scope !104
  %285 = bitcast i8* %next.gep to <32 x i8>*
  store <32 x i8> %wide.load, <32 x i8>* %285, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %286 = getelementptr i8, i8* %next.gep, i64 32
  %287 = bitcast i8* %286 to <32 x i8>*
  store <32 x i8> %wide.load118, <32 x i8>* %287, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %288 = getelementptr i8, i8* %next.gep, i64 64
  %289 = bitcast i8* %288 to <32 x i8>*
  store <32 x i8> %wide.load119, <32 x i8>* %289, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %290 = getelementptr i8, i8* %next.gep, i64 96
  %291 = bitcast i8* %290 to <32 x i8>*
  store <32 x i8> %wide.load120, <32 x i8>* %291, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %index.next109 = or i64 %index108, 128
  %next.gep.1 = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %index.next109
  %offset.idx.1 = add i64 %266, %index.next109
  %292 = getelementptr inbounds i8, i8* %252, i64 %offset.idx.1
  %293 = bitcast i8* %292 to <32 x i8>*
  %wide.load.1 = load <32 x i8>, <32 x i8>* %293, align 1, !tbaa !38, !alias.scope !104
  %294 = getelementptr inbounds i8, i8* %292, i64 32
  %295 = bitcast i8* %294 to <32 x i8>*
  %wide.load118.1 = load <32 x i8>, <32 x i8>* %295, align 1, !tbaa !38, !alias.scope !104
  %296 = getelementptr inbounds i8, i8* %292, i64 64
  %297 = bitcast i8* %296 to <32 x i8>*
  %wide.load119.1 = load <32 x i8>, <32 x i8>* %297, align 1, !tbaa !38, !alias.scope !104
  %298 = getelementptr inbounds i8, i8* %292, i64 96
  %299 = bitcast i8* %298 to <32 x i8>*
  %wide.load120.1 = load <32 x i8>, <32 x i8>* %299, align 1, !tbaa !38, !alias.scope !104
  %300 = bitcast i8* %next.gep.1 to <32 x i8>*
  store <32 x i8> %wide.load.1, <32 x i8>* %300, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %301 = getelementptr i8, i8* %next.gep.1, i64 32
  %302 = bitcast i8* %301 to <32 x i8>*
  store <32 x i8> %wide.load118.1, <32 x i8>* %302, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %303 = getelementptr i8, i8* %next.gep.1, i64 64
  %304 = bitcast i8* %303 to <32 x i8>*
  store <32 x i8> %wide.load119.1, <32 x i8>* %304, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %305 = getelementptr i8, i8* %next.gep.1, i64 96
  %306 = bitcast i8* %305 to <32 x i8>*
  store <32 x i8> %wide.load120.1, <32 x i8>* %306, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %index.next109.1 = or i64 %index108, 256
  %next.gep.2 = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %index.next109.1
  %offset.idx.2 = add i64 %266, %index.next109.1
  %307 = getelementptr inbounds i8, i8* %252, i64 %offset.idx.2
  %308 = bitcast i8* %307 to <32 x i8>*
  %wide.load.2 = load <32 x i8>, <32 x i8>* %308, align 1, !tbaa !38, !alias.scope !104
  %309 = getelementptr inbounds i8, i8* %307, i64 32
  %310 = bitcast i8* %309 to <32 x i8>*
  %wide.load118.2 = load <32 x i8>, <32 x i8>* %310, align 1, !tbaa !38, !alias.scope !104
  %311 = getelementptr inbounds i8, i8* %307, i64 64
  %312 = bitcast i8* %311 to <32 x i8>*
  %wide.load119.2 = load <32 x i8>, <32 x i8>* %312, align 1, !tbaa !38, !alias.scope !104
  %313 = getelementptr inbounds i8, i8* %307, i64 96
  %314 = bitcast i8* %313 to <32 x i8>*
  %wide.load120.2 = load <32 x i8>, <32 x i8>* %314, align 1, !tbaa !38, !alias.scope !104
  %315 = bitcast i8* %next.gep.2 to <32 x i8>*
  store <32 x i8> %wide.load.2, <32 x i8>* %315, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %316 = getelementptr i8, i8* %next.gep.2, i64 32
  %317 = bitcast i8* %316 to <32 x i8>*
  store <32 x i8> %wide.load118.2, <32 x i8>* %317, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %318 = getelementptr i8, i8* %next.gep.2, i64 64
  %319 = bitcast i8* %318 to <32 x i8>*
  store <32 x i8> %wide.load119.2, <32 x i8>* %319, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %320 = getelementptr i8, i8* %next.gep.2, i64 96
  %321 = bitcast i8* %320 to <32 x i8>*
  store <32 x i8> %wide.load120.2, <32 x i8>* %321, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %index.next109.2 = or i64 %index108, 384
  %next.gep.3 = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %index.next109.2
  %offset.idx.3 = add i64 %266, %index.next109.2
  %322 = getelementptr inbounds i8, i8* %252, i64 %offset.idx.3
  %323 = bitcast i8* %322 to <32 x i8>*
  %wide.load.3 = load <32 x i8>, <32 x i8>* %323, align 1, !tbaa !38, !alias.scope !104
  %324 = getelementptr inbounds i8, i8* %322, i64 32
  %325 = bitcast i8* %324 to <32 x i8>*
  %wide.load118.3 = load <32 x i8>, <32 x i8>* %325, align 1, !tbaa !38, !alias.scope !104
  %326 = getelementptr inbounds i8, i8* %322, i64 64
  %327 = bitcast i8* %326 to <32 x i8>*
  %wide.load119.3 = load <32 x i8>, <32 x i8>* %327, align 1, !tbaa !38, !alias.scope !104
  %328 = getelementptr inbounds i8, i8* %322, i64 96
  %329 = bitcast i8* %328 to <32 x i8>*
  %wide.load120.3 = load <32 x i8>, <32 x i8>* %329, align 1, !tbaa !38, !alias.scope !104
  %330 = bitcast i8* %next.gep.3 to <32 x i8>*
  store <32 x i8> %wide.load.3, <32 x i8>* %330, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %331 = getelementptr i8, i8* %next.gep.3, i64 32
  %332 = bitcast i8* %331 to <32 x i8>*
  store <32 x i8> %wide.load118.3, <32 x i8>* %332, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %333 = getelementptr i8, i8* %next.gep.3, i64 64
  %334 = bitcast i8* %333 to <32 x i8>*
  store <32 x i8> %wide.load119.3, <32 x i8>* %334, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %335 = getelementptr i8, i8* %next.gep.3, i64 96
  %336 = bitcast i8* %335 to <32 x i8>*
  store <32 x i8> %wide.load120.3, <32 x i8>* %336, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %index.next109.3 = add i64 %index108, 512
  %niter298.nsub.3 = add i64 %niter298, -4
  %niter298.ncmp.3 = icmp eq i64 %niter298.nsub.3, 0
  br i1 %niter298.ncmp.3, label %middle.block98.unr-lcssa, label %vector.body100, !llvm.loop !109

middle.block98.unr-lcssa:                         ; preds = %vector.body100, %vector.ph103
  %index108.unr = phi i64 [ 0, %vector.ph103 ], [ %index.next109.3, %vector.body100 ]
  %lcmp.mod296.not = icmp eq i64 %xtraiter294, 0
  br i1 %lcmp.mod296.not, label %middle.block98, label %vector.body100.epil

vector.body100.epil:                              ; preds = %middle.block98.unr-lcssa, %vector.body100.epil
  %index108.epil = phi i64 [ %index.next109.epil, %vector.body100.epil ], [ %index108.unr, %middle.block98.unr-lcssa ]
  %epil.iter295 = phi i64 [ %epil.iter295.sub, %vector.body100.epil ], [ %xtraiter294, %middle.block98.unr-lcssa ]
  %next.gep.epil = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %index108.epil
  %offset.idx.epil = add i64 %266, %index108.epil
  %337 = getelementptr inbounds i8, i8* %252, i64 %offset.idx.epil
  %338 = bitcast i8* %337 to <32 x i8>*
  %wide.load.epil = load <32 x i8>, <32 x i8>* %338, align 1, !tbaa !38, !alias.scope !104
  %339 = getelementptr inbounds i8, i8* %337, i64 32
  %340 = bitcast i8* %339 to <32 x i8>*
  %wide.load118.epil = load <32 x i8>, <32 x i8>* %340, align 1, !tbaa !38, !alias.scope !104
  %341 = getelementptr inbounds i8, i8* %337, i64 64
  %342 = bitcast i8* %341 to <32 x i8>*
  %wide.load119.epil = load <32 x i8>, <32 x i8>* %342, align 1, !tbaa !38, !alias.scope !104
  %343 = getelementptr inbounds i8, i8* %337, i64 96
  %344 = bitcast i8* %343 to <32 x i8>*
  %wide.load120.epil = load <32 x i8>, <32 x i8>* %344, align 1, !tbaa !38, !alias.scope !104
  %345 = bitcast i8* %next.gep.epil to <32 x i8>*
  store <32 x i8> %wide.load.epil, <32 x i8>* %345, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %346 = getelementptr i8, i8* %next.gep.epil, i64 32
  %347 = bitcast i8* %346 to <32 x i8>*
  store <32 x i8> %wide.load118.epil, <32 x i8>* %347, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %348 = getelementptr i8, i8* %next.gep.epil, i64 64
  %349 = bitcast i8* %348 to <32 x i8>*
  store <32 x i8> %wide.load119.epil, <32 x i8>* %349, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %350 = getelementptr i8, i8* %next.gep.epil, i64 96
  %351 = bitcast i8* %350 to <32 x i8>*
  store <32 x i8> %wide.load120.epil, <32 x i8>* %351, align 1, !tbaa !38, !alias.scope !107, !noalias !104
  %index.next109.epil = add i64 %index108.epil, 128
  %epil.iter295.sub = add i64 %epil.iter295, -1
  %epil.iter295.cmp.not = icmp eq i64 %epil.iter295.sub, 0
  br i1 %epil.iter295.cmp.not, label %middle.block98, label %vector.body100.epil, !llvm.loop !110

middle.block98:                                   ; preds = %vector.body100.epil, %middle.block98.unr-lcssa
  %cmp.n114 = icmp eq i64 %n.vec107, %271
  br i1 %cmp.n114, label %.loopexit263, label %.preheader29.preheader286

.preheader29.preheader286:                        ; preds = %vector.memcheck, %.preheader29.preheader, %middle.block98
  %.ph287 = phi i8* [ %269, %vector.memcheck ], [ %269, %.preheader29.preheader ], [ %ind.end111, %middle.block98 ]
  %.ph288 = phi i64 [ %266, %vector.memcheck ], [ %266, %.preheader29.preheader ], [ %ind.end113, %middle.block98 ]
  %352 = sub i64 -2, %.ph288
  %353 = and i64 %.ph288, 7
  %xtraiter299 = xor i64 %353, 7
  %lcmp.mod300.not = icmp eq i64 %xtraiter299, 0
  br i1 %lcmp.mod300.not, label %.preheader29.prol.loopexit, label %.preheader29.prol

.preheader29.prol:                                ; preds = %.preheader29.preheader286, %.preheader29.prol
  %354 = phi i8* [ %359, %.preheader29.prol ], [ %.ph287, %.preheader29.preheader286 ]
  %355 = phi i64 [ %357, %.preheader29.prol ], [ %.ph288, %.preheader29.preheader286 ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader29.prol ], [ %xtraiter299, %.preheader29.preheader286 ]
  %356 = getelementptr inbounds i8, i8* %252, i64 %355
  %357 = add nuw nsw i64 %355, 1
  %358 = load i8, i8* %356, align 1, !tbaa !38
  %359 = getelementptr inbounds i8, i8* %354, i64 1
  store i8 %358, i8* %354, align 1, !tbaa !38
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %.preheader29.prol.loopexit, label %.preheader29.prol, !llvm.loop !111

.preheader29.prol.loopexit:                       ; preds = %.preheader29.prol, %.preheader29.preheader286
  %.lcssa289.unr = phi i8* [ undef, %.preheader29.preheader286 ], [ %359, %.preheader29.prol ]
  %.unr = phi i8* [ %.ph287, %.preheader29.preheader286 ], [ %359, %.preheader29.prol ]
  %.unr301 = phi i64 [ %.ph288, %.preheader29.preheader286 ], [ %357, %.preheader29.prol ]
  %360 = icmp ult i64 %352, 7
  br i1 %360, label %.loopexit263, label %.preheader29

.loopexit263:                                     ; preds = %.preheader29.prol.loopexit, %.preheader29, %middle.block98
  %.lcssa94 = phi i8* [ %ind.end111, %middle.block98 ], [ %.lcssa289.unr, %.preheader29.prol.loopexit ], [ %470, %.preheader29 ]
  %361 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 256
  %362 = icmp ult i8* %.lcssa94, %361
  br i1 %362, label %iter.check, label %.loopexit28

iter.check:                                       ; preds = %.loopexit263, %265
  %363 = phi i8* [ %.lcssa94, %.loopexit263 ], [ %269, %265 ]
  %364 = ptrtoint i8* %363 to i64
  %365 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 1, i64 0
  %366 = sub i64 0, %364
  %scevgep124 = getelementptr [256 x i8], [256 x i8]* %9, i64 1, i64 %366
  %exitcount.ptrcnt.to.int = ptrtoint i8* %scevgep124 to i64
  %min.iters.check126 = icmp ult i8* %scevgep124, inttoptr (i64 4 to i8*)
  br i1 %min.iters.check126, label %vec.epilog.scalar.ph.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check128 = icmp ult i8* %scevgep124, inttoptr (i64 128 to i8*)
  br i1 %min.iters.check128, label %vec.epilog.ph, label %vector.ph129

vector.ph129:                                     ; preds = %vector.main.loop.iter.check
  %n.vec131 = and i64 %exitcount.ptrcnt.to.int, -128
  %367 = add i64 %n.vec131, -128
  %368 = lshr exact i64 %367, 7
  %369 = add nuw nsw i64 %368, 1
  %xtraiter302 = and i64 %369, 7
  %370 = icmp ult i64 %367, 896
  br i1 %370, label %middle.block121.unr-lcssa, label %vector.ph129.new

vector.ph129.new:                                 ; preds = %vector.ph129
  %unroll_iter305 = and i64 %369, 288230376151711736
  br label %vector.body123

vector.body123:                                   ; preds = %vector.body123, %vector.ph129.new
  %index132 = phi i64 [ 0, %vector.ph129.new ], [ %index.next133.7, %vector.body123 ]
  %niter306 = phi i64 [ %unroll_iter305, %vector.ph129.new ], [ %niter306.nsub.7, %vector.body123 ]
  %next.gep135 = getelementptr i8, i8* %363, i64 %index132
  %371 = bitcast i8* %next.gep135 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %371, align 1, !tbaa !38
  %372 = getelementptr i8, i8* %next.gep135, i64 32
  %373 = bitcast i8* %372 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %373, align 1, !tbaa !38
  %374 = getelementptr i8, i8* %next.gep135, i64 64
  %375 = bitcast i8* %374 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %375, align 1, !tbaa !38
  %376 = getelementptr i8, i8* %next.gep135, i64 96
  %377 = bitcast i8* %376 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %377, align 1, !tbaa !38
  %index.next133 = or i64 %index132, 128
  %next.gep135.1 = getelementptr i8, i8* %363, i64 %index.next133
  %378 = bitcast i8* %next.gep135.1 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %378, align 1, !tbaa !38
  %379 = getelementptr i8, i8* %next.gep135.1, i64 32
  %380 = bitcast i8* %379 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %380, align 1, !tbaa !38
  %381 = getelementptr i8, i8* %next.gep135.1, i64 64
  %382 = bitcast i8* %381 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %382, align 1, !tbaa !38
  %383 = getelementptr i8, i8* %next.gep135.1, i64 96
  %384 = bitcast i8* %383 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %384, align 1, !tbaa !38
  %index.next133.1 = or i64 %index132, 256
  %next.gep135.2 = getelementptr i8, i8* %363, i64 %index.next133.1
  %385 = bitcast i8* %next.gep135.2 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %385, align 1, !tbaa !38
  %386 = getelementptr i8, i8* %next.gep135.2, i64 32
  %387 = bitcast i8* %386 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %387, align 1, !tbaa !38
  %388 = getelementptr i8, i8* %next.gep135.2, i64 64
  %389 = bitcast i8* %388 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %389, align 1, !tbaa !38
  %390 = getelementptr i8, i8* %next.gep135.2, i64 96
  %391 = bitcast i8* %390 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %391, align 1, !tbaa !38
  %index.next133.2 = or i64 %index132, 384
  %next.gep135.3 = getelementptr i8, i8* %363, i64 %index.next133.2
  %392 = bitcast i8* %next.gep135.3 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %392, align 1, !tbaa !38
  %393 = getelementptr i8, i8* %next.gep135.3, i64 32
  %394 = bitcast i8* %393 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %394, align 1, !tbaa !38
  %395 = getelementptr i8, i8* %next.gep135.3, i64 64
  %396 = bitcast i8* %395 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %396, align 1, !tbaa !38
  %397 = getelementptr i8, i8* %next.gep135.3, i64 96
  %398 = bitcast i8* %397 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %398, align 1, !tbaa !38
  %index.next133.3 = or i64 %index132, 512
  %next.gep135.4 = getelementptr i8, i8* %363, i64 %index.next133.3
  %399 = bitcast i8* %next.gep135.4 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %399, align 1, !tbaa !38
  %400 = getelementptr i8, i8* %next.gep135.4, i64 32
  %401 = bitcast i8* %400 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %401, align 1, !tbaa !38
  %402 = getelementptr i8, i8* %next.gep135.4, i64 64
  %403 = bitcast i8* %402 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %403, align 1, !tbaa !38
  %404 = getelementptr i8, i8* %next.gep135.4, i64 96
  %405 = bitcast i8* %404 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %405, align 1, !tbaa !38
  %index.next133.4 = or i64 %index132, 640
  %next.gep135.5 = getelementptr i8, i8* %363, i64 %index.next133.4
  %406 = bitcast i8* %next.gep135.5 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %406, align 1, !tbaa !38
  %407 = getelementptr i8, i8* %next.gep135.5, i64 32
  %408 = bitcast i8* %407 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %408, align 1, !tbaa !38
  %409 = getelementptr i8, i8* %next.gep135.5, i64 64
  %410 = bitcast i8* %409 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %410, align 1, !tbaa !38
  %411 = getelementptr i8, i8* %next.gep135.5, i64 96
  %412 = bitcast i8* %411 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %412, align 1, !tbaa !38
  %index.next133.5 = or i64 %index132, 768
  %next.gep135.6 = getelementptr i8, i8* %363, i64 %index.next133.5
  %413 = bitcast i8* %next.gep135.6 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %413, align 1, !tbaa !38
  %414 = getelementptr i8, i8* %next.gep135.6, i64 32
  %415 = bitcast i8* %414 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %415, align 1, !tbaa !38
  %416 = getelementptr i8, i8* %next.gep135.6, i64 64
  %417 = bitcast i8* %416 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %417, align 1, !tbaa !38
  %418 = getelementptr i8, i8* %next.gep135.6, i64 96
  %419 = bitcast i8* %418 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %419, align 1, !tbaa !38
  %index.next133.6 = or i64 %index132, 896
  %next.gep135.7 = getelementptr i8, i8* %363, i64 %index.next133.6
  %420 = bitcast i8* %next.gep135.7 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %420, align 1, !tbaa !38
  %421 = getelementptr i8, i8* %next.gep135.7, i64 32
  %422 = bitcast i8* %421 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %422, align 1, !tbaa !38
  %423 = getelementptr i8, i8* %next.gep135.7, i64 64
  %424 = bitcast i8* %423 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %424, align 1, !tbaa !38
  %425 = getelementptr i8, i8* %next.gep135.7, i64 96
  %426 = bitcast i8* %425 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %426, align 1, !tbaa !38
  %index.next133.7 = add i64 %index132, 1024
  %niter306.nsub.7 = add i64 %niter306, -8
  %niter306.ncmp.7 = icmp eq i64 %niter306.nsub.7, 0
  br i1 %niter306.ncmp.7, label %middle.block121.unr-lcssa, label %vector.body123, !llvm.loop !112

middle.block121.unr-lcssa:                        ; preds = %vector.body123, %vector.ph129
  %index132.unr = phi i64 [ 0, %vector.ph129 ], [ %index.next133.7, %vector.body123 ]
  %lcmp.mod304.not = icmp eq i64 %xtraiter302, 0
  br i1 %lcmp.mod304.not, label %middle.block121, label %vector.body123.epil

vector.body123.epil:                              ; preds = %middle.block121.unr-lcssa, %vector.body123.epil
  %index132.epil = phi i64 [ %index.next133.epil, %vector.body123.epil ], [ %index132.unr, %middle.block121.unr-lcssa ]
  %epil.iter303 = phi i64 [ %epil.iter303.sub, %vector.body123.epil ], [ %xtraiter302, %middle.block121.unr-lcssa ]
  %next.gep135.epil = getelementptr i8, i8* %363, i64 %index132.epil
  %427 = bitcast i8* %next.gep135.epil to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %427, align 1, !tbaa !38
  %428 = getelementptr i8, i8* %next.gep135.epil, i64 32
  %429 = bitcast i8* %428 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %429, align 1, !tbaa !38
  %430 = getelementptr i8, i8* %next.gep135.epil, i64 64
  %431 = bitcast i8* %430 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %431, align 1, !tbaa !38
  %432 = getelementptr i8, i8* %next.gep135.epil, i64 96
  %433 = bitcast i8* %432 to <32 x i8>*
  store <32 x i8> zeroinitializer, <32 x i8>* %433, align 1, !tbaa !38
  %index.next133.epil = add i64 %index132.epil, 128
  %epil.iter303.sub = add i64 %epil.iter303, -1
  %epil.iter303.cmp.not = icmp eq i64 %epil.iter303.sub, 0
  br i1 %epil.iter303.cmp.not, label %middle.block121, label %vector.body123.epil, !llvm.loop !113

middle.block121:                                  ; preds = %vector.body123.epil, %middle.block121.unr-lcssa
  %cmp.n134 = icmp eq i64 %n.vec131, %exitcount.ptrcnt.to.int
  br i1 %cmp.n134, label %.loopexit28, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block121
  %ind.end148 = getelementptr i8, i8* %363, i64 %n.vec131
  %n.vec.remaining = and i64 %exitcount.ptrcnt.to.int, 124
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %vec.epilog.scalar.ph.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec131, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %434 = sub i64 0, %364
  %scevgep139 = getelementptr [256 x i8], [256 x i8]* %9, i64 1, i64 %434
  %exitcount.ptrcnt.to.int141 = ptrtoint i8* %scevgep139 to i64
  %n.vec143 = and i64 %exitcount.ptrcnt.to.int141, -4
  %ind.end147 = getelementptr i8, i8* %363, i64 %n.vec143
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index144 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next145, %vec.epilog.vector.body ]
  %next.gep150 = getelementptr i8, i8* %363, i64 %index144
  %435 = bitcast i8* %next.gep150 to <4 x i8>*
  store <4 x i8> zeroinitializer, <4 x i8>* %435, align 1, !tbaa !38
  %index.next145 = add i64 %index144, 4
  %436 = icmp eq i64 %index.next145, %n.vec143
  br i1 %436, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !114

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n149 = icmp eq i64 %n.vec143, %exitcount.ptrcnt.to.int141
  br i1 %cmp.n149, label %.loopexit28, label %vec.epilog.scalar.ph.preheader

vec.epilog.scalar.ph.preheader:                   ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %.ph285 = phi i8* [ %363, %iter.check ], [ %ind.end148, %vec.epilog.iter.check ], [ %ind.end147, %vec.epilog.middle.block ]
  br label %vec.epilog.scalar.ph

.preheader29:                                     ; preds = %.preheader29.prol.loopexit, %.preheader29
  %437 = phi i8* [ %470, %.preheader29 ], [ %.unr, %.preheader29.prol.loopexit ]
  %438 = phi i64 [ %468, %.preheader29 ], [ %.unr301, %.preheader29.prol.loopexit ]
  %439 = getelementptr inbounds i8, i8* %252, i64 %438
  %440 = add nuw nsw i64 %438, 1
  %441 = load i8, i8* %439, align 1, !tbaa !38
  %442 = getelementptr inbounds i8, i8* %437, i64 1
  store i8 %441, i8* %437, align 1, !tbaa !38
  %443 = getelementptr inbounds i8, i8* %252, i64 %440
  %444 = add nuw nsw i64 %438, 2
  %445 = load i8, i8* %443, align 1, !tbaa !38
  %446 = getelementptr inbounds i8, i8* %437, i64 2
  store i8 %445, i8* %442, align 1, !tbaa !38
  %447 = getelementptr inbounds i8, i8* %252, i64 %444
  %448 = add nuw nsw i64 %438, 3
  %449 = load i8, i8* %447, align 1, !tbaa !38
  %450 = getelementptr inbounds i8, i8* %437, i64 3
  store i8 %449, i8* %446, align 1, !tbaa !38
  %451 = getelementptr inbounds i8, i8* %252, i64 %448
  %452 = add nuw nsw i64 %438, 4
  %453 = load i8, i8* %451, align 1, !tbaa !38
  %454 = getelementptr inbounds i8, i8* %437, i64 4
  store i8 %453, i8* %450, align 1, !tbaa !38
  %455 = getelementptr inbounds i8, i8* %252, i64 %452
  %456 = add nuw nsw i64 %438, 5
  %457 = load i8, i8* %455, align 1, !tbaa !38
  %458 = getelementptr inbounds i8, i8* %437, i64 5
  store i8 %457, i8* %454, align 1, !tbaa !38
  %459 = getelementptr inbounds i8, i8* %252, i64 %456
  %460 = add nuw nsw i64 %438, 6
  %461 = load i8, i8* %459, align 1, !tbaa !38
  %462 = getelementptr inbounds i8, i8* %437, i64 6
  store i8 %461, i8* %458, align 1, !tbaa !38
  %463 = getelementptr inbounds i8, i8* %252, i64 %460
  %464 = add nuw nsw i64 %438, 7
  %465 = load i8, i8* %463, align 1, !tbaa !38
  %466 = getelementptr inbounds i8, i8* %437, i64 7
  store i8 %465, i8* %462, align 1, !tbaa !38
  %467 = getelementptr inbounds i8, i8* %252, i64 %464
  %468 = add nuw nsw i64 %438, 8
  %469 = load i8, i8* %467, align 1, !tbaa !38
  %470 = getelementptr inbounds i8, i8* %437, i64 8
  store i8 %469, i8* %466, align 1, !tbaa !38
  %471 = icmp eq i64 %468, -1
  br i1 %471, label %.loopexit263, label %.preheader29, !llvm.loop !115

vec.epilog.scalar.ph:                             ; preds = %vec.epilog.scalar.ph.preheader, %vec.epilog.scalar.ph
  %472 = phi i8* [ %473, %vec.epilog.scalar.ph ], [ %.ph285, %vec.epilog.scalar.ph.preheader ]
  %473 = getelementptr inbounds i8, i8* %472, i64 1
  store i8 0, i8* %472, align 1, !tbaa !38
  %474 = icmp eq i8* %473, %365
  br i1 %474, label %.loopexit28, label %vec.epilog.scalar.ph, !llvm.loop !116

.loopexit28:                                      ; preds = %vec.epilog.scalar.ph, %middle.block121, %vec.epilog.middle.block, %.loopexit263
  %475 = sub i32 6, %267
  %476 = and i32 %475, -8
  %477 = getelementptr inbounds [129 x i8], [129 x i8]* %11, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 129, i8* nonnull %477) #18
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(129) %477, i8* nonnull align 1 dereferenceable(129) getelementptr inbounds ([129 x i8], [129 x i8]* @__const.halide_debug_to_file.header, i64 0, i64 0), i64 129, i1 false)
  %478 = call i64 @fwrite(i8* nonnull %477, i64 128, i64 1, i8* nonnull %35) #16
  %479 = load i32, i32* %29, align 4, !tbaa !76
  %480 = icmp sgt i32 %479, 0
  br i1 %480, label %481, label %606

481:                                              ; preds = %.loopexit28
  %482 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %483 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %482, align 8, !tbaa !77
  %484 = zext i32 %479 to i64
  %min.iters.check154 = icmp ult i32 %479, 17
  br i1 %min.iters.check154, label %scalar.ph152.preheader, label %vector.ph155

vector.ph155:                                     ; preds = %481
  %n.mod.vf156 = and i64 %484, 15
  %485 = icmp eq i64 %n.mod.vf156, 0
  %486 = select i1 %485, i64 16, i64 %n.mod.vf156
  %n.vec157 = sub nsw i64 %484, %486
  br label %vector.body153

vector.body153:                                   ; preds = %vector.body153, %vector.ph155
  %index158 = phi i64 [ 0, %vector.ph155 ], [ %index.next159, %vector.body153 ]
  %vec.ind162 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph155 ], [ %vec.ind.next166, %vector.body153 ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph155 ], [ %predphi, %vector.body153 ]
  %vec.phi167 = phi <4 x i64> [ zeroinitializer, %vector.ph155 ], [ %predphi179, %vector.body153 ]
  %vec.phi168 = phi <4 x i64> [ zeroinitializer, %vector.ph155 ], [ %predphi180, %vector.body153 ]
  %vec.phi169 = phi <4 x i64> [ zeroinitializer, %vector.ph155 ], [ %predphi181, %vector.body153 ]
  %step.add = add <4 x i64> %vec.ind162, <i64 4, i64 4, i64 4, i64 4>
  %step.add163 = add <4 x i64> %vec.ind162, <i64 8, i64 8, i64 8, i64 8>
  %step.add164 = add <4 x i64> %vec.ind162, <i64 12, i64 12, i64 12, i64 12>
  %487 = or i64 %index158, 4
  %488 = or i64 %index158, 8
  %489 = or i64 %index158, 12
  %490 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %index158, i32 2
  %491 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %487, i32 2
  %492 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %488, i32 2
  %493 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %489, i32 2
  %494 = bitcast i32* %490 to <16 x i32>*
  %495 = bitcast i32* %491 to <16 x i32>*
  %496 = bitcast i32* %492 to <16 x i32>*
  %497 = bitcast i32* %493 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %494, align 4, !tbaa !83
  %wide.vec170 = load <16 x i32>, <16 x i32>* %495, align 4, !tbaa !83
  %wide.vec171 = load <16 x i32>, <16 x i32>* %496, align 4, !tbaa !83
  %wide.vec172 = load <16 x i32>, <16 x i32>* %497, align 4, !tbaa !83
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec173 = shufflevector <16 x i32> %wide.vec170, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec174 = shufflevector <16 x i32> %wide.vec171, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec175 = shufflevector <16 x i32> %wide.vec172, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %498 = icmp sgt <4 x i32> %strided.vec, zeroinitializer
  %499 = icmp sgt <4 x i32> %strided.vec173, zeroinitializer
  %500 = icmp sgt <4 x i32> %strided.vec174, zeroinitializer
  %501 = icmp sgt <4 x i32> %strided.vec175, zeroinitializer
  %502 = zext <4 x i32> %strided.vec to <4 x i64>
  %503 = zext <4 x i32> %strided.vec173 to <4 x i64>
  %504 = zext <4 x i32> %strided.vec174 to <4 x i64>
  %505 = zext <4 x i32> %strided.vec175 to <4 x i64>
  %506 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %vec.ind162, i32 1
  %507 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %step.add, i32 1
  %508 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %step.add163, i32 1
  %509 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %step.add164, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %506, i32 4, <4 x i1> %498, <4 x i32> undef), !tbaa !79
  %wide.masked.gather176 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %507, i32 4, <4 x i1> %499, <4 x i32> undef), !tbaa !79
  %wide.masked.gather177 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %508, i32 4, <4 x i1> %500, <4 x i32> undef), !tbaa !79
  %wide.masked.gather178 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %509, i32 4, <4 x i1> %501, <4 x i32> undef), !tbaa !79
  %510 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %511 = add nsw <4 x i32> %wide.masked.gather176, <i32 -1, i32 -1, i32 -1, i32 -1>
  %512 = add nsw <4 x i32> %wide.masked.gather177, <i32 -1, i32 -1, i32 -1, i32 -1>
  %513 = add nsw <4 x i32> %wide.masked.gather178, <i32 -1, i32 -1, i32 -1, i32 -1>
  %514 = sext <4 x i32> %510 to <4 x i64>
  %515 = sext <4 x i32> %511 to <4 x i64>
  %516 = sext <4 x i32> %512 to <4 x i64>
  %517 = sext <4 x i32> %513 to <4 x i64>
  %518 = mul nsw <4 x i64> %514, %502
  %519 = mul nsw <4 x i64> %515, %503
  %520 = mul nsw <4 x i64> %516, %504
  %521 = mul nsw <4 x i64> %517, %505
  %522 = select <4 x i1> %498, <4 x i64> %518, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %522
  %523 = select <4 x i1> %499, <4 x i64> %519, <4 x i64> zeroinitializer
  %predphi179 = add <4 x i64> %vec.phi167, %523
  %524 = select <4 x i1> %500, <4 x i64> %520, <4 x i64> zeroinitializer
  %predphi180 = add <4 x i64> %vec.phi168, %524
  %525 = select <4 x i1> %501, <4 x i64> %521, <4 x i64> zeroinitializer
  %predphi181 = add <4 x i64> %vec.phi169, %525
  %index.next159 = add i64 %index158, 16
  %vec.ind.next166 = add <4 x i64> %vec.ind162, <i64 16, i64 16, i64 16, i64 16>
  %526 = icmp eq i64 %index.next159, %n.vec157
  br i1 %526, label %middle.block151, label %vector.body153, !llvm.loop !117

middle.block151:                                  ; preds = %vector.body153
  %bin.rdx = add <4 x i64> %predphi179, %predphi
  %bin.rdx182 = add <4 x i64> %predphi180, %bin.rdx
  %bin.rdx183 = add <4 x i64> %predphi181, %bin.rdx182
  %527 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx183)
  br label %scalar.ph152.preheader

scalar.ph152.preheader:                           ; preds = %middle.block151, %481
  %.ph282 = phi i64 [ 0, %481 ], [ %n.vec157, %middle.block151 ]
  %.ph283 = phi i64 [ 0, %481 ], [ %527, %middle.block151 ]
  br label %scalar.ph152

scalar.ph152:                                     ; preds = %scalar.ph152.preheader, %541
  %528 = phi i64 [ %543, %541 ], [ %.ph282, %scalar.ph152.preheader ]
  %529 = phi i64 [ %542, %541 ], [ %.ph283, %scalar.ph152.preheader ]
  %530 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %528, i32 2
  %531 = load i32, i32* %530, align 4, !tbaa !83
  %532 = icmp sgt i32 %531, 0
  br i1 %532, label %533, label %541

533:                                              ; preds = %scalar.ph152
  %534 = zext i32 %531 to i64
  %535 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %528, i32 1
  %536 = load i32, i32* %535, align 4, !tbaa !79
  %537 = add nsw i32 %536, -1
  %538 = sext i32 %537 to i64
  %539 = mul nsw i64 %538, %534
  %540 = add nsw i64 %539, %529
  br label %541

541:                                              ; preds = %533, %scalar.ph152
  %542 = phi i64 [ %540, %533 ], [ %529, %scalar.ph152 ]
  %543 = add nuw nsw i64 %528, 1
  %544 = icmp eq i64 %543, %484
  br i1 %544, label %.preheader27, label %scalar.ph152, !llvm.loop !118

.preheader27:                                     ; preds = %541
  %min.iters.check187 = icmp ult i32 %479, 17
  br i1 %min.iters.check187, label %scalar.ph185.preheader, label %vector.ph188

vector.ph188:                                     ; preds = %.preheader27
  %n.mod.vf189 = and i64 %484, 15
  %545 = icmp eq i64 %n.mod.vf189, 0
  %546 = select i1 %545, i64 16, i64 %n.mod.vf189
  %n.vec190 = sub nsw i64 %484, %546
  br label %vector.body186

vector.body186:                                   ; preds = %vector.body186, %vector.ph188
  %index191 = phi i64 [ 0, %vector.ph188 ], [ %index.next192, %vector.body186 ]
  %vec.ind195 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph188 ], [ %vec.ind.next200, %vector.body186 ]
  %vec.phi201 = phi <4 x i64> [ zeroinitializer, %vector.ph188 ], [ %predphi217, %vector.body186 ]
  %vec.phi202 = phi <4 x i64> [ zeroinitializer, %vector.ph188 ], [ %predphi218, %vector.body186 ]
  %vec.phi203 = phi <4 x i64> [ zeroinitializer, %vector.ph188 ], [ %predphi219, %vector.body186 ]
  %vec.phi204 = phi <4 x i64> [ zeroinitializer, %vector.ph188 ], [ %predphi220, %vector.body186 ]
  %step.add196 = add <4 x i64> %vec.ind195, <i64 4, i64 4, i64 4, i64 4>
  %step.add197 = add <4 x i64> %vec.ind195, <i64 8, i64 8, i64 8, i64 8>
  %step.add198 = add <4 x i64> %vec.ind195, <i64 12, i64 12, i64 12, i64 12>
  %547 = or i64 %index191, 4
  %548 = or i64 %index191, 8
  %549 = or i64 %index191, 12
  %550 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %index191, i32 2
  %551 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %547, i32 2
  %552 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %548, i32 2
  %553 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %549, i32 2
  %554 = bitcast i32* %550 to <16 x i32>*
  %555 = bitcast i32* %551 to <16 x i32>*
  %556 = bitcast i32* %552 to <16 x i32>*
  %557 = bitcast i32* %553 to <16 x i32>*
  %wide.vec205 = load <16 x i32>, <16 x i32>* %554, align 4, !tbaa !83
  %wide.vec206 = load <16 x i32>, <16 x i32>* %555, align 4, !tbaa !83
  %wide.vec207 = load <16 x i32>, <16 x i32>* %556, align 4, !tbaa !83
  %wide.vec208 = load <16 x i32>, <16 x i32>* %557, align 4, !tbaa !83
  %strided.vec209 = shufflevector <16 x i32> %wide.vec205, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec210 = shufflevector <16 x i32> %wide.vec206, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec211 = shufflevector <16 x i32> %wide.vec207, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec212 = shufflevector <16 x i32> %wide.vec208, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %558 = icmp slt <4 x i32> %strided.vec209, zeroinitializer
  %559 = icmp slt <4 x i32> %strided.vec210, zeroinitializer
  %560 = icmp slt <4 x i32> %strided.vec211, zeroinitializer
  %561 = icmp slt <4 x i32> %strided.vec212, zeroinitializer
  %562 = sext <4 x i32> %strided.vec209 to <4 x i64>
  %563 = sext <4 x i32> %strided.vec210 to <4 x i64>
  %564 = sext <4 x i32> %strided.vec211 to <4 x i64>
  %565 = sext <4 x i32> %strided.vec212 to <4 x i64>
  %566 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %vec.ind195, i32 1
  %567 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %step.add196, i32 1
  %568 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %step.add197, i32 1
  %569 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, <4 x i64> %step.add198, i32 1
  %wide.masked.gather213 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %566, i32 4, <4 x i1> %558, <4 x i32> undef), !tbaa !79
  %wide.masked.gather214 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %567, i32 4, <4 x i1> %559, <4 x i32> undef), !tbaa !79
  %wide.masked.gather215 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %568, i32 4, <4 x i1> %560, <4 x i32> undef), !tbaa !79
  %wide.masked.gather216 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %569, i32 4, <4 x i1> %561, <4 x i32> undef), !tbaa !79
  %570 = add nsw <4 x i32> %wide.masked.gather213, <i32 -1, i32 -1, i32 -1, i32 -1>
  %571 = add nsw <4 x i32> %wide.masked.gather214, <i32 -1, i32 -1, i32 -1, i32 -1>
  %572 = add nsw <4 x i32> %wide.masked.gather215, <i32 -1, i32 -1, i32 -1, i32 -1>
  %573 = add nsw <4 x i32> %wide.masked.gather216, <i32 -1, i32 -1, i32 -1, i32 -1>
  %574 = sext <4 x i32> %570 to <4 x i64>
  %575 = sext <4 x i32> %571 to <4 x i64>
  %576 = sext <4 x i32> %572 to <4 x i64>
  %577 = sext <4 x i32> %573 to <4 x i64>
  %578 = mul nsw <4 x i64> %574, %562
  %579 = mul nsw <4 x i64> %575, %563
  %580 = mul nsw <4 x i64> %576, %564
  %581 = mul nsw <4 x i64> %577, %565
  %582 = select <4 x i1> %558, <4 x i64> %578, <4 x i64> zeroinitializer
  %predphi217 = add <4 x i64> %vec.phi201, %582
  %583 = select <4 x i1> %559, <4 x i64> %579, <4 x i64> zeroinitializer
  %predphi218 = add <4 x i64> %vec.phi202, %583
  %584 = select <4 x i1> %560, <4 x i64> %580, <4 x i64> zeroinitializer
  %predphi219 = add <4 x i64> %vec.phi203, %584
  %585 = select <4 x i1> %561, <4 x i64> %581, <4 x i64> zeroinitializer
  %predphi220 = add <4 x i64> %vec.phi204, %585
  %index.next192 = add i64 %index191, 16
  %vec.ind.next200 = add <4 x i64> %vec.ind195, <i64 16, i64 16, i64 16, i64 16>
  %586 = icmp eq i64 %index.next192, %n.vec190
  br i1 %586, label %middle.block184, label %vector.body186, !llvm.loop !119

middle.block184:                                  ; preds = %vector.body186
  %bin.rdx221 = add <4 x i64> %predphi218, %predphi217
  %bin.rdx222 = add <4 x i64> %predphi219, %bin.rdx221
  %bin.rdx223 = add <4 x i64> %predphi220, %bin.rdx222
  %587 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx223)
  br label %scalar.ph185.preheader

scalar.ph185.preheader:                           ; preds = %middle.block184, %.preheader27
  %.ph279 = phi i64 [ 0, %.preheader27 ], [ %n.vec190, %middle.block184 ]
  %.ph280 = phi i64 [ 0, %.preheader27 ], [ %587, %middle.block184 ]
  br label %scalar.ph185

scalar.ph185:                                     ; preds = %scalar.ph185.preheader, %601
  %588 = phi i64 [ %603, %601 ], [ %.ph279, %scalar.ph185.preheader ]
  %589 = phi i64 [ %602, %601 ], [ %.ph280, %scalar.ph185.preheader ]
  %590 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %588, i32 2
  %591 = load i32, i32* %590, align 4, !tbaa !83
  %592 = icmp slt i32 %591, 0
  br i1 %592, label %593, label %601

593:                                              ; preds = %scalar.ph185
  %594 = sext i32 %591 to i64
  %595 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %483, i64 %588, i32 1
  %596 = load i32, i32* %595, align 4, !tbaa !79
  %597 = add nsw i32 %596, -1
  %598 = sext i32 %597 to i64
  %599 = mul nsw i64 %598, %594
  %600 = add nsw i64 %599, %589
  br label %601

601:                                              ; preds = %593, %scalar.ph185
  %602 = phi i64 [ %600, %593 ], [ %589, %scalar.ph185 ]
  %603 = add nuw nsw i64 %588, 1
  %604 = icmp eq i64 %603, %484
  br i1 %604, label %.loopexit262, label %scalar.ph185, !llvm.loop !120

.loopexit262:                                     ; preds = %601
  %605 = add nsw i64 %542, 1
  br label %606

606:                                              ; preds = %.loopexit262, %.loopexit28
  %607 = phi i64 [ 1, %.loopexit28 ], [ %605, %.loopexit262 ]
  %608 = phi i64 [ 0, %.loopexit28 ], [ %602, %.loopexit262 ]
  %609 = sub nsw i64 %607, %608
  %610 = load i8, i8* %91, align 1, !tbaa !28
  %611 = zext i8 %610 to i64
  %612 = add nuw nsw i64 %611, 7
  %613 = lshr i64 %612, 3
  %614 = mul i64 %613, %609
  %615 = icmp ult i64 %614, 4294967296
  br i1 %615, label %617, label %616

616:                                              ; preds = %606
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.6.41, i64 0, i64 0)) #16
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %477) #18
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %269) #18
  br label %922

617:                                              ; preds = %606
  %618 = icmp sgt i32 %479, 2
  %619 = select i1 %618, i32 %479, i32 2
  %620 = bitcast [8 x i32]* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %620) #18
  %621 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 0
  store i32 14, i32* %621, align 4, !tbaa !16
  %622 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 1
  %623 = shl i32 %619, 2
  %624 = add i32 %623, 4
  %625 = and i32 %624, -8
  %626 = trunc i64 %614 to i32
  %627 = add i32 %476, 40
  %628 = add i32 %627, %625
  %629 = add i32 %628, %626
  store i32 %629, i32* %622, align 4, !tbaa !16
  %630 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 2
  store i32 6, i32* %630, align 4, !tbaa !16
  %631 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 3
  store i32 8, i32* %631, align 4, !tbaa !16
  %632 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 4
  %633 = sext i32 %2 to i64
  %634 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, i64 0, i64 %633
  %635 = load i8, i8* %634, align 1, !tbaa !38
  %636 = zext i8 %635 to i32
  store i32 %636, i32* %632, align 4, !tbaa !16
  %637 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 5
  store i32 1, i32* %637, align 4, !tbaa !16
  %638 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 6
  store i32 5, i32* %638, align 4, !tbaa !16
  %639 = getelementptr inbounds [8 x i32], [8 x i32]* %12, i64 0, i64 7
  store i32 %623, i32* %639, align 4, !tbaa !16
  %640 = call i64 @fwrite(i8* nonnull %620, i64 32, i64 1, i8* nonnull %35) #16
  %641 = icmp eq i64 %640, 0
  br i1 %641, label %686, label %642

642:                                              ; preds = %617
  %643 = bitcast [4 x i32]* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %643) #18
  %644 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 0
  %645 = load i32, i32* %40, align 4, !tbaa !79
  store i32 %645, i32* %644, align 4, !tbaa !16
  %646 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 1
  %647 = load i32, i32* %42, align 4, !tbaa !79
  store i32 %647, i32* %646, align 4, !tbaa !16
  %648 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 2
  %649 = load i32, i32* %45, align 4, !tbaa !79
  store i32 %649, i32* %648, align 4, !tbaa !16
  %650 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 3
  %651 = load i32, i32* %47, align 4, !tbaa !79
  store i32 %651, i32* %650, align 4, !tbaa !16
  %652 = sext i32 %625 to i64
  %653 = call i64 @fwrite(i8* nonnull %643, i64 %652, i64 1, i8* nonnull %35) #16
  %654 = icmp eq i64 %653, 0
  br i1 %654, label %682, label %655

655:                                              ; preds = %642
  %656 = bitcast [2 x i32]* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %656) #18
  %657 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 0
  store i32 1, i32* %657, align 4, !tbaa !16
  %658 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 1
  store i32 %268, i32* %658, align 4, !tbaa !16
  %659 = call i64 @fwrite(i8* nonnull %656, i64 8, i64 1, i8* nonnull %35) #16
  %660 = icmp eq i64 %659, 0
  br i1 %660, label %678, label %661

661:                                              ; preds = %655
  %662 = zext i32 %476 to i64
  %663 = call i64 @fwrite(i8* nonnull %269, i64 %662, i64 1, i8* nonnull %35) #16
  %664 = icmp eq i64 %663, 0
  br i1 %664, label %678, label %665

665:                                              ; preds = %661
  %666 = add i32 %626, 7
  %667 = and i32 %666, 7
  %668 = xor i32 %667, 7
  %669 = bitcast [2 x i32]* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %669) #18
  %670 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 0
  %671 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, i64 0, i64 %633
  %672 = load i8, i8* %671, align 1, !tbaa !38
  %673 = zext i8 %672 to i32
  store i32 %673, i32* %670, align 4, !tbaa !16
  %674 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 1
  store i32 %626, i32* %674, align 4, !tbaa !16
  %675 = call i64 @fwrite(i8* nonnull %669, i64 8, i64 1, i8* nonnull %35) #16
  %676 = icmp eq i64 %675, 0
  %677 = zext i1 %676 to i32
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %669) #18
  br label %678

678:                                              ; preds = %665, %661, %655
  %679 = phi i32 [ %668, %665 ], [ 0, %655 ], [ 0, %661 ]
  %680 = phi i32 [ %677, %665 ], [ 1, %655 ], [ 1, %661 ]
  %681 = phi i32 [ -11, %665 ], [ -9, %655 ], [ -10, %661 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %656) #18
  br label %682

682:                                              ; preds = %678, %642
  %683 = phi i32 [ %679, %678 ], [ 0, %642 ]
  %684 = phi i32 [ %680, %678 ], [ 1, %642 ]
  %685 = phi i32 [ %681, %678 ], [ -8, %642 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %643) #18
  br label %686

686:                                              ; preds = %682, %617
  %687 = phi i32 [ %683, %682 ], [ 0, %617 ]
  %688 = phi i32 [ %684, %682 ], [ 1, %617 ]
  %689 = phi i32 [ %685, %682 ], [ -7, %617 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %620) #18
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %477) #18
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %269) #18
  %690 = icmp eq i32 %688, 0
  br i1 %690, label %704, label %922

691:                                              ; preds = %242
  %692 = bitcast [5 x i32]* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %692) #18
  %693 = getelementptr inbounds [5 x i32], [5 x i32]* %16, i64 0, i64 0
  %694 = load i32, i32* %40, align 4, !tbaa !79
  store i32 %694, i32* %693, align 4, !tbaa !16
  %695 = getelementptr inbounds [5 x i32], [5 x i32]* %16, i64 0, i64 1
  %696 = load i32, i32* %42, align 4, !tbaa !79
  store i32 %696, i32* %695, align 4, !tbaa !16
  %697 = getelementptr inbounds [5 x i32], [5 x i32]* %16, i64 0, i64 2
  %698 = load i32, i32* %45, align 4, !tbaa !79
  store i32 %698, i32* %697, align 4, !tbaa !16
  %699 = getelementptr inbounds [5 x i32], [5 x i32]* %16, i64 0, i64 3
  %700 = load i32, i32* %47, align 4, !tbaa !79
  store i32 %700, i32* %699, align 4, !tbaa !16
  %701 = getelementptr inbounds [5 x i32], [5 x i32]* %16, i64 0, i64 4
  store i32 %2, i32* %701, align 4, !tbaa !16
  %702 = call i64 @fwrite(i8* nonnull %692, i64 20, i64 1, i8* nonnull %35) #16
  %703 = icmp eq i64 %702, 0
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %692) #18
  br i1 %703, label %922, label %704

704:                                              ; preds = %691, %686, %239
  %705 = phi i32 [ %687, %686 ], [ 0, %691 ], [ 0, %239 ]
  %706 = getelementptr inbounds [4096 x i8], [4096 x i8]* %17, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %706) #18
  %707 = udiv i32 4096, %95
  %708 = load i32, i32* %47, align 4, !tbaa !79
  %709 = icmp sgt i32 %708, 0
  br i1 %709, label %710, label %909

710:                                              ; preds = %704
  %711 = load i32, i32* %46, align 4, !tbaa !82
  %712 = bitcast [4 x i32]* %18 to i8*
  %713 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0, i64 0
  %714 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0, i64 1
  %715 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0, i64 2
  %716 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0, i64 3
  %717 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %718 = zext i32 %95 to i64
  %719 = mul nuw nsw i32 %707, %95
  %720 = zext i32 %719 to i64
  %721 = load i32, i32* %44, align 4, !tbaa !82
  %722 = load i32, i32* %45, align 4, !tbaa !79
  br label %723

723:                                              ; preds = %891, %710
  %724 = phi i32 [ %711, %710 ], [ %892, %891 ]
  %725 = phi i32 [ %708, %710 ], [ %893, %891 ]
  %726 = phi i32 [ %721, %710 ], [ %894, %891 ]
  %727 = phi i32 [ %722, %710 ], [ %895, %891 ]
  %728 = phi i32 [ %722, %710 ], [ %896, %891 ]
  %729 = phi i32 [ %721, %710 ], [ %897, %891 ]
  %730 = phi i32 [ %711, %710 ], [ %899, %891 ]
  %731 = phi i32 [ 0, %710 ], [ %898, %891 ]
  %732 = icmp sgt i32 %728, 0
  br i1 %732, label %733, label %891

733:                                              ; preds = %723
  %734 = load i32, i32* %41, align 4, !tbaa !82
  %735 = load i32, i32* %42, align 4, !tbaa !79
  br label %736

736:                                              ; preds = %877, %733
  %737 = phi i32 [ %878, %877 ], [ %734, %733 ]
  %738 = phi i32 [ %879, %877 ], [ %735, %733 ]
  %739 = phi i32 [ %880, %877 ], [ %726, %733 ]
  %740 = phi i32 [ %881, %877 ], [ %727, %733 ]
  %741 = phi i32 [ %882, %877 ], [ %735, %733 ]
  %742 = phi i32 [ %883, %877 ], [ %734, %733 ]
  %743 = phi i32 [ %885, %877 ], [ %729, %733 ]
  %744 = phi i32 [ %884, %877 ], [ %731, %733 ]
  %745 = icmp sgt i32 %741, 0
  br i1 %745, label %.preheader25.preheader, label %877

.preheader25.preheader:                           ; preds = %736
  %.pre = load i32, i32* %40, align 4, !tbaa !79
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.preheader, %.loopexit24
  %746 = phi i32 [ %867, %.loopexit24 ], [ %737, %.preheader25.preheader ]
  %747 = phi i32 [ %868, %.loopexit24 ], [ %738, %.preheader25.preheader ]
  %748 = phi i32 [ %869, %.loopexit24 ], [ %.pre, %.preheader25.preheader ]
  %749 = phi i32 [ %871, %.loopexit24 ], [ %742, %.preheader25.preheader ]
  %750 = phi i32 [ %870, %.loopexit24 ], [ %744, %.preheader25.preheader ]
  %751 = icmp sgt i32 %748, 0
  br i1 %751, label %752, label %.loopexit24

752:                                              ; preds = %.preheader25
  %753 = load i32, i32* %39, align 4, !tbaa !82
  br label %754

754:                                              ; preds = %860, %752
  %755 = phi i32 [ %862, %860 ], [ %753, %752 ]
  %756 = phi i32 [ %861, %860 ], [ %750, %752 ]
  %757 = add nsw i32 %756, 1
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %712) #18
  store i32 %755, i32* %713, align 4, !tbaa !16
  store i32 %749, i32* %714, align 4, !tbaa !16
  store i32 %743, i32* %715, align 4, !tbaa !16
  store i32 %730, i32* %716, align 4, !tbaa !16
  %758 = load i32, i32* %29, align 4, !tbaa !76
  %759 = icmp sgt i32 %758, 0
  br i1 %759, label %760, label %.loopexit

760:                                              ; preds = %754
  %761 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %717, align 8, !tbaa !77
  %762 = zext i32 %758 to i64
  %763 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 0, i32 2
  %764 = load i32, i32* %763, align 4, !tbaa !83
  %765 = sext i32 %764 to i64
  %766 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 0, i32 0
  %767 = load i32, i32* %766, align 4, !tbaa !82
  %768 = sub nsw i32 %755, %767
  %769 = sext i32 %768 to i64
  %770 = mul nsw i64 %769, %765
  %771 = icmp eq i32 %758, 1
  br i1 %771, label %.loopexit, label %.preheader.preheader, !llvm.loop !121

.preheader.preheader:                             ; preds = %760
  %772 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 1, i32 2
  %773 = load i32, i32* %772, align 4, !tbaa !83
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 1, i32 0
  %776 = load i32, i32* %775, align 4, !tbaa !82
  %777 = sub nsw i32 %749, %776
  %778 = sext i32 %777 to i64
  %779 = mul nsw i64 %778, %774
  %780 = add nsw i64 %779, %770
  %781 = icmp eq i32 %758, 2
  br i1 %781, label %.loopexit, label %.preheader..preheader_crit_edge.lr.ph, !llvm.loop !121

.preheader..preheader_crit_edge.lr.ph:            ; preds = %.preheader.preheader
  %782 = add nsw i64 %762, -2
  %min.iters.check228 = icmp ult i64 %782, 17
  br i1 %min.iters.check228, label %.preheader..preheader_crit_edge.preheader, label %vector.ph229

vector.ph229:                                     ; preds = %.preheader..preheader_crit_edge.lr.ph
  %n.mod.vf230 = and i64 %782, 15
  %783 = icmp eq i64 %n.mod.vf230, 0
  %784 = select i1 %783, i64 16, i64 %n.mod.vf230
  %n.vec231 = sub nsw i64 %782, %784
  %ind.end235 = add nsw i64 %n.vec231, 2
  %785 = insertelement <4 x i64> <i64 poison, i64 0, i64 0, i64 0>, i64 %780, i32 0
  br label %vector.body227

vector.body227:                                   ; preds = %vector.body227, %vector.ph229
  %index232 = phi i64 [ 0, %vector.ph229 ], [ %index.next233, %vector.body227 ]
  %vec.phi238 = phi <4 x i64> [ %785, %vector.ph229 ], [ %825, %vector.body227 ]
  %vec.phi239 = phi <4 x i64> [ zeroinitializer, %vector.ph229 ], [ %826, %vector.body227 ]
  %vec.phi240 = phi <4 x i64> [ zeroinitializer, %vector.ph229 ], [ %827, %vector.body227 ]
  %vec.phi241 = phi <4 x i64> [ zeroinitializer, %vector.ph229 ], [ %828, %vector.body227 ]
  %offset.idx237 = or i64 %index232, 2
  %786 = or i64 %index232, 6
  %787 = or i64 %index232, 10
  %788 = or i64 %index232, 14
  %789 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0, i64 %offset.idx237
  %790 = bitcast i32* %789 to <4 x i32>*
  %wide.load242 = load <4 x i32>, <4 x i32>* %790, align 4, !tbaa !16
  %791 = getelementptr inbounds i32, i32* %789, i64 4
  %792 = bitcast i32* %791 to <4 x i32>*
  %wide.load243 = load <4 x i32>, <4 x i32>* %792, align 4, !tbaa !16
  %793 = getelementptr inbounds i32, i32* %789, i64 8
  %794 = bitcast i32* %793 to <4 x i32>*
  %wide.load244 = load <4 x i32>, <4 x i32>* %794, align 4, !tbaa !16
  %795 = getelementptr inbounds i32, i32* %789, i64 12
  %796 = bitcast i32* %795 to <4 x i32>*
  %wide.load245 = load <4 x i32>, <4 x i32>* %796, align 4, !tbaa !16
  %797 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 %offset.idx237, i32 2
  %798 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 %786, i32 2
  %799 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 %787, i32 2
  %800 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 %788, i32 2
  %801 = getelementptr inbounds i32, i32* %797, i64 -2
  %802 = bitcast i32* %801 to <16 x i32>*
  %803 = getelementptr inbounds i32, i32* %798, i64 -2
  %804 = bitcast i32* %803 to <16 x i32>*
  %805 = getelementptr inbounds i32, i32* %799, i64 -2
  %806 = bitcast i32* %805 to <16 x i32>*
  %807 = getelementptr inbounds i32, i32* %800, i64 -2
  %808 = bitcast i32* %807 to <16 x i32>*
  %wide.vec246 = load <16 x i32>, <16 x i32>* %802, align 4, !tbaa !16
  %wide.vec247 = load <16 x i32>, <16 x i32>* %804, align 4, !tbaa !16
  %wide.vec248 = load <16 x i32>, <16 x i32>* %806, align 4, !tbaa !16
  %wide.vec249 = load <16 x i32>, <16 x i32>* %808, align 4, !tbaa !16
  %strided.vec250 = shufflevector <16 x i32> %wide.vec246, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec251 = shufflevector <16 x i32> %wide.vec247, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec252 = shufflevector <16 x i32> %wide.vec248, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec253 = shufflevector <16 x i32> %wide.vec249, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec254 = shufflevector <16 x i32> %wide.vec246, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec255 = shufflevector <16 x i32> %wide.vec247, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec256 = shufflevector <16 x i32> %wide.vec248, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec257 = shufflevector <16 x i32> %wide.vec249, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %809 = sext <4 x i32> %strided.vec254 to <4 x i64>
  %810 = sext <4 x i32> %strided.vec255 to <4 x i64>
  %811 = sext <4 x i32> %strided.vec256 to <4 x i64>
  %812 = sext <4 x i32> %strided.vec257 to <4 x i64>
  %813 = sub nsw <4 x i32> %wide.load242, %strided.vec250
  %814 = sub nsw <4 x i32> %wide.load243, %strided.vec251
  %815 = sub nsw <4 x i32> %wide.load244, %strided.vec252
  %816 = sub nsw <4 x i32> %wide.load245, %strided.vec253
  %817 = sext <4 x i32> %813 to <4 x i64>
  %818 = sext <4 x i32> %814 to <4 x i64>
  %819 = sext <4 x i32> %815 to <4 x i64>
  %820 = sext <4 x i32> %816 to <4 x i64>
  %821 = mul nsw <4 x i64> %817, %809
  %822 = mul nsw <4 x i64> %818, %810
  %823 = mul nsw <4 x i64> %819, %811
  %824 = mul nsw <4 x i64> %820, %812
  %825 = add <4 x i64> %821, %vec.phi238
  %826 = add <4 x i64> %822, %vec.phi239
  %827 = add <4 x i64> %823, %vec.phi240
  %828 = add <4 x i64> %824, %vec.phi241
  %index.next233 = add i64 %index232, 16
  %829 = icmp eq i64 %index.next233, %n.vec231
  br i1 %829, label %middle.block225, label %vector.body227, !llvm.loop !122

middle.block225:                                  ; preds = %vector.body227
  %bin.rdx258 = add <4 x i64> %826, %825
  %bin.rdx259 = add <4 x i64> %827, %bin.rdx258
  %bin.rdx260 = add <4 x i64> %828, %bin.rdx259
  %830 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx260)
  br label %.preheader..preheader_crit_edge.preheader

.preheader..preheader_crit_edge.preheader:        ; preds = %middle.block225, %.preheader..preheader_crit_edge.lr.ph
  %.ph = phi i64 [ 2, %.preheader..preheader_crit_edge.lr.ph ], [ %ind.end235, %middle.block225 ]
  %.ph264 = phi i64 [ %780, %.preheader..preheader_crit_edge.lr.ph ], [ %830, %middle.block225 ]
  br label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader..preheader_crit_edge.preheader, %.preheader..preheader_crit_edge
  %831 = phi i64 [ %842, %.preheader..preheader_crit_edge ], [ %.ph, %.preheader..preheader_crit_edge.preheader ]
  %832 = phi i64 [ %841, %.preheader..preheader_crit_edge ], [ %.ph264, %.preheader..preheader_crit_edge.preheader ]
  %.phi.trans.insert = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0, i64 %831
  %.pre63 = load i32, i32* %.phi.trans.insert, align 4, !tbaa !16
  %833 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 %831, i32 2
  %834 = load i32, i32* %833, align 4, !tbaa !83
  %835 = sext i32 %834 to i64
  %836 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %761, i64 %831, i32 0
  %837 = load i32, i32* %836, align 4, !tbaa !82
  %838 = sub nsw i32 %.pre63, %837
  %839 = sext i32 %838 to i64
  %840 = mul nsw i64 %839, %835
  %841 = add nsw i64 %840, %832
  %842 = add nuw nsw i64 %831, 1
  %843 = icmp eq i64 %842, %762
  br i1 %843, label %.loopexit, label %.preheader..preheader_crit_edge, !llvm.loop !123

.loopexit:                                        ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader, %760, %754
  %844 = phi i64 [ 0, %754 ], [ %770, %760 ], [ %780, %.preheader.preheader ], [ %841, %.preheader..preheader_crit_edge ]
  %845 = load i8*, i8** %20, align 8, !tbaa !73
  %846 = load i8, i8* %91, align 1, !tbaa !28
  %847 = zext i8 %846 to i64
  %848 = add nuw nsw i64 %847, 7
  %849 = lshr i64 %848, 3
  %850 = mul nsw i64 %849, %844
  %851 = getelementptr inbounds i8, i8* %845, i64 %850
  %852 = mul nsw i32 %756, %95
  %853 = sext i32 %852 to i64
  %854 = getelementptr inbounds [4096 x i8], [4096 x i8]* %17, i64 0, i64 %853
  %855 = call i8* @memcpy(i8* nonnull %854, i8* %851, i64 %718) #16
  %856 = icmp eq i32 %757, %707
  br i1 %856, label %857, label %860

857:                                              ; preds = %.loopexit
  %858 = call i64 @fwrite(i8* nonnull %706, i64 %720, i64 1, i8* nonnull %35) #16
  %859 = icmp eq i64 %858, 0
  br i1 %859, label %919, label %860

860:                                              ; preds = %857, %.loopexit
  %861 = phi i32 [ 0, %857 ], [ %757, %.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %712) #18
  %862 = add nsw i32 %755, 1
  %863 = load i32, i32* %40, align 4, !tbaa !79
  %864 = load i32, i32* %39, align 4, !tbaa !82
  %865 = add nsw i32 %864, %863
  %866 = icmp slt i32 %862, %865
  br i1 %866, label %754, label %.loopexit24.loopexit, !llvm.loop !124

.loopexit24.loopexit:                             ; preds = %860
  %.pre64 = load i32, i32* %42, align 4, !tbaa !79
  %.pre65 = load i32, i32* %41, align 4, !tbaa !82
  br label %.loopexit24

.loopexit24:                                      ; preds = %.loopexit24.loopexit, %.preheader25
  %867 = phi i32 [ %746, %.preheader25 ], [ %.pre65, %.loopexit24.loopexit ]
  %868 = phi i32 [ %747, %.preheader25 ], [ %.pre64, %.loopexit24.loopexit ]
  %869 = phi i32 [ %748, %.preheader25 ], [ %863, %.loopexit24.loopexit ]
  %870 = phi i32 [ %750, %.preheader25 ], [ %861, %.loopexit24.loopexit ]
  %871 = add nsw i32 %749, 1
  %872 = add nsw i32 %867, %868
  %873 = icmp slt i32 %871, %872
  br i1 %873, label %.preheader25, label %874, !llvm.loop !125

874:                                              ; preds = %.loopexit24
  %875 = load i32, i32* %45, align 4, !tbaa !79
  %876 = load i32, i32* %44, align 4, !tbaa !82
  br label %877

877:                                              ; preds = %874, %736
  %878 = phi i32 [ %737, %736 ], [ %867, %874 ]
  %879 = phi i32 [ %738, %736 ], [ %868, %874 ]
  %880 = phi i32 [ %739, %736 ], [ %876, %874 ]
  %881 = phi i32 [ %740, %736 ], [ %875, %874 ]
  %882 = phi i32 [ %741, %736 ], [ %868, %874 ]
  %883 = phi i32 [ %742, %736 ], [ %867, %874 ]
  %884 = phi i32 [ %744, %736 ], [ %870, %874 ]
  %885 = add nsw i32 %743, 1
  %886 = add nsw i32 %881, %880
  %887 = icmp slt i32 %885, %886
  br i1 %887, label %736, label %888, !llvm.loop !126

888:                                              ; preds = %877
  %889 = load i32, i32* %47, align 4, !tbaa !79
  %890 = load i32, i32* %46, align 4, !tbaa !82
  br label %891

891:                                              ; preds = %888, %723
  %892 = phi i32 [ %724, %723 ], [ %890, %888 ]
  %893 = phi i32 [ %725, %723 ], [ %889, %888 ]
  %894 = phi i32 [ %726, %723 ], [ %880, %888 ]
  %895 = phi i32 [ %727, %723 ], [ %881, %888 ]
  %896 = phi i32 [ %728, %723 ], [ %881, %888 ]
  %897 = phi i32 [ %729, %723 ], [ %880, %888 ]
  %898 = phi i32 [ %731, %723 ], [ %884, %888 ]
  %899 = add nsw i32 %730, 1
  %900 = add nsw i32 %893, %892
  %901 = icmp slt i32 %899, %900
  br i1 %901, label %723, label %902, !llvm.loop !127

902:                                              ; preds = %891
  %903 = icmp sgt i32 %898, 0
  br i1 %903, label %904, label %909

904:                                              ; preds = %902
  %905 = mul nsw i32 %898, %95
  %906 = sext i32 %905 to i64
  %907 = call i64 @fwrite(i8* nonnull %706, i64 %906, i64 1, i8* nonnull %35) #16
  %908 = icmp eq i64 %907, 0
  br i1 %908, label %920, label %909

909:                                              ; preds = %904, %902, %704
  %910 = bitcast i64* %19 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %910) #18
  store i64 0, i64* %19, align 8, !tbaa !64
  %911 = icmp eq i32 %705, 0
  br i1 %911, label %916, label %912

912:                                              ; preds = %909
  %913 = zext i32 %705 to i64
  %914 = call i64 @fwrite(i8* nonnull %910, i64 %913, i64 1, i8* nonnull %35) #16
  %915 = icmp eq i64 %914, 0
  br i1 %915, label %917, label %916

916:                                              ; preds = %912, %909
  br label %917

917:                                              ; preds = %916, %912
  %918 = phi i32 [ 0, %916 ], [ -16, %912 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %910) #18
  br label %920

919:                                              ; preds = %857
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %712) #18
  br label %920

920:                                              ; preds = %919, %917, %904
  %921 = phi i32 [ %918, %917 ], [ -14, %904 ], [ -13, %919 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %706) #18
  br label %922

922:                                              ; preds = %920, %691, %686, %616, %240
  %923 = phi i32 [ %921, %920 ], [ %241, %240 ], [ %689, %686 ], [ -12, %691 ], [ -6, %616 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %38) #18
  %924 = call i32 @fclose(i8* nonnull %35) #16
  br label %925

925:                                              ; preds = %922, %33, %32, %27
  %926 = phi i32 [ -1, %27 ], [ -1, %32 ], [ %923, %922 ], [ -2, %33 ]
  ret i32 %926

927:                                              ; preds = %51
  %928 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %53, i64 1
  %929 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1
  %930 = bitcast %struct.halide_dimension_t* %929 to i8*
  %931 = bitcast %struct.halide_dimension_t* %928 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %930, i8* nonnull align 4 dereferenceable(16) %931, i64 16, i1 false), !tbaa.struct !78
  %932 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1, i32 1
  %933 = load i32, i32* %932, align 4, !tbaa !79
  %934 = zext i32 %933 to i64
  %935 = mul nuw i64 %62, %934
  %exitcond.not.1 = icmp eq i64 %57, 2
  br i1 %exitcond.not.1, label %63, label %936, !llvm.loop !81

936:                                              ; preds = %927
  %937 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %53, i64 2
  %938 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2
  %939 = bitcast %struct.halide_dimension_t* %938 to i8*
  %940 = bitcast %struct.halide_dimension_t* %937 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %939, i8* nonnull align 4 dereferenceable(16) %940, i64 16, i1 false), !tbaa.struct !78
  %941 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2, i32 1
  %942 = load i32, i32* %941, align 4, !tbaa !79
  %943 = zext i32 %942 to i64
  %944 = mul i64 %935, %943
  %exitcond.not.2 = icmp eq i64 %57, 3
  br i1 %exitcond.not.2, label %63, label %945, !llvm.loop !81

945:                                              ; preds = %936
  %946 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %53, i64 3
  %947 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3
  %948 = bitcast %struct.halide_dimension_t* %947 to i8*
  %949 = bitcast %struct.halide_dimension_t* %946 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %948, i8* nonnull align 4 dereferenceable(16) %949, i64 16, i1 false), !tbaa.struct !78
  %950 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3, i32 1
  %951 = load i32, i32* %950, align 4, !tbaa !79
  %952 = zext i32 %951 to i64
  %953 = mul i64 %944, %952
  br label %63
}

declare i64 @fwrite(i8*, i64, i64, i8*) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define weak void @halide_cache_cleanup() #0 {
  tail call void @halide_memoization_cache_cleanup() #17
  ret void
}

; Function Attrs: nounwind mustprogress
define weak void @halide_memoization_cache_cleanup() local_unnamed_addr #0 {
  br label %2

1:                                                ; preds = %.loopexit
  store i64 0, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  ret void

2:                                                ; preds = %.loopexit, %0
  %3 = phi i64 [ 0, %0 ], [ %12, %.loopexit ]
  %4 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %3
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !12
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !12
  %6 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %5, null
  br i1 %6, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %2, %.preheader
  %7 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %9, %.preheader ], [ %5, %2 ]
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %7, i64 0, i32 0
  %9 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %8, align 8, !tbaa !128
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %7) #17
  %10 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %7 to i8*
  tail call void @halide_free(i8* null, i8* nonnull %10) #16
  %11 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %9, null
  br i1 %11, label %.loopexit, label %.preheader, !llvm.loop !131

.loopexit:                                        ; preds = %.preheader, %2
  %12 = add nuw nsw i64 %3, 1
  %13 = icmp eq i64 %12, 256
  br i1 %13, label %1, label %2, !llvm.loop !132
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %0) local_unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 8
  %3 = load i32, i32* %2, align 8, !tbaa !133
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %.loopexit, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 11
  br label %9

.loopexit:                                        ; preds = %9, %1
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 3
  %8 = load i8*, i8** %7, align 8, !tbaa !134
  tail call void @halide_free(i8* null, i8* %8) #16
  ret void

9:                                                ; preds = %9, %5
  %10 = phi i64 [ 0, %5 ], [ %19, %9 ]
  %11 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !135
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %11, i64 %10
  %13 = tail call i32 @halide_device_free(i8* null, %struct.halide_buffer_t* %12) #16
  %14 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !135
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %14, i64 %10, i32 2
  %16 = load i8*, i8** %15, align 8, !tbaa !73
  %17 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %16) #17
  %18 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %17 to i8*
  tail call void @halide_free(i8* null, i8* %18) #16
  %19 = add nuw nsw i64 %10, 1
  %20 = load i32, i32* %2, align 8, !tbaa !133
  %21 = zext i32 %20 to i64
  %22 = icmp ult i64 %19, %21
  br i1 %22, label %9, label %.loopexit, !llvm.loop !136
}

; Function Attrs: nounwind willreturn mustprogress
define linkonce %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %0) local_unnamed_addr #2 {
  %2 = getelementptr inbounds i8, i8* %0, i64 -64
  %3 = bitcast i8* %2 to %"struct.Halide::Runtime::Internal::CacheBlockHeader"*
  ret %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %0, i32 %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %1, -1
  br i1 %5, label %.preheader, label %.loopexit2

.preheader:                                       ; preds = %4, %11
  %6 = phi i32 [ %12, %11 ], [ %1, %4 ]
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 3, i64 %7
  %9 = load i64, i64* %8, align 8, !tbaa !64
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %11, label %.loopexit2

11:                                               ; preds = %.preheader
  %12 = add nsw i32 %6, -1
  %13 = icmp sgt i32 %6, 0
  br i1 %13, label %.preheader, label %.loopexit3, !llvm.loop !137

.loopexit2:                                       ; preds = %.preheader, %4
  %14 = phi i32 [ %1, %4 ], [ %6, %.preheader ]
  %15 = icmp eq i32 %14, -1
  br i1 %15, label %.loopexit3, label %16

16:                                               ; preds = %.loopexit2
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 3, i64 %17
  %19 = load i64, i64* %18, align 8, !tbaa !64
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %.loopexit, label %21

21:                                               ; preds = %16
  %22 = add nsw i32 %14, -1
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 4, i64 %17
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 5, i64 %17
  br label %36

.loopexit3:                                       ; preds = %11, %.loopexit2
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 0
  %26 = load i64, i64* %25, align 8, !tbaa !138
  %27 = add i64 %26, %2
  %28 = inttoptr i64 %27 to i8*
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 1
  %30 = load i64, i64* %29, align 8, !tbaa !140
  %31 = add i64 %30, %3
  %32 = inttoptr i64 %31 to i8*
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 6
  %34 = load i64, i64* %33, align 8, !tbaa !141
  %35 = tail call i8* @memcpy(i8* %32, i8* %28, i64 %34) #16
  br label %.loopexit

36:                                               ; preds = %36, %21
  %37 = phi i64 [ 0, %21 ], [ %44, %36 ]
  %38 = phi i64 [ %2, %21 ], [ %41, %36 ]
  %39 = phi i64 [ %3, %21 ], [ %43, %36 ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %0, i32 %22, i64 %38, i64 %39) #17
  %40 = load i64, i64* %23, align 8, !tbaa !64
  %41 = add i64 %40, %38
  %42 = load i64, i64* %24, align 8, !tbaa !64
  %43 = add i64 %42, %39
  %44 = add nuw i64 %37, 1
  %45 = load i64, i64* %18, align 8, !tbaa !64
  %46 = icmp ult i64 %44, %45
  br i1 %46, label %36, label %.loopexit, !llvm.loop !142

.loopexit:                                        ; preds = %36, %.loopexit3, %16
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %0, i8* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !138
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 1
  %6 = load i64, i64* %5, align 8, !tbaa !140
  %7 = icmp eq i64 %4, %6
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 2
  %10 = load i64, i64* %9, align 8, !tbaa !143
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %0, i32 15, i64 %10, i64 0) #17
  br label %11

11:                                               ; preds = %8, %2
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* noalias sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %0, %struct.halide_buffer_t* %1, i1 zeroext %2, %struct.halide_buffer_t* %3, i1 zeroext %4) local_unnamed_addr #0 {
  %6 = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %7 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %7) #18
  br i1 %2, label %8, label %12

8:                                                ; preds = %5
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %10 = load i8*, i8** %9, align 8, !tbaa !73
  %11 = ptrtoint i8* %10 to i64
  br label %15

12:                                               ; preds = %5
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %14 = load i64, i64* %13, align 8, !tbaa !75
  br label %15

15:                                               ; preds = %12, %8
  %16 = phi i64 [ %11, %8 ], [ %14, %12 ]
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 0
  store i64 %16, i64* %17, align 8, !tbaa !138
  br i1 %4, label %18, label %22

18:                                               ; preds = %15
  %19 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %20 = load i8*, i8** %19, align 8, !tbaa !73
  %21 = ptrtoint i8* %20 to i64
  br label %25

22:                                               ; preds = %15
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %24 = load i64, i64* %23, align 8, !tbaa !75
  br label %25

25:                                               ; preds = %22, %18
  %26 = phi i64 [ %21, %18 ], [ %24, %22 ]
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 1
  store i64 %26, i64* %27, align 8, !tbaa !140
  %28 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 4, i32 1
  %29 = load i8, i8* %28, align 1, !tbaa !28
  %30 = zext i8 %29 to i32
  %31 = add nuw nsw i32 %30, 7
  %32 = lshr i32 %31, 3
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 6
  store i64 %33, i64* %34, align 8, !tbaa !141
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 0
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 0
  %37 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 0
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 1
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 1
  %40 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 1
  %41 = bitcast i64* %35 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %41, align 8, !tbaa !64
  %42 = bitcast i64* %36 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %42, align 8, !tbaa !64
  %43 = bitcast i64* %37 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %43, align 8, !tbaa !64
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 4
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 4
  %46 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 4
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 5
  %48 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 5
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 5
  %50 = bitcast i64* %44 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %50, align 8, !tbaa !64
  %51 = bitcast i64* %45 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %51, align 8, !tbaa !64
  %52 = bitcast i64* %46 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %52, align 8, !tbaa !64
  %53 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 8
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 8
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 8
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 9
  %57 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 9
  %58 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 9
  %59 = bitcast i64* %53 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %59, align 8, !tbaa !64
  %60 = bitcast i64* %54 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %60, align 8, !tbaa !64
  %61 = bitcast i64* %55 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %61, align 8, !tbaa !64
  %62 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 12
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 12
  %64 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 12
  %65 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 13
  %66 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 13
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 13
  %68 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 14
  %69 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 14
  %70 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 14
  %71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 15
  %72 = bitcast i64* %62 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %72, align 8, !tbaa !64
  %73 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 15
  %74 = bitcast i64* %63 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %74, align 8, !tbaa !64
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 15
  %76 = bitcast i64* %64 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %76, align 8, !tbaa !64
  %77 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 2
  %78 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %79 = load i32, i32* %78, align 4, !tbaa !76
  %80 = icmp sgt i32 %79, 0
  br i1 %80, label %81, label %.loopexit9

81:                                               ; preds = %25
  %82 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %83 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %82, align 8, !tbaa !77
  %84 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %85 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %84, align 8, !tbaa !77
  %86 = zext i32 %79 to i64
  %min.iters.check = icmp ult i32 %79, 17
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

scalar.ph.preheader:                              ; preds = %middle.block, %81
  %.ph = phi i64 [ 0, %81 ], [ %n.vec, %middle.block ]
  %.ph33 = phi i64 [ 0, %81 ], [ %137, %middle.block ]
  br label %scalar.ph

vector.ph:                                        ; preds = %81
  %n.mod.vf = and i64 %86, 15
  %87 = icmp eq i64 %n.mod.vf, 0
  %88 = select i1 %87, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %86, %88
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %132, %vector.body ]
  %vec.phi10 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %133, %vector.body ]
  %vec.phi11 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %134, %vector.body ]
  %vec.phi12 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %135, %vector.body ]
  %89 = or i64 %index, 4
  %90 = or i64 %index, 8
  %91 = or i64 %index, 12
  %92 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %index, i32 2
  %93 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %89, i32 2
  %94 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %90, i32 2
  %95 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %91, i32 2
  %96 = getelementptr inbounds i32, i32* %92, i64 -2
  %97 = bitcast i32* %96 to <16 x i32>*
  %98 = getelementptr inbounds i32, i32* %93, i64 -2
  %99 = bitcast i32* %98 to <16 x i32>*
  %100 = getelementptr inbounds i32, i32* %94, i64 -2
  %101 = bitcast i32* %100 to <16 x i32>*
  %102 = getelementptr inbounds i32, i32* %95, i64 -2
  %103 = bitcast i32* %102 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %97, align 4, !tbaa !16
  %wide.vec13 = load <16 x i32>, <16 x i32>* %99, align 4, !tbaa !16
  %wide.vec14 = load <16 x i32>, <16 x i32>* %101, align 4, !tbaa !16
  %wide.vec15 = load <16 x i32>, <16 x i32>* %103, align 4, !tbaa !16
  %strided.vec19 = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec20 = shufflevector <16 x i32> %wide.vec13, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec21 = shufflevector <16 x i32> %wide.vec14, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec22 = shufflevector <16 x i32> %wide.vec15, <16 x i32> poison, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %104 = sext <4 x i32> %strided.vec19 to <4 x i64>
  %105 = sext <4 x i32> %strided.vec20 to <4 x i64>
  %106 = sext <4 x i32> %strided.vec21 to <4 x i64>
  %107 = sext <4 x i32> %strided.vec22 to <4 x i64>
  %108 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %85, i64 %index, i32 0
  %109 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %85, i64 %89, i32 0
  %110 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %85, i64 %90, i32 0
  %111 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %85, i64 %91, i32 0
  %112 = bitcast i32* %108 to <16 x i32>*
  %113 = bitcast i32* %109 to <16 x i32>*
  %114 = bitcast i32* %110 to <16 x i32>*
  %115 = bitcast i32* %111 to <16 x i32>*
  %wide.vec23 = load <16 x i32>, <16 x i32>* %112, align 4, !tbaa !82
  %wide.vec24 = load <16 x i32>, <16 x i32>* %113, align 4, !tbaa !82
  %wide.vec25 = load <16 x i32>, <16 x i32>* %114, align 4, !tbaa !82
  %wide.vec26 = load <16 x i32>, <16 x i32>* %115, align 4, !tbaa !82
  %116 = sub nsw <16 x i32> %wide.vec23, %wide.vec
  %117 = shufflevector <16 x i32> %116, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %118 = sub nsw <16 x i32> %wide.vec24, %wide.vec13
  %119 = shufflevector <16 x i32> %118, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %120 = sub nsw <16 x i32> %wide.vec25, %wide.vec14
  %121 = shufflevector <16 x i32> %120, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %122 = sub nsw <16 x i32> %wide.vec26, %wide.vec15
  %123 = shufflevector <16 x i32> %122, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %124 = sext <4 x i32> %117 to <4 x i64>
  %125 = sext <4 x i32> %119 to <4 x i64>
  %126 = sext <4 x i32> %121 to <4 x i64>
  %127 = sext <4 x i32> %123 to <4 x i64>
  %128 = mul nsw <4 x i64> %124, %104
  %129 = mul nsw <4 x i64> %125, %105
  %130 = mul nsw <4 x i64> %126, %106
  %131 = mul nsw <4 x i64> %127, %107
  %132 = add <4 x i64> %128, %vec.phi
  %133 = add <4 x i64> %129, %vec.phi10
  %134 = add <4 x i64> %130, %vec.phi11
  %135 = add <4 x i64> %131, %vec.phi12
  %index.next = add i64 %index, 16
  %136 = icmp eq i64 %index.next, %n.vec
  br i1 %136, label %middle.block, label %vector.body, !llvm.loop !144

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %133, %132
  %bin.rdx31 = add <4 x i64> %134, %bin.rdx
  %bin.rdx32 = add <4 x i64> %135, %bin.rdx31
  %137 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx32)
  br label %scalar.ph.preheader

.loopexit9:                                       ; preds = %scalar.ph, %25
  %138 = phi i64 [ 0, %25 ], [ %155, %scalar.ph ]
  %139 = mul i64 %138, %33
  store i64 %139, i64* %77, align 8, !tbaa !143
  %140 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 5
  %141 = load i32, i32* %140, align 4, !tbaa !76
  %142 = icmp eq i32 %79, %141
  br i1 %142, label %158, label %167

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %143 = phi i64 [ %156, %scalar.ph ], [ %.ph, %scalar.ph.preheader ]
  %144 = phi i64 [ %155, %scalar.ph ], [ %.ph33, %scalar.ph.preheader ]
  %145 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %143, i32 2
  %146 = load i32, i32* %145, align 4, !tbaa !83
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %85, i64 %143, i32 0
  %149 = load i32, i32* %148, align 4, !tbaa !82
  %150 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %83, i64 %143, i32 0
  %151 = load i32, i32* %150, align 4, !tbaa !82
  %152 = sub nsw i32 %149, %151
  %153 = sext i32 %152 to i64
  %154 = mul nsw i64 %153, %147
  %155 = add i64 %154, %144
  %156 = add nuw nsw i64 %143, 1
  %157 = icmp eq i64 %156, %86
  br i1 %157, label %.loopexit9, label %scalar.ph, !llvm.loop !145

158:                                              ; preds = %.loopexit9
  %159 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4, i32 1
  %160 = load i8, i8* %159, align 1, !tbaa !28
  %161 = zext i8 %160 to i32
  %162 = add nuw nsw i32 %161, 7
  %163 = lshr i32 %162, 3
  %164 = icmp ne i32 %32, %163
  %165 = icmp sgt i32 %79, 16
  %166 = or i1 %165, %164
  br i1 %166, label %167, label %169

167:                                              ; preds = %158, %.loopexit9
  %168 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %168, i8 0, i64 416, i1 false)
  br label %332

169:                                              ; preds = %158
  %170 = icmp eq i32 %32, 0
  br i1 %170, label %178, label %171

171:                                              ; preds = %169
  br i1 %80, label %172, label %.loopexit

172:                                              ; preds = %171
  %173 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %174 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %173, align 8, !tbaa !77
  %175 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %176 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %175, align 8, !tbaa !77
  %177 = zext i32 %79 to i64
  br label %210

178:                                              ; preds = %169
  %179 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %179, i8 0, i64 416, i1 false)
  br label %332

180:                                              ; preds = %.loopexit8
  %181 = load i64, i64* %34, align 8, !tbaa !141
  %182 = load i64, i64* %36, align 8, !tbaa !64
  %183 = icmp eq i64 %181, %182
  br i1 %183, label %184, label %.loopexit

184:                                              ; preds = %180
  %185 = load i64, i64* %37, align 8, !tbaa !64
  %186 = bitcast i64* %38 to <4 x i64>*
  %187 = bitcast i64* %35 to <4 x i64>*
  %188 = bitcast i64* %39 to <4 x i64>*
  %189 = bitcast i64* %36 to <4 x i64>*
  %190 = bitcast i64* %40 to <4 x i64>*
  %191 = bitcast i64* %37 to <4 x i64>*
  %192 = bitcast i64* %47 to <4 x i64>*
  %193 = bitcast i64* %44 to <4 x i64>*
  %194 = bitcast i64* %48 to <4 x i64>*
  %195 = bitcast i64* %45 to <4 x i64>*
  %196 = bitcast i64* %49 to <4 x i64>*
  %197 = bitcast i64* %46 to <4 x i64>*
  %198 = bitcast i64* %56 to <4 x i64>*
  %199 = bitcast i64* %53 to <4 x i64>*
  %200 = bitcast i64* %57 to <4 x i64>*
  %201 = bitcast i64* %54 to <4 x i64>*
  %202 = bitcast i64* %58 to <4 x i64>*
  %203 = bitcast i64* %55 to <4 x i64>*
  %204 = bitcast i64* %65 to <2 x i64>*
  %205 = bitcast i64* %62 to <2 x i64>*
  %206 = bitcast i64* %66 to <2 x i64>*
  %207 = bitcast i64* %63 to <2 x i64>*
  %208 = bitcast i64* %67 to <2 x i64>*
  %209 = bitcast i64* %64 to <2 x i64>*
  br label %306

210:                                              ; preds = %.loopexit8, %172
  %211 = phi i64 [ 0, %172 ], [ %262, %.loopexit8 ]
  %212 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %174, i64 %211, i32 2
  %213 = load i32, i32* %212, align 4, !tbaa !83
  %214 = sext i32 %213 to i64
  %215 = mul nsw i64 %214, %33
  %216 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %176, i64 %211, i32 2
  %217 = load i32, i32* %216, align 4, !tbaa !83
  %218 = sext i32 %217 to i64
  %219 = mul nsw i64 %218, %33
  %220 = icmp eq i64 %211, 0
  br i1 %220, label %235, label %221

221:                                              ; preds = %210
  %222 = icmp eq i64 %215, 0
  br i1 %222, label %223, label %.preheader

223:                                              ; preds = %221
  %224 = trunc i64 %211 to i32
  br label %235

.preheader:                                       ; preds = %221, %229
  %225 = phi i64 [ %230, %229 ], [ 0, %221 ]
  %226 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %225
  %227 = load i64, i64* %226, align 8, !tbaa !64
  %228 = icmp ult i64 %215, %227
  br i1 %228, label %232, label %229

229:                                              ; preds = %.preheader
  %230 = add nuw nsw i64 %225, 1
  %231 = icmp eq i64 %230, %211
  br i1 %231, label %232, label %.preheader, !llvm.loop !146

232:                                              ; preds = %229, %.preheader
  %233 = phi i64 [ %211, %229 ], [ %225, %.preheader ]
  %234 = trunc i64 %233 to i32
  br label %235

235:                                              ; preds = %232, %223, %210
  %236 = phi i32 [ 0, %210 ], [ %234, %232 ], [ %224, %223 ]
  %237 = zext i32 %236 to i64
  %238 = icmp ugt i64 %211, %237
  br i1 %238, label %239, label %.loopexit8

239:                                              ; preds = %235
  %240 = sext i32 %236 to i64
  %241 = sub i64 %211, %240
  %242 = xor i64 %240, -1
  %243 = add i64 %211, %242
  %xtraiter = and i64 %241, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %239, %.prol.preheader
  %244 = phi i64 [ %245, %.prol.preheader ], [ %211, %239 ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %239 ]
  %245 = add nsw i64 %244, -1
  %246 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %245
  %247 = load i64, i64* %246, align 8, !tbaa !64
  %248 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %244
  store i64 %247, i64* %248, align 8, !tbaa !64
  %249 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %245
  %250 = load i64, i64* %249, align 8, !tbaa !64
  %251 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %244
  store i64 %250, i64* %251, align 8, !tbaa !64
  %252 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %245
  %253 = load i64, i64* %252, align 8, !tbaa !64
  %254 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %244
  store i64 %253, i64* %254, align 8, !tbaa !64
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %.prol.loopexit, label %.prol.preheader, !llvm.loop !147

.prol.loopexit:                                   ; preds = %.prol.preheader, %239
  %.unr = phi i64 [ %211, %239 ], [ %245, %.prol.preheader ]
  %255 = icmp ult i64 %243, 3
  br i1 %255, label %.loopexit8, label %.new

.loopexit8:                                       ; preds = %.prol.loopexit, %.new, %235
  %256 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %174, i64 %211, i32 1
  %257 = load i32, i32* %256, align 4, !tbaa !79
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %237
  store i64 %258, i64* %259, align 8, !tbaa !64
  %260 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %237
  store i64 %215, i64* %260, align 8, !tbaa !64
  %261 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %237
  store i64 %219, i64* %261, align 8, !tbaa !64
  %262 = add nuw nsw i64 %211, 1
  %263 = icmp eq i64 %262, %177
  br i1 %263, label %180, label %210, !llvm.loop !148

.new:                                             ; preds = %.prol.loopexit, %.new
  %264 = phi i64 [ %295, %.new ], [ %.unr, %.prol.loopexit ]
  %265 = add nsw i64 %264, -1
  %266 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %265
  %267 = load i64, i64* %266, align 8, !tbaa !64
  %268 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %264
  store i64 %267, i64* %268, align 8, !tbaa !64
  %269 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %265
  %270 = load i64, i64* %269, align 8, !tbaa !64
  %271 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %264
  store i64 %270, i64* %271, align 8, !tbaa !64
  %272 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %265
  %273 = load i64, i64* %272, align 8, !tbaa !64
  %274 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %264
  store i64 %273, i64* %274, align 8, !tbaa !64
  %275 = add nsw i64 %264, -2
  %276 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %275
  %277 = load i64, i64* %276, align 8, !tbaa !64
  %278 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %265
  store i64 %277, i64* %278, align 8, !tbaa !64
  %279 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %275
  %280 = load i64, i64* %279, align 8, !tbaa !64
  %281 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %265
  store i64 %280, i64* %281, align 8, !tbaa !64
  %282 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %275
  %283 = load i64, i64* %282, align 8, !tbaa !64
  %284 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %265
  store i64 %283, i64* %284, align 8, !tbaa !64
  %285 = add nsw i64 %264, -3
  %286 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %285
  %287 = load i64, i64* %286, align 8, !tbaa !64
  %288 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %275
  store i64 %287, i64* %288, align 8, !tbaa !64
  %289 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %285
  %290 = load i64, i64* %289, align 8, !tbaa !64
  %291 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %275
  store i64 %290, i64* %291, align 8, !tbaa !64
  %292 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %285
  %293 = load i64, i64* %292, align 8, !tbaa !64
  %294 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %275
  store i64 %293, i64* %294, align 8, !tbaa !64
  %295 = add nsw i64 %264, -4
  %296 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %295
  %297 = load i64, i64* %296, align 8, !tbaa !64
  %298 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %285
  store i64 %297, i64* %298, align 8, !tbaa !64
  %299 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %295
  %300 = load i64, i64* %299, align 8, !tbaa !64
  %301 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %285
  store i64 %300, i64* %301, align 8, !tbaa !64
  %302 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %295
  %303 = load i64, i64* %302, align 8, !tbaa !64
  %304 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %285
  store i64 %303, i64* %304, align 8, !tbaa !64
  %305 = icmp sgt i64 %295, %240
  br i1 %305, label %.new, label %.loopexit8, !llvm.loop !149

306:                                              ; preds = %310, %184
  %307 = phi i64 [ %185, %184 ], [ %330, %310 ]
  %308 = phi i64 [ %181, %184 ], [ %312, %310 ]
  %309 = icmp eq i64 %308, %307
  br i1 %309, label %310, label %.loopexit

310:                                              ; preds = %306
  %311 = load i64, i64* %35, align 8, !tbaa !64
  %312 = mul i64 %311, %307
  store i64 %312, i64* %34, align 8, !tbaa !141
  %313 = load <4 x i64>, <4 x i64>* %186, align 8, !tbaa !64
  store <4 x i64> %313, <4 x i64>* %187, align 8, !tbaa !64
  %314 = load <4 x i64>, <4 x i64>* %188, align 8, !tbaa !64
  store <4 x i64> %314, <4 x i64>* %189, align 8, !tbaa !64
  %315 = load <4 x i64>, <4 x i64>* %190, align 8, !tbaa !64
  store <4 x i64> %315, <4 x i64>* %191, align 8, !tbaa !64
  %316 = load <4 x i64>, <4 x i64>* %192, align 8, !tbaa !64
  store <4 x i64> %316, <4 x i64>* %193, align 8, !tbaa !64
  %317 = load <4 x i64>, <4 x i64>* %194, align 8, !tbaa !64
  store <4 x i64> %317, <4 x i64>* %195, align 8, !tbaa !64
  %318 = load <4 x i64>, <4 x i64>* %196, align 8, !tbaa !64
  store <4 x i64> %318, <4 x i64>* %197, align 8, !tbaa !64
  %319 = load <4 x i64>, <4 x i64>* %198, align 8, !tbaa !64
  store <4 x i64> %319, <4 x i64>* %199, align 8, !tbaa !64
  %320 = load <4 x i64>, <4 x i64>* %200, align 8, !tbaa !64
  store <4 x i64> %320, <4 x i64>* %201, align 8, !tbaa !64
  %321 = load <4 x i64>, <4 x i64>* %202, align 8, !tbaa !64
  store <4 x i64> %321, <4 x i64>* %203, align 8, !tbaa !64
  %322 = load <2 x i64>, <2 x i64>* %204, align 8, !tbaa !64
  store <2 x i64> %322, <2 x i64>* %205, align 8, !tbaa !64
  %323 = load <2 x i64>, <2 x i64>* %206, align 8, !tbaa !64
  store <2 x i64> %323, <2 x i64>* %207, align 8, !tbaa !64
  %324 = load <2 x i64>, <2 x i64>* %208, align 8, !tbaa !64
  store <2 x i64> %324, <2 x i64>* %209, align 8, !tbaa !64
  %325 = load i64, i64* %71, align 8, !tbaa !64
  store i64 %325, i64* %68, align 8, !tbaa !64
  %326 = load i64, i64* %73, align 8, !tbaa !64
  store i64 %326, i64* %69, align 8, !tbaa !64
  %327 = load i64, i64* %75, align 8, !tbaa !64
  store i64 %327, i64* %70, align 8, !tbaa !64
  store i64 1, i64* %71, align 8, !tbaa !64
  store i64 0, i64* %73, align 8, !tbaa !64
  store i64 0, i64* %75, align 8, !tbaa !64
  %328 = extractelement <4 x i64> %314, i32 0
  %329 = icmp eq i64 %312, %328
  %330 = extractelement <4 x i64> %315, i32 0
  br i1 %329, label %306, label %.loopexit, !llvm.loop !150

.loopexit:                                        ; preds = %310, %306, %180, %171
  %331 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(416) %331, i8* nonnull align 8 dereferenceable(416) %7, i64 416, i1 false), !tbaa.struct !151
  br label %332

332:                                              ; preds = %.loopexit, %178, %167
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %7) #18
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %0, i8* %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @memcmp(i8* %0, i8* %1, i64 %2) #16
  %5 = icmp eq i32 %4, 0
  ret i1 %5
}

declare i32 @memcmp(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %0, %struct.halide_dimension_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %0, i64 0, i32 5
  %4 = load i32, i32* %3, align 4, !tbaa !76
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %.loopexit

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %0, i64 0, i32 6
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %7, align 8, !tbaa !77
  %9 = zext i32 %4 to i64
  br label %11

10:                                               ; preds = %30
  %exitcond.not = icmp eq i64 %36, %9
  br i1 %exitcond.not, label %.loopexit, label %11, !llvm.loop !152

11:                                               ; preds = %10, %6
  %12 = phi i64 [ 0, %6 ], [ %36, %10 ]
  %13 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 0
  %14 = load i32, i32* %13, align 4, !tbaa !82
  %15 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 0
  %16 = load i32, i32* %15, align 4, !tbaa !82
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %18, label %.loopexit

18:                                               ; preds = %11
  %19 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 1
  %20 = load i32, i32* %19, align 4, !tbaa !79
  %21 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 1
  %22 = load i32, i32* %21, align 4, !tbaa !79
  %23 = icmp eq i32 %20, %22
  br i1 %23, label %24, label %.loopexit

24:                                               ; preds = %18
  %25 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 2
  %26 = load i32, i32* %25, align 4, !tbaa !83
  %27 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 2
  %28 = load i32, i32* %27, align 4, !tbaa !83
  %29 = icmp eq i32 %26, %28
  br i1 %29, label %30, label %.loopexit

30:                                               ; preds = %24
  %31 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %12, i32 3
  %32 = load i32, i32* %31, align 4, !tbaa !153
  %33 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %12, i32 3
  %34 = load i32, i32* %33, align 4, !tbaa !153
  %35 = icmp eq i32 %32, %34
  %36 = add nuw nsw i64 %12, 1
  br i1 %35, label %10, label %.loopexit

.loopexit:                                        ; preds = %30, %24, %18, %11, %10, %2
  %37 = phi i1 [ true, %2 ], [ false, %30 ], [ true, %10 ], [ false, %24 ], [ false, %18 ], [ false, %11 ]
  ret i1 %37
}

; Function Attrs: nounwind mustprogress
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %0, i8* %1, i64 %2, i32 %3, %struct.halide_buffer_t* %4, i32 %5, %struct.halide_buffer_t** %6, i1 zeroext %7, i64 %8) local_unnamed_addr #0 align 2 {
  %10 = zext i1 %7 to i8
  %11 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %0 to <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*>*
  store <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*> zeroinitializer, <2 x %"struct.Halide::Runtime::Internal::CacheEntry"*>* %11, align 8, !tbaa !12
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %12, align 8, !tbaa !154
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 4
  store i64 %2, i64* %13, align 8, !tbaa !155
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 6
  store i32 %3, i32* %14, align 8, !tbaa !156
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 7
  store i32 0, i32* %15, align 4, !tbaa !157
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 8
  store i32 %5, i32* %16, align 8, !tbaa !133
  %17 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 5
  %18 = load i32, i32* %17, align 4, !tbaa !76
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 9
  store i32 %18, i32* %19, align 4, !tbaa !158
  %20 = zext i32 %5 to i64
  %21 = mul nuw nsw i64 %20, 56
  %22 = sext i32 %18 to i64
  %23 = add i32 %5, 1
  %24 = zext i32 %23 to i64
  %25 = shl nuw nsw i64 %24, 4
  %26 = mul i64 %25, %22
  %27 = add i64 %26, %21
  %28 = add i64 %27, %2
  %29 = tail call i8* @halide_malloc(i8* null, i64 %28) #16
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 3
  store i8* %29, i8** %30, align 8, !tbaa !134
  %31 = icmp eq i8* %29, null
  br i1 %31, label %117, label %32

32:                                               ; preds = %9
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 11
  %34 = bitcast %struct.halide_buffer_t** %33 to i8**
  store i8* %29, i8** %34, align 8, !tbaa !135
  %35 = getelementptr inbounds i8, i8* %29, i64 %21
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 10
  %37 = bitcast %struct.halide_dimension_t** %36 to i8**
  store i8* %35, i8** %37, align 8, !tbaa !159
  %38 = getelementptr inbounds i8, i8* %29, i64 %27
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 5
  store i8* %38, i8** %39, align 8, !tbaa !160
  %40 = load i64, i64* %13, align 8, !tbaa !155
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %.loopexit6, label %42

42:                                               ; preds = %32
  %43 = load i8, i8* %1, align 1, !tbaa !38
  store i8 %43, i8* %38, align 1, !tbaa !38
  %44 = load i64, i64* %13, align 8, !tbaa !155
  %45 = icmp ugt i64 %44, 1
  br i1 %45, label %.preheader5, label %.loopexit6, !llvm.loop !161

.loopexit6:                                       ; preds = %.preheader5, %42, %32
  %46 = load i32, i32* %19, align 4, !tbaa !158
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %.loopexit4

48:                                               ; preds = %.loopexit6
  %49 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 6
  br label %60

.preheader5:                                      ; preds = %42, %.preheader5
  %50 = phi i64 [ %55, %.preheader5 ], [ 1, %42 ]
  %51 = load i8*, i8** %39, align 8, !tbaa !160
  %52 = getelementptr inbounds i8, i8* %1, i64 %50
  %53 = load i8, i8* %52, align 1, !tbaa !38
  %54 = getelementptr inbounds i8, i8* %51, i64 %50
  store i8 %53, i8* %54, align 1, !tbaa !38
  %55 = add nuw i64 %50, 1
  %56 = load i64, i64* %13, align 8, !tbaa !155
  %57 = icmp ult i64 %55, %56
  br i1 %57, label %.preheader5, label %.loopexit6, !llvm.loop !161

.loopexit4:                                       ; preds = %60, %.loopexit6
  %58 = load i32, i32* %16, align 8, !tbaa !133
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %.loopexit3, label %.preheader2

60:                                               ; preds = %60, %48
  %61 = phi i64 [ 0, %48 ], [ %68, %60 ]
  %62 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %49, align 8, !tbaa !77
  %63 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %62, i64 %61
  %64 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %36, align 8, !tbaa !159
  %65 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %64, i64 %61
  %66 = bitcast %struct.halide_dimension_t* %65 to i8*
  %67 = bitcast %struct.halide_dimension_t* %63 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %66, i8* nonnull align 4 dereferenceable(16) %67, i64 16, i1 false), !tbaa.struct !78
  %68 = add nuw nsw i64 %61, 1
  %69 = load i32, i32* %19, align 4, !tbaa !158
  %70 = sext i32 %69 to i64
  %71 = icmp slt i64 %68, %70
  br i1 %71, label %60, label %.loopexit4, !llvm.loop !162

.loopexit:                                        ; preds = %.preheader, %94, %.preheader2
  %72 = load i32, i32* %16, align 8, !tbaa !133
  %73 = zext i32 %72 to i64
  %74 = icmp ult i64 %85, %73
  br i1 %74, label %.preheader2, label %.loopexit3, !llvm.loop !163

.loopexit3:                                       ; preds = %.loopexit, %.loopexit4
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 13
  store i8 %10, i8* %75, align 8, !tbaa !164
  %76 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 12
  store i64 %8, i64* %76, align 8, !tbaa !165
  br label %117

.preheader2:                                      ; preds = %.loopexit4, %.loopexit
  %77 = phi i64 [ %85, %.loopexit ], [ 0, %.loopexit4 ]
  %78 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, i64 %77
  %79 = bitcast %struct.halide_buffer_t** %78 to i8**
  %80 = load i8*, i8** %79, align 8, !tbaa !12
  %81 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %33, align 8, !tbaa !135
  %82 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %81, i64 %77
  %83 = bitcast %struct.halide_buffer_t* %82 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %83, i8* nonnull align 8 dereferenceable(56) %80, i64 56, i1 false), !tbaa.struct !166
  %84 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %36, align 8, !tbaa !159
  %85 = add nuw nsw i64 %77, 1
  %86 = load i32, i32* %19, align 4, !tbaa !158
  %87 = trunc i64 %85 to i32
  %88 = mul i32 %86, %87
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %84, i64 %89
  %91 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %33, align 8, !tbaa !135
  %92 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %91, i64 %77, i32 6
  store %struct.halide_dimension_t* %90, %struct.halide_dimension_t** %92, align 8, !tbaa !77
  %93 = icmp sgt i32 %86, 0
  br i1 %93, label %94, label %.loopexit

94:                                               ; preds = %.preheader2
  %95 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %78, align 8, !tbaa !12
  %96 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %95, i64 0, i32 6
  %97 = bitcast %struct.halide_dimension_t** %96 to i8**
  %98 = load i8*, i8** %97, align 8, !tbaa !77
  %99 = bitcast %struct.halide_dimension_t* %90 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %99, i8* nonnull align 4 dereferenceable(16) %98, i64 16, i1 false), !tbaa.struct !78
  %100 = load i32, i32* %19, align 4, !tbaa !158
  %101 = icmp sgt i32 %100, 1
  br i1 %101, label %.preheader, label %.loopexit, !llvm.loop !168

.preheader:                                       ; preds = %94, %.preheader
  %102 = phi i64 [ %113, %.preheader ], [ 1, %94 ]
  %103 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %33, align 8, !tbaa !135
  %104 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %103, i64 %77, i32 6
  %105 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %104, align 8, !tbaa !77
  %106 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %78, align 8, !tbaa !12
  %107 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %106, i64 0, i32 6
  %108 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %107, align 8, !tbaa !77
  %109 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %108, i64 %102
  %110 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %105, i64 %102
  %111 = bitcast %struct.halide_dimension_t* %110 to i8*
  %112 = bitcast %struct.halide_dimension_t* %109 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %111, i8* nonnull align 4 dereferenceable(16) %112, i64 16, i1 false), !tbaa.struct !78
  %113 = add nuw nsw i64 %102, 1
  %114 = load i32, i32* %19, align 4, !tbaa !158
  %115 = sext i32 %114 to i64
  %116 = icmp slt i64 %113, %115
  br i1 %116, label %.preheader, label %.loopexit, !llvm.loop !168

117:                                              ; preds = %.loopexit3, %9
  %118 = xor i1 %31, true
  ret i1 %118
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %0, i64 %1) local_unnamed_addr #0 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %2
  %4 = add i64 %1, -1
  %xtraiter = and i64 %1, 7
  %5 = icmp ult i64 %4, 7
  br i1 %5, label %.loopexit.loopexit.unr-lcssa, label %.preheader.preheader.new

.preheader.preheader.new:                         ; preds = %.preheader.preheader
  %unroll_iter = and i64 %1, -8
  %.0 = mul i32 5381, 33
  br label %.preheader

.loopexit.loopexit.unr-lcssa:                     ; preds = %.preheader, %.preheader.preheader
  %.lcssa.ph = phi i32 [ undef, %.preheader.preheader ], [ %61, %.preheader ]
  %.unr = phi i64 [ 0, %.preheader.preheader ], [ %62, %.preheader ]
  %.unr1 = phi i32 [ 5381, %.preheader.preheader ], [ %61, %.preheader ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.preheader.epil

.preheader.epil:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.preheader.epil
  %6 = phi i64 [ %13, %.preheader.epil ], [ %.unr, %.loopexit.loopexit.unr-lcssa ]
  %7 = phi i32 [ %12, %.preheader.epil ], [ %.unr1, %.loopexit.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %.preheader.epil ], [ %xtraiter, %.loopexit.loopexit.unr-lcssa ]
  %8 = mul i32 %7, 33
  %9 = getelementptr inbounds i8, i8* %0, i64 %6
  %10 = load i8, i8* %9, align 1, !tbaa !38
  %11 = zext i8 %10 to i32
  %12 = add i32 %8, %11
  %13 = add nuw i64 %6, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.preheader.epil, !llvm.loop !169

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.preheader.epil, %2
  %14 = phi i32 [ 5381, %2 ], [ %.lcssa.ph, %.loopexit.loopexit.unr-lcssa ], [ %12, %.preheader.epil ]
  ret i32 %14

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader.new
  %15 = phi i64 [ 0, %.preheader.preheader.new ], [ %62, %.preheader..preheader_crit_edge ]
  %.phi = phi i32 [ %.0, %.preheader.preheader.new ], [ %.1, %.preheader..preheader_crit_edge ]
  %niter = phi i64 [ %unroll_iter, %.preheader.preheader.new ], [ %niter.nsub.7, %.preheader..preheader_crit_edge ]
  %16 = getelementptr inbounds i8, i8* %0, i64 %15
  %17 = load i8, i8* %16, align 1, !tbaa !38
  %18 = zext i8 %17 to i32
  %19 = add i32 %.phi, %18
  %20 = or i64 %15, 1
  %21 = mul i32 %19, 33
  %22 = getelementptr inbounds i8, i8* %0, i64 %20
  %23 = load i8, i8* %22, align 1, !tbaa !38
  %24 = zext i8 %23 to i32
  %25 = add i32 %21, %24
  %26 = or i64 %15, 2
  %27 = mul i32 %25, 33
  %28 = getelementptr inbounds i8, i8* %0, i64 %26
  %29 = load i8, i8* %28, align 1, !tbaa !38
  %30 = zext i8 %29 to i32
  %31 = add i32 %27, %30
  %32 = or i64 %15, 3
  %33 = mul i32 %31, 33
  %34 = getelementptr inbounds i8, i8* %0, i64 %32
  %35 = load i8, i8* %34, align 1, !tbaa !38
  %36 = zext i8 %35 to i32
  %37 = add i32 %33, %36
  %38 = or i64 %15, 4
  %39 = mul i32 %37, 33
  %40 = getelementptr inbounds i8, i8* %0, i64 %38
  %41 = load i8, i8* %40, align 1, !tbaa !38
  %42 = zext i8 %41 to i32
  %43 = add i32 %39, %42
  %44 = or i64 %15, 5
  %45 = mul i32 %43, 33
  %46 = getelementptr inbounds i8, i8* %0, i64 %44
  %47 = load i8, i8* %46, align 1, !tbaa !38
  %48 = zext i8 %47 to i32
  %49 = add i32 %45, %48
  %50 = or i64 %15, 6
  %51 = mul i32 %49, 33
  %52 = getelementptr inbounds i8, i8* %0, i64 %50
  %53 = load i8, i8* %52, align 1, !tbaa !38
  %54 = zext i8 %53 to i32
  %55 = add i32 %51, %54
  %56 = or i64 %15, 7
  %57 = mul i32 %55, 33
  %58 = getelementptr inbounds i8, i8* %0, i64 %56
  %59 = load i8, i8* %58, align 1, !tbaa !38
  %60 = zext i8 %59 to i32
  %61 = add i32 %57, %60
  %62 = add nuw i64 %15, 8
  %niter.nsub.7 = add i64 %niter, -8
  %niter.ncmp.7 = icmp eq i64 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.preheader..preheader_crit_edge, !llvm.loop !170

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  %.1 = mul i32 %61, 33
  br label %.preheader
}

; Function Attrs: nounwind mustprogress
define linkonce void @_ZN6Halide7Runtime8Internal11prune_cacheEv() local_unnamed_addr #0 {
  %1 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %2 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  %3 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !64
  %4 = icmp sgt i64 %2, %3
  %5 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %1, null
  %6 = and i1 %5, %4
  br i1 %6, label %.preheader18, label %.loopexit19

.preheader18:                                     ; preds = %0, %211
  %7 = phi i64 [ %212, %211 ], [ %3, %0 ]
  %8 = phi i64 [ %213, %211 ], [ %2, %0 ]
  %9 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %11, %211 ], [ %1, %0 ]
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 1
  %11 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %10, align 8, !tbaa !171
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 7
  %13 = load i32, i32* %12, align 4, !tbaa !157
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %211

15:                                               ; preds = %.preheader18
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 6
  %17 = load i32, i32* %16, align 8, !tbaa !156
  %18 = and i32 %17, 255
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %19
  %21 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %20, align 8, !tbaa !12
  %22 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %21, %9
  br i1 %22, label %23, label %.preheader17

23:                                               ; preds = %15
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 0
  %25 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %24, align 8, !tbaa !128
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %25, %"struct.Halide::Runtime::Internal::CacheEntry"** %20, align 8, !tbaa !12
  br label %36

.preheader17:                                     ; preds = %15, %28
  %26 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %30, %28 ], [ %21, %15 ]
  %27 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %26, null
  br i1 %27, label %32, label %28

28:                                               ; preds = %.preheader17
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 0
  %30 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %29, align 8, !tbaa !128
  %31 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %30, %9
  br i1 %31, label %.loopexit, label %.preheader17, !llvm.loop !172

32:                                               ; preds = %.preheader17
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([90 x i8], [90 x i8]* @.str.1.43, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %.loopexit

.loopexit:                                        ; preds = %28, %32
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 0
  %34 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %33, align 8, !tbaa !128
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %34, %"struct.Halide::Runtime::Internal::CacheEntry"** %35, align 8, !tbaa !128
  br label %36

36:                                               ; preds = %.loopexit, %23
  %37 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %38 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %37, %9
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %11, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  br label %40

40:                                               ; preds = %39, %36
  %41 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %11, null
  br i1 %41, label %46, label %42

42:                                               ; preds = %40
  %43 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 2
  %44 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %43, align 8, !tbaa !154
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %11, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %44, %"struct.Halide::Runtime::Internal::CacheEntry"** %45, align 8, !tbaa !154
  br label %46

46:                                               ; preds = %42, %40
  %47 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  %48 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %47, %9
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 2
  %50 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %49, align 8, !tbaa !154
  br i1 %48, label %51, label %52

51:                                               ; preds = %46
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %50, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  br label %52

52:                                               ; preds = %51, %46
  %53 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %50, null
  br i1 %53, label %55, label %54

54:                                               ; preds = %52
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %11, %"struct.Halide::Runtime::Internal::CacheEntry"** %49, align 8, !tbaa !154
  br label %55

55:                                               ; preds = %54, %52
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 8
  %57 = load i32, i32* %56, align 8, !tbaa !133
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %65, label %59

59:                                               ; preds = %55
  %60 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %9, i64 0, i32 11
  %61 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %60, align 8, !tbaa !135
  %62 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  %63 = zext i32 %57 to i64
  br label %69

64:                                               ; preds = %200
  store i64 %208, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  br label %65

65:                                               ; preds = %64, %55
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %9) #17
  %66 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %9 to i8*
  tail call void @halide_free(i8* null, i8* nonnull %66) #16
  %67 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  %68 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !64
  br label %211

69:                                               ; preds = %200, %59
  %70 = phi i64 [ 0, %59 ], [ %209, %200 ]
  %71 = phi i64 [ %62, %59 ], [ %208, %200 ]
  %72 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %61, i64 %70, i32 5
  %73 = load i32, i32* %72, align 4, !tbaa !76
  %74 = icmp sgt i32 %73, 0
  br i1 %74, label %75, label %._crit_edge

._crit_edge:                                      ; preds = %69
  %.0 = add i64 0, -1
  br label %200

75:                                               ; preds = %69
  %76 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %61, i64 %70, i32 6
  %77 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %76, align 8, !tbaa !77
  %78 = zext i32 %73 to i64
  %min.iters.check59 = icmp ult i32 %73, 17
  br i1 %min.iters.check59, label %scalar.ph57.preheader, label %vector.ph60

vector.ph60:                                      ; preds = %75
  %n.mod.vf61 = and i64 %78, 15
  %79 = icmp eq i64 %n.mod.vf61, 0
  %80 = select i1 %79, i64 16, i64 %n.mod.vf61
  %n.vec62 = sub nsw i64 %78, %80
  br label %vector.body58

vector.body58:                                    ; preds = %vector.body58, %vector.ph60
  %index63 = phi i64 [ 0, %vector.ph60 ], [ %index.next64, %vector.body58 ]
  %vec.ind67 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph60 ], [ %vec.ind.next72, %vector.body58 ]
  %vec.phi73 = phi <4 x i64> [ zeroinitializer, %vector.ph60 ], [ %predphi89, %vector.body58 ]
  %vec.phi74 = phi <4 x i64> [ zeroinitializer, %vector.ph60 ], [ %predphi90, %vector.body58 ]
  %vec.phi75 = phi <4 x i64> [ zeroinitializer, %vector.ph60 ], [ %predphi91, %vector.body58 ]
  %vec.phi76 = phi <4 x i64> [ zeroinitializer, %vector.ph60 ], [ %predphi92, %vector.body58 ]
  %step.add68 = add <4 x i64> %vec.ind67, <i64 4, i64 4, i64 4, i64 4>
  %step.add69 = add <4 x i64> %vec.ind67, <i64 8, i64 8, i64 8, i64 8>
  %step.add70 = add <4 x i64> %vec.ind67, <i64 12, i64 12, i64 12, i64 12>
  %81 = or i64 %index63, 4
  %82 = or i64 %index63, 8
  %83 = or i64 %index63, 12
  %84 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %index63, i32 2
  %85 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %81, i32 2
  %86 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %82, i32 2
  %87 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %83, i32 2
  %88 = bitcast i32* %84 to <16 x i32>*
  %89 = bitcast i32* %85 to <16 x i32>*
  %90 = bitcast i32* %86 to <16 x i32>*
  %91 = bitcast i32* %87 to <16 x i32>*
  %wide.vec77 = load <16 x i32>, <16 x i32>* %88, align 4, !tbaa !83
  %wide.vec78 = load <16 x i32>, <16 x i32>* %89, align 4, !tbaa !83
  %wide.vec79 = load <16 x i32>, <16 x i32>* %90, align 4, !tbaa !83
  %wide.vec80 = load <16 x i32>, <16 x i32>* %91, align 4, !tbaa !83
  %strided.vec81 = shufflevector <16 x i32> %wide.vec77, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec82 = shufflevector <16 x i32> %wide.vec78, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec83 = shufflevector <16 x i32> %wide.vec79, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec84 = shufflevector <16 x i32> %wide.vec80, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %92 = icmp sgt <4 x i32> %strided.vec81, zeroinitializer
  %93 = icmp sgt <4 x i32> %strided.vec82, zeroinitializer
  %94 = icmp sgt <4 x i32> %strided.vec83, zeroinitializer
  %95 = icmp sgt <4 x i32> %strided.vec84, zeroinitializer
  %96 = zext <4 x i32> %strided.vec81 to <4 x i64>
  %97 = zext <4 x i32> %strided.vec82 to <4 x i64>
  %98 = zext <4 x i32> %strided.vec83 to <4 x i64>
  %99 = zext <4 x i32> %strided.vec84 to <4 x i64>
  %100 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %vec.ind67, i32 1
  %101 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %step.add68, i32 1
  %102 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %step.add69, i32 1
  %103 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %step.add70, i32 1
  %wide.masked.gather85 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %100, i32 4, <4 x i1> %92, <4 x i32> undef), !tbaa !79
  %wide.masked.gather86 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %101, i32 4, <4 x i1> %93, <4 x i32> undef), !tbaa !79
  %wide.masked.gather87 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %102, i32 4, <4 x i1> %94, <4 x i32> undef), !tbaa !79
  %wide.masked.gather88 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %103, i32 4, <4 x i1> %95, <4 x i32> undef), !tbaa !79
  %104 = add nsw <4 x i32> %wide.masked.gather85, <i32 -1, i32 -1, i32 -1, i32 -1>
  %105 = add nsw <4 x i32> %wide.masked.gather86, <i32 -1, i32 -1, i32 -1, i32 -1>
  %106 = add nsw <4 x i32> %wide.masked.gather87, <i32 -1, i32 -1, i32 -1, i32 -1>
  %107 = add nsw <4 x i32> %wide.masked.gather88, <i32 -1, i32 -1, i32 -1, i32 -1>
  %108 = sext <4 x i32> %104 to <4 x i64>
  %109 = sext <4 x i32> %105 to <4 x i64>
  %110 = sext <4 x i32> %106 to <4 x i64>
  %111 = sext <4 x i32> %107 to <4 x i64>
  %112 = mul nsw <4 x i64> %108, %96
  %113 = mul nsw <4 x i64> %109, %97
  %114 = mul nsw <4 x i64> %110, %98
  %115 = mul nsw <4 x i64> %111, %99
  %116 = select <4 x i1> %92, <4 x i64> %112, <4 x i64> zeroinitializer
  %predphi89 = add <4 x i64> %vec.phi73, %116
  %117 = select <4 x i1> %93, <4 x i64> %113, <4 x i64> zeroinitializer
  %predphi90 = add <4 x i64> %vec.phi74, %117
  %118 = select <4 x i1> %94, <4 x i64> %114, <4 x i64> zeroinitializer
  %predphi91 = add <4 x i64> %vec.phi75, %118
  %119 = select <4 x i1> %95, <4 x i64> %115, <4 x i64> zeroinitializer
  %predphi92 = add <4 x i64> %vec.phi76, %119
  %index.next64 = add i64 %index63, 16
  %vec.ind.next72 = add <4 x i64> %vec.ind67, <i64 16, i64 16, i64 16, i64 16>
  %120 = icmp eq i64 %index.next64, %n.vec62
  br i1 %120, label %middle.block56, label %vector.body58, !llvm.loop !173

middle.block56:                                   ; preds = %vector.body58
  %bin.rdx93 = add <4 x i64> %predphi90, %predphi89
  %bin.rdx94 = add <4 x i64> %predphi91, %bin.rdx93
  %bin.rdx95 = add <4 x i64> %predphi92, %bin.rdx94
  %121 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx95)
  br label %scalar.ph57.preheader

scalar.ph57.preheader:                            ; preds = %middle.block56, %75
  %.ph99 = phi i64 [ 0, %75 ], [ %n.vec62, %middle.block56 ]
  %.ph100 = phi i64 [ 0, %75 ], [ %121, %middle.block56 ]
  br label %scalar.ph57

scalar.ph57:                                      ; preds = %scalar.ph57.preheader, %135
  %122 = phi i64 [ %137, %135 ], [ %.ph99, %scalar.ph57.preheader ]
  %123 = phi i64 [ %136, %135 ], [ %.ph100, %scalar.ph57.preheader ]
  %124 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %122, i32 2
  %125 = load i32, i32* %124, align 4, !tbaa !83
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %135

127:                                              ; preds = %scalar.ph57
  %128 = zext i32 %125 to i64
  %129 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %122, i32 1
  %130 = load i32, i32* %129, align 4, !tbaa !79
  %131 = add nsw i32 %130, -1
  %132 = sext i32 %131 to i64
  %133 = mul nsw i64 %132, %128
  %134 = add nsw i64 %133, %123
  br label %135

135:                                              ; preds = %127, %scalar.ph57
  %136 = phi i64 [ %134, %127 ], [ %123, %scalar.ph57 ]
  %137 = add nuw nsw i64 %122, 1
  %138 = icmp eq i64 %137, %78
  br i1 %138, label %.preheader, label %scalar.ph57, !llvm.loop !174

.preheader:                                       ; preds = %135
  %min.iters.check = icmp ult i32 %73, 17
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %n.mod.vf = and i64 %78, 15
  %139 = icmp eq i64 %n.mod.vf, 0
  %140 = select i1 %139, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %78, %140
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi39 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi51, %vector.body ]
  %vec.phi40 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi52, %vector.body ]
  %vec.phi41 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi53, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add36 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add37 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %141 = or i64 %index, 4
  %142 = or i64 %index, 8
  %143 = or i64 %index, 12
  %144 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %index, i32 2
  %145 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %141, i32 2
  %146 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %142, i32 2
  %147 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %143, i32 2
  %148 = bitcast i32* %144 to <16 x i32>*
  %149 = bitcast i32* %145 to <16 x i32>*
  %150 = bitcast i32* %146 to <16 x i32>*
  %151 = bitcast i32* %147 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %148, align 4, !tbaa !83
  %wide.vec42 = load <16 x i32>, <16 x i32>* %149, align 4, !tbaa !83
  %wide.vec43 = load <16 x i32>, <16 x i32>* %150, align 4, !tbaa !83
  %wide.vec44 = load <16 x i32>, <16 x i32>* %151, align 4, !tbaa !83
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec45 = shufflevector <16 x i32> %wide.vec42, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec46 = shufflevector <16 x i32> %wide.vec43, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec47 = shufflevector <16 x i32> %wide.vec44, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %152 = icmp slt <4 x i32> %strided.vec, zeroinitializer
  %153 = icmp slt <4 x i32> %strided.vec45, zeroinitializer
  %154 = icmp slt <4 x i32> %strided.vec46, zeroinitializer
  %155 = icmp slt <4 x i32> %strided.vec47, zeroinitializer
  %156 = sext <4 x i32> %strided.vec to <4 x i64>
  %157 = sext <4 x i32> %strided.vec45 to <4 x i64>
  %158 = sext <4 x i32> %strided.vec46 to <4 x i64>
  %159 = sext <4 x i32> %strided.vec47 to <4 x i64>
  %160 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %vec.ind, i32 1
  %161 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %step.add, i32 1
  %162 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %step.add36, i32 1
  %163 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, <4 x i64> %step.add37, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %160, i32 4, <4 x i1> %152, <4 x i32> undef), !tbaa !79
  %wide.masked.gather48 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %161, i32 4, <4 x i1> %153, <4 x i32> undef), !tbaa !79
  %wide.masked.gather49 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %162, i32 4, <4 x i1> %154, <4 x i32> undef), !tbaa !79
  %wide.masked.gather50 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %163, i32 4, <4 x i1> %155, <4 x i32> undef), !tbaa !79
  %164 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %165 = add nsw <4 x i32> %wide.masked.gather48, <i32 -1, i32 -1, i32 -1, i32 -1>
  %166 = add nsw <4 x i32> %wide.masked.gather49, <i32 -1, i32 -1, i32 -1, i32 -1>
  %167 = add nsw <4 x i32> %wide.masked.gather50, <i32 -1, i32 -1, i32 -1, i32 -1>
  %168 = sext <4 x i32> %164 to <4 x i64>
  %169 = sext <4 x i32> %165 to <4 x i64>
  %170 = sext <4 x i32> %166 to <4 x i64>
  %171 = sext <4 x i32> %167 to <4 x i64>
  %172 = mul nsw <4 x i64> %168, %156
  %173 = mul nsw <4 x i64> %169, %157
  %174 = mul nsw <4 x i64> %170, %158
  %175 = mul nsw <4 x i64> %171, %159
  %176 = select <4 x i1> %152, <4 x i64> %172, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %176
  %177 = select <4 x i1> %153, <4 x i64> %173, <4 x i64> zeroinitializer
  %predphi51 = add <4 x i64> %vec.phi39, %177
  %178 = select <4 x i1> %154, <4 x i64> %174, <4 x i64> zeroinitializer
  %predphi52 = add <4 x i64> %vec.phi40, %178
  %179 = select <4 x i1> %155, <4 x i64> %175, <4 x i64> zeroinitializer
  %predphi53 = add <4 x i64> %vec.phi41, %179
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %180 = icmp eq i64 %index.next, %n.vec
  br i1 %180, label %middle.block, label %vector.body, !llvm.loop !175

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi51, %predphi
  %bin.rdx54 = add <4 x i64> %predphi52, %bin.rdx
  %bin.rdx55 = add <4 x i64> %predphi53, %bin.rdx54
  %181 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx55)
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %.preheader
  %.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  %.ph98 = phi i64 [ 0, %.preheader ], [ %181, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %195
  %182 = phi i64 [ %197, %195 ], [ %.ph, %scalar.ph.preheader ]
  %183 = phi i64 [ %196, %195 ], [ %.ph98, %scalar.ph.preheader ]
  %184 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %182, i32 2
  %185 = load i32, i32* %184, align 4, !tbaa !83
  %186 = icmp slt i32 %185, 0
  br i1 %186, label %187, label %195

187:                                              ; preds = %scalar.ph
  %188 = sext i32 %185 to i64
  %189 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %182, i32 1
  %190 = load i32, i32* %189, align 4, !tbaa !79
  %191 = add nsw i32 %190, -1
  %192 = sext i32 %191 to i64
  %193 = mul nsw i64 %192, %188
  %194 = add nsw i64 %193, %183
  br label %195

195:                                              ; preds = %187, %scalar.ph
  %196 = phi i64 [ %194, %187 ], [ %183, %scalar.ph ]
  %197 = add nuw nsw i64 %182, 1
  %198 = icmp eq i64 %197, %78
  br i1 %198, label %.loopexit97, label %scalar.ph, !llvm.loop !176

.loopexit97:                                      ; preds = %195
  %199 = xor i64 %136, -1
  %.1 = add i64 %196, %199
  br label %200

200:                                              ; preds = %._crit_edge, %.loopexit97
  %.phi = phi i64 [ %.0, %._crit_edge ], [ %.1, %.loopexit97 ]
  %201 = phi i64 [ 0, %._crit_edge ], [ %196, %.loopexit97 ]
  %202 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %61, i64 %70, i32 4, i32 1
  %203 = load i8, i8* %202, align 1, !tbaa !28
  %204 = zext i8 %203 to i64
  %205 = add nuw nsw i64 %204, 7
  %206 = lshr i64 %205, 3
  %207 = mul i64 %206, %.phi
  %208 = add i64 %207, %71
  %209 = add nuw nsw i64 %70, 1
  %210 = icmp eq i64 %209, %63
  br i1 %210, label %64, label %69, !llvm.loop !177

211:                                              ; preds = %65, %.preheader18
  %212 = phi i64 [ %68, %65 ], [ %7, %.preheader18 ]
  %213 = phi i64 [ %67, %65 ], [ %8, %.preheader18 ]
  %214 = icmp sgt i64 %213, %212
  %215 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %11, null
  %216 = and i1 %215, %214
  br i1 %216, label %.preheader18, label %.loopexit19, !llvm.loop !178

.loopexit19:                                      ; preds = %211, %0
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_set_size(i64 %0) local_unnamed_addr #4 {
  %2 = icmp eq i64 %0, 0
  %3 = select i1 %2, i64 1048576, i64 %0
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  store i64 %3, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !64
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #17
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_lookup(i8* %0, i8* %1, i32 %2, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** %5) local_unnamed_addr #4 {
  %7 = sext i32 %2 to i64
  %8 = tail call i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %1, i64 %7) #17
  %9 = and i32 %8, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %10
  %12 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %11, align 8, !tbaa !12
  %13 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %12, null
  br i1 %13, label %.loopexit18, label %14

14:                                               ; preds = %6
  %15 = icmp sgt i32 %4, 0
  %16 = sext i32 %4 to i64
  br i1 %15, label %.split.us, label %.split

.split.us:                                        ; preds = %14, %51
  %17 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %53, %51 ], [ %12, %14 ]
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 6
  %19 = load i32, i32* %18, align 8, !tbaa !156
  %20 = icmp eq i32 %19, %8
  br i1 %20, label %21, label %51

21:                                               ; preds = %.split.us
  %22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 4
  %23 = load i64, i64* %22, align 8, !tbaa !155
  %24 = icmp eq i64 %23, %7
  br i1 %24, label %25, label %51

25:                                               ; preds = %21
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 5
  %27 = load i8*, i8** %26, align 8, !tbaa !160
  %28 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %27, i8* %1, i64 %7) #17
  br i1 %28, label %29, label %51

29:                                               ; preds = %25
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 10
  %31 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %30, align 8, !tbaa !159
  %32 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %31) #17
  br i1 %32, label %33, label %51

33:                                               ; preds = %29
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 8
  %35 = load i32, i32* %34, align 8, !tbaa !133
  %36 = icmp eq i32 %35, %4
  br i1 %36, label %37, label %51

37:                                               ; preds = %33
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 11
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i64 [ 0, %37 ], [ %47, %39 ]
  %41 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %40
  %42 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %41, align 8, !tbaa !12
  %43 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %38, align 8, !tbaa !135
  %44 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %43, i64 %40, i32 6
  %45 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %44, align 8, !tbaa !77
  %46 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %42, %struct.halide_dimension_t* %45) #17
  %47 = add nuw nsw i64 %40, 1
  %48 = icmp slt i64 %47, %16
  %49 = and i1 %48, %46
  br i1 %49, label %39, label %50, !llvm.loop !179

50:                                               ; preds = %39
  br i1 %46, label %.split26.us, label %51

51:                                               ; preds = %50, %33, %29, %25, %21, %.split.us
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %17, i64 0, i32 0
  %53 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %52, align 8, !tbaa !12
  %54 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %53, null
  br i1 %54, label %.loopexit18, label %.split.us, !llvm.loop !180

.loopexit18:                                      ; preds = %149, %51, %6
  %55 = icmp sgt i32 %4, 0
  br i1 %55, label %56, label %.loopexit

56:                                               ; preds = %.loopexit18
  %57 = zext i32 %4 to i64
  br label %153

.split:                                           ; preds = %14, %149
  %58 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %151, %149 ], [ %12, %14 ]
  %59 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 6
  %60 = load i32, i32* %59, align 8, !tbaa !156
  %61 = icmp eq i32 %60, %8
  br i1 %61, label %62, label %149

62:                                               ; preds = %.split
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 4
  %64 = load i64, i64* %63, align 8, !tbaa !155
  %65 = icmp eq i64 %64, %7
  br i1 %65, label %66, label %149

66:                                               ; preds = %62
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 5
  %68 = load i8*, i8** %67, align 8, !tbaa !160
  %69 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %68, i8* %1, i64 %7) #17
  br i1 %69, label %70, label %149

70:                                               ; preds = %66
  %71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 10
  %72 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %71, align 8, !tbaa !159
  %73 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %72) #17
  br i1 %73, label %74, label %149

74:                                               ; preds = %70
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 8
  %76 = load i32, i32* %75, align 8, !tbaa !133
  %77 = icmp eq i32 %76, %4
  br i1 %77, label %.split26.us, label %149

.split26.us:                                      ; preds = %74, %50
  %.us-phi = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %17, %50 ], [ %58, %74 ]
  %78 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  %79 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %78
  br i1 %79, label %113, label %80

80:                                               ; preds = %.split26.us
  %81 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 1
  %82 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !171
  %83 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %82, null
  br i1 %83, label %84, label %85

84:                                               ; preds = %80
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([93 x i8], [93 x i8]* @.str.2.44, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %85

85:                                               ; preds = %84, %80
  %86 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 2
  %87 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %86, align 8, !tbaa !154
  %88 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %87, null
  br i1 %88, label %93, label %89

89:                                               ; preds = %85
  %90 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !171
  %91 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %87, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %90, %"struct.Halide::Runtime::Internal::CacheEntry"** %91, align 8, !tbaa !171
  %92 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !171
  br label %99

93:                                               ; preds = %85
  %94 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %95 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %94, %.us-phi
  br i1 %95, label %97, label %96

96:                                               ; preds = %93
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.3.45, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %97

97:                                               ; preds = %96, %93
  %98 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !171
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %98, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  br label %99

99:                                               ; preds = %97, %89
  %100 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %92, %89 ], [ %98, %97 ]
  %101 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %100, null
  br i1 %101, label %102, label %104

102:                                              ; preds = %99
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([93 x i8], [93 x i8]* @.str.4.46, i64 0, i64 0)) #16
  tail call void @abort() #16
  %103 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !171
  br label %104

104:                                              ; preds = %102, %99
  %105 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %103, %102 ], [ %100, %99 ]
  %106 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %86, align 8, !tbaa !154
  %107 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %105, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %106, %"struct.Halide::Runtime::Internal::CacheEntry"** %107, align 8, !tbaa !154
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %81, align 8, !tbaa !171
  %108 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %108, %"struct.Halide::Runtime::Internal::CacheEntry"** %86, align 8, !tbaa !154
  %109 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %108, null
  br i1 %109, label %112, label %110

110:                                              ; preds = %104
  %111 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %108, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %"struct.Halide::Runtime::Internal::CacheEntry"** %111, align 8, !tbaa !171
  br label %112

112:                                              ; preds = %110, %104
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  br label %113

113:                                              ; preds = %112, %.split26.us
  br i1 %15, label %114, label %.loopexit17

114:                                              ; preds = %113
  %115 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 11
  %116 = zext i32 %4 to i64
  %117 = add nsw i64 %116, -1
  %xtraiter = and i64 %116, 3
  %118 = icmp ult i64 %117, 3
  br i1 %118, label %.loopexit17.loopexit.unr-lcssa, label %.new

.new:                                             ; preds = %114
  %unroll_iter = and i64 %116, 4294967292
  br label %119

119:                                              ; preds = %119, %.new
  %120 = phi i64 [ 0, %.new ], [ %148, %119 ]
  %niter = phi i64 [ %unroll_iter, %.new ], [ %niter.nsub.3, %119 ]
  %121 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %120
  %122 = bitcast %struct.halide_buffer_t** %121 to i8**
  %123 = load i8*, i8** %122, align 8, !tbaa !12
  %124 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %115, align 8, !tbaa !135
  %125 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %124, i64 %120
  %126 = bitcast %struct.halide_buffer_t* %125 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %123, i8* nonnull align 8 dereferenceable(56) %126, i64 56, i1 false), !tbaa.struct !166
  %127 = or i64 %120, 1
  %128 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %127
  %129 = bitcast %struct.halide_buffer_t** %128 to i8**
  %130 = load i8*, i8** %129, align 8, !tbaa !12
  %131 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %115, align 8, !tbaa !135
  %132 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %131, i64 %127
  %133 = bitcast %struct.halide_buffer_t* %132 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %130, i8* nonnull align 8 dereferenceable(56) %133, i64 56, i1 false), !tbaa.struct !166
  %134 = or i64 %120, 2
  %135 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %134
  %136 = bitcast %struct.halide_buffer_t** %135 to i8**
  %137 = load i8*, i8** %136, align 8, !tbaa !12
  %138 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %115, align 8, !tbaa !135
  %139 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %138, i64 %134
  %140 = bitcast %struct.halide_buffer_t* %139 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %137, i8* nonnull align 8 dereferenceable(56) %140, i64 56, i1 false), !tbaa.struct !166
  %141 = or i64 %120, 3
  %142 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %141
  %143 = bitcast %struct.halide_buffer_t** %142 to i8**
  %144 = load i8*, i8** %143, align 8, !tbaa !12
  %145 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %115, align 8, !tbaa !135
  %146 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %145, i64 %141
  %147 = bitcast %struct.halide_buffer_t* %146 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %144, i8* nonnull align 8 dereferenceable(56) %147, i64 56, i1 false), !tbaa.struct !166
  %148 = add nuw nsw i64 %120, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %.loopexit17.loopexit.unr-lcssa, label %119, !llvm.loop !181

149:                                              ; preds = %74, %70, %66, %62, %.split
  %150 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 0
  %151 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %150, align 8, !tbaa !12
  %152 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %151, null
  br i1 %152, label %.loopexit18, label %.split, !llvm.loop !180

153:                                              ; preds = %314, %56
  %154 = phi i64 [ 0, %56 ], [ %319, %314 ]
  %155 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %154
  %156 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %155, align 8, !tbaa !12
  %157 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %156, i64 0, i32 5
  %158 = load i32, i32* %157, align 4, !tbaa !76
  %159 = icmp sgt i32 %158, 0
  br i1 %159, label %160, label %285

160:                                              ; preds = %153
  %161 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %156, i64 0, i32 6
  %162 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %161, align 8, !tbaa !77
  %163 = zext i32 %158 to i64
  %min.iters.check85 = icmp ult i32 %158, 17
  br i1 %min.iters.check85, label %scalar.ph83.preheader, label %vector.ph86

vector.ph86:                                      ; preds = %160
  %n.mod.vf87 = and i64 %163, 15
  %164 = icmp eq i64 %n.mod.vf87, 0
  %165 = select i1 %164, i64 16, i64 %n.mod.vf87
  %n.vec88 = sub nsw i64 %163, %165
  br label %vector.body84

vector.body84:                                    ; preds = %vector.body84, %vector.ph86
  %index89 = phi i64 [ 0, %vector.ph86 ], [ %index.next90, %vector.body84 ]
  %vec.ind93 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph86 ], [ %vec.ind.next98, %vector.body84 ]
  %vec.phi99 = phi <4 x i64> [ zeroinitializer, %vector.ph86 ], [ %predphi115, %vector.body84 ]
  %vec.phi100 = phi <4 x i64> [ zeroinitializer, %vector.ph86 ], [ %predphi116, %vector.body84 ]
  %vec.phi101 = phi <4 x i64> [ zeroinitializer, %vector.ph86 ], [ %predphi117, %vector.body84 ]
  %vec.phi102 = phi <4 x i64> [ zeroinitializer, %vector.ph86 ], [ %predphi118, %vector.body84 ]
  %step.add94 = add <4 x i64> %vec.ind93, <i64 4, i64 4, i64 4, i64 4>
  %step.add95 = add <4 x i64> %vec.ind93, <i64 8, i64 8, i64 8, i64 8>
  %step.add96 = add <4 x i64> %vec.ind93, <i64 12, i64 12, i64 12, i64 12>
  %166 = or i64 %index89, 4
  %167 = or i64 %index89, 8
  %168 = or i64 %index89, 12
  %169 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %index89, i32 2
  %170 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %166, i32 2
  %171 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %167, i32 2
  %172 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %168, i32 2
  %173 = bitcast i32* %169 to <16 x i32>*
  %174 = bitcast i32* %170 to <16 x i32>*
  %175 = bitcast i32* %171 to <16 x i32>*
  %176 = bitcast i32* %172 to <16 x i32>*
  %wide.vec103 = load <16 x i32>, <16 x i32>* %173, align 4, !tbaa !83
  %wide.vec104 = load <16 x i32>, <16 x i32>* %174, align 4, !tbaa !83
  %wide.vec105 = load <16 x i32>, <16 x i32>* %175, align 4, !tbaa !83
  %wide.vec106 = load <16 x i32>, <16 x i32>* %176, align 4, !tbaa !83
  %strided.vec107 = shufflevector <16 x i32> %wide.vec103, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec108 = shufflevector <16 x i32> %wide.vec104, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec109 = shufflevector <16 x i32> %wide.vec105, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec110 = shufflevector <16 x i32> %wide.vec106, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %177 = icmp sgt <4 x i32> %strided.vec107, zeroinitializer
  %178 = icmp sgt <4 x i32> %strided.vec108, zeroinitializer
  %179 = icmp sgt <4 x i32> %strided.vec109, zeroinitializer
  %180 = icmp sgt <4 x i32> %strided.vec110, zeroinitializer
  %181 = zext <4 x i32> %strided.vec107 to <4 x i64>
  %182 = zext <4 x i32> %strided.vec108 to <4 x i64>
  %183 = zext <4 x i32> %strided.vec109 to <4 x i64>
  %184 = zext <4 x i32> %strided.vec110 to <4 x i64>
  %185 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %vec.ind93, i32 1
  %186 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %step.add94, i32 1
  %187 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %step.add95, i32 1
  %188 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %step.add96, i32 1
  %wide.masked.gather111 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %185, i32 4, <4 x i1> %177, <4 x i32> undef), !tbaa !79
  %wide.masked.gather112 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %186, i32 4, <4 x i1> %178, <4 x i32> undef), !tbaa !79
  %wide.masked.gather113 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %187, i32 4, <4 x i1> %179, <4 x i32> undef), !tbaa !79
  %wide.masked.gather114 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %188, i32 4, <4 x i1> %180, <4 x i32> undef), !tbaa !79
  %189 = add nsw <4 x i32> %wide.masked.gather111, <i32 -1, i32 -1, i32 -1, i32 -1>
  %190 = add nsw <4 x i32> %wide.masked.gather112, <i32 -1, i32 -1, i32 -1, i32 -1>
  %191 = add nsw <4 x i32> %wide.masked.gather113, <i32 -1, i32 -1, i32 -1, i32 -1>
  %192 = add nsw <4 x i32> %wide.masked.gather114, <i32 -1, i32 -1, i32 -1, i32 -1>
  %193 = sext <4 x i32> %189 to <4 x i64>
  %194 = sext <4 x i32> %190 to <4 x i64>
  %195 = sext <4 x i32> %191 to <4 x i64>
  %196 = sext <4 x i32> %192 to <4 x i64>
  %197 = mul nsw <4 x i64> %193, %181
  %198 = mul nsw <4 x i64> %194, %182
  %199 = mul nsw <4 x i64> %195, %183
  %200 = mul nsw <4 x i64> %196, %184
  %201 = select <4 x i1> %177, <4 x i64> %197, <4 x i64> zeroinitializer
  %predphi115 = add <4 x i64> %vec.phi99, %201
  %202 = select <4 x i1> %178, <4 x i64> %198, <4 x i64> zeroinitializer
  %predphi116 = add <4 x i64> %vec.phi100, %202
  %203 = select <4 x i1> %179, <4 x i64> %199, <4 x i64> zeroinitializer
  %predphi117 = add <4 x i64> %vec.phi101, %203
  %204 = select <4 x i1> %180, <4 x i64> %200, <4 x i64> zeroinitializer
  %predphi118 = add <4 x i64> %vec.phi102, %204
  %index.next90 = add i64 %index89, 16
  %vec.ind.next98 = add <4 x i64> %vec.ind93, <i64 16, i64 16, i64 16, i64 16>
  %205 = icmp eq i64 %index.next90, %n.vec88
  br i1 %205, label %middle.block82, label %vector.body84, !llvm.loop !182

middle.block82:                                   ; preds = %vector.body84
  %bin.rdx119 = add <4 x i64> %predphi116, %predphi115
  %bin.rdx120 = add <4 x i64> %predphi117, %bin.rdx119
  %bin.rdx121 = add <4 x i64> %predphi118, %bin.rdx120
  %206 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx121)
  br label %scalar.ph83.preheader

scalar.ph83.preheader:                            ; preds = %middle.block82, %160
  %.ph125 = phi i64 [ 0, %160 ], [ %n.vec88, %middle.block82 ]
  %.ph126 = phi i64 [ 0, %160 ], [ %206, %middle.block82 ]
  br label %scalar.ph83

scalar.ph83:                                      ; preds = %scalar.ph83.preheader, %220
  %207 = phi i64 [ %222, %220 ], [ %.ph125, %scalar.ph83.preheader ]
  %208 = phi i64 [ %221, %220 ], [ %.ph126, %scalar.ph83.preheader ]
  %209 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %207, i32 2
  %210 = load i32, i32* %209, align 4, !tbaa !83
  %211 = icmp sgt i32 %210, 0
  br i1 %211, label %212, label %220

212:                                              ; preds = %scalar.ph83
  %213 = zext i32 %210 to i64
  %214 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %207, i32 1
  %215 = load i32, i32* %214, align 4, !tbaa !79
  %216 = add nsw i32 %215, -1
  %217 = sext i32 %216 to i64
  %218 = mul nsw i64 %217, %213
  %219 = add nsw i64 %218, %208
  br label %220

220:                                              ; preds = %212, %scalar.ph83
  %221 = phi i64 [ %219, %212 ], [ %208, %scalar.ph83 ]
  %222 = add nuw nsw i64 %207, 1
  %223 = icmp eq i64 %222, %163
  br i1 %223, label %.preheader15, label %scalar.ph83, !llvm.loop !183

.preheader15:                                     ; preds = %220
  %min.iters.check = icmp ult i32 %158, 17
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader15
  %n.mod.vf = and i64 %163, 15
  %224 = icmp eq i64 %n.mod.vf, 0
  %225 = select i1 %224, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %163, %225
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi65 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi77, %vector.body ]
  %vec.phi66 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi78, %vector.body ]
  %vec.phi67 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi79, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add62 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add63 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %226 = or i64 %index, 4
  %227 = or i64 %index, 8
  %228 = or i64 %index, 12
  %229 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %index, i32 2
  %230 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %226, i32 2
  %231 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %227, i32 2
  %232 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %228, i32 2
  %233 = bitcast i32* %229 to <16 x i32>*
  %234 = bitcast i32* %230 to <16 x i32>*
  %235 = bitcast i32* %231 to <16 x i32>*
  %236 = bitcast i32* %232 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %233, align 4, !tbaa !83
  %wide.vec68 = load <16 x i32>, <16 x i32>* %234, align 4, !tbaa !83
  %wide.vec69 = load <16 x i32>, <16 x i32>* %235, align 4, !tbaa !83
  %wide.vec70 = load <16 x i32>, <16 x i32>* %236, align 4, !tbaa !83
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec71 = shufflevector <16 x i32> %wide.vec68, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec72 = shufflevector <16 x i32> %wide.vec69, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec73 = shufflevector <16 x i32> %wide.vec70, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %237 = icmp slt <4 x i32> %strided.vec, zeroinitializer
  %238 = icmp slt <4 x i32> %strided.vec71, zeroinitializer
  %239 = icmp slt <4 x i32> %strided.vec72, zeroinitializer
  %240 = icmp slt <4 x i32> %strided.vec73, zeroinitializer
  %241 = sext <4 x i32> %strided.vec to <4 x i64>
  %242 = sext <4 x i32> %strided.vec71 to <4 x i64>
  %243 = sext <4 x i32> %strided.vec72 to <4 x i64>
  %244 = sext <4 x i32> %strided.vec73 to <4 x i64>
  %245 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %vec.ind, i32 1
  %246 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %step.add, i32 1
  %247 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %step.add62, i32 1
  %248 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, <4 x i64> %step.add63, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %245, i32 4, <4 x i1> %237, <4 x i32> undef), !tbaa !79
  %wide.masked.gather74 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %246, i32 4, <4 x i1> %238, <4 x i32> undef), !tbaa !79
  %wide.masked.gather75 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %247, i32 4, <4 x i1> %239, <4 x i32> undef), !tbaa !79
  %wide.masked.gather76 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %248, i32 4, <4 x i1> %240, <4 x i32> undef), !tbaa !79
  %249 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %250 = add nsw <4 x i32> %wide.masked.gather74, <i32 -1, i32 -1, i32 -1, i32 -1>
  %251 = add nsw <4 x i32> %wide.masked.gather75, <i32 -1, i32 -1, i32 -1, i32 -1>
  %252 = add nsw <4 x i32> %wide.masked.gather76, <i32 -1, i32 -1, i32 -1, i32 -1>
  %253 = sext <4 x i32> %249 to <4 x i64>
  %254 = sext <4 x i32> %250 to <4 x i64>
  %255 = sext <4 x i32> %251 to <4 x i64>
  %256 = sext <4 x i32> %252 to <4 x i64>
  %257 = mul nsw <4 x i64> %253, %241
  %258 = mul nsw <4 x i64> %254, %242
  %259 = mul nsw <4 x i64> %255, %243
  %260 = mul nsw <4 x i64> %256, %244
  %261 = select <4 x i1> %237, <4 x i64> %257, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %261
  %262 = select <4 x i1> %238, <4 x i64> %258, <4 x i64> zeroinitializer
  %predphi77 = add <4 x i64> %vec.phi65, %262
  %263 = select <4 x i1> %239, <4 x i64> %259, <4 x i64> zeroinitializer
  %predphi78 = add <4 x i64> %vec.phi66, %263
  %264 = select <4 x i1> %240, <4 x i64> %260, <4 x i64> zeroinitializer
  %predphi79 = add <4 x i64> %vec.phi67, %264
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %265 = icmp eq i64 %index.next, %n.vec
  br i1 %265, label %middle.block, label %vector.body, !llvm.loop !184

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi77, %predphi
  %bin.rdx80 = add <4 x i64> %predphi78, %bin.rdx
  %bin.rdx81 = add <4 x i64> %predphi79, %bin.rdx80
  %266 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx81)
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %.preheader15
  %.ph = phi i64 [ 0, %.preheader15 ], [ %n.vec, %middle.block ]
  %.ph124 = phi i64 [ 0, %.preheader15 ], [ %266, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %280
  %267 = phi i64 [ %282, %280 ], [ %.ph, %scalar.ph.preheader ]
  %268 = phi i64 [ %281, %280 ], [ %.ph124, %scalar.ph.preheader ]
  %269 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %267, i32 2
  %270 = load i32, i32* %269, align 4, !tbaa !83
  %271 = icmp slt i32 %270, 0
  br i1 %271, label %272, label %280

272:                                              ; preds = %scalar.ph
  %273 = sext i32 %270 to i64
  %274 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %162, i64 %267, i32 1
  %275 = load i32, i32* %274, align 4, !tbaa !79
  %276 = add nsw i32 %275, -1
  %277 = sext i32 %276 to i64
  %278 = mul nsw i64 %277, %273
  %279 = add nsw i64 %278, %268
  br label %280

280:                                              ; preds = %272, %scalar.ph
  %281 = phi i64 [ %279, %272 ], [ %268, %scalar.ph ]
  %282 = add nuw nsw i64 %267, 1
  %283 = icmp eq i64 %282, %163
  br i1 %283, label %.loopexit123, label %scalar.ph, !llvm.loop !185

.loopexit123:                                     ; preds = %280
  %284 = add nsw i64 %221, 1
  br label %285

285:                                              ; preds = %.loopexit123, %153
  %286 = phi i64 [ 1, %153 ], [ %284, %.loopexit123 ]
  %287 = phi i64 [ 0, %153 ], [ %281, %.loopexit123 ]
  %288 = sub nsw i64 %286, %287
  %289 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %156, i64 0, i32 4, i32 1
  %290 = load i8, i8* %289, align 1, !tbaa !28
  %291 = zext i8 %290 to i64
  %292 = add nuw nsw i64 %291, 7
  %293 = lshr i64 %292, 3
  %294 = mul i64 %293, %288
  %295 = add i64 %294, 64
  %296 = tail call i8* @halide_malloc(i8* %0, i64 %295) #16
  %297 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %156, i64 0, i32 2
  store i8* %296, i8** %297, align 8, !tbaa !73
  %298 = icmp eq i8* %296, null
  br i1 %298, label %299, label %314

299:                                              ; preds = %285
  %300 = icmp eq i64 %154, 0
  br i1 %300, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %299, %.preheader
  %301 = phi i64 [ %313, %.preheader ], [ %154, %299 ]
  %302 = add nuw nsw i64 %301, 4294967295
  %303 = and i64 %302, 4294967295
  %304 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %303
  %305 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %304, align 8, !tbaa !12
  %306 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %305, i64 0, i32 2
  %307 = load i8*, i8** %306, align 8, !tbaa !73
  %308 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %307) #17
  %309 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %308 to i8*
  tail call void @halide_free(i8* %0, i8* %309) #16
  %310 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %304, align 8, !tbaa !12
  %311 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %310, i64 0, i32 2
  store i8* null, i8** %311, align 8, !tbaa !73
  %312 = icmp sgt i64 %301, 1
  %313 = add nsw i64 %301, -1
  br i1 %312, label %.preheader, label %.loopexit, !llvm.loop !186

314:                                              ; preds = %285
  %315 = getelementptr inbounds i8, i8* %296, i64 64
  store i8* %315, i8** %297, align 8, !tbaa !73
  %316 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* nonnull %315) #17
  %317 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %316, i64 0, i32 1
  store i32 %8, i32* %317, align 8, !tbaa !187
  %318 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %316, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %318, align 8, !tbaa !189
  %319 = add nuw nsw i64 %154, 1
  %320 = icmp eq i64 %319, %57
  br i1 %320, label %.loopexit, label %153, !llvm.loop !190

.loopexit17.loopexit.unr-lcssa:                   ; preds = %119, %114
  %.unr = phi i64 [ 0, %114 ], [ %148, %119 ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit17, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit17.loopexit.unr-lcssa, %.epil.preheader
  %321 = phi i64 [ %328, %.epil.preheader ], [ %.unr, %.loopexit17.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %.epil.preheader ], [ %xtraiter, %.loopexit17.loopexit.unr-lcssa ]
  %322 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %321
  %323 = bitcast %struct.halide_buffer_t** %322 to i8**
  %324 = load i8*, i8** %323, align 8, !tbaa !12
  %325 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %115, align 8, !tbaa !135
  %326 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %325, i64 %321
  %327 = bitcast %struct.halide_buffer_t* %326 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %324, i8* nonnull align 8 dereferenceable(56) %327, i64 56, i1 false), !tbaa.struct !166
  %328 = add nuw nsw i64 %321, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %.loopexit17, label %.epil.preheader, !llvm.loop !191

.loopexit17:                                      ; preds = %.loopexit17.loopexit.unr-lcssa, %.epil.preheader, %113
  %329 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %.us-phi, i64 0, i32 7
  %330 = load i32, i32* %329, align 4, !tbaa !157
  %331 = add i32 %330, %4
  store i32 %331, i32* %329, align 4, !tbaa !157
  br label %.loopexit

.loopexit:                                        ; preds = %314, %.preheader, %.loopexit17, %299, %.loopexit18
  %332 = phi i32 [ 1, %.loopexit18 ], [ 0, %.loopexit17 ], [ -1, %299 ], [ -1, %.preheader ], [ 1, %314 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret i32 %332
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_store(i8* %0, i8* %1, i32 %2, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** %5, i1 zeroext %6, i64 %7) local_unnamed_addr #4 {
  %9 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, align 8, !tbaa !12
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %9, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !73
  %12 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %11) #17
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %12, i64 0, i32 1
  %14 = load i32, i32* %13, align 8, !tbaa !187
  %15 = and i32 %14, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %16
  %18 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %17, align 8, !tbaa !12
  %19 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %18, null
  br i1 %19, label %.loopexit18, label %20

20:                                               ; preds = %8
  %21 = sext i32 %2 to i64
  %22 = icmp sgt i32 %4, 0
  br i1 %22, label %23, label %.preheader19

23:                                               ; preds = %20
  %24 = zext i32 %4 to i64
  br label %25

25:                                               ; preds = %51, %23
  %26 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %53, %51 ], [ %18, %23 ]
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 6
  %28 = load i32, i32* %27, align 8, !tbaa !156
  %29 = icmp eq i32 %28, %14
  br i1 %29, label %30, label %51

30:                                               ; preds = %25
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 4
  %32 = load i64, i64* %31, align 8, !tbaa !155
  %33 = icmp eq i64 %32, %21
  br i1 %33, label %34, label %51

34:                                               ; preds = %30
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 5
  %36 = load i8*, i8** %35, align 8, !tbaa !160
  %37 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %36, i8* %1, i64 %21) #17
  br i1 %37, label %38, label %51

38:                                               ; preds = %34
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 10
  %40 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %39, align 8, !tbaa !159
  %41 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %40) #17
  br i1 %41, label %42, label %51

42:                                               ; preds = %38
  %43 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 8
  %44 = load i32, i32* %43, align 8, !tbaa !133
  %45 = icmp eq i32 %44, %4
  br i1 %45, label %84, label %51

46:                                               ; preds = %65
  br i1 %73, label %47, label %51

47:                                               ; preds = %46
  %48 = and i8 %80, 1
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %50, label %.preheader114

.preheader114:                                    ; preds = %50, %47
  br label %55

50:                                               ; preds = %47
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.8.47, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %.preheader114

51:                                               ; preds = %46, %42, %38, %34, %30, %25
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 0
  %53 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %52, align 8, !tbaa !12
  %54 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %53, null
  br i1 %54, label %.loopexit18, label %25, !llvm.loop !192

55:                                               ; preds = %.preheader114, %55
  %56 = phi i64 [ %63, %55 ], [ 0, %.preheader114 ]
  %57 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %56
  %58 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %57, align 8, !tbaa !12
  %59 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %58, i64 0, i32 2
  %60 = load i8*, i8** %59, align 8, !tbaa !73
  %61 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %60) #17
  %62 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %61, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %62, align 8, !tbaa !189
  %63 = add nuw nsw i64 %56, 1
  %64 = icmp eq i64 %63, %24
  br i1 %64, label %.loopexit15, label %55, !llvm.loop !193

65:                                               ; preds = %84, %65
  %66 = phi %struct.halide_buffer_t* [ %86, %84 ], [ %74, %65 ]
  %67 = phi i64 [ 0, %84 ], [ %81, %65 ]
  %68 = phi i8 [ 1, %84 ], [ %80, %65 ]
  %69 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %67
  %70 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %69, align 8, !tbaa !12
  %71 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %66, i64 %67, i32 6
  %72 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %71, align 8, !tbaa !77
  %73 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %70, %struct.halide_dimension_t* %72) #17
  %74 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %85, align 8, !tbaa !135
  %75 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %74, i64 %67, i32 2
  %76 = load i8*, i8** %75, align 8, !tbaa !73
  %77 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %70, i64 0, i32 2
  %78 = load i8*, i8** %77, align 8, !tbaa !73
  %79 = icmp eq i8* %76, %78
  %80 = select i1 %79, i8 0, i8 %68
  %81 = add nuw nsw i64 %67, 1
  %82 = icmp ult i64 %81, %24
  %83 = and i1 %82, %73
  br i1 %83, label %65, label %46, !llvm.loop !194

84:                                               ; preds = %42
  %85 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %26, i64 0, i32 11
  %86 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %85, align 8, !tbaa !135
  br label %65

.loopexit18:                                      ; preds = %110, %51, %8
  %87 = icmp sgt i32 %4, 0
  br i1 %87, label %88, label %.loopexit16

88:                                               ; preds = %.loopexit18
  %89 = zext i32 %4 to i64
  br label %119

.preheader19:                                     ; preds = %20, %110
  %90 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %112, %110 ], [ %18, %20 ]
  %91 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 6
  %92 = load i32, i32* %91, align 8, !tbaa !156
  %93 = icmp eq i32 %92, %14
  br i1 %93, label %94, label %110

94:                                               ; preds = %.preheader19
  %95 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 4
  %96 = load i64, i64* %95, align 8, !tbaa !155
  %97 = icmp eq i64 %96, %21
  br i1 %97, label %98, label %110

98:                                               ; preds = %94
  %99 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 5
  %100 = load i8*, i8** %99, align 8, !tbaa !160
  %101 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %100, i8* %1, i64 %21) #17
  br i1 %101, label %102, label %110

102:                                              ; preds = %98
  %103 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 10
  %104 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %103, align 8, !tbaa !159
  %105 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %104) #17
  br i1 %105, label %106, label %110

106:                                              ; preds = %102
  %107 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 8
  %108 = load i32, i32* %107, align 8, !tbaa !133
  %109 = icmp eq i32 %108, %4
  br i1 %109, label %.loopexit15, label %110

110:                                              ; preds = %106, %102, %98, %94, %.preheader19
  %111 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %90, i64 0, i32 0
  %112 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %111, align 8, !tbaa !12
  %113 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %112, null
  br i1 %113, label %.loopexit18, label %.preheader19, !llvm.loop !192

.loopexit16:                                      ; preds = %252, %.loopexit18
  %114 = phi i64 [ 0, %.loopexit18 ], [ %262, %252 ]
  %115 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  %116 = add i64 %115, %114
  store i64 %116, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #17
  %117 = tail call i8* @halide_malloc(i8* null, i64 96) #16
  %118 = icmp eq i8* %117, null
  br i1 %118, label %269, label %265

119:                                              ; preds = %252, %88
  %120 = phi i64 [ 0, %88 ], [ %263, %252 ]
  %121 = phi i64 [ 0, %88 ], [ %262, %252 ]
  %122 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %120
  %123 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %122, align 8, !tbaa !12
  %124 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %123, i64 0, i32 5
  %125 = load i32, i32* %124, align 4, !tbaa !76
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %252

127:                                              ; preds = %119
  %128 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %123, i64 0, i32 6
  %129 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %128, align 8, !tbaa !77
  %130 = zext i32 %125 to i64
  %min.iters.check70 = icmp ult i32 %125, 17
  br i1 %min.iters.check70, label %scalar.ph68.preheader, label %vector.ph71

vector.ph71:                                      ; preds = %127
  %n.mod.vf72 = and i64 %130, 15
  %131 = icmp eq i64 %n.mod.vf72, 0
  %132 = select i1 %131, i64 16, i64 %n.mod.vf72
  %n.vec73 = sub nsw i64 %130, %132
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69, %vector.ph71
  %index74 = phi i64 [ 0, %vector.ph71 ], [ %index.next75, %vector.body69 ]
  %vec.ind78 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph71 ], [ %vec.ind.next83, %vector.body69 ]
  %vec.phi84 = phi <4 x i64> [ zeroinitializer, %vector.ph71 ], [ %predphi100, %vector.body69 ]
  %vec.phi85 = phi <4 x i64> [ zeroinitializer, %vector.ph71 ], [ %predphi101, %vector.body69 ]
  %vec.phi86 = phi <4 x i64> [ zeroinitializer, %vector.ph71 ], [ %predphi102, %vector.body69 ]
  %vec.phi87 = phi <4 x i64> [ zeroinitializer, %vector.ph71 ], [ %predphi103, %vector.body69 ]
  %step.add79 = add <4 x i64> %vec.ind78, <i64 4, i64 4, i64 4, i64 4>
  %step.add80 = add <4 x i64> %vec.ind78, <i64 8, i64 8, i64 8, i64 8>
  %step.add81 = add <4 x i64> %vec.ind78, <i64 12, i64 12, i64 12, i64 12>
  %133 = or i64 %index74, 4
  %134 = or i64 %index74, 8
  %135 = or i64 %index74, 12
  %136 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %index74, i32 2
  %137 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %133, i32 2
  %138 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %134, i32 2
  %139 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %135, i32 2
  %140 = bitcast i32* %136 to <16 x i32>*
  %141 = bitcast i32* %137 to <16 x i32>*
  %142 = bitcast i32* %138 to <16 x i32>*
  %143 = bitcast i32* %139 to <16 x i32>*
  %wide.vec88 = load <16 x i32>, <16 x i32>* %140, align 4, !tbaa !83
  %wide.vec89 = load <16 x i32>, <16 x i32>* %141, align 4, !tbaa !83
  %wide.vec90 = load <16 x i32>, <16 x i32>* %142, align 4, !tbaa !83
  %wide.vec91 = load <16 x i32>, <16 x i32>* %143, align 4, !tbaa !83
  %strided.vec92 = shufflevector <16 x i32> %wide.vec88, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec93 = shufflevector <16 x i32> %wide.vec89, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec94 = shufflevector <16 x i32> %wide.vec90, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec95 = shufflevector <16 x i32> %wide.vec91, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %144 = icmp sgt <4 x i32> %strided.vec92, zeroinitializer
  %145 = icmp sgt <4 x i32> %strided.vec93, zeroinitializer
  %146 = icmp sgt <4 x i32> %strided.vec94, zeroinitializer
  %147 = icmp sgt <4 x i32> %strided.vec95, zeroinitializer
  %148 = zext <4 x i32> %strided.vec92 to <4 x i64>
  %149 = zext <4 x i32> %strided.vec93 to <4 x i64>
  %150 = zext <4 x i32> %strided.vec94 to <4 x i64>
  %151 = zext <4 x i32> %strided.vec95 to <4 x i64>
  %152 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %vec.ind78, i32 1
  %153 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %step.add79, i32 1
  %154 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %step.add80, i32 1
  %155 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %step.add81, i32 1
  %wide.masked.gather96 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %152, i32 4, <4 x i1> %144, <4 x i32> undef), !tbaa !79
  %wide.masked.gather97 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %153, i32 4, <4 x i1> %145, <4 x i32> undef), !tbaa !79
  %wide.masked.gather98 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %154, i32 4, <4 x i1> %146, <4 x i32> undef), !tbaa !79
  %wide.masked.gather99 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %155, i32 4, <4 x i1> %147, <4 x i32> undef), !tbaa !79
  %156 = add nsw <4 x i32> %wide.masked.gather96, <i32 -1, i32 -1, i32 -1, i32 -1>
  %157 = add nsw <4 x i32> %wide.masked.gather97, <i32 -1, i32 -1, i32 -1, i32 -1>
  %158 = add nsw <4 x i32> %wide.masked.gather98, <i32 -1, i32 -1, i32 -1, i32 -1>
  %159 = add nsw <4 x i32> %wide.masked.gather99, <i32 -1, i32 -1, i32 -1, i32 -1>
  %160 = sext <4 x i32> %156 to <4 x i64>
  %161 = sext <4 x i32> %157 to <4 x i64>
  %162 = sext <4 x i32> %158 to <4 x i64>
  %163 = sext <4 x i32> %159 to <4 x i64>
  %164 = mul nsw <4 x i64> %160, %148
  %165 = mul nsw <4 x i64> %161, %149
  %166 = mul nsw <4 x i64> %162, %150
  %167 = mul nsw <4 x i64> %163, %151
  %168 = select <4 x i1> %144, <4 x i64> %164, <4 x i64> zeroinitializer
  %predphi100 = add <4 x i64> %vec.phi84, %168
  %169 = select <4 x i1> %145, <4 x i64> %165, <4 x i64> zeroinitializer
  %predphi101 = add <4 x i64> %vec.phi85, %169
  %170 = select <4 x i1> %146, <4 x i64> %166, <4 x i64> zeroinitializer
  %predphi102 = add <4 x i64> %vec.phi86, %170
  %171 = select <4 x i1> %147, <4 x i64> %167, <4 x i64> zeroinitializer
  %predphi103 = add <4 x i64> %vec.phi87, %171
  %index.next75 = add i64 %index74, 16
  %vec.ind.next83 = add <4 x i64> %vec.ind78, <i64 16, i64 16, i64 16, i64 16>
  %172 = icmp eq i64 %index.next75, %n.vec73
  br i1 %172, label %middle.block67, label %vector.body69, !llvm.loop !195

middle.block67:                                   ; preds = %vector.body69
  %bin.rdx104 = add <4 x i64> %predphi101, %predphi100
  %bin.rdx105 = add <4 x i64> %predphi102, %bin.rdx104
  %bin.rdx106 = add <4 x i64> %predphi103, %bin.rdx105
  %173 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx106)
  br label %scalar.ph68.preheader

scalar.ph68.preheader:                            ; preds = %middle.block67, %127
  %.ph110 = phi i64 [ 0, %127 ], [ %n.vec73, %middle.block67 ]
  %.ph111 = phi i64 [ 0, %127 ], [ %173, %middle.block67 ]
  br label %scalar.ph68

scalar.ph68:                                      ; preds = %scalar.ph68.preheader, %187
  %174 = phi i64 [ %189, %187 ], [ %.ph110, %scalar.ph68.preheader ]
  %175 = phi i64 [ %188, %187 ], [ %.ph111, %scalar.ph68.preheader ]
  %176 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %174, i32 2
  %177 = load i32, i32* %176, align 4, !tbaa !83
  %178 = icmp sgt i32 %177, 0
  br i1 %178, label %179, label %187

179:                                              ; preds = %scalar.ph68
  %180 = zext i32 %177 to i64
  %181 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %174, i32 1
  %182 = load i32, i32* %181, align 4, !tbaa !79
  %183 = add nsw i32 %182, -1
  %184 = sext i32 %183 to i64
  %185 = mul nsw i64 %184, %180
  %186 = add nsw i64 %185, %175
  br label %187

187:                                              ; preds = %179, %scalar.ph68
  %188 = phi i64 [ %186, %179 ], [ %175, %scalar.ph68 ]
  %189 = add nuw nsw i64 %174, 1
  %190 = icmp eq i64 %189, %130
  br i1 %190, label %.preheader, label %scalar.ph68, !llvm.loop !196

.preheader:                                       ; preds = %187
  %min.iters.check = icmp ult i32 %125, 17
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %n.mod.vf = and i64 %130, 15
  %191 = icmp eq i64 %n.mod.vf, 0
  %192 = select i1 %191, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %130, %192
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi50 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi62, %vector.body ]
  %vec.phi51 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi63, %vector.body ]
  %vec.phi52 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi64, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add47 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add48 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %193 = or i64 %index, 4
  %194 = or i64 %index, 8
  %195 = or i64 %index, 12
  %196 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %index, i32 2
  %197 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %193, i32 2
  %198 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %194, i32 2
  %199 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %195, i32 2
  %200 = bitcast i32* %196 to <16 x i32>*
  %201 = bitcast i32* %197 to <16 x i32>*
  %202 = bitcast i32* %198 to <16 x i32>*
  %203 = bitcast i32* %199 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %200, align 4, !tbaa !83
  %wide.vec53 = load <16 x i32>, <16 x i32>* %201, align 4, !tbaa !83
  %wide.vec54 = load <16 x i32>, <16 x i32>* %202, align 4, !tbaa !83
  %wide.vec55 = load <16 x i32>, <16 x i32>* %203, align 4, !tbaa !83
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec56 = shufflevector <16 x i32> %wide.vec53, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec57 = shufflevector <16 x i32> %wide.vec54, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec58 = shufflevector <16 x i32> %wide.vec55, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %204 = icmp slt <4 x i32> %strided.vec, zeroinitializer
  %205 = icmp slt <4 x i32> %strided.vec56, zeroinitializer
  %206 = icmp slt <4 x i32> %strided.vec57, zeroinitializer
  %207 = icmp slt <4 x i32> %strided.vec58, zeroinitializer
  %208 = sext <4 x i32> %strided.vec to <4 x i64>
  %209 = sext <4 x i32> %strided.vec56 to <4 x i64>
  %210 = sext <4 x i32> %strided.vec57 to <4 x i64>
  %211 = sext <4 x i32> %strided.vec58 to <4 x i64>
  %212 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %vec.ind, i32 1
  %213 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %step.add, i32 1
  %214 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %step.add47, i32 1
  %215 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, <4 x i64> %step.add48, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %212, i32 4, <4 x i1> %204, <4 x i32> undef), !tbaa !79
  %wide.masked.gather59 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %213, i32 4, <4 x i1> %205, <4 x i32> undef), !tbaa !79
  %wide.masked.gather60 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %214, i32 4, <4 x i1> %206, <4 x i32> undef), !tbaa !79
  %wide.masked.gather61 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %215, i32 4, <4 x i1> %207, <4 x i32> undef), !tbaa !79
  %216 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %217 = add nsw <4 x i32> %wide.masked.gather59, <i32 -1, i32 -1, i32 -1, i32 -1>
  %218 = add nsw <4 x i32> %wide.masked.gather60, <i32 -1, i32 -1, i32 -1, i32 -1>
  %219 = add nsw <4 x i32> %wide.masked.gather61, <i32 -1, i32 -1, i32 -1, i32 -1>
  %220 = sext <4 x i32> %216 to <4 x i64>
  %221 = sext <4 x i32> %217 to <4 x i64>
  %222 = sext <4 x i32> %218 to <4 x i64>
  %223 = sext <4 x i32> %219 to <4 x i64>
  %224 = mul nsw <4 x i64> %220, %208
  %225 = mul nsw <4 x i64> %221, %209
  %226 = mul nsw <4 x i64> %222, %210
  %227 = mul nsw <4 x i64> %223, %211
  %228 = select <4 x i1> %204, <4 x i64> %224, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %228
  %229 = select <4 x i1> %205, <4 x i64> %225, <4 x i64> zeroinitializer
  %predphi62 = add <4 x i64> %vec.phi50, %229
  %230 = select <4 x i1> %206, <4 x i64> %226, <4 x i64> zeroinitializer
  %predphi63 = add <4 x i64> %vec.phi51, %230
  %231 = select <4 x i1> %207, <4 x i64> %227, <4 x i64> zeroinitializer
  %predphi64 = add <4 x i64> %vec.phi52, %231
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %232 = icmp eq i64 %index.next, %n.vec
  br i1 %232, label %middle.block, label %vector.body, !llvm.loop !197

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi62, %predphi
  %bin.rdx65 = add <4 x i64> %predphi63, %bin.rdx
  %bin.rdx66 = add <4 x i64> %predphi64, %bin.rdx65
  %233 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx66)
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %.preheader
  %.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  %.ph109 = phi i64 [ 0, %.preheader ], [ %233, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %247
  %234 = phi i64 [ %249, %247 ], [ %.ph, %scalar.ph.preheader ]
  %235 = phi i64 [ %248, %247 ], [ %.ph109, %scalar.ph.preheader ]
  %236 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %234, i32 2
  %237 = load i32, i32* %236, align 4, !tbaa !83
  %238 = icmp slt i32 %237, 0
  br i1 %238, label %239, label %247

239:                                              ; preds = %scalar.ph
  %240 = sext i32 %237 to i64
  %241 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %129, i64 %234, i32 1
  %242 = load i32, i32* %241, align 4, !tbaa !79
  %243 = add nsw i32 %242, -1
  %244 = sext i32 %243 to i64
  %245 = mul nsw i64 %244, %240
  %246 = add nsw i64 %245, %235
  br label %247

247:                                              ; preds = %239, %scalar.ph
  %248 = phi i64 [ %246, %239 ], [ %235, %scalar.ph ]
  %249 = add nuw nsw i64 %234, 1
  %250 = icmp eq i64 %249, %130
  br i1 %250, label %.loopexit108, label %scalar.ph, !llvm.loop !198

.loopexit108:                                     ; preds = %247
  %251 = add nsw i64 %188, 1
  br label %252

252:                                              ; preds = %.loopexit108, %119
  %253 = phi i64 [ 1, %119 ], [ %251, %.loopexit108 ]
  %254 = phi i64 [ 0, %119 ], [ %248, %.loopexit108 ]
  %255 = sub nsw i64 %253, %254
  %256 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %123, i64 0, i32 4, i32 1
  %257 = load i8, i8* %256, align 1, !tbaa !28
  %258 = zext i8 %257 to i64
  %259 = add nuw nsw i64 %258, 7
  %260 = lshr i64 %259, 3
  %261 = mul i64 %260, %255
  %262 = add i64 %261, %121
  %263 = add nuw nsw i64 %120, 1
  %264 = icmp eq i64 %263, %89
  br i1 %264, label %.loopexit16, label %119, !llvm.loop !199

265:                                              ; preds = %.loopexit16
  %266 = bitcast i8* %117 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  %267 = sext i32 %2 to i64
  %268 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_by(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %266, i8* %1, i64 %267, i32 %14, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** nonnull %5, i1 zeroext %6, i64 %7) #17
  br i1 %268, label %285, label %269

269:                                              ; preds = %265, %.loopexit16
  %270 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  %271 = sub i64 %270, %114
  store i64 %271, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !64
  br i1 %87, label %272, label %.loopexit

272:                                              ; preds = %269
  %273 = zext i32 %4 to i64
  br label %274

.loopexit:                                        ; preds = %274, %269
  br i1 %118, label %.loopexit15, label %284

274:                                              ; preds = %274, %272
  %275 = phi i64 [ 0, %272 ], [ %282, %274 ]
  %276 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %275
  %277 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %276, align 8, !tbaa !12
  %278 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %277, i64 0, i32 2
  %279 = load i8*, i8** %278, align 8, !tbaa !73
  %280 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %279) #17
  %281 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %280, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %281, align 8, !tbaa !189
  %282 = add nuw nsw i64 %275, 1
  %283 = icmp eq i64 %282, %273
  br i1 %283, label %.loopexit, label %274, !llvm.loop !200

284:                                              ; preds = %.loopexit
  tail call void @halide_free(i8* %0, i8* nonnull %117) #16
  br label %.loopexit15

285:                                              ; preds = %265
  %286 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %17, align 8, !tbaa !12
  %287 = bitcast i8* %117 to %"struct.Halide::Runtime::Internal::CacheEntry"**
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %286, %"struct.Halide::Runtime::Internal::CacheEntry"** %287, align 8, !tbaa !128
  %288 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  %289 = getelementptr inbounds i8, i8* %117, i64 16
  %290 = bitcast i8* %289 to %"struct.Halide::Runtime::Internal::CacheEntry"**
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %288, %"struct.Halide::Runtime::Internal::CacheEntry"** %290, align 8, !tbaa !154
  %291 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %288, null
  br i1 %291, label %295, label %292

292:                                              ; preds = %285
  %293 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %288, i64 0, i32 1
  %294 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %293 to i8**
  store i8* %117, i8** %294, align 8, !tbaa !171
  br label %295

295:                                              ; preds = %292, %285
  store i8* %117, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE to i8**), align 8, !tbaa !12
  %296 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !12
  %297 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %296, null
  br i1 %297, label %298, label %299

298:                                              ; preds = %295
  store i8* %117, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE to i8**), align 8, !tbaa !12
  br label %299

299:                                              ; preds = %298, %295
  %300 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %17 to i8**
  store i8* %117, i8** %300, align 8, !tbaa !12
  %301 = getelementptr inbounds i8, i8* %117, i64 52
  %302 = bitcast i8* %301 to i32*
  store i32 %4, i32* %302, align 4, !tbaa !157
  br i1 %87, label %303, label %.loopexit15

303:                                              ; preds = %299
  %304 = zext i32 %4 to i64
  br label %305

305:                                              ; preds = %305, %303
  %306 = phi i64 [ 0, %303 ], [ %313, %305 ]
  %307 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %306
  %308 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %307, align 8, !tbaa !12
  %309 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %308, i64 0, i32 2
  %310 = load i8*, i8** %309, align 8, !tbaa !73
  %311 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %310) #17
  %312 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %311 to i8**
  store i8* %117, i8** %312, align 8, !tbaa !189
  %313 = add nuw nsw i64 %306, 1
  %314 = icmp eq i64 %313, %304
  br i1 %314, label %.loopexit15, label %305, !llvm.loop !201

.loopexit15:                                      ; preds = %106, %55, %305, %299, %284, %.loopexit
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret i32 0
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_release(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %1) #17
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3, i64 0, i32 0
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !189
  %6 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3 to i8*
  tail call void @halide_free(i8* %0, i8* %8) #16
  br label %18

9:                                                ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %5, i64 0, i32 7
  %11 = load i32, i32* %10, align 4, !tbaa !157
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([87 x i8], [87 x i8]* @.str.11.48, i64 0, i64 0)) #16
  tail call void @abort() #16
  %14 = load i32, i32* %10, align 4, !tbaa !157
  br label %15

15:                                               ; preds = %13, %9
  %16 = phi i32 [ %14, %13 ], [ %11, %9 ]
  %17 = add i32 %16, -1
  store i32 %17, i32* %10, align 4, !tbaa !157
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  br label %18

18:                                               ; preds = %15, %7
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_evict(i8* %0, i64 %1) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  br label %4

3:                                                ; preds = %.loopexit
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #16
  ret void

4:                                                ; preds = %.loopexit, %2
  %5 = phi i64 [ 0, %2 ], [ %39, %.loopexit ]
  %6 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %5
  %7 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %6, align 8, !tbaa !12
  %8 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %7, null
  br i1 %8, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %4, %36
  %9 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ %37, %36 ], [ %6, %4 ]
  %10 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %12, %36 ], [ %7, %4 ]
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 0
  %12 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %11, align 8, !tbaa !128
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 13
  %14 = load i8, i8* %13, align 8, !tbaa !164, !range !21
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %36, label %16

16:                                               ; preds = %.preheader
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 12
  %18 = load i64, i64* %17, align 8, !tbaa !165
  %19 = icmp eq i64 %18, %1
  br i1 %19, label %20, label %36

20:                                               ; preds = %16
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %12, %"struct.Halide::Runtime::Internal::CacheEntry"** %9, align 8, !tbaa !12
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 1
  %22 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %21, align 8, !tbaa !171
  %23 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %22, null
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 2
  %25 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %24, align 8, !tbaa !154
  br i1 %23, label %29, label %26

26:                                               ; preds = %20
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %22, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %25, %"struct.Halide::Runtime::Internal::CacheEntry"** %27, align 8, !tbaa !154
  %28 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %24, align 8, !tbaa !154
  br label %30

29:                                               ; preds = %20
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %25, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !12
  br label %30

30:                                               ; preds = %29, %26
  %31 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %25, %29 ], [ %28, %26 ]
  %32 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %31, null
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %31, i64 0, i32 1
  %34 = select i1 %32, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, %"struct.Halide::Runtime::Internal::CacheEntry"** %33
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %22, %"struct.Halide::Runtime::Internal::CacheEntry"** %34, align 8, !tbaa !12
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull dereferenceable(96) %10) #17
  %35 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %10 to i8*
  tail call void @halide_free(i8* %0, i8* nonnull %35) #16
  br label %36

36:                                               ; preds = %30, %16, %.preheader
  %37 = phi %"struct.Halide::Runtime::Internal::CacheEntry"** [ %9, %30 ], [ %11, %16 ], [ %11, %.preheader ]
  %38 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %12, null
  br i1 %38, label %.loopexit, label %.preheader, !llvm.loop !202

.loopexit:                                        ; preds = %36, %4
  %39 = add nuw nsw i64 %5, 1
  %40 = icmp eq i64 %39, 256
  br i1 %40, label %3, label %4, !llvm.loop !203
}

; Function Attrs: nounwind
define weak i8* @halide_string_to_string(i8* %0, i8* %1, i8* %2) local_unnamed_addr #4 {
  %4 = icmp ult i8* %0, %1
  br i1 %4, label %.preheader, label %.loopexit

5:                                                ; preds = %10
  store i8 0, i8* %7, align 1, !tbaa !38
  br label %.loopexit

.preheader:                                       ; preds = %3, %10
  %6 = phi i8* [ %12, %10 ], [ %2, %3 ]
  %7 = phi i8* [ %11, %10 ], [ %0, %3 ]
  %8 = load i8, i8* %6, align 1, !tbaa !38
  store i8 %8, i8* %7, align 1, !tbaa !38
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %.loopexit, label %10

10:                                               ; preds = %.preheader
  %11 = getelementptr inbounds i8, i8* %7, i64 1
  %12 = getelementptr inbounds i8, i8* %6, i64 1
  %13 = icmp eq i8* %11, %1
  br i1 %13, label %5, label %.preheader

.loopexit:                                        ; preds = %.preheader, %5, %3
  %14 = phi i8* [ %1, %5 ], [ %0, %3 ], [ %7, %.preheader ]
  ret i8* %14
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_uint64_to_string(i8* %0, i8* %1, i64 %2, i32 %3) local_unnamed_addr #0 {
  %5 = alloca [32 x i8], align 1
  %6 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #18
  %7 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 31
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 30
  %9 = icmp sgt i32 %3, 0
  %10 = icmp ne i64 %2, 0
  %11 = or i1 %10, %9
  br i1 %11, label %.preheader, label %.loopexit

.loopexit:                                        ; preds = %.preheader, %4
  %12 = phi i8* [ %8, %4 ], [ %23, %.preheader ]
  %13 = getelementptr inbounds i8, i8* %12, i64 1
  %14 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %13) #17
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #18
  ret i8* %14

.preheader:                                       ; preds = %4, %.preheader
  %15 = phi i64 [ %18, %.preheader ], [ %2, %4 ]
  %16 = phi i8* [ %23, %.preheader ], [ %8, %4 ]
  %17 = phi i32 [ %24, %.preheader ], [ 0, %4 ]
  %18 = udiv i64 %15, 10
  %19 = mul i64 %18, -10
  %20 = add i64 %19, %15
  %21 = trunc i64 %20 to i8
  %22 = add i8 %21, 48
  store i8 %22, i8* %16, align 1, !tbaa !38
  %23 = getelementptr inbounds i8, i8* %16, i64 -1
  %24 = add nuw nsw i32 %17, 1
  %25 = icmp slt i32 %24, %3
  %26 = icmp ugt i64 %15, 9
  %27 = or i1 %26, %25
  br i1 %27, label %.preheader, label %.loopexit, !llvm.loop !204
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_int64_to_string(i8* %0, i8* %1, i64 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp slt i64 %2, 0
  %6 = icmp ult i8* %0, %1
  %7 = and i1 %6, %5
  br i1 %7, label %8, label %11

8:                                                ; preds = %4
  %9 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 45, i8* %0, align 1, !tbaa !38
  %10 = sub nsw i64 0, %2
  br label %11

11:                                               ; preds = %8, %4
  %12 = phi i64 [ %10, %8 ], [ %2, %4 ]
  %13 = phi i8* [ %9, %8 ], [ %0, %4 ]
  %14 = tail call i8* @halide_uint64_to_string(i8* %13, i8* %1, i64 %12, i32 %3) #17
  ret i8* %14
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_double_to_string(i8* %0, i8* %1, double %2, i32 %3) local_unnamed_addr #0 {
  %5 = alloca double, align 8
  %6 = alloca i64, align 8
  %7 = alloca [512 x i8], align 1
  store double %2, double* %5, align 8, !tbaa !62
  %8 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #18
  store i64 0, i64* %6, align 8, !tbaa !64
  %9 = bitcast double* %5 to i8*
  %10 = call i8* @memcpy(i8* nonnull %8, i8* nonnull %9, i64 8) #16
  %11 = load i64, i64* %6, align 8, !tbaa !64
  %12 = and i64 %11, 4503599627370495
  %13 = lshr i64 %11, 52
  %14 = trunc i64 %13 to i32
  %15 = and i32 %14, 2047
  %16 = icmp eq i32 %15, 2047
  br i1 %16, label %17, label %30

17:                                               ; preds = %4
  %18 = icmp eq i64 %12, 0
  %19 = icmp sgt i64 %11, -1
  br i1 %18, label %25, label %20

20:                                               ; preds = %17
  br i1 %19, label %23, label %21

21:                                               ; preds = %20
  %22 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i64 0, i64 0)) #17
  br label %190

23:                                               ; preds = %20
  %24 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.58, i64 0, i64 0)) #17
  br label %190

25:                                               ; preds = %17
  br i1 %19, label %28, label %26

26:                                               ; preds = %25
  %27 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.59, i64 0, i64 0)) #17
  br label %190

28:                                               ; preds = %25
  %29 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.60, i64 0, i64 0)) #17
  br label %190

30:                                               ; preds = %4
  %31 = icmp eq i32 %15, 0
  %32 = icmp eq i64 %12, 0
  %33 = and i1 %32, %31
  br i1 %33, label %34, label %47

34:                                               ; preds = %30
  %35 = icmp eq i32 %3, 0
  %36 = icmp sgt i64 %11, -1
  br i1 %35, label %42, label %37

37:                                               ; preds = %34
  br i1 %36, label %40, label %38

38:                                               ; preds = %37
  %39 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4.61, i64 0, i64 0)) #17
  br label %190

40:                                               ; preds = %37
  %41 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5.62, i64 0, i64 0)) #17
  br label %190

42:                                               ; preds = %34
  br i1 %36, label %45, label %43

43:                                               ; preds = %42
  %44 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6.63, i64 0, i64 0)) #17
  br label %190

45:                                               ; preds = %42
  %46 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7.64, i64 0, i64 0)) #17
  br label %190

47:                                               ; preds = %30
  %48 = icmp sgt i64 %11, -1
  br i1 %48, label %53, label %49

49:                                               ; preds = %47
  %50 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.65, i64 0, i64 0)) #17
  %51 = load double, double* %5, align 8, !tbaa !62
  %52 = fneg double %51
  store double %52, double* %5, align 8, !tbaa !62
  br label %53

53:                                               ; preds = %49, %47
  %54 = phi i8* [ %50, %49 ], [ %0, %47 ]
  %55 = icmp eq i32 %3, 0
  br i1 %55, label %98, label %56

56:                                               ; preds = %53
  %57 = load double, double* %5, align 8, !tbaa !62
  %58 = fcmp olt double %57, 1.000000e+00
  br i1 %58, label %.preheader14, label %65

.preheader14:                                     ; preds = %56, %.preheader14
  %59 = phi i32 [ %62, %.preheader14 ], [ 0, %56 ]
  %60 = phi double [ %61, %.preheader14 ], [ %57, %56 ]
  %61 = fmul double %60, 1.000000e+01
  %62 = add nsw i32 %59, -1
  %63 = fcmp olt double %61, 1.000000e+00
  br i1 %63, label %.preheader14, label %64, !llvm.loop !205

64:                                               ; preds = %.preheader14
  store double %61, double* %5, align 8, !tbaa !62
  br label %65

65:                                               ; preds = %64, %56
  %66 = phi double [ %61, %64 ], [ %57, %56 ]
  %67 = phi i32 [ %62, %64 ], [ 0, %56 ]
  %68 = fcmp ult double %66, 1.000000e+01
  br i1 %68, label %75, label %.preheader13

.preheader13:                                     ; preds = %65, %.preheader13
  %69 = phi i32 [ %72, %.preheader13 ], [ %67, %65 ]
  %70 = phi double [ %71, %.preheader13 ], [ %66, %65 ]
  %71 = fdiv double %70, 1.000000e+01
  %72 = add nsw i32 %69, 1
  %73 = fcmp ult double %71, 1.000000e+01
  br i1 %73, label %74, label %.preheader13, !llvm.loop !206

74:                                               ; preds = %.preheader13
  store double %71, double* %5, align 8, !tbaa !62
  br label %75

75:                                               ; preds = %74, %65
  %76 = phi double [ %71, %74 ], [ %66, %65 ]
  %77 = phi i32 [ %72, %74 ], [ %67, %65 ]
  %78 = fmul double %76, 1.000000e+06
  %79 = fadd double %78, 5.000000e-01
  %80 = fptoui double %79 to i64
  %81 = udiv i64 %80, 1000000
  %82 = mul i64 %81, -1000000
  %83 = add i64 %82, %80
  %84 = call i8* @halide_int64_to_string(i8* %54, i8* %1, i64 %81, i32 1) #17
  %85 = call i8* @halide_string_to_string(i8* %84, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #17
  %86 = call i8* @halide_int64_to_string(i8* %85, i8* %1, i64 %83, i32 6) #17
  %87 = icmp sgt i32 %77, -1
  br i1 %87, label %88, label %90

88:                                               ; preds = %75
  %89 = call i8* @halide_string_to_string(i8* %86, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10.67, i64 0, i64 0)) #17
  br label %93

90:                                               ; preds = %75
  %91 = call i8* @halide_string_to_string(i8* %86, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.68, i64 0, i64 0)) #17
  %92 = sub nsw i32 0, %77
  br label %93

93:                                               ; preds = %90, %88
  %94 = phi i32 [ %77, %88 ], [ %92, %90 ]
  %95 = phi i8* [ %89, %88 ], [ %91, %90 ]
  %96 = zext i32 %94 to i64
  %97 = call i8* @halide_int64_to_string(i8* %95, i8* %1, i64 %96, i32 2) #17
  br label %190

98:                                               ; preds = %53
  br i1 %31, label %99, label %101

99:                                               ; preds = %98
  %100 = call i8* @halide_double_to_string(i8* %54, i8* %1, double 0.000000e+00, i32 0) #17
  br label %190

101:                                              ; preds = %98
  %102 = or i64 %12, 4503599627370496
  %103 = add nsw i32 %15, -1075
  %104 = icmp ult i32 %15, 1075
  br i1 %104, label %105, label %133

105:                                              ; preds = %101
  %106 = icmp ult i32 %15, 1023
  %107 = sub nuw nsw i32 1075, %15
  %108 = zext i32 %107 to i64
  %109 = lshr i64 %102, %108
  %110 = shl i64 %109, %108
  %111 = select i1 %106, i64 0, i64 %109
  %112 = select i1 %106, i64 0, i64 %110
  %113 = sub i64 %102, %112
  %114 = uitofp i64 %113 to double
  %115 = zext i32 %103 to i64
  %116 = shl i64 %115, 52
  %117 = add i64 %116, 4696837146684686336
  %118 = bitcast i64 %117 to double
  %119 = fmul double %118, %114
  %120 = fadd double %119, 5.000000e-01
  %121 = fptoui double %120 to i64
  %122 = uitofp i64 %121 to double
  %123 = fcmp oeq double %120, %122
  %124 = and i64 %121, 1
  %125 = icmp ne i64 %124, 0
  %126 = and i1 %123, %125
  %127 = sext i1 %126 to i64
  %128 = add i64 %127, %121
  %129 = icmp eq i64 %128, 1000000
  %130 = zext i1 %129 to i64
  %131 = add nuw i64 %111, %130
  %132 = select i1 %129, i64 0, i64 %128
  br label %133

133:                                              ; preds = %105, %101
  %134 = phi i64 [ %131, %105 ], [ %102, %101 ]
  %135 = phi i32 [ 0, %105 ], [ %103, %101 ]
  %136 = phi i64 [ %132, %105 ], [ 0, %101 ]
  %137 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %137) #18
  %138 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 512
  %139 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 480
  %140 = call i8* @halide_int64_to_string(i8* nonnull %139, i8* nonnull %138, i64 %134, i32 1) #17
  %141 = icmp sgt i32 %135, 0
  br i1 %141, label %.preheader12.preheader, label %.loopexit

.preheader12.preheader:                           ; preds = %133
  %xtraiter = and i32 %135, 1
  %142 = icmp eq i32 %135, 1
  br i1 %142, label %.loopexit.loopexit.unr-lcssa, label %.preheader12.preheader.new

.preheader12.preheader.new:                       ; preds = %.preheader12.preheader
  %unroll_iter = and i32 %135, -2
  br label %.preheader12

.preheader12:                                     ; preds = %211, %.preheader12.preheader.new
  %143 = phi i8* [ %139, %.preheader12.preheader.new ], [ %212, %211 ]
  %niter = phi i32 [ %unroll_iter, %.preheader12.preheader.new ], [ %niter.nsub.1, %211 ]
  %144 = icmp eq i8* %140, %143
  br i1 %144, label %.preheader12.1, label %.preheader

.loopexit.loopexit.unr-lcssa:                     ; preds = %211, %.preheader12.preheader
  %.lcssa35.ph = phi i8* [ undef, %.preheader12.preheader ], [ %212, %211 ]
  %.unr40 = phi i8* [ %139, %.preheader12.preheader ], [ %212, %211 ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.preheader12.epil

.preheader12.epil:                                ; preds = %.loopexit.loopexit.unr-lcssa
  %145 = icmp eq i8* %140, %.unr40
  br i1 %145, label %.loopexit, label %.preheader.epil

.preheader.epil:                                  ; preds = %.preheader12.epil, %.preheader.epil
  %146 = phi i8* [ %148, %.preheader.epil ], [ %140, %.preheader12.epil ]
  %147 = phi i32 [ %157, %.preheader.epil ], [ 0, %.preheader12.epil ]
  %148 = getelementptr inbounds i8, i8* %146, i64 -1
  %149 = load i8, i8* %148, align 1, !tbaa !38
  %150 = add i8 %149, -48
  %151 = sext i8 %150 to i32
  %152 = shl nsw i32 %151, 1
  %153 = or i32 %152, %147
  %154 = trunc i32 %153 to i8
  %155 = icmp sgt i8 %154, 9
  %156 = add nsw i32 %153, 246
  %157 = zext i1 %155 to i32
  %158 = select i1 %155, i32 %156, i32 %153
  %159 = trunc i32 %158 to i8
  %160 = add i8 %159, 48
  store i8 %160, i8* %148, align 1, !tbaa !38
  %161 = icmp eq i8* %148, %.unr40
  br i1 %161, label %162, label %.preheader.epil, !llvm.loop !207

162:                                              ; preds = %.preheader.epil
  br i1 %155, label %163, label %.loopexit

163:                                              ; preds = %162
  %164 = getelementptr inbounds i8, i8* %.unr40, i64 -1
  store i8 49, i8* %164, align 1, !tbaa !38
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.preheader12.epil, %162, %163, %133
  %165 = phi i8* [ %139, %133 ], [ %.lcssa35.ph, %.loopexit.loopexit.unr-lcssa ], [ %164, %163 ], [ %.unr40, %162 ], [ %140, %.preheader12.epil ]
  %166 = call i8* @halide_string_to_string(i8* %54, i8* %1, i8* %165) #17
  %167 = call i8* @halide_string_to_string(i8* %166, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #17
  %168 = call i8* @halide_int64_to_string(i8* %167, i8* %1, i64 %136, i32 6) #17
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %137) #18
  br label %190

169:                                              ; preds = %.preheader
  br i1 %179, label %186, label %.preheader12.1

.preheader:                                       ; preds = %.preheader12, %.preheader
  %170 = phi i8* [ %172, %.preheader ], [ %140, %.preheader12 ]
  %171 = phi i32 [ %181, %.preheader ], [ 0, %.preheader12 ]
  %172 = getelementptr inbounds i8, i8* %170, i64 -1
  %173 = load i8, i8* %172, align 1, !tbaa !38
  %174 = add i8 %173, -48
  %175 = sext i8 %174 to i32
  %176 = shl nsw i32 %175, 1
  %177 = or i32 %176, %171
  %178 = trunc i32 %177 to i8
  %179 = icmp sgt i8 %178, 9
  %180 = add nsw i32 %177, 246
  %181 = zext i1 %179 to i32
  %182 = select i1 %179, i32 %180, i32 %177
  %183 = trunc i32 %182 to i8
  %184 = add i8 %183, 48
  store i8 %184, i8* %172, align 1, !tbaa !38
  %185 = icmp eq i8* %172, %143
  br i1 %185, label %169, label %.preheader, !llvm.loop !207

186:                                              ; preds = %169
  %187 = getelementptr inbounds i8, i8* %143, i64 -1
  store i8 49, i8* %187, align 1, !tbaa !38
  br label %.preheader12.1

.preheader12.1:                                   ; preds = %186, %169, %.preheader12
  %188 = phi i8* [ %187, %186 ], [ %143, %169 ], [ %140, %.preheader12 ]
  %189 = icmp eq i8* %140, %188
  br i1 %189, label %211, label %.preheader.1

190:                                              ; preds = %.loopexit, %99, %93, %45, %43, %40, %38, %28, %26, %23, %21
  %191 = phi i8* [ %22, %21 ], [ %24, %23 ], [ %27, %26 ], [ %29, %28 ], [ %39, %38 ], [ %41, %40 ], [ %44, %43 ], [ %46, %45 ], [ %100, %99 ], [ %97, %93 ], [ %168, %.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #18
  ret i8* %191

.preheader.1:                                     ; preds = %.preheader12.1, %.preheader.1
  %192 = phi i8* [ %194, %.preheader.1 ], [ %140, %.preheader12.1 ]
  %193 = phi i32 [ %203, %.preheader.1 ], [ 0, %.preheader12.1 ]
  %194 = getelementptr inbounds i8, i8* %192, i64 -1
  %195 = load i8, i8* %194, align 1, !tbaa !38
  %196 = add i8 %195, -48
  %197 = sext i8 %196 to i32
  %198 = shl nsw i32 %197, 1
  %199 = or i32 %198, %193
  %200 = trunc i32 %199 to i8
  %201 = icmp sgt i8 %200, 9
  %202 = add nsw i32 %199, 246
  %203 = zext i1 %201 to i32
  %204 = select i1 %201, i32 %202, i32 %199
  %205 = trunc i32 %204 to i8
  %206 = add i8 %205, 48
  store i8 %206, i8* %194, align 1, !tbaa !38
  %207 = icmp eq i8* %194, %188
  br i1 %207, label %208, label %.preheader.1, !llvm.loop !207

208:                                              ; preds = %.preheader.1
  br i1 %201, label %209, label %211

209:                                              ; preds = %208
  %210 = getelementptr inbounds i8, i8* %188, i64 -1
  store i8 49, i8* %210, align 1, !tbaa !38
  br label %211

211:                                              ; preds = %209, %208, %.preheader12.1
  %212 = phi i8* [ %210, %209 ], [ %188, %208 ], [ %140, %.preheader12.1 ]
  %niter.nsub.1 = add i32 %niter, -2
  %niter.ncmp.1 = icmp eq i32 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %.loopexit.loopexit.unr-lcssa, label %.preheader12, !llvm.loop !208
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_pointer_to_string(i8* %0, i8* %1, i8* %2) local_unnamed_addr #0 {
  %4 = alloca [20 x i8], align 1
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #18
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(20) %5, i8 0, i64 20, i1 false)
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 18
  %7 = ptrtoint i8* %2 to i64
  %8 = and i64 %7, 15
  %9 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %8
  %10 = load i8, i8* %9, align 1, !tbaa !38
  %11 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 17
  store i8 %10, i8* %6, align 1, !tbaa !38
  %12 = lshr i64 %7, 4
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %21, label %14

14:                                               ; preds = %3
  %15 = and i64 %12, 15
  %16 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1, !tbaa !38
  %18 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 16
  store i8 %17, i8* %11, align 1, !tbaa !38
  %19 = lshr i64 %7, 8
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %26

21:                                               ; preds = %117, %110, %103, %96, %89, %82, %75, %68, %61, %54, %47, %40, %33, %26, %14, %3
  %22 = phi i8* [ %6, %3 ], [ %11, %14 ], [ %18, %26 ], [ %30, %33 ], [ %37, %40 ], [ %44, %47 ], [ %51, %54 ], [ %58, %61 ], [ %65, %68 ], [ %72, %75 ], [ %79, %82 ], [ %86, %89 ], [ %93, %96 ], [ %100, %103 ], [ %107, %110 ], [ %114, %117 ]
  %23 = phi i8* [ %11, %3 ], [ %18, %14 ], [ %30, %26 ], [ %37, %33 ], [ %44, %40 ], [ %51, %47 ], [ %58, %54 ], [ %65, %61 ], [ %72, %68 ], [ %79, %75 ], [ %86, %82 ], [ %93, %89 ], [ %100, %96 ], [ %107, %103 ], [ %114, %110 ], [ %120, %117 ]
  %24 = getelementptr inbounds i8, i8* %22, i64 -2
  store i8 120, i8* %23, align 1, !tbaa !38
  store i8 48, i8* %24, align 1, !tbaa !38
  %25 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %24) #17
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #18
  ret i8* %25

26:                                               ; preds = %14
  %27 = and i64 %19, 15
  %28 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %27
  %29 = load i8, i8* %28, align 1, !tbaa !38
  %30 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 15
  store i8 %29, i8* %18, align 1, !tbaa !38
  %31 = lshr i64 %7, 12
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %21, label %33

33:                                               ; preds = %26
  %34 = and i64 %31, 15
  %35 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1, !tbaa !38
  %37 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 14
  store i8 %36, i8* %30, align 1, !tbaa !38
  %38 = lshr i64 %7, 16
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %21, label %40

40:                                               ; preds = %33
  %41 = and i64 %38, 15
  %42 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %41
  %43 = load i8, i8* %42, align 1, !tbaa !38
  %44 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 13
  store i8 %43, i8* %37, align 1, !tbaa !38
  %45 = lshr i64 %7, 20
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %21, label %47

47:                                               ; preds = %40
  %48 = and i64 %45, 15
  %49 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %48
  %50 = load i8, i8* %49, align 1, !tbaa !38
  %51 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 12
  store i8 %50, i8* %44, align 1, !tbaa !38
  %52 = lshr i64 %7, 24
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %21, label %54

54:                                               ; preds = %47
  %55 = and i64 %52, 15
  %56 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %55
  %57 = load i8, i8* %56, align 1, !tbaa !38
  %58 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 11
  store i8 %57, i8* %51, align 1, !tbaa !38
  %59 = lshr i64 %7, 28
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %21, label %61

61:                                               ; preds = %54
  %62 = and i64 %59, 15
  %63 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !38
  %65 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 10
  store i8 %64, i8* %58, align 1, !tbaa !38
  %66 = lshr i64 %7, 32
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %21, label %68

68:                                               ; preds = %61
  %69 = and i64 %66, 15
  %70 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %69
  %71 = load i8, i8* %70, align 1, !tbaa !38
  %72 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 9
  store i8 %71, i8* %65, align 1, !tbaa !38
  %73 = lshr i64 %7, 36
  %74 = icmp eq i64 %73, 0
  br i1 %74, label %21, label %75

75:                                               ; preds = %68
  %76 = and i64 %73, 15
  %77 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %76
  %78 = load i8, i8* %77, align 1, !tbaa !38
  %79 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 8
  store i8 %78, i8* %72, align 1, !tbaa !38
  %80 = lshr i64 %7, 40
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %21, label %82

82:                                               ; preds = %75
  %83 = and i64 %80, 15
  %84 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !38
  %86 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 7
  store i8 %85, i8* %79, align 1, !tbaa !38
  %87 = lshr i64 %7, 44
  %88 = icmp eq i64 %87, 0
  br i1 %88, label %21, label %89

89:                                               ; preds = %82
  %90 = and i64 %87, 15
  %91 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %90
  %92 = load i8, i8* %91, align 1, !tbaa !38
  %93 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 6
  store i8 %92, i8* %86, align 1, !tbaa !38
  %94 = lshr i64 %7, 48
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %21, label %96

96:                                               ; preds = %89
  %97 = and i64 %94, 15
  %98 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !38
  %100 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 5
  store i8 %99, i8* %93, align 1, !tbaa !38
  %101 = lshr i64 %7, 52
  %102 = icmp eq i64 %101, 0
  br i1 %102, label %21, label %103

103:                                              ; preds = %96
  %104 = and i64 %101, 15
  %105 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %104
  %106 = load i8, i8* %105, align 1, !tbaa !38
  %107 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 4
  store i8 %106, i8* %100, align 1, !tbaa !38
  %108 = lshr i64 %7, 56
  %109 = icmp eq i64 %108, 0
  br i1 %109, label %21, label %110

110:                                              ; preds = %103
  %111 = and i64 %108, 15
  %112 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %111
  %113 = load i8, i8* %112, align 1, !tbaa !38
  %114 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 3
  store i8 %113, i8* %107, align 1, !tbaa !38
  %115 = lshr i64 %7, 60
  %116 = icmp eq i64 %115, 0
  br i1 %116, label %21, label %117

117:                                              ; preds = %110
  %118 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %115
  %119 = load i8, i8* %118, align 1, !tbaa !38
  %120 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 2
  store i8 %119, i8* %114, align 1, !tbaa !38
  br label %21
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_type_to_string(i8* %0, i8* %1, %struct.halide_type_t* %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 0
  %5 = load i8, i8* %4, align 2, !tbaa !209
  %6 = icmp ult i8 %5, 4
  br i1 %6, label %switch.lookup, label %8

switch.lookup:                                    ; preds = %3
  %7 = sext i8 %5 to i64
  %switch.gep = getelementptr inbounds [4 x i8*], [4 x i8*]* @switch.table.halide_type_to_string, i64 0, i64 %7
  %switch.load = load i8*, i8** %switch.gep, align 8
  br label %8

8:                                                ; preds = %3, %switch.lookup
  %9 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.17.72, i64 0, i64 0), %3 ]
  %10 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %9) #17
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 1
  %12 = load i8, i8* %11, align 1, !tbaa !28
  %13 = zext i8 %12 to i64
  %14 = tail call i8* @halide_uint64_to_string(i8* %10, i8* %1, i64 %13, i32 1) #17
  %15 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 2
  %16 = load i16, i16* %15, align 2, !tbaa !210
  %17 = icmp eq i16 %16, 1
  br i1 %17, label %23, label %18

18:                                               ; preds = %8
  %19 = tail call i8* @halide_string_to_string(i8* %14, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18.77, i64 0, i64 0)) #17
  %20 = load i16, i16* %15, align 2, !tbaa !210
  %21 = zext i16 %20 to i64
  %22 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %1, i64 %21, i32 1) #17
  br label %23

23:                                               ; preds = %18, %8
  %24 = phi i8* [ %22, %18 ], [ %14, %8 ]
  ret i8* %24
}

; Function Attrs: nounwind mustprogress
define weak i8* @halide_buffer_to_string(i8* %0, i8* %1, %struct.halide_buffer_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %2, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19.78, i64 0, i64 0)) #17
  br label %61

7:                                                ; preds = %3
  %8 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20.79, i64 0, i64 0)) #17
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !75
  %11 = tail call i8* @halide_uint64_to_string(i8* %8, i8* %1, i64 %10, i32 1) #17
  %12 = tail call i8* @halide_string_to_string(i8* %11, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 1
  %14 = bitcast %struct.halide_device_interface_t** %13 to i8**
  %15 = load i8*, i8** %14, align 8, !tbaa !211
  %16 = tail call i8* @halide_pointer_to_string(i8* %12, i8* %1, i8* %15) #17
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %18 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !73
  %20 = tail call i8* @halide_pointer_to_string(i8* %17, i8* %1, i8* %19) #17
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 3
  %23 = load i64, i64* %22, align 8, !tbaa !212
  %24 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %1, i64 %23, i32 1) #17
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %26 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4
  %27 = tail call i8* @halide_type_to_string(i8* %25, i8* %1, %struct.halide_type_t* nonnull %26) #17
  %28 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %29 = load i32, i32* %28, align 4, !tbaa !76
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %.loopexit

31:                                               ; preds = %7
  %32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 6
  br label %35

.loopexit:                                        ; preds = %35, %7
  %33 = phi i8* [ %27, %7 ], [ %56, %35 ]
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #17
  br label %61

35:                                               ; preds = %35, %31
  %36 = phi i64 [ 0, %31 ], [ %57, %35 ]
  %37 = phi i8* [ %27, %31 ], [ %56, %35 ]
  %38 = tail call i8* @halide_string_to_string(i8* %37, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22.82, i64 0, i64 0)) #17
  %39 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !77
  %40 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %36, i32 0
  %41 = load i32, i32* %40, align 4, !tbaa !82
  %42 = sext i32 %41 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %38, i8* %1, i64 %42, i32 1) #17
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %45 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !77
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %45, i64 %36, i32 1
  %47 = load i32, i32* %46, align 4, !tbaa !79
  %48 = sext i32 %47 to i64
  %49 = tail call i8* @halide_int64_to_string(i8* %44, i8* %1, i64 %48, i32 1) #17
  %50 = tail call i8* @halide_string_to_string(i8* %49, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #17
  %51 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !77
  %52 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %51, i64 %36, i32 2
  %53 = load i32, i32* %52, align 4, !tbaa !83
  %54 = sext i32 %53 to i64
  %55 = tail call i8* @halide_int64_to_string(i8* %50, i8* %1, i64 %54, i32 1) #17
  %56 = tail call i8* @halide_string_to_string(i8* %55, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23.83, i64 0, i64 0)) #17
  %57 = add nuw nsw i64 %36, 1
  %58 = load i32, i32* %28, align 4, !tbaa !76
  %59 = sext i32 %58 to i64
  %60 = icmp slt i64 %57, %59
  br i1 %60, label %35, label %.loopexit, !llvm.loop !213

61:                                               ; preds = %.loopexit, %5
  %62 = phi i8* [ %6, %5 ], [ %34, %.loopexit ]
  ret i8* %62
}

; Function Attrs: alwaysinline nounwind willreturn mustprogress
define weak i32 @halide_malloc_alignment() local_unnamed_addr #6 {
  ret i32 64
}

; Function Attrs: nounwind
define weak i32 @halide_reuse_device_allocations(i8* %0, i1 zeroext %1) local_unnamed_addr #4 {
  %3 = zext i1 %1 to i8
  store i8 %3, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !18
  br i1 %1, label %18, label %4

4:                                                ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  %5 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !12
  %6 = icmp eq %struct.halide_device_allocation_pool* %5, null
  br i1 %6, label %.loopexit, label %.preheader

.loopexit:                                        ; preds = %.preheader, %4
  %7 = phi i32 [ 0, %4 ], [ %14, %.preheader ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  br label %18

.preheader:                                       ; preds = %4, %.preheader
  %8 = phi %struct.halide_device_allocation_pool* [ %16, %.preheader ], [ %5, %4 ]
  %9 = phi i32 [ %14, %.preheader ], [ 0, %4 ]
  %10 = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %8, i64 0, i32 0
  %11 = load i32 (i8*)*, i32 (i8*)** %10, align 8, !tbaa !214
  %12 = tail call i32 %11(i8* %0) #16
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %13, i32 %9, i32 %12
  %15 = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %8, i64 0, i32 1
  %16 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** %15, align 8, !tbaa !12
  %17 = icmp eq %struct.halide_device_allocation_pool* %16, null
  br i1 %17, label %.loopexit, label %.preheader, !llvm.loop !216

18:                                               ; preds = %.loopexit, %2
  %19 = phi i32 [ 0, %2 ], [ %7, %.loopexit ]
  ret i32 %19
}

; Function Attrs: nounwind willreturn mustprogress
define weak zeroext i1 @halide_can_reuse_device_allocations(i8* %0) local_unnamed_addr #2 {
  %2 = load i8, i8* @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, align 1, !tbaa !18, !range !21
  %3 = icmp ne i8 %2, 0
  ret i1 %3
}

; Function Attrs: nounwind willreturn
define weak void @halide_register_device_allocation_pool(%struct.halide_device_allocation_pool* %0) local_unnamed_addr #7 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  %2 = load %struct.halide_device_allocation_pool*, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !12
  %3 = getelementptr inbounds %struct.halide_device_allocation_pool, %struct.halide_device_allocation_pool* %0, i64 0, i32 1
  store %struct.halide_device_allocation_pool* %2, %struct.halide_device_allocation_pool** %3, align 8, !tbaa !217
  store %struct.halide_device_allocation_pool* %0, %struct.halide_device_allocation_pool** @_ZN6Halide7Runtime8Internal23device_allocation_poolsE, align 8, !tbaa !12
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal21allocation_pools_lockE) #16
  ret void
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %4 = load i64, i64* %3, align 8, !tbaa !212
  %5 = and i64 %4, 2
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %25, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = and i64 %4, 1
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %25

12:                                               ; preds = %7
  %13 = icmp eq %struct.halide_device_interface_t* %9, null
  br i1 %13, label %25, label %14

14:                                               ; preds = %12
  %15 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %9, i64 0, i32 15
  %16 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %15, align 8, !tbaa !218
  %17 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %16, i64 0, i32 6
  %18 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %17, align 8, !tbaa !220
  %19 = tail call i32 %18(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %25

21:                                               ; preds = %14
  %22 = load i64, i64* %3, align 8, !tbaa !212
  %23 = and i64 %22, -3
  store i64 %23, i64* %3, align 8, !tbaa !212
  %24 = tail call i32 @halide_msan_annotate_buffer_is_initialized(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  br label %25

25:                                               ; preds = %21, %14, %12, %7, %2
  %26 = phi i32 [ 0, %2 ], [ 0, %21 ], [ -14, %7 ], [ -19, %12 ], [ -14, %14 ]
  ret i32 %26
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_release(i8* %0, %struct.halide_device_interface_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i64 0, i32 15
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %3, align 8, !tbaa !218
  %5 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i64 0, i32 5
  %6 = load i32 (i8*)*, i32 (i8*)** %5, align 8, !tbaa !222
  %7 = tail call i32 %6(i8* %0) #16
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6.88, i64 0, i64 0)) #16
  br label %30

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !75
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %30

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %30

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !212
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %28, label %.split

.split:                                           ; preds = %22
  %27 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #17
  br label %34

28:                                               ; preds = %22
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %30

30:                                               ; preds = %28, %20, %15, %4
  %31 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.split1, label %34

.split1:                                          ; preds = %30
  %33 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* %1) #17
  br label %34

34:                                               ; preds = %.split, %.split1, %30
  %35 = phi i32 [ %31, %30 ], [ %27, %.split ], [ %33, %.split1 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %35
}

; Function Attrs: nounwind mustprogress
define linkonce i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7.89, i64 0, i64 0)) #16
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !75
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !212
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %72

33:                                               ; preds = %30, %23
  %34 = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %34, label %35, label %41

35:                                               ; preds = %33
  %36 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %37 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %36, align 8, !tbaa !211
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  br i1 %38, label %39, label %41

39:                                               ; preds = %35
  %40 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %72

41:                                               ; preds = %35, %33
  %42 = phi %struct.halide_device_interface_t* [ %2, %33 ], [ %37, %35 ]
  %43 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %44 = load i64, i64* %43, align 8, !tbaa !75
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %51, label %46

46:                                               ; preds = %41
  %47 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %48 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %47, align 8, !tbaa !211
  %49 = icmp eq %struct.halide_device_interface_t* %48, %42
  br i1 %49, label %54, label %50

50:                                               ; preds = %46
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9.90, i64 0, i64 0)) #16
  br label %72

51:                                               ; preds = %41
  %52 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %42) #17
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %72

54:                                               ; preds = %51, %46
  %55 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %56 = load i64, i64* %55, align 8, !tbaa !212
  %57 = and i64 %56, 1
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %72, label %59

59:                                               ; preds = %54
  %60 = and i64 %56, 2
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %62, label %72

62:                                               ; preds = %59
  %63 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %42, i64 0, i32 15
  %64 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %63, align 8, !tbaa !218
  %65 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %64, i64 0, i32 7
  %66 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %65, align 8, !tbaa !223
  %67 = tail call i32 %66(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %72

69:                                               ; preds = %62
  %70 = load i64, i64* %55, align 8, !tbaa !212
  %71 = and i64 %70, -2
  store i64 %71, i64* %55, align 8, !tbaa !212
  br label %72

72:                                               ; preds = %69, %62, %59, %54, %51, %50, %39, %30
  %73 = phi i32 [ %40, %39 ], [ -42, %50 ], [ %31, %30 ], [ 0, %69 ], [ %52, %51 ], [ -15, %59 ], [ -15, %62 ], [ 0, %54 ]
  ret i32 %73
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17.91, i64 0, i64 0)) #16
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !75
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !212
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %56

33:                                               ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !211
  br label %36

36:                                               ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  %39 = icmp eq %struct.halide_device_interface_t* %37, %2
  %40 = or i1 %38, %39
  br i1 %40, label %42, label %41

41:                                               ; preds = %36
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.92, i64 0, i64 0)) #16
  br label %56

42:                                               ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !218
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !224
  tail call void %46() #16
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !218
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 2
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !225
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !218
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !226
  tail call void %53() #16
  %54 = icmp eq i32 %50, 0
  %55 = select i1 %54, i32 0, i32 -16
  ret i32 %55

56:                                               ; preds = %41, %30
  %57 = phi i32 [ %31, %30 ], [ -42, %41 ]
  ret i32 %57
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %4 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) #17
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %4
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_sync(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16.93, i64 0, i64 0)) #16
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !75
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !212
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %48

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !211
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %38, label %40

38:                                               ; preds = %35
  %39 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %48

40:                                               ; preds = %35
  %41 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %42 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %41, align 8, !tbaa !218
  %43 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %42, i64 0, i32 4
  %44 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %43, align 8, !tbaa !227
  %45 = tail call i32 %44(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %46 = icmp eq i32 %45, 0
  %47 = select i1 %46, i32 0, i32 -17
  ret i32 %47

48:                                               ; preds = %38, %29
  %49 = phi i32 [ %30, %29 ], [ %39, %38 ]
  ret i32 %49
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.96, i64 0, i64 0)) #16
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !75
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !212
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %61

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !211
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !224
  tail call void %42() #16
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 3
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !228
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !226
  tail call void %49() #16
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !75
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

53:                                               ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.22.97, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %54

54:                                               ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -18
  ret i32 %56

57:                                               ; preds = %35
  %58 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %59 = load i64, i64* %58, align 8, !tbaa !212
  %60 = and i64 %59, -3
  store i64 %60, i64* %58, align 8, !tbaa !212
  br label %61

61:                                               ; preds = %57, %29
  %62 = phi i32 [ %30, %29 ], [ 0, %57 ]
  ret i32 %62
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_free_as_destructor(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = bitcast i8* %1 to %struct.halide_buffer_t*
  %4 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %3) #17
  ret void
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_malloc(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.98, i64 0, i64 0)) #16
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !75
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !212
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %56

33:                                               ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !211
  br label %36

36:                                               ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  %39 = icmp eq %struct.halide_device_interface_t* %37, %2
  %40 = or i1 %38, %39
  br i1 %40, label %42, label %41

41:                                               ; preds = %36
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.99, i64 0, i64 0)) #16
  br label %56

42:                                               ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !218
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !224
  tail call void %46() #16
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !218
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 8
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !229
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !218
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !226
  tail call void %53() #16
  %54 = icmp eq i32 %50, 0
  br i1 %54, label %56, label %55

55:                                               ; preds = %42
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26.100, i64 0, i64 0)) #16
  br label %56

56:                                               ; preds = %55, %42, %41, %30
  %57 = phi i32 [ %31, %30 ], [ -42, %41 ], [ -16, %55 ], [ 0, %42 ]
  ret i32 %57
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_and_host_free(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27.101, i64 0, i64 0)) #16
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !75
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !212
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %66

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !211
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !224
  tail call void %42() #16
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 9
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !230
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !226
  tail call void %49() #16
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !75
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

53:                                               ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.28.102, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %54

54:                                               ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -18
  ret i32 %56

57:                                               ; preds = %35
  %58 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %59 = load i8*, i8** %58, align 8, !tbaa !73
  %60 = icmp eq i8* %59, null
  br i1 %60, label %62, label %61

61:                                               ; preds = %57
  tail call void @halide_free(i8* %0, i8* nonnull %59) #16
  store i8* null, i8** %58, align 8, !tbaa !73
  br label %62

62:                                               ; preds = %61, %57
  %63 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %64 = load i64, i64* %63, align 8, !tbaa !212
  %65 = and i64 %64, -3
  store i64 %65, i64* %63, align 8, !tbaa !212
  br label %66

66:                                               ; preds = %62, %29
  %67 = phi i32 [ %30, %29 ], [ 0, %62 ]
  ret i32 %67
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_and_host_malloc(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29.103, i64 0, i64 0)) #16
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !75
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !212
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %180

33:                                               ; preds = %30, %23
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %35 = load i32, i32* %34, align 4, !tbaa !76
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %162

37:                                               ; preds = %33
  %38 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %39 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %38, align 8, !tbaa !77
  %40 = zext i32 %35 to i64
  %min.iters.check = icmp ult i32 %35, 17
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %37
  %n.mod.vf = and i64 %40, 15
  %41 = icmp eq i64 %n.mod.vf, 0
  %42 = select i1 %41, i64 16, i64 %n.mod.vf
  %n.vec = sub nsw i64 %40, %42
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi, %vector.body ]
  %vec.phi15 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi27, %vector.body ]
  %vec.phi16 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi28, %vector.body ]
  %vec.phi17 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %predphi29, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %step.add12 = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %step.add13 = add <4 x i64> %vec.ind, <i64 12, i64 12, i64 12, i64 12>
  %43 = or i64 %index, 4
  %44 = or i64 %index, 8
  %45 = or i64 %index, 12
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %index, i32 2
  %47 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %43, i32 2
  %48 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %44, i32 2
  %49 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %45, i32 2
  %50 = bitcast i32* %46 to <16 x i32>*
  %51 = bitcast i32* %47 to <16 x i32>*
  %52 = bitcast i32* %48 to <16 x i32>*
  %53 = bitcast i32* %49 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %50, align 4, !tbaa !83
  %wide.vec18 = load <16 x i32>, <16 x i32>* %51, align 4, !tbaa !83
  %wide.vec19 = load <16 x i32>, <16 x i32>* %52, align 4, !tbaa !83
  %wide.vec20 = load <16 x i32>, <16 x i32>* %53, align 4, !tbaa !83
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec21 = shufflevector <16 x i32> %wide.vec18, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec22 = shufflevector <16 x i32> %wide.vec19, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec23 = shufflevector <16 x i32> %wide.vec20, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %54 = icmp sgt <4 x i32> %strided.vec, zeroinitializer
  %55 = icmp sgt <4 x i32> %strided.vec21, zeroinitializer
  %56 = icmp sgt <4 x i32> %strided.vec22, zeroinitializer
  %57 = icmp sgt <4 x i32> %strided.vec23, zeroinitializer
  %58 = zext <4 x i32> %strided.vec to <4 x i64>
  %59 = zext <4 x i32> %strided.vec21 to <4 x i64>
  %60 = zext <4 x i32> %strided.vec22 to <4 x i64>
  %61 = zext <4 x i32> %strided.vec23 to <4 x i64>
  %62 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %vec.ind, i32 1
  %63 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %step.add, i32 1
  %64 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %step.add12, i32 1
  %65 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %step.add13, i32 1
  %wide.masked.gather = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %62, i32 4, <4 x i1> %54, <4 x i32> undef), !tbaa !79
  %wide.masked.gather24 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %63, i32 4, <4 x i1> %55, <4 x i32> undef), !tbaa !79
  %wide.masked.gather25 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %64, i32 4, <4 x i1> %56, <4 x i32> undef), !tbaa !79
  %wide.masked.gather26 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %65, i32 4, <4 x i1> %57, <4 x i32> undef), !tbaa !79
  %66 = add nsw <4 x i32> %wide.masked.gather, <i32 -1, i32 -1, i32 -1, i32 -1>
  %67 = add nsw <4 x i32> %wide.masked.gather24, <i32 -1, i32 -1, i32 -1, i32 -1>
  %68 = add nsw <4 x i32> %wide.masked.gather25, <i32 -1, i32 -1, i32 -1, i32 -1>
  %69 = add nsw <4 x i32> %wide.masked.gather26, <i32 -1, i32 -1, i32 -1, i32 -1>
  %70 = sext <4 x i32> %66 to <4 x i64>
  %71 = sext <4 x i32> %67 to <4 x i64>
  %72 = sext <4 x i32> %68 to <4 x i64>
  %73 = sext <4 x i32> %69 to <4 x i64>
  %74 = mul nsw <4 x i64> %70, %58
  %75 = mul nsw <4 x i64> %71, %59
  %76 = mul nsw <4 x i64> %72, %60
  %77 = mul nsw <4 x i64> %73, %61
  %78 = select <4 x i1> %54, <4 x i64> %74, <4 x i64> zeroinitializer
  %predphi = add <4 x i64> %vec.phi, %78
  %79 = select <4 x i1> %55, <4 x i64> %75, <4 x i64> zeroinitializer
  %predphi27 = add <4 x i64> %vec.phi15, %79
  %80 = select <4 x i1> %56, <4 x i64> %76, <4 x i64> zeroinitializer
  %predphi28 = add <4 x i64> %vec.phi16, %80
  %81 = select <4 x i1> %57, <4 x i64> %77, <4 x i64> zeroinitializer
  %predphi29 = add <4 x i64> %vec.phi17, %81
  %index.next = add i64 %index, 16
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 16, i64 16, i64 16, i64 16>
  %82 = icmp eq i64 %index.next, %n.vec
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !231

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %predphi27, %predphi
  %bin.rdx30 = add <4 x i64> %predphi28, %bin.rdx
  %bin.rdx31 = add <4 x i64> %predphi29, %bin.rdx30
  %83 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx31)
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %37
  %.ph74 = phi i64 [ 0, %37 ], [ %n.vec, %middle.block ]
  %.ph75 = phi i64 [ 0, %37 ], [ %83, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %97
  %84 = phi i64 [ %99, %97 ], [ %.ph74, %scalar.ph.preheader ]
  %85 = phi i64 [ %98, %97 ], [ %.ph75, %scalar.ph.preheader ]
  %86 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %84, i32 2
  %87 = load i32, i32* %86, align 4, !tbaa !83
  %88 = icmp sgt i32 %87, 0
  br i1 %88, label %89, label %97

89:                                               ; preds = %scalar.ph
  %90 = zext i32 %87 to i64
  %91 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %84, i32 1
  %92 = load i32, i32* %91, align 4, !tbaa !79
  %93 = add nsw i32 %92, -1
  %94 = sext i32 %93 to i64
  %95 = mul nsw i64 %94, %90
  %96 = add nsw i64 %95, %85
  br label %97

97:                                               ; preds = %89, %scalar.ph
  %98 = phi i64 [ %96, %89 ], [ %85, %scalar.ph ]
  %99 = add nuw nsw i64 %84, 1
  %100 = icmp eq i64 %99, %40
  br i1 %100, label %.preheader, label %scalar.ph, !llvm.loop !232

.preheader:                                       ; preds = %97
  %min.iters.check35 = icmp ult i32 %35, 17
  br i1 %min.iters.check35, label %scalar.ph33.preheader, label %vector.ph36

vector.ph36:                                      ; preds = %.preheader
  %n.mod.vf37 = and i64 %40, 15
  %101 = icmp eq i64 %n.mod.vf37, 0
  %102 = select i1 %101, i64 16, i64 %n.mod.vf37
  %n.vec38 = sub nsw i64 %40, %102
  br label %vector.body34

vector.body34:                                    ; preds = %vector.body34, %vector.ph36
  %index39 = phi i64 [ 0, %vector.ph36 ], [ %index.next40, %vector.body34 ]
  %vec.ind43 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph36 ], [ %vec.ind.next48, %vector.body34 ]
  %vec.phi49 = phi <4 x i64> [ zeroinitializer, %vector.ph36 ], [ %predphi65, %vector.body34 ]
  %vec.phi50 = phi <4 x i64> [ zeroinitializer, %vector.ph36 ], [ %predphi66, %vector.body34 ]
  %vec.phi51 = phi <4 x i64> [ zeroinitializer, %vector.ph36 ], [ %predphi67, %vector.body34 ]
  %vec.phi52 = phi <4 x i64> [ zeroinitializer, %vector.ph36 ], [ %predphi68, %vector.body34 ]
  %step.add44 = add <4 x i64> %vec.ind43, <i64 4, i64 4, i64 4, i64 4>
  %step.add45 = add <4 x i64> %vec.ind43, <i64 8, i64 8, i64 8, i64 8>
  %step.add46 = add <4 x i64> %vec.ind43, <i64 12, i64 12, i64 12, i64 12>
  %103 = or i64 %index39, 4
  %104 = or i64 %index39, 8
  %105 = or i64 %index39, 12
  %106 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %index39, i32 2
  %107 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %103, i32 2
  %108 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %104, i32 2
  %109 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %105, i32 2
  %110 = bitcast i32* %106 to <16 x i32>*
  %111 = bitcast i32* %107 to <16 x i32>*
  %112 = bitcast i32* %108 to <16 x i32>*
  %113 = bitcast i32* %109 to <16 x i32>*
  %wide.vec53 = load <16 x i32>, <16 x i32>* %110, align 4, !tbaa !83
  %wide.vec54 = load <16 x i32>, <16 x i32>* %111, align 4, !tbaa !83
  %wide.vec55 = load <16 x i32>, <16 x i32>* %112, align 4, !tbaa !83
  %wide.vec56 = load <16 x i32>, <16 x i32>* %113, align 4, !tbaa !83
  %strided.vec57 = shufflevector <16 x i32> %wide.vec53, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec58 = shufflevector <16 x i32> %wide.vec54, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec59 = shufflevector <16 x i32> %wide.vec55, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec60 = shufflevector <16 x i32> %wide.vec56, <16 x i32> poison, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %114 = icmp slt <4 x i32> %strided.vec57, zeroinitializer
  %115 = icmp slt <4 x i32> %strided.vec58, zeroinitializer
  %116 = icmp slt <4 x i32> %strided.vec59, zeroinitializer
  %117 = icmp slt <4 x i32> %strided.vec60, zeroinitializer
  %118 = sext <4 x i32> %strided.vec57 to <4 x i64>
  %119 = sext <4 x i32> %strided.vec58 to <4 x i64>
  %120 = sext <4 x i32> %strided.vec59 to <4 x i64>
  %121 = sext <4 x i32> %strided.vec60 to <4 x i64>
  %122 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %vec.ind43, i32 1
  %123 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %step.add44, i32 1
  %124 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %step.add45, i32 1
  %125 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, <4 x i64> %step.add46, i32 1
  %wide.masked.gather61 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %122, i32 4, <4 x i1> %114, <4 x i32> undef), !tbaa !79
  %wide.masked.gather62 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %123, i32 4, <4 x i1> %115, <4 x i32> undef), !tbaa !79
  %wide.masked.gather63 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %124, i32 4, <4 x i1> %116, <4 x i32> undef), !tbaa !79
  %wide.masked.gather64 = call <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*> %125, i32 4, <4 x i1> %117, <4 x i32> undef), !tbaa !79
  %126 = add nsw <4 x i32> %wide.masked.gather61, <i32 -1, i32 -1, i32 -1, i32 -1>
  %127 = add nsw <4 x i32> %wide.masked.gather62, <i32 -1, i32 -1, i32 -1, i32 -1>
  %128 = add nsw <4 x i32> %wide.masked.gather63, <i32 -1, i32 -1, i32 -1, i32 -1>
  %129 = add nsw <4 x i32> %wide.masked.gather64, <i32 -1, i32 -1, i32 -1, i32 -1>
  %130 = sext <4 x i32> %126 to <4 x i64>
  %131 = sext <4 x i32> %127 to <4 x i64>
  %132 = sext <4 x i32> %128 to <4 x i64>
  %133 = sext <4 x i32> %129 to <4 x i64>
  %134 = mul nsw <4 x i64> %130, %118
  %135 = mul nsw <4 x i64> %131, %119
  %136 = mul nsw <4 x i64> %132, %120
  %137 = mul nsw <4 x i64> %133, %121
  %138 = select <4 x i1> %114, <4 x i64> %134, <4 x i64> zeroinitializer
  %predphi65 = add <4 x i64> %vec.phi49, %138
  %139 = select <4 x i1> %115, <4 x i64> %135, <4 x i64> zeroinitializer
  %predphi66 = add <4 x i64> %vec.phi50, %139
  %140 = select <4 x i1> %116, <4 x i64> %136, <4 x i64> zeroinitializer
  %predphi67 = add <4 x i64> %vec.phi51, %140
  %141 = select <4 x i1> %117, <4 x i64> %137, <4 x i64> zeroinitializer
  %predphi68 = add <4 x i64> %vec.phi52, %141
  %index.next40 = add i64 %index39, 16
  %vec.ind.next48 = add <4 x i64> %vec.ind43, <i64 16, i64 16, i64 16, i64 16>
  %142 = icmp eq i64 %index.next40, %n.vec38
  br i1 %142, label %middle.block32, label %vector.body34, !llvm.loop !233

middle.block32:                                   ; preds = %vector.body34
  %bin.rdx69 = add <4 x i64> %predphi66, %predphi65
  %bin.rdx70 = add <4 x i64> %predphi67, %bin.rdx69
  %bin.rdx71 = add <4 x i64> %predphi68, %bin.rdx70
  %143 = call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %bin.rdx71)
  br label %scalar.ph33.preheader

scalar.ph33.preheader:                            ; preds = %middle.block32, %.preheader
  %.ph = phi i64 [ 0, %.preheader ], [ %n.vec38, %middle.block32 ]
  %.ph73 = phi i64 [ 0, %.preheader ], [ %143, %middle.block32 ]
  br label %scalar.ph33

scalar.ph33:                                      ; preds = %scalar.ph33.preheader, %157
  %144 = phi i64 [ %159, %157 ], [ %.ph, %scalar.ph33.preheader ]
  %145 = phi i64 [ %158, %157 ], [ %.ph73, %scalar.ph33.preheader ]
  %146 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %144, i32 2
  %147 = load i32, i32* %146, align 4, !tbaa !83
  %148 = icmp slt i32 %147, 0
  br i1 %148, label %149, label %157

149:                                              ; preds = %scalar.ph33
  %150 = sext i32 %147 to i64
  %151 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %144, i32 1
  %152 = load i32, i32* %151, align 4, !tbaa !79
  %153 = add nsw i32 %152, -1
  %154 = sext i32 %153 to i64
  %155 = mul nsw i64 %154, %150
  %156 = add nsw i64 %155, %145
  br label %157

157:                                              ; preds = %149, %scalar.ph33
  %158 = phi i64 [ %156, %149 ], [ %145, %scalar.ph33 ]
  %159 = add nuw nsw i64 %144, 1
  %160 = icmp eq i64 %159, %40
  br i1 %160, label %.loopexit, label %scalar.ph33, !llvm.loop !234

.loopexit:                                        ; preds = %157
  %161 = add nsw i64 %98, 1
  br label %162

162:                                              ; preds = %.loopexit, %33
  %163 = phi i64 [ 1, %33 ], [ %161, %.loopexit ]
  %164 = phi i64 [ 0, %33 ], [ %158, %.loopexit ]
  %165 = sub nsw i64 %163, %164
  %166 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 4, i32 1
  %167 = load i8, i8* %166, align 1, !tbaa !28
  %168 = zext i8 %167 to i64
  %169 = add nuw nsw i64 %168, 7
  %170 = lshr i64 %169, 3
  %171 = mul i64 %170, %165
  %172 = tail call i8* @halide_malloc(i8* %0, i64 %171) #16
  %173 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  store i8* %172, i8** %173, align 8, !tbaa !73
  %174 = icmp eq i8* %172, null
  br i1 %174, label %180, label %175

175:                                              ; preds = %162
  %176 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2) #17
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %180, label %178

178:                                              ; preds = %175
  %179 = load i8*, i8** %173, align 8, !tbaa !73
  tail call void @halide_free(i8* %0, i8* %179) #16
  store i8* null, i8** %173, align 8, !tbaa !73
  br label %180

180:                                              ; preds = %178, %175, %162, %30
  %181 = phi i32 [ %31, %30 ], [ -1, %162 ], [ %176, %178 ], [ 0, %175 ]
  ret i32 %181
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_and_host_free(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30.104, i64 0, i64 0)) #16
  br label %31

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !75
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %31

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %31

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !212
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %29, label %.split

.split:                                           ; preds = %23
  %28 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* nonnull %1) #17
  br label %35

29:                                               ; preds = %23
  %30 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %31

31:                                               ; preds = %29, %21, %16, %5
  %32 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %30, %29 ]
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %.split1, label %44

.split1:                                          ; preds = %31
  %34 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %1) #17
  br label %35

35:                                               ; preds = %.split1, %.split
  %phi.call = phi i32 [ %28, %.split ], [ %34, %.split1 ]
  %36 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %37 = load i8*, i8** %36, align 8, !tbaa !73
  %38 = icmp eq i8* %37, null
  br i1 %38, label %40, label %39

39:                                               ; preds = %35
  tail call void @halide_free(i8* %0, i8* nonnull %37) #16
  store i8* null, i8** %36, align 8, !tbaa !73
  br label %40

40:                                               ; preds = %39, %35
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %42 = load i64, i64* %41, align 8, !tbaa !212
  %43 = and i64 %42, -4
  store i64 %43, i64* %41, align 8, !tbaa !212
  br label %44

44:                                               ; preds = %40, %31
  %45 = phi i32 [ %phi.call, %40 ], [ %32, %31 ]
  ret i32 %45
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_wrap_native(i8* %0, %struct.halide_buffer_t* %1, i64 %2, %struct.halide_device_interface_t* %3) local_unnamed_addr #0 {
  %5 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %7 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31.105, i64 0, i64 0)) #16
  br label %31

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %10 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %9, align 8, !tbaa !211
  %11 = icmp eq %struct.halide_device_interface_t* %10, null
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %13 = load i64, i64* %12, align 8, !tbaa !75
  %14 = icmp eq i64 %13, 0
  %15 = xor i1 %11, true
  %16 = or i1 %14, %15
  br i1 %16, label %19, label %17

17:                                               ; preds = %8
  %18 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %31

19:                                               ; preds = %8
  %20 = xor i1 %14, true
  %21 = or i1 %11, %20
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %31

24:                                               ; preds = %19
  %25 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %26 = load i64, i64* %25, align 8, !tbaa !212
  %27 = and i64 %26, 3
  %28 = icmp eq i64 %27, 3
  br i1 %28, label %29, label %37

29:                                               ; preds = %24
  %30 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %31

31:                                               ; preds = %29, %22, %17, %6
  %32 = phi i32 [ %7, %6 ], [ %23, %22 ], [ %18, %17 ], [ %30, %29 ]
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %58

34:                                               ; preds = %31
  %35 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %36 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %35, align 8, !tbaa !211
  br label %37

37:                                               ; preds = %34, %24
  %38 = phi %struct.halide_device_interface_t* [ %36, %34 ], [ %10, %24 ]
  %39 = icmp eq %struct.halide_device_interface_t* %38, null
  %40 = icmp eq %struct.halide_device_interface_t* %38, %3
  %41 = or i1 %39, %40
  br i1 %41, label %43, label %42

42:                                               ; preds = %37
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32.106, i64 0, i64 0)) #16
  br label %58

43:                                               ; preds = %37
  %44 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %45 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %3, i64 0, i32 15
  %46 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !218
  %47 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %46, i64 0, i32 0
  %48 = load void ()*, void ()** %47, align 8, !tbaa !224
  tail call void %48() #16
  store %struct.halide_device_interface_t* %3, %struct.halide_device_interface_t** %44, align 8, !tbaa !211
  %49 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !218
  %50 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %49, i64 0, i32 14
  %51 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %50, align 8, !tbaa !235
  %52 = tail call i32 %51(i8* %0, %struct.halide_buffer_t* nonnull %1, i64 %2) #16
  %53 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !218
  %54 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %53, i64 0, i32 1
  %55 = load void ()*, void ()** %54, align 8, !tbaa !226
  tail call void %55() #16
  %56 = icmp eq i32 %52, 0
  %57 = select i1 %56, i32 0, i32 -16
  ret i32 %57

58:                                               ; preds = %42, %31
  %59 = phi i32 [ %32, %31 ], [ -42, %42 ]
  ret i32 %59
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_device_detach_native(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33.107, i64 0, i64 0)) #16
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !75
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !212
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %57

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !211
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !224
  tail call void %42() #16
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 15
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !236
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !218
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !226
  tail call void %49() #16
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !75
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

53:                                               ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.34.108, i64 0, i64 0)) #16
  tail call void @abort() #16
  br label %54

54:                                               ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -33
  ret i32 %56

57:                                               ; preds = %35, %29
  %58 = phi i32 [ %30, %29 ], [ 0, %35 ]
  ret i32 %58
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_wrap_native(i8* %0, %struct.halide_buffer_t* %1, i64 %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.35.109, i64 0, i64 0)) #16
  br label %30

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !75
  %13 = icmp eq i64 %12, 0
  %14 = xor i1 %10, true
  %15 = or i1 %13, %14
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %30

18:                                               ; preds = %7
  %19 = xor i1 %13, true
  %20 = or i1 %10, %19
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %30

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !212
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

28:                                               ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %30

30:                                               ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %43

33:                                               ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !211
  br label %36

36:                                               ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %37, i64 0, i32 15
  %39 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %38, align 8, !tbaa !218
  %40 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %39, i64 0, i32 0
  %41 = load void ()*, void ()** %40, align 8, !tbaa !224
  tail call void %41() #16
  %42 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  store i64 %2, i64* %42, align 8, !tbaa !75
  br label %43

43:                                               ; preds = %36, %30
  %44 = phi i32 [ 0, %36 ], [ %31, %30 ]
  ret i32 %44
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_detach_native(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.36, i64 0, i64 0)) #16
  br label %29

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  %9 = icmp eq %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !75
  %12 = icmp eq i64 %11, 0
  %13 = xor i1 %9, true
  %14 = or i1 %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #16
  br label %29

17:                                               ; preds = %6
  %18 = xor i1 %12, true
  %19 = or i1 %9, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #16
  br label %29

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !212
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #16
  br label %29

29:                                               ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %46

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %34 = load i64, i64* %33, align 8, !tbaa !75
  br label %35

35:                                               ; preds = %32, %22
  %36 = phi i64 [ %34, %32 ], [ %11, %22 ]
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %46, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %40 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %41 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %40, align 8, !tbaa !211
  %42 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %41, i64 0, i32 15
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %42, align 8, !tbaa !218
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 1
  %45 = load void ()*, void ()** %44, align 8, !tbaa !226
  tail call void %45() #16
  store i64 0, i64* %39, align 8, !tbaa !75
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %40, align 8, !tbaa !211
  br label %46

46:                                               ; preds = %38, %35, %29
  %47 = phi i32 [ 0, %38 ], [ %30, %29 ], [ 0, %35 ]
  ret i32 %47
}

; Function Attrs: nounwind mustprogress
define weak void @halide_device_and_host_free_as_destructor(i8* %0, i8* %1) local_unnamed_addr #0 {
  %3 = bitcast i8* %1 to %struct.halide_buffer_t*
  %4 = tail call i32 @halide_device_and_host_free(i8* %0, %struct.halide_buffer_t* %3) #17
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_device_host_nop_free(i8* %0, i8* %1) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_default_buffer_copy(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) local_unnamed_addr #2 {
  ret i32 -39
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) local_unnamed_addr #0 {
  %5 = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %6 = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %6, label %21, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !211
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = icmp eq %struct.halide_device_interface_t* %9, %2
  %12 = or i1 %10, %11
  br i1 %12, label %14, label %13

13:                                               ; preds = %7
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.42, i64 0, i64 0)) #16
  br label %121

14:                                               ; preds = %7
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %16 = load i64, i64* %15, align 8, !tbaa !75
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %14
  %19 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #17
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %121

21:                                               ; preds = %18, %14, %4
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %23 = load i64, i64* %22, align 8, !tbaa !75
  %24 = icmp eq i64 %23, 0
  %25 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %26 = load i8*, i8** %25, align 8, !tbaa !73
  %27 = icmp eq i8* %26, null
  br i1 %24, label %34, label %28

28:                                               ; preds = %21
  br i1 %27, label %44, label %29

29:                                               ; preds = %28
  %30 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %31 = load i64, i64* %30, align 8, !tbaa !212
  %32 = and i64 %31, 1
  %33 = icmp ne i64 %32, 0
  br label %35

34:                                               ; preds = %21
  br i1 %27, label %44, label %._crit_edge

._crit_edge:                                      ; preds = %34
  %.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %.pre = load i64, i64* %.phi.trans.insert, align 8, !tbaa !212
  br label %35

35:                                               ; preds = %._crit_edge, %29
  %36 = phi i64 [ %31, %29 ], [ %.pre, %._crit_edge ]
  %37 = phi i1 [ %33, %29 ], [ true, %._crit_edge ]
  %38 = and i64 %36, 2
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %44, label %40

40:                                               ; preds = %35
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %42 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %41, align 8, !tbaa !211
  %43 = icmp ne %struct.halide_device_interface_t* %42, null
  br label %44

44:                                               ; preds = %40, %35, %34, %28
  %45 = phi i1 [ true, %34 ], [ false, %35 ], [ false, %40 ], [ true, %28 ]
  %46 = phi i1 [ true, %34 ], [ %37, %35 ], [ %37, %40 ], [ false, %28 ]
  %47 = phi i1 [ true, %34 ], [ false, %35 ], [ %43, %40 ], [ true, %28 ]
  %48 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %49 = load i8*, i8** %48, align 8, !tbaa !73
  %50 = icmp eq i8* %49, null
  %51 = xor i1 %6, true
  %52 = and i1 %6, %50
  br i1 %52, label %121, label %53

53:                                               ; preds = %44
  %54 = or i1 %6, %46
  br i1 %54, label %62, label %55

55:                                               ; preds = %53
  %56 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %57 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %56, align 8, !tbaa !218
  %58 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %57, i64 0, i32 10
  %59 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %58, align 8, !tbaa !237
  %60 = tail call i32 %59(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #16
  %61 = icmp eq i32 %60, -42
  br i1 %61, label %62, label %108

62:                                               ; preds = %55, %53
  %63 = and i1 %45, %50
  br i1 %63, label %121, label %64

64:                                               ; preds = %62
  %65 = or i1 %47, %51
  br i1 %65, label %68, label %66

66:                                               ; preds = %64
  %67 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %67) #18
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret(%"struct.Halide::Runtime::Internal::device_copy") align 8 %5, %struct.halide_buffer_t* nonnull %1, i1 zeroext true, %struct.halide_buffer_t* nonnull %3, i1 zeroext true) #17
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull align 8 dereferenceable(416) %5, i8* %0) #17
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %67) #18
  br label %111

68:                                               ; preds = %64
  br i1 %6, label %69, label %83

69:                                               ; preds = %68
  %70 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %71 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %70, align 8, !tbaa !211
  %72 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %71, i64 0, i32 15
  %73 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %72, align 8, !tbaa !218
  %74 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %73, i64 0, i32 10
  %75 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %74, align 8, !tbaa !237
  %76 = tail call i32 %75(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #16
  %77 = icmp eq i32 %76, -42
  br i1 %77, label %78, label %108

78:                                               ; preds = %69
  %79 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #17
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %121

81:                                               ; preds = %78
  %82 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #17
  br label %108

83:                                               ; preds = %68
  %84 = or i1 %46, %50
  br i1 %84, label %99, label %85

85:                                               ; preds = %83
  %86 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %87 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %86, align 8, !tbaa !211
  %88 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %87, i64 0, i32 15
  %89 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %88, align 8, !tbaa !218
  %90 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %89, i64 0, i32 10
  %91 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %90, align 8, !tbaa !237
  %92 = tail call i32 %91(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #16
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %121

94:                                               ; preds = %85
  %95 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 3
  %96 = load i64, i64* %95, align 8, !tbaa !212
  %97 = or i64 %96, 1
  store i64 %97, i64* %95, align 8, !tbaa !212
  %98 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #17
  br label %108

99:                                               ; preds = %83
  %100 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #17
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %121

102:                                              ; preds = %99
  %103 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %104 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %103, align 8, !tbaa !218
  %105 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %104, i64 0, i32 10
  %106 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %105, align 8, !tbaa !237
  %107 = tail call i32 %106(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #16
  br label %108

108:                                              ; preds = %102, %94, %81, %69, %55
  %109 = phi i32 [ %82, %81 ], [ %76, %69 ], [ %98, %94 ], [ %107, %102 ], [ %60, %55 ]
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %121

111:                                              ; preds = %108, %66
  %112 = icmp eq %struct.halide_buffer_t* %3, %1
  br i1 %112, label %121, label %113

113:                                              ; preds = %111
  %114 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 3
  %115 = load i64, i64* %114, align 8, !tbaa !212
  %116 = and i64 %115, -4
  br i1 %6, label %119, label %117

117:                                              ; preds = %113
  %118 = or i64 %116, 2
  store i64 %118, i64* %114, align 8, !tbaa !212
  br label %121

119:                                              ; preds = %113
  %120 = or i64 %116, 1
  store i64 %120, i64* %114, align 8, !tbaa !212
  br label %121

121:                                              ; preds = %119, %117, %111, %108, %99, %85, %78, %62, %44, %18, %13
  %122 = phi i32 [ -42, %13 ], [ %19, %18 ], [ -34, %44 ], [ 0, %117 ], [ 0, %119 ], [ 0, %111 ], [ -42, %62 ], [ %109, %108 ], [ %100, %99 ], [ %92, %85 ], [ %79, %78 ]
  ret i32 %122
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %5 = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %5, label %11, label %6

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %7, align 8, !tbaa !218
  %9 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 0
  %10 = load void ()*, void ()** %9, align 8, !tbaa !224
  tail call void %10() #16
  br label %11

11:                                               ; preds = %6, %4
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %13 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %12, align 8, !tbaa !211
  %14 = icmp eq %struct.halide_device_interface_t* %13, null
  br i1 %14, label %20, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %13, i64 0, i32 15
  %17 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %16, align 8, !tbaa !218
  %18 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %17, i64 0, i32 0
  %19 = load void ()*, void ()** %18, align 8, !tbaa !224
  tail call void %19() #16
  br label %20

20:                                               ; preds = %15, %11
  %21 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) #17
  br i1 %5, label %27, label %22

22:                                               ; preds = %20
  %23 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %24 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %23, align 8, !tbaa !218
  %25 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %24, i64 0, i32 1
  %26 = load void ()*, void ()** %25, align 8, !tbaa !226
  tail call void %26() #16
  br label %27

27:                                               ; preds = %22, %20
  %28 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %12, align 8, !tbaa !211
  %29 = icmp eq %struct.halide_device_interface_t* %28, null
  br i1 %29, label %35, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %28, i64 0, i32 15
  %32 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %31, align 8, !tbaa !218
  %33 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %32, i64 0, i32 1
  %34 = load void ()*, void ()** %33, align 8, !tbaa !226
  tail call void %34() #16
  br label %35

35:                                               ; preds = %30, %27
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %21
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_crop(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_buffer_t* %2) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #16
  ret i32 -40
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_slice(i8* %0, %struct.halide_buffer_t* %1, i32 %2, i32 %3, %struct.halide_buffer_t* %4) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i64 0, i64 0)) #16
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_buffer_t* %2) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %4 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !75
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %32, label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !75
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %7
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #16
  br label %32

12:                                               ; preds = %7
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %14 = load i32, i32* %13, align 4, !tbaa !76
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !76
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %19, label %18

18:                                               ; preds = %12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i64 0, i64 0)) #16
  br label %32

19:                                               ; preds = %12
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %21 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !211
  %22 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %21, i64 0, i32 15
  %23 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %22, align 8, !tbaa !218
  %24 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %23, i64 0, i32 0
  %25 = load void ()*, void ()** %24, align 8, !tbaa !224
  tail call void %25() #16
  %26 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !211
  %27 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %26, i64 0, i32 15
  %28 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %27, align 8, !tbaa !218
  %29 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %28, i64 0, i32 11
  %30 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %29, align 8, !tbaa !238
  %31 = tail call i32 %30(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_buffer_t* nonnull %2) #16
  br label %32

32:                                               ; preds = %19, %18, %11, %3
  %33 = phi i32 [ -41, %11 ], [ -41, %18 ], [ %31, %19 ], [ 0, %3 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %33
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8* %0, %struct.halide_buffer_t* %1, i32 %2, i32 %3, %struct.halide_buffer_t* %4) local_unnamed_addr #4 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %6 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !75
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %35, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !75
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %14, label %13

13:                                               ; preds = %9
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #16
  br label %35

14:                                               ; preds = %9
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !76
  %17 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 5
  %18 = load i32, i32* %17, align 4, !tbaa !76
  %19 = add nsw i32 %18, 1
  %20 = icmp eq i32 %16, %19
  br i1 %20, label %22, label %21

21:                                               ; preds = %14
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i64 0, i64 0)) #16
  br label %35

22:                                               ; preds = %14
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %24 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !211
  %25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %24, i64 0, i32 15
  %26 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %25, align 8, !tbaa !218
  %27 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %26, i64 0, i32 0
  %28 = load void ()*, void ()** %27, align 8, !tbaa !224
  tail call void %28() #16
  %29 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !211
  %30 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %29, i64 0, i32 15
  %31 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %30, align 8, !tbaa !218
  %32 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %31, i64 0, i32 12
  %33 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %32, align 8, !tbaa !239
  %34 = tail call i32 %33(i8* %0, %struct.halide_buffer_t* nonnull %1, i32 %2, i32 %3, %struct.halide_buffer_t* nonnull %4) #16
  br label %35

35:                                               ; preds = %22, %21, %13, %5
  %36 = phi i32 [ -41, %13 ], [ -41, %21 ], [ %34, %22 ], [ 0, %5 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  ret i32 %36
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_default_device_release_crop(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !75
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %2
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #16
  br label %7

7:                                                ; preds = %6, %2
  %8 = phi i32 [ -40, %6 ], [ 0, %2 ]
  ret i32 %8
}

; Function Attrs: nounwind
define weak i32 @halide_device_release_crop(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #4 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !75
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %17, label %6

6:                                                ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  %9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %8, i64 0, i32 15
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !218
  %11 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i64 0, i32 13
  %12 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %11, align 8, !tbaa !240
  %13 = tail call i32 %12(i8* %0, %struct.halide_buffer_t* nonnull %1) #16
  store i64 0, i64* %3, align 8, !tbaa !75
  %14 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !218
  %15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %14, i64 0, i32 1
  %16 = load void ()*, void ()** %15, align 8, !tbaa !226
  tail call void %16() #16
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %7, align 8, !tbaa !211
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #16
  br label %17

17:                                               ; preds = %6, %2
  %18 = phi i32 [ %13, %6 ], [ 0, %2 ]
  ret i32 %18
}

; Function Attrs: nounwind willreturn mustprogress
define weak float @halide_float16_bits_to_float(i16 zeroext %0) local_unnamed_addr #2 {
  %2 = zext i16 %0 to i32
  %3 = and i32 %2, 1023
  %4 = lshr i32 %2, 10
  %5 = and i32 %4, 31
  %6 = icmp eq i32 %5, 0
  %7 = icmp ne i32 %3, 0
  %8 = and i1 %7, %6
  br i1 %8, label %9, label %19

9:                                                ; preds = %1
  %10 = tail call i32 @llvm.ctlz.i32(i32 %3, i1 true), !range !241
  %11 = xor i32 %10, 31
  %12 = shl nuw i32 1, %11
  %13 = xor i32 %12, -1
  %14 = and i32 %3, %13
  %15 = sub nsw i32 23, %11
  %16 = shl i32 %14, %15
  %17 = mul nsw i32 %10, -8388608
  %18 = add i32 %17, 1124073472
  br label %26

19:                                               ; preds = %1
  %20 = shl nuw nsw i32 %3, 13
  br i1 %6, label %26, label %21

21:                                               ; preds = %19
  %22 = icmp eq i32 %5, 31
  br i1 %22, label %26, label %23

23:                                               ; preds = %21
  %24 = shl nuw nsw i32 %5, 23
  %25 = add nuw nsw i32 %24, 939524096
  br label %26

26:                                               ; preds = %23, %21, %19, %9
  %27 = phi i32 [ %18, %9 ], [ %20, %21 ], [ %20, %19 ], [ %20, %23 ]
  %28 = phi i32 [ %16, %9 ], [ 2139095040, %21 ], [ 0, %19 ], [ %25, %23 ]
  %29 = sext i16 %0 to i32
  %30 = and i32 %29, -2147483648
  %31 = or i32 %27, %30
  %32 = or i32 %31, %28
  %33 = bitcast i32 %32 to float
  ret float %33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #8

; Function Attrs: nounwind willreturn mustprogress
define weak double @halide_float16_bits_to_double(i16 zeroext %0) local_unnamed_addr #2 {
  %2 = tail call float @halide_float16_bits_to_float(i16 zeroext %0) #17
  %3 = fpext float %2 to double
  ret double %3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8* %0, i8* %1, i32 %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #16
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #16
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #16
  br label %9

9:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #16
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #16
  %19 = sext i32 %2 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #16
  br i1 %5, label %21, label %22

21:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %28

22:                                               ; preds = %16
  %23 = ptrtoint i8* %20 to i64
  %24 = ptrtoint i8* %4 to i64
  %25 = sub i64 1, %24
  %26 = add i64 %25, %23
  %27 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %26) #16
  tail call void @halide_error(i8* %0, i8* nonnull %4) #16
  br label %28

28:                                               ; preds = %22, %21
  tail call void @free(i8* %4) #16
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8* %0, i8* %1, i32 %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #16
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #16
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #16
  br label %9

9:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #16
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #16
  %19 = sext i32 %2 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #16
  br i1 %5, label %21, label %22

21:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %28

22:                                               ; preds = %16
  %23 = ptrtoint i8* %20 to i64
  %24 = ptrtoint i8* %4 to i64
  %25 = sub i64 1, %24
  %26 = add i64 %25, %23
  %27 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %26) #16
  tail call void @halide_error(i8* %0, i8* nonnull %4) #16
  br label %28

28:                                               ; preds = %22, %21
  tail call void @free(i8* %4) #16
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8* %0, i8* %1, i8* %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #4 {
  %8 = tail call i8* @malloc(i64 1024) #16
  %9 = icmp eq i8* %8, null
  br i1 %9, label %.split, label %.split2

.split:                                           ; preds = %7
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #16
  br label %13

.split2:                                          ; preds = %7
  %11 = getelementptr inbounds i8, i8* %8, i64 1023
  store i8 0, i8* %11, align 1, !tbaa !38
  %12 = tail call i8* @halide_string_to_string(i8* nonnull %8, i8* nonnull %11, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #16
  br label %13

13:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %10, %.split ], [ %12, %.split2 ]
  %14 = phi i8* [ null, %.split ], [ %11, %.split2 ]
  %15 = icmp eq i8* %2, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %14, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %20

18:                                               ; preds = %13
  %19 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %14, i8* nonnull %2) #16
  br label %20

20:                                               ; preds = %18, %16
  %21 = phi i8* [ %19, %18 ], [ %17, %16 ]
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.116, i64 0, i64 0)) #16
  %23 = icmp eq i8* %1, null
  br i1 %23, label %24, label %26

24:                                               ; preds = %20
  %25 = tail call i8* @halide_string_to_string(i8* %22, i8* %14, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %28

26:                                               ; preds = %20
  %27 = tail call i8* @halide_string_to_string(i8* %22, i8* %14, i8* nonnull %1) #16
  br label %28

28:                                               ; preds = %26, %24
  %29 = phi i8* [ %27, %26 ], [ %25, %24 ]
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %14, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.117, i64 0, i64 0)) #16
  %31 = sext i32 %3 to i64
  %32 = tail call i8* @halide_int64_to_string(i8* %30, i8* %14, i64 %31, i32 1) #16
  %33 = tail call i8* @halide_string_to_string(i8* %32, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #16
  %34 = sext i32 %4 to i64
  %35 = tail call i8* @halide_int64_to_string(i8* %33, i8* %14, i64 %34, i32 1) #16
  %36 = tail call i8* @halide_string_to_string(i8* %35, i8* %14, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.119, i64 0, i64 0)) #16
  %37 = sext i32 %5 to i64
  %38 = tail call i8* @halide_int64_to_string(i8* %36, i8* %14, i64 %37, i32 1) #16
  %39 = tail call i8* @halide_string_to_string(i8* %38, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #16
  %40 = sext i32 %6 to i64
  %41 = tail call i8* @halide_int64_to_string(i8* %39, i8* %14, i64 %40, i32 1) #16
  %42 = tail call i8* @halide_string_to_string(i8* %41, i8* %14, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #16
  br i1 %9, label %43, label %44

43:                                               ; preds = %28
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %50

44:                                               ; preds = %28
  %45 = ptrtoint i8* %42 to i64
  %46 = ptrtoint i8* %8 to i64
  %47 = sub i64 1, %46
  %48 = add i64 %47, %45
  %49 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %8, i64 %48) #16
  tail call void @halide_error(i8* %0, i8* nonnull %8) #16
  br label %50

50:                                               ; preds = %44, %43
  tail call void @free(i8* %8) #16
  ret i32 -2
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_type(i8* %0, i8* %1, i32 %2, i32 %3) local_unnamed_addr #4 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.halide_type_t, align 2
  %8 = alloca %struct.halide_type_t, align 2
  store i32 %2, i32* %5, align 4, !tbaa !16
  store i32 %3, i32* %6, align 4, !tbaa !16
  %9 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #18
  store i8 0, i8* %9, align 2, !tbaa !209
  %10 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 1
  store i8 0, i8* %10, align 1, !tbaa !28
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 2
  store i16 0, i16* %11, align 2, !tbaa !210
  %12 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #18
  store i8 0, i8* %12, align 2, !tbaa !209
  %13 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 1
  store i8 0, i8* %13, align 1, !tbaa !28
  %14 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 2
  store i16 0, i16* %14, align 2, !tbaa !210
  %15 = bitcast i32* %6 to i8*
  %16 = call i8* @memcpy(i8* nonnull %9, i8* nonnull %15, i64 4) #16
  %17 = bitcast i32* %5 to i8*
  %18 = call i8* @memcpy(i8* nonnull %12, i8* nonnull %17, i64 4) #16
  %19 = call i8* @malloc(i64 1024) #16
  %20 = icmp eq i8* %19, null
  br i1 %20, label %23, label %21

21:                                               ; preds = %4
  %22 = getelementptr inbounds i8, i8* %19, i64 1023
  store i8 0, i8* %22, align 1, !tbaa !38
  br label %23

23:                                               ; preds = %21, %4
  %24 = phi i8* [ %22, %21 ], [ null, %4 ]
  %25 = icmp eq i8* %1, null
  br i1 %25, label %26, label %28

26:                                               ; preds = %23
  %27 = call i8* @halide_string_to_string(i8* %19, i8* %24, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %30

28:                                               ; preds = %23
  %29 = call i8* @halide_string_to_string(i8* %19, i8* %24, i8* nonnull %1) #16
  br label %30

30:                                               ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = call i8* @halide_string_to_string(i8* %31, i8* %24, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.121, i64 0, i64 0)) #16
  %33 = call i8* @halide_type_to_string(i8* %32, i8* %24, %struct.halide_type_t* nonnull %7) #16
  %34 = call i8* @halide_string_to_string(i8* %33, i8* %24, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.122, i64 0, i64 0)) #16
  %35 = call i8* @halide_type_to_string(i8* %34, i8* %24, %struct.halide_type_t* nonnull %8) #16
  br i1 %20, label %42, label %36

36:                                               ; preds = %30
  %37 = ptrtoint i8* %35 to i64
  %38 = ptrtoint i8* %19 to i64
  %39 = sub i64 1, %38
  %40 = add i64 %39, %37
  %41 = call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %19, i64 %40) #16
  br label %42

42:                                               ; preds = %36, %30
  %43 = phi i8* [ %19, %36 ], [ getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0), %30 ]
  call void @halide_error(i8* %0, i8* nonnull %43) #16
  call void @free(i8* %19) #16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #18
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #18
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8* %0, i8* %1, i32 %2, i32 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  br label %9

9:                                                ; preds = %7, %4
  %10 = phi i8* [ %8, %7 ], [ null, %4 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %5, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %5, i8* %10, i8* nonnull %1) #16
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.123, i64 0, i64 0)) #16
  %19 = sext i32 %3 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %10, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.124, i64 0, i64 0)) #16
  %22 = sext i32 %2 to i64
  %23 = tail call i8* @halide_int64_to_string(i8* %21, i8* %10, i64 %22, i32 1) #16
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %10, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.125, i64 0, i64 0)) #16
  br i1 %6, label %25, label %26

25:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %32

26:                                               ; preds = %16
  %27 = ptrtoint i8* %24 to i64
  %28 = ptrtoint i8* %5 to i64
  %29 = sub i64 1, %28
  %30 = add i64 %29, %27
  %31 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %30) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %32

32:                                               ; preds = %26, %25
  tail call void @free(i8* %5) #16
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8* %0, i8* %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #4 {
  %8 = icmp slt i32 %3, %5
  br i1 %8, label %9, label %39

9:                                                ; preds = %7
  %10 = tail call i8* @malloc(i64 1024) #16
  %11 = icmp eq i8* %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = getelementptr inbounds i8, i8* %10, i64 1023
  store i8 0, i8* %13, align 1, !tbaa !38
  br label %14

14:                                               ; preds = %12, %9
  %15 = phi i8* [ %13, %12 ], [ null, %9 ]
  %16 = icmp eq i8* %1, null
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = tail call i8* @halide_string_to_string(i8* %10, i8* %15, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %21

19:                                               ; preds = %14
  %20 = tail call i8* @halide_string_to_string(i8* %10, i8* %15, i8* nonnull %1) #16
  br label %21

21:                                               ; preds = %19, %17
  %22 = phi i8* [ %20, %19 ], [ %18, %17 ]
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %15, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #16
  %24 = sext i32 %3 to i64
  %25 = tail call i8* @halide_int64_to_string(i8* %23, i8* %15, i64 %24, i32 1) #16
  %26 = tail call i8* @halide_string_to_string(i8* %25, i8* %15, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.127, i64 0, i64 0)) #16
  %27 = sext i32 %5 to i64
  %28 = tail call i8* @halide_int64_to_string(i8* %26, i8* %15, i64 %27, i32 1) #16
  %29 = tail call i8* @halide_string_to_string(i8* %28, i8* %15, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #16
  %30 = sext i32 %2 to i64
  %31 = tail call i8* @halide_int64_to_string(i8* %29, i8* %15, i64 %30, i32 1) #16
  br i1 %11, label %32, label %33

32:                                               ; preds = %21
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %71

33:                                               ; preds = %21
  %34 = ptrtoint i8* %31 to i64
  %35 = ptrtoint i8* %10 to i64
  %36 = sub i64 1, %35
  %37 = add i64 %36, %34
  %38 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %10, i64 %37) #16
  tail call void @halide_error(i8* %0, i8* nonnull %10) #16
  br label %71

39:                                               ; preds = %7
  %40 = icmp sgt i32 %4, %6
  br i1 %40, label %41, label %73

41:                                               ; preds = %39
  %42 = tail call i8* @malloc(i64 1024) #16
  %43 = icmp eq i8* %42, null
  br i1 %43, label %46, label %44

44:                                               ; preds = %41
  %45 = getelementptr inbounds i8, i8* %42, i64 1023
  store i8 0, i8* %45, align 1, !tbaa !38
  br label %46

46:                                               ; preds = %44, %41
  %47 = phi i8* [ %45, %44 ], [ null, %41 ]
  %48 = icmp eq i8* %1, null
  br i1 %48, label %49, label %51

49:                                               ; preds = %46
  %50 = tail call i8* @halide_string_to_string(i8* %42, i8* %47, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %53

51:                                               ; preds = %46
  %52 = tail call i8* @halide_string_to_string(i8* %42, i8* %47, i8* nonnull %1) #16
  br label %53

53:                                               ; preds = %51, %49
  %54 = phi i8* [ %52, %51 ], [ %50, %49 ]
  %55 = tail call i8* @halide_string_to_string(i8* %54, i8* %47, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #16
  %56 = sext i32 %4 to i64
  %57 = tail call i8* @halide_int64_to_string(i8* %55, i8* %47, i64 %56, i32 1) #16
  %58 = tail call i8* @halide_string_to_string(i8* %57, i8* %47, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.129, i64 0, i64 0)) #16
  %59 = sext i32 %6 to i64
  %60 = tail call i8* @halide_int64_to_string(i8* %58, i8* %47, i64 %59, i32 1) #16
  %61 = tail call i8* @halide_string_to_string(i8* %60, i8* %47, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #16
  %62 = sext i32 %2 to i64
  %63 = tail call i8* @halide_int64_to_string(i8* %61, i8* %47, i64 %62, i32 1) #16
  br i1 %43, label %64, label %65

64:                                               ; preds = %53
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %71

65:                                               ; preds = %53
  %66 = ptrtoint i8* %63 to i64
  %67 = ptrtoint i8* %42 to i64
  %68 = sub i64 1, %67
  %69 = add i64 %68, %66
  %70 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %42, i64 %69) #16
  tail call void @halide_error(i8* %0, i8* nonnull %42) #16
  br label %71

71:                                               ; preds = %65, %64, %33, %32
  %72 = phi i8* [ null, %32 ], [ %10, %33 ], [ null, %64 ], [ %42, %65 ]
  tail call void @free(i8* %72) #16
  br label %73

73:                                               ; preds = %71, %39
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8* %0, i8* %1, i32 %2, i32 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.134, i64 0, i64 0)) #16
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #16
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %11, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.135, i64 0, i64 0)) #16
  %23 = sext i32 %3 to i64
  %24 = tail call i8* @halide_int64_to_string(i8* %22, i8* %11, i64 %23, i32 1) #16
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %11, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #16
  br i1 %6, label %26, label %27

26:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %33

27:                                               ; preds = %17
  %28 = ptrtoint i8* %25 to i64
  %29 = ptrtoint i8* %5 to i64
  %30 = sub i64 1, %29
  %31 = add i64 %30, %28
  %32 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %31) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %33

33:                                               ; preds = %27, %26
  tail call void @free(i8* %5) #16
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_int64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8* %0, i8* %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #4 {
  %8 = add i32 %5, -1
  %9 = add i32 %8, %6
  %10 = add i32 %3, -1
  %11 = add i32 %10, %4
  %12 = tail call i8* @malloc(i64 1024) #16
  %13 = icmp eq i8* %12, null
  br i1 %13, label %.split, label %.split2

.split:                                           ; preds = %7
  %14 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #16
  br label %17

.split2:                                          ; preds = %7
  %15 = getelementptr inbounds i8, i8* %12, i64 1023
  store i8 0, i8* %15, align 1, !tbaa !38
  %16 = tail call i8* @halide_string_to_string(i8* nonnull %12, i8* nonnull %15, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #16
  br label %17

17:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %14, %.split ], [ %16, %.split2 ]
  %18 = phi i8* [ null, %.split ], [ %15, %.split2 ]
  %19 = icmp eq i8* %1, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %18, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %24

22:                                               ; preds = %17
  %23 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %18, i8* nonnull %1) #16
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i8* [ %23, %22 ], [ %21, %20 ]
  %26 = tail call i8* @halide_string_to_string(i8* %25, i8* %18, i8* nonnull getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.138, i64 0, i64 0)) #16
  %27 = sext i32 %2 to i64
  %28 = tail call i8* @halide_int64_to_string(i8* %26, i8* %18, i64 %27, i32 1) #16
  %29 = tail call i8* @halide_string_to_string(i8* %28, i8* %18, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #16
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %18, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.140, i64 0, i64 0)) #16
  %31 = sext i32 %5 to i64
  %32 = tail call i8* @halide_int64_to_string(i8* %30, i8* %18, i64 %31, i32 1) #16
  %33 = tail call i8* @halide_string_to_string(i8* %32, i8* %18, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #16
  %34 = sext i32 %9 to i64
  %35 = tail call i8* @halide_int64_to_string(i8* %33, i8* %18, i64 %34, i32 1) #16
  %36 = tail call i8* @halide_string_to_string(i8* %35, i8* %18, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #16
  %37 = tail call i8* @halide_string_to_string(i8* %36, i8* %18, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.141, i64 0, i64 0)) #16
  %38 = sext i32 %3 to i64
  %39 = tail call i8* @halide_int64_to_string(i8* %37, i8* %18, i64 %38, i32 1) #16
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %18, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #16
  %41 = sext i32 %11 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %18, i64 %41, i32 1) #16
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %18, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #16
  br i1 %13, label %44, label %45

44:                                               ; preds = %24
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %51

45:                                               ; preds = %24
  %46 = ptrtoint i8* %43 to i64
  %47 = ptrtoint i8* %12 to i64
  %48 = sub i64 1, %47
  %49 = add i64 %48, %46
  %50 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %12, i64 %49) #16
  tail call void @halide_error(i8* %0, i8* nonnull %12) #16
  br label %51

51:                                               ; preds = %45, %44
  tail call void @free(i8* %12) #16
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8* %0, i8* %1, i32 %2, i8* %3, i32 %4) local_unnamed_addr #4 {
  %6 = tail call i8* @malloc(i64 1024) #16
  %7 = icmp eq i8* %6, null
  br i1 %7, label %.split, label %.split2

.split:                                           ; preds = %5
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #16
  br label %11

.split2:                                          ; preds = %5
  %9 = getelementptr inbounds i8, i8* %6, i64 1023
  store i8 0, i8* %9, align 1, !tbaa !38
  %10 = tail call i8* @halide_string_to_string(i8* nonnull %6, i8* nonnull %9, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #16
  br label %11

11:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %8, %.split ], [ %10, %.split2 ]
  %12 = phi i8* [ null, %.split ], [ %9, %.split2 ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %18

16:                                               ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #16
  br label %18

18:                                               ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #16
  %21 = sext i32 %2 to i64
  %22 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %21, i32 1) #16
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %12, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.145, i64 0, i64 0)) #16
  %24 = icmp eq i8* %3, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %18
  %26 = tail call i8* @halide_string_to_string(i8* %23, i8* %12, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %29

27:                                               ; preds = %18
  %28 = tail call i8* @halide_string_to_string(i8* %23, i8* %12, i8* nonnull %3) #16
  br label %29

29:                                               ; preds = %27, %25
  %30 = phi i8* [ %28, %27 ], [ %26, %25 ]
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %12, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #16
  %32 = sext i32 %4 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %12, i64 %32, i32 1) #16
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %12, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.120, i64 0, i64 0)) #16
  br i1 %7, label %35, label %36

35:                                               ; preds = %29
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %42

36:                                               ; preds = %29
  %37 = ptrtoint i8* %34 to i64
  %38 = ptrtoint i8* %6 to i64
  %39 = sub i64 1, %38
  %40 = add i64 %39, %37
  %41 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %6, i64 %40) #16
  tail call void @halide_error(i8* %0, i8* nonnull %6) #16
  br label %42

42:                                               ; preds = %36, %35
  tail call void @free(i8* %6) #16
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_int64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8* %0, i8* %1, double %2, double %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_double_to_string(i8* %19, i8* %11, double %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_double_to_string(i8* %21, i8* %11, double %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_int64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %11, i64 %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %11, i64 %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8* %0, i8* %1, double %2, double %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #16
  %20 = tail call i8* @halide_double_to_string(i8* %19, i8* %11, double %2, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #16
  %22 = tail call i8* @halide_double_to_string(i8* %21, i8* %11, double %3, i32 1) #16
  br i1 %6, label %23, label %24

23:                                               ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %30

24:                                               ; preds = %17
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %5 to i64
  %27 = sub i64 1, %26
  %28 = add i64 %27, %25
  %29 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %30

30:                                               ; preds = %24, %23
  tail call void @free(i8* %5) #16
  ret i32 -10
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_error_out_of_memory(i8* %0) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.37, i64 0, i64 0)) #16
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #16
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #16
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !38
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #16
  br label %8

8:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #16
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i64 0, i64 0)) #16
  br i1 %4, label %18, label %19

18:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %25

19:                                               ; preds = %15
  %20 = ptrtoint i8* %17 to i64
  %21 = ptrtoint i8* %3 to i64
  %22 = sub i64 1, %21
  %23 = add i64 %22, %20
  %24 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %23) #16
  tail call void @halide_error(i8* %0, i8* nonnull %3) #16
  br label %25

25:                                               ; preds = %19, %18
  tail call void @free(i8* %3) #16
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8* %0, i8* %1, i8* %2, i32 %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i64 0, i64 0)) #16
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %25

23:                                               ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #16
  br label %25

25:                                               ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %11, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42.149, i64 0, i64 0)) #16
  %28 = sext i32 %3 to i64
  %29 = tail call i8* @halide_int64_to_string(i8* %27, i8* %11, i64 %28, i32 1) #16
  br i1 %6, label %30, label %31

30:                                               ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %37

31:                                               ; preds = %25
  %32 = ptrtoint i8* %29 to i64
  %33 = ptrtoint i8* %5 to i64
  %34 = sub i64 1, %33
  %35 = add i64 %34, %32
  %36 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %35) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %37

37:                                               ; preds = %31, %30
  tail call void @free(i8* %5) #16
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8* %0, i8* %1, i32 %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #16
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %9

9:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #16
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i64 0, i64 0)) #16
  %19 = sext i32 %2 to i64
  %20 = tail call i8* @halide_int64_to_string(i8* %18, i8* %10, i64 %19, i32 1) #16
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %10, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.45, i64 0, i64 0)) #16
  br i1 %5, label %22, label %23

22:                                               ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %29

23:                                               ; preds = %16
  %24 = ptrtoint i8* %21 to i64
  %25 = ptrtoint i8* %4 to i64
  %26 = sub i64 1, %25
  %27 = add i64 %26, %24
  %28 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %27) #16
  tail call void @halide_error(i8* %0, i8* nonnull %4) #16
  br label %29

29:                                               ; preds = %23, %22
  tail call void @free(i8* %4) #16
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_dirty_with_no_device_support(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #16
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i64 0, i64 0)) #16
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !38
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i64 0, i64 0)) #16
  br label %8

8:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #16
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.47, i64 0, i64 0)) #16
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %9, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.48, i64 0, i64 0)) #16
  br i1 %4, label %19, label %20

19:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %26

20:                                               ; preds = %15
  %21 = ptrtoint i8* %18 to i64
  %22 = ptrtoint i8* %3 to i64
  %23 = sub i64 1, %22
  %24 = add i64 %23, %21
  %25 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %24) #16
  tail call void @halide_error(i8* %0, i8* nonnull %3) #16
  br label %26

26:                                               ; preds = %20, %19
  tail call void @free(i8* %3) #16
  ret i32 -44
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #16
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !38
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.43, i64 0, i64 0)) #16
  br label %8

8:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #16
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i64 0, i64 0)) #16
  br i1 %4, label %18, label %19

18:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %25

19:                                               ; preds = %15
  %20 = ptrtoint i8* %17 to i64
  %21 = ptrtoint i8* %3 to i64
  %22 = sub i64 1, %21
  %23 = add i64 %22, %20
  %24 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %23) #16
  tail call void @halide_error(i8* %0, i8* nonnull %3) #16
  br label %25

25:                                               ; preds = %19, %18
  tail call void @free(i8* %3) #16
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8* %0, i8* %1, i8* %2, i8* %3) local_unnamed_addr #4 {
  %5 = tail call i8* @malloc(i64 1024) #16
  %6 = icmp eq i8* %5, null
  br i1 %6, label %.split, label %.split2

.split:                                           ; preds = %4
  %7 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #16
  br label %10

.split2:                                          ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !38
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #16
  br label %10

10:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %7, %.split ], [ %9, %.split2 ]
  %11 = phi i8* [ null, %.split ], [ %8, %.split2 ]
  %12 = icmp eq i8* %2, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %17

15:                                               ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %2) #16
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %20 = icmp eq i8* %1, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %25

23:                                               ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %1) #16
  br label %25

25:                                               ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %11, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i64 0, i64 0)) #16
  %28 = icmp eq i8* %3, null
  br i1 %28, label %29, label %31

29:                                               ; preds = %25
  %30 = tail call i8* @halide_string_to_string(i8* %27, i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %33

31:                                               ; preds = %25
  %32 = tail call i8* @halide_string_to_string(i8* %27, i8* %11, i8* nonnull %3) #16
  br label %33

33:                                               ; preds = %31, %29
  %34 = phi i8* [ %32, %31 ], [ %30, %29 ]
  %35 = tail call i8* @halide_string_to_string(i8* %34, i8* %11, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #16
  br i1 %6, label %36, label %37

36:                                               ; preds = %33
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %43

37:                                               ; preds = %33
  %38 = ptrtoint i8* %35 to i64
  %39 = ptrtoint i8* %5 to i64
  %40 = sub i64 1, %39
  %41 = add i64 %40, %38
  %42 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %41) #16
  tail call void @halide_error(i8* %0, i8* nonnull %5) #16
  br label %43

43:                                               ; preds = %37, %36
  tail call void @free(i8* %5) #16
  ret i32 -25
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_extern_fold(i8* %0, i8* %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #4 {
  %8 = icmp slt i32 %3, %5
  br i1 %8, label %13, label %9

9:                                                ; preds = %7
  %10 = add nsw i32 %4, %3
  %11 = add nsw i32 %6, %5
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %56

13:                                               ; preds = %9, %7
  %14 = tail call i8* @malloc(i64 1024) #16
  %15 = icmp eq i8* %14, null
  br i1 %15, label %.split, label %.split2

.split:                                           ; preds = %13
  %16 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %19

.split2:                                          ; preds = %13
  %17 = getelementptr inbounds i8, i8* %14, i64 1023
  store i8 0, i8* %17, align 1, !tbaa !38
  %18 = tail call i8* @halide_string_to_string(i8* nonnull %14, i8* nonnull %17, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %19

19:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %16, %.split ], [ %18, %.split2 ]
  %20 = phi i8* [ null, %.split ], [ %17, %.split2 ]
  %21 = sext i32 %2 to i64
  %22 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %20, i64 %21, i32 1) #16
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %20, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %24 = icmp eq i8* %1, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %19
  %26 = tail call i8* @halide_string_to_string(i8* %23, i8* %20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %29

27:                                               ; preds = %19
  %28 = tail call i8* @halide_string_to_string(i8* %23, i8* %20, i8* nonnull %1) #16
  br label %29

29:                                               ; preds = %27, %25
  %30 = phi i8* [ %28, %27 ], [ %26, %25 ]
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %20, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #16
  %32 = sext i32 %3 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %20, i64 %32, i32 1) #16
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  %35 = add nsw i32 %4, %3
  %36 = add nsw i32 %35, -1
  %37 = sext i32 %36 to i64
  %38 = tail call i8* @halide_int64_to_string(i8* %34, i8* %20, i64 %37, i32 1) #16
  %39 = tail call i8* @halide_string_to_string(i8* %38, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #16
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %20, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57.150, i64 0, i64 0)) #16
  %41 = sext i32 %5 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %20, i64 %41, i32 1) #16
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  %44 = add nsw i32 %6, %5
  %45 = add nsw i32 %44, -1
  %46 = sext i32 %45 to i64
  %47 = tail call i8* @halide_int64_to_string(i8* %43, i8* %20, i64 %46, i32 1) #16
  %48 = tail call i8* @halide_string_to_string(i8* %47, i8* %20, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.151, i64 0, i64 0)) #16
  br i1 %15, label %49, label %50

49:                                               ; preds = %29
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %94

50:                                               ; preds = %29
  %51 = ptrtoint i8* %48 to i64
  %52 = ptrtoint i8* %14 to i64
  %53 = sub i64 1, %52
  %54 = add i64 %53, %51
  %55 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 %54) #16
  tail call void @halide_error(i8* %0, i8* nonnull %14) #16
  br label %94

56:                                               ; preds = %9
  %57 = tail call i8* @malloc(i64 1024) #16
  %58 = icmp eq i8* %57, null
  br i1 %58, label %.split3, label %.split5

.split3:                                          ; preds = %56
  %59 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %62

.split5:                                          ; preds = %56
  %60 = getelementptr inbounds i8, i8* %57, i64 1023
  store i8 0, i8* %60, align 1, !tbaa !38
  %61 = tail call i8* @halide_string_to_string(i8* nonnull %57, i8* nonnull %60, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #16
  br label %62

62:                                               ; preds = %.split3, %.split5
  %phi.call6 = phi i8* [ %59, %.split3 ], [ %61, %.split5 ]
  %63 = phi i8* [ null, %.split3 ], [ %60, %.split5 ]
  %64 = sext i32 %2 to i64
  %65 = tail call i8* @halide_int64_to_string(i8* %phi.call6, i8* %63, i64 %64, i32 1) #16
  %66 = tail call i8* @halide_string_to_string(i8* %65, i8* %63, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %67 = icmp eq i8* %1, null
  br i1 %67, label %68, label %70

68:                                               ; preds = %62
  %69 = tail call i8* @halide_string_to_string(i8* %66, i8* %63, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %72

70:                                               ; preds = %62
  %71 = tail call i8* @halide_string_to_string(i8* %66, i8* %63, i8* nonnull %1) #16
  br label %72

72:                                               ; preds = %70, %68
  %73 = phi i8* [ %71, %70 ], [ %69, %68 ]
  %74 = tail call i8* @halide_string_to_string(i8* %73, i8* %63, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #16
  %75 = sext i32 %3 to i64
  %76 = tail call i8* @halide_int64_to_string(i8* %74, i8* %63, i64 %75, i32 1) #16
  %77 = tail call i8* @halide_string_to_string(i8* %76, i8* %63, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #16
  %78 = add nsw i32 %10, -1
  %79 = sext i32 %78 to i64
  %80 = tail call i8* @halide_int64_to_string(i8* %77, i8* %63, i64 %79, i32 1) #16
  %81 = tail call i8* @halide_string_to_string(i8* %80, i8* %63, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #16
  %82 = tail call i8* @halide_string_to_string(i8* %81, i8* %63, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.152, i64 0, i64 0)) #16
  %83 = tail call i8* @halide_string_to_string(i8* %82, i8* %63, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.153, i64 0, i64 0)) #16
  %84 = sext i32 %6 to i64
  %85 = tail call i8* @halide_int64_to_string(i8* %83, i8* %63, i64 %84, i32 1) #16
  %86 = tail call i8* @halide_string_to_string(i8* %85, i8* %63, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #16
  br i1 %58, label %87, label %88

87:                                               ; preds = %72
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %94

88:                                               ; preds = %72
  %89 = ptrtoint i8* %86 to i64
  %90 = ptrtoint i8* %57 to i64
  %91 = sub i64 1, %90
  %92 = add i64 %91, %89
  %93 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %57, i64 %92) #16
  tail call void @halide_error(i8* %0, i8* nonnull %57) #16
  br label %94

94:                                               ; preds = %88, %87, %50, %49
  %95 = phi i8* [ null, %49 ], [ %14, %50 ], [ null, %87 ], [ %57, %88 ]
  tail call void @free(i8* %95) #16
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8* %0, i8* %1, i8* %2, i32 %3, i8* %4, i32 %5) local_unnamed_addr #4 {
  %7 = tail call i8* @malloc(i64 1024) #16
  %8 = icmp eq i8* %7, null
  br i1 %8, label %.split, label %.split2

.split:                                           ; preds = %6
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #16
  br label %12

.split2:                                          ; preds = %6
  %10 = getelementptr inbounds i8, i8* %7, i64 1023
  store i8 0, i8* %10, align 1, !tbaa !38
  %11 = tail call i8* @halide_string_to_string(i8* nonnull %7, i8* nonnull %10, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #16
  br label %12

12:                                               ; preds = %.split, %.split2
  %phi.call = phi i8* [ %9, %.split ], [ %11, %.split2 ]
  %13 = phi i8* [ null, %.split ], [ %10, %.split2 ]
  %14 = sext i32 %3 to i64
  %15 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %13, i64 %14, i32 1) #16
  %16 = tail call i8* @halide_string_to_string(i8* %15, i8* %13, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i64 0, i64 0)) #16
  %17 = icmp eq i8* %2, null
  br i1 %17, label %18, label %20

18:                                               ; preds = %12
  %19 = tail call i8* @halide_string_to_string(i8* %16, i8* %13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %22

20:                                               ; preds = %12
  %21 = tail call i8* @halide_string_to_string(i8* %16, i8* %13, i8* nonnull %2) #16
  br label %22

22:                                               ; preds = %20, %18
  %23 = phi i8* [ %21, %20 ], [ %19, %18 ]
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %13, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #16
  %25 = icmp eq i8* %1, null
  br i1 %25, label %26, label %28

26:                                               ; preds = %22
  %27 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %30

28:                                               ; preds = %22
  %29 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* nonnull %1) #16
  br label %30

30:                                               ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = tail call i8* @halide_string_to_string(i8* %31, i8* %13, i8* nonnull getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i64 0, i64 0)) #16
  %33 = icmp eq i8* %4, null
  br i1 %33, label %34, label %36

34:                                               ; preds = %30
  %35 = tail call i8* @halide_string_to_string(i8* %32, i8* %13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %38

36:                                               ; preds = %30
  %37 = tail call i8* @halide_string_to_string(i8* %32, i8* %13, i8* nonnull %4) #16
  br label %38

38:                                               ; preds = %36, %34
  %39 = phi i8* [ %37, %36 ], [ %35, %34 ]
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #16
  %41 = sext i32 %5 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %13, i64 %41, i32 1) #16
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.155, i64 0, i64 0)) #16
  br i1 %8, label %44, label %45

44:                                               ; preds = %38
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %51

45:                                               ; preds = %38
  %46 = ptrtoint i8* %43 to i64
  %47 = ptrtoint i8* %7 to i64
  %48 = sub i64 1, %47
  %49 = add i64 %48, %46
  %50 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %7, i64 %49) #16
  tail call void @halide_error(i8* %0, i8* nonnull %7) #16
  br label %51

51:                                               ; preds = %45, %44
  tail call void @free(i8* %7) #16
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8* %0, i8* %1, i8* %2) local_unnamed_addr #4 {
  %4 = tail call i8* @malloc(i64 1024) #16
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.split, label %.split2

.split:                                           ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #16
  br label %9

.split2:                                          ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #16
  br label %9

9:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %6, %.split ], [ %8, %.split2 ]
  %10 = phi i8* [ null, %.split ], [ %7, %.split2 ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %16

14:                                               ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #16
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i64 0, i64 0)) #16
  %19 = icmp eq i8* %2, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = tail call i8* @halide_string_to_string(i8* %18, i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %24

22:                                               ; preds = %16
  %23 = tail call i8* @halide_string_to_string(i8* %18, i8* %10, i8* nonnull %2) #16
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i8* [ %23, %22 ], [ %21, %20 ]
  br i1 %5, label %26, label %27

26:                                               ; preds = %24
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %33

27:                                               ; preds = %24
  %28 = ptrtoint i8* %25 to i64
  %29 = ptrtoint i8* %4 to i64
  %30 = sub i64 1, %29
  %31 = add i64 %30, %28
  %32 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %31) #16
  tail call void @halide_error(i8* %0, i8* nonnull %4) #16
  br label %33

33:                                               ; preds = %27, %26
  tail call void @free(i8* %4) #16
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #16
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #16
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !38
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #16
  br label %8

8:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #16
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  br i1 %4, label %17, label %18

17:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %24

18:                                               ; preds = %15
  %19 = ptrtoint i8* %16 to i64
  %20 = ptrtoint i8* %3 to i64
  %21 = sub i64 1, %20
  %22 = add i64 %21, %19
  %23 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %22) #16
  tail call void @halide_error(i8* %0, i8* nonnull %3) #16
  br label %24

24:                                               ; preds = %18, %17
  tail call void @free(i8* %3) #16
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8* %0) local_unnamed_addr #4 {
  %2 = tail call i8* @malloc(i64 1024) #16
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %14

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %7, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #16
  %9 = ptrtoint i8* %8 to i64
  %10 = ptrtoint i8* %2 to i64
  %11 = sub i64 1, %10
  %12 = add i64 %11, %9
  %13 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %12) #16
  tail call void @halide_error(i8* %0, i8* nonnull %2) #16
  br label %14

14:                                               ; preds = %6, %4
  tail call void @free(i8* %2) #16
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8* %0) local_unnamed_addr #4 {
  %2 = tail call i8* @malloc(i64 1024) #16
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i64 0, i64 0)) #16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %14

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %7, i8* nonnull getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i64 0, i64 0)) #16
  %9 = ptrtoint i8* %8 to i64
  %10 = ptrtoint i8* %2 to i64
  %11 = sub i64 1, %10
  %12 = add i64 %11, %9
  %13 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %12) #16
  tail call void @halide_error(i8* %0, i8* nonnull %2) #16
  br label %14

14:                                               ; preds = %6, %4
  tail call void @free(i8* %2) #16
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8* %0) local_unnamed_addr #4 {
  %2 = tail call i8* @malloc(i64 1024) #16
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %14

6:                                                ; preds = %1
  %7 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !38
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %7, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #16
  %9 = ptrtoint i8* %8 to i64
  %10 = ptrtoint i8* %2 to i64
  %11 = sub i64 1, %10
  %12 = add i64 %11, %9
  %13 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %12) #16
  tail call void @halide_error(i8* %0, i8* nonnull %2) #16
  br label %14

14:                                               ; preds = %6, %4
  tail call void @free(i8* %2) #16
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8* %0, i8* %1) local_unnamed_addr #4 {
  %3 = tail call i8* @malloc(i64 1024) #16
  %4 = icmp eq i8* %3, null
  br i1 %4, label %.split, label %.split2

.split:                                           ; preds = %2
  %5 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #16
  br label %8

.split2:                                          ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !38
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #16
  br label %8

8:                                                ; preds = %.split, %.split2
  %phi.call = phi i8* [ %5, %.split ], [ %7, %.split2 ]
  %9 = phi i8* [ null, %.split ], [ %6, %.split2 ]
  %10 = icmp eq i8* %1, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.74, i64 0, i64 0)) #16
  br label %15

13:                                               ; preds = %8
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %9, i8* nonnull %1) #16
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i8* [ %14, %13 ], [ %12, %11 ]
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %9, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i64 0, i64 0)) #16
  br i1 %4, label %18, label %19

18:                                               ; preds = %15
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.73, i64 0, i64 0)) #16
  br label %25

19:                                               ; preds = %15
  %20 = ptrtoint i8* %17 to i64
  %21 = ptrtoint i8* %3 to i64
  %22 = sub i64 1, %21
  %23 = add i64 %22, %20
  %24 = tail call i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %23) #16
  tail call void @halide_error(i8* %0, i8* nonnull %3) #16
  br label %25

25:                                               ; preds = %19, %18
  tail call void @free(i8* %3) #16
  ret i32 -38
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %1, i64 %2) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_check_memory_is_initialized(i8* %0, i8* %1, i64 %2, i8* %3) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_check_buffer_is_initialized(i8* %0, %struct.halide_buffer_t* %1, i8* %2) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 @halide_msan_annotate_buffer_is_initialized(i8* %0, %struct.halide_buffer_t* %1) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_msan_annotate_buffer_is_initialized_as_destructor(i8* %0, i8* %1) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_default_can_use_target_features(i32 %0, i64* %1) #4 {
  %3 = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #16
  %4 = load i8, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18, !range !21
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %7) #18
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %3) #16
  %8 = call i8* @memcpy(i8* bitcast ([4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE to i8*), i8* nonnull %7, i64 32) #16
  store i8 1, i8* @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, align 1, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %7) #18
  br label %9

9:                                                ; preds = %6, %2
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE) #16
  %10 = icmp eq i32 %0, 2
  br i1 %10, label %12, label %11

11:                                               ; preds = %9
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.168, i64 0, i64 0)) #16
  br label %12

12:                                               ; preds = %11, %9
  %13 = load i64, i64* %1, align 8, !tbaa !64
  %14 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 0), align 8, !tbaa !64
  %15 = and i64 %14, %13
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %21, label %17

17:                                               ; preds = %12
  %18 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 2), align 8, !tbaa !64
  %19 = and i64 %18, %15
  %20 = icmp eq i64 %19, %15
  br i1 %20, label %21, label %27

21:                                               ; preds = %17, %12
  %22 = getelementptr inbounds i64, i64* %1, i64 1
  %23 = load i64, i64* %22, align 8, !tbaa !64
  %24 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 1), align 8, !tbaa !64
  %25 = and i64 %24, %23
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %33, label %29

27:                                               ; preds = %33, %29, %17
  %28 = phi i32 [ 0, %17 ], [ 0, %29 ], [ 1, %33 ]
  ret i32 %28

29:                                               ; preds = %21
  %30 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, i64 0, i64 3), align 8, !tbaa !64
  %31 = and i64 %30, %25
  %32 = icmp eq i64 %31, %25
  br i1 %32, label %33, label %27

33:                                               ; preds = %29, %21
  br label %27
}

; Function Attrs: nounwind willreturn mustprogress
define weak i32 (i32, i64*)* @halide_set_custom_can_use_target_features(i32 (i32, i64*)* %0) local_unnamed_addr #2 {
  %2 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !12
  store i32 (i32, i64*)* %0, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !12
  ret i32 (i32, i64*)* %2
}

; Function Attrs: nounwind mustprogress
define weak i32 @halide_can_use_target_features(i32 %0, i64* %1) local_unnamed_addr #0 {
  %3 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !12
  %4 = tail call i32 %3(i32 %0, i64* %1) #16
  ret i32 %4
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* noalias sret(%"struct.Halide::Runtime::Internal::CpuFeatures") align 8 %0) local_unnamed_addr #9 {
  %2 = alloca [4 x i32], align 4
  %3 = alloca [4 x i32], align 4
  %4 = alloca [4 x i32], align 4
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %0, i64 0, i32 1, i64 0
  %6 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %0 to <4 x i64>*
  store <4 x i64> <i64 17042430231280, i64 0, i64 0, i64 0>, <4 x i64>* %6, align 8, !tbaa !64
  %7 = bitcast [4 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #18
  %8 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 0
  store i32 1, i32* %8, align 4, !tbaa !16
  %9 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 1
  store i32 0, i32* %9, align 4, !tbaa !16
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %8) #18
  %10 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 2
  %11 = load i32, i32* %10, align 4, !tbaa !16
  %12 = lshr i32 %11, 15
  %13 = and i32 %12, 16
  %14 = lshr i32 %11, 23
  %15 = and i32 %14, 32
  %16 = or i32 %15, %13
  %17 = lshr i32 %11, 20
  %18 = and i32 %17, 512
  %19 = or i32 %16, %18
  %20 = lshr i32 %11, 5
  %21 = and i32 %20, 128
  %22 = or i32 %19, %21
  %23 = zext i32 %22 to i64
  %24 = and i32 %11, 805834752
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %27, label %26

26:                                               ; preds = %1
  store i64 %23, i64* %5, align 8, !tbaa !64
  br label %27

27:                                               ; preds = %26, %1
  %28 = and i32 %11, 1879048192
  %29 = icmp eq i32 %28, 1879048192
  br i1 %29, label %30, label %71

30:                                               ; preds = %27
  %31 = bitcast [4 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %31) #18
  %32 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  store i32 7, i32* %32, align 4, !tbaa !16
  %33 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 1
  store i32 0, i32* %33, align 4, !tbaa !16
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %32) #18
  %34 = load i32, i32* %33, align 4, !tbaa !16
  %35 = and i32 %34, 32
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %39, label %37

37:                                               ; preds = %30
  %38 = or i64 %23, 64
  store i64 %38, i64* %5, align 8, !tbaa !64
  br label %39

39:                                               ; preds = %37, %30
  %40 = phi i64 [ %38, %37 ], [ %23, %30 ]
  %41 = and i32 %34, 268500992
  %42 = icmp eq i32 %41, 268500992
  br i1 %42, label %43, label %70

43:                                               ; preds = %39
  %44 = and i32 %34, 469827584
  %45 = icmp eq i32 %44, 469827584
  %46 = select i1 %45, i64 1649267441664, i64 549755813888
  %47 = or i64 %40, %46
  %48 = and i32 %34, -805109760
  %49 = icmp eq i32 %48, -805109760
  %50 = or i64 %47, 2199023255552
  %51 = select i1 %49, i64 %50, i64 %47
  store i64 %51, i64* %5, align 8, !tbaa !64
  %52 = and i32 %34, -803012608
  %53 = icmp eq i32 %52, -803012608
  br i1 %53, label %54, label %70

54:                                               ; preds = %43
  %55 = or i64 %51, 4398046511104
  store i64 %55, i64* %5, align 8, !tbaa !64
  %56 = bitcast [4 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %56) #18
  %57 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  store i32 7, i32* %57, align 4, !tbaa !16
  %58 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 1
  store i32 1, i32* %58, align 4, !tbaa !16
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, dword ptr $$4 $0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %57) #18
  %59 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 2
  %60 = load i32, i32* %59, align 4, !tbaa !16
  %61 = and i32 %60, 2048
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %69, label %63

63:                                               ; preds = %54
  %64 = load i32, i32* %57, align 4, !tbaa !16
  %65 = and i32 %64, 32
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %69, label %67

67:                                               ; preds = %63
  %68 = or i64 %51, 13194139533312
  store i64 %68, i64* %5, align 8, !tbaa !64
  br label %69

69:                                               ; preds = %67, %63, %54
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %56) #18
  br label %70

70:                                               ; preds = %69, %43, %39
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %31) #18
  br label %71

71:                                               ; preds = %70, %27
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #18
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_use_jit_module() local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind willreturn mustprogress
define weak void @halide_release_jit_module() local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nofree norecurse nounwind
define i32 @matmul_simple(%struct.halide_buffer_t* noalias nocapture readonly %A.buffer, %struct.halide_buffer_t* noalias nocapture readonly %B.buffer, %struct.halide_buffer_t* noalias nocapture readonly %res.buffer) local_unnamed_addr #10 {
entry:
  %0 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i64 0, i32 2
  %1 = bitcast i8** %0 to i32**
  %2 = load i32*, i32** %1, align 8, !tbaa !73
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %A.buffer, i64 0, i32 6
  %4 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %3, align 8, !tbaa !77
  %5 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %4, i64 0, i32 0
  %6 = load i32, i32* %5, align 4, !tbaa !82
  %7 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %4, i64 0, i32 1
  %8 = load i32, i32* %7, align 4, !tbaa !79
  %9 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %4, i64 1, i32 0
  %10 = load i32, i32* %9, align 4, !tbaa !82
  %11 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %4, i64 1, i32 2
  %12 = load i32, i32* %11, align 4, !tbaa !83
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i64 0, i32 2
  %14 = bitcast i8** %13 to i32**
  %15 = load i32*, i32** %14, align 8, !tbaa !73
  %16 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %B.buffer, i64 0, i32 6
  %17 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %16, align 8, !tbaa !77
  %18 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %17, i64 0, i32 0
  %19 = load i32, i32* %18, align 4, !tbaa !82
  %20 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %17, i64 1, i32 0
  %21 = load i32, i32* %20, align 4, !tbaa !82
  %22 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %17, i64 1, i32 2
  %23 = load i32, i32* %22, align 4, !tbaa !83
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %res.buffer, i64 0, i32 2
  %25 = load i8*, i8** %24, align 8, !tbaa !73
  %26 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %res.buffer, i64 0, i32 6
  %27 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %26, align 8, !tbaa !77
  %28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %27, i64 0, i32 0
  %29 = load i32, i32* %28, align 4, !tbaa !82
  %30 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %27, i64 0, i32 1
  %31 = load i32, i32* %30, align 4, !tbaa !79
  %32 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %27, i64 1, i32 0
  %33 = load i32, i32* %32, align 4, !tbaa !82
  %34 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %27, i64 1, i32 1
  %35 = load i32, i32* %34, align 4, !tbaa !79
  %36 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %27, i64 1, i32 2
  %37 = load i32, i32* %36, align 4, !tbaa !83
  %38 = icmp sgt i32 %35, 0
  br i1 %38, label %"for res.s0.y.rebased.preheader", label %destructor_block, !prof !242

"for res.s0.y.rebased.preheader":                 ; preds = %entry
  %39 = icmp sgt i32 %31, 0
  br i1 %39, label %"for res.s0.y.rebased.us.preheader", label %destructor_block, !prof !242

"for res.s0.y.rebased.us.preheader":              ; preds = %"for res.s0.y.rebased.preheader"
  %40 = zext i32 %31 to i64
  %41 = shl nuw nsw i64 %40, 2
  %42 = zext i32 %35 to i64
  %43 = add nsw i64 %42, -1
  %xtraiter = and i64 %42, 7
  %44 = icmp ult i64 %43, 7
  br i1 %44, label %"for res.s1.y.rebased.preheader.unr-lcssa", label %"for res.s0.y.rebased.us.preheader.new"

"for res.s0.y.rebased.us.preheader.new":          ; preds = %"for res.s0.y.rebased.us.preheader"
  %unroll_iter = and i64 %42, 4294967288
  br label %"for res.s0.y.rebased.us"

"for res.s0.y.rebased.us":                        ; preds = %"for res.s0.y.rebased.us", %"for res.s0.y.rebased.us.preheader.new"
  %indvars.iv = phi i64 [ 0, %"for res.s0.y.rebased.us.preheader.new" ], [ %indvars.iv.next.7, %"for res.s0.y.rebased.us" ]
  %niter = phi i64 [ %unroll_iter, %"for res.s0.y.rebased.us.preheader.new" ], [ %niter.nsub.7, %"for res.s0.y.rebased.us" ]
  %45 = trunc i64 %indvars.iv to i32
  %46 = mul i32 %37, %45
  %47 = sext i32 %46 to i64
  %48 = shl nsw i64 %47, 2
  %scevgep = getelementptr i8, i8* %25, i64 %48
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep, i8 0, i64 %41, i1 false)
  %49 = trunc i64 %indvars.iv to i32
  %50 = or i32 %49, 1
  %51 = mul i32 %37, %50
  %52 = sext i32 %51 to i64
  %53 = shl nsw i64 %52, 2
  %scevgep.1 = getelementptr i8, i8* %25, i64 %53
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.1, i8 0, i64 %41, i1 false)
  %54 = trunc i64 %indvars.iv to i32
  %55 = or i32 %54, 2
  %56 = mul i32 %37, %55
  %57 = sext i32 %56 to i64
  %58 = shl nsw i64 %57, 2
  %scevgep.2 = getelementptr i8, i8* %25, i64 %58
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.2, i8 0, i64 %41, i1 false)
  %59 = trunc i64 %indvars.iv to i32
  %60 = or i32 %59, 3
  %61 = mul i32 %37, %60
  %62 = sext i32 %61 to i64
  %63 = shl nsw i64 %62, 2
  %scevgep.3 = getelementptr i8, i8* %25, i64 %63
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.3, i8 0, i64 %41, i1 false)
  %64 = trunc i64 %indvars.iv to i32
  %65 = or i32 %64, 4
  %66 = mul i32 %37, %65
  %67 = sext i32 %66 to i64
  %68 = shl nsw i64 %67, 2
  %scevgep.4 = getelementptr i8, i8* %25, i64 %68
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.4, i8 0, i64 %41, i1 false)
  %69 = trunc i64 %indvars.iv to i32
  %70 = or i32 %69, 5
  %71 = mul i32 %37, %70
  %72 = sext i32 %71 to i64
  %73 = shl nsw i64 %72, 2
  %scevgep.5 = getelementptr i8, i8* %25, i64 %73
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.5, i8 0, i64 %41, i1 false)
  %74 = trunc i64 %indvars.iv to i32
  %75 = or i32 %74, 6
  %76 = mul i32 %37, %75
  %77 = sext i32 %76 to i64
  %78 = shl nsw i64 %77, 2
  %scevgep.6 = getelementptr i8, i8* %25, i64 %78
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.6, i8 0, i64 %41, i1 false)
  %79 = trunc i64 %indvars.iv to i32
  %80 = or i32 %79, 7
  %81 = mul i32 %37, %80
  %82 = sext i32 %81 to i64
  %83 = shl nsw i64 %82, 2
  %scevgep.7 = getelementptr i8, i8* %25, i64 %83
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.7, i8 0, i64 %41, i1 false)
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %niter.nsub.7 = add i64 %niter, -8
  %niter.ncmp.7 = icmp eq i64 %niter.nsub.7, 0
  br i1 %niter.ncmp.7, label %"for res.s1.y.rebased.preheader.unr-lcssa", label %"for res.s0.y.rebased.us"

"for res.s1.y.rebased.preheader.unr-lcssa":       ; preds = %"for res.s0.y.rebased.us", %"for res.s0.y.rebased.us.preheader"
  %indvars.iv.unr = phi i64 [ 0, %"for res.s0.y.rebased.us.preheader" ], [ %indvars.iv.next.7, %"for res.s0.y.rebased.us" ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %"for res.s1.y.rebased.preheader", label %"for res.s0.y.rebased.us.epil"

"for res.s0.y.rebased.us.epil":                   ; preds = %"for res.s1.y.rebased.preheader.unr-lcssa", %"for res.s0.y.rebased.us.epil"
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %"for res.s0.y.rebased.us.epil" ], [ %indvars.iv.unr, %"for res.s1.y.rebased.preheader.unr-lcssa" ]
  %epil.iter = phi i64 [ %epil.iter.sub, %"for res.s0.y.rebased.us.epil" ], [ %xtraiter, %"for res.s1.y.rebased.preheader.unr-lcssa" ]
  %84 = trunc i64 %indvars.iv.epil to i32
  %85 = mul i32 %37, %84
  %86 = sext i32 %85 to i64
  %87 = shl nsw i64 %86, 2
  %scevgep.epil = getelementptr i8, i8* %25, i64 %87
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep.epil, i8 0, i64 %41, i1 false)
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %"for res.s1.y.rebased.preheader", label %"for res.s0.y.rebased.us.epil", !llvm.loop !243

"for res.s1.y.rebased.preheader":                 ; preds = %"for res.s0.y.rebased.us.epil", %"for res.s1.y.rebased.preheader.unr-lcssa"
  %88 = mul nsw i32 %23, %21
  %t17 = sub i32 %33, %10
  %89 = add i32 %88, %19
  %t14 = sub i32 %29, %89
  %90 = bitcast i8* %25 to i32*
  %91 = sext i32 %23 to i64
  %92 = icmp sgt i32 %8, 0
  %or.cond = and i1 %39, %92
  br i1 %or.cond, label %"for res.s1.y.rebased.us.us.preheader", label %destructor_block, !prof !244

"for res.s1.y.rebased.us.us.preheader":           ; preds = %"for res.s1.y.rebased.preheader"
  %93 = zext i32 %8 to i64
  %94 = zext i32 %31 to i64
  %95 = zext i32 %35 to i64
  %96 = and i64 %93, 4294967264
  %97 = add nsw i64 %96, -32
  %98 = lshr exact i64 %97, 5
  %99 = add nuw nsw i64 %98, 1
  %min.iters.check = icmp ugt i32 %8, 31
  %ident.check.not = icmp eq i32 %23, 1
  %or.cond43 = and i1 %min.iters.check, %ident.check.not
  %n.vec = and i64 %93, 4294967264
  %xtraiter49 = and i64 %99, 1
  %100 = icmp eq i64 %97, 0
  %unroll_iter51 = and i64 %99, 1152921504606846974
  %lcmp.mod50.not = icmp eq i64 %xtraiter49, 0
  %cmp.n = icmp eq i64 %n.vec, %93
  %xtraiter53 = and i64 %93, 3
  %lcmp.mod54.not = icmp eq i64 %xtraiter53, 0
  br label %"for res.s1.y.rebased.us.us"

"for res.s1.y.rebased.us.us":                     ; preds = %"for res.s1.y.rebased.us.us.preheader", %"end for res.s1.x.rebased.loopexit.split.us.us.us"
  %indvars.iv27 = phi i64 [ 0, %"for res.s1.y.rebased.us.us.preheader" ], [ %indvars.iv.next28, %"end for res.s1.x.rebased.loopexit.split.us.us.us" ]
  %101 = trunc i64 %indvars.iv27 to i32
  %reass.add.us.us = add i32 %t17, %101
  %reass.mul.us.us = mul i32 %reass.add.us.us, %12
  %t16.us.us = sub i32 %reass.mul.us.us, %6
  %t15.us.us = mul i32 %37, %101
  %102 = sext i32 %t16.us.us to i64
  %103 = sext i32 %t15.us.us to i64
  br label %"for res.s1.x.rebased.us.us.us"

"for res.s1.x.rebased.us.us.us":                  ; preds = %"end for res.s1.r8$x.loopexit.us.us.us", %"for res.s1.y.rebased.us.us"
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %"end for res.s1.r8$x.loopexit.us.us.us" ], [ 0, %"for res.s1.y.rebased.us.us" ]
  %104 = add nsw i64 %indvars.iv24, %103
  %105 = trunc i64 %indvars.iv24 to i32
  %t19.us.us.us = add i32 %t14, %105
  %106 = getelementptr inbounds i32, i32* %90, i64 %104
  %107 = sext i32 %t19.us.us.us to i64
  %.promoted.us.us.us = load i32, i32* %106, align 4, !tbaa !245
  br i1 %or.cond43, label %vector.ph, label %"for res.s1.r8$x.us.us.us.preheader"

vector.ph:                                        ; preds = %"for res.s1.x.rebased.us.us.us"
  %108 = insertelement <8 x i32> <i32 poison, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 %.promoted.us.us.us, i32 0
  br i1 %100, label %middle.block.unr-lcssa, label %vector.body

vector.body:                                      ; preds = %vector.ph, %vector.body
  %index = phi i64 [ %index.next.1, %vector.body ], [ 0, %vector.ph ]
  %vec.phi = phi <8 x i32> [ %159, %vector.body ], [ %108, %vector.ph ]
  %vec.phi31 = phi <8 x i32> [ %160, %vector.body ], [ zeroinitializer, %vector.ph ]
  %vec.phi32 = phi <8 x i32> [ %161, %vector.body ], [ zeroinitializer, %vector.ph ]
  %vec.phi33 = phi <8 x i32> [ %162, %vector.body ], [ zeroinitializer, %vector.ph ]
  %niter52 = phi i64 [ %niter52.nsub.1, %vector.body ], [ %unroll_iter51, %vector.ph ]
  %109 = add nsw i64 %index, %102
  %110 = getelementptr inbounds i32, i32* %2, i64 %109
  %111 = bitcast i32* %110 to <8 x i32>*
  %wide.load = load <8 x i32>, <8 x i32>* %111, align 4, !tbaa !248
  %112 = getelementptr inbounds i32, i32* %110, i64 8
  %113 = bitcast i32* %112 to <8 x i32>*
  %wide.load34 = load <8 x i32>, <8 x i32>* %113, align 4, !tbaa !248
  %114 = getelementptr inbounds i32, i32* %110, i64 16
  %115 = bitcast i32* %114 to <8 x i32>*
  %wide.load35 = load <8 x i32>, <8 x i32>* %115, align 4, !tbaa !248
  %116 = getelementptr inbounds i32, i32* %110, i64 24
  %117 = bitcast i32* %116 to <8 x i32>*
  %wide.load36 = load <8 x i32>, <8 x i32>* %117, align 4, !tbaa !248
  %118 = mul nsw i64 %index, %91
  %119 = add nsw i64 %118, %107
  %120 = getelementptr inbounds i32, i32* %15, i64 %119
  %121 = bitcast i32* %120 to <8 x i32>*
  %wide.load37 = load <8 x i32>, <8 x i32>* %121, align 4, !tbaa !250
  %122 = getelementptr inbounds i32, i32* %120, i64 8
  %123 = bitcast i32* %122 to <8 x i32>*
  %wide.load38 = load <8 x i32>, <8 x i32>* %123, align 4, !tbaa !250
  %124 = getelementptr inbounds i32, i32* %120, i64 16
  %125 = bitcast i32* %124 to <8 x i32>*
  %wide.load39 = load <8 x i32>, <8 x i32>* %125, align 4, !tbaa !250
  %126 = getelementptr inbounds i32, i32* %120, i64 24
  %127 = bitcast i32* %126 to <8 x i32>*
  %wide.load40 = load <8 x i32>, <8 x i32>* %127, align 4, !tbaa !250
  %128 = mul nsw <8 x i32> %wide.load37, %wide.load
  %129 = mul nsw <8 x i32> %wide.load38, %wide.load34
  %130 = mul nsw <8 x i32> %wide.load39, %wide.load35
  %131 = mul nsw <8 x i32> %wide.load40, %wide.load36
  %132 = add <8 x i32> %128, %vec.phi
  %133 = add <8 x i32> %129, %vec.phi31
  %134 = add <8 x i32> %130, %vec.phi32
  %135 = add <8 x i32> %131, %vec.phi33
  %index.next = or i64 %index, 32
  %136 = add nsw i64 %index.next, %102
  %137 = getelementptr inbounds i32, i32* %2, i64 %136
  %138 = bitcast i32* %137 to <8 x i32>*
  %wide.load.1 = load <8 x i32>, <8 x i32>* %138, align 4, !tbaa !248
  %139 = getelementptr inbounds i32, i32* %137, i64 8
  %140 = bitcast i32* %139 to <8 x i32>*
  %wide.load34.1 = load <8 x i32>, <8 x i32>* %140, align 4, !tbaa !248
  %141 = getelementptr inbounds i32, i32* %137, i64 16
  %142 = bitcast i32* %141 to <8 x i32>*
  %wide.load35.1 = load <8 x i32>, <8 x i32>* %142, align 4, !tbaa !248
  %143 = getelementptr inbounds i32, i32* %137, i64 24
  %144 = bitcast i32* %143 to <8 x i32>*
  %wide.load36.1 = load <8 x i32>, <8 x i32>* %144, align 4, !tbaa !248
  %145 = mul nsw i64 %index.next, %91
  %146 = add nsw i64 %145, %107
  %147 = getelementptr inbounds i32, i32* %15, i64 %146
  %148 = bitcast i32* %147 to <8 x i32>*
  %wide.load37.1 = load <8 x i32>, <8 x i32>* %148, align 4, !tbaa !250
  %149 = getelementptr inbounds i32, i32* %147, i64 8
  %150 = bitcast i32* %149 to <8 x i32>*
  %wide.load38.1 = load <8 x i32>, <8 x i32>* %150, align 4, !tbaa !250
  %151 = getelementptr inbounds i32, i32* %147, i64 16
  %152 = bitcast i32* %151 to <8 x i32>*
  %wide.load39.1 = load <8 x i32>, <8 x i32>* %152, align 4, !tbaa !250
  %153 = getelementptr inbounds i32, i32* %147, i64 24
  %154 = bitcast i32* %153 to <8 x i32>*
  %wide.load40.1 = load <8 x i32>, <8 x i32>* %154, align 4, !tbaa !250
  %155 = mul nsw <8 x i32> %wide.load37.1, %wide.load.1
  %156 = mul nsw <8 x i32> %wide.load38.1, %wide.load34.1
  %157 = mul nsw <8 x i32> %wide.load39.1, %wide.load35.1
  %158 = mul nsw <8 x i32> %wide.load40.1, %wide.load36.1
  %159 = add <8 x i32> %155, %132
  %160 = add <8 x i32> %156, %133
  %161 = add <8 x i32> %157, %134
  %162 = add <8 x i32> %158, %135
  %index.next.1 = add i64 %index, 64
  %niter52.nsub.1 = add i64 %niter52, -2
  %niter52.ncmp.1 = icmp eq i64 %niter52.nsub.1, 0
  br i1 %niter52.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !252

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %.lcssa47.ph = phi <8 x i32> [ undef, %vector.ph ], [ %159, %vector.body ]
  %.lcssa46.ph = phi <8 x i32> [ undef, %vector.ph ], [ %160, %vector.body ]
  %.lcssa45.ph = phi <8 x i32> [ undef, %vector.ph ], [ %161, %vector.body ]
  %.lcssa44.ph = phi <8 x i32> [ undef, %vector.ph ], [ %162, %vector.body ]
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %vec.phi.unr = phi <8 x i32> [ %108, %vector.ph ], [ %159, %vector.body ]
  %vec.phi31.unr = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %160, %vector.body ]
  %vec.phi32.unr = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %161, %vector.body ]
  %vec.phi33.unr = phi <8 x i32> [ zeroinitializer, %vector.ph ], [ %162, %vector.body ]
  br i1 %lcmp.mod50.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %163 = add nsw i64 %index.unr, %102
  %164 = getelementptr inbounds i32, i32* %2, i64 %163
  %165 = mul nsw i64 %index.unr, %91
  %166 = add nsw i64 %165, %107
  %167 = getelementptr inbounds i32, i32* %15, i64 %166
  %168 = getelementptr inbounds i32, i32* %167, i64 24
  %169 = bitcast i32* %168 to <8 x i32>*
  %wide.load40.epil = load <8 x i32>, <8 x i32>* %169, align 4, !tbaa !250
  %170 = getelementptr inbounds i32, i32* %164, i64 24
  %171 = bitcast i32* %170 to <8 x i32>*
  %wide.load36.epil = load <8 x i32>, <8 x i32>* %171, align 4, !tbaa !248
  %172 = mul nsw <8 x i32> %wide.load40.epil, %wide.load36.epil
  %173 = add <8 x i32> %172, %vec.phi33.unr
  %174 = getelementptr inbounds i32, i32* %167, i64 16
  %175 = bitcast i32* %174 to <8 x i32>*
  %wide.load39.epil = load <8 x i32>, <8 x i32>* %175, align 4, !tbaa !250
  %176 = getelementptr inbounds i32, i32* %164, i64 16
  %177 = bitcast i32* %176 to <8 x i32>*
  %wide.load35.epil = load <8 x i32>, <8 x i32>* %177, align 4, !tbaa !248
  %178 = mul nsw <8 x i32> %wide.load39.epil, %wide.load35.epil
  %179 = add <8 x i32> %178, %vec.phi32.unr
  %180 = getelementptr inbounds i32, i32* %167, i64 8
  %181 = bitcast i32* %180 to <8 x i32>*
  %wide.load38.epil = load <8 x i32>, <8 x i32>* %181, align 4, !tbaa !250
  %182 = getelementptr inbounds i32, i32* %164, i64 8
  %183 = bitcast i32* %182 to <8 x i32>*
  %wide.load34.epil = load <8 x i32>, <8 x i32>* %183, align 4, !tbaa !248
  %184 = mul nsw <8 x i32> %wide.load38.epil, %wide.load34.epil
  %185 = add <8 x i32> %184, %vec.phi31.unr
  %186 = bitcast i32* %167 to <8 x i32>*
  %wide.load37.epil = load <8 x i32>, <8 x i32>* %186, align 4, !tbaa !250
  %187 = bitcast i32* %164 to <8 x i32>*
  %wide.load.epil = load <8 x i32>, <8 x i32>* %187, align 4, !tbaa !248
  %188 = mul nsw <8 x i32> %wide.load37.epil, %wide.load.epil
  %189 = add <8 x i32> %188, %vec.phi.unr
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %.lcssa47 = phi <8 x i32> [ %.lcssa47.ph, %middle.block.unr-lcssa ], [ %189, %vector.body.epil ]
  %.lcssa46 = phi <8 x i32> [ %.lcssa46.ph, %middle.block.unr-lcssa ], [ %185, %vector.body.epil ]
  %.lcssa45 = phi <8 x i32> [ %.lcssa45.ph, %middle.block.unr-lcssa ], [ %179, %vector.body.epil ]
  %.lcssa44 = phi <8 x i32> [ %.lcssa44.ph, %middle.block.unr-lcssa ], [ %173, %vector.body.epil ]
  %bin.rdx = add <8 x i32> %.lcssa46, %.lcssa47
  %bin.rdx41 = add <8 x i32> %.lcssa45, %bin.rdx
  %bin.rdx42 = add <8 x i32> %.lcssa44, %bin.rdx41
  %190 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %bin.rdx42)
  br i1 %cmp.n, label %"end for res.s1.r8$x.loopexit.us.us.us", label %"for res.s1.r8$x.us.us.us.preheader"

"for res.s1.r8$x.us.us.us.preheader":             ; preds = %"for res.s1.x.rebased.us.us.us", %middle.block
  %indvars.iv22.ph = phi i64 [ 0, %"for res.s1.x.rebased.us.us.us" ], [ %n.vec, %middle.block ]
  %.ph = phi i32 [ %.promoted.us.us.us, %"for res.s1.x.rebased.us.us.us" ], [ %190, %middle.block ]
  %191 = xor i64 %indvars.iv22.ph, -1
  %192 = add nsw i64 %191, %93
  br i1 %lcmp.mod54.not, label %"for res.s1.r8$x.us.us.us.prol.loopexit", label %"for res.s1.r8$x.us.us.us.prol"

"for res.s1.r8$x.us.us.us.prol":                  ; preds = %"for res.s1.r8$x.us.us.us.preheader", %"for res.s1.r8$x.us.us.us.prol"
  %indvars.iv22.prol = phi i64 [ %indvars.iv.next23.prol, %"for res.s1.r8$x.us.us.us.prol" ], [ %indvars.iv22.ph, %"for res.s1.r8$x.us.us.us.preheader" ]
  %193 = phi i32 [ %202, %"for res.s1.r8$x.us.us.us.prol" ], [ %.ph, %"for res.s1.r8$x.us.us.us.preheader" ]
  %prol.iter = phi i64 [ %prol.iter.sub, %"for res.s1.r8$x.us.us.us.prol" ], [ %xtraiter53, %"for res.s1.r8$x.us.us.us.preheader" ]
  %194 = add nsw i64 %indvars.iv22.prol, %102
  %195 = getelementptr inbounds i32, i32* %2, i64 %194
  %196 = load i32, i32* %195, align 4, !tbaa !248
  %197 = mul nsw i64 %indvars.iv22.prol, %91
  %198 = add nsw i64 %197, %107
  %199 = getelementptr inbounds i32, i32* %15, i64 %198
  %200 = load i32, i32* %199, align 4, !tbaa !250
  %201 = mul nsw i32 %200, %196
  %202 = add nsw i32 %201, %193
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp.not, label %"for res.s1.r8$x.us.us.us.prol.loopexit", label %"for res.s1.r8$x.us.us.us.prol", !llvm.loop !253

"for res.s1.r8$x.us.us.us.prol.loopexit":         ; preds = %"for res.s1.r8$x.us.us.us.prol", %"for res.s1.r8$x.us.us.us.preheader"
  %.lcssa48.unr = phi i32 [ undef, %"for res.s1.r8$x.us.us.us.preheader" ], [ %202, %"for res.s1.r8$x.us.us.us.prol" ]
  %indvars.iv22.unr = phi i64 [ %indvars.iv22.ph, %"for res.s1.r8$x.us.us.us.preheader" ], [ %indvars.iv.next23.prol, %"for res.s1.r8$x.us.us.us.prol" ]
  %.unr = phi i32 [ %.ph, %"for res.s1.r8$x.us.us.us.preheader" ], [ %202, %"for res.s1.r8$x.us.us.us.prol" ]
  %203 = icmp ult i64 %192, 3
  br i1 %203, label %"end for res.s1.r8$x.loopexit.us.us.us", label %"for res.s1.r8$x.us.us.us"

"for res.s1.r8$x.us.us.us":                       ; preds = %"for res.s1.r8$x.us.us.us.prol.loopexit", %"for res.s1.r8$x.us.us.us"
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.3, %"for res.s1.r8$x.us.us.us" ], [ %indvars.iv22.unr, %"for res.s1.r8$x.us.us.us.prol.loopexit" ]
  %204 = phi i32 [ %240, %"for res.s1.r8$x.us.us.us" ], [ %.unr, %"for res.s1.r8$x.us.us.us.prol.loopexit" ]
  %205 = add nsw i64 %indvars.iv22, %102
  %206 = getelementptr inbounds i32, i32* %2, i64 %205
  %207 = load i32, i32* %206, align 4, !tbaa !248
  %208 = mul nsw i64 %indvars.iv22, %91
  %209 = add nsw i64 %208, %107
  %210 = getelementptr inbounds i32, i32* %15, i64 %209
  %211 = load i32, i32* %210, align 4, !tbaa !250
  %212 = mul nsw i32 %211, %207
  %213 = add nsw i32 %212, %204
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %214 = add nsw i64 %indvars.iv.next23, %102
  %215 = getelementptr inbounds i32, i32* %2, i64 %214
  %216 = load i32, i32* %215, align 4, !tbaa !248
  %217 = mul nsw i64 %indvars.iv.next23, %91
  %218 = add nsw i64 %217, %107
  %219 = getelementptr inbounds i32, i32* %15, i64 %218
  %220 = load i32, i32* %219, align 4, !tbaa !250
  %221 = mul nsw i32 %220, %216
  %222 = add nsw i32 %221, %213
  %indvars.iv.next23.1 = add nuw nsw i64 %indvars.iv22, 2
  %223 = add nsw i64 %indvars.iv.next23.1, %102
  %224 = getelementptr inbounds i32, i32* %2, i64 %223
  %225 = load i32, i32* %224, align 4, !tbaa !248
  %226 = mul nsw i64 %indvars.iv.next23.1, %91
  %227 = add nsw i64 %226, %107
  %228 = getelementptr inbounds i32, i32* %15, i64 %227
  %229 = load i32, i32* %228, align 4, !tbaa !250
  %230 = mul nsw i32 %229, %225
  %231 = add nsw i32 %230, %222
  %indvars.iv.next23.2 = add nuw nsw i64 %indvars.iv22, 3
  %232 = add nsw i64 %indvars.iv.next23.2, %102
  %233 = getelementptr inbounds i32, i32* %2, i64 %232
  %234 = load i32, i32* %233, align 4, !tbaa !248
  %235 = mul nsw i64 %indvars.iv.next23.2, %91
  %236 = add nsw i64 %235, %107
  %237 = getelementptr inbounds i32, i32* %15, i64 %236
  %238 = load i32, i32* %237, align 4, !tbaa !250
  %239 = mul nsw i32 %238, %234
  %240 = add nsw i32 %239, %231
  %indvars.iv.next23.3 = add nuw nsw i64 %indvars.iv22, 4
  %.not4.us.us.us.3 = icmp eq i64 %indvars.iv.next23.3, %93
  br i1 %.not4.us.us.us.3, label %"end for res.s1.r8$x.loopexit.us.us.us", label %"for res.s1.r8$x.us.us.us", !llvm.loop !254

"end for res.s1.r8$x.loopexit.us.us.us":          ; preds = %"for res.s1.r8$x.us.us.us.prol.loopexit", %"for res.s1.r8$x.us.us.us", %middle.block
  %.lcssa = phi i32 [ %190, %middle.block ], [ %.lcssa48.unr, %"for res.s1.r8$x.us.us.us.prol.loopexit" ], [ %240, %"for res.s1.r8$x.us.us.us" ]
  store i32 %.lcssa, i32* %106, align 4, !tbaa !245
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %.not3.us.us.us = icmp eq i64 %indvars.iv.next25, %94
  br i1 %.not3.us.us.us, label %"end for res.s1.x.rebased.loopexit.split.us.us.us", label %"for res.s1.x.rebased.us.us.us"

"end for res.s1.x.rebased.loopexit.split.us.us.us": ; preds = %"end for res.s1.r8$x.loopexit.us.us.us"
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %.not.us.us = icmp eq i64 %indvars.iv.next28, %95
  br i1 %.not.us.us, label %destructor_block, label %"for res.s1.y.rebased.us.us"

destructor_block:                                 ; preds = %"end for res.s1.x.rebased.loopexit.split.us.us.us", %"for res.s0.y.rebased.preheader", %"for res.s1.y.rebased.preheader", %entry
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind
define i32 @matmul_simple_argv(i8** nocapture readonly %0) local_unnamed_addr #11 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 8
  %3 = getelementptr i8*, i8** %0, i64 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 8
  %6 = getelementptr i8*, i8** %0, i64 2
  %7 = bitcast i8** %6 to %struct.halide_buffer_t**
  %8 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %7, align 8
  %9 = tail call i32 @matmul_simple(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5, %struct.halide_buffer_t* %8) #19
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone willreturn
define nonnull %struct.halide_filter_metadata_t* @matmul_simple_metadata() local_unnamed_addr #12 {
entry:
  ret %struct.halide_filter_metadata_t* @matmul_simple_metadata_storage
}

; Function Attrs: nofree nosync nounwind willreturn writeonly
declare void @llvm.masked.scatter.v8i32.v8p0i32(<8 x i32>, <8 x i32*>, i32 immarg, <8 x i1>) #13

; Function Attrs: nofree nosync nounwind readonly willreturn
declare <4 x i32> @llvm.masked.gather.v4i32.v4p0i32(<4 x i32*>, i32 immarg, <4 x i1>, <4 x i32>) #14

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i64 @llvm.vector.reduce.add.v4i64(<4 x i64>) #15

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #15

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
attributes #10 = { nofree norecurse nounwind "reciprocal-estimates"="none" }
attributes #11 = { nofree norecurse nounwind }
attributes #12 = { norecurse nounwind readnone willreturn }
attributes #13 = { nofree nosync nounwind willreturn writeonly }
attributes #14 = { nofree nosync nounwind readonly willreturn }
attributes #15 = { nofree nosync nounwind readnone willreturn }
attributes #16 = { nobuiltin nounwind "no-builtins" }
attributes #17 = { nobuiltin "no-builtins" }
attributes #18 = { nounwind }
attributes #19 = { noinline }

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
!9 = !{!"clang version 12.0.0"}
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
!48 = !{!49, !13, i64 24}
!49 = !{!"_ZTSN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy4096EEE", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !19, i64 32, !14, i64 33}
!50 = !{!49, !19, i64 32}
!51 = !{!49, !13, i64 8}
!52 = !{!49, !13, i64 16}
!53 = !{!23, !14, i64 33}
!54 = distinct !{!54, !11}
!55 = !{!23, !17, i64 44}
!56 = distinct !{!56, !11, !57}
!57 = !{!"llvm.loop.peeled.count", i32 1}
!58 = !{!23, !25, i64 32}
!59 = !{!26, !26, i64 0}
!60 = !{!61, !61, i64 0}
!61 = !{!"float", !14, i64 0}
!62 = !{!63, !63, i64 0}
!63 = !{!"double", !14, i64 0}
!64 = !{!65, !65, i64 0}
!65 = !{!"long long", !14, i64 0}
!66 = distinct !{!66, !11, !57}
!67 = !{!49, !13, i64 0}
!68 = distinct !{!68, !11}
!69 = !{!23, !17, i64 40}
!70 = distinct !{!70, !11}
!71 = distinct !{!71, !11}
!72 = distinct !{!72, !11}
!73 = !{!74, !13, i64 16}
!74 = !{!"_ZTS15halide_buffer_t", !65, i64 0, !13, i64 8, !13, i64 16, !65, i64 24, !24, i64 32, !17, i64 36, !13, i64 40, !13, i64 48}
!75 = !{!74, !65, i64 0}
!76 = !{!74, !17, i64 36}
!77 = !{!74, !13, i64 40}
!78 = !{i64 0, i64 4, !16, i64 4, i64 4, !16, i64 8, i64 4, !16, i64 12, i64 4, !16}
!79 = !{!80, !17, i64 4}
!80 = !{!"_ZTS18halide_dimension_t", !17, i64 0, !17, i64 4, !17, i64 8, !17, i64 12}
!81 = distinct !{!81, !11}
!82 = !{!80, !17, i64 0}
!83 = !{!80, !17, i64 8}
!84 = distinct !{!84, !11, !85}
!85 = !{!"llvm.loop.isvectorized", i32 1}
!86 = distinct !{!86, !87}
!87 = !{!"llvm.loop.unroll.disable"}
!88 = distinct !{!88, !11, !89, !85}
!89 = !{!"llvm.loop.unroll.runtime.disable"}
!90 = !{!91, !26, i64 0}
!91 = !{!"_ZTSN6Halide7Runtime8Internal18halide_tiff_headerE", !26, i64 0, !26, i64 2, !17, i64 4, !26, i64 8, !14, i64 10, !17, i64 190, !14, i64 194, !14, i64 202}
!92 = !{!91, !26, i64 2}
!93 = !{!91, !17, i64 4}
!94 = !{!91, !26, i64 8}
!95 = !{!96, !26, i64 0}
!96 = !{!"_ZTSN6Halide7Runtime8Internal8tiff_tagE", !26, i64 0, !26, i64 2, !17, i64 4, !14, i64 8}
!97 = !{!96, !26, i64 2}
!98 = !{!96, !17, i64 4}
!99 = distinct !{!99, !11}
!100 = distinct !{!100, !11}
!101 = distinct !{!101, !11}
!102 = distinct !{!102, !11}
!103 = distinct !{!103, !11}
!104 = !{!105}
!105 = distinct !{!105, !106}
!106 = distinct !{!106, !"LVerDomain"}
!107 = !{!108}
!108 = distinct !{!108, !106}
!109 = distinct !{!109, !11, !85}
!110 = distinct !{!110, !87}
!111 = distinct !{!111, !87}
!112 = distinct !{!112, !11, !85}
!113 = distinct !{!113, !87}
!114 = distinct !{!114, !11, !85}
!115 = distinct !{!115, !11, !85}
!116 = distinct !{!116, !11, !89, !85}
!117 = distinct !{!117, !11, !85}
!118 = distinct !{!118, !11, !89, !85}
!119 = distinct !{!119, !11, !85}
!120 = distinct !{!120, !11, !89, !85}
!121 = distinct !{!121, !11}
!122 = distinct !{!122, !11, !85}
!123 = distinct !{!123, !11, !89, !85}
!124 = distinct !{!124, !11}
!125 = distinct !{!125, !11}
!126 = distinct !{!126, !11}
!127 = distinct !{!127, !11}
!128 = !{!129, !13, i64 0}
!129 = !{!"_ZTSN6Halide7Runtime8Internal10CacheEntryE", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !130, i64 32, !13, i64 40, !17, i64 48, !17, i64 52, !17, i64 56, !17, i64 60, !13, i64 64, !13, i64 72, !65, i64 80, !19, i64 88}
!130 = !{!"long", !14, i64 0}
!131 = distinct !{!131, !11}
!132 = distinct !{!132, !11}
!133 = !{!129, !17, i64 56}
!134 = !{!129, !13, i64 24}
!135 = !{!129, !13, i64 72}
!136 = distinct !{!136, !11}
!137 = distinct !{!137, !11}
!138 = !{!139, !65, i64 0}
!139 = !{!"_ZTSN6Halide7Runtime8Internal11device_copyE", !65, i64 0, !65, i64 8, !65, i64 16, !14, i64 24, !14, i64 152, !14, i64 280, !65, i64 408}
!140 = !{!139, !65, i64 8}
!141 = !{!139, !65, i64 408}
!142 = distinct !{!142, !11}
!143 = !{!139, !65, i64 16}
!144 = distinct !{!144, !11, !85}
!145 = distinct !{!145, !11, !89, !85}
!146 = distinct !{!146, !11}
!147 = distinct !{!147, !87}
!148 = distinct !{!148, !11}
!149 = distinct !{!149, !11}
!150 = distinct !{!150, !11}
!151 = !{i64 0, i64 8, !64, i64 8, i64 8, !64, i64 16, i64 8, !64, i64 24, i64 128, !38, i64 152, i64 128, !38, i64 280, i64 128, !38, i64 408, i64 8, !64}
!152 = distinct !{!152, !11}
!153 = !{!80, !17, i64 12}
!154 = !{!129, !13, i64 16}
!155 = !{!129, !130, i64 32}
!156 = !{!129, !17, i64 48}
!157 = !{!129, !17, i64 52}
!158 = !{!129, !17, i64 60}
!159 = !{!129, !13, i64 64}
!160 = !{!129, !13, i64 40}
!161 = distinct !{!161, !11}
!162 = distinct !{!162, !11}
!163 = distinct !{!163, !11}
!164 = !{!129, !19, i64 88}
!165 = !{!129, !65, i64 80}
!166 = !{i64 0, i64 8, !64, i64 8, i64 8, !12, i64 16, i64 8, !12, i64 24, i64 8, !64, i64 32, i64 1, !167, i64 33, i64 1, !38, i64 34, i64 2, !59, i64 36, i64 4, !16, i64 40, i64 8, !12, i64 48, i64 8, !12}
!167 = !{!25, !25, i64 0}
!168 = distinct !{!168, !11}
!169 = distinct !{!169, !87}
!170 = distinct !{!170, !11}
!171 = !{!129, !13, i64 8}
!172 = distinct !{!172, !11}
!173 = distinct !{!173, !11, !85}
!174 = distinct !{!174, !11, !89, !85}
!175 = distinct !{!175, !11, !85}
!176 = distinct !{!176, !11, !89, !85}
!177 = distinct !{!177, !11}
!178 = distinct !{!178, !11}
!179 = distinct !{!179, !11}
!180 = distinct !{!180, !11}
!181 = distinct !{!181, !11}
!182 = distinct !{!182, !11, !85}
!183 = distinct !{!183, !11, !89, !85}
!184 = distinct !{!184, !11, !85}
!185 = distinct !{!185, !11, !89, !85}
!186 = distinct !{!186, !11}
!187 = !{!188, !17, i64 8}
!188 = !{!"_ZTSN6Halide7Runtime8Internal16CacheBlockHeaderE", !13, i64 0, !17, i64 8}
!189 = !{!188, !13, i64 0}
!190 = distinct !{!190, !11}
!191 = distinct !{!191, !87}
!192 = distinct !{!192, !11}
!193 = distinct !{!193, !11}
!194 = distinct !{!194, !11}
!195 = distinct !{!195, !11, !85}
!196 = distinct !{!196, !11, !89, !85}
!197 = distinct !{!197, !11, !85}
!198 = distinct !{!198, !11, !89, !85}
!199 = distinct !{!199, !11}
!200 = distinct !{!200, !11}
!201 = distinct !{!201, !11}
!202 = distinct !{!202, !11}
!203 = distinct !{!203, !11}
!204 = distinct !{!204, !11}
!205 = distinct !{!205, !11}
!206 = distinct !{!206, !11}
!207 = distinct !{!207, !11}
!208 = distinct !{!208, !11}
!209 = !{!24, !25, i64 0}
!210 = !{!24, !26, i64 2}
!211 = !{!74, !13, i64 8}
!212 = !{!74, !65, i64 24}
!213 = distinct !{!213, !11}
!214 = !{!215, !13, i64 0}
!215 = !{!"_ZTS29halide_device_allocation_pool", !13, i64 0, !13, i64 8}
!216 = distinct !{!216, !11}
!217 = !{!215, !13, i64 8}
!218 = !{!219, !13, i64 120}
!219 = !{!"_ZTS25halide_device_interface_t", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !13, i64 32, !13, i64 40, !13, i64 48, !13, i64 56, !13, i64 64, !13, i64 72, !13, i64 80, !13, i64 88, !13, i64 96, !13, i64 104, !13, i64 112, !13, i64 120}
!220 = !{!221, !13, i64 48}
!221 = !{!"_ZTS30halide_device_interface_impl_t", !13, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !13, i64 32, !13, i64 40, !13, i64 48, !13, i64 56, !13, i64 64, !13, i64 72, !13, i64 80, !13, i64 88, !13, i64 96, !13, i64 104, !13, i64 112, !13, i64 120}
!222 = !{!221, !13, i64 40}
!223 = !{!221, !13, i64 56}
!224 = !{!221, !13, i64 0}
!225 = !{!221, !13, i64 16}
!226 = !{!221, !13, i64 8}
!227 = !{!221, !13, i64 32}
!228 = !{!221, !13, i64 24}
!229 = !{!221, !13, i64 64}
!230 = !{!221, !13, i64 72}
!231 = distinct !{!231, !11, !85}
!232 = distinct !{!232, !11, !89, !85}
!233 = distinct !{!233, !11, !85}
!234 = distinct !{!234, !11, !89, !85}
!235 = !{!221, !13, i64 112}
!236 = !{!221, !13, i64 120}
!237 = !{!221, !13, i64 80}
!238 = !{!221, !13, i64 88}
!239 = !{!221, !13, i64 96}
!240 = !{!221, !13, i64 104}
!241 = !{i32 22, i32 33}
!242 = !{!"branch_weights", i32 1073741824, i32 0}
!243 = distinct !{!243, !87}
!244 = !{!"branch_weights", i32 -2147483648, i32 0}
!245 = !{!246, !246, i64 0}
!246 = !{!"res", !247, i64 0}
!247 = !{!"Halide buffer"}
!248 = !{!249, !249, i64 0}
!249 = !{!"A", !247, i64 0}
!250 = !{!251, !251, i64 0}
!251 = !{!"B", !247, i64 0}
!252 = distinct !{!252, !85}
!253 = distinct !{!253, !87}
!254 = distinct !{!254, !85}
