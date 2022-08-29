; ModuleID = 'dilate3x3/samples/batch_2_0/14/dilate3x3_batch_02_sample_14.bc'
source_filename = "/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/posix_allocator.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

%struct.timespec = type { i64, i64 }
%"struct.Halide::Runtime::Internal::work_queue_t" = type { %struct.halide_mutex, i32, i32, %"struct.Halide::Runtime::Internal::work"*, i32, i32, i32, [4 x i8], %struct.halide_mutex, %struct.halide_mutex, %struct.halide_mutex, i32, i32, [256 x %struct.halide_thread*], i8, i8, i32 }
%"struct.Halide::Runtime::Internal::work" = type { %struct.halide_parallel_task_t, i32 (i8*, i32, i8*)*, %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"*, i32, %"struct.Halide::Runtime::Internal::work"*, i32, i8*, i32, i32, i32, i8 }
%struct.halide_parallel_task_t = type { i32 (i8*, i32, i32, i8*, i8*)*, i8*, i8*, %struct.halide_semaphore_acquire_t*, i32, i32, i32, i32, i8, [7 x i8] }
%struct.halide_semaphore_acquire_t = type { %struct.halide_semaphore_t*, i32, [4 x i8] }
%struct.halide_semaphore_t = type { [2 x i64] }
%struct.halide_mutex = type { [1 x i64] }
%struct.halide_thread = type opaque
%"class.Halide::Runtime::Internal::TraceBuffer" = type { %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock", i32, i32, [1048576 x i8] }
%"class.Halide::Runtime::Internal::SharedExclusiveSpinLock" = type { i32 }
%struct.halide_trace_event_t = type <{ i8*, i8*, i32*, i8*, %struct.halide_type_t, i32, i32, i32, i32, [4 x i8] }>
%struct.halide_type_t = type { i8, i8, i16 }
%"struct.Halide::Runtime::Internal::CacheEntry" = type { %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"*, i8*, i64, i8*, i32, i32, i32, i32, %struct.halide_dimension_t*, %struct.halide_buffer_t* }
%struct.halide_dimension_t = type { i32, i32, i32, i32 }
%struct.halide_buffer_t = type { i64, %struct.halide_device_interface_t*, i8*, i64, %struct.halide_type_t, i32, %struct.halide_dimension_t*, i8* }
%struct.halide_device_interface_t = type { i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, void (i8*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, i32*, i32*)*, %struct.halide_device_interface_impl_t* }
%struct.halide_device_interface_impl_t = type { void ()*, void ()*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*)* }
%struct.halide_profiler_state = type { %struct.halide_mutex, i32, i32, i32, i32, %struct.halide_profiler_pipeline_stats*, void (i32*, i32*)*, %struct.halide_thread* }
%struct.halide_profiler_pipeline_stats = type { i64, i64, i64, i64, i64, i64, i8*, %struct.halide_profiler_func_stats*, i8*, i32, i32, i32, i32, i32, [4 x i8] }
%struct.halide_profiler_func_stats = type { i64, i64, i64, i64, i64, i64, i64, i8*, i32, [4 x i8] }
%struct.halide_filter_argument_t = type { i8*, i32, i32, %struct.halide_type_t, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, %struct.halide_scalar_value_t*, i64** }
%struct.halide_scalar_value_t = type { %union.anon.27 }
%union.anon.27 = type { double }
%struct.halide_filter_metadata_t = type { i32, i32, %struct.halide_filter_argument_t*, i8*, i8* }
%"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control" = type { %"struct.Halide::Runtime::Internal::Synchronization::parking_control", i64* }
%"struct.Halide::Runtime::Internal::Synchronization::parking_control" = type { i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, void (i8*)*, i64 (i8*, i32, i1)*, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* }
%"struct.Halide::Runtime::Internal::Synchronization::validate_action" = type { i8, [7 x i8], i64 }
%"struct.Halide::Runtime::Internal::Synchronization::hash_bucket" = type { %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* }
%"class.Halide::Runtime::Internal::Synchronization::word_lock" = type { i64 }
%"struct.Halide::Runtime::Internal::Synchronization::queue_data" = type { %"struct.Halide::Runtime::Internal::Synchronization::thread_parker", i64, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, i64 }
%"struct.Halide::Runtime::Internal::Synchronization::thread_parker" = type <{ %struct.pthread_mutex_t, %struct.pthread_mutex_t, i8, [7 x i8] }>
%struct.pthread_mutex_t = type { [8 x i64] }
%"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data" = type { %"struct.Halide::Runtime::Internal::Synchronization::thread_parker", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* }
%"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control" = type { %"struct.Halide::Runtime::Internal::Synchronization::parking_control", i64*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"* }
%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair" = type { %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* }
%"struct.Halide::Runtime::Internal::spawned_thread" = type { void (i8*)*, i8*, i64 }
%"struct.Halide::Runtime::Internal::halide_tiff_header" = type <{ i16, i16, i32, i16, [15 x %"struct.Halide::Runtime::Internal::tiff_tag"], i32, [2 x i32], [2 x i32] }>
%"struct.Halide::Runtime::Internal::tiff_tag" = type { i16, i16, i32, %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock" }
%"struct.Halide::Runtime::Internal::CacheBlockHeader" = type { %"struct.Halide::Runtime::Internal::CacheEntry"*, i32, [4 x i8] }
%"struct.Halide::Runtime::Internal::device_copy" = type { i64, i64, i64, [16 x i64], [16 x i64], [16 x i64], i64 }
%struct.buffer_t = type { i64, i8*, [4 x i32], [4 x i32], [4 x i32], i32, i8, i8, [2 x i8] }
%"struct.Halide::Runtime::Internal::old_dev_wrapper" = type { i64, %struct.halide_device_interface_t* }
%"struct.Halide::Runtime::Internal::CpuFeatures" = type { [1 x i64], [1 x i64] }
%closure_t = type { i32, i32, i32, i32, i32, i1, i32, i32, i32, i32, i32, i8*, %struct.halide_buffer_t*, i8*, %struct.halide_buffer_t* }

@_ZN6Halide7Runtime8Internal13custom_mallocE = linkonce local_unnamed_addr global i8* (i8*, i64)* @halide_default_malloc, align 8
@_ZN6Halide7Runtime8Internal11custom_freeE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_free, align 8
@_ZN6Halide7Runtime8Internal13error_handlerE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_error, align 8
@.str = private unnamed_addr constant [8 x i8] c"Error: \00", align 1
@_ZN6Halide7Runtime8Internal12custom_printE = linkonce local_unnamed_addr global void (i8*, i8*)* @halide_default_print, align 8
@halide_reference_clock_inited = linkonce local_unnamed_addr global i8 0, align 1
@halide_reference_clock = linkonce global %struct.timespec zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal15Synchronization13table_storageE = linkonce global [24576 x i8] zeroinitializer, align 1
@_ZN6Halide7Runtime8Internal10work_queueE = linkonce global %"struct.Halide::Runtime::Internal::work_queue_t" { %struct.halide_mutex zeroinitializer, i32 0, i32 0, %"struct.Halide::Runtime::Internal::work"* null, i32 0, i32 0, i32 0, [4 x i8] undef, %struct.halide_mutex zeroinitializer, %struct.halide_mutex zeroinitializer, %struct.halide_mutex zeroinitializer, i32 0, i32 0, [256 x %struct.halide_thread*] zeroinitializer, i8 0, i8 0, i32 0 }, align 8
@_ZN6Halide7Runtime8Internal14custom_do_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_default_do_task, align 8
@_ZN6Halide7Runtime8Internal19custom_do_loop_taskE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* @halide_default_do_loop_task, align 8
@_ZN6Halide7Runtime8Internal17custom_do_par_forE = linkonce local_unnamed_addr global i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_default_do_par_for, align 8
@.str.5 = private unnamed_addr constant [140 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/synchronization_common.h:381 Assert failed: next != NULL\0A\00", align 1
@.str.6 = private unnamed_addr constant [138 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/synchronization_common.h:1096 Assert failed: val & 0x1\0A\00", align 1
@.str.7 = private unnamed_addr constant [199 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/thread_pool_common.h:151 Assert failed: bytes == limit && \22Logic error in thread pool work queue initialization.\5Cn\22\0A\00", align 1
@.str.3 = private unnamed_addr constant [276 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/thread_pool_common.h:498 Assert failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \22Logic error: thread over commit.\5Cn\22\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"HL_NUM_THREADS\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"HL_NUMTHREADS\00", align 1
@_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE = linkonce local_unnamed_addr global i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* @halide_default_do_parallel_tasks, align 8
@_ZN6Halide7Runtime8Internal21custom_semaphore_initE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_init, align 8
@_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE = linkonce local_unnamed_addr global i1 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_try_acquire, align 8
@_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE = linkonce local_unnamed_addr global i32 (%struct.halide_semaphore_t*, i32)* @halide_default_semaphore_release, align 8
@llvm.global_dtors = appending global [4 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @halide_thread_pool_cleanup, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @halide_trace_cleanup, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @halide_cache_cleanup, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @halide_profiler_shutdown, i8* null }]
@.str.4 = private unnamed_addr constant [38 x i8] c"halide_set_num_threads: must be >= 0.\00", align 1
@_ZN6Halide7Runtime8Internal17custom_get_symbolE = linkonce local_unnamed_addr global i8* (i8*)* @halide_default_get_symbol, align 8
@_ZN6Halide7Runtime8Internal19custom_load_libraryE = linkonce local_unnamed_addr global i8* (i8*)* @halide_default_load_library, align 8
@_ZN6Halide7Runtime8Internal25custom_get_library_symbolE = linkonce local_unnamed_addr global i8* (i8*, i8*)* @halide_default_get_library_symbol, align 8
@_ZN6Halide7Runtime8Internal17halide_gpu_deviceE = linkonce local_unnamed_addr global i32 0, align 4
@_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE = linkonce global i32 0, align 4
@_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"HL_GPU_DEVICE\00", align 1
@_ZN6Halide7Runtime8Internal19halide_trace_bufferE = linkonce local_unnamed_addr global %"class.Halide::Runtime::Internal::TraceBuffer"* null, align 8
@_ZN6Halide7Runtime8Internal17halide_trace_fileE = linkonce local_unnamed_addr global i32 -1, align 4
@_ZN6Halide7Runtime8Internal22halide_trace_file_lockE = linkonce global i32 0, align 4
@_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE = linkonce local_unnamed_addr global i8 0, align 1
@_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE = linkonce local_unnamed_addr global i8* null, align 8
@_ZN6Halide7Runtime8Internal19halide_custom_traceE = linkonce local_unnamed_addr global i32 (i8*, %struct.halide_trace_event_t*)* @halide_default_trace, align 8
@_ZZ20halide_default_traceE3ids = internal global i32 1, align 4
@.str.32 = private unnamed_addr constant [157 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/tracing.cpp:115 Assert failed: success && \22Could not write to trace file\22\0A\00", align 1
@.str.31 = private unnamed_addr constant [133 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/tracing.cpp:86 Assert failed: size <= buffer_size\0A\00", align 1
@.str.2.11 = private unnamed_addr constant [153 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/tracing.cpp:215 Assert failed: print_bits <= 64 && \22Tracing bad type\22\0A\00", align 1
@_ZZ20halide_default_traceE11event_types = private unnamed_addr constant [11 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.12, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.13, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5.14, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6.15, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7.16, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8.17, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9.18, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0)], align 8
@.str.17 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c">)\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c">, <\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c" = <\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c" = \00", align 1
@.str.24 = private unnamed_addr constant [155 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/tracing.cpp:284 Assert failed: print_bits >= 16 && \22Tracing a bad type\22\0A\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c">\00", align 1
@.str.26 = private unnamed_addr constant [9 x i8] c" tag = \22\00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@.str.3.12 = private unnamed_addr constant [5 x i8] c"Load\00", align 1
@.str.4.13 = private unnamed_addr constant [6 x i8] c"Store\00", align 1
@.str.5.14 = private unnamed_addr constant [18 x i8] c"Begin realization\00", align 1
@.str.6.15 = private unnamed_addr constant [16 x i8] c"End realization\00", align 1
@.str.7.16 = private unnamed_addr constant [8 x i8] c"Produce\00", align 1
@.str.8.17 = private unnamed_addr constant [12 x i8] c"End produce\00", align 1
@.str.9.18 = private unnamed_addr constant [8 x i8] c"Consume\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"End consume\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"Begin pipeline\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"End pipeline\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"Tag\00", align 1
@.str.28 = private unnamed_addr constant [14 x i8] c"HL_TRACE_FILE\00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str.30 = private unnamed_addr constant [152 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/tracing.cpp:345 Assert failed: file && \22Failed to open trace file\5Cn\22\0A\00", align 1
@_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE = linkonce local_unnamed_addr global [10 x i16] [i16 3, i16 3, i16 1, i16 2, i16 1, i16 2, i16 1, i16 2, i16 1, i16 2], align 2
@_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE = linkonce local_unnamed_addr global [10 x i8] c"\07\06\09\08\0B\0A\0D\0C\0F\0E", align 1
@_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE = linkonce local_unnamed_addr global [10 x i8] c"\07\09\02\01\04\03\06\05\0D\0C", align 1
@.str.35 = private unnamed_addr constant [59 x i8] c"Can't debug_to_file a Func with more than four dimensions\0A\00", align 1
@.str.1.36 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.2.37 = private unnamed_addr constant [6 x i8] c".tiff\00", align 1
@.str.3.38 = private unnamed_addr constant [5 x i8] c".tif\00", align 1
@.str.4.39 = private unnamed_addr constant [5 x i8] c".mat\00", align 1
@_ZZ20halide_debug_to_fileE6header = private unnamed_addr constant [129 x i8] c"MATLAB 5.0 MAT-file, produced by Halide                                                                                     \00\01IM\00", align 1
@.str.5.40 = private unnamed_addr constant [53 x i8] c"Can't debug_to_file to a .mat file greater than 4GB\0A\00", align 1
@.str.6.41 = private unnamed_addr constant [39 x i8] c"Unexpectedly large final_padding_bytes\00", align 1
@_ZN6Halide7Runtime8Internal16memoization_lockE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal13cache_entriesE = linkonce local_unnamed_addr global [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*] zeroinitializer, align 8
@_ZN6Halide7Runtime8Internal18most_recently_usedE = linkonce local_unnamed_addr global %"struct.Halide::Runtime::Internal::CacheEntry"* null, align 8
@_ZN6Halide7Runtime8Internal19least_recently_usedE = linkonce local_unnamed_addr global %"struct.Halide::Runtime::Internal::CacheEntry"* null, align 8
@_ZN6Halide7Runtime8Internal14max_cache_sizeE = linkonce local_unnamed_addr global i64 1048576, align 8
@_ZN6Halide7Runtime8Internal18current_cache_sizeE = linkonce local_unnamed_addr global i64 0, align 8
@.str.4.43 = private unnamed_addr constant [136 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/cache.cpp:273 Assert failed: prev_hash_entry != NULL\0A\00", align 1
@.str.5.44 = private unnamed_addr constant [139 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/cache.cpp:360 Assert failed: entry->more_recent != NULL\0A\00", align 1
@.str.6.45 = private unnamed_addr constant [141 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/cache.cpp:364 Assert failed: least_recently_used == entry\0A\00", align 1
@.str.7.46 = private unnamed_addr constant [139 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/cache.cpp:367 Assert failed: entry->more_recent != NULL\0A\00", align 1
@.str.9.47 = private unnamed_addr constant [135 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/cache.cpp:458 Assert failed: no_host_pointers_equal\0A\00", align 1
@.str.12.48 = private unnamed_addr constant [136 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/cache.cpp:536 Assert failed: entry->in_use_count > 0\0A\00", align 1
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
@.str.19.78 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.20.79 = private unnamed_addr constant [8 x i8] c"buffer(\00", align 1
@.str.22.82 = private unnamed_addr constant [4 x i8] c", {\00", align 1
@.str.23.83 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_ZN6Halide7Runtime8Internal17device_copy_mutexE = linkonce global %struct.halide_mutex zeroinitializer, align 8
@.str.9.88 = private unnamed_addr constant [20 x i8] c"halide_copy_to_host\00", align 1
@.str.10.89 = private unnamed_addr constant [22 x i8] c"halide_copy_to_device\00", align 1
@.str.12.90 = private unnamed_addr constant [61 x i8] c"halide_copy_to_device does not support switching interfaces\0A\00", align 1
@.str.18.91 = private unnamed_addr constant [21 x i8] c"halide_device_malloc\00", align 1
@.str.20.92 = private unnamed_addr constant [59 x i8] c"halide_device_malloc doesn't support switching interfaces\0A\00", align 1
@.str.17.93 = private unnamed_addr constant [19 x i8] c"halide_device_sync\00", align 1
@.str.21.96 = private unnamed_addr constant [19 x i8] c"halide_device_free\00", align 1
@.str.22.97 = private unnamed_addr constant [140 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/device_interface.cpp:247 Assert failed: buf->device == 0\0A\00", align 1
@.str.23.98 = private unnamed_addr constant [30 x i8] c"halide_device_and_host_malloc\00", align 1
@.str.25.99 = private unnamed_addr constant [68 x i8] c"halide_device_and_host_malloc doesn't support switching interfaces\0A\00", align 1
@.str.26.100 = private unnamed_addr constant [42 x i8] c"allocating host and device memory failed\0A\00", align 1
@.str.27.101 = private unnamed_addr constant [28 x i8] c"halide_device_and_host_free\00", align 1
@.str.28.102 = private unnamed_addr constant [140 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/device_interface.cpp:312 Assert failed: buf->device == 0\0A\00", align 1
@.str.29.103 = private unnamed_addr constant [38 x i8] c"halide_default_device_and_host_malloc\00", align 1
@.str.30.104 = private unnamed_addr constant [36 x i8] c"halide_default_device_and_host_free\00", align 1
@.str.31.105 = private unnamed_addr constant [26 x i8] c"halide_device_wrap_native\00", align 1
@.str.32.106 = private unnamed_addr constant [64 x i8] c"halide_device_wrap_native doesn't support switching interfaces\0A\00", align 1
@.str.33.107 = private unnamed_addr constant [28 x i8] c"halide_device_detach_native\00", align 1
@.str.34.108 = private unnamed_addr constant [140 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/device_interface.cpp:399 Assert failed: buf->device == 0\0A\00", align 1
@.str.35.109 = private unnamed_addr constant [34 x i8] c"halide_default_device_wrap_native\00", align 1
@.str.36 = private unnamed_addr constant [36 x i8] c"halide_default_device_detach_native\00", align 1
@.str.42 = private unnamed_addr constant [64 x i8] c"halide_buffer_copy does not support switching device interfaces\00", align 1
@.str.58 = private unnamed_addr constant [44 x i8] c"device_interface does not support cropping\0A\00", align 1
@.str.59 = private unnamed_addr constant [43 x i8] c"device_interface does not support slicing\0A\00", align 1
@.str.60 = private unnamed_addr constant [52 x i8] c"destination buffer already has a device allocation\0A\00", align 1
@.str.61 = private unnamed_addr constant [48 x i8] c"src and dst must have identical dimensionality\0A\00", align 1
@.str.64 = private unnamed_addr constant [52 x i8] c"dst must have exactly one fewer dimension than src\0A\00", align 1
@.str.112 = private unnamed_addr constant [41 x i8] c"Bounds inference call to external stage \00", align 1
@.str.1.113 = private unnamed_addr constant [27 x i8] c" returned non-zero value: \00", align 1
@.str.2.114 = private unnamed_addr constant [24 x i8] c"Call to external stage \00", align 1
@.str.3.115 = private unnamed_addr constant [18 x i8] c"Bounds given for \00", align 1
@.str.4.116 = private unnamed_addr constant [5 x i8] c" in \00", align 1
@.str.5.117 = private unnamed_addr constant [8 x i8] c" (from \00", align 1
@.str.6.118 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@.str.7.119 = private unnamed_addr constant [38 x i8] c") do not cover required region (from \00", align 1
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
@.str.37 = private unnamed_addr constant [44 x i8] c"Out of memory (halide_malloc returned NULL)\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"Buffer argument \00", align 1
@.str.39 = private unnamed_addr constant [9 x i8] c" is NULL\00", align 1
@.str.40 = private unnamed_addr constant [25 x i8] c"Failed to dump function \00", align 1
@.str.41 = private unnamed_addr constant [10 x i8] c" to file \00", align 1
@.str.42.149 = private unnamed_addr constant [13 x i8] c" with error \00", align 1
@.str.43 = private unnamed_addr constant [51 x i8] c"Failed to upgrade buffer_t to halide_buffer_t for \00", align 1
@.str.45 = private unnamed_addr constant [53 x i8] c"Failed to downgrade halide_buffer_t to buffer_t for \00", align 1
@.str.46 = private unnamed_addr constant [21 x i8] c"The host pointer of \00", align 1
@.str.47 = private unnamed_addr constant [22 x i8] c" is not aligned to a \00", align 1
@.str.48 = private unnamed_addr constant [17 x i8] c" bytes boundary.\00", align 1
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
@.str.67 = private unnamed_addr constant [59 x i8] c"A schedule specialized with specialize_fail() was chosen: \00", align 1
@.str.68 = private unnamed_addr constant [55 x i8] c"Buffer has a non-zero device but no device interface.\0A\00", align 1
@.str.69 = private unnamed_addr constant [56 x i8] c"Buffer has a non-null devie_interface but device is 0.\0A\00", align 1
@.str.70 = private unnamed_addr constant [49 x i8] c"Buffer has both host and device dirty bits set.\0A\00", align 1
@.str.71 = private unnamed_addr constant [26 x i8] c"Buffer pointer passed to \00", align 1
@.str.72 = private unnamed_addr constant [11 x i8] c" is null.\0A\00", align 1
@.str.73 = private unnamed_addr constant [37 x i8] c"Integer division or modulo by zero.\0A\00", align 1
@.str.164 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1.165 = private unnamed_addr constant [44 x i8] c"elem_size of buffer was not in [1, 2, 4, 8]\00", align 1
@.str.2.166 = private unnamed_addr constant [33 x i8] c"buffer has incorrect elem_size (\00", align 1
@.str.3.167 = private unnamed_addr constant [3 x i8] c") \00", align 1
@.str.4.168 = private unnamed_addr constant [20 x i8] c"for expected type (\00", align 1
@.str.5.169 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.8.170 = private unnamed_addr constant [35 x i8] c"Printer buffer allocation failed.\0A\00", align 1
@.str.6.171 = private unnamed_addr constant [65 x i8] c"Internal error: buffer host mismatch in halide_upgrade_buffer_t.\00", align 1
@.str.7.172 = private unnamed_addr constant [37 x i8] c"buffer has more than four dimensions\00", align 1
@.str.30.174 = private unnamed_addr constant [7 x i8] c"<NULL>\00", align 1
@.str.7.175 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8.176 = private unnamed_addr constant [14 x i8] c" total time: \00", align 1
@.str.9.177 = private unnamed_addr constant [4 x i8] c" ms\00", align 1
@.str.10.178 = private unnamed_addr constant [12 x i8] c"  samples: \00", align 1
@.str.11.179 = private unnamed_addr constant [9 x i8] c"  runs: \00", align 1
@.str.12.180 = private unnamed_addr constant [13 x i8] c"  time/run: \00", align 1
@.str.13.181 = private unnamed_addr constant [5 x i8] c" ms\0A\00", align 1
@.str.14.182 = private unnamed_addr constant [24 x i8] c" average threads used: \00", align 1
@.str.15.183 = private unnamed_addr constant [20 x i8] c" heap allocations: \00", align 1
@.str.16.184 = private unnamed_addr constant [20 x i8] c"  peak heap usage: \00", align 1
@.str.17.185 = private unnamed_addr constant [8 x i8] c" bytes\0A\00", align 1
@.str.18.186 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.19.187 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.20.188 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.21.189 = private unnamed_addr constant [3 x i8] c"ms\00", align 1
@.str.22.190 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@.str.23.191 = private unnamed_addr constant [3 x i8] c"%)\00", align 1
@.str.24.192 = private unnamed_addr constant [10 x i8] c"threads: \00", align 1
@.str.25.193 = private unnamed_addr constant [8 x i8] c" peak: \00", align 1
@.str.26.194 = private unnamed_addr constant [7 x i8] c" num: \00", align 1
@.str.27.195 = private unnamed_addr constant [7 x i8] c" avg: \00", align 1
@.str.28.196 = private unnamed_addr constant [9 x i8] c" stack: \00", align 1
@_ZZ25halide_profiler_get_stateE1s = internal global %struct.halide_profiler_state { %struct.halide_mutex zeroinitializer, i32 1, i32 0, i32 0, i32 0, %struct.halide_profiler_pipeline_stats* null, void (i32*, i32*)* null, %struct.halide_thread* null }, align 8
@.str.197 = private unnamed_addr constant [131 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/profiler.cpp:201 Assert failed: p_stats != NULL\0A\00", align 1
@.str.1.198 = private unnamed_addr constant [131 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/profiler.cpp:228 Assert failed: p_stats != NULL\0A\00", align 1
@.str.2.199 = private unnamed_addr constant [128 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/profiler.cpp:229 Assert failed: func_id >= 0\0A\00", align 1
@.str.3.200 = private unnamed_addr constant [144 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/profiler.cpp:230 Assert failed: func_id < p_stats->num_funcs\0A\00", align 1
@.str.4.201 = private unnamed_addr constant [131 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/profiler.cpp:264 Assert failed: p_stats != NULL\0A\00", align 1
@.str.5.202 = private unnamed_addr constant [128 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/profiler.cpp:265 Assert failed: func_id >= 0\0A\00", align 1
@.str.6.203 = private unnamed_addr constant [144 x i8] c"/home/sb54/Hydride/hexagon-benchmarks/halide_standalone_autoscheduler/src/runtime/profiler.cpp:266 Assert failed: func_id < p_stats->num_funcs\0A\00", align 1
@_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE = linkonce local_unnamed_addr global i32 (i32, i64*)* @halide_default_can_use_target_features, align 8
@_ZZ38halide_default_can_use_target_featuresE11initialized = internal unnamed_addr global i1 false, align 1
@_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage = internal global [2 x i64] zeroinitializer, align 8
@.str.208 = private unnamed_addr constant [81 x i8] c"Internal error: wrong structure size passed to halide_can_use_target_features()\0A\00", align 1
@str = private constant [7 x i8] c"output\00", align 32
@str.213 = private constant [6 x i8] c"input\00", align 32
@str.214 = private constant [19 x i8] c"Input buffer input\00", align 32
@str.215 = private constant [21 x i8] c"Output buffer output\00", align 32
@str.216 = private constant [15 x i8] c"input.stride.0\00", align 32
@str.217 = private constant [2 x i8] c"1\00", align 32
@str.218 = private constant [12 x i8] c"input.min.0\00", align 32
@str.219 = private constant [2 x i8] c"0\00", align 32
@str.220 = private constant [12 x i8] c"input.min.1\00", align 32
@str.221 = private constant [16 x i8] c"output.stride.0\00", align 32
@str.222 = private constant [13 x i8] c"output.min.0\00", align 32
@str.223 = private constant [13 x i8] c"output.min.1\00", align 32
@0 = private constant i64 0
@1 = private constant i64 1024
@2 = private constant i64 0
@3 = private constant i64 1024
@4 = private constant [4 x i64*] [i64* @0, i64* @1, i64* @2, i64* @3]
@5 = private constant i64 0
@6 = private constant i64 1024
@7 = private constant i64 0
@8 = private constant i64 1024
@9 = private constant [4 x i64*] [i64* @5, i64* @6, i64* @7, i64* @8]
@10 = private constant [2 x %struct.halide_filter_argument_t] [%struct.halide_filter_argument_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i32 0, i32 0), i32 1, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @4, i32 0, i32 0) }, %struct.halide_filter_argument_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i32 0, i32 0), i32 2, i32 2, %struct.halide_type_t { i8 1, i8 8, i16 1 }, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, %struct.halide_scalar_value_t* null, i64** getelementptr inbounds ([4 x i64*], [4 x i64*]* @9, i32 0, i32 0) }]
@str.224 = private constant [112 x i8] c"x86-64-linux-avx-avx2-avx512-avx512_skylake-disable_llvm_loop_unroll-disable_llvm_loop_vectorize-f16c-fma-sse41\00", align 64
@str.225 = private constant [29 x i8] c"dilate3x3_batch_02_sample_14\00", align 32
@dilate3x3_batch_02_sample_14_metadata_storage = private constant %struct.halide_filter_metadata_t { i32 1, i32 2, %struct.halide_filter_argument_t* getelementptr inbounds ([2 x %struct.halide_filter_argument_t], [2 x %struct.halide_filter_argument_t]* @10, i32 0, i32 0), i8* getelementptr inbounds ([112 x i8], [112 x i8]* @str.224, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @str.225, i32 0, i32 0) }
@switch.table.halide_type_to_string = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13.76, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14.75, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15.74, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16.73, i64 0, i64 0)]

; Function Attrs: nounwind
define weak i8* @halide_default_malloc(i8*, i64) #0 {
  %3 = add i64 %1, 64
  %4 = tail call i8* @malloc(i64 %3) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %13, label %6

; <label>:6:                                      ; preds = %2
  %7 = ptrtoint i8* %4 to i64
  %8 = add i64 %7, 71
  %9 = and i64 %8, -64
  %10 = inttoptr i64 %9 to i8*
  %11 = inttoptr i64 %9 to i8**
  %12 = getelementptr inbounds i8*, i8** %11, i64 -1
  store i8* %4, i8** %12, align 8, !tbaa !7
  br label %13

; <label>:13:                                     ; preds = %6, %2
  %14 = phi i8* [ %10, %6 ], [ null, %2 ]
  ret i8* %14
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
define weak void @halide_default_free(i8*, i8*) #0 {
  %3 = getelementptr inbounds i8, i8* %1, i64 -8
  %4 = bitcast i8* %3 to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !7
  tail call void @free(i8* %5) #12
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: norecurse nounwind
define weak i8* (i8*, i64)* @halide_set_custom_malloc(i8* (i8*, i64)*) local_unnamed_addr #2 {
  %2 = load i8* (i8*, i64)*, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !7
  store i8* (i8*, i64)* %0, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !7
  ret i8* (i8*, i64)* %2
}

; Function Attrs: norecurse nounwind
define weak void (i8*, i8*)* @halide_set_custom_free(void (i8*, i8*)*) local_unnamed_addr #2 {
  %2 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !7
  store void (i8*, i8*)* %0, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !7
  ret void (i8*, i8*)* %2
}

; Function Attrs: nounwind
define weak i8* @halide_malloc(i8*, i64) local_unnamed_addr #0 {
  %3 = load i8* (i8*, i64)*, i8* (i8*, i64)** @_ZN6Halide7Runtime8Internal13custom_mallocE, align 8, !tbaa !7
  %4 = tail call i8* %3(i8* %0, i64 %1) #12
  ret i8* %4
}

; Function Attrs: nounwind
define weak void @halide_free(i8*, i8*) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal11custom_freeE, align 8, !tbaa !7
  tail call void %3(i8* %0, i8* %1) #12
  ret void
}

; Function Attrs: nounwind
define weak void @halide_default_error(i8*, i8*) #0 {
  %3 = alloca [4096 x i8], align 1
  %4 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %4) #10
  %5 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 4094
  %6 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #12
  %7 = call i8* @halide_string_to_string(i8* %6, i8* nonnull %5, i8* %1) #12
  %8 = getelementptr inbounds i8, i8* %7, i64 -1
  %9 = load i8, i8* %8, align 1, !tbaa !11
  %10 = icmp eq i8 %9, 10
  br i1 %10, label %13, label %11

; <label>:11:                                     ; preds = %2
  store i8 10, i8* %7, align 1, !tbaa !11
  %12 = getelementptr inbounds i8, i8* %7, i64 1
  store i8 0, i8* %12, align 1, !tbaa !11
  br label %13

; <label>:13:                                     ; preds = %11, %2
  %14 = phi i8* [ %12, %11 ], [ %7, %2 ]
  %15 = ptrtoint i8* %14 to i64
  %16 = ptrtoint [4096 x i8]* %3 to i64
  %17 = sub i64 1, %16
  %18 = add i64 %17, %15
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %18) #12
  call void @halide_print(i8* %0, i8* nonnull %4) #12
  call void @abort() #12
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %4) #10
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
define weak void @halide_error(i8*, i8*) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !7
  tail call void %3(i8* %0, i8* %1) #12
  ret void
}

; Function Attrs: norecurse nounwind
define weak void (i8*, i8*)* @halide_set_error_handler(void (i8*, i8*)*) local_unnamed_addr #2 {
  %2 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !7
  store void (i8*, i8*)* %0, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal13error_handlerE, align 8, !tbaa !7
  ret void (i8*, i8*)* %2
}

; Function Attrs: nounwind
define weak void @halide_print(i8*, i8*) local_unnamed_addr #0 {
  %3 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !7
  tail call void %3(i8* %0, i8* %1) #12
  ret void
}

; Function Attrs: norecurse nounwind
define weak void (i8*, i8*)* @halide_set_custom_print(void (i8*, i8*)*) local_unnamed_addr #2 {
  %2 = load void (i8*, i8*)*, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !7
  store void (i8*, i8*)* %0, void (i8*, i8*)** @_ZN6Halide7Runtime8Internal12custom_printE, align 8, !tbaa !7
  ret void (i8*, i8*)* %2
}

; Function Attrs: nounwind
define weak i32 @halide_start_clock(i8*) local_unnamed_addr #0 {
  %2 = load i8, i8* @halide_reference_clock_inited, align 1, !tbaa !12, !range !14
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %1
  %5 = tail call i32 (i32, ...) @syscall(i32 228, i32 0, %struct.timespec* nonnull @halide_reference_clock) #12
  store i8 1, i8* @halide_reference_clock_inited, align 1, !tbaa !12
  br label %6

; <label>:6:                                      ; preds = %4, %1
  ret i32 0
}

declare i32 @syscall(i32, ...) local_unnamed_addr #4

; Function Attrs: nounwind
define weak i64 @halide_current_time_ns(i8*) local_unnamed_addr #0 {
  %2 = alloca <2 x i64>, align 16
  %3 = bitcast <2 x i64>* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #10
  %4 = call i32 (i32, ...) @syscall(i32 228, i32 0, <2 x i64>* nonnull %2) #12
  %5 = load <2 x i64>, <2 x i64>* %2, align 16, !tbaa !15
  %6 = load <2 x i64>, <2 x i64>* bitcast (%struct.timespec* @halide_reference_clock to <2 x i64>*), align 8, !tbaa !15
  %7 = sub <2 x i64> %5, %6
  %8 = extractelement <2 x i64> %7, i32 0
  %9 = mul nsw i64 %8, 1000000000
  %10 = extractelement <2 x i64> %7, i32 1
  %11 = add nsw i64 %9, %10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #10
  ret i64 %11
}

; Function Attrs: nounwind
define weak void @halide_sleep_ms(i8*, i32) local_unnamed_addr #0 {
  %3 = mul nsw i32 %1, 1000
  %4 = tail call i32 @usleep(i32 %3) #12
  ret void
}

declare i32 @usleep(i32) local_unnamed_addr #4

; Function Attrs: nounwind
define weak void @halide_default_print(i8*, i8*) #0 {
  %3 = tail call i64 @strlen(i8* %1) #12
  %4 = tail call i64 @write(i32 1, i8* %1, i64 %3) #12
  ret void
}

; Function Attrs: argmemonly nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #5

declare i64 @write(i32, i8* nocapture readonly, i64) local_unnamed_addr #4

; Function Attrs: nounwind
define weak i32 @halide_host_cpu_count() local_unnamed_addr #0 {
  %1 = tail call i64 @sysconf(i32 84) #12
  %2 = trunc i64 %1 to i32
  ret i32 %2
}

declare i64 @sysconf(i32) local_unnamed_addr #4

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() local_unnamed_addr #0 {
  %1 = tail call i32 @sched_yield() #12
  ret void
}

declare i32 @sched_yield() local_unnamed_addr #4

; Function Attrs: nounwind
define weak i32 @halide_default_do_task(i8*, i32 (i8*, i32, i8*)*, i32, i8*) #0 {
  %5 = tail call i32 %1(i8* %0, i32 %2, i8* %3) #12
  ret i32 %5
}

; Function Attrs: nounwind
define weak i32 @halide_default_do_loop_task(i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*) #0 {
  %7 = tail call i32 %1(i8* %0, i32 %2, i32 %3, i8* %4, i8* %5) #12
  ret i32 %7
}

; Function Attrs: nounwind
define weak i32 @halide_default_do_par_for(i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*) #0 {
  %6 = alloca %"struct.Halide::Runtime::Internal::work", align 8
  %7 = icmp slt i32 %3, 1
  br i1 %7, label %28, label %8

; <label>:8:                                      ; preds = %5
  %9 = bitcast %"struct.Halide::Runtime::Internal::work"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %9) #10
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 0
  store i32 (i8*, i32, i32, i8*, i8*)* null, i32 (i8*, i32, i32, i8*, i8*)** %10, align 8, !tbaa !17
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 5
  store i32 %2, i32* %11, align 4, !tbaa !21
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 6
  store i32 %3, i32* %12, align 8, !tbaa !22
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 8
  store i8 0, i8* %13, align 8, !tbaa !23
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 3
  store %struct.halide_semaphore_acquire_t* null, %struct.halide_semaphore_acquire_t** %14, align 8, !tbaa !24
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 4
  store i32 0, i32* %15, align 8, !tbaa !25
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 1
  store i8* %4, i8** %16, align 8, !tbaa !26
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 7
  store i32 0, i32* %17, align 4, !tbaa !27
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 0, i32 2
  store i8* null, i8** %18, align 8, !tbaa !28
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 1
  store i32 (i8*, i32, i8*)* %1, i32 (i8*, i32, i8*)** %19, align 8, !tbaa !29
  %20 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 7
  store i8* %0, i8** %20, align 8, !tbaa !30
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 9
  %22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 8
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 3
  %24 = bitcast i32* %22 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %24, i8 0, i64 13, i32 8, i1 false)
  store %"struct.Halide::Runtime::Internal::work"* %6, %"struct.Halide::Runtime::Internal::work"** %23, align 8, !tbaa !31
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 4
  store i32 0, i32* %25, align 8, !tbaa !32
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 0, i32 5
  store %"struct.Halide::Runtime::Internal::work"* null, %"struct.Halide::Runtime::Internal::work"** %26, align 8, !tbaa !33
  call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 1, %"struct.Halide::Runtime::Internal::work"* nonnull %6, %"struct.Halide::Runtime::Internal::work"* null) #13
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %6) #13
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %27 = load i32, i32* %21, align 4, !tbaa !34
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %9) #10
  br label %28

; <label>:28:                                     ; preds = %8, %5
  %29 = phi i32 [ %27, %8 ], [ 0, %5 ]
  ret i32 %29
}

; Function Attrs: nounwind
define weak void @halide_mutex_lock(%struct.halide_mutex*) local_unnamed_addr #0 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %3 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = cmpxchg weak i64* %3, i64 0, i64 1 acquire monotonic
  %5 = extractvalue { i64, i1 } %4, 1
  br i1 %5, label %.loopexit, label %6

; <label>:6:                                      ; preds = %1
  %7 = load atomic i64, i64* %3 monotonic, align 8
  %8 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2 to i8*
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 1
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 2
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 3
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 1
  %14 = ptrtoint %struct.halide_mutex* %0 to i64
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0
  br label %16

; <label>:16:                                     ; preds = %.backedge, %6
  %17 = phi i64 [ %7, %6 ], [ %.be, %.backedge ]
  %18 = phi i32 [ 40, %6 ], [ %.be5, %.backedge ]
  br label %19

; <label>:19:                                     ; preds = %23, %16
  %20 = phi i64 [ %27, %23 ], [ %17, %16 ]
  %21 = and i64 %20, 1
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %19
  %24 = or i64 %20, 1
  %25 = cmpxchg weak i64* %3, i64 %20, i64 %24 acquire monotonic
  %26 = extractvalue { i64, i1 } %25, 1
  %27 = extractvalue { i64, i1 } %25, 0
  br i1 %26, label %.loopexit, label %19

; <label>:28:                                     ; preds = %19
  %29 = and i64 %20, 2
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %31, label %45

; <label>:31:                                     ; preds = %28
  %32 = icmp sgt i32 %18, 0
  br i1 %32, label %33, label %38

; <label>:33:                                     ; preds = %31
  %34 = icmp eq i32 %18, 1
  br i1 %34, label %38, label %35

; <label>:35:                                     ; preds = %33
  %36 = add nsw i32 %18, -1
  call void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() #12
  %37 = load atomic i64, i64* %3 monotonic, align 8
  br label %.backedge

; <label>:38:                                     ; preds = %33, %31
  %39 = phi i32 [ 0, %33 ], [ %18, %31 ]
  %40 = or i64 %20, 2
  %41 = cmpxchg weak i64* %3, i64 %20, i64 %40 monotonic monotonic
  %42 = extractvalue { i64, i1 } %41, 1
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %38
  %44 = extractvalue { i64, i1 } %41, 0
  br label %.backedge

; <label>:45:                                     ; preds = %38, %28
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %8) #10
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %10, align 8, !tbaa !35
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %12, align 8, !tbaa !37
  store i64* %3, i64** %13, align 8, !tbaa !38
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %9, align 8, !tbaa !40
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %11, align 8, !tbaa !41
  %46 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %14, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %15) #12
  %47 = icmp eq i64 %46, %14
  br i1 %47, label %50, label %48

; <label>:48:                                     ; preds = %45
  %49 = load atomic i64, i64* %3 monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %8) #10
  br label %.backedge

.backedge:                                        ; preds = %48, %43, %35
  %.be = phi i64 [ %44, %43 ], [ %49, %48 ], [ %37, %35 ]
  %.be5 = phi i32 [ %39, %43 ], [ 40, %48 ], [ %36, %35 ]
  br label %16

; <label>:50:                                     ; preds = %45
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %8) #10
  br label %.loopexit

.loopexit:                                        ; preds = %50, %23, %1
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32, %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"*) local_unnamed_addr #0 {
  %4 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 15), align 1, !tbaa !42, !range !14
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %.preheader21, label %25

.preheader21:                                     ; preds = %3
  br label %6

; <label>:6:                                      ; preds = %10, %.preheader21
  %7 = phi i8* [ %11, %10 ], [ bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), %.preheader21 ]
  %8 = load i8, i8* %7, align 1, !tbaa !11
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %6
  %11 = getelementptr inbounds i8, i8* %7, i64 1
  %12 = icmp ult i8* %11, bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 1) to i8*)
  br i1 %12, label %6, label %13

; <label>:13:                                     ; preds = %10, %6
  %14 = phi i8* [ %11, %10 ], [ %7, %6 ]
  %15 = icmp eq i8* %14, bitcast (%"struct.Halide::Runtime::Internal::work_queue_t"* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 1) to i8*)
  br i1 %15, label %17, label %16

; <label>:16:                                     ; preds = %13
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([199 x i8], [199 x i8]* @.str.7, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %17

; <label>:17:                                     ; preds = %16, %13
  %18 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #13
  store i32 %21, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  br label %22

; <label>:22:                                     ; preds = %20, %17
  %23 = phi i32 [ %18, %17 ], [ %21, %20 ]
  %24 = tail call i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32 %23) #13
  store i32 %24, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  store i8 1, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 15), align 1, !tbaa !42
  br label %25

; <label>:25:                                     ; preds = %22, %3
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %25
  %28 = zext i32 %0 to i64
  br label %38

; <label>:29:                                     ; preds = %64
  %30 = and i8 %48, 1
  br label %31

; <label>:31:                                     ; preds = %29, %25
  %32 = phi i32 [ -1, %25 ], [ %65, %29 ]
  %33 = phi i8 [ 0, %25 ], [ %30, %29 ]
  %34 = phi i8 [ 0, %25 ], [ %54, %29 ]
  %35 = phi i8 [ 0, %25 ], [ %49, %29 ]
  %36 = phi i32 [ 0, %25 ], [ %50, %29 ]
  %37 = icmp eq %"struct.Halide::Runtime::Internal::work"* %2, null
  br i1 %37, label %68, label %99

; <label>:38:                                     ; preds = %64, %27
  %39 = phi i64 [ 0, %27 ], [ %66, %64 ]
  %40 = phi i32 [ 0, %27 ], [ %50, %64 ]
  %41 = phi i8 [ 0, %27 ], [ %49, %64 ]
  %42 = phi i8 [ 0, %27 ], [ %54, %64 ]
  %43 = phi i8 [ 0, %27 ], [ %48, %64 ]
  %44 = phi i32 [ -1, %27 ], [ %65, %64 ]
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %39, i32 0, i32 7
  %46 = load i32, i32* %45, align 4, !tbaa !27
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %47, i8 1, i8 %43
  %49 = select i1 %47, i8 %41, i8 1
  %50 = add nsw i32 %46, %40
  %51 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %39, i32 0, i32 4
  %52 = load i32, i32* %51, align 8, !tbaa !25
  %53 = icmp eq i32 %52, 0
  %54 = select i1 %53, i8 %42, i8 1
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %39, i32 0, i32 8
  %56 = load i8, i8* %55, align 8, !tbaa !23, !range !14
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %60, label %58

; <label>:58:                                     ; preds = %38
  %59 = add nsw i32 %44, 1
  br label %64

; <label>:60:                                     ; preds = %38
  %61 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %39, i32 0, i32 6
  %62 = load i32, i32* %61, align 8, !tbaa !22
  %63 = add nsw i32 %62, %44
  br label %64

; <label>:64:                                     ; preds = %60, %58
  %65 = phi i32 [ %59, %58 ], [ %63, %60 ]
  %66 = add nuw nsw i64 %39, 1
  %67 = icmp eq i64 %66, %28
  br i1 %67, label %29, label %38

; <label>:68:                                     ; preds = %31
  %69 = or i8 %35, %34
  %70 = and i8 %69, 1
  %71 = icmp eq i8 %70, 0
  %72 = xor i1 %71, true
  %73 = zext i1 %72 to i32
  %74 = add nsw i32 %36, %73
  %75 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %76 = icmp slt i32 %75, 256
  br i1 %76, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %68
  br label %77

; <label>:77:                                     ; preds = %87, %.preheader
  %78 = phi i32 [ %92, %87 ], [ %75, %.preheader ]
  %79 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  %80 = add nsw i32 %79, -1
  %81 = icmp slt i32 %78, %80
  br i1 %81, label %87, label %82

; <label>:82:                                     ; preds = %77
  %83 = add nsw i32 %78, 1
  %84 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  %85 = sub i32 %83, %84
  %86 = icmp slt i32 %85, %74
  br i1 %86, label %87, label %.loopexit

; <label>:87:                                     ; preds = %82, %77
  %88 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  %90 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal13worker_threadEPv, i8* null) #13
  %91 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 13, i64 %93
  store %struct.halide_thread* %90, %struct.halide_thread** %94, align 8, !tbaa !7
  %95 = icmp slt i32 %91, 255
  br i1 %95, label %77, label %.loopexit

.loopexit:                                        ; preds = %87, %82, %68
  br i1 %71, label %117, label %96

; <label>:96:                                     ; preds = %.loopexit
  %97 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  br label %117

; <label>:99:                                     ; preds = %31
  %100 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 0, i32 7
  %101 = load i32, i32* %100, align 4, !tbaa !27
  %102 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 8
  %103 = load i32, i32* %102, align 8, !tbaa !50
  %104 = mul nsw i32 %103, %101
  %105 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 6
  %106 = load i32, i32* %105, align 8, !tbaa !51
  %107 = sub nsw i32 %104, %106
  %108 = icmp sgt i32 %36, %107
  br i1 %108, label %109, label %110

; <label>:109:                                    ; preds = %99
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([276 x i8], [276 x i8]* @.str.3, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %110

; <label>:110:                                    ; preds = %109, %99
  %111 = or i8 %35, %34
  %112 = and i8 %111, 1
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %117, label %114

; <label>:114:                                    ; preds = %110
  %115 = load i32, i32* %105, align 8, !tbaa !51
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %105, align 8, !tbaa !51
  br label %117

; <label>:117:                                    ; preds = %114, %110, %96, %.loopexit
  br i1 %26, label %118, label %122

; <label>:118:                                    ; preds = %117
  %119 = sext i32 %0 to i64
  %120 = load i64, i64* bitcast (%"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3) to i64*), align 8, !tbaa !52
  br label %127

; <label>:121:                                    ; preds = %127
  store %"struct.Halide::Runtime::Internal::work"* %131, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !52
  br label %122

; <label>:122:                                    ; preds = %121, %117
  %123 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !53
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %139, label %125

; <label>:125:                                    ; preds = %122
  %126 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  br label %145

; <label>:127:                                    ; preds = %127, %118
  %128 = phi i64 [ %120, %118 ], [ %138, %127 ]
  %129 = phi i64 [ %119, %118 ], [ %130, %127 ]
  %130 = add nsw i64 %129, -1
  %131 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %130
  %132 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %130, i32 2
  %133 = bitcast %"struct.Halide::Runtime::Internal::work"** %132 to i64*
  store i64 %128, i64* %133, align 8, !tbaa !54
  %134 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %130, i32 3
  store %"struct.Halide::Runtime::Internal::work"* %1, %"struct.Halide::Runtime::Internal::work"** %134, align 8, !tbaa !31
  %135 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %130, i32 4
  store i32 %0, i32* %135, align 8, !tbaa !32
  %136 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %1, i64 %130, i32 6
  store i32 0, i32* %136, align 8, !tbaa !51
  %137 = icmp sgt i64 %129, 1
  %138 = ptrtoint %"struct.Halide::Runtime::Internal::work"* %131 to i64
  br i1 %137, label %127, label %121

; <label>:139:                                    ; preds = %122
  %140 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !55
  %141 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %142 = icmp slt i32 %140, %141
  %143 = icmp sgt i32 %32, %140
  %144 = or i1 %143, %142
  br i1 %144, label %145, label %147

; <label>:145:                                    ; preds = %139, %125
  %146 = phi i32 [ %126, %125 ], [ %141, %139 ]
  br label %147

; <label>:147:                                    ; preds = %145, %139
  %148 = phi i32 [ %146, %145 ], [ %32, %139 ]
  store i32 %148, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 6), align 8, !tbaa !56
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #13
  %149 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 6), align 8, !tbaa !56
  %150 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  %151 = icmp sgt i32 %149, %150
  br i1 %151, label %152, label %155

; <label>:152:                                    ; preds = %147
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9)) #13
  %153 = icmp eq i8 %33, 0
  br i1 %153, label %155, label %154

; <label>:154:                                    ; preds = %152
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  br label %155

; <label>:155:                                    ; preds = %154, %152, %147
  %156 = or i8 %35, %34
  %157 = and i8 %156, 1
  %158 = icmp eq i8 %157, 0
  br i1 %158, label %167, label %159

; <label>:159:                                    ; preds = %155
  br i1 %37, label %164, label %160

; <label>:160:                                    ; preds = %159
  %161 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %2, i64 0, i32 6
  %162 = load i32, i32* %161, align 8, !tbaa !51
  %163 = add nsw i32 %162, -1
  store i32 %163, i32* %161, align 8, !tbaa !51
  br label %167

; <label>:164:                                    ; preds = %159
  %165 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  %166 = add nsw i32 %165, -1
  store i32 %166, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  br label %167

; <label>:167:                                    ; preds = %164, %160, %155
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 8
  %3 = icmp ne %"struct.Halide::Runtime::Internal::work"* %0, null
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 0, i32 6
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 9
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 3
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 5
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %0, i64 0, i32 11
  br label %9

; <label>:9:                                      ; preds = %.backedge, %1
  br i1 %3, label %10, label %13

; <label>:10:                                     ; preds = %9
  %11 = load i32, i32* %4, align 8, !tbaa !22
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %16, label %21

; <label>:13:                                     ; preds = %9
  %14 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 14), align 8, !tbaa !57, !range !14
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %19, label %400

; <label>:16:                                     ; preds = %10
  %17 = load i32, i32* %2, align 8, !tbaa !50
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %400, label %21

; <label>:19:                                     ; preds = %13
  %20 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !52
  br label %49

; <label>:21:                                     ; preds = %16, %10
  %22 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !52
  %23 = load i32, i32* %5, align 4, !tbaa !34
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %41, label %25

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %2, align 8, !tbaa !50
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %49

; <label>:28:                                     ; preds = %25
  %29 = icmp eq %"struct.Halide::Runtime::Internal::work"* %22, %0
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %22, i64 0, i32 2
  br i1 %29, label %.loopexit12, label %.preheader154

.preheader154:                                    ; preds = %28
  br label %31

; <label>:31:                                     ; preds = %31, %.preheader154
  %32 = phi %"struct.Halide::Runtime::Internal::work"** [ %35, %31 ], [ %30, %.preheader154 ]
  %33 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %32, align 8, !tbaa !54
  %34 = icmp eq %"struct.Halide::Runtime::Internal::work"* %33, %0
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %33, i64 0, i32 2
  br i1 %34, label %.loopexit12, label %31

.loopexit12:                                      ; preds = %31, %28
  %36 = phi %"struct.Halide::Runtime::Internal::work"** [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), %28 ], [ %32, %31 ]
  %37 = phi %"struct.Halide::Runtime::Internal::work"** [ %30, %28 ], [ %35, %31 ]
  %38 = bitcast %"struct.Halide::Runtime::Internal::work"** %37 to i64*
  %39 = load i64, i64* %38, align 8, !tbaa !54
  %40 = bitcast %"struct.Halide::Runtime::Internal::work"** %36 to i64*
  store i64 %39, i64* %40, align 8, !tbaa !7
  store i32 0, i32* %4, align 8, !tbaa !22
  br label %.backedge

; <label>:41:                                     ; preds = %21
  %42 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %7, align 8, !tbaa !33
  %43 = icmp eq %"struct.Halide::Runtime::Internal::work"* %42, null
  br i1 %43, label %49, label %44

; <label>:44:                                     ; preds = %41
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %42, i64 0, i32 9
  %46 = load i32, i32* %45, align 4, !tbaa !34
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %49, label %48

; <label>:48:                                     ; preds = %44
  store i32 %46, i32* %5, align 4, !tbaa !34
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  br label %.backedge

; <label>:49:                                     ; preds = %44, %41, %25, %19
  %50 = phi %"struct.Halide::Runtime::Internal::work"* [ %22, %44 ], [ %22, %41 ], [ %22, %25 ], [ %20, %19 ]
  %51 = icmp eq %"struct.Halide::Runtime::Internal::work"* %50, null
  br i1 %51, label %.loopexit9, label %52

; <label>:52:                                     ; preds = %49
  br i1 %3, label %.preheader149, label %.preheader151

.preheader151:                                    ; preds = %52
  br label %127

.preheader149:                                    ; preds = %52
  br label %53

; <label>:53:                                     ; preds = %.loopexit3, %.preheader149
  %54 = phi %"struct.Halide::Runtime::Internal::work"* [ %125, %.loopexit3 ], [ %50, %.preheader149 ]
  %55 = phi %"struct.Halide::Runtime::Internal::work"** [ %124, %.loopexit3 ], [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), %.preheader149 ]
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 5
  %57 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %56, align 8, !tbaa !33
  %58 = icmp eq %"struct.Halide::Runtime::Internal::work"* %57, null
  br i1 %58, label %74, label %59

; <label>:59:                                     ; preds = %53
  %60 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %57, i64 0, i32 8
  %61 = load i32, i32* %60, align 8, !tbaa !50
  %62 = icmp eq i32 %61, 0
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %57, i64 0, i32 0, i32 7
  %64 = load i32, i32* %63, align 4, !tbaa !27
  br i1 %62, label %70, label %65

; <label>:65:                                     ; preds = %59
  %66 = mul nsw i32 %64, %61
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %57, i64 0, i32 6
  %68 = load i32, i32* %67, align 8, !tbaa !51
  %69 = sub nsw i32 %66, %68
  br label %79

; <label>:70:                                     ; preds = %59
  %71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %57, i64 0, i32 6
  %72 = load i32, i32* %71, align 8, !tbaa !51
  %73 = sub nsw i32 %64, %72
  br label %79

; <label>:74:                                     ; preds = %53
  %75 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %76 = add nsw i32 %75, 1
  %77 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  %78 = sub i32 %76, %77
  br label %79

; <label>:79:                                     ; preds = %74, %70, %65
  %80 = phi i32 [ %78, %74 ], [ %73, %70 ], [ %69, %65 ]
  %81 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 0, i32 7
  %82 = load i32, i32* %81, align 4, !tbaa !27
  %83 = icmp slt i32 %80, %82
  %84 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 3
  %85 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %84, align 8, !tbaa !31
  %86 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %6, align 8, !tbaa !31
  %87 = icmp ne %"struct.Halide::Runtime::Internal::work"* %85, %86
  %88 = icmp ne i32 %82, 0
  %89 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 0, i32 8
  %90 = load i8, i8* %89, align 8, !tbaa !23, !range !14
  %91 = icmp eq i8 %90, 0
  br i1 %91, label %96, label %92

; <label>:92:                                     ; preds = %79
  %93 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 8
  %94 = load i32, i32* %93, align 8, !tbaa !50
  %95 = icmp eq i32 %94, 0
  br label %96

; <label>:96:                                     ; preds = %92, %79
  %97 = phi i1 [ true, %79 ], [ %95, %92 ]
  %98 = and i1 %88, %87
  %99 = or i1 %83, %98
  %100 = xor i1 %97, true
  %101 = or i1 %99, %100
  br i1 %101, label %.loopexit3, label %102

; <label>:102:                                    ; preds = %96
  %103 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 10
  %104 = load i32, i32* %103, align 8, !tbaa !58
  %105 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 0, i32 4
  %106 = load i32, i32* %105, align 8, !tbaa !25
  %107 = icmp slt i32 %104, %106
  br i1 %107, label %108, label %.loopexit4

; <label>:108:                                    ; preds = %102
  %109 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 0, i32 3
  br label %110

; <label>:110:                                    ; preds = %119, %108
  %111 = phi i32 [ %104, %108 ], [ %121, %119 ]
  %112 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %109, align 8, !tbaa !24
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %112, i64 %113, i32 0
  %115 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %114, align 8, !tbaa !59
  %116 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %112, i64 %113, i32 1
  %117 = load i32, i32* %116, align 8, !tbaa !61
  %118 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %115, i32 %117) #12
  br i1 %118, label %119, label %.loopexit3

; <label>:119:                                    ; preds = %110
  %120 = load i32, i32* %103, align 8, !tbaa !58
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %103, align 8, !tbaa !58
  %122 = load i32, i32* %105, align 8, !tbaa !25
  %123 = icmp slt i32 %121, %122
  br i1 %123, label %110, label %.loopexit4

.loopexit3:                                       ; preds = %110, %96
  %124 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %54, i64 0, i32 2
  %125 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %124, align 8, !tbaa !54
  %126 = icmp eq %"struct.Halide::Runtime::Internal::work"* %125, null
  br i1 %126, label %.loopexit9, label %53

; <label>:127:                                    ; preds = %.loopexit5, %.preheader151
  %128 = phi %"struct.Halide::Runtime::Internal::work"* [ %192, %.loopexit5 ], [ %50, %.preheader151 ]
  %129 = phi %"struct.Halide::Runtime::Internal::work"** [ %191, %.loopexit5 ], [ getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), %.preheader151 ]
  %130 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 5
  %131 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %130, align 8, !tbaa !33
  %132 = icmp eq %"struct.Halide::Runtime::Internal::work"* %131, null
  br i1 %132, label %133, label %138

; <label>:133:                                    ; preds = %127
  %134 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %135 = add nsw i32 %134, 1
  %136 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  %137 = sub i32 %135, %136
  br label %153

; <label>:138:                                    ; preds = %127
  %139 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %131, i64 0, i32 8
  %140 = load i32, i32* %139, align 8, !tbaa !50
  %141 = icmp eq i32 %140, 0
  %142 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %131, i64 0, i32 0, i32 7
  %143 = load i32, i32* %142, align 4, !tbaa !27
  br i1 %141, label %144, label %148

; <label>:144:                                    ; preds = %138
  %145 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %131, i64 0, i32 6
  %146 = load i32, i32* %145, align 8, !tbaa !51
  %147 = sub nsw i32 %143, %146
  br label %153

; <label>:148:                                    ; preds = %138
  %149 = mul nsw i32 %143, %140
  %150 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %131, i64 0, i32 6
  %151 = load i32, i32* %150, align 8, !tbaa !51
  %152 = sub nsw i32 %149, %151
  br label %153

; <label>:153:                                    ; preds = %148, %144, %133
  %154 = phi i32 [ %137, %133 ], [ %147, %144 ], [ %152, %148 ]
  %155 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 0, i32 7
  %156 = load i32, i32* %155, align 4, !tbaa !27
  %157 = icmp slt i32 %154, %156
  %158 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 0, i32 8
  %159 = load i8, i8* %158, align 8, !tbaa !23, !range !14
  %160 = icmp eq i8 %159, 0
  br i1 %160, label %165, label %161

; <label>:161:                                    ; preds = %153
  %162 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 8
  %163 = load i32, i32* %162, align 8, !tbaa !50
  %164 = icmp eq i32 %163, 0
  br label %165

; <label>:165:                                    ; preds = %161, %153
  %166 = phi i1 [ true, %153 ], [ %164, %161 ]
  %167 = xor i1 %166, true
  %168 = or i1 %157, %167
  br i1 %168, label %.loopexit5, label %169

; <label>:169:                                    ; preds = %165
  %170 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 10
  %171 = load i32, i32* %170, align 8, !tbaa !58
  %172 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 0, i32 4
  %173 = load i32, i32* %172, align 8, !tbaa !25
  %174 = icmp slt i32 %171, %173
  br i1 %174, label %175, label %.loopexit4

; <label>:175:                                    ; preds = %169
  %176 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 0, i32 3
  br label %177

; <label>:177:                                    ; preds = %186, %175
  %178 = phi i32 [ %171, %175 ], [ %188, %186 ]
  %179 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %176, align 8, !tbaa !24
  %180 = sext i32 %178 to i64
  %181 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %179, i64 %180, i32 0
  %182 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %181, align 8, !tbaa !59
  %183 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %179, i64 %180, i32 1
  %184 = load i32, i32* %183, align 8, !tbaa !61
  %185 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %182, i32 %184) #12
  br i1 %185, label %186, label %.loopexit5

; <label>:186:                                    ; preds = %177
  %187 = load i32, i32* %170, align 8, !tbaa !58
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %170, align 8, !tbaa !58
  %189 = load i32, i32* %172, align 8, !tbaa !25
  %190 = icmp slt i32 %188, %189
  br i1 %190, label %177, label %.loopexit4

.loopexit5:                                       ; preds = %177, %165
  %191 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %128, i64 0, i32 2
  %192 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %191, align 8, !tbaa !54
  %193 = icmp eq %"struct.Halide::Runtime::Internal::work"* %192, null
  br i1 %193, label %.loopexit9, label %127

.loopexit9:                                       ; preds = %.loopexit5, %.loopexit3, %49
  br i1 %3, label %194, label %199

; <label>:194:                                    ; preds = %.loopexit9
  %195 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !53
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !53
  store i8 1, i8* %8, align 4, !tbaa !62
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  store i8 0, i8* %8, align 4, !tbaa !62
  %197 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !53
  %198 = add nsw i32 %197, -1
  store i32 %198, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 12), align 4, !tbaa !53
  br label %.backedge

; <label>:199:                                    ; preds = %.loopexit9
  %200 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !55
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !55
  %202 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  %203 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 6), align 8, !tbaa !56
  %204 = icmp sgt i32 %202, %203
  br i1 %204, label %205, label %209

; <label>:205:                                    ; preds = %199
  %206 = add nsw i32 %202, -1
  store i32 %206, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %207 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 5), align 4, !tbaa !49
  br label %210

; <label>:209:                                    ; preds = %199
  tail call void @halide_cond_wait(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8), %struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %210

; <label>:210:                                    ; preds = %209, %205
  %211 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !55
  %212 = add nsw i32 %211, -1
  store i32 %212, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 11), align 8, !tbaa !55
  br label %.backedge

.loopexit4:                                       ; preds = %186, %169, %119, %102
  %.sink147 = phi %"struct.Halide::Runtime::Internal::work"* [ %54, %119 ], [ %128, %186 ], [ %54, %102 ], [ %128, %169 ]
  %213 = phi i32* [ %103, %119 ], [ %170, %186 ], [ %103, %102 ], [ %170, %169 ]
  %214 = phi %"struct.Halide::Runtime::Internal::work"** [ %55, %119 ], [ %129, %186 ], [ %55, %102 ], [ %129, %169 ]
  %215 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 5
  %216 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 7
  store i32 0, i32* %213, align 8, !tbaa !58
  %217 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 8
  %218 = load i32, i32* %217, align 8, !tbaa !50
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %217, align 8, !tbaa !50
  %220 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %215, align 8, !tbaa !33
  %221 = icmp eq %"struct.Halide::Runtime::Internal::work"* %220, null
  %222 = load i32, i32* %216, align 4, !tbaa !27
  br i1 %221, label %223, label %226

; <label>:223:                                    ; preds = %.loopexit4
  %224 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  %225 = add nsw i32 %224, %222
  store i32 %225, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  br label %230

; <label>:226:                                    ; preds = %.loopexit4
  %227 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %220, i64 0, i32 6
  %228 = load i32, i32* %227, align 8, !tbaa !51
  %229 = add nsw i32 %228, %222
  store i32 %229, i32* %227, align 8, !tbaa !51
  br label %230

; <label>:230:                                    ; preds = %226, %223
  %231 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 8
  %232 = load i8, i8* %231, align 8, !tbaa !23, !range !14
  %233 = icmp eq i8 %232, 0
  br i1 %233, label %309, label %234

; <label>:234:                                    ; preds = %230
  %235 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 2
  %236 = bitcast %"struct.Halide::Runtime::Internal::work"** %235 to i64*
  %237 = load i64, i64* %236, align 8, !tbaa !54
  %238 = bitcast %"struct.Halide::Runtime::Internal::work"** %214 to i64*
  store i64 %237, i64* %238, align 8, !tbaa !7
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %239 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 6
  %240 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 10
  %241 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 4
  %242 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 3
  %243 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 7
  %244 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 0
  %245 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 5
  %246 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 1
  %247 = bitcast %"struct.Halide::Runtime::Internal::work"* %.sink147 to i8*
  br label %248

; <label>:248:                                    ; preds = %.loopexit2, %234
  %249 = phi i32 [ 1, %234 ], [ 0, %.loopexit2 ]
  %250 = phi i32 [ 0, %234 ], [ %294, %.loopexit2 ]
  %251 = load i32, i32* %239, align 8, !tbaa !22
  %252 = sub nsw i32 %251, %250
  %253 = icmp sgt i32 %252, %249
  br i1 %253, label %254, label %.loopexit

; <label>:254:                                    ; preds = %248
  %255 = load i32, i32* %240, align 8, !tbaa !58
  %256 = load i32, i32* %241, align 8, !tbaa !25
  br label %257

; <label>:257:                                    ; preds = %279, %254
  %258 = phi i32 [ %251, %254 ], [ %280, %279 ]
  %259 = phi i32 [ %256, %254 ], [ %281, %279 ]
  %260 = phi i32 [ %255, %254 ], [ 0, %279 ]
  %261 = phi i32 [ %249, %254 ], [ %282, %279 ]
  %262 = icmp slt i32 %260, %259
  br i1 %262, label %.preheader, label %279

.preheader:                                       ; preds = %257
  br label %263

; <label>:263:                                    ; preds = %272, %.preheader
  %264 = phi i32 [ %274, %272 ], [ %260, %.preheader ]
  %265 = load %struct.halide_semaphore_acquire_t*, %struct.halide_semaphore_acquire_t** %242, align 8, !tbaa !24
  %266 = sext i32 %264 to i64
  %267 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %265, i64 %266, i32 0
  %268 = load %struct.halide_semaphore_t*, %struct.halide_semaphore_t** %267, align 8, !tbaa !59
  %269 = getelementptr inbounds %struct.halide_semaphore_acquire_t, %struct.halide_semaphore_acquire_t* %265, i64 %266, i32 1
  %270 = load i32, i32* %269, align 8, !tbaa !61
  %271 = tail call zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t* %268, i32 %270) #12
  br i1 %271, label %272, label %.loopexit

; <label>:272:                                    ; preds = %263
  %273 = load i32, i32* %240, align 8, !tbaa !58
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* %240, align 8, !tbaa !58
  %275 = load i32, i32* %241, align 8, !tbaa !25
  %276 = icmp slt i32 %274, %275
  br i1 %276, label %263, label %277

; <label>:277:                                    ; preds = %272
  %278 = load i32, i32* %239, align 8, !tbaa !22
  br label %279

; <label>:279:                                    ; preds = %277, %257
  %280 = phi i32 [ %278, %277 ], [ %258, %257 ]
  %281 = phi i32 [ %275, %277 ], [ %259, %257 ]
  store i32 0, i32* %240, align 8, !tbaa !58
  %282 = add nuw nsw i32 %261, 1
  %283 = sub nsw i32 %280, %250
  %284 = icmp sgt i32 %283, %282
  br i1 %284, label %257, label %.loopexit2

.loopexit:                                        ; preds = %263, %248
  %285 = phi i32 [ %249, %248 ], [ %261, %263 ]
  %286 = icmp eq i32 %285, 0
  br i1 %286, label %296, label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit, %279
  %287 = phi i32 [ %285, %.loopexit ], [ %282, %279 ]
  %288 = load i8*, i8** %243, align 8, !tbaa !30
  %289 = load i32 (i8*, i32, i32, i8*, i8*)*, i32 (i8*, i32, i32, i8*, i8*)** %244, align 8, !tbaa !17
  %290 = load i32, i32* %245, align 4, !tbaa !21
  %291 = add nsw i32 %290, %250
  %292 = load i8*, i8** %246, align 8, !tbaa !26
  %293 = tail call i32 @halide_do_loop_task(i8* %288, i32 (i8*, i32, i32, i8*, i8*)* %289, i32 %291, i32 %287, i8* %292, i8* nonnull %247) #13
  %294 = add nuw nsw i32 %287, %250
  %295 = icmp eq i32 %293, 0
  br i1 %295, label %248, label %296

; <label>:296:                                    ; preds = %.loopexit2, %.loopexit
  %297 = phi i32 [ %250, %.loopexit ], [ %294, %.loopexit2 ]
  %298 = phi i32 [ 0, %.loopexit ], [ %293, %.loopexit2 ]
  %299 = phi i1 [ true, %.loopexit ], [ false, %.loopexit2 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %300 = load i32, i32* %245, align 4, !tbaa !21
  %301 = add nsw i32 %300, %297
  store i32 %301, i32* %245, align 4, !tbaa !21
  %302 = load i32, i32* %239, align 8, !tbaa !22
  %303 = sub nsw i32 %302, %297
  store i32 %303, i32* %239, align 8, !tbaa !22
  br i1 %299, label %305, label %304

; <label>:304:                                    ; preds = %296
  store i32 0, i32* %239, align 8, !tbaa !22
  br label %340

; <label>:305:                                    ; preds = %296
  %306 = icmp sgt i32 %303, 0
  br i1 %306, label %307, label %.loopexit7

; <label>:307:                                    ; preds = %305
  %308 = load i64, i64* bitcast (%"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3) to i64*), align 8, !tbaa !52
  store i64 %308, i64* %236, align 8, !tbaa !54
  store %"struct.Halide::Runtime::Internal::work"* %.sink147, %"struct.Halide::Runtime::Internal::work"** getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 3), align 8, !tbaa !52
  br label %.loopexit7

; <label>:309:                                    ; preds = %230
  %310 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 0
  %311 = load i32 (i8*, i32, i32, i8*, i8*)*, i32 (i8*, i32, i32, i8*, i8*)** %310, align 8
  %312 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 1
  %313 = load i8*, i8** %312, align 8
  %314 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 5
  %315 = load i32, i32* %314, align 4
  %316 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 1
  %317 = load i32 (i8*, i32, i8*)*, i32 (i8*, i32, i8*)** %316, align 8
  %318 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 7
  %319 = load i8*, i8** %318, align 8
  %320 = add nsw i32 %315, 1
  store i32 %320, i32* %314, align 4, !tbaa !21
  %321 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 6
  %322 = load i32, i32* %321, align 8, !tbaa !22
  %323 = add nsw i32 %322, -1
  store i32 %323, i32* %321, align 8, !tbaa !22
  %324 = icmp eq i32 %323, 0
  br i1 %324, label %325, label %330

; <label>:325:                                    ; preds = %309
  %326 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 2
  %327 = bitcast %"struct.Halide::Runtime::Internal::work"** %326 to i64*
  %328 = load i64, i64* %327, align 8, !tbaa !54
  %329 = bitcast %"struct.Halide::Runtime::Internal::work"** %214 to i64*
  store i64 %328, i64* %329, align 8, !tbaa !7
  br label %330

; <label>:330:                                    ; preds = %325, %309
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %331 = icmp eq i32 (i8*, i32, i8*)* %317, null
  br i1 %331, label %334, label %332

; <label>:332:                                    ; preds = %330
  %333 = tail call i32 @halide_do_task(i8* %319, i32 (i8*, i32, i8*)* nonnull %317, i32 %315, i8* %313) #13
  br label %337

; <label>:334:                                    ; preds = %330
  %335 = bitcast %"struct.Halide::Runtime::Internal::work"* %.sink147 to i8*
  %336 = tail call i32 @halide_do_loop_task(i8* %319, i32 (i8*, i32, i32, i8*, i8*)* %311, i32 %315, i32 1, i8* %313, i8* %335) #13
  br label %337

; <label>:337:                                    ; preds = %334, %332
  %338 = phi i32 [ %333, %332 ], [ %336, %334 ]
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %339 = icmp eq i32 %338, 0
  br i1 %339, label %.loopexit7, label %340

; <label>:340:                                    ; preds = %337, %304
  %341 = phi i32 [ %298, %304 ], [ %338, %337 ]
  %342 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 9
  store i32 %341, i32* %342, align 4, !tbaa !34
  %343 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 4
  %344 = load i32, i32* %343, align 8, !tbaa !32
  %345 = icmp sgt i32 %344, 0
  br i1 %345, label %346, label %.loopexit7

; <label>:346:                                    ; preds = %340
  %347 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 3
  %348 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %347, align 8, !tbaa !31
  %349 = sext i32 %344 to i64
  br label %350

; <label>:350:                                    ; preds = %366, %346
  %351 = phi i64 [ 0, %346 ], [ %368, %366 ]
  %352 = phi i8 [ 0, %346 ], [ %367, %366 ]
  %353 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %348, i64 %351, i32 9
  %354 = load i32, i32* %353, align 4, !tbaa !34
  %355 = icmp eq i32 %354, 0
  br i1 %355, label %356, label %366

; <label>:356:                                    ; preds = %350
  store i32 %341, i32* %353, align 4, !tbaa !34
  %357 = load i32, i32* %217, align 8, !tbaa !50
  %358 = icmp eq i32 %357, 0
  br i1 %358, label %359, label %362

; <label>:359:                                    ; preds = %356
  %360 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %348, i64 %351, i32 11
  %361 = load i8, i8* %360, align 4, !tbaa !62, !range !14
  br label %362

; <label>:362:                                    ; preds = %359, %356
  %363 = phi i8 [ 0, %356 ], [ %361, %359 ]
  %364 = and i8 %352, 1
  %365 = or i8 %363, %364
  br label %366

; <label>:366:                                    ; preds = %362, %350
  %367 = phi i8 [ %365, %362 ], [ %352, %350 ]
  %368 = add nuw nsw i64 %351, 1
  %exitcond = icmp eq i64 %368, %349
  br i1 %exitcond, label %.loopexit7, label %350

.loopexit7:                                       ; preds = %366, %340, %337, %307, %305
  %369 = phi i8 [ 0, %337 ], [ 0, %305 ], [ 0, %307 ], [ 0, %340 ], [ %367, %366 ]
  %370 = load %"struct.Halide::Runtime::Internal::work"*, %"struct.Halide::Runtime::Internal::work"** %215, align 8, !tbaa !33
  %371 = icmp eq %"struct.Halide::Runtime::Internal::work"* %370, null
  %372 = load i32, i32* %216, align 4, !tbaa !27
  br i1 %371, label %373, label %376

; <label>:373:                                    ; preds = %.loopexit7
  %374 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  %375 = sub nsw i32 %374, %372
  store i32 %375, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 16), align 4, !tbaa !48
  br label %380

; <label>:376:                                    ; preds = %.loopexit7
  %377 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %370, i64 0, i32 6
  %378 = load i32, i32* %377, align 8, !tbaa !51
  %379 = sub nsw i32 %378, %372
  store i32 %379, i32* %377, align 8, !tbaa !51
  br label %380

; <label>:380:                                    ; preds = %376, %373
  %381 = load i32, i32* %217, align 8, !tbaa !50
  %382 = add nsw i32 %381, -1
  store i32 %382, i32* %217, align 8, !tbaa !50
  %383 = and i8 %369, 1
  %384 = icmp eq i8 %383, 0
  br i1 %384, label %385, label %399

; <label>:385:                                    ; preds = %380
  %386 = icmp eq i32 %382, 0
  br i1 %386, label %387, label %.backedge

; <label>:387:                                    ; preds = %385
  %388 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 0, i32 6
  %389 = load i32, i32* %388, align 8, !tbaa !22
  %390 = icmp eq i32 %389, 0
  br i1 %390, label %395, label %391

; <label>:391:                                    ; preds = %387
  %392 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 9
  %393 = load i32, i32* %392, align 4, !tbaa !34
  %394 = icmp eq i32 %393, 0
  br i1 %394, label %.backedge, label %395

; <label>:395:                                    ; preds = %391, %387
  %396 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %.sink147, i64 0, i32 11
  %397 = load i8, i8* %396, align 4, !tbaa !62, !range !14
  %398 = icmp eq i8 %397, 0
  br i1 %398, label %.backedge, label %399

; <label>:399:                                    ; preds = %395, %380
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  br label %.backedge

.backedge:                                        ; preds = %399, %395, %391, %385, %210, %194, %48, %.loopexit12
  br label %9

; <label>:400:                                    ; preds = %16, %13
  ret void
}

; Function Attrs: nounwind
define weak void @halide_mutex_unlock(%struct.halide_mutex*) local_unnamed_addr #0 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %3 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = cmpxchg weak i64* %3, i64 1, i64 0 release monotonic
  %5 = extractvalue { i64, i1 } %4, 1
  br i1 %5, label %19, label %6

; <label>:6:                                      ; preds = %1
  %7 = cmpxchg i64* %3, i64 1, i64 0 release monotonic
  %8 = extractvalue { i64, i1 } %7, 1
  br i1 %8, label %19, label %9

; <label>:9:                                      ; preds = %6
  %10 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %10) #10
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 0
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %12, align 8, !tbaa !35
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 2
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %14, align 8, !tbaa !37
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 1
  store i64* %3, i64** %15, align 8, !tbaa !38
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %11, align 8, !tbaa !40
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %13, align 8, !tbaa !41
  %16 = ptrtoint %struct.halide_mutex* %0 to i64
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0
  %18 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %16, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %17) #12
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %10) #10
  br label %19

; <label>:19:                                     ; preds = %9, %6, %1
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv(i8*) #2 {
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb(i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* dereferenceable(16), i1 zeroext, i1 zeroext) #2 {
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE(i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* dereferenceable(16)) #2 {
  %3 = getelementptr inbounds i8, i8* %0, i64 32
  %4 = bitcast i8* %3 to i64**
  %5 = load i64*, i64** %4, align 8, !tbaa !38
  %6 = load atomic i64, i64* %5 monotonic, align 8
  %7 = icmp eq i64 %6, 3
  ret i1 %7
}

; Function Attrs: norecurse nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib(i8*, i32, i1 zeroext) #2 {
  %4 = select i1 %2, i64 2, i64 0
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to i64**
  %7 = load i64*, i64** %6, align 8, !tbaa !38
  store atomic i64 %4, i64* %7 release, align 8
  ret i64 0
}

; Function Attrs: nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* dereferenceable(32)) local_unnamed_addr #0 {
  %3 = tail call dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %0) #13
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 1
  %5 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %4, align 8, !tbaa !7
  %6 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %5, null
  br i1 %6, label %.loopexit, label %.preheader33

.preheader33:                                     ; preds = %2
  br label %9

; <label>:7:                                      ; preds = %9
  %8 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %17, null
  br i1 %8, label %.loopexit, label %9

; <label>:9:                                      ; preds = %7, %.preheader33
  %10 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %17, %7 ], [ %5, %.preheader33 ]
  %11 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %10, %7 ], [ null, %.preheader33 ]
  %12 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %16, %7 ], [ %4, %.preheader33 ]
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 1
  %14 = load atomic i64, i64* %13 monotonic, align 8
  %15 = icmp eq i64 %14, %0
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 2
  %17 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %16, align 8, !tbaa !63
  br i1 %15, label %18, label %7

; <label>:18:                                     ; preds = %9
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %17, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %12, align 8, !tbaa !7
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 2
  %20 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %19, align 8, !tbaa !69
  %21 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %20, %10
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %18
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %11, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %19, align 8, !tbaa !69
  br label %37

; <label>:23:                                     ; preds = %18
  %24 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %17, null
  br i1 %24, label %37, label %.preheader

.preheader:                                       ; preds = %23
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader
  %26 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %31, %25 ], [ %17, %.preheader ]
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %26, i64 0, i32 1
  %28 = load atomic i64, i64* %27 monotonic, align 8
  %29 = icmp eq i64 %28, %0
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %26, i64 0, i32 2
  %31 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %30, align 8, !tbaa !63
  %32 = icmp ne %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %31, null
  %33 = xor i1 %29, true
  %34 = and i1 %32, %33
  br i1 %34, label %25, label %35

; <label>:35:                                     ; preds = %25
  %36 = zext i1 %29 to i8
  br label %37

; <label>:37:                                     ; preds = %35, %23, %22
  %38 = phi i8 [ 0, %22 ], [ %36, %35 ], [ 0, %23 ]
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 2
  %40 = load i64 (i8*, i32, i1)*, i64 (i8*, i32, i1)** %39, align 8, !tbaa !41
  %41 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1 to i8*
  %42 = icmp ne i8 %38, 0
  %43 = tail call i64 %40(i8* nonnull %41, i32 1, i1 zeroext %42) #12
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 3
  store i64 %43, i64* %44, align 8, !tbaa !72
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 0, i32 0
  %46 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %45) #12
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %48 = atomicrmw and i64* %47, i64 -2 release
  %49 = and i64 %48, 2
  %50 = icmp eq i64 %49, 0
  %51 = icmp ugt i64 %48, 3
  %52 = and i1 %51, %50
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %37
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %54) #12
  br label %55

; <label>:55:                                     ; preds = %53, %37
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 0, i32 2
  store i8 0, i8* %56, align 8, !tbaa !73
  %57 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %10, i64 0, i32 0, i32 1
  %58 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %57) #12
  %59 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %45) #12
  %60 = zext i8 %38 to i64
  br label %73

.loopexit:                                        ; preds = %7, %2
  %61 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 2
  %62 = load i64 (i8*, i32, i1)*, i64 (i8*, i32, i1)** %61, align 8, !tbaa !41
  %63 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1 to i8*
  %64 = tail call i64 %62(i8* nonnull %63, i32 0, i1 zeroext false) #12
  %65 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %66 = atomicrmw and i64* %65, i64 -2 release
  %67 = and i64 %66, 2
  %68 = icmp eq i64 %67, 0
  %69 = icmp ugt i64 %66, 3
  %70 = and i1 %69, %68
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %.loopexit
  %72 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %72) #12
  br label %73

; <label>:73:                                     ; preds = %71, %.loopexit, %55
  %74 = phi i64 [ %60, %55 ], [ 0, %.loopexit ], [ 0, %71 ]
  ret i64 %74
}

; Function Attrs: nounwind
define linkonce dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64) local_unnamed_addr #0 {
  %2 = mul i64 %0, -7046029254386353131
  %3 = lshr i64 %2, 54
  %4 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %3
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4, i64 0, i32 0, i32 0
  %6 = cmpxchg weak i64* %5, i64 0, i64 1 acquire monotonic
  %7 = extractvalue { i64, i1 } %6, 1
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %9) #12
  br label %10

; <label>:10:                                     ; preds = %8, %1
  ret %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %4
}

declare i32 @pthread_mutex_lock(%struct.pthread_mutex_t*) local_unnamed_addr #4

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"*) local_unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %0, i64 0, i32 0
  %3 = load atomic i64, i64* %2 monotonic, align 8
  %4 = and i64 %3, 2
  %5 = icmp ne i64 %4, 0
  %6 = icmp ult i64 %3, 4
  %7 = or i1 %6, %5
  br i1 %7, label %.loopexit2, label %.preheader74

.preheader74:                                     ; preds = %1
  br label %8

; <label>:8:                                      ; preds = %13, %.preheader74
  %9 = phi i64 [ %14, %13 ], [ %3, %.preheader74 ]
  %10 = or i64 %9, 2
  %11 = cmpxchg weak i64* %2, i64 %9, i64 %10 acquire monotonic
  %12 = extractvalue { i64, i1 } %11, 1
  br i1 %12, label %.preheader72, label %13

.preheader72:                                     ; preds = %8
  br label %19

; <label>:13:                                     ; preds = %8
  %14 = extractvalue { i64, i1 } %11, 0
  %15 = and i64 %14, 2
  %16 = icmp ne i64 %15, 0
  %17 = icmp ult i64 %14, 4
  %18 = or i1 %17, %16
  br i1 %18, label %.loopexit2, label %8

; <label>:19:                                     ; preds = %.backedge, %.preheader72
  %20 = phi i64 [ %9, %.preheader72 ], [ %.be, %.backedge ]
  %21 = and i64 %20, -4
  %22 = inttoptr i64 %21 to %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %22, i64 0, i32 3
  %24 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %23, align 8, !tbaa !74
  %25 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %24, null
  br i1 %25, label %.preheader71, label %.loopexit1

.preheader71:                                     ; preds = %19
  br label %26

; <label>:26:                                     ; preds = %32, %.preheader71
  %27 = phi %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* [ %29, %32 ], [ %22, %.preheader71 ]
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %27, i64 0, i32 1
  %29 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %28, align 8, !tbaa !76
  %30 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %29, null
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %26
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.5, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %32

; <label>:32:                                     ; preds = %31, %26
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %29, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %27, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %33, align 8, !tbaa !77
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %29, i64 0, i32 3
  %35 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %34, align 8, !tbaa !74
  %36 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %35, null
  br i1 %36, label %26, label %.loopexit1

.loopexit1:                                       ; preds = %32, %19
  %37 = phi %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* [ %24, %19 ], [ %35, %32 ]
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %37, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %23, align 8, !tbaa !74
  %38 = and i64 %20, 1
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %46, label %40

; <label>:40:                                     ; preds = %.loopexit1
  %41 = and i64 %20, -3
  %42 = cmpxchg weak i64* %2, i64 %20, i64 %41 acq_rel monotonic
  %43 = extractvalue { i64, i1 } %42, 1
  br i1 %43, label %.loopexit2, label %44

; <label>:44:                                     ; preds = %40
  %45 = extractvalue { i64, i1 } %42, 0
  fence acquire
  br label %.backedge

; <label>:46:                                     ; preds = %.loopexit1
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %37, i64 0, i32 2
  %48 = load %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %47, align 8, !tbaa !77
  %49 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %48, null
  br i1 %49, label %50, label %62

; <label>:50:                                     ; preds = %46
  %51 = cmpxchg weak i64* %2, i64 %20, i64 0 acq_rel monotonic
  %52 = extractvalue { i64, i1 } %51, 1
  br i1 %52, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %50
  br label %57

; <label>:53:                                     ; preds = %57
  %54 = and i64 %59, 1
  %55 = cmpxchg weak i64* %2, i64 %59, i64 %54 acq_rel monotonic
  %56 = extractvalue { i64, i1 } %55, 1
  br i1 %56, label %.loopexit, label %57

; <label>:57:                                     ; preds = %53, %.preheader
  %58 = phi { i64, i1 } [ %55, %53 ], [ %51, %.preheader ]
  %59 = extractvalue { i64, i1 } %58, 0
  %60 = icmp ult i64 %59, 4
  br i1 %60, label %53, label %61

; <label>:61:                                     ; preds = %57
  fence acquire
  br label %.backedge

.backedge:                                        ; preds = %61, %44
  %.be = phi i64 [ %45, %44 ], [ %59, %61 ]
  br label %19

; <label>:62:                                     ; preds = %46
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %48, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %23, align 8, !tbaa !74
  %63 = atomicrmw and i64* %2, i64 -3 release
  br label %.loopexit

.loopexit:                                        ; preds = %62, %53, %50
  %64 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %37, i64 0, i32 0, i32 0
  %65 = tail call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %64) #12
  %66 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %37, i64 0, i32 0, i32 2
  store i8 0, i8* %66, align 8, !tbaa !73
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %37, i64 0, i32 0, i32 1
  %68 = tail call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %67) #12
  %69 = tail call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %64) #12
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit, %40, %13, %1
  ret void
}

declare i32 @pthread_cond_signal(%struct.pthread_mutex_t*) local_unnamed_addr #4

declare i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*) local_unnamed_addr #4

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"*) local_unnamed_addr #0 align 2 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", align 8
  %3 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %0, i64 0, i32 0
  %4 = load atomic i64, i64* %3 monotonic, align 8
  %5 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2 to i8*
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2, i64 0, i32 0, i32 2
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2, i64 0, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2, i64 0, i32 0, i32 1
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2, i64 0, i32 1
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data", %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2, i64 0, i32 3
  %11 = ptrtoint %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2 to i64
  %12 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %9 to i8*
  br label %13

; <label>:13:                                     ; preds = %.backedge, %1
  %14 = phi i64 [ %4, %1 ], [ %.be, %.backedge ]
  %15 = phi i32 [ 40, %1 ], [ %.be5, %.backedge ]
  br label %16

; <label>:16:                                     ; preds = %20, %13
  %17 = phi i64 [ %24, %20 ], [ %14, %13 ]
  %18 = and i64 %17, 1
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %16
  %21 = or i64 %17, 1
  %22 = cmpxchg weak i64* %3, i64 %17, i64 %21 acquire monotonic
  %23 = extractvalue { i64, i1 } %22, 1
  %24 = extractvalue { i64, i1 } %22, 0
  br i1 %23, label %65, label %16

; <label>:25:                                     ; preds = %16
  %26 = icmp ugt i64 %17, 3
  %27 = icmp sgt i32 %15, 0
  %28 = and i1 %27, %26
  br i1 %28, label %29, label %34

; <label>:29:                                     ; preds = %25
  %30 = icmp sgt i32 %15, 1
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %29
  %32 = add nsw i32 %15, -1
  call void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() #12
  %33 = load atomic i64, i64* %3 monotonic, align 8
  br label %.backedge

; <label>:34:                                     ; preds = %29, %25
  %35 = phi i32 [ 0, %29 ], [ %15, %25 ]
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %5) #10
  store i8 0, i8* %6, align 8, !tbaa !73
  %36 = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %7, i8* null) #12
  %37 = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %8, i8* null) #12
  call void @llvm.memset.p0i8.i64(i8* nonnull %12, i8 0, i64 24, i32 8, i1 false)
  store i8 1, i8* %6, align 8, !tbaa !73
  %38 = and i64 %17, -4
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %34
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %2, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %10, align 8, !tbaa !74
  br label %43

; <label>:41:                                     ; preds = %34
  %42 = inttoptr i64 %38 to %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"*
  store %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"* %42, %"struct.Halide::Runtime::Internal::Synchronization::word_lock_queue_data"** %9, align 8, !tbaa !76
  br label %43

; <label>:43:                                     ; preds = %41, %40
  %44 = and i64 %17, 3
  %45 = or i64 %44, %11
  %46 = cmpxchg weak i64* %3, i64 %17, i64 %45 release monotonic
  %47 = extractvalue { i64, i1 } %46, 1
  br i1 %47, label %50, label %48

; <label>:48:                                     ; preds = %43
  %49 = extractvalue { i64, i1 } %46, 0
  br label %60

; <label>:50:                                     ; preds = %43
  %51 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %7) #12
  %52 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %50
  br label %54

; <label>:54:                                     ; preds = %54, %.preheader
  %55 = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %8, %struct.pthread_mutex_t* nonnull %7) #12
  %56 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %.loopexit, label %54

.loopexit:                                        ; preds = %54, %50
  %58 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %7) #12
  %59 = load atomic i64, i64* %3 monotonic, align 8
  br label %60

; <label>:60:                                     ; preds = %.loopexit, %48
  %61 = phi i64 [ %59, %.loopexit ], [ %49, %48 ]
  %62 = phi i32 [ 40, %.loopexit ], [ %35, %48 ]
  %63 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %8) #12
  %64 = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %7) #12
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %5) #10
  br label %.backedge

.backedge:                                        ; preds = %60, %31
  %.be = phi i64 [ %61, %60 ], [ %33, %31 ]
  %.be5 = phi i32 [ %62, %60 ], [ %32, %31 ]
  br label %13

; <label>:65:                                     ; preds = %20
  ret void
}

declare i32 @pthread_mutex_init(%struct.pthread_mutex_t*, i8*) local_unnamed_addr #4

declare i32 @pthread_cond_init(%struct.pthread_mutex_t*, i8*) local_unnamed_addr #4

declare i32 @pthread_cond_wait(%struct.pthread_mutex_t*, %struct.pthread_mutex_t*) local_unnamed_addr #4

declare i32 @pthread_cond_destroy(%struct.pthread_mutex_t*) local_unnamed_addr #4

declare i32 @pthread_mutex_destroy(%struct.pthread_mutex_t*) local_unnamed_addr #4

; Function Attrs: nounwind
define weak void @halide_cond_broadcast(%struct.halide_mutex*) local_unnamed_addr #0 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %3 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = load atomic i64, i64* %3 monotonic, align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %18, label %6

; <label>:6:                                      ; preds = %1
  %7 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %7) #10
  %8 = inttoptr i64 %4 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"*
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %10, align 8, !tbaa !35
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 2
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib, i64 (i8*, i32, i1)** %11, align 8, !tbaa !41
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 3
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 1
  store i64* %3, i64** %13, align 8, !tbaa !78
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 2
  store %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %8, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %14, align 8, !tbaa !80
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %9, align 8, !tbaa !40
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %12, align 8, !tbaa !37
  %15 = ptrtoint %struct.halide_mutex* %0 to i64
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0
  %17 = call i32 @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy(i64 %15, i64 %4, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %16, i64 0) #12
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %7) #10
  br label %18

; <label>:18:                                     ; preds = %6, %1
  ret void
}

; Function Attrs: norecurse nounwind
define weak zeroext i1 @halide_default_semaphore_try_acquire(%struct.halide_semaphore_t*, i32) #2 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %.loopexit, label %4

; <label>:4:                                      ; preds = %2
  %5 = bitcast %struct.halide_semaphore_t* %0 to i32*
  %6 = load atomic i32, i32* %5 acquire, align 4
  %7 = sub nsw i32 %6, %1
  %8 = icmp sgt i32 %7, -1
  br i1 %8, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %4
  br label %9

; <label>:9:                                      ; preds = %14, %.preheader
  %10 = phi i32 [ %16, %14 ], [ %7, %.preheader ]
  %11 = phi i32 [ %15, %14 ], [ %6, %.preheader ]
  %12 = cmpxchg weak i32* %5, i32 %11, i32 %10 acq_rel monotonic
  %13 = extractvalue { i32, i1 } %12, 1
  br i1 %13, label %.loopexit, label %14

; <label>:14:                                     ; preds = %9
  %15 = extractvalue { i32, i1 } %12, 0
  %16 = sub nsw i32 %15, %1
  %17 = icmp sgt i32 %16, -1
  br i1 %17, label %9, label %.loopexit

.loopexit:                                        ; preds = %14, %9, %4, %2
  %18 = phi i1 [ true, %2 ], [ false, %4 ], [ true, %9 ], [ false, %14 ]
  ret i1 %18
}

; Function Attrs: nounwind
define weak void @halide_cond_wait(%struct.halide_mutex*, %struct.halide_mutex*) local_unnamed_addr #0 {
  %3 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %4 = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %5 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %5) #10
  %6 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 1
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 2
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %10, align 8, !tbaa !37
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 1
  store i64* %6, i64** %11, align 8, !tbaa !81
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 2
  %13 = bitcast %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %12 to %struct.halide_mutex**
  store %struct.halide_mutex* %1, %struct.halide_mutex** %13, align 8, !tbaa !83
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %7, align 8, !tbaa !40
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv, void (i8*)** %8, align 8, !tbaa !35
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %9, align 8, !tbaa !41
  %14 = ptrtoint %struct.halide_mutex* %0 to i64
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %4, i64 0, i32 0
  %16 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %14, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %15) #12
  %17 = ptrtoint %struct.halide_mutex* %1 to i64
  %18 = icmp eq i64 %16, %17
  %19 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %1, i64 0, i32 0, i64 0
  br i1 %18, label %67, label %20

; <label>:20:                                     ; preds = %2
  %21 = cmpxchg weak i64* %19, i64 0, i64 1 acquire monotonic
  %22 = extractvalue { i64, i1 } %21, 1
  br i1 %22, label %.loopexit, label %23

; <label>:23:                                     ; preds = %20
  %24 = load atomic i64, i64* %19 monotonic, align 8
  %25 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3 to i8*
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 0
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 1
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 2
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0, i32 3
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 1
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %3, i64 0, i32 0
  br label %32

; <label>:32:                                     ; preds = %.backedge, %23
  %33 = phi i64 [ %24, %23 ], [ %.be, %.backedge ]
  %34 = phi i32 [ 40, %23 ], [ %.be5, %.backedge ]
  br label %35

; <label>:35:                                     ; preds = %39, %32
  %36 = phi i64 [ %43, %39 ], [ %33, %32 ]
  %37 = and i64 %36, 1
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %39, label %44

; <label>:39:                                     ; preds = %35
  %40 = or i64 %36, 1
  %41 = cmpxchg weak i64* %19, i64 %36, i64 %40 acquire monotonic
  %42 = extractvalue { i64, i1 } %41, 1
  %43 = extractvalue { i64, i1 } %41, 0
  br i1 %42, label %.loopexit, label %35

; <label>:44:                                     ; preds = %35
  %45 = and i64 %36, 2
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %47, label %61

; <label>:47:                                     ; preds = %44
  %48 = icmp sgt i32 %34, 0
  br i1 %48, label %49, label %54

; <label>:49:                                     ; preds = %47
  %50 = icmp eq i32 %34, 1
  br i1 %50, label %54, label %51

; <label>:51:                                     ; preds = %49
  %52 = add nsw i32 %34, -1
  call void @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv() #12
  %53 = load atomic i64, i64* %19 monotonic, align 8
  br label %.backedge

; <label>:54:                                     ; preds = %49, %47
  %55 = phi i32 [ 0, %49 ], [ %34, %47 ]
  %56 = or i64 %36, 2
  %57 = cmpxchg weak i64* %19, i64 %36, i64 %56 monotonic monotonic
  %58 = extractvalue { i64, i1 } %57, 1
  br i1 %58, label %61, label %59

; <label>:59:                                     ; preds = %54
  %60 = extractvalue { i64, i1 } %57, 0
  br label %.backedge

; <label>:61:                                     ; preds = %54, %44
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %25) #10
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %27, align 8, !tbaa !35
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %29, align 8, !tbaa !37
  store i64* %19, i64** %30, align 8, !tbaa !38
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %26, align 8, !tbaa !40
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %28, align 8, !tbaa !41
  %62 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64 %17, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %31) #12
  %63 = icmp eq i64 %62, %17
  br i1 %63, label %66, label %64

; <label>:64:                                     ; preds = %61
  %65 = load atomic i64, i64* %19 monotonic, align 8
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #10
  br label %.backedge

.backedge:                                        ; preds = %64, %59, %51
  %.be = phi i64 [ %60, %59 ], [ %65, %64 ], [ %53, %51 ]
  %.be5 = phi i32 [ %55, %59 ], [ 40, %64 ], [ %52, %51 ]
  br label %32

; <label>:66:                                     ; preds = %61
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #10
  br label %.loopexit

; <label>:67:                                     ; preds = %2
  %68 = load atomic i64, i64* %19 monotonic, align 8
  %69 = and i64 %68, 1
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %71, label %.loopexit

; <label>:71:                                     ; preds = %67
  call void @halide_print(i8* null, i8* getelementptr inbounds ([138 x i8], [138 x i8]* @.str.6, i64 0, i64 0)) #12
  call void @abort() #12
  br label %.loopexit

.loopexit:                                        ; preds = %71, %67, %66, %39, %20
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %5) #10
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_do_loop_task(i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*) local_unnamed_addr #0 {
  %7 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !7
  %8 = tail call i32 %7(i8* %0, i32 (i8*, i32, i32, i8*, i8*)* %1, i32 %2, i32 %3, i8* %4, i8* %5) #12
  ret i32 %8
}

; Function Attrs: nounwind
define weak i32 @halide_do_task(i8*, i32 (i8*, i32, i8*)*, i32, i8*) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !7
  %6 = tail call i32 %5(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i8* %3) #12
  ret i32 %6
}

; Function Attrs: norecurse nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE(i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* dereferenceable(16)) #2 {
  %3 = getelementptr inbounds i8, i8* %0, i64 32
  %4 = bitcast i8* %3 to i64**
  %5 = load i64*, i64** %4, align 8, !tbaa !81
  %6 = load atomic i64, i64* %5 monotonic, align 8
  %7 = icmp eq i64 %6, 0
  %8 = getelementptr inbounds i8, i8* %0, i64 40
  %9 = bitcast i8* %8 to i64*
  %10 = load i64, i64* %9, align 8, !tbaa !83
  br i1 %7, label %11, label %12

; <label>:11:                                     ; preds = %2
  store atomic i64 %10, i64* %5 monotonic, align 8
  br label %16

; <label>:12:                                     ; preds = %2
  %13 = icmp eq i64 %6, %10
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %12
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %1, i64 0, i32 2
  store i64 %10, i64* %15, align 8, !tbaa !84
  br label %16

; <label>:16:                                     ; preds = %14, %12, %11
  %17 = phi i1 [ false, %14 ], [ true, %12 ], [ true, %11 ]
  ret i1 %17
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv(i8*) #0 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", align 8
  %3 = getelementptr inbounds i8, i8* %0, i64 40
  %4 = bitcast i8* %3 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"**
  %5 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %4, align 8, !tbaa !83
  %6 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %5, i64 0, i32 0
  %7 = cmpxchg weak i64* %6, i64 1, i64 0 release monotonic
  %8 = extractvalue { i64, i1 } %7, 1
  br i1 %8, label %22, label %9

; <label>:9:                                      ; preds = %1
  %10 = cmpxchg i64* %6, i64 1, i64 0 release monotonic
  %11 = extractvalue { i64, i1 } %10, 1
  br i1 %11, label %22, label %12

; <label>:12:                                     ; preds = %9
  %13 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %13) #10
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 0
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %15, align 8, !tbaa !35
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 2
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %17, align 8, !tbaa !37
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 1
  store i64* %6, i64** %18, align 8, !tbaa !38
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %14, align 8, !tbaa !40
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %16, align 8, !tbaa !41
  %19 = ptrtoint %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %5 to i64
  %20 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::mutex_parking_control"* %2, i64 0, i32 0
  %21 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %19, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %20) #12
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %13) #10
  br label %22

; <label>:22:                                     ; preds = %12, %9, %1
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib(i8*, i32, i1 zeroext) #2 {
  br i1 %2, label %8, label %4

; <label>:4:                                      ; preds = %3
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to i64**
  %7 = load i64*, i64** %6, align 8, !tbaa !81
  store atomic i64 0, i64* %7 monotonic, align 8
  br label %8

; <label>:8:                                      ; preds = %4, %3
  ret i64 0
}

; Function Attrs: nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE(i64, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* dereferenceable(32)) local_unnamed_addr #0 {
  %3 = alloca %"struct.Halide::Runtime::Internal::Synchronization::queue_data", align 8
  %4 = alloca %"struct.Halide::Runtime::Internal::Synchronization::validate_action", align 8
  %5 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %5) #10
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 2
  store i8 0, i8* %6, align 8, !tbaa !73
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 0
  %8 = call i32 @pthread_mutex_init(%struct.pthread_mutex_t* nonnull %7, i8* null) #12
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 0, i32 1
  %10 = call i32 @pthread_cond_init(%struct.pthread_mutex_t* nonnull %9, i8* null) #12
  store i8 0, i8* %6, align 8, !tbaa !73
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 1
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 3
  %13 = bitcast i64* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %13, i8 0, i64 24, i32 8, i1 false)
  %14 = call dereferenceable(24) %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy(i64 %0) #13
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %4, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %15) #10
  store i8 0, i8* %15, align 8, !tbaa !86
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %4, i64 0, i32 2
  store i64 0, i64* %16, align 8, !tbaa !84
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 0
  %18 = load i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %17, align 8, !tbaa !40
  %19 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1 to i8*
  %20 = call zeroext i1 %18(i8* nonnull %19, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull dereferenceable(16) %4) #12
  br i1 %20, label %30, label %21

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0, i32 0
  %23 = atomicrmw and i64* %22, i64 -2 release
  %24 = and i64 %23, 2
  %25 = icmp eq i64 %24, 0
  %26 = icmp ugt i64 %23, 3
  %27 = and i1 %26, %25
  br i1 %27, label %28, label %62

; <label>:28:                                     ; preds = %21
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %29) #12
  br label %62

; <label>:30:                                     ; preds = %2
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %31, align 8, !tbaa !63
  store i64 %0, i64* %11, align 8, !tbaa !87
  store i8 1, i8* %6, align 8, !tbaa !73
  %32 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 1
  %33 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %32, align 8, !tbaa !88
  %34 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %33, null
  br i1 %34, label %39, label %35

; <label>:35:                                     ; preds = %30
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 2
  %37 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %36, align 8, !tbaa !69
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %37, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %38, align 8, !tbaa !63
  br label %41

; <label>:39:                                     ; preds = %30
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %32, align 8, !tbaa !88
  %40 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 2
  br label %41

; <label>:41:                                     ; preds = %39, %35
  %42 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %40, %39 ], [ %36, %35 ]
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %3, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %42, align 8, !tbaa !69
  %43 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0, i32 0
  %44 = atomicrmw and i64* %43, i64 -2 release
  %45 = and i64 %44, 2
  %46 = icmp eq i64 %45, 0
  %47 = icmp ugt i64 %44, 3
  %48 = and i1 %47, %46
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %41
  %50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %14, i64 0, i32 0
  call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* nonnull %50) #12
  br label %51

; <label>:51:                                     ; preds = %49, %41
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %1, i64 0, i32 1
  %53 = load void (i8*)*, void (i8*)** %52, align 8, !tbaa !35
  call void %53(i8* nonnull %19) #12
  %54 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %7) #12
  %55 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %56 = icmp eq i8 %55, 0
  br i1 %56, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %51
  br label %57

; <label>:57:                                     ; preds = %57, %.preheader
  %58 = call i32 @pthread_cond_wait(%struct.pthread_mutex_t* nonnull %9, %struct.pthread_mutex_t* nonnull %7) #12
  %59 = load i8, i8* %6, align 8, !tbaa !73, !range !14
  %60 = icmp eq i8 %59, 0
  br i1 %60, label %.loopexit, label %57

.loopexit:                                        ; preds = %57, %51
  %61 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %7) #12
  br label %62

; <label>:62:                                     ; preds = %.loopexit, %28, %21
  %63 = phi i64* [ %12, %.loopexit ], [ %16, %21 ], [ %16, %28 ]
  %64 = load i64, i64* %63, align 8, !tbaa !89
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %15) #10
  %65 = call i32 @pthread_cond_destroy(%struct.pthread_mutex_t* nonnull %9) #12
  %66 = call i32 @pthread_mutex_destroy(%struct.pthread_mutex_t* nonnull %7) #12
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %5) #10
  ret i64 %64
}

; Function Attrs: norecurse nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib(i8*, i32, i1 zeroext) #2 {
  ret i64 0
}

; Function Attrs: norecurse nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE(i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* dereferenceable(16)) #2 {
  %3 = getelementptr inbounds i8, i8* %0, i64 32
  %4 = bitcast i8* %3 to i64**
  %5 = load i64*, i64** %4, align 8, !tbaa !78
  %6 = load atomic i64, i64* %5 monotonic, align 8
  %7 = getelementptr inbounds i8, i8* %0, i64 40
  %8 = bitcast i8* %7 to i64*
  %9 = load i64, i64* %8, align 8, !tbaa !80
  %10 = icmp eq i64 %6, %9
  br i1 %10, label %11, label %29

; <label>:11:                                     ; preds = %2
  %12 = bitcast i8* %7 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"**
  store atomic i64 0, i64* %5 monotonic, align 8
  %13 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %12, align 8, !tbaa !80
  %14 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %13, i64 0, i32 0
  %15 = load atomic i64, i64* %14 monotonic, align 8
  %16 = and i64 %15, 1
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %11
  br label %18

; <label>:18:                                     ; preds = %23, %.preheader
  %19 = phi i64 [ %24, %23 ], [ %15, %.preheader ]
  %20 = or i64 %19, 2
  %21 = cmpxchg weak i64* %14, i64 %19, i64 %20 monotonic monotonic
  %22 = extractvalue { i64, i1 } %21, 1
  br i1 %22, label %.loopexit, label %23

; <label>:23:                                     ; preds = %18
  %24 = extractvalue { i64, i1 } %21, 0
  %25 = and i64 %24, 1
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %.loopexit, label %18

.loopexit:                                        ; preds = %23, %18, %11
  %27 = phi i8 [ 1, %11 ], [ 0, %18 ], [ 1, %23 ]
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %1, i64 0, i32 0
  store i8 %27, i8* %28, align 8, !tbaa !86
  br label %29

; <label>:29:                                     ; preds = %.loopexit, %2
  %30 = phi i1 [ true, %.loopexit ], [ false, %2 ]
  ret i1 %30
}

; Function Attrs: norecurse nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb(i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* dereferenceable(16), i1 zeroext, i1 zeroext) #2 {
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %1, i64 0, i32 0
  %6 = load i8, i8* %5, align 8, !tbaa !86, !range !14
  %7 = icmp eq i8 %6, 0
  %8 = xor i1 %3, true
  %9 = or i1 %7, %8
  br i1 %9, label %16, label %10

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds i8, i8* %0, i64 40
  %12 = bitcast i8* %11 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"**
  %13 = load %"class.Halide::Runtime::Internal::Synchronization::word_lock"*, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %12, align 8, !tbaa !80
  %14 = getelementptr inbounds %"class.Halide::Runtime::Internal::Synchronization::word_lock", %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %13, i64 0, i32 0
  %15 = atomicrmw or i64* %14, i64 2 monotonic
  br label %16

; <label>:16:                                     ; preds = %10, %4
  ret void
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy(i64, i64, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* dereferenceable(32), i64) local_unnamed_addr #0 {
  %5 = alloca %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", align 8
  %6 = alloca %"struct.Halide::Runtime::Internal::Synchronization::validate_action", align 8
  %7 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #10
  call void @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull sret %5, i64 %0, i64 %1) #13
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %6, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #10
  store i8 0, i8* %8, align 8, !tbaa !86
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::validate_action", %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* %6, i64 0, i32 2
  store i64 0, i64* %9, align 8, !tbaa !84
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2, i64 0, i32 0
  %11 = load i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)*, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %10, align 8, !tbaa !40
  %12 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2 to i8*
  %13 = call zeroext i1 %11(i8* nonnull %12, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull dereferenceable(16) %6) #12
  br i1 %13, label %15, label %14

; <label>:14:                                     ; preds = %4
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull dereferenceable(16) %5) #13
  br label %126

; <label>:15:                                     ; preds = %4
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %5, i64 0, i32 0
  %17 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %16, align 8, !tbaa !90
  %18 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %17, i64 0, i32 1
  %19 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %18, align 8, !tbaa !7
  %20 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %19, null
  br i1 %20, label %105, label %21

; <label>:21:                                     ; preds = %15
  %22 = load i8, i8* %8, align 8
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %.preheader, label %.preheader21

.preheader21:                                     ; preds = %21
  br label %24

.preheader:                                       ; preds = %21
  br label %57

; <label>:24:                                     ; preds = %50, %.preheader21
  %25 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %55, %50 ], [ null, %.preheader21 ]
  %26 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %54, %50 ], [ null, %.preheader21 ]
  %27 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %53, %50 ], [ null, %.preheader21 ]
  %28 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %34, %50 ], [ %19, %.preheader21 ]
  %29 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %52, %50 ], [ null, %.preheader21 ]
  %30 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %51, %50 ], [ %18, %.preheader21 ]
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %28, i64 0, i32 1
  %32 = load atomic i64, i64* %31 monotonic, align 8
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %28, i64 0, i32 2
  %34 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %33, align 8, !tbaa !63
  %35 = icmp eq i64 %32, %0
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %24
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %34, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %30, align 8, !tbaa !7
  %37 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %16, align 8, !tbaa !90
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %37, i64 0, i32 2
  %39 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %38, align 8, !tbaa !69
  %40 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %39, %28
  br i1 %40, label %41, label %42

; <label>:41:                                     ; preds = %36
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %29, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %38, align 8, !tbaa !69
  br label %42

; <label>:42:                                     ; preds = %41, %36
  %43 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %25, null
  br i1 %43, label %50, label %44

; <label>:44:                                     ; preds = %42
  %45 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %27, null
  br i1 %45, label %48, label %46

; <label>:46:                                     ; preds = %44
  %47 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %26, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %28, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %47, align 8, !tbaa !63
  br label %48

; <label>:48:                                     ; preds = %46, %44
  %49 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %27, %46 ], [ %28, %44 ]
  store atomic i64 %1, i64* %31 monotonic, align 8
  br label %50

; <label>:50:                                     ; preds = %48, %42, %24
  %51 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %30, %42 ], [ %30, %48 ], [ %33, %24 ]
  %52 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %29, %42 ], [ %29, %48 ], [ %28, %24 ]
  %53 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %27, %42 ], [ %49, %48 ], [ %27, %24 ]
  %54 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %26, %42 ], [ %28, %48 ], [ %26, %24 ]
  %55 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %28, %42 ], [ %25, %48 ], [ %25, %24 ]
  %56 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %34, null
  br i1 %56, label %.loopexit, label %24

; <label>:57:                                     ; preds = %80, %.preheader
  %58 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %84, %80 ], [ null, %.preheader ]
  %59 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %83, %80 ], [ null, %.preheader ]
  %60 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %66, %80 ], [ %19, %.preheader ]
  %61 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %82, %80 ], [ null, %.preheader ]
  %62 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %81, %80 ], [ %18, %.preheader ]
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %60, i64 0, i32 1
  %64 = load atomic i64, i64* %63 monotonic, align 8
  %65 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %60, i64 0, i32 2
  %66 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %65, align 8, !tbaa !63
  %67 = icmp eq i64 %64, %0
  br i1 %67, label %68, label %80

; <label>:68:                                     ; preds = %57
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %66, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %62, align 8, !tbaa !7
  %69 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %16, align 8, !tbaa !90
  %70 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %69, i64 0, i32 2
  %71 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %70, align 8, !tbaa !69
  %72 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %71, %60
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %68
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %61, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %70, align 8, !tbaa !69
  br label %74

; <label>:74:                                     ; preds = %73, %68
  %75 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %59, null
  br i1 %75, label %78, label %76

; <label>:76:                                     ; preds = %74
  %77 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %58, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %60, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %77, align 8, !tbaa !63
  br label %78

; <label>:78:                                     ; preds = %76, %74
  %79 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %59, %76 ], [ %60, %74 ]
  store atomic i64 %1, i64* %63 monotonic, align 8
  br label %80

; <label>:80:                                     ; preds = %78, %57
  %81 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %62, %78 ], [ %65, %57 ]
  %82 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %61, %78 ], [ %60, %57 ]
  %83 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %79, %78 ], [ %59, %57 ]
  %84 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %60, %78 ], [ %58, %57 ]
  %85 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %66, null
  br i1 %85, label %.loopexit, label %57

.loopexit:                                        ; preds = %80, %50
  %86 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %83, %80 ], [ %53, %50 ]
  %87 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %84, %80 ], [ %54, %50 ]
  %88 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ null, %80 ], [ %55, %50 ]
  %89 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %86, null
  br i1 %89, label %105, label %90

; <label>:90:                                     ; preds = %.loopexit
  %91 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %87, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* null, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %91, align 8, !tbaa !63
  %92 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %5, i64 0, i32 1
  %93 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %92, align 8, !tbaa !92
  %94 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %93, i64 0, i32 1
  %95 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %94, align 8, !tbaa !88
  %96 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %95, null
  br i1 %96, label %97, label %99

; <label>:97:                                     ; preds = %90
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %86, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %94, align 8, !tbaa !88
  %98 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %93, i64 0, i32 2
  br label %103

; <label>:99:                                     ; preds = %90
  %100 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %93, i64 0, i32 2
  %101 = load %"struct.Halide::Runtime::Internal::Synchronization::queue_data"*, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %100, align 8, !tbaa !69
  %102 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %101, i64 0, i32 2
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %86, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %102, align 8, !tbaa !63
  br label %103

; <label>:103:                                    ; preds = %99, %97
  %104 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** [ %100, %99 ], [ %98, %97 ]
  store %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %87, %"struct.Halide::Runtime::Internal::Synchronization::queue_data"** %104, align 8, !tbaa !69
  br label %105

; <label>:105:                                    ; preds = %103, %.loopexit, %15
  %106 = phi i1 [ true, %103 ], [ false, %.loopexit ], [ false, %15 ]
  %107 = phi %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* [ %88, %103 ], [ %88, %.loopexit ], [ null, %15 ]
  %108 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::parking_control", %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* %2, i64 0, i32 3
  %109 = load void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)*, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %108, align 8, !tbaa !37
  %110 = icmp ne %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, null
  call void %109(i8* nonnull %12, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* nonnull dereferenceable(16) %6, i1 zeroext %110, i1 zeroext %106) #12
  br i1 %110, label %111, label %119

; <label>:111:                                    ; preds = %105
  %112 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 3
  store i64 %3, i64* %112, align 8, !tbaa !72
  %113 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 0, i32 0
  %114 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* nonnull %113) #12
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull dereferenceable(16) %5) #13
  %115 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 0, i32 2
  store i8 0, i8* %115, align 8, !tbaa !73
  %116 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::queue_data", %"struct.Halide::Runtime::Internal::Synchronization::queue_data"* %107, i64 0, i32 0, i32 1
  %117 = call i32 @pthread_cond_signal(%struct.pthread_mutex_t* nonnull %116) #12
  %118 = call i32 @pthread_mutex_unlock(%struct.pthread_mutex_t* nonnull %113) #12
  br label %120

; <label>:119:                                    ; preds = %105
  call void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* nonnull dereferenceable(16) %5) #13
  br label %120

; <label>:120:                                    ; preds = %119, %111
  %121 = load i8, i8* %8, align 8
  %122 = and i8 %121, 1
  %123 = icmp ne i8 %122, 0
  %124 = and i1 %110, %123
  %125 = zext i1 %124 to i32
  br label %126

; <label>:126:                                    ; preds = %120, %14
  %127 = phi i32 [ %125, %120 ], [ 0, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #10
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #10
  ret i32 %127
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* noalias sret, i64, i64) local_unnamed_addr #0 {
  %4 = mul i64 %1, -7046029254386353131
  %5 = lshr i64 %4, 54
  %6 = mul i64 %2, -7046029254386353131
  %7 = lshr i64 %6, 54
  %8 = icmp eq i64 %5, %7
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %3
  %10 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %5
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %10, i64 0, i32 0, i32 0
  %12 = cmpxchg weak i64* %11, i64 0, i64 1 acquire monotonic
  %13 = extractvalue { i64, i1 } %12, 1
  br i1 %13, label %46, label %14

; <label>:14:                                     ; preds = %9
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %10, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %15) #12
  br label %46

; <label>:16:                                     ; preds = %3
  %17 = icmp ult i64 %5, %7
  br i1 %17, label %18, label %32

; <label>:18:                                     ; preds = %16
  %19 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %5
  %20 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %7
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %19, i64 0, i32 0, i32 0
  %22 = cmpxchg weak i64* %21, i64 0, i64 1 acquire monotonic
  %23 = extractvalue { i64, i1 } %22, 1
  br i1 %23, label %26, label %24

; <label>:24:                                     ; preds = %18
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %19, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %25) #12
  br label %26

; <label>:26:                                     ; preds = %24, %18
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %20, i64 0, i32 0, i32 0
  %28 = cmpxchg weak i64* %27, i64 0, i64 1 acquire monotonic
  %29 = extractvalue { i64, i1 } %28, 1
  br i1 %29, label %46, label %30

; <label>:30:                                     ; preds = %26
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %20, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %31) #12
  br label %46

; <label>:32:                                     ; preds = %16
  %33 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %7
  %34 = getelementptr inbounds [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"], [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]* bitcast ([24576 x i8]* @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE to [1024 x %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"]*), i64 0, i64 %5
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %33, i64 0, i32 0, i32 0
  %36 = cmpxchg weak i64* %35, i64 0, i64 1 acquire monotonic
  %37 = extractvalue { i64, i1 } %36, 1
  br i1 %37, label %40, label %38

; <label>:38:                                     ; preds = %32
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %33, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %39) #12
  br label %40

; <label>:40:                                     ; preds = %38, %32
  %41 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %34, i64 0, i32 0, i32 0
  %42 = cmpxchg weak i64* %41, i64 0, i64 1 acquire monotonic
  %43 = extractvalue { i64, i1 } %42, 1
  br i1 %43, label %46, label %44

; <label>:44:                                     ; preds = %40
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %34, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %45) #12
  br label %46

; <label>:46:                                     ; preds = %44, %40, %30, %26, %14, %9
  %47 = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %10, %9 ], [ %10, %14 ], [ %19, %26 ], [ %19, %30 ], [ %34, %40 ], [ %34, %44 ]
  %48 = phi %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* [ %10, %9 ], [ %10, %14 ], [ %20, %26 ], [ %20, %30 ], [ %33, %40 ], [ %33, %44 ]
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %47, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %49, align 8, !tbaa !7
  %50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %48, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %50, align 8, !tbaa !7
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE(%"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* dereferenceable(16)) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 0
  %3 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %2, align 8, !tbaa !90
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair", %"struct.Halide::Runtime::Internal::Synchronization::bucket_pair"* %0, i64 0, i32 1
  %5 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %4, align 8, !tbaa !92
  %6 = icmp eq %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, %5
  br i1 %6, label %7, label %16

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %9 = atomicrmw and i64* %8, i64 -2 release
  %10 = and i64 %9, 2
  %11 = icmp eq i64 %10, 0
  %12 = icmp ugt i64 %9, 3
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %56

; <label>:14:                                     ; preds = %7
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %15) #12
  br label %56

; <label>:16:                                     ; preds = %1
  %17 = icmp ugt %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, %5
  br i1 %17, label %18, label %37

; <label>:18:                                     ; preds = %16
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0, i32 0
  %20 = atomicrmw and i64* %19, i64 -2 release
  %21 = and i64 %20, 2
  %22 = icmp eq i64 %21, 0
  %23 = icmp ugt i64 %20, 3
  %24 = and i1 %23, %22
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %18
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %3, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %26) #12
  br label %27

; <label>:27:                                     ; preds = %25, %18
  %28 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %4, align 8, !tbaa !92
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %28, i64 0, i32 0, i32 0
  %30 = atomicrmw and i64* %29, i64 -2 release
  %31 = and i64 %30, 2
  %32 = icmp eq i64 %31, 0
  %33 = icmp ugt i64 %30, 3
  %34 = and i1 %33, %32
  br i1 %34, label %35, label %56

; <label>:35:                                     ; preds = %27
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %28, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %36) #12
  br label %56

; <label>:37:                                     ; preds = %16
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %5, i64 0, i32 0, i32 0
  %39 = atomicrmw and i64* %38, i64 -2 release
  %40 = and i64 %39, 2
  %41 = icmp eq i64 %40, 0
  %42 = icmp ugt i64 %39, 3
  %43 = and i1 %42, %41
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %37
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %5, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %45) #12
  br label %46

; <label>:46:                                     ; preds = %44, %37
  %47 = load %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"*, %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"** %2, align 8, !tbaa !90
  %48 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %47, i64 0, i32 0, i32 0
  %49 = atomicrmw and i64* %48, i64 -2 release
  %50 = and i64 %49, 2
  %51 = icmp eq i64 %50, 0
  %52 = icmp ugt i64 %49, 3
  %53 = and i1 %52, %51
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %46
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket", %"struct.Halide::Runtime::Internal::Synchronization::hash_bucket"* %47, i64 0, i32 0
  tail call void @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv(%"class.Halide::Runtime::Internal::Synchronization::word_lock"* %55) #12
  br label %56

; <label>:56:                                     ; preds = %54, %46, %35, %27, %14, %7
  ret void
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() local_unnamed_addr #0 {
  %1 = tail call i8* @getenv(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0)) #12
  %2 = icmp eq i8* %1, null
  br i1 %2, label %3, label %6

; <label>:3:                                      ; preds = %0
  %4 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)) #12
  %5 = icmp eq i8* %4, null
  br i1 %5, label %9, label %6

; <label>:6:                                      ; preds = %3, %0
  %7 = phi i8* [ %4, %3 ], [ %1, %0 ]
  %8 = tail call i32 @atoi(i8* nonnull %7) #12
  br label %11

; <label>:9:                                      ; preds = %3
  %10 = tail call i32 @halide_host_cpu_count() #12
  br label %11

; <label>:11:                                     ; preds = %9, %6
  %12 = phi i32 [ %8, %6 ], [ %10, %9 ]
  ret i32 %12
}

; Function Attrs: norecurse nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32) local_unnamed_addr #2 {
  %2 = icmp sgt i32 %0, 256
  br i1 %2, label %6, label %3

; <label>:3:                                      ; preds = %1
  %4 = icmp sgt i32 %0, 1
  %5 = select i1 %4, i32 %0, i32 1
  ret i32 %5

; <label>:6:                                      ; preds = %1
  ret i32 256
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal13worker_threadEPv(i8*) #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %2 = bitcast i8* %0 to %"struct.Halide::Runtime::Internal::work"*
  tail call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* %2) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  ret void
}

; Function Attrs: nounwind
define weak %struct.halide_thread* @halide_spawn_thread(void (i8*)*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @malloc(i64 24) #12
  %4 = bitcast i8* %3 to void (i8*)**
  store void (i8*)* %0, void (i8*)** %4, align 8, !tbaa !93
  %5 = getelementptr inbounds i8, i8* %3, i64 8
  %6 = bitcast i8* %5 to i8**
  store i8* %1, i8** %6, align 8, !tbaa !95
  %7 = getelementptr inbounds i8, i8* %3, i64 16
  %8 = bitcast i8* %7 to i64*
  store i64 0, i64* %8, align 8, !tbaa !96
  %9 = tail call i32 @pthread_create(i64* nonnull %8, i8* null, i8* (i8*)* nonnull @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, i8* %3) #12
  %10 = bitcast i8* %3 to %struct.halide_thread*
  ret %struct.halide_thread* %10
}

; Function Attrs: nounwind
define linkonce i8* @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv(i8*) #0 {
  %2 = bitcast i8* %0 to void (i8*)**
  %3 = load void (i8*)*, void (i8*)** %2, align 8, !tbaa !93
  %4 = getelementptr inbounds i8, i8* %0, i64 8
  %5 = bitcast i8* %4 to i8**
  %6 = load i8*, i8** %5, align 8, !tbaa !95
  tail call void %3(i8* %6) #12
  ret i8* null
}

declare i32 @pthread_create(i64*, i8*, i8* (i8*)*, i8*) local_unnamed_addr #4

; Function Attrs: nounwind readonly
declare i8* @getenv(i8* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind
define weak i32 @halide_default_do_parallel_tasks(i8*, i32, %struct.halide_parallel_task_t*, i8*) #0 {
  %5 = sext i32 %1 to i64
  %6 = alloca %"struct.Halide::Runtime::Internal::work", i64 %5, align 8
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.preheader, label %.loopexit1

.preheader:                                       ; preds = %4
  br label %10

.loopexit1:                                       ; preds = %30, %4
  %8 = phi i32 [ %1, %4 ], [ %32, %30 ]
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %52, label %36

; <label>:10:                                     ; preds = %30, %.preheader
  %11 = phi i64 [ %33, %30 ], [ 0, %.preheader ]
  %12 = phi i32 [ %32, %30 ], [ %1, %.preheader ]
  %13 = phi %struct.halide_parallel_task_t* [ %31, %30 ], [ %2, %.preheader ]
  %14 = getelementptr inbounds %struct.halide_parallel_task_t, %struct.halide_parallel_task_t* %13, i64 0, i32 6
  %15 = load i32, i32* %14, align 8, !tbaa !97
  %16 = icmp slt i32 %15, 1
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %10
  %18 = add nsw i32 %12, -1
  br label %30

; <label>:19:                                     ; preds = %10
  %20 = getelementptr inbounds %struct.halide_parallel_task_t, %struct.halide_parallel_task_t* %13, i64 1
  %21 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %11
  %22 = bitcast %"struct.Halide::Runtime::Internal::work"* %21 to i8*
  %23 = bitcast %struct.halide_parallel_task_t* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %22, i8* %23, i64 56, i32 8, i1 false), !tbaa.struct !98
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %11, i32 1
  store i32 (i8*, i32, i8*)* null, i32 (i8*, i32, i8*)** %24, align 8, !tbaa !29
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %11, i32 7
  store i8* %0, i8** %25, align 8, !tbaa !30
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %11, i32 8
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %11, i32 5
  %28 = bitcast %"struct.Halide::Runtime::Internal::work"** %27 to i8**
  %29 = bitcast i32* %26 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %29, i8 0, i64 13, i32 8, i1 false)
  store i8* %3, i8** %28, align 8, !tbaa !33
  br label %30

; <label>:30:                                     ; preds = %19, %17
  %31 = phi %struct.halide_parallel_task_t* [ %13, %17 ], [ %20, %19 ]
  %32 = phi i32 [ %18, %17 ], [ %12, %19 ]
  %33 = add nuw nsw i64 %11, 1
  %34 = sext i32 %32 to i64
  %35 = icmp slt i64 %33, %34
  br i1 %35, label %10, label %.loopexit1

; <label>:36:                                     ; preds = %.loopexit1
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %37 = bitcast i8* %3 to %"struct.Halide::Runtime::Internal::work"*
  call void @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_(i32 %8, %"struct.Halide::Runtime::Internal::work"* nonnull %6, %"struct.Halide::Runtime::Internal::work"* %37) #13
  %38 = icmp sgt i32 %8, 0
  br i1 %38, label %39, label %.loopexit

; <label>:39:                                     ; preds = %36
  %40 = zext i32 %8 to i64
  br label %42

.loopexit:                                        ; preds = %42, %36
  %41 = phi i32 [ 0, %36 ], [ %49, %42 ]
  call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %52

; <label>:42:                                     ; preds = %42, %39
  %43 = phi i64 [ 0, %39 ], [ %50, %42 ]
  %44 = phi i32 [ 0, %39 ], [ %49, %42 ]
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %43
  call void @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE(%"struct.Halide::Runtime::Internal::work"* nonnull %45) #13
  %46 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work", %"struct.Halide::Runtime::Internal::work"* %6, i64 %43, i32 9
  %47 = load i32, i32* %46, align 4, !tbaa !34
  %48 = icmp eq i32 %47, 0
  %49 = select i1 %48, i32 %44, i32 %47
  %50 = add nuw nsw i64 %43, 1
  %51 = icmp eq i64 %50, %40
  br i1 %51, label %.loopexit, label %42

; <label>:52:                                     ; preds = %.loopexit, %.loopexit1
  %53 = phi i32 [ %41, %.loopexit ], [ 0, %.loopexit1 ]
  ret i32 %53
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: norecurse nounwind
define weak i32 @halide_default_semaphore_init(%struct.halide_semaphore_t*, i32) #2 {
  %3 = bitcast %struct.halide_semaphore_t* %0 to i32*
  store atomic i32 %1, i32* %3 release, align 4
  ret i32 %1
}

; Function Attrs: nounwind
define weak i32 @halide_default_semaphore_release(%struct.halide_semaphore_t*, i32) #0 {
  %3 = bitcast %struct.halide_semaphore_t* %0 to i32*
  %4 = atomicrmw add i32* %3, i32 %1 acq_rel
  %5 = icmp eq i32 %4, 0
  %6 = icmp ne i32 %1, 0
  %7 = and i1 %6, %5
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %9

; <label>:9:                                      ; preds = %8, %2
  %10 = add nsw i32 %4, %1
  ret i32 %10
}

; Function Attrs: nounwind
define weak void @halide_thread_pool_cleanup() #0 {
  tail call void @halide_shutdown_thread_pool() #13
  ret void
}

; Function Attrs: nounwind
define weak void @halide_shutdown_thread_pool() local_unnamed_addr #0 {
  %1 = load i8, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 15), align 1, !tbaa !42, !range !14
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %15, label %3

; <label>:3:                                      ; preds = %0
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  store i8 1, i8* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 14), align 8, !tbaa !57
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 10)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 8)) #13
  tail call void @halide_cond_broadcast(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 9)) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %4 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %3
  br label %7

.loopexit:                                        ; preds = %7, %3
  %6 = tail call i8* @memset(i8* nonnull bitcast (i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 2) to i8*), i32 0, i64 2116) #12
  br label %15

; <label>:7:                                      ; preds = %7, %.preheader
  %8 = phi i64 [ %11, %7 ], [ 0, %.preheader ]
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 13, i64 %8
  %10 = load %struct.halide_thread*, %struct.halide_thread** %9, align 8, !tbaa !7
  tail call void @halide_join_thread(%struct.halide_thread* %10) #13
  %11 = add nuw nsw i64 %8, 1
  %12 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 4), align 8, !tbaa !47
  %13 = sext i32 %12 to i64
  %14 = icmp slt i64 %11, %13
  br i1 %14, label %7, label %.loopexit

; <label>:15:                                     ; preds = %.loopexit, %0
  ret void
}

declare i8* @memset(i8*, i32, i64) local_unnamed_addr #4

; Function Attrs: nounwind
define weak void @halide_join_thread(%struct.halide_thread*) local_unnamed_addr #0 {
  %2 = alloca i8*, align 8
  %3 = bitcast %struct.halide_thread* %0 to %"struct.Halide::Runtime::Internal::spawned_thread"*
  %4 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #10
  store i8* null, i8** %2, align 8, !tbaa !7
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::spawned_thread", %"struct.Halide::Runtime::Internal::spawned_thread"* %3, i64 0, i32 2
  %6 = load i64, i64* %5, align 8, !tbaa !96
  %7 = call i32 @pthread_join(i64 %6, i8** nonnull %2) #12
  %8 = bitcast %struct.halide_thread* %0 to i8*
  call void @free(i8* %8) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #10
  ret void
}

declare i32 @pthread_join(i64, i8**) local_unnamed_addr #4

; Function Attrs: norecurse nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE(i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"* dereferenceable(16)) #2 {
  ret i1 true
}

; Function Attrs: norecurse nounwind
define linkonce i64 @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib(i8*, i32, i1 zeroext) #2 {
  br i1 %2, label %8, label %4

; <label>:4:                                      ; preds = %3
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to i64**
  %7 = load i64*, i64** %6, align 8, !tbaa !100
  store atomic i64 0, i64* %7 monotonic, align 8
  br label %8

; <label>:8:                                      ; preds = %4, %3
  ret i64 0
}

; Function Attrs: nounwind
define weak void @halide_cond_signal(%struct.halide_mutex*) local_unnamed_addr #0 {
  %2 = alloca %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", align 8
  %3 = getelementptr inbounds %struct.halide_mutex, %struct.halide_mutex* %0, i64 0, i32 0, i64 0
  %4 = load atomic i64, i64* %3 monotonic, align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %18, label %6

; <label>:6:                                      ; preds = %1
  %7 = bitcast %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %7) #10
  %8 = inttoptr i64 %4 to %"class.Halide::Runtime::Internal::Synchronization::word_lock"*
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 0
  store i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)* @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE, i1 (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*)** %9, align 8, !tbaa !40
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 1
  store void (i8*)* @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, void (i8*)** %10, align 8, !tbaa !35
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 2
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0, i32 3
  store void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)* @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, void (i8*, %"struct.Halide::Runtime::Internal::Synchronization::validate_action"*, i1, i1)** %12, align 8, !tbaa !37
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 1
  store i64* %3, i64** %13, align 8, !tbaa !100
  %14 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 2
  store %"class.Halide::Runtime::Internal::Synchronization::word_lock"* %8, %"class.Halide::Runtime::Internal::Synchronization::word_lock"** %14, align 8, !tbaa !102
  store i64 (i8*, i32, i1)* @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib, i64 (i8*, i32, i1)** %11, align 8, !tbaa !41
  %15 = ptrtoint %struct.halide_mutex* %0 to i64
  %16 = getelementptr inbounds %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control", %"struct.Halide::Runtime::Internal::Synchronization::wait_parking_control"* %2, i64 0, i32 0
  %17 = call i64 @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE(i64 %15, %"struct.Halide::Runtime::Internal::Synchronization::parking_control"* nonnull dereferenceable(32) %16) #12
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %7) #10
  br label %18

; <label>:18:                                     ; preds = %6, %1
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_set_num_threads(i32) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 0
  br i1 %2, label %3, label %4

; <label>:3:                                      ; preds = %1
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i64 0, i64 0)) #12
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  br label %8

; <label>:4:                                      ; preds = %1
  tail call void @halide_mutex_lock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  %5 = icmp eq i32 %0, 0
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %4
  %7 = tail call i32 @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv() #13
  br label %8

; <label>:8:                                      ; preds = %6, %4, %3
  %9 = phi i32 [ %7, %6 ], [ %0, %4 ], [ %0, %3 ]
  %10 = load i32, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  %11 = tail call i32 @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi(i32 %9) #13
  store i32 %11, i32* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 1), align 8, !tbaa !46
  tail call void @halide_mutex_unlock(%struct.halide_mutex* getelementptr inbounds (%"struct.Halide::Runtime::Internal::work_queue_t", %"struct.Halide::Runtime::Internal::work_queue_t"* @_ZN6Halide7Runtime8Internal10work_queueE, i64 0, i32 0)) #13
  ret i32 %10
}

; Function Attrs: norecurse nounwind
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* @halide_set_custom_do_task(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !7
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !7
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %2
}

; Function Attrs: norecurse nounwind
define weak i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* @halide_set_custom_do_loop_task(i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !7
  store i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %0, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !7
  ret i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %2
}

; Function Attrs: norecurse nounwind
define weak i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* @halide_set_custom_do_par_for(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*) local_unnamed_addr #2 {
  %2 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !7
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !7
  ret i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %2
}

; Function Attrs: norecurse nounwind
define weak void @halide_set_custom_parallel_runtime(i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)*) local_unnamed_addr #2 {
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)* %0, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !7
  store i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)* %1, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i8*)** @_ZN6Halide7Runtime8Internal14custom_do_taskE, align 8, !tbaa !7
  store i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)* %2, i32 (i8*, i32 (i8*, i32, i32, i8*, i8*)*, i32, i32, i8*, i8*)** @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, align 8, !tbaa !7
  store i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)* %3, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !7
  store i32 (%struct.halide_semaphore_t*, i32)* %4, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !7
  store i1 (%struct.halide_semaphore_t*, i32)* %5, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !7
  store i32 (%struct.halide_semaphore_t*, i32)* %6, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !7
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_do_par_for(i8*, i32 (i8*, i32, i8*)*, i32, i32, i8* noalias) local_unnamed_addr #0 {
  %6 = load i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)*, i32 (i8*, i32 (i8*, i32, i8*)*, i32, i32, i8*)** @_ZN6Halide7Runtime8Internal17custom_do_par_forE, align 8, !tbaa !7
  %7 = tail call i32 %6(i8* %0, i32 (i8*, i32, i8*)* %1, i32 %2, i32 %3, i8* %4) #12
  ret i32 %7
}

; Function Attrs: nounwind
define weak i32 @halide_do_parallel_tasks(i8*, i32, %struct.halide_parallel_task_t*, i8*) local_unnamed_addr #0 {
  %5 = load i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)*, i32 (i8*, i32, %struct.halide_parallel_task_t*, i8*)** @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, align 8, !tbaa !7
  %6 = tail call i32 %5(i8* %0, i32 %1, %struct.halide_parallel_task_t* %2, i8* %3) #12
  ret i32 %6
}

; Function Attrs: nounwind
define weak i32 @halide_semaphore_init(%struct.halide_semaphore_t*, i32) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal21custom_semaphore_initE, align 8, !tbaa !7
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #12
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_semaphore_release(%struct.halide_semaphore_t*, i32) local_unnamed_addr #0 {
  %3 = load i32 (%struct.halide_semaphore_t*, i32)*, i32 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, align 8, !tbaa !7
  %4 = tail call i32 %3(%struct.halide_semaphore_t* %0, i32 %1) #12
  ret i32 %4
}

; Function Attrs: nounwind
define weak zeroext i1 @halide_semaphore_try_acquire(%struct.halide_semaphore_t*, i32) local_unnamed_addr #0 {
  %3 = load i1 (%struct.halide_semaphore_t*, i32)*, i1 (%struct.halide_semaphore_t*, i32)** @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, align 8, !tbaa !7
  %4 = tail call zeroext i1 %3(%struct.halide_semaphore_t* %0, i32 %1) #12
  ret i1 %4
}

; Function Attrs: nounwind
define weak i8* @halide_default_get_symbol(i8*) #0 {
  %2 = tail call i8* @dlsym(i8* null, i8* %0) #12
  ret i8* %2
}

declare i8* @dlsym(i8*, i8*) local_unnamed_addr #4

; Function Attrs: nounwind
define weak i8* @halide_default_load_library(i8*) #0 {
  %2 = tail call i8* @dlopen(i8* %0, i32 1) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %1
  %5 = tail call i8* @dlerror() #12
  br label %6

; <label>:6:                                      ; preds = %4, %1
  ret i8* %2
}

declare i8* @dlopen(i8*, i32) local_unnamed_addr #4

declare i8* @dlerror() local_unnamed_addr #4

; Function Attrs: nounwind
define weak i8* @halide_default_get_library_symbol(i8*, i8*) #0 {
  %3 = tail call i8* @dlsym(i8* %0, i8* %1) #12
  ret i8* %3
}

; Function Attrs: norecurse nounwind
define weak i8* (i8*)* @halide_set_custom_get_symbol(i8* (i8*)*) local_unnamed_addr #2 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !7
  store i8* (i8*)* %0, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !7
  ret i8* (i8*)* %2
}

; Function Attrs: norecurse nounwind
define weak i8* (i8*)* @halide_set_custom_load_library(i8* (i8*)*) local_unnamed_addr #2 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !7
  store i8* (i8*)* %0, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !7
  ret i8* (i8*)* %2
}

; Function Attrs: norecurse nounwind
define weak i8* (i8*, i8*)* @halide_set_custom_get_library_symbol(i8* (i8*, i8*)*) local_unnamed_addr #2 {
  %2 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !7
  store i8* (i8*, i8*)* %0, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !7
  ret i8* (i8*, i8*)* %2
}

; Function Attrs: nounwind
define weak i8* @halide_get_symbol(i8*) local_unnamed_addr #0 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal17custom_get_symbolE, align 8, !tbaa !7
  %3 = tail call i8* %2(i8* %0) #12
  ret i8* %3
}

; Function Attrs: nounwind
define weak i8* @halide_load_library(i8*) local_unnamed_addr #0 {
  %2 = load i8* (i8*)*, i8* (i8*)** @_ZN6Halide7Runtime8Internal19custom_load_libraryE, align 8, !tbaa !7
  %3 = tail call i8* %2(i8* %0) #12
  ret i8* %3
}

; Function Attrs: nounwind
define weak i8* @halide_get_library_symbol(i8*, i8*) local_unnamed_addr #0 {
  %3 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, align 8, !tbaa !7
  %4 = tail call i8* %3(i8* %0, i8* %1) #12
  ret i8* %4
}

; Function Attrs: nounwind
declare i8* @memcpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #1

; Function Attrs: norecurse nounwind
define weak void @halide_set_gpu_device(i32) local_unnamed_addr #2 {
  store i32 %0, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !99
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_get_gpu_device(i8*) local_unnamed_addr #0 {
  br label %2

; <label>:2:                                      ; preds = %2, %1
  %3 = atomicrmw xchg i32* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, i32 1 seq_cst
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %2

; <label>:5:                                      ; preds = %2
  %6 = load i8, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !12, !range !14
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !99
  br label %17

; <label>:10:                                     ; preds = %5
  %11 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0)) #12
  %12 = icmp eq i8* %11, null
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %10
  %14 = tail call i32 @atoi(i8* nonnull %11) #12
  br label %15

; <label>:15:                                     ; preds = %13, %10
  %16 = phi i32 [ %14, %13 ], [ -1, %10 ]
  store i32 %16, i32* @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, align 4, !tbaa !99
  store i8 1, i8* @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, align 1, !tbaa !12
  br label %17

; <label>:17:                                     ; preds = %15, %8
  %18 = phi i32 [ %9, %8 ], [ %16, %15 ]
  store atomic i32 0, i32* @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE release, align 4
  ret i32 %18
}

; Function Attrs: nounwind
define weak i32 @halide_default_trace(i8*, %struct.halide_trace_event_t*) #0 {
  %3 = alloca [4096 x i8], align 1
  %4 = atomicrmw add i32* @_ZZ20halide_default_traceE3ids, i32 1 seq_cst
  %5 = tail call i32 @halide_get_trace_file(i8* %0) #13
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %234

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4
  %9 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 2
  %10 = load i16, i16* %9, align 2, !tbaa !103
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 1
  %13 = load i8, i8* %12, align 1, !tbaa !108
  %14 = zext i8 %13 to i32
  %15 = add nuw nsw i32 %14, 7
  %16 = lshr i32 %15, 3
  %17 = mul nuw nsw i32 %16, %11
  %18 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 8
  %19 = load i32, i32* %18, align 8, !tbaa !109
  %20 = shl i32 %19, 2
  %21 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8, !tbaa !110
  %23 = tail call i64 @strlen(i8* %22) #12
  %24 = trunc i64 %23 to i32
  %25 = add i32 %24, 1
  %26 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 3
  %27 = load i8*, i8** %26, align 8, !tbaa !111
  %28 = icmp eq i8* %27, null
  br i1 %28, label %33, label %29

; <label>:29:                                     ; preds = %7
  %30 = tail call i64 @strlen(i8* nonnull %27) #12
  %31 = trunc i64 %30 to i32
  %32 = add i32 %31, 1
  br label %33

; <label>:33:                                     ; preds = %29, %7
  %34 = phi i32 [ %32, %29 ], [ 1, %7 ]
  %35 = add i32 %20, 31
  %36 = add i32 %35, %17
  %37 = add i32 %36, %25
  %38 = add i32 %37, %34
  %39 = and i32 %38, -4
  %40 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !7
  %41 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %40, i64 0, i32 0, i32 0
  %42 = icmp ult i32 %39, 1048577
  %43 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %40, i64 0, i32 1
  %44 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %40, i64 0, i32 2
  %45 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %40, i64 0, i32 3, i64 0
  br i1 %42, label %.preheader, label %.preheader32

.preheader32:                                     ; preds = %33
  br label %77

.preheader:                                       ; preds = %33
  br label %46

; <label>:46:                                     ; preds = %.backedge, %.preheader
  %47 = load volatile i32, i32* %41, align 4, !tbaa !112
  %48 = and i32 %47, 1073741823
  %49 = add nuw nsw i32 %48, 1
  %50 = cmpxchg i32* %41, i32 %48, i32 %49 seq_cst seq_cst
  %51 = extractvalue { i32, i1 } %50, 1
  br i1 %51, label %52, label %.backedge

; <label>:52:                                     ; preds = %46
  %53 = atomicrmw add i32* %43, i32 %39 seq_cst
  %54 = add i32 %53, %39
  %55 = icmp ugt i32 %54, 1048576
  br i1 %55, label %56, label %.loopexit

; <label>:56:                                     ; preds = %52
  %57 = atomicrmw add i32* %44, i32 %39 seq_cst
  %58 = atomicrmw sub i32* %41, i32 1 seq_cst
  br label %59

; <label>:59:                                     ; preds = %59, %56
  %60 = atomicrmw or i32* %41, i32 1073741824 seq_cst
  %61 = cmpxchg i32* %41, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %62 = extractvalue { i32, i1 } %61, 1
  br i1 %62, label %63, label %59

; <label>:63:                                     ; preds = %59
  %64 = load i32, i32* %43, align 4, !tbaa !114
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %75, label %66

; <label>:66:                                     ; preds = %63
  %67 = load i32, i32* %44, align 4, !tbaa !116
  %68 = sub i32 %64, %67
  store i32 %68, i32* %43, align 4, !tbaa !114
  %69 = zext i32 %68 to i64
  %70 = tail call i64 @write(i32 %5, i8* nonnull %45, i64 %69) #12
  %71 = trunc i64 %70 to i32
  %72 = icmp eq i32 %68, %71
  store i32 0, i32* %43, align 4, !tbaa !114
  store i32 0, i32* %44, align 4, !tbaa !116
  %73 = atomicrmw and i32* %41, i32 2147483647 seq_cst
  br i1 %72, label %.backedge, label %74

; <label>:74:                                     ; preds = %66
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.32, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %.backedge

; <label>:75:                                     ; preds = %63
  %76 = atomicrmw and i32* %41, i32 2147483647 seq_cst
  br label %.backedge

.backedge:                                        ; preds = %75, %74, %66, %46
  br label %46

; <label>:77:                                     ; preds = %.backedge34, %.preheader32
  %78 = load volatile i32, i32* %41, align 4, !tbaa !112
  %79 = and i32 %78, 1073741823
  %80 = add nuw nsw i32 %79, 1
  %81 = cmpxchg i32* %41, i32 %79, i32 %80 seq_cst seq_cst
  %82 = extractvalue { i32, i1 } %81, 1
  br i1 %82, label %83, label %.backedge34

; <label>:83:                                     ; preds = %77
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([133 x i8], [133 x i8]* @.str.31, i64 0, i64 0)) #12
  tail call void @abort() #12
  %84 = atomicrmw add i32* %43, i32 %39 seq_cst
  %85 = add i32 %84, %39
  %86 = icmp ugt i32 %85, 1048576
  br i1 %86, label %87, label %.loopexit

; <label>:87:                                     ; preds = %83
  %88 = atomicrmw add i32* %44, i32 %39 seq_cst
  %89 = atomicrmw sub i32* %41, i32 1 seq_cst
  br label %90

; <label>:90:                                     ; preds = %90, %87
  %91 = atomicrmw or i32* %41, i32 1073741824 seq_cst
  %92 = cmpxchg i32* %41, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %93 = extractvalue { i32, i1 } %92, 1
  br i1 %93, label %94, label %90

; <label>:94:                                     ; preds = %90
  %95 = load i32, i32* %43, align 4, !tbaa !114
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %106, label %97

; <label>:97:                                     ; preds = %94
  %98 = load i32, i32* %44, align 4, !tbaa !116
  %99 = sub i32 %95, %98
  store i32 %99, i32* %43, align 4, !tbaa !114
  %100 = zext i32 %99 to i64
  %101 = tail call i64 @write(i32 %5, i8* nonnull %45, i64 %100) #12
  %102 = trunc i64 %101 to i32
  %103 = icmp eq i32 %99, %102
  store i32 0, i32* %43, align 4, !tbaa !114
  store i32 0, i32* %44, align 4, !tbaa !116
  %104 = atomicrmw and i32* %41, i32 2147483647 seq_cst
  br i1 %103, label %.backedge34, label %105

; <label>:105:                                    ; preds = %97
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.32, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %.backedge34

; <label>:106:                                    ; preds = %94
  %107 = atomicrmw and i32* %41, i32 2147483647 seq_cst
  br label %.backedge34

.backedge34:                                      ; preds = %106, %105, %97, %77
  br label %77

.loopexit:                                        ; preds = %83, %52
  %108 = phi i32 [ %53, %52 ], [ %84, %83 ]
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %40, i64 0, i32 3, i64 %109
  %111 = icmp ugt i32 %39, 4096
  br i1 %111, label %112, label %126

; <label>:112:                                    ; preds = %.loopexit
  %113 = tail call i8* @halide_malloc(i8* null, i64 1024) #12
  %114 = ptrtoint i8* %113 to i64
  %115 = icmp eq i8* %113, null
  br i1 %115, label %118, label %116

; <label>:116:                                    ; preds = %112
  %117 = getelementptr inbounds i8, i8* %113, i64 1023
  store i8 0, i8* %117, align 1, !tbaa !11
  br label %118

; <label>:118:                                    ; preds = %116, %112
  %119 = phi i8* [ %117, %116 ], [ null, %112 ]
  %120 = zext i32 %39 to i64
  %121 = tail call i8* @halide_uint64_to_string(i8* %113, i8* %119, i64 %120, i32 1) #12
  %122 = tail call i8* @halide_string_to_string(i8* %121, i8* %119, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #12
  br i1 %115, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %118
  tail call void @halide_error(i8* null, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* null, i8* null) #12
  br label %126

.predBB2.split:                                   ; preds = %118
  %123 = ptrtoint i8* %122 to i64
  %124 = sub i64 1, %114
  %125 = add i64 %124, %123
  tail call void @halide_msan_annotate_memory_is_initialized(i8* null, i8* nonnull %113, i64 %125) #12
  tail call void @halide_print(i8* null, i8* nonnull %113) #12
  tail call void @halide_free(i8* null, i8* nonnull %113) #12
  br label %126

; <label>:126:                                    ; preds = %.predBB2.split, %.predBB1.split, %.loopexit
  %127 = bitcast i8* %110 to i32*
  store i32 %39, i32* %127, align 4, !tbaa !117
  %128 = getelementptr inbounds i8, i8* %110, i64 4
  %129 = bitcast i8* %128 to i32*
  store i32 %4, i32* %129, align 4, !tbaa !119
  %130 = getelementptr inbounds i8, i8* %110, i64 8
  %131 = bitcast %struct.halide_type_t* %8 to i32*
  %132 = bitcast i8* %130 to i32*
  %133 = load i32, i32* %131, align 2
  store i32 %133, i32* %132, align 2
  %134 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 5
  %135 = getelementptr inbounds i8, i8* %110, i64 12
  %136 = bitcast i32* %134 to <4 x i32>*
  %137 = load <4 x i32>, <4 x i32>* %136, align 4, !tbaa !11
  %138 = getelementptr inbounds i8, i8* %110, i64 24
  %139 = bitcast i8* %138 to i32*
  %140 = bitcast i8* %135 to <4 x i32>*
  store <4 x i32> %137, <4 x i32>* %140, align 4, !tbaa !11
  %141 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 2
  %142 = load i32*, i32** %141, align 8, !tbaa !120
  %143 = icmp eq i32* %142, null
  br i1 %143, label %._crit_edge, label %144

._crit_edge:                                      ; preds = %126
  %.pre = getelementptr inbounds i8, i8* %110, i64 28
  br label %149

; <label>:144:                                    ; preds = %126
  %145 = bitcast i32* %142 to i8*
  %146 = getelementptr inbounds i8, i8* %110, i64 28
  %147 = zext i32 %20 to i64
  %148 = tail call i8* @memcpy(i8* nonnull %146, i8* %145, i64 %147) #12
  br label %149

; <label>:149:                                    ; preds = %144, %._crit_edge
  %.pre-phi = phi i8* [ %.pre, %._crit_edge ], [ %146, %144 ]
  %150 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 1
  %151 = load i8*, i8** %150, align 8, !tbaa !121
  %152 = icmp eq i8* %151, null
  %153 = bitcast i8* %.pre-phi to i32*
  br i1 %152, label %161, label %154

; <label>:154:                                    ; preds = %149
  %155 = load i32, i32* %139, align 4, !tbaa !122
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32* %153, i64 %156
  %158 = bitcast i32* %157 to i8*
  %159 = zext i32 %17 to i64
  %160 = tail call i8* @memcpy(i8* nonnull %158, i8* nonnull %151, i64 %159) #12
  br label %161

; <label>:161:                                    ; preds = %154, %149
  %162 = load i32, i32* %139, align 4, !tbaa !122
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32* %153, i64 %163
  %165 = bitcast i32* %164 to i8*
  %166 = getelementptr inbounds i8, i8* %110, i64 10
  %167 = bitcast i8* %166 to i16*
  %168 = load i16, i16* %167, align 2, !tbaa !123
  %169 = zext i16 %168 to i32
  %170 = getelementptr inbounds i8, i8* %110, i64 9
  %171 = load i8, i8* %170, align 1, !tbaa !108
  %172 = zext i8 %171 to i32
  %173 = add nuw nsw i32 %172, 7
  %174 = lshr i32 %173, 3
  %175 = mul nuw nsw i32 %174, %169
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8* %165, i64 %176
  %178 = load i8*, i8** %21, align 8, !tbaa !110
  %179 = zext i32 %25 to i64
  %180 = tail call i8* @memcpy(i8* %177, i8* %178, i64 %179) #12
  %181 = load i32, i32* %139, align 4, !tbaa !122
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32* %153, i64 %182
  %184 = bitcast i32* %183 to i8*
  %185 = load i16, i16* %167, align 2, !tbaa !123
  %186 = zext i16 %185 to i32
  %187 = load i8, i8* %170, align 1, !tbaa !108
  %188 = zext i8 %187 to i32
  %189 = add nuw nsw i32 %188, 7
  %190 = lshr i32 %189, 3
  %191 = mul nuw nsw i32 %190, %186
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds i8, i8* %184, i64 %192
  br label %194

; <label>:194:                                    ; preds = %194, %161
  %195 = phi i8* [ %193, %161 ], [ %196, %194 ]
  %196 = getelementptr inbounds i8, i8* %195, i64 1
  %197 = load i8, i8* %195, align 1, !tbaa !11
  %198 = icmp eq i8 %197, 0
  br i1 %198, label %199, label %194

; <label>:199:                                    ; preds = %194
  %200 = load i8*, i8** %26, align 8, !tbaa !111
  %201 = icmp eq i8* %200, null
  %202 = select i1 %201, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), i8* %200
  %203 = zext i32 %34 to i64
  %204 = tail call i8* @memcpy(i8* nonnull %196, i8* %202, i64 %203) #12
  %205 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !7
  fence seq_cst
  %206 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %205, i64 0, i32 0, i32 0
  %207 = atomicrmw sub i32* %206, i32 1 seq_cst
  %208 = load i32, i32* %134, align 4, !tbaa !124
  %209 = icmp eq i32 %208, 9
  br i1 %209, label %210, label %491

; <label>:210:                                    ; preds = %199
  %211 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !7
  %212 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %211, i64 0, i32 0, i32 0
  br label %213

; <label>:213:                                    ; preds = %213, %210
  %214 = atomicrmw or i32* %212, i32 1073741824 seq_cst
  %215 = cmpxchg i32* %212, i32 1073741824, i32 -2147483648 seq_cst seq_cst
  %216 = extractvalue { i32, i1 } %215, 1
  br i1 %216, label %217, label %213

; <label>:217:                                    ; preds = %213
  %218 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %211, i64 0, i32 1
  %219 = load i32, i32* %218, align 4, !tbaa !114
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %232, label %221

; <label>:221:                                    ; preds = %217
  %222 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %211, i64 0, i32 2
  %223 = load i32, i32* %222, align 4, !tbaa !116
  %224 = sub i32 %219, %223
  store i32 %224, i32* %218, align 4, !tbaa !114
  %225 = getelementptr inbounds %"class.Halide::Runtime::Internal::TraceBuffer", %"class.Halide::Runtime::Internal::TraceBuffer"* %211, i64 0, i32 3, i64 0
  %226 = zext i32 %224 to i64
  %227 = tail call i64 @write(i32 %5, i8* nonnull %225, i64 %226) #12
  %228 = trunc i64 %227 to i32
  %229 = icmp eq i32 %224, %228
  store i32 0, i32* %218, align 4, !tbaa !114
  store i32 0, i32* %222, align 4, !tbaa !116
  %230 = atomicrmw and i32* %212, i32 2147483647 seq_cst
  br i1 %229, label %491, label %231

; <label>:231:                                    ; preds = %221
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([157 x i8], [157 x i8]* @.str.32, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %491

; <label>:232:                                    ; preds = %217
  %233 = atomicrmw and i32* %212, i32 2147483647 seq_cst
  br label %491

; <label>:234:                                    ; preds = %2
  %235 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %235) #10
  %236 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 4095
  store i8 0, i8* %236, align 1, !tbaa !11
  %237 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 1
  %238 = load i8, i8* %237, align 1, !tbaa !125
  %239 = zext i8 %238 to i32
  br label %240

; <label>:240:                                    ; preds = %240, %234
  %241 = phi i32 [ 8, %234 ], [ %243, %240 ]
  %242 = icmp slt i32 %241, %239
  %243 = shl i32 %241, 1
  br i1 %242, label %240, label %244

; <label>:244:                                    ; preds = %240
  %245 = ptrtoint [4096 x i8]* %3 to i64
  %246 = icmp slt i32 %241, 65
  br i1 %246, label %248, label %247

; <label>:247:                                    ; preds = %244
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([153 x i8], [153 x i8]* @.str.2.11, i64 0, i64 0)) #12
  call void @abort() #12
  br label %248

; <label>:248:                                    ; preds = %247, %244
  %249 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 5
  %250 = load i32, i32* %249, align 4, !tbaa !124
  %251 = icmp slt i32 %250, 2
  %252 = zext i32 %250 to i64
  %253 = getelementptr inbounds [11 x i8*], [11 x i8*]* @_ZZ20halide_default_traceE11event_types, i64 0, i64 %252
  %254 = load i8*, i8** %253, align 8, !tbaa !7
  %255 = call i8* @halide_string_to_string(i8* nonnull %235, i8* nonnull %236, i8* nonnull %254) #12
  %256 = call i8* @halide_string_to_string(i8* %255, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #12
  %257 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 0
  %258 = load i8*, i8** %257, align 8, !tbaa !110
  %259 = icmp eq i8* %258, null
  br i1 %259, label %260, label %262

; <label>:260:                                    ; preds = %248
  %261 = call i8* @halide_string_to_string(i8* %256, i8* nonnull %236, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %264

; <label>:262:                                    ; preds = %248
  %263 = call i8* @halide_string_to_string(i8* %256, i8* nonnull %236, i8* nonnull %258) #12
  br label %264

; <label>:264:                                    ; preds = %262, %260
  %265 = phi i8* [ %263, %262 ], [ %261, %260 ]
  %266 = call i8* @halide_string_to_string(i8* %265, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  %267 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 7
  %268 = load i32, i32* %267, align 4, !tbaa !126
  %269 = sext i32 %268 to i64
  %270 = call i8* @halide_int64_to_string(i8* %266, i8* nonnull %236, i64 %269, i32 1) #12
  %271 = call i8* @halide_string_to_string(i8* %270, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22.190, i64 0, i64 0)) #12
  %272 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 2
  %273 = load i16, i16* %272, align 2, !tbaa !103
  %274 = icmp ugt i16 %273, 1
  br i1 %274, label %275, label %277

; <label>:275:                                    ; preds = %264
  %276 = call i8* @halide_string_to_string(i8* %271, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0)) #12
  br label %277

; <label>:277:                                    ; preds = %275, %264
  %278 = phi i8* [ %276, %275 ], [ %271, %264 ]
  %279 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 8
  %280 = load i32, i32* %279, align 8, !tbaa !109
  %281 = icmp sgt i32 %280, 0
  br i1 %281, label %282, label %.loopexit4

; <label>:282:                                    ; preds = %277
  %283 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 2
  br label %290

.loopexit4:                                       ; preds = %303, %277
  %284 = phi i8* [ %278, %277 ], [ %309, %303 ]
  %285 = load i16, i16* %272, align 2, !tbaa !103
  %286 = icmp ugt i16 %285, 1
  %287 = select i1 %286, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)
  %288 = call i8* @halide_string_to_string(i8* %284, i8* nonnull %236, i8* nonnull %287) #12
  %289 = ptrtoint i8* %288 to i64
  br i1 %251, label %314, label %459

; <label>:290:                                    ; preds = %303, %282
  %291 = phi i64 [ 0, %282 ], [ %310, %303 ]
  %292 = phi i8* [ %278, %282 ], [ %309, %303 ]
  %293 = icmp eq i64 %291, 0
  br i1 %293, label %303, label %294

; <label>:294:                                    ; preds = %290
  %295 = load i16, i16* %272, align 2, !tbaa !103
  %296 = icmp ugt i16 %295, 1
  br i1 %296, label %297, label %.sink.split

; <label>:297:                                    ; preds = %294
  %298 = zext i16 %295 to i32
  %299 = trunc i64 %291 to i32
  %300 = urem i32 %299, %298
  %301 = icmp eq i32 %300, 0
  %spec.select = select i1 %301, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)
  br label %.sink.split

.sink.split:                                      ; preds = %297, %294
  %.sink = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0), %294 ], [ %spec.select, %297 ]
  %302 = call i8* @halide_string_to_string(i8* %292, i8* nonnull %236, i8* nonnull %.sink) #12
  br label %303

; <label>:303:                                    ; preds = %.sink.split, %290
  %304 = phi i8* [ %292, %290 ], [ %302, %.sink.split ]
  %305 = load i32*, i32** %283, align 8, !tbaa !120
  %306 = getelementptr inbounds i32, i32* %305, i64 %291
  %307 = load i32, i32* %306, align 4, !tbaa !99
  %308 = sext i32 %307 to i64
  %309 = call i8* @halide_int64_to_string(i8* %304, i8* nonnull %236, i64 %308, i32 1) #12
  %310 = add nuw nsw i64 %291, 1
  %311 = load i32, i32* %279, align 8, !tbaa !109
  %312 = sext i32 %311 to i64
  %313 = icmp slt i64 %310, %312
  br i1 %313, label %290, label %.loopexit4

; <label>:314:                                    ; preds = %.loopexit4
  %315 = load i16, i16* %272, align 2, !tbaa !103
  %316 = icmp ugt i16 %315, 1
  %317 = select i1 %316, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0)
  %318 = call i8* @halide_string_to_string(i8* %288, i8* nonnull %236, i8* nonnull %317) #12
  %319 = ptrtoint i8* %318 to i64
  %320 = load i16, i16* %272, align 2, !tbaa !103
  %321 = icmp eq i16 %320, 0
  br i1 %321, label %459, label %322

; <label>:322:                                    ; preds = %314
  %323 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 4, i32 0
  %324 = icmp sgt i32 %241, 15
  %325 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 1
  %326 = bitcast i8** %325 to i8***
  %327 = icmp eq i32 %241, 32
  %328 = bitcast i8** %325 to i16**
  %329 = bitcast i8** %325 to float**
  %330 = icmp eq i32 %241, 16
  br label %333

; <label>:331:                                    ; preds = %449
  %332 = icmp ugt i16 %452, 1
  br i1 %332, label %455, label %459

; <label>:333:                                    ; preds = %449, %322
  %334 = phi i64 [ 0, %322 ], [ %451, %449 ]
  %335 = phi i64 [ %319, %322 ], [ %450, %449 ]
  %336 = icmp eq i64 %334, 0
  br i1 %336, label %341, label %337

; <label>:337:                                    ; preds = %333
  %338 = inttoptr i64 %335 to i8*
  %339 = call i8* @halide_string_to_string(i8* %338, i8* nonnull %236, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %340 = ptrtoint i8* %339 to i64
  br label %341

; <label>:341:                                    ; preds = %337, %333
  %342 = phi i64 [ %335, %333 ], [ %340, %337 ]
  %343 = load i8, i8* %323, align 8, !tbaa !127
  switch i8 %343, label %449 [
    i8 0, label %344
    i8 1, label %378
    i8 2, label %412
    i8 3, label %442
  ]

; <label>:344:                                    ; preds = %341
  switch i32 %241, label %361 [
    i32 8, label %345
    i32 16, label %353
  ]

; <label>:345:                                    ; preds = %344
  %346 = load i8*, i8** %325, align 8, !tbaa !121
  %347 = getelementptr inbounds i8, i8* %346, i64 %334
  %348 = load i8, i8* %347, align 1, !tbaa !11
  %349 = inttoptr i64 %342 to i8*
  %350 = sext i8 %348 to i64
  %351 = call i8* @halide_int64_to_string(i8* %349, i8* nonnull %236, i64 %350, i32 1) #12
  %352 = ptrtoint i8* %351 to i64
  br label %449

; <label>:353:                                    ; preds = %344
  %354 = load i16*, i16** %328, align 8, !tbaa !121
  %355 = getelementptr inbounds i16, i16* %354, i64 %334
  %356 = load i16, i16* %355, align 2, !tbaa !128
  %357 = inttoptr i64 %342 to i8*
  %358 = sext i16 %356 to i64
  %359 = call i8* @halide_int64_to_string(i8* %357, i8* nonnull %236, i64 %358, i32 1) #12
  %360 = ptrtoint i8* %359 to i64
  br label %449

; <label>:361:                                    ; preds = %344
  %362 = load i8*, i8** %325, align 8, !tbaa !121
  br i1 %327, label %363, label %371

; <label>:363:                                    ; preds = %361
  %364 = bitcast i8* %362 to i32*
  %365 = getelementptr inbounds i32, i32* %364, i64 %334
  %366 = load i32, i32* %365, align 4, !tbaa !99
  %367 = inttoptr i64 %342 to i8*
  %368 = sext i32 %366 to i64
  %369 = call i8* @halide_int64_to_string(i8* %367, i8* nonnull %236, i64 %368, i32 1) #12
  %370 = ptrtoint i8* %369 to i64
  br label %449

; <label>:371:                                    ; preds = %361
  %372 = bitcast i8* %362 to i64*
  %373 = getelementptr inbounds i64, i64* %372, i64 %334
  %374 = load i64, i64* %373, align 8, !tbaa !89
  %375 = inttoptr i64 %342 to i8*
  %376 = call i8* @halide_int64_to_string(i8* %375, i8* nonnull %236, i64 %374, i32 1) #12
  %377 = ptrtoint i8* %376 to i64
  br label %449

; <label>:378:                                    ; preds = %341
  switch i32 %241, label %395 [
    i32 8, label %379
    i32 16, label %387
  ]

; <label>:379:                                    ; preds = %378
  %380 = load i8*, i8** %325, align 8, !tbaa !121
  %381 = getelementptr inbounds i8, i8* %380, i64 %334
  %382 = load i8, i8* %381, align 1, !tbaa !11
  %383 = inttoptr i64 %342 to i8*
  %384 = zext i8 %382 to i64
  %385 = call i8* @halide_int64_to_string(i8* %383, i8* nonnull %236, i64 %384, i32 1) #12
  %386 = ptrtoint i8* %385 to i64
  br label %449

; <label>:387:                                    ; preds = %378
  %388 = load i16*, i16** %328, align 8, !tbaa !121
  %389 = getelementptr inbounds i16, i16* %388, i64 %334
  %390 = load i16, i16* %389, align 2, !tbaa !128
  %391 = inttoptr i64 %342 to i8*
  %392 = zext i16 %390 to i64
  %393 = call i8* @halide_int64_to_string(i8* %391, i8* nonnull %236, i64 %392, i32 1) #12
  %394 = ptrtoint i8* %393 to i64
  br label %449

; <label>:395:                                    ; preds = %378
  %396 = load i8*, i8** %325, align 8, !tbaa !121
  br i1 %327, label %397, label %405

; <label>:397:                                    ; preds = %395
  %398 = bitcast i8* %396 to i32*
  %399 = getelementptr inbounds i32, i32* %398, i64 %334
  %400 = load i32, i32* %399, align 4, !tbaa !99
  %401 = inttoptr i64 %342 to i8*
  %402 = zext i32 %400 to i64
  %403 = call i8* @halide_uint64_to_string(i8* %401, i8* nonnull %236, i64 %402, i32 1) #12
  %404 = ptrtoint i8* %403 to i64
  br label %449

; <label>:405:                                    ; preds = %395
  %406 = bitcast i8* %396 to i64*
  %407 = getelementptr inbounds i64, i64* %406, i64 %334
  %408 = load i64, i64* %407, align 8, !tbaa !89
  %409 = inttoptr i64 %342 to i8*
  %410 = call i8* @halide_uint64_to_string(i8* %409, i8* nonnull %236, i64 %408, i32 1) #12
  %411 = ptrtoint i8* %410 to i64
  br label %449

; <label>:412:                                    ; preds = %341
  br i1 %324, label %415, label %413

; <label>:413:                                    ; preds = %412
  call void @halide_print(i8* %0, i8* getelementptr inbounds ([155 x i8], [155 x i8]* @.str.24, i64 0, i64 0)) #12
  call void @abort() #12
  %414 = load i8*, i8** %325, align 8, !tbaa !121
  br label %434

; <label>:415:                                    ; preds = %412
  br i1 %327, label %416, label %424

; <label>:416:                                    ; preds = %415
  %417 = load float*, float** %329, align 8, !tbaa !121
  %418 = getelementptr inbounds float, float* %417, i64 %334
  %419 = load float, float* %418, align 4, !tbaa !129
  %420 = inttoptr i64 %342 to i8*
  %421 = fpext float %419 to double
  %422 = call i8* @halide_double_to_string(i8* %420, i8* nonnull %236, double %421, i32 0) #12
  %423 = ptrtoint i8* %422 to i64
  br label %449

; <label>:424:                                    ; preds = %415
  %425 = load i8*, i8** %325, align 8, !tbaa !121
  br i1 %330, label %426, label %434

; <label>:426:                                    ; preds = %424
  %427 = bitcast i8* %425 to i16*
  %428 = getelementptr inbounds i16, i16* %427, i64 %334
  %429 = load i16, i16* %428, align 2, !tbaa !128
  %430 = call double @halide_float16_bits_to_double(i16 zeroext %429) #12
  %431 = inttoptr i64 %342 to i8*
  %432 = call i8* @halide_double_to_string(i8* %431, i8* nonnull %236, double %430, i32 1) #12
  %433 = ptrtoint i8* %432 to i64
  br label %449

; <label>:434:                                    ; preds = %424, %413
  %435 = phi i8* [ %414, %413 ], [ %425, %424 ]
  %436 = bitcast i8* %435 to double*
  %437 = getelementptr inbounds double, double* %436, i64 %334
  %438 = load double, double* %437, align 8, !tbaa !131
  %439 = inttoptr i64 %342 to i8*
  %440 = call i8* @halide_double_to_string(i8* %439, i8* nonnull %236, double %438, i32 1) #12
  %441 = ptrtoint i8* %440 to i64
  br label %449

; <label>:442:                                    ; preds = %341
  %443 = load i8**, i8*** %326, align 8, !tbaa !121
  %444 = getelementptr inbounds i8*, i8** %443, i64 %334
  %445 = load i8*, i8** %444, align 8, !tbaa !7
  %446 = inttoptr i64 %342 to i8*
  %447 = call i8* @halide_pointer_to_string(i8* %446, i8* nonnull %236, i8* %445) #12
  %448 = ptrtoint i8* %447 to i64
  br label %449

; <label>:449:                                    ; preds = %442, %434, %426, %416, %405, %397, %387, %379, %371, %363, %353, %345, %341
  %450 = phi i64 [ %342, %341 ], [ %448, %442 ], [ %423, %416 ], [ %433, %426 ], [ %441, %434 ], [ %404, %397 ], [ %411, %405 ], [ %394, %387 ], [ %386, %379 ], [ %370, %363 ], [ %377, %371 ], [ %360, %353 ], [ %352, %345 ]
  %451 = add nuw nsw i64 %334, 1
  %452 = load i16, i16* %272, align 2, !tbaa !103
  %453 = zext i16 %452 to i64
  %454 = icmp ult i64 %451, %453
  br i1 %454, label %333, label %331

; <label>:455:                                    ; preds = %331
  %456 = inttoptr i64 %450 to i8*
  %457 = call i8* @halide_string_to_string(i8* %456, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i64 0, i64 0)) #12
  %458 = ptrtoint i8* %457 to i64
  br label %459

; <label>:459:                                    ; preds = %455, %331, %314, %.loopexit4
  %460 = phi i64 [ %458, %455 ], [ %450, %331 ], [ %289, %.loopexit4 ], [ %319, %314 ]
  %461 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %1, i64 0, i32 3
  %462 = load i8*, i8** %461, align 8, !tbaa !111
  %463 = icmp eq i8* %462, null
  br i1 %463, label %480, label %464

; <label>:464:                                    ; preds = %459
  %465 = load i8, i8* %462, align 1, !tbaa !11
  %466 = icmp eq i8 %465, 0
  br i1 %466, label %480, label %467

; <label>:467:                                    ; preds = %464
  %468 = inttoptr i64 %460 to i8*
  %469 = call i8* @halide_string_to_string(i8* %468, i8* nonnull %236, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i64 0, i64 0)) #12
  %470 = load i8*, i8** %461, align 8, !tbaa !111
  %471 = icmp eq i8* %470, null
  br i1 %471, label %472, label %474

; <label>:472:                                    ; preds = %467
  %473 = call i8* @halide_string_to_string(i8* %469, i8* nonnull %236, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %476

; <label>:474:                                    ; preds = %467
  %475 = call i8* @halide_string_to_string(i8* %469, i8* nonnull %236, i8* nonnull %470) #12
  br label %476

; <label>:476:                                    ; preds = %474, %472
  %477 = phi i8* [ %475, %474 ], [ %473, %472 ]
  %478 = call i8* @halide_string_to_string(i8* %477, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i64 0, i64 0)) #12
  %479 = ptrtoint i8* %478 to i64
  br label %480

; <label>:480:                                    ; preds = %476, %464, %459
  %481 = phi i64 [ %460, %459 ], [ %460, %464 ], [ %479, %476 ]
  %482 = inttoptr i64 %481 to i8*
  %483 = call i8* @halide_string_to_string(i8* %482, i8* nonnull %236, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #12
  %484 = ptrtoint i8* %483 to i64
  %485 = sub i64 1, %245
  %486 = add i64 %485, %484
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %235, i64 %486) #12
  br label %487

; <label>:487:                                    ; preds = %487, %480
  %488 = atomicrmw xchg i32* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i32 1 seq_cst
  %489 = icmp eq i32 %488, 0
  br i1 %489, label %490, label %487

; <label>:490:                                    ; preds = %487
  call void @halide_print(i8* %0, i8* nonnull %235) #12
  store atomic i32 0, i32* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 4
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %235, i64 %486) #12
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %235) #10
  br label %491

; <label>:491:                                    ; preds = %490, %232, %231, %221, %199
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_get_trace_file(i8*) local_unnamed_addr #0 {
  br label %2

; <label>:2:                                      ; preds = %2, %1
  %3 = atomicrmw xchg i32* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, i32 1 seq_cst
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %2

; <label>:5:                                      ; preds = %2
  %6 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !99
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %27

; <label>:8:                                      ; preds = %5
  %9 = tail call i8* @getenv(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.28, i64 0, i64 0)) #12
  %10 = icmp eq i8* %9, null
  br i1 %10, label %26, label %11

; <label>:11:                                     ; preds = %8
  %12 = tail call i8* @fopen(i8* nonnull %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i64 0, i64 0)) #12
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([152 x i8], [152 x i8]* @.str.30, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %15

; <label>:15:                                     ; preds = %14, %11
  %16 = tail call i32 @fileno(i8* %12) #12
  tail call void @halide_set_trace_file(i32 %16) #13
  store i8* %12, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !7
  %17 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !7
  %18 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %17, null
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %15
  %20 = tail call i8* @malloc(i64 1048588) #12
  store i8* %20, i8** bitcast (%"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE to i8**), align 8, !tbaa !7
  %21 = getelementptr inbounds i8, i8* %20, i64 4
  %22 = bitcast i8* %21 to i32*
  store i32 0, i32* %22, align 4, !tbaa !114
  %23 = getelementptr inbounds i8, i8* %20, i64 8
  %24 = bitcast i8* %23 to i32*
  store i32 0, i32* %24, align 4, !tbaa !116
  %25 = bitcast i8* %20 to i32*
  store volatile i32 0, i32* %25, align 4, !tbaa !112
  br label %27

; <label>:26:                                     ; preds = %8
  tail call void @halide_set_trace_file(i32 0) #13
  br label %27

; <label>:27:                                     ; preds = %26, %19, %15, %5
  %28 = load i32, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !99
  store atomic i32 0, i32* @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE release, align 4
  ret i32 %28
}

; Function Attrs: nounwind
declare noalias i8* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fileno(i8* nocapture) local_unnamed_addr #1

; Function Attrs: norecurse nounwind
define weak void @halide_set_trace_file(i32) local_unnamed_addr #2 {
  store i32 %0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !99
  ret void
}

; Function Attrs: nounwind
define weak void @halide_trace_cleanup() #0 {
  %1 = tail call i32 @halide_shutdown_trace() #13
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_shutdown_trace() local_unnamed_addr #0 {
  %1 = load i8*, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !7
  %2 = icmp eq i8* %1, null
  br i1 %2, label %9, label %3

; <label>:3:                                      ; preds = %0
  %4 = tail call i32 @fclose(i8* nonnull %1) #12
  store i32 0, i32* @_ZN6Halide7Runtime8Internal17halide_trace_fileE, align 4, !tbaa !99
  store i8 0, i8* @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, align 1, !tbaa !12
  store i8* null, i8** @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, align 8, !tbaa !7
  %5 = load %"class.Halide::Runtime::Internal::TraceBuffer"*, %"class.Halide::Runtime::Internal::TraceBuffer"** @_ZN6Halide7Runtime8Internal19halide_trace_bufferE, align 8, !tbaa !7
  %6 = icmp eq %"class.Halide::Runtime::Internal::TraceBuffer"* %5, null
  br i1 %6, label %9, label %7

; <label>:7:                                      ; preds = %3
  %8 = bitcast %"class.Halide::Runtime::Internal::TraceBuffer"* %5 to i8*
  tail call void @free(i8* %8) #12
  br label %9

; <label>:9:                                      ; preds = %7, %3, %0
  %10 = phi i32 [ %4, %3 ], [ %4, %7 ], [ 0, %0 ]
  ret i32 %10
}

; Function Attrs: nounwind
declare i32 @fclose(i8* nocapture) local_unnamed_addr #1

; Function Attrs: norecurse nounwind
define weak i32 (i8*, %struct.halide_trace_event_t*)* @halide_set_custom_trace(i32 (i8*, %struct.halide_trace_event_t*)*) local_unnamed_addr #2 {
  %2 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !7
  store i32 (i8*, %struct.halide_trace_event_t*)* %0, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !7
  ret i32 (i8*, %struct.halide_trace_event_t*)* %2
}

; Function Attrs: nounwind
define weak i32 @halide_trace(i8*, %struct.halide_trace_event_t*) local_unnamed_addr #0 {
  %3 = load i32 (i8*, %struct.halide_trace_event_t*)*, i32 (i8*, %struct.halide_trace_event_t*)** @_ZN6Halide7Runtime8Internal19halide_custom_traceE, align 8, !tbaa !7
  %4 = tail call i32 %3(i8* %0, %struct.halide_trace_event_t* %1) #12
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_trace_helper(i8*, i8*, i8*, i32*, i32, i32, i32, i32, i32, i32, i32, i8*) local_unnamed_addr #0 {
  %13 = alloca %struct.halide_trace_event_t, align 8
  %14 = bitcast %struct.halide_trace_event_t* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %14) #10
  %15 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 0
  %16 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 1
  %17 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 4, i32 2
  %18 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 0
  store i8* %1, i8** %18, align 8, !tbaa !110
  %19 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 1
  store i8* %2, i8** %19, align 8, !tbaa !121
  %20 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 2
  store i32* %3, i32** %20, align 8, !tbaa !120
  %21 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 3
  store i8* %11, i8** %21, align 8, !tbaa !111
  %22 = trunc i32 %4 to i8
  store i8 %22, i8* %15, align 8, !tbaa !127
  %23 = trunc i32 %5 to i8
  store i8 %23, i8* %16, align 1, !tbaa !125
  %24 = trunc i32 %6 to i16
  store i16 %24, i16* %17, align 2, !tbaa !103
  %25 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 5
  store i32 %7, i32* %25, align 4, !tbaa !124
  %26 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 6
  store i32 %8, i32* %26, align 8, !tbaa !133
  %27 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 7
  store i32 %9, i32* %27, align 4, !tbaa !126
  %28 = getelementptr inbounds %struct.halide_trace_event_t, %struct.halide_trace_event_t* %13, i64 0, i32 8
  store i32 %10, i32* %28, align 8, !tbaa !109
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 56) #12
  %29 = add nsw i32 %5, 7
  %30 = sdiv i32 %29, 8
  %31 = mul nsw i32 %30, %6
  %32 = sext i32 %31 to i64
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %2, i64 %32) #12
  %33 = bitcast i32* %3 to i8*
  %34 = sext i32 %10 to i64
  %35 = shl nsw i64 %34, 2
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* %33, i64 %35) #12
  %36 = call i32 @halide_trace(i8* %0, %struct.halide_trace_event_t* nonnull %13) #12
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %14) #10
  ret i32 %36
}

; Function Attrs: norecurse nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8*, i8*) local_unnamed_addr #2 {
  br label %3

; <label>:3:                                      ; preds = %3, %2
  %4 = phi i8* [ %0, %2 ], [ %7, %3 ]
  %5 = load i8, i8* %4, align 1, !tbaa !11
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds i8, i8* %4, i64 1
  br i1 %6, label %.preheader13, label %3

.preheader13:                                     ; preds = %3
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader13
  %9 = phi i8* [ %12, %8 ], [ %1, %.preheader13 ]
  %10 = load i8, i8* %9, align 1, !tbaa !11
  %11 = icmp eq i8 %10, 0
  %12 = getelementptr inbounds i8, i8* %9, i64 1
  br i1 %11, label %13, label %8

; <label>:13:                                     ; preds = %8
  %14 = icmp eq i8* %9, %1
  %15 = icmp eq i8* %4, %0
  %16 = or i1 %15, %14
  br i1 %16, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %13
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader
  %18 = phi i8* [ %21, %17 ], [ %9, %.preheader ]
  %19 = phi i8* [ %20, %17 ], [ %4, %.preheader ]
  %20 = getelementptr inbounds i8, i8* %19, i64 -1
  %21 = getelementptr inbounds i8, i8* %18, i64 -1
  %22 = icmp eq i8* %21, %1
  %23 = icmp eq i8* %20, %0
  %24 = load i8, i8* %20, align 1, !tbaa !11
  %25 = load i8, i8* %21, align 1, !tbaa !11
  %26 = icmp eq i8 %24, %25
  %27 = or i1 %22, %23
  %28 = xor i1 %26, true
  %29 = or i1 %27, %28
  br i1 %29, label %.loopexit, label %17

.loopexit:                                        ; preds = %17, %13
  %30 = phi i1 [ true, %13 ], [ %26, %17 ]
  %31 = phi i1 [ true, %13 ], [ %27, %17 ]
  %32 = and i1 %30, %31
  ret i1 %32
}

; Function Attrs: nounwind
define weak i32 @halide_debug_to_file(i8*, i8*, i32, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %5 = alloca [4 x %struct.halide_dimension_t], align 4
  %6 = alloca %"struct.Halide::Runtime::Internal::halide_tiff_header", align 2
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [256 x i8], align 1
  %10 = alloca [129 x i8], align 1
  %11 = alloca [8 x i32], align 4
  %12 = alloca [4 x i32], align 4
  %13 = alloca [2 x i32], align 4
  %14 = alloca [2 x i32], align 4
  %15 = alloca [5 x i32], align 4
  %16 = alloca [4096 x i8], align 1
  %17 = alloca [4 x i32], align 4
  %18 = alloca i64, align 8
  %19 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 5
  %20 = load i32, i32* %19, align 4, !tbaa !134
  %21 = icmp sgt i32 %20, 4
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %4
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.35, i64 0, i64 0)) #12
  br label %578

; <label>:23:                                     ; preds = %4
  %24 = tail call i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* nonnull %3) #12
  %25 = tail call i8* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1.36, i64 0, i64 0)) #12
  %26 = icmp eq i8* %25, null
  br i1 %26, label %575, label %27

; <label>:27:                                     ; preds = %23
  %28 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %28) #10
  %29 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0, i32 0
  %30 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0, i32 1
  %31 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1, i32 0
  %32 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 1, i32 1
  %33 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2, i32 0
  %34 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 2, i32 1
  %35 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3, i32 0
  %36 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 3, i32 1
  %37 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %37, i8 0, i64 64, i32 4, i1 false)
  %38 = load i32, i32* %19, align 4, !tbaa !134
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %._crit_edge41

._crit_edge41:                                    ; preds = %27
  %.pre42 = sext i32 %38 to i64
  br label %46

; <label>:40:                                     ; preds = %27
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %42 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %41, align 8, !tbaa !136
  %43 = sext i32 %38 to i64
  br label %48

; <label>:44:                                     ; preds = %48
  %45 = icmp slt i32 %38, 4
  br i1 %45, label %46, label %.loopexit3

; <label>:46:                                     ; preds = %44, %._crit_edge41
  %.pre-phi = phi i64 [ %.pre42, %._crit_edge41 ], [ %43, %44 ]
  %47 = phi i64 [ 1, %._crit_edge41 ], [ %58, %44 ]
  br label %70

; <label>:48:                                     ; preds = %48, %40
  %49 = phi i64 [ 0, %40 ], [ %59, %48 ]
  %50 = phi i64 [ 1, %40 ], [ %58, %48 ]
  %51 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 %49
  %52 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %49
  %53 = bitcast %struct.halide_dimension_t* %52 to i8*
  %54 = bitcast %struct.halide_dimension_t* %51 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %53, i8* %54, i64 16, i32 4, i1 false), !tbaa.struct !137
  %55 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %49, i32 1
  %56 = load i32, i32* %55, align 4, !tbaa !138
  %57 = sext i32 %56 to i64
  %58 = mul i64 %50, %57
  %59 = add nuw nsw i64 %49, 1
  %60 = icmp slt i64 %59, %43
  %61 = icmp ult i64 %59, 4
  %62 = and i1 %61, %60
  br i1 %62, label %48, label %44

.loopexit3:                                       ; preds = %70, %44
  %63 = phi i64 [ %58, %44 ], [ %47, %70 ]
  %64 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4, i32 1
  %65 = load i8, i8* %64, align 1, !tbaa !108
  %66 = zext i8 %65 to i32
  %67 = add nuw nsw i32 %66, 7
  %68 = lshr i32 %67, 3
  %69 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2.37, i64 0, i64 0)) #13
  br i1 %69, label %79, label %77

; <label>:70:                                     ; preds = %70, %46
  %71 = phi i64 [ %.pre-phi, %46 ], [ %75, %70 ]
  %72 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %71, i32 0
  store i32 0, i32* %72, align 4, !tbaa !140
  %73 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %71, i32 1
  store i32 1, i32* %73, align 4, !tbaa !138
  %74 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 %71, i32 2
  store i32 0, i32* %74, align 4, !tbaa !141
  %75 = add nsw i64 %71, 1
  %76 = icmp slt i64 %71, 3
  br i1 %76, label %70, label %.loopexit3

; <label>:77:                                     ; preds = %.loopexit3
  %78 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3.38, i64 0, i64 0)) #13
  br i1 %78, label %79, label %220

; <label>:79:                                     ; preds = %77, %.loopexit3
  %80 = load i32, i32* %30, align 4, !tbaa !138
  %81 = load i32, i32* %32, align 4, !tbaa !138
  %82 = load i32, i32* %36, align 4, !tbaa !138
  %83 = icmp ult i32 %82, 2
  %84 = load i32, i32* %34, align 4, !tbaa !138
  %85 = icmp slt i32 %84, 5
  %86 = and i1 %83, %85
  %87 = select i1 %86, i32 1, i32 %84
  %88 = select i1 %86, i32 %84, i32 %82
  %89 = bitcast %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 210, i8* nonnull %89) #10
  %90 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 0
  store i16 18761, i16* %90, align 2, !tbaa !142
  %91 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 1
  store i16 42, i16* %91, align 2, !tbaa !144
  %92 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 2
  store i32 8, i32* %92, align 2, !tbaa !145
  %93 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 3
  store i16 15, i16* %93, align 2, !tbaa !146
  %94 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 0
  store i16 256, i16* %94, align 2, !tbaa !147
  %95 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 1
  store i16 4, i16* %95, align 2, !tbaa !149
  %96 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 2
  store i32 1, i32* %96, align 2, !tbaa !150
  %97 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 0, i32 3, i32 0
  store i32 %80, i32* %97, align 2, !tbaa !11
  %98 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 0
  store i16 257, i16* %98, align 2, !tbaa !147
  %99 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 1
  store i16 4, i16* %99, align 2, !tbaa !149
  %100 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 2
  store i32 1, i32* %100, align 2, !tbaa !150
  %101 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 1, i32 3, i32 0
  store i32 %81, i32* %101, align 2, !tbaa !11
  %102 = trunc i32 %67 to i16
  %103 = and i16 %102, 504
  %104 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 0
  store i16 258, i16* %104, align 2, !tbaa !147
  %105 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 1
  store i16 3, i16* %105, align 2, !tbaa !149
  %106 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 2
  store i32 1, i32* %106, align 2, !tbaa !150
  %107 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 2, i32 3
  %108 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %107 to i16*
  store i16 %103, i16* %108, align 2, !tbaa !11
  %109 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 0
  store i16 259, i16* %109, align 2, !tbaa !147
  %110 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 1
  store i16 3, i16* %110, align 2, !tbaa !149
  %111 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 2
  store i32 1, i32* %111, align 2, !tbaa !150
  %112 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 3, i32 3
  %113 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %112 to i16*
  store i16 1, i16* %113, align 2, !tbaa !11
  %114 = icmp sgt i32 %88, 2
  %115 = select i1 %114, i16 2, i16 1
  %116 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 0
  store i16 262, i16* %116, align 2, !tbaa !147
  %117 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 1
  store i16 3, i16* %117, align 2, !tbaa !149
  %118 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 2
  store i32 1, i32* %118, align 2, !tbaa !150
  %119 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 4, i32 3
  %120 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %119 to i16*
  store i16 %115, i16* %120, align 2, !tbaa !11
  %121 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 0
  store i16 273, i16* %121, align 2, !tbaa !147
  %122 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 1
  store i16 4, i16* %122, align 2, !tbaa !149
  %123 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 2
  store i32 %88, i32* %123, align 2, !tbaa !150
  %124 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 5, i32 3, i32 0
  store i32 210, i32* %124, align 2, !tbaa !11
  %125 = trunc i32 %88 to i16
  %126 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 0
  store i16 277, i16* %126, align 2, !tbaa !147
  %127 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 1
  store i16 3, i16* %127, align 2, !tbaa !149
  %128 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 2
  store i32 1, i32* %128, align 2, !tbaa !150
  %129 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 6, i32 3
  %130 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %129 to i16*
  store i16 %125, i16* %130, align 2, !tbaa !11
  %131 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 0
  store i16 278, i16* %131, align 2, !tbaa !147
  %132 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 1
  store i16 4, i16* %132, align 2, !tbaa !149
  %133 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 2
  store i32 1, i32* %133, align 2, !tbaa !150
  %134 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 7, i32 3, i32 0
  store i32 %81, i32* %134, align 2, !tbaa !11
  %135 = icmp eq i32 %88, 1
  br i1 %135, label %136, label %139

; <label>:136:                                    ; preds = %79
  %137 = zext i32 %68 to i64
  %138 = mul i64 %63, %137
  br label %143

; <label>:139:                                    ; preds = %79
  %140 = sext i32 %88 to i64
  %141 = shl nsw i64 %140, 2
  %142 = add nsw i64 %141, 210
  br label %143

; <label>:143:                                    ; preds = %139, %136
  %144 = phi i64 [ %138, %136 ], [ %142, %139 ]
  %145 = trunc i64 %144 to i32
  %146 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 0
  store i16 279, i16* %146, align 2, !tbaa !147
  %147 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 1
  store i16 4, i16* %147, align 2, !tbaa !149
  %148 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 2
  store i32 %88, i32* %148, align 2, !tbaa !150
  %149 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 8, i32 3, i32 0
  store i32 %145, i32* %149, align 2, !tbaa !11
  %150 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 0
  store i16 282, i16* %150, align 2, !tbaa !147
  %151 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 1
  store i16 5, i16* %151, align 2, !tbaa !149
  %152 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 2
  store i32 1, i32* %152, align 2, !tbaa !150
  %153 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 9, i32 3, i32 0
  store i32 194, i32* %153, align 2, !tbaa !11
  %154 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 0
  store i16 283, i16* %154, align 2, !tbaa !147
  %155 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 1
  store i16 5, i16* %155, align 2, !tbaa !149
  %156 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 2
  store i32 1, i32* %156, align 2, !tbaa !150
  %157 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 10, i32 3, i32 0
  store i32 202, i32* %157, align 2, !tbaa !11
  %158 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 0
  store i16 284, i16* %158, align 2, !tbaa !147
  %159 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 1
  store i16 3, i16* %159, align 2, !tbaa !149
  %160 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 2
  store i32 1, i32* %160, align 2, !tbaa !150
  %161 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 11, i32 3
  %162 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %161 to i16*
  store i16 2, i16* %162, align 2, !tbaa !11
  %163 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 0
  store i16 296, i16* %163, align 2, !tbaa !147
  %164 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 1
  store i16 3, i16* %164, align 2, !tbaa !149
  %165 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 2
  store i32 1, i32* %165, align 2, !tbaa !150
  %166 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 12, i32 3
  %167 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %166 to i16*
  store i16 1, i16* %167, align 2, !tbaa !11
  %168 = sext i32 %2 to i64
  %169 = getelementptr inbounds [10 x i16], [10 x i16]* @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, i64 0, i64 %168
  %170 = load i16, i16* %169, align 2, !tbaa !128
  %171 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 0
  store i16 339, i16* %171, align 2, !tbaa !147
  %172 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 1
  store i16 3, i16* %172, align 2, !tbaa !149
  %173 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 2
  store i32 1, i32* %173, align 2, !tbaa !150
  %174 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 13, i32 3
  %175 = bitcast %"class.Halide::Runtime::Internal::SharedExclusiveSpinLock"* %174 to i16*
  store i16 %170, i16* %175, align 2, !tbaa !11
  %176 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 0
  store i16 -32539, i16* %176, align 2, !tbaa !147
  %177 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 1
  store i16 4, i16* %177, align 2, !tbaa !149
  %178 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 2
  store i32 1, i32* %178, align 2, !tbaa !150
  %179 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 4, i64 14, i32 3, i32 0
  store i32 %87, i32* %179, align 2, !tbaa !11
  %180 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 5
  %181 = bitcast i32* %180 to <4 x i32>*
  store <4 x i32> <i32 0, i32 1, i32 1, i32 1>, <4 x i32>* %181, align 2, !tbaa !99
  %182 = getelementptr inbounds %"struct.Halide::Runtime::Internal::halide_tiff_header", %"struct.Halide::Runtime::Internal::halide_tiff_header"* %6, i64 0, i32 7, i64 1
  store i32 1, i32* %182, align 2, !tbaa !99
  %183 = call i64 @fwrite(i8* nonnull %89, i64 210, i64 1, i8* nonnull %25) #12
  %184 = icmp eq i64 %183, 0
  br i1 %184, label %217, label %185

; <label>:185:                                    ; preds = %143
  %186 = icmp sgt i32 %88, 1
  br i1 %186, label %187, label %219

; <label>:187:                                    ; preds = %185
  %188 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %188) #10
  %189 = shl i32 %88, 3
  %190 = add i32 %189, 210
  store i32 %190, i32* %7, align 4, !tbaa !99
  %191 = mul i32 %87, %68
  %192 = load i32, i32* %30, align 4
  %193 = load i32, i32* %32, align 4
  %194 = mul i32 %191, %192
  %195 = mul i32 %194, %193
  br label %196

; <label>:196:                                    ; preds = %201, %187
  %197 = phi i32 [ 0, %187 ], [ %204, %201 ]
  %198 = call i64 @fwrite(i8* nonnull %188, i64 4, i64 1, i8* nonnull %25) #12
  %199 = icmp eq i64 %198, 0
  br i1 %199, label %200, label %201

; <label>:200:                                    ; preds = %196
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %188) #10
  br label %217

; <label>:201:                                    ; preds = %196
  %202 = load i32, i32* %7, align 4, !tbaa !99
  %203 = add nsw i32 %195, %202
  store i32 %203, i32* %7, align 4, !tbaa !99
  %204 = add nuw nsw i32 %197, 1
  %205 = icmp slt i32 %204, %88
  br i1 %205, label %196, label %206

; <label>:206:                                    ; preds = %201
  %207 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %207) #10
  store i32 %195, i32* %8, align 4, !tbaa !99
  %208 = icmp sgt i32 %88, 0
  br i1 %208, label %.preheader81, label %.loopexit1

.preheader81:                                     ; preds = %206
  br label %211

; <label>:209:                                    ; preds = %211
  %210 = icmp slt i32 %215, %88
  br i1 %210, label %211, label %.loopexit1

.loopexit1:                                       ; preds = %209, %206
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %207) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %188) #10
  br label %219

; <label>:211:                                    ; preds = %209, %.preheader81
  %212 = phi i32 [ %215, %209 ], [ 0, %.preheader81 ]
  %213 = call i64 @fwrite(i8* nonnull %207, i64 4, i64 1, i8* nonnull %25) #12
  %214 = icmp eq i64 %213, 0
  %215 = add nuw nsw i32 %212, 1
  br i1 %214, label %216, label %209

; <label>:216:                                    ; preds = %211
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %207) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %188) #10
  br label %217

; <label>:217:                                    ; preds = %216, %200, %143
  %218 = phi i32 [ -4, %200 ], [ -3, %143 ], [ -5, %216 ]
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %89) #10
  br label %573

; <label>:219:                                    ; preds = %.loopexit1, %185
  call void @llvm.lifetime.end.p0i8(i64 210, i8* nonnull %89) #10
  br label %428

; <label>:220:                                    ; preds = %77
  %221 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.39, i64 0, i64 0)) #13
  br i1 %221, label %.preheader84, label %415

.preheader84:                                     ; preds = %220
  br label %222

; <label>:222:                                    ; preds = %222, %.preheader84
  %223 = phi i8* [ %226, %222 ], [ %1, %.preheader84 ]
  %224 = load i8, i8* %223, align 1, !tbaa !11
  %225 = icmp eq i8 %224, 0
  %226 = getelementptr inbounds i8, i8* %223, i64 1
  br i1 %225, label %.preheader83, label %222

.preheader83:                                     ; preds = %222
  br label %227

; <label>:227:                                    ; preds = %227, %.preheader83
  %228 = phi i8* [ %229, %227 ], [ %223, %.preheader83 ]
  %229 = getelementptr inbounds i8, i8* %228, i64 -1
  %230 = load i8, i8* %229, align 1, !tbaa !11
  %231 = icmp eq i8 %230, 46
  br i1 %231, label %232, label %227

; <label>:232:                                    ; preds = %227
  %233 = icmp eq i8* %229, %1
  br i1 %233, label %234, label %.preheader82

.preheader82:                                     ; preds = %232
  br label %242

; <label>:234:                                    ; preds = %232
  %235 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %235) #10
  br label %.loopexit2.loopexit

; <label>:236:                                    ; preds = %242
  %237 = icmp eq i8* %245, %1
  br i1 %237, label %238, label %242

; <label>:238:                                    ; preds = %236
  %239 = trunc i64 %244 to i32
  %240 = xor i32 %239, -1
  %241 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %241) #10
  br label %253

; <label>:242:                                    ; preds = %236, %.preheader82
  %243 = phi i64 [ %244, %236 ], [ -1, %.preheader82 ]
  %244 = add nsw i64 %243, -1
  %245 = getelementptr inbounds i8, i8* %228, i64 %244
  %246 = load i8, i8* %245, align 1, !tbaa !11
  %247 = icmp eq i8 %246, 47
  br i1 %247, label %248, label %236

; <label>:248:                                    ; preds = %242
  %249 = trunc i64 %243 to i32
  %250 = xor i32 %249, -1
  %251 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %251) #10
  %252 = icmp eq i64 %243, -1
  br i1 %252, label %.loopexit2.loopexit, label %253

; <label>:253:                                    ; preds = %248, %238
  %254 = phi i8* [ %241, %238 ], [ %251, %248 ]
  %255 = phi i32 [ %240, %238 ], [ %250, %248 ]
  %256 = phi i32 [ %239, %238 ], [ %249, %248 ]
  %257 = phi i64 [ %244, %238 ], [ %243, %248 ]
  br label %258

; <label>:258:                                    ; preds = %258, %253
  %259 = phi i8* [ %254, %253 ], [ %264, %258 ]
  %260 = phi i64 [ %257, %253 ], [ %262, %258 ]
  %261 = getelementptr inbounds i8, i8* %228, i64 %260
  %262 = add nuw nsw i64 %260, 1
  %263 = load i8, i8* %261, align 1, !tbaa !11
  %264 = getelementptr inbounds i8, i8* %259, i64 1
  store i8 %263, i8* %259, align 1, !tbaa !11
  %265 = icmp eq i64 %262, -1
  br i1 %265, label %266, label %258

; <label>:266:                                    ; preds = %258
  %267 = xor i64 %257, -1
  %268 = getelementptr [256 x i8], [256 x i8]* %9, i64 0, i64 %267
  %269 = getelementptr inbounds [256 x i8], [256 x i8]* %9, i64 0, i64 256
  %270 = icmp ult i8* %268, %269
  br i1 %270, label %.loopexit2.loopexit, label %.loopexit2

.loopexit2.loopexit:                              ; preds = %266, %248, %234
  %271 = phi i8* [ %268, %266 ], [ %235, %234 ], [ %251, %248 ]
  %272 = phi i32 [ %256, %266 ], [ -1, %234 ], [ -1, %248 ]
  %273 = phi i32 [ %255, %266 ], [ 0, %234 ], [ %250, %248 ]
  %274 = phi i8* [ %254, %266 ], [ %235, %234 ], [ %251, %248 ]
  %275 = ptrtoint i8* %271 to i64
  %276 = sub i64 0, %275
  %scevgep = getelementptr [256 x i8], [256 x i8]* %9, i64 1, i64 %276
  %scevgep40 = ptrtoint i8* %scevgep to i64
  call void @llvm.memset.p0i8.i64(i8* %271, i8 0, i64 %scevgep40, i32 1, i1 false)
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %266
  %277 = phi i32 [ %256, %266 ], [ %272, %.loopexit2.loopexit ]
  %278 = phi i32 [ %255, %266 ], [ %273, %.loopexit2.loopexit ]
  %279 = phi i8* [ %254, %266 ], [ %274, %.loopexit2.loopexit ]
  %280 = sub i32 6, %277
  %281 = and i32 %280, -8
  %282 = getelementptr inbounds [129 x i8], [129 x i8]* %10, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 129, i8* nonnull %282) #10
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %282, i8* getelementptr inbounds ([129 x i8], [129 x i8]* @_ZZ20halide_debug_to_fileE6header, i64 0, i64 0), i64 129, i32 1, i1 false)
  %283 = call i64 @fwrite(i8* nonnull %282, i64 128, i64 1, i8* nonnull %25) #12
  %284 = load i32, i32* %19, align 4, !tbaa !134
  %285 = icmp sgt i32 %284, 0
  br i1 %285, label %288, label %286

; <label>:286:                                    ; preds = %.loopexit2
  %287 = load i8, i8* %64, align 1, !tbaa !108
  br label %330

; <label>:288:                                    ; preds = %.loopexit2
  %289 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %290 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %289, align 8, !tbaa !136
  %291 = sext i32 %284 to i64
  br label %292

; <label>:292:                                    ; preds = %305, %288
  %293 = phi i64 [ 0, %288 ], [ %307, %305 ]
  %294 = phi i64 [ 0, %288 ], [ %306, %305 ]
  %295 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %290, i64 %293, i32 2
  %296 = load i32, i32* %295, align 4, !tbaa !141
  %297 = icmp sgt i32 %296, 0
  br i1 %297, label %298, label %305

; <label>:298:                                    ; preds = %292
  %299 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %290, i64 %293, i32 1
  %300 = load i32, i32* %299, align 4, !tbaa !138
  %301 = add nsw i32 %300, -1
  %302 = mul nsw i32 %301, %296
  %303 = sext i32 %302 to i64
  %304 = add nsw i64 %294, %303
  br label %305

; <label>:305:                                    ; preds = %298, %292
  %306 = phi i64 [ %304, %298 ], [ %294, %292 ]
  %307 = add nuw nsw i64 %293, 1
  %308 = icmp eq i64 %307, %291
  br i1 %308, label %309, label %292

; <label>:309:                                    ; preds = %305
  %310 = load i8, i8* %64, align 1, !tbaa !108
  br label %311

; <label>:311:                                    ; preds = %324, %309
  %312 = phi i64 [ 0, %309 ], [ %326, %324 ]
  %313 = phi i64 [ 0, %309 ], [ %325, %324 ]
  %314 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %290, i64 %312, i32 2
  %315 = load i32, i32* %314, align 4, !tbaa !141
  %316 = icmp slt i32 %315, 0
  br i1 %316, label %317, label %324

; <label>:317:                                    ; preds = %311
  %318 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %290, i64 %312, i32 1
  %319 = load i32, i32* %318, align 4, !tbaa !138
  %320 = add nsw i32 %319, -1
  %321 = mul nsw i32 %320, %315
  %322 = sext i32 %321 to i64
  %323 = add nsw i64 %313, %322
  br label %324

; <label>:324:                                    ; preds = %317, %311
  %325 = phi i64 [ %323, %317 ], [ %313, %311 ]
  %326 = add nuw nsw i64 %312, 1
  %327 = icmp eq i64 %326, %291
  br i1 %327, label %328, label %311

; <label>:328:                                    ; preds = %324
  %329 = add nsw i64 %306, 1
  br label %330

; <label>:330:                                    ; preds = %328, %286
  %331 = phi i8 [ %287, %286 ], [ %310, %328 ]
  %332 = phi i64 [ 1, %286 ], [ %329, %328 ]
  %333 = phi i64 [ 0, %286 ], [ %325, %328 ]
  %334 = zext i8 %331 to i64
  %335 = add nuw nsw i64 %334, 7
  %336 = lshr i64 %335, 3
  %337 = sub i64 %332, %333
  %338 = mul i64 %337, %336
  %339 = icmp ugt i64 %338, 4294967295
  br i1 %339, label %340, label %341

; <label>:340:                                    ; preds = %330
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.5.40, i64 0, i64 0)) #12
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %282) #10
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %279) #10
  br label %573

; <label>:341:                                    ; preds = %330
  %342 = icmp sgt i32 %284, 2
  %343 = select i1 %342, i32 %284, i32 2
  %344 = bitcast [8 x i32]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %344) #10
  %345 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 0
  store i32 14, i32* %345, align 4, !tbaa !99
  %346 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 1
  %347 = shl i32 %343, 2
  %348 = add i32 %347, 4
  %349 = and i32 %348, -8
  %350 = trunc i64 %338 to i32
  %351 = add i32 %281, 40
  %352 = add i32 %351, %349
  %353 = add i32 %352, %350
  store i32 %353, i32* %346, align 4, !tbaa !99
  %354 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 2
  store i32 6, i32* %354, align 4, !tbaa !99
  %355 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 3
  store i32 8, i32* %355, align 4, !tbaa !99
  %356 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 4
  %357 = sext i32 %2 to i64
  %358 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, i64 0, i64 %357
  %359 = load i8, i8* %358, align 1, !tbaa !11
  %360 = zext i8 %359 to i32
  store i32 %360, i32* %356, align 4, !tbaa !99
  %361 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 5
  store i32 1, i32* %361, align 4, !tbaa !99
  %362 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 6
  store i32 5, i32* %362, align 4, !tbaa !99
  %363 = getelementptr inbounds [8 x i32], [8 x i32]* %11, i64 0, i64 7
  store i32 %347, i32* %363, align 4, !tbaa !99
  %364 = call i64 @fwrite(i8* nonnull %344, i64 32, i64 1, i8* nonnull %25) #12
  %365 = icmp eq i64 %364, 0
  br i1 %365, label %410, label %366

; <label>:366:                                    ; preds = %341
  %367 = bitcast [4 x i32]* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %367) #10
  %368 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 0
  %369 = load i32, i32* %30, align 4, !tbaa !138
  store i32 %369, i32* %368, align 4, !tbaa !99
  %370 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 1
  %371 = load i32, i32* %32, align 4, !tbaa !138
  store i32 %371, i32* %370, align 4, !tbaa !99
  %372 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 2
  %373 = load i32, i32* %34, align 4, !tbaa !138
  store i32 %373, i32* %372, align 4, !tbaa !99
  %374 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 0, i64 3
  %375 = load i32, i32* %36, align 4, !tbaa !138
  store i32 %375, i32* %374, align 4, !tbaa !99
  %376 = sext i32 %349 to i64
  %377 = call i64 @fwrite(i8* nonnull %367, i64 %376, i64 1, i8* nonnull %25) #12
  %378 = icmp eq i64 %377, 0
  br i1 %378, label %406, label %379

; <label>:379:                                    ; preds = %366
  %380 = bitcast [2 x i32]* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %380) #10
  %381 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 0
  store i32 1, i32* %381, align 4, !tbaa !99
  %382 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 1
  store i32 %278, i32* %382, align 4, !tbaa !99
  %383 = call i64 @fwrite(i8* nonnull %380, i64 8, i64 1, i8* nonnull %25) #12
  %384 = icmp eq i64 %383, 0
  br i1 %384, label %402, label %385

; <label>:385:                                    ; preds = %379
  %386 = zext i32 %281 to i64
  %387 = call i64 @fwrite(i8* nonnull %279, i64 %386, i64 1, i8* nonnull %25) #12
  %388 = icmp eq i64 %387, 0
  br i1 %388, label %402, label %389

; <label>:389:                                    ; preds = %385
  %390 = add i32 %350, 7
  %391 = and i32 %390, 7
  %392 = xor i32 %391, 7
  %393 = bitcast [2 x i32]* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %393) #10
  %394 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 0
  %395 = getelementptr inbounds [10 x i8], [10 x i8]* @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, i64 0, i64 %357
  %396 = load i8, i8* %395, align 1, !tbaa !11
  %397 = zext i8 %396 to i32
  store i32 %397, i32* %394, align 4, !tbaa !99
  %398 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 0, i64 1
  store i32 %350, i32* %398, align 4, !tbaa !99
  %399 = call i64 @fwrite(i8* nonnull %393, i64 8, i64 1, i8* nonnull %25) #12
  %400 = icmp eq i64 %399, 0
  %401 = zext i1 %400 to i32
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %393) #10
  br label %402

; <label>:402:                                    ; preds = %389, %385, %379
  %403 = phi i32 [ %392, %389 ], [ 0, %379 ], [ 0, %385 ]
  %404 = phi i32 [ %401, %389 ], [ 1, %379 ], [ 1, %385 ]
  %405 = phi i32 [ -11, %389 ], [ -9, %379 ], [ -10, %385 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %380) #10
  br label %406

; <label>:406:                                    ; preds = %402, %366
  %407 = phi i32 [ %403, %402 ], [ 0, %366 ]
  %408 = phi i32 [ %404, %402 ], [ 1, %366 ]
  %409 = phi i32 [ %405, %402 ], [ -8, %366 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %367) #10
  br label %410

; <label>:410:                                    ; preds = %406, %341
  %411 = phi i32 [ %407, %406 ], [ 0, %341 ]
  %412 = phi i32 [ %408, %406 ], [ 1, %341 ]
  %413 = phi i32 [ %409, %406 ], [ -7, %341 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %344) #10
  call void @llvm.lifetime.end.p0i8(i64 129, i8* nonnull %282) #10
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %279) #10
  %414 = icmp eq i32 %412, 0
  br i1 %414, label %428, label %573

; <label>:415:                                    ; preds = %220
  %416 = bitcast [5 x i32]* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %416) #10
  %417 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 0
  %418 = load i32, i32* %30, align 4, !tbaa !138
  store i32 %418, i32* %417, align 4, !tbaa !99
  %419 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 1
  %420 = load i32, i32* %32, align 4, !tbaa !138
  store i32 %420, i32* %419, align 4, !tbaa !99
  %421 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 2
  %422 = load i32, i32* %34, align 4, !tbaa !138
  store i32 %422, i32* %421, align 4, !tbaa !99
  %423 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 3
  %424 = load i32, i32* %36, align 4, !tbaa !138
  store i32 %424, i32* %423, align 4, !tbaa !99
  %425 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 0, i64 4
  store i32 %2, i32* %425, align 4, !tbaa !99
  %426 = call i64 @fwrite(i8* nonnull %416, i64 20, i64 1, i8* nonnull %25) #12
  %427 = icmp eq i64 %426, 0
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %416) #10
  br i1 %427, label %573, label %428

; <label>:428:                                    ; preds = %415, %410, %219
  %429 = phi i32 [ 0, %415 ], [ 0, %219 ], [ %411, %410 ]
  %430 = getelementptr inbounds [4096 x i8], [4096 x i8]* %16, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %430) #10
  %431 = udiv i32 4096, %68
  %432 = load i32, i32* %36, align 4, !tbaa !138
  %433 = icmp sgt i32 %432, 0
  br i1 %433, label %434, label %558

; <label>:434:                                    ; preds = %428
  %435 = load i32, i32* %35, align 4, !tbaa !140
  %436 = bitcast [4 x i32]* %17 to i8*
  %437 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 0
  %438 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 1
  %439 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 2
  %440 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 3
  %441 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %442 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %443 = zext i32 %68 to i64
  %444 = mul nuw nsw i32 %431, %68
  %445 = zext i32 %444 to i64
  %446 = load i32, i32* %34, align 4, !tbaa !138
  %447 = load i32, i32* %33, align 4
  %448 = load i32, i32* %32, align 4
  %449 = load i32, i32* %31, align 4
  %450 = load i32, i32* %30, align 4
  %451 = load i32, i32* %29, align 4
  %452 = add nsw i32 %451, %450
  %453 = load i32, i32* %34, align 4
  %454 = load i32, i32* %33, align 4
  %455 = load i32, i32* %36, align 4
  %456 = load i32, i32* %35, align 4
  br label %457

; <label>:457:                                    ; preds = %.loopexit63, %434
  %458 = phi i32 [ %435, %434 ], [ %543, %.loopexit63 ]
  %459 = phi i32 [ %432, %434 ], [ %544, %.loopexit63 ]
  %460 = phi i32 [ %446, %434 ], [ %545, %.loopexit63 ]
  %461 = phi i32 [ %435, %434 ], [ %547, %.loopexit63 ]
  %462 = phi i32 [ 0, %434 ], [ %546, %.loopexit63 ]
  %463 = icmp sgt i32 %460, 0
  br i1 %463, label %.preheader80, label %.loopexit63

.preheader80:                                     ; preds = %457
  br label %464

; <label>:464:                                    ; preds = %.loopexit62, %.preheader80
  %465 = phi i32 [ %537, %.loopexit62 ], [ %447, %.preheader80 ]
  %466 = phi i32 [ %538, %.loopexit62 ], [ %460, %.preheader80 ]
  %467 = phi i32 [ %540, %.loopexit62 ], [ %447, %.preheader80 ]
  %468 = phi i32 [ %539, %.loopexit62 ], [ %462, %.preheader80 ]
  %469 = icmp sgt i32 %448, 0
  br i1 %469, label %.preheader79, label %.loopexit62

.preheader79:                                     ; preds = %464
  br label %470

; <label>:470:                                    ; preds = %.loopexit61, %.preheader79
  %471 = phi i32 [ %534, %.loopexit61 ], [ %449, %.preheader79 ]
  %472 = phi i32 [ %533, %.loopexit61 ], [ %468, %.preheader79 ]
  %473 = icmp sgt i32 %450, 0
  br i1 %473, label %.preheader, label %.loopexit61

.preheader:                                       ; preds = %470
  br label %474

; <label>:474:                                    ; preds = %529, %.preheader
  %475 = phi i32 [ %531, %529 ], [ %451, %.preheader ]
  %476 = phi i32 [ %530, %529 ], [ %472, %.preheader ]
  %477 = add nsw i32 %476, 1
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %436) #10
  store i32 %475, i32* %437, align 4, !tbaa !99
  store i32 %471, i32* %438, align 4, !tbaa !99
  store i32 %467, i32* %439, align 4, !tbaa !99
  store i32 %461, i32* %440, align 4, !tbaa !99
  %478 = load i32, i32* %19, align 4, !tbaa !134
  %479 = icmp sgt i32 %478, 0
  br i1 %479, label %480, label %.loopexit

; <label>:480:                                    ; preds = %474
  %481 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %441, align 8, !tbaa !136
  %482 = sext i32 %478 to i64
  %483 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %481, i64 0, i32 2
  %484 = load i32, i32* %483, align 4, !tbaa !141
  %485 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %481, i64 0, i32 0
  %486 = load i32, i32* %485, align 4, !tbaa !140
  %487 = sub nsw i32 %475, %486
  %488 = mul nsw i32 %487, %484
  %489 = sext i32 %488 to i64
  %490 = icmp eq i32 %478, 1
  br i1 %490, label %.loopexit, label %491

; <label>:491:                                    ; preds = %480
  %492 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %481, i64 1, i32 2
  %493 = load i32, i32* %492, align 4, !tbaa !141
  %494 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %481, i64 1, i32 0
  %495 = load i32, i32* %494, align 4, !tbaa !140
  %496 = sub nsw i32 %471, %495
  %497 = mul nsw i32 %496, %493
  %498 = sext i32 %497 to i64
  %499 = add nsw i64 %489, %498
  %500 = icmp eq i32 %478, 2
  br i1 %500, label %.loopexit, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %491
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %501 = phi i64 [ %511, %._crit_edge ], [ 2, %._crit_edge.preheader ]
  %502 = phi i64 [ %510, %._crit_edge ], [ %499, %._crit_edge.preheader ]
  %.phi.trans.insert = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 0, i64 %501
  %.pre = load i32, i32* %.phi.trans.insert, align 4, !tbaa !99
  %503 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %481, i64 %501, i32 2
  %504 = load i32, i32* %503, align 4, !tbaa !141
  %505 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %481, i64 %501, i32 0
  %506 = load i32, i32* %505, align 4, !tbaa !140
  %507 = sub nsw i32 %.pre, %506
  %508 = mul nsw i32 %507, %504
  %509 = sext i32 %508 to i64
  %510 = add nsw i64 %502, %509
  %511 = add nuw nsw i64 %501, 1
  %512 = icmp eq i64 %511, %482
  br i1 %512, label %.loopexit, label %._crit_edge

.loopexit:                                        ; preds = %._crit_edge, %491, %480, %474
  %513 = phi i64 [ 0, %474 ], [ %489, %480 ], [ %499, %491 ], [ %510, %._crit_edge ]
  %514 = load i8*, i8** %442, align 8, !tbaa !151
  %515 = load i8, i8* %64, align 1, !tbaa !108
  %516 = zext i8 %515 to i64
  %517 = add nuw nsw i64 %516, 7
  %518 = lshr i64 %517, 3
  %519 = mul nsw i64 %518, %513
  %520 = getelementptr inbounds i8, i8* %514, i64 %519
  %521 = mul nsw i32 %476, %68
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds [4096 x i8], [4096 x i8]* %16, i64 0, i64 %522
  %524 = call i8* @memcpy(i8* nonnull %523, i8* %520, i64 %443) #12
  %525 = icmp eq i32 %477, %431
  br i1 %525, label %526, label %529

; <label>:526:                                    ; preds = %.loopexit
  %527 = call i64 @fwrite(i8* nonnull %430, i64 %445, i64 1, i8* nonnull %25) #12
  %528 = icmp eq i64 %527, 0
  br i1 %528, label %550, label %529

; <label>:529:                                    ; preds = %526, %.loopexit
  %530 = phi i32 [ 0, %526 ], [ %477, %.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %436) #10
  %531 = add nsw i32 %475, 1
  %532 = icmp slt i32 %531, %452
  br i1 %532, label %474, label %.loopexit61

.loopexit61:                                      ; preds = %529, %470
  %533 = phi i32 [ %472, %470 ], [ %530, %529 ]
  %534 = add nsw i32 %471, 1
  %535 = add nsw i32 %448, %449
  %536 = icmp slt i32 %534, %535
  br i1 %536, label %470, label %.loopexit62

.loopexit62:                                      ; preds = %.loopexit61, %464
  %537 = phi i32 [ %465, %464 ], [ %454, %.loopexit61 ]
  %538 = phi i32 [ %466, %464 ], [ %453, %.loopexit61 ]
  %539 = phi i32 [ %468, %464 ], [ %533, %.loopexit61 ]
  %540 = add nsw i32 %467, 1
  %541 = add nsw i32 %538, %537
  %542 = icmp slt i32 %540, %541
  br i1 %542, label %464, label %.loopexit63

.loopexit63:                                      ; preds = %.loopexit62, %457
  %543 = phi i32 [ %458, %457 ], [ %456, %.loopexit62 ]
  %544 = phi i32 [ %459, %457 ], [ %455, %.loopexit62 ]
  %545 = phi i32 [ %460, %457 ], [ %538, %.loopexit62 ]
  %546 = phi i32 [ %462, %457 ], [ %539, %.loopexit62 ]
  %547 = add nsw i32 %461, 1
  %548 = add nsw i32 %544, %543
  %549 = icmp slt i32 %547, %548
  br i1 %549, label %457, label %551

; <label>:550:                                    ; preds = %526
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %436) #10
  br label %571

; <label>:551:                                    ; preds = %.loopexit63
  %552 = icmp sgt i32 %546, 0
  br i1 %552, label %553, label %558

; <label>:553:                                    ; preds = %551
  %554 = mul nsw i32 %546, %68
  %555 = sext i32 %554 to i64
  %556 = call i64 @fwrite(i8* nonnull %430, i64 %555, i64 1, i8* nonnull %25) #12
  %557 = icmp eq i64 %556, 0
  br i1 %557, label %571, label %558

; <label>:558:                                    ; preds = %553, %551, %428
  %559 = bitcast i64* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %559) #10
  store i64 0, i64* %18, align 8, !tbaa !89
  %560 = icmp eq i32 %429, 0
  br i1 %560, label %568, label %561

; <label>:561:                                    ; preds = %558
  %562 = icmp ugt i32 %429, 8
  br i1 %562, label %563, label %564

; <label>:563:                                    ; preds = %561
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6.41, i64 0, i64 0)) #12
  br label %569

; <label>:564:                                    ; preds = %561
  %565 = zext i32 %429 to i64
  %566 = call i64 @fwrite(i8* nonnull %559, i64 %565, i64 1, i8* nonnull %25) #12
  %567 = icmp eq i64 %566, 0
  br i1 %567, label %569, label %568

; <label>:568:                                    ; preds = %564, %558
  br label %569

; <label>:569:                                    ; preds = %568, %564, %563
  %570 = phi i32 [ -15, %563 ], [ 0, %568 ], [ -16, %564 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %559) #10
  br label %571

; <label>:571:                                    ; preds = %569, %553, %550
  %572 = phi i32 [ %570, %569 ], [ -13, %550 ], [ -14, %553 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %430) #10
  br label %573

; <label>:573:                                    ; preds = %571, %415, %410, %340, %217
  %574 = phi i32 [ %572, %571 ], [ %413, %410 ], [ -12, %415 ], [ %218, %217 ], [ -6, %340 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %28) #10
  br label %575

; <label>:575:                                    ; preds = %573, %23
  %576 = phi i32 [ %574, %573 ], [ -2, %23 ]
  %577 = call i32 @fclose(i8* %25) #12
  br label %578

; <label>:578:                                    ; preds = %575, %22
  %579 = phi i32 [ -1, %22 ], [ %576, %575 ]
  ret i32 %579
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
define weak void @halide_cache_cleanup() #0 {
  tail call void @halide_memoization_cache_cleanup() #13
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_cleanup() local_unnamed_addr #0 {
  br label %2

; <label>:1:                                      ; preds = %.loopexit
  store i64 0, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !7
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !7
  ret void

; <label>:2:                                      ; preds = %.loopexit, %0
  %3 = phi i64 [ 0, %0 ], [ %13, %.loopexit ]
  %4 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %3
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !7
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !7
  %6 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %5, null
  br i1 %6, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %2
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %8 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %11, %7 ], [ %5, %.preheader ]
  %9 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %8 to i8*
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %8, i64 0, i32 0
  %11 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %10, align 8, !tbaa !152
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull %8) #13
  tail call void @halide_free(i8* null, i8* %9) #12
  %12 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %11, null
  br i1 %12, label %.loopexit, label %7

.loopexit:                                        ; preds = %7, %2
  %13 = add nuw nsw i64 %3, 1
  %14 = icmp eq i64 %13, 256
  br i1 %14, label %1, label %2
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"*) local_unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 8
  %3 = load i32, i32* %2, align 8, !tbaa !154
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %.loopexit, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 11
  br label %9

.loopexit:                                        ; preds = %9, %1
  %7 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 3
  %8 = load i8*, i8** %7, align 8, !tbaa !155
  tail call void @halide_free(i8* null, i8* %8) #12
  ret void

; <label>:9:                                      ; preds = %9, %5
  %10 = phi i64 [ 0, %5 ], [ %19, %9 ]
  %11 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !156
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %11, i64 %10
  %13 = tail call i32 @halide_device_free(i8* null, %struct.halide_buffer_t* %12) #12
  %14 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, align 8, !tbaa !156
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %14, i64 %10, i32 2
  %16 = load i8*, i8** %15, align 8, !tbaa !151
  %17 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %16) #13
  %18 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %17 to i8*
  tail call void @halide_free(i8* null, i8* %18) #12
  %19 = add nuw nsw i64 %10, 1
  %20 = load i32, i32* %2, align 8, !tbaa !154
  %21 = zext i32 %20 to i64
  %22 = icmp ult i64 %19, %21
  br i1 %22, label %9, label %.loopexit
}

; Function Attrs: norecurse nounwind
define linkonce %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8*) local_unnamed_addr #2 {
  %2 = getelementptr inbounds i8, i8* %0, i64 -64
  %3 = bitcast i8* %2 to %"struct.Halide::Runtime::Internal::CacheBlockHeader"*
  ret %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* dereferenceable(416), i32, i64, i64) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %1, -1
  br i1 %5, label %6, label %18

; <label>:6:                                      ; preds = %4
  %7 = sext i32 %1 to i64
  br label %8

; <label>:8:                                      ; preds = %13, %6
  %9 = phi i64 [ %7, %6 ], [ %14, %13 ]
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 3, i64 %9
  %11 = load i64, i64* %10, align 8, !tbaa !89
  %12 = icmp eq i64 %11, 1
  br i1 %12, label %13, label %33

; <label>:13:                                     ; preds = %8
  %14 = add nsw i64 %9, -1
  %15 = icmp sgt i64 %9, 0
  br i1 %15, label %8, label %16

; <label>:16:                                     ; preds = %13
  %17 = trunc i64 %14 to i32
  br label %18

; <label>:18:                                     ; preds = %16, %4
  %19 = phi i32 [ %1, %4 ], [ %17, %16 ]
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %21, label %35

; <label>:21:                                     ; preds = %18
  %22 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 0
  %23 = load i64, i64* %22, align 8, !tbaa !157
  %24 = add i64 %23, %2
  %25 = inttoptr i64 %24 to i8*
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 1
  %27 = load i64, i64* %26, align 8, !tbaa !159
  %28 = add i64 %27, %3
  %29 = inttoptr i64 %28 to i8*
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 6
  %31 = load i64, i64* %30, align 8, !tbaa !160
  %32 = tail call i8* @memcpy(i8* %29, i8* %25, i64 %31) #12
  br label %.loopexit

; <label>:33:                                     ; preds = %8
  %34 = trunc i64 %9 to i32
  br label %35

; <label>:35:                                     ; preds = %33, %18
  %36 = phi i32 [ %19, %18 ], [ %34, %33 ]
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 3, i64 %37
  %39 = load i64, i64* %38, align 8, !tbaa !89
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %.loopexit, label %41

; <label>:41:                                     ; preds = %35
  %42 = add nsw i32 %36, -1
  %43 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 4, i64 %37
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 5, i64 %37
  br label %45

; <label>:45:                                     ; preds = %45, %41
  %46 = phi i64 [ 0, %41 ], [ %53, %45 ]
  %47 = phi i64 [ %2, %41 ], [ %50, %45 ]
  %48 = phi i64 [ %3, %41 ], [ %52, %45 ]
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %0, i32 %42, i64 %47, i64 %48) #13
  %49 = load i64, i64* %43, align 8, !tbaa !89
  %50 = add i64 %49, %47
  %51 = load i64, i64* %44, align 8, !tbaa !89
  %52 = add i64 %51, %48
  %53 = add nuw i64 %46, 1
  %54 = load i64, i64* %38, align 8, !tbaa !89
  %55 = icmp ult i64 %53, %54
  br i1 %55, label %45, label %.loopexit

.loopexit:                                        ; preds = %45, %35, %21
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* dereferenceable(416), i8*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !157
  %5 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 1
  %6 = load i64, i64* %5, align 8, !tbaa !159
  %7 = icmp eq i64 %4, %6
  br i1 %7, label %11, label %8

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %0, i64 0, i32 2
  %10 = load i64, i64* %9, align 8, !tbaa !161
  tail call void @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %0, i32 15, i64 %10, i64 0) #13
  br label %11

; <label>:11:                                     ; preds = %8, %2
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* noalias sret, %struct.halide_buffer_t*, i1 zeroext, %struct.halide_buffer_t*, i1 zeroext) local_unnamed_addr #0 {
  %6 = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %7 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %7) #10
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %9 = bitcast i8** %8 to i64*
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = select i1 %2, i64* %9, i64* %10
  %12 = load i64, i64* %11, align 8, !tbaa !11
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 0
  store i64 %12, i64* %13, align 8, !tbaa !157
  %14 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %15 = bitcast i8** %14 to i64*
  %16 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %17 = select i1 %4, i64* %15, i64* %16
  %18 = load i64, i64* %17, align 8, !tbaa !11
  %19 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 1
  store i64 %18, i64* %19, align 8, !tbaa !159
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 4, i32 1
  %21 = load i8, i8* %20, align 1, !tbaa !108
  %22 = zext i8 %21 to i32
  %23 = add nuw nsw i32 %22, 7
  %24 = lshr i32 %23, 3
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 6
  store i64 %25, i64* %26, align 8, !tbaa !160
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 0
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 0
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 0
  %30 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 1
  %31 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 1
  %32 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 1
  %33 = bitcast i64* %27 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %33, align 8, !tbaa !89
  %34 = bitcast i64* %28 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %34, align 8, !tbaa !89
  %35 = bitcast i64* %29 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %35, align 8, !tbaa !89
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 4
  store i64 1, i64* %36, align 8, !tbaa !89
  %37 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 4
  %38 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 4
  %39 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 5
  %40 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 5
  %41 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 5
  %42 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 6
  %43 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 6
  %44 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 6
  %45 = bitcast i64* %37 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %45, align 8, !tbaa !89
  %46 = bitcast i64* %38 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %46, align 8, !tbaa !89
  %47 = bitcast i64* %39 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %47, align 8, !tbaa !89
  %48 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 8
  store i64 0, i64* %48, align 8, !tbaa !89
  %49 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 8
  store i64 0, i64* %49, align 8, !tbaa !89
  %50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 9
  store i64 1, i64* %50, align 8, !tbaa !89
  %51 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 9
  store i64 0, i64* %51, align 8, !tbaa !89
  %52 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 9
  %53 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 10
  %54 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 10
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 10
  %56 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 11
  %57 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 11
  %58 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 11
  %59 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 12
  %60 = bitcast i64* %52 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %60, align 8, !tbaa !89
  %61 = bitcast i64* %53 to <4 x i64>*
  store <4 x i64> <i64 1, i64 1, i64 1, i64 1>, <4 x i64>* %61, align 8, !tbaa !89
  %62 = bitcast i64* %54 to <4 x i64>*
  store <4 x i64> zeroinitializer, <4 x i64>* %62, align 8, !tbaa !89
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 13
  store i64 0, i64* %63, align 8, !tbaa !89
  %64 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 14
  store i64 1, i64* %64, align 8, !tbaa !89
  %65 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 14
  store i64 0, i64* %65, align 8, !tbaa !89
  %66 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 14
  store i64 0, i64* %66, align 8, !tbaa !89
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 15
  store i64 1, i64* %67, align 8, !tbaa !89
  %68 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 15
  store i64 0, i64* %68, align 8, !tbaa !89
  %69 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 15
  store i64 0, i64* %69, align 8, !tbaa !89
  %70 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 2
  store i64 0, i64* %70, align 8, !tbaa !161
  %71 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %72 = load i32, i32* %71, align 4, !tbaa !134
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %74, label %81

; <label>:74:                                     ; preds = %5
  %75 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %76 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %75, align 8, !tbaa !136
  %77 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %78 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %77, align 8, !tbaa !136
  %79 = sext i32 %72 to i64
  br label %87

; <label>:80:                                     ; preds = %87
  store i64 %99, i64* %70, align 8, !tbaa !161
  br label %81

; <label>:81:                                     ; preds = %80, %5
  %82 = phi i64 [ %99, %80 ], [ 0, %5 ]
  %83 = mul i64 %82, %25
  store i64 %83, i64* %70, align 8, !tbaa !161
  %84 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 5
  %85 = load i32, i32* %84, align 4, !tbaa !134
  %86 = icmp eq i32 %72, %85
  br i1 %86, label %101, label %110

; <label>:87:                                     ; preds = %87, %74
  %88 = phi i64 [ 0, %74 ], [ %100, %87 ]
  %89 = phi i64 [ 0, %74 ], [ %99, %87 ]
  %90 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %76, i64 %88, i32 2
  %91 = load i32, i32* %90, align 4, !tbaa !141
  %92 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %78, i64 %88, i32 0
  %93 = load i32, i32* %92, align 4, !tbaa !140
  %94 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %76, i64 %88, i32 0
  %95 = load i32, i32* %94, align 4, !tbaa !140
  %96 = sub nsw i32 %93, %95
  %97 = mul nsw i32 %96, %91
  %98 = sext i32 %97 to i64
  %99 = add i64 %89, %98
  %100 = add nuw nsw i64 %88, 1
  %exitcond = icmp eq i64 %100, %79
  br i1 %exitcond, label %80, label %87

; <label>:101:                                    ; preds = %81
  %102 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4, i32 1
  %103 = load i8, i8* %102, align 1, !tbaa !108
  %104 = zext i8 %103 to i32
  %105 = add nuw nsw i32 %104, 7
  %106 = lshr i32 %105, 3
  %107 = icmp ne i32 %24, %106
  %108 = icmp sgt i32 %72, 16
  %109 = or i1 %108, %107
  br i1 %109, label %110, label %112

; <label>:110:                                    ; preds = %101, %81
  %111 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %111, i8 0, i64 416, i32 8, i1 false)
  br label %228

; <label>:112:                                    ; preds = %101
  %113 = icmp eq i32 %24, 0
  br i1 %113, label %114, label %116

; <label>:114:                                    ; preds = %112
  %115 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %115, i8 0, i64 416, i32 8, i1 false)
  br label %228

; <label>:116:                                    ; preds = %112
  br i1 %73, label %117, label %.loopexit

; <label>:117:                                    ; preds = %116
  %118 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %119 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %118, align 8, !tbaa !136
  %120 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %121 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %120, align 8, !tbaa !136
  %122 = zext i32 %72 to i64
  br label %129

; <label>:123:                                    ; preds = %.loopexit1
  %124 = load i64, i64* %26, align 8, !tbaa !160
  %125 = load i64, i64* %28, align 8, !tbaa !89
  %126 = icmp eq i64 %124, %125
  br i1 %126, label %127, label %.loopexit

; <label>:127:                                    ; preds = %123
  %128 = load i64, i64* %29, align 8, !tbaa !89
  br label %181

; <label>:129:                                    ; preds = %.loopexit1, %117
  %130 = phi i64 [ 0, %117 ], [ %166, %.loopexit1 ]
  %131 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %119, i64 %130, i32 2
  %132 = load i32, i32* %131, align 4, !tbaa !141
  %133 = mul nsw i32 %132, %24
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %121, i64 %130, i32 2
  %136 = load i32, i32* %135, align 4, !tbaa !141
  %137 = mul nsw i32 %136, %24
  %138 = sext i32 %137 to i64
  %139 = icmp eq i64 %130, 0
  br i1 %139, label %.loopexit2, label %140

; <label>:140:                                    ; preds = %129
  %141 = icmp eq i32 %133, 0
  br i1 %141, label %152, label %.preheader21

.preheader21:                                     ; preds = %140
  br label %142

; <label>:142:                                    ; preds = %148, %.preheader21
  %143 = phi i64 [ %149, %148 ], [ 0, %.preheader21 ]
  %144 = phi i32 [ %150, %148 ], [ 0, %.preheader21 ]
  %145 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %143
  %146 = load i64, i64* %145, align 8, !tbaa !89
  %147 = icmp ugt i64 %146, %134
  br i1 %147, label %154, label %148

; <label>:148:                                    ; preds = %142
  %149 = add nuw nsw i64 %143, 1
  %150 = add nuw nsw i32 %144, 1
  %151 = icmp ult i64 %149, %130
  br i1 %151, label %142, label %.loopexit2

; <label>:152:                                    ; preds = %140
  %153 = trunc i64 %130 to i32
  br label %.loopexit2

; <label>:154:                                    ; preds = %142
  %155 = trunc i64 %143 to i32
  br label %.loopexit2

.loopexit2:                                       ; preds = %154, %152, %148, %129
  %156 = phi i32 [ 0, %129 ], [ %153, %152 ], [ %155, %154 ], [ %150, %148 ]
  %157 = sext i32 %156 to i64
  %158 = icmp sgt i64 %130, %157
  br i1 %158, label %.preheader, label %.loopexit1

.preheader:                                       ; preds = %.loopexit2
  br label %168

.loopexit1:                                       ; preds = %168, %.loopexit2
  %159 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %119, i64 %130, i32 1
  %160 = load i32, i32* %159, align 4, !tbaa !138
  %161 = sext i32 %160 to i64
  %162 = zext i32 %156 to i64
  %163 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %162
  store i64 %161, i64* %163, align 8, !tbaa !89
  %164 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %162
  store i64 %134, i64* %164, align 8, !tbaa !89
  %165 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %162
  store i64 %138, i64* %165, align 8, !tbaa !89
  %166 = add nuw nsw i64 %130, 1
  %167 = icmp eq i64 %166, %122
  br i1 %167, label %123, label %129

; <label>:168:                                    ; preds = %168, %.preheader
  %169 = phi i64 [ %170, %168 ], [ %130, %.preheader ]
  %170 = add nsw i64 %169, -1
  %171 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %170
  %172 = load i64, i64* %171, align 8, !tbaa !89
  %173 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 3, i64 %169
  store i64 %172, i64* %173, align 8, !tbaa !89
  %174 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %170
  %175 = load i64, i64* %174, align 8, !tbaa !89
  %176 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 5, i64 %169
  store i64 %175, i64* %176, align 8, !tbaa !89
  %177 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %170
  %178 = load i64, i64* %177, align 8, !tbaa !89
  %179 = getelementptr inbounds %"struct.Halide::Runtime::Internal::device_copy", %"struct.Halide::Runtime::Internal::device_copy"* %6, i64 0, i32 4, i64 %169
  store i64 %178, i64* %179, align 8, !tbaa !89
  %180 = icmp sgt i64 %170, %157
  br i1 %180, label %168, label %.loopexit1

; <label>:181:                                    ; preds = %185, %127
  %182 = phi i64 [ %128, %127 ], [ %226, %185 ]
  %183 = phi i64 [ %124, %127 ], [ %187, %185 ]
  %184 = icmp eq i64 %183, %182
  br i1 %184, label %185, label %.loopexit

; <label>:185:                                    ; preds = %181
  %186 = load i64, i64* %27, align 8, !tbaa !89
  %187 = mul i64 %186, %182
  store i64 %187, i64* %26, align 8, !tbaa !160
  %188 = bitcast i64* %30 to <4 x i64>*
  %189 = load <4 x i64>, <4 x i64>* %188, align 8, !tbaa !89
  %190 = bitcast i64* %27 to <4 x i64>*
  store <4 x i64> %189, <4 x i64>* %190, align 8, !tbaa !89
  %191 = bitcast i64* %31 to <4 x i64>*
  %192 = load <4 x i64>, <4 x i64>* %191, align 8, !tbaa !89
  %193 = bitcast i64* %28 to <4 x i64>*
  store <4 x i64> %192, <4 x i64>* %193, align 8, !tbaa !89
  %194 = bitcast i64* %32 to <4 x i64>*
  %195 = load <4 x i64>, <4 x i64>* %194, align 8, !tbaa !89
  %196 = bitcast i64* %29 to <4 x i64>*
  store <4 x i64> %195, <4 x i64>* %196, align 8, !tbaa !89
  %197 = load i64, i64* %39, align 8, !tbaa !89
  store i64 %197, i64* %36, align 8, !tbaa !89
  %198 = load i64, i64* %40, align 8, !tbaa !89
  store i64 %198, i64* %37, align 8, !tbaa !89
  %199 = load i64, i64* %41, align 8, !tbaa !89
  store i64 %199, i64* %38, align 8, !tbaa !89
  %200 = bitcast i64* %42 to <4 x i64>*
  %201 = load <4 x i64>, <4 x i64>* %200, align 8, !tbaa !89
  %202 = bitcast i64* %39 to <4 x i64>*
  store <4 x i64> %201, <4 x i64>* %202, align 8, !tbaa !89
  %203 = bitcast i64* %43 to <4 x i64>*
  %204 = load <4 x i64>, <4 x i64>* %203, align 8, !tbaa !89
  %205 = bitcast i64* %40 to <4 x i64>*
  store <4 x i64> %204, <4 x i64>* %205, align 8, !tbaa !89
  %206 = bitcast i64* %44 to <4 x i64>*
  %207 = load <4 x i64>, <4 x i64>* %206, align 8, !tbaa !89
  %208 = bitcast i64* %41 to <4 x i64>*
  store <4 x i64> %207, <4 x i64>* %208, align 8, !tbaa !89
  %209 = load i64, i64* %53, align 8, !tbaa !89
  store i64 %209, i64* %50, align 8, !tbaa !89
  %210 = load i64, i64* %54, align 8, !tbaa !89
  store i64 %210, i64* %51, align 8, !tbaa !89
  %211 = load i64, i64* %55, align 8, !tbaa !89
  store i64 %211, i64* %52, align 8, !tbaa !89
  %212 = load i64, i64* %56, align 8, !tbaa !89
  store i64 %212, i64* %53, align 8, !tbaa !89
  %213 = bitcast i64* %57 to <4 x i64>*
  %214 = load <4 x i64>, <4 x i64>* %213, align 8, !tbaa !89
  %215 = bitcast i64* %54 to <4 x i64>*
  store <4 x i64> %214, <4 x i64>* %215, align 8, !tbaa !89
  %216 = bitcast i64* %58 to <4 x i64>*
  %217 = load <4 x i64>, <4 x i64>* %216, align 8, !tbaa !89
  %218 = bitcast i64* %55 to <4 x i64>*
  store <4 x i64> %217, <4 x i64>* %218, align 8, !tbaa !89
  %219 = bitcast i64* %59 to <4 x i64>*
  %220 = load <4 x i64>, <4 x i64>* %219, align 8, !tbaa !89
  %221 = bitcast i64* %56 to <4 x i64>*
  store <4 x i64> %220, <4 x i64>* %221, align 8, !tbaa !89
  %222 = load i64, i64* %68, align 8, !tbaa !89
  store i64 %222, i64* %65, align 8, !tbaa !89
  %223 = load i64, i64* %69, align 8, !tbaa !89
  store i64 %223, i64* %66, align 8, !tbaa !89
  store i64 1, i64* %67, align 8, !tbaa !89
  store i64 0, i64* %68, align 8, !tbaa !89
  store i64 0, i64* %69, align 8, !tbaa !89
  %224 = extractelement <4 x i64> %192, i32 0
  %225 = icmp eq i64 %187, %224
  %226 = extractelement <4 x i64> %195, i32 0
  br i1 %225, label %181, label %.loopexit

.loopexit:                                        ; preds = %185, %181, %123, %116
  %227 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %227, i8* nonnull %7, i64 416, i32 8, i1 false), !tbaa.struct !162
  br label %228

; <label>:228:                                    ; preds = %.loopexit, %114, %110
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %7) #10
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8*, i8*, i64) local_unnamed_addr #0 {
  %4 = tail call i32 @memcmp(i8* %0, i8* %1, i64 %2) #12
  %5 = icmp eq i32 %4, 0
  ret i1 %5
}

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #6

; Function Attrs: norecurse nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t*, %struct.halide_dimension_t*) local_unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %0, i64 0, i32 5
  %4 = load i32, i32* %3, align 4, !tbaa !134
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %.loopexit

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %0, i64 0, i32 6
  %8 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %7, align 8, !tbaa !136
  %9 = sext i32 %4 to i64
  br label %12

; <label>:10:                                     ; preds = %31
  %11 = icmp slt i64 %37, %9
  br i1 %11, label %12, label %.loopexit

; <label>:12:                                     ; preds = %10, %6
  %13 = phi i64 [ 0, %6 ], [ %37, %10 ]
  %14 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %13, i32 0
  %15 = load i32, i32* %14, align 4, !tbaa !140
  %16 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %13, i32 0
  %17 = load i32, i32* %16, align 4, !tbaa !140
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %19, label %.loopexit

; <label>:19:                                     ; preds = %12
  %20 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %13, i32 1
  %21 = load i32, i32* %20, align 4, !tbaa !138
  %22 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %13, i32 1
  %23 = load i32, i32* %22, align 4, !tbaa !138
  %24 = icmp eq i32 %21, %23
  br i1 %24, label %25, label %.loopexit

; <label>:25:                                     ; preds = %19
  %26 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %13, i32 2
  %27 = load i32, i32* %26, align 4, !tbaa !141
  %28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %13, i32 2
  %29 = load i32, i32* %28, align 4, !tbaa !141
  %30 = icmp eq i32 %27, %29
  br i1 %30, label %31, label %.loopexit

; <label>:31:                                     ; preds = %25
  %32 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %8, i64 %13, i32 3
  %33 = load i32, i32* %32, align 4, !tbaa !163
  %34 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %1, i64 %13, i32 3
  %35 = load i32, i32* %34, align 4, !tbaa !163
  %36 = icmp eq i32 %33, %35
  %37 = add nuw nsw i64 %13, 1
  br i1 %36, label %10, label %.loopexit

.loopexit:                                        ; preds = %31, %25, %19, %12, %10, %2
  %38 = phi i1 [ true, %2 ], [ true, %10 ], [ false, %25 ], [ false, %19 ], [ false, %12 ], [ false, %31 ]
  ret i1 %38
}

; Function Attrs: nounwind
define linkonce zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_(%"struct.Halide::Runtime::Internal::CacheEntry"*, i8*, i64, i32, %struct.halide_buffer_t*, i32, %struct.halide_buffer_t**) local_unnamed_addr #0 align 2 {
  %8 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 4
  %9 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 24, i32 8, i1 false)
  store i64 %2, i64* %8, align 8, !tbaa !164
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 6
  store i32 %3, i32* %10, align 8, !tbaa !165
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 7
  store i32 0, i32* %11, align 4, !tbaa !166
  %12 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 8
  store i32 %5, i32* %12, align 8, !tbaa !154
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 5
  %14 = load i32, i32* %13, align 4, !tbaa !134
  %15 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 9
  store i32 %14, i32* %15, align 4, !tbaa !167
  %16 = zext i32 %5 to i64
  %17 = mul nuw nsw i64 %16, 56
  %18 = sext i32 %14 to i64
  %19 = add i32 %5, 1
  %20 = zext i32 %19 to i64
  %21 = shl nuw nsw i64 %20, 4
  %22 = mul i64 %21, %18
  %23 = add i64 %22, %17
  %24 = add i64 %23, %2
  %25 = tail call i8* @halide_malloc(i8* null, i64 %24) #12
  %26 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 3
  store i8* %25, i8** %26, align 8, !tbaa !155
  %27 = icmp eq i8* %25, null
  br i1 %27, label %.loopexit1, label %28

; <label>:28:                                     ; preds = %7
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 11
  %30 = bitcast %struct.halide_buffer_t** %29 to i8**
  store i8* %25, i8** %30, align 8, !tbaa !156
  %31 = getelementptr inbounds i8, i8* %25, i64 %17
  %32 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 10
  %33 = bitcast %struct.halide_dimension_t** %32 to i8**
  store i8* %31, i8** %33, align 8, !tbaa !168
  %34 = getelementptr inbounds i8, i8* %25, i64 %23
  %35 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %0, i64 0, i32 5
  store i8* %34, i8** %35, align 8, !tbaa !169
  %36 = load i64, i64* %8, align 8, !tbaa !164
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %.loopexit3, label %38

; <label>:38:                                     ; preds = %28
  %39 = load i8, i8* %1, align 1, !tbaa !11
  store i8 %39, i8* %34, align 1, !tbaa !11
  %40 = load i64, i64* %8, align 8, !tbaa !164
  %41 = icmp ugt i64 %40, 1
  br i1 %41, label %.preheader5, label %.loopexit3

.preheader5:                                      ; preds = %38
  br label %46

.loopexit3:                                       ; preds = %46, %38, %28
  %42 = load i32, i32* %15, align 4, !tbaa !167
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %44, label %.loopexit2

; <label>:44:                                     ; preds = %.loopexit3
  %45 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 6
  br label %57

; <label>:46:                                     ; preds = %46, %.preheader5
  %47 = phi i64 [ %52, %46 ], [ 1, %.preheader5 ]
  %48 = load i8*, i8** %35, align 8, !tbaa !169
  %49 = getelementptr inbounds i8, i8* %1, i64 %47
  %50 = load i8, i8* %49, align 1, !tbaa !11
  %51 = getelementptr inbounds i8, i8* %48, i64 %47
  store i8 %50, i8* %51, align 1, !tbaa !11
  %52 = add nuw i64 %47, 1
  %53 = load i64, i64* %8, align 8, !tbaa !164
  %54 = icmp ult i64 %52, %53
  br i1 %54, label %46, label %.loopexit3

.loopexit2:                                       ; preds = %57, %.loopexit3
  %55 = load i32, i32* %12, align 8, !tbaa !154
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %.loopexit1, label %.preheader4

.preheader4:                                      ; preds = %.loopexit2
  br label %69

; <label>:57:                                     ; preds = %57, %44
  %58 = phi i64 [ 0, %44 ], [ %65, %57 ]
  %59 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %45, align 8, !tbaa !136
  %60 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %59, i64 %58
  %61 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !168
  %62 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %61, i64 %58
  %63 = bitcast %struct.halide_dimension_t* %62 to i8*
  %64 = bitcast %struct.halide_dimension_t* %60 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %63, i8* %64, i64 16, i32 4, i1 false), !tbaa.struct !137
  %65 = add nuw nsw i64 %58, 1
  %66 = load i32, i32* %15, align 4, !tbaa !167
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 %65, %67
  br i1 %68, label %57, label %.loopexit2

; <label>:69:                                     ; preds = %.loopexit, %.preheader4
  %70 = phi i64 [ %78, %.loopexit ], [ 0, %.preheader4 ]
  %71 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %6, i64 %70
  %72 = bitcast %struct.halide_buffer_t** %71 to i8**
  %73 = load i8*, i8** %72, align 8, !tbaa !7
  %74 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %29, align 8, !tbaa !156
  %75 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %74, i64 %70
  %76 = bitcast %struct.halide_buffer_t* %75 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %76, i8* %73, i64 56, i32 8, i1 false), !tbaa.struct !170
  %77 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !168
  %78 = add nuw nsw i64 %70, 1
  %79 = load i32, i32* %15, align 4, !tbaa !167
  %80 = trunc i64 %78 to i32
  %81 = mul i32 %79, %80
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %77, i64 %82
  %84 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %29, align 8, !tbaa !156
  %85 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %84, i64 %70, i32 6
  store %struct.halide_dimension_t* %83, %struct.halide_dimension_t** %85, align 8, !tbaa !136
  %86 = icmp sgt i32 %79, 0
  br i1 %86, label %87, label %.loopexit

; <label>:87:                                     ; preds = %69
  %88 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %71, align 8, !tbaa !7
  %89 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %88, i64 0, i32 6
  %90 = bitcast %struct.halide_dimension_t** %89 to i8**
  %91 = load i8*, i8** %90, align 8, !tbaa !136
  %92 = bitcast %struct.halide_dimension_t* %83 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %92, i8* %91, i64 16, i32 4, i1 false), !tbaa.struct !137
  %93 = load i32, i32* %15, align 4, !tbaa !167
  %94 = icmp sgt i32 %93, 1
  br i1 %94, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %87
  br label %98

.loopexit:                                        ; preds = %98, %87, %69
  %95 = load i32, i32* %12, align 8, !tbaa !154
  %96 = zext i32 %95 to i64
  %97 = icmp ult i64 %78, %96
  br i1 %97, label %69, label %.loopexit1

; <label>:98:                                     ; preds = %98, %.preheader
  %99 = phi i64 [ %110, %98 ], [ 1, %.preheader ]
  %100 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %29, align 8, !tbaa !156
  %101 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %100, i64 %70, i32 6
  %102 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %101, align 8, !tbaa !136
  %103 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %71, align 8, !tbaa !7
  %104 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %103, i64 0, i32 6
  %105 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %104, align 8, !tbaa !136
  %106 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %105, i64 %99
  %107 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %102, i64 %99
  %108 = bitcast %struct.halide_dimension_t* %107 to i8*
  %109 = bitcast %struct.halide_dimension_t* %106 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %108, i8* nonnull %109, i64 16, i32 4, i1 false), !tbaa.struct !137
  %110 = add nuw nsw i64 %99, 1
  %111 = load i32, i32* %15, align 4, !tbaa !167
  %112 = sext i32 %111 to i64
  %113 = icmp slt i64 %110, %112
  br i1 %113, label %98, label %.loopexit

.loopexit1:                                       ; preds = %.loopexit, %.loopexit2, %7
  %114 = phi i1 [ false, %7 ], [ true, %.loopexit2 ], [ true, %.loopexit ]
  ret i1 %114
}

; Function Attrs: norecurse nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8*, i64) local_unnamed_addr #2 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %2
  br label %5

.loopexit:                                        ; preds = %5, %2
  %4 = phi i32 [ 5381, %2 ], [ %12, %5 ]
  ret i32 %4

; <label>:5:                                      ; preds = %5, %.preheader
  %6 = phi i64 [ %13, %5 ], [ 0, %.preheader ]
  %7 = phi i32 [ %12, %5 ], [ 5381, %.preheader ]
  %8 = mul i32 %7, 33
  %9 = getelementptr inbounds i8, i8* %0, i64 %6
  %10 = load i8, i8* %9, align 1, !tbaa !11
  %11 = zext i8 %10 to i32
  %12 = add i32 %8, %11
  %13 = add nuw i64 %6, 1
  %14 = icmp eq i64 %13, %1
  br i1 %14, label %.loopexit, label %5
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal11prune_cacheEv() local_unnamed_addr #0 {
  %1 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !7
  %2 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  %3 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !89
  %4 = icmp sgt i64 %2, %3
  %5 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %1, null
  %6 = and i1 %5, %4
  br i1 %6, label %.preheader22, label %.loopexit2

.preheader22:                                     ; preds = %0
  br label %7

; <label>:7:                                      ; preds = %140, %.preheader22
  %8 = phi i64 [ %141, %140 ], [ %3, %.preheader22 ]
  %9 = phi i64 [ %142, %140 ], [ %2, %.preheader22 ]
  %10 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %12, %140 ], [ %1, %.preheader22 ]
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 1
  %12 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %11, align 8, !tbaa !171
  %13 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 7
  %14 = load i32, i32* %13, align 4, !tbaa !166
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %140

; <label>:16:                                     ; preds = %7
  %17 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 6
  %18 = load i32, i32* %17, align 8, !tbaa !165
  %19 = and i32 %18, 255
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %20
  %22 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %21, align 8, !tbaa !7
  %23 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %22, %10
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %16
  %25 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %10 to i64*
  %26 = load i64, i64* %25, align 8, !tbaa !152
  %27 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %21 to i64*
  store i64 %26, i64* %27, align 8, !tbaa !7
  br label %41

; <label>:28:                                     ; preds = %16
  %29 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %22, null
  br i1 %29, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %28
  br label %32

; <label>:30:                                     ; preds = %32
  %31 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %35, null
  br i1 %31, label %.loopexit, label %32

; <label>:32:                                     ; preds = %30, %.preheader
  %33 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %35, %30 ], [ %22, %.preheader ]
  %34 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %33, i64 0, i32 0
  %35 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %34, align 8, !tbaa !152
  %36 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %35, %10
  br i1 %36, label %37, label %30

.loopexit:                                        ; preds = %30, %28
  tail call void @halide_print(i8* null, i8* getelementptr inbounds ([136 x i8], [136 x i8]* @.str.4.43, i64 0, i64 0)) #12
  tail call void @abort() #12
  unreachable

; <label>:37:                                     ; preds = %32
  %38 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %10 to i64*
  %39 = load i64, i64* %38, align 8, !tbaa !152
  %40 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %33 to i64*
  store i64 %39, i64* %40, align 8, !tbaa !152
  br label %41

; <label>:41:                                     ; preds = %37, %24
  %42 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !7
  %43 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %42, %10
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %41
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %12, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !7
  br label %45

; <label>:45:                                     ; preds = %44, %41
  %46 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %12, null
  %.pre = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 2
  br i1 %46, label %._crit_edge, label %47

; <label>:47:                                     ; preds = %45
  %48 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %.pre to i64*
  %49 = load i64, i64* %48, align 8, !tbaa !172
  %50 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %12, i64 0, i32 2
  %51 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %50 to i64*
  store i64 %49, i64* %51, align 8, !tbaa !172
  br label %._crit_edge

._crit_edge:                                      ; preds = %47, %45
  %52 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !7
  %53 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %52, %10
  br i1 %53, label %56, label %54

; <label>:54:                                     ; preds = %._crit_edge
  %55 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %.pre, align 8, !tbaa !172
  br label %60

; <label>:56:                                     ; preds = %._crit_edge
  %57 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %.pre to i64*
  %58 = load i64, i64* %57, align 8, !tbaa !172
  store i64 %58, i64* bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE to i64*), align 8, !tbaa !7
  %59 = inttoptr i64 %58 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  br label %60

; <label>:60:                                     ; preds = %56, %54
  %61 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %55, %54 ], [ %59, %56 ]
  %62 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %61, null
  br i1 %62, label %64, label %63

; <label>:63:                                     ; preds = %60
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %12, %"struct.Halide::Runtime::Internal::CacheEntry"** %.pre, align 8, !tbaa !172
  br label %64

; <label>:64:                                     ; preds = %63, %60
  %65 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 8
  %66 = load i32, i32* %65, align 8, !tbaa !154
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %73, label %68

; <label>:68:                                     ; preds = %64
  %69 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %10, i64 0, i32 11
  %70 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %69, align 8, !tbaa !156
  %71 = zext i32 %66 to i64
  br label %77

; <label>:72:                                     ; preds = %129
  store i64 %138, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  br label %73

; <label>:73:                                     ; preds = %72, %64
  tail call void @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv(%"struct.Halide::Runtime::Internal::CacheEntry"* nonnull %10) #13
  %74 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"* %10 to i8*
  tail call void @halide_free(i8* null, i8* %74) #12
  %75 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  %76 = load i64, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !89
  br label %140

; <label>:77:                                     ; preds = %129, %68
  %78 = phi i64 [ 0, %68 ], [ %139, %129 ]
  %79 = phi i64 [ %9, %68 ], [ %138, %129 ]
  %80 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %70, i64 %78, i32 5
  %81 = load i32, i32* %80, align 4, !tbaa !134
  %82 = icmp sgt i32 %81, 0
  br i1 %82, label %86, label %83

; <label>:83:                                     ; preds = %77
  %84 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %70, i64 %78, i32 4, i32 1
  %85 = load i8, i8* %84, align 1, !tbaa !108
  br label %129

; <label>:86:                                     ; preds = %77
  %87 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %70, i64 %78, i32 6
  %88 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %87, align 8, !tbaa !136
  %89 = sext i32 %81 to i64
  br label %90

; <label>:90:                                     ; preds = %103, %86
  %91 = phi i64 [ 0, %86 ], [ %105, %103 ]
  %92 = phi i64 [ 0, %86 ], [ %104, %103 ]
  %93 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %88, i64 %91, i32 2
  %94 = load i32, i32* %93, align 4, !tbaa !141
  %95 = icmp sgt i32 %94, 0
  br i1 %95, label %96, label %103

; <label>:96:                                     ; preds = %90
  %97 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %88, i64 %91, i32 1
  %98 = load i32, i32* %97, align 4, !tbaa !138
  %99 = add nsw i32 %98, -1
  %100 = mul nsw i32 %99, %94
  %101 = sext i32 %100 to i64
  %102 = add nsw i64 %92, %101
  br label %103

; <label>:103:                                    ; preds = %96, %90
  %104 = phi i64 [ %102, %96 ], [ %92, %90 ]
  %105 = add nuw nsw i64 %91, 1
  %106 = icmp eq i64 %105, %89
  br i1 %106, label %107, label %90

; <label>:107:                                    ; preds = %103
  %108 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %70, i64 %78, i32 4, i32 1
  %109 = load i8, i8* %108, align 1, !tbaa !108
  br label %110

; <label>:110:                                    ; preds = %123, %107
  %111 = phi i64 [ 0, %107 ], [ %125, %123 ]
  %112 = phi i64 [ 0, %107 ], [ %124, %123 ]
  %113 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %88, i64 %111, i32 2
  %114 = load i32, i32* %113, align 4, !tbaa !141
  %115 = icmp slt i32 %114, 0
  br i1 %115, label %116, label %123

; <label>:116:                                    ; preds = %110
  %117 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %88, i64 %111, i32 1
  %118 = load i32, i32* %117, align 4, !tbaa !138
  %119 = add nsw i32 %118, -1
  %120 = mul nsw i32 %119, %114
  %121 = sext i32 %120 to i64
  %122 = add nsw i64 %112, %121
  br label %123

; <label>:123:                                    ; preds = %116, %110
  %124 = phi i64 [ %122, %116 ], [ %112, %110 ]
  %125 = add nuw nsw i64 %111, 1
  %126 = icmp eq i64 %125, %89
  br i1 %126, label %127, label %110

; <label>:127:                                    ; preds = %123
  %128 = add nsw i64 %104, 1
  br label %129

; <label>:129:                                    ; preds = %127, %83
  %130 = phi i8 [ %85, %83 ], [ %109, %127 ]
  %131 = phi i64 [ 1, %83 ], [ %128, %127 ]
  %132 = phi i64 [ 0, %83 ], [ %124, %127 ]
  %133 = zext i8 %130 to i64
  %134 = add nuw nsw i64 %133, 7
  %135 = lshr i64 %134, 3
  %136 = sub i64 %131, %132
  %137 = mul i64 %136, %135
  %138 = sub i64 %79, %137
  %139 = add nuw nsw i64 %78, 1
  %exitcond = icmp eq i64 %139, %71
  br i1 %exitcond, label %72, label %77

; <label>:140:                                    ; preds = %73, %7
  %141 = phi i64 [ %76, %73 ], [ %8, %7 ]
  %142 = phi i64 [ %75, %73 ], [ %9, %7 ]
  %143 = icmp sgt i64 %142, %141
  %144 = icmp ne %"struct.Halide::Runtime::Internal::CacheEntry"* %12, null
  %145 = and i1 %144, %143
  br i1 %145, label %7, label %.loopexit2

.loopexit2:                                       ; preds = %140, %0
  ret void
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_set_size(i64) local_unnamed_addr #0 {
  %2 = icmp eq i64 %0, 0
  %3 = select i1 %2, i64 1048576, i64 %0
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  store i64 %3, i64* @_ZN6Halide7Runtime8Internal14max_cache_sizeE, align 8, !tbaa !89
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_lookup(i8*, i8*, i32, %struct.halide_buffer_t*, i32, %struct.halide_buffer_t**) local_unnamed_addr #0 {
  %7 = sext i32 %2 to i64
  %8 = tail call i32 @_ZN6Halide7Runtime8Internal8djb_hashEPKhm(i8* %1, i64 %7) #13
  %9 = and i32 %8, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %10
  %12 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %11, align 8, !tbaa !7
  %13 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %12, null
  br i1 %13, label %.loopexit4, label %14

; <label>:14:                                     ; preds = %6
  %15 = icmp sgt i32 %4, 0
  br i1 %15, label %16, label %.preheader

.preheader:                                       ; preds = %14
  br label %57

; <label>:16:                                     ; preds = %14
  %17 = sext i32 %4 to i64
  br label %18

; <label>:18:                                     ; preds = %39, %16
  %19 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %12, %16 ], [ %41, %39 ]
  %20 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 6
  %21 = load i32, i32* %20, align 8, !tbaa !165
  %22 = icmp eq i32 %21, %8
  br i1 %22, label %23, label %39

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 4
  %25 = load i64, i64* %24, align 8, !tbaa !164
  %26 = icmp eq i64 %25, %7
  br i1 %26, label %27, label %39

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 5
  %29 = load i8*, i8** %28, align 8, !tbaa !169
  %30 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %29, i8* %1, i64 %7) #13
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %27
  %32 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 10
  %33 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !168
  %34 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %33) #13
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %31
  %36 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 8
  %37 = load i32, i32* %36, align 8, !tbaa !154
  %38 = icmp eq i32 %37, %4
  br i1 %38, label %54, label %39

; <label>:39:                                     ; preds = %56, %35, %31, %27, %23, %18
  %40 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 0
  %41 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %40, align 8, !tbaa !7
  %42 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %41, null
  br i1 %42, label %.loopexit4, label %18

; <label>:43:                                     ; preds = %54, %43
  %44 = phi i64 [ 0, %54 ], [ %51, %43 ]
  %45 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %44
  %46 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %45, align 8, !tbaa !7
  %47 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %55, align 8, !tbaa !156
  %48 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %47, i64 %44, i32 6
  %49 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %48, align 8, !tbaa !136
  %50 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %46, %struct.halide_dimension_t* %49) #13
  %51 = add nuw nsw i64 %44, 1
  %52 = icmp slt i64 %51, %17
  %53 = and i1 %52, %50
  br i1 %53, label %43, label %56

; <label>:54:                                     ; preds = %35
  %55 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %19, i64 0, i32 11
  br label %43

; <label>:56:                                     ; preds = %43
  br i1 %50, label %.loopexit3, label %39

; <label>:57:                                     ; preds = %138, %.preheader
  %58 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %140, %138 ], [ %12, %.preheader ]
  %59 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 6
  %60 = load i32, i32* %59, align 8, !tbaa !165
  %61 = icmp eq i32 %60, %8
  br i1 %61, label %62, label %138

; <label>:62:                                     ; preds = %57
  %63 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 4
  %64 = load i64, i64* %63, align 8, !tbaa !164
  %65 = icmp eq i64 %64, %7
  br i1 %65, label %66, label %138

; <label>:66:                                     ; preds = %62
  %67 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 5
  %68 = load i8*, i8** %67, align 8, !tbaa !169
  %69 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %68, i8* %1, i64 %7) #13
  br i1 %69, label %70, label %138

; <label>:70:                                     ; preds = %66
  %71 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 10
  %72 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %71, align 8, !tbaa !168
  %73 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %72) #13
  br i1 %73, label %74, label %138

; <label>:74:                                     ; preds = %70
  %75 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 8
  %76 = load i32, i32* %75, align 8, !tbaa !154
  %77 = icmp eq i32 %76, %4
  br i1 %77, label %.loopexit3, label %138

.loopexit3:                                       ; preds = %74, %56
  %78 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %19, %56 ], [ %58, %74 ]
  %79 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !7
  %80 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %78, %79
  br i1 %80, label %121, label %81

; <label>:81:                                     ; preds = %.loopexit3
  %82 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %78, i64 0, i32 1
  %83 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %82, align 8, !tbaa !171
  %84 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %83, null
  br i1 %84, label %85, label %86

; <label>:85:                                     ; preds = %81
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([139 x i8], [139 x i8]* @.str.5.44, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %86

; <label>:86:                                     ; preds = %85, %81
  %87 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %78, i64 0, i32 2
  %88 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %87, align 8, !tbaa !172
  %89 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %88, null
  br i1 %89, label %96, label %90

; <label>:90:                                     ; preds = %86
  %91 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %82 to i64*
  %92 = load i64, i64* %91, align 8, !tbaa !171
  %93 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %88, i64 0, i32 1
  %94 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %93 to i64*
  store i64 %92, i64* %94, align 8, !tbaa !171
  %95 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %82, align 8, !tbaa !171
  br label %104

; <label>:96:                                     ; preds = %86
  %97 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !7
  %98 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %97, %78
  br i1 %98, label %100, label %99

; <label>:99:                                     ; preds = %96
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([141 x i8], [141 x i8]* @.str.6.45, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %100

; <label>:100:                                    ; preds = %99, %96
  %101 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %82 to i64*
  %102 = load i64, i64* %101, align 8, !tbaa !171
  store i64 %102, i64* bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE to i64*), align 8, !tbaa !7
  %103 = inttoptr i64 %102 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  br label %104

; <label>:104:                                    ; preds = %100, %90
  %105 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %103, %100 ], [ %95, %90 ]
  %106 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %105, null
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %104
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([139 x i8], [139 x i8]* @.str.7.46, i64 0, i64 0)) #12
  tail call void @abort() #12
  %108 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %82, align 8, !tbaa !171
  br label %109

; <label>:109:                                    ; preds = %107, %104
  %110 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %105, %104 ], [ %108, %107 ]
  %111 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %87 to i64*
  %112 = load i64, i64* %111, align 8, !tbaa !172
  %113 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %110, i64 0, i32 2
  %114 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %113 to i64*
  store i64 %112, i64* %114, align 8, !tbaa !172
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %82, align 8, !tbaa !171
  %115 = load i64, i64* bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE to i64*), align 8, !tbaa !7
  store i64 %115, i64* %111, align 8, !tbaa !172
  %116 = icmp eq i64 %115, 0
  br i1 %116, label %120, label %117

; <label>:117:                                    ; preds = %109
  %118 = inttoptr i64 %115 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  %119 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %118, i64 0, i32 1
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %78, %"struct.Halide::Runtime::Internal::CacheEntry"** %119, align 8, !tbaa !171
  br label %120

; <label>:120:                                    ; preds = %117, %109
  store %"struct.Halide::Runtime::Internal::CacheEntry"* %78, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE, align 8, !tbaa !7
  br label %121

; <label>:121:                                    ; preds = %120, %.loopexit3
  br i1 %15, label %122, label %.loopexit2

; <label>:122:                                    ; preds = %121
  %123 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %78, i64 0, i32 11
  %124 = zext i32 %4 to i64
  br label %128

.loopexit2:                                       ; preds = %128, %121
  %125 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %78, i64 0, i32 7
  %126 = load i32, i32* %125, align 4, !tbaa !166
  %127 = add i32 %126, %4
  store i32 %127, i32* %125, align 4, !tbaa !166
  br label %.loopexit

; <label>:128:                                    ; preds = %128, %122
  %129 = phi i64 [ 0, %122 ], [ %136, %128 ]
  %130 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %129
  %131 = bitcast %struct.halide_buffer_t** %130 to i8**
  %132 = load i8*, i8** %131, align 8, !tbaa !7
  %133 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %123, align 8, !tbaa !156
  %134 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %133, i64 %129
  %135 = bitcast %struct.halide_buffer_t* %134 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %132, i8* %135, i64 56, i32 8, i1 false), !tbaa.struct !170
  %136 = add nuw nsw i64 %129, 1
  %137 = icmp eq i64 %136, %124
  br i1 %137, label %.loopexit2, label %128

; <label>:138:                                    ; preds = %74, %70, %66, %62, %57
  %139 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %58, i64 0, i32 0
  %140 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %139, align 8, !tbaa !7
  %141 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %140, null
  br i1 %141, label %.loopexit4, label %57

.loopexit4:                                       ; preds = %138, %39, %6
  %142 = icmp sgt i32 %4, 0
  br i1 %142, label %143, label %.loopexit

; <label>:143:                                    ; preds = %.loopexit4
  %144 = sext i32 %4 to i64
  br label %145

; <label>:145:                                    ; preds = %229, %143
  %146 = phi i64 [ 0, %143 ], [ %234, %229 ]
  %147 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %146
  %148 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %147, align 8, !tbaa !7
  %149 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %148, i64 0, i32 5
  %150 = load i32, i32* %149, align 4, !tbaa !134
  %151 = icmp sgt i32 %150, 0
  br i1 %151, label %155, label %152

; <label>:152:                                    ; preds = %145
  %153 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %148, i64 0, i32 4, i32 1
  %154 = load i8, i8* %153, align 1, !tbaa !108
  br label %198

; <label>:155:                                    ; preds = %145
  %156 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %148, i64 0, i32 6
  %157 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %156, align 8, !tbaa !136
  %158 = sext i32 %150 to i64
  br label %159

; <label>:159:                                    ; preds = %172, %155
  %160 = phi i64 [ 0, %155 ], [ %174, %172 ]
  %161 = phi i64 [ 0, %155 ], [ %173, %172 ]
  %162 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %157, i64 %160, i32 2
  %163 = load i32, i32* %162, align 4, !tbaa !141
  %164 = icmp sgt i32 %163, 0
  br i1 %164, label %165, label %172

; <label>:165:                                    ; preds = %159
  %166 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %157, i64 %160, i32 1
  %167 = load i32, i32* %166, align 4, !tbaa !138
  %168 = add nsw i32 %167, -1
  %169 = mul nsw i32 %168, %163
  %170 = sext i32 %169 to i64
  %171 = add nsw i64 %161, %170
  br label %172

; <label>:172:                                    ; preds = %165, %159
  %173 = phi i64 [ %171, %165 ], [ %161, %159 ]
  %174 = add nuw nsw i64 %160, 1
  %175 = icmp eq i64 %174, %158
  br i1 %175, label %176, label %159

; <label>:176:                                    ; preds = %172
  %177 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %148, i64 0, i32 4, i32 1
  %178 = load i8, i8* %177, align 1, !tbaa !108
  br label %179

; <label>:179:                                    ; preds = %192, %176
  %180 = phi i64 [ 0, %176 ], [ %194, %192 ]
  %181 = phi i64 [ 0, %176 ], [ %193, %192 ]
  %182 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %157, i64 %180, i32 2
  %183 = load i32, i32* %182, align 4, !tbaa !141
  %184 = icmp slt i32 %183, 0
  br i1 %184, label %185, label %192

; <label>:185:                                    ; preds = %179
  %186 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %157, i64 %180, i32 1
  %187 = load i32, i32* %186, align 4, !tbaa !138
  %188 = add nsw i32 %187, -1
  %189 = mul nsw i32 %188, %183
  %190 = sext i32 %189 to i64
  %191 = add nsw i64 %181, %190
  br label %192

; <label>:192:                                    ; preds = %185, %179
  %193 = phi i64 [ %191, %185 ], [ %181, %179 ]
  %194 = add nuw nsw i64 %180, 1
  %195 = icmp eq i64 %194, %158
  br i1 %195, label %196, label %179

; <label>:196:                                    ; preds = %192
  %197 = add nsw i64 %173, 1
  br label %198

; <label>:198:                                    ; preds = %196, %152
  %199 = phi i8 [ %154, %152 ], [ %178, %196 ]
  %200 = phi i64 [ 1, %152 ], [ %197, %196 ]
  %201 = phi i64 [ 0, %152 ], [ %193, %196 ]
  %202 = zext i8 %199 to i64
  %203 = add nuw nsw i64 %202, 7
  %204 = lshr i64 %203, 3
  %205 = sub i64 %200, %201
  %206 = mul i64 %205, %204
  %207 = add i64 %206, 64
  %208 = tail call i8* @halide_malloc(i8* %0, i64 %207) #12
  %209 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %148, i64 0, i32 2
  store i8* %208, i8** %209, align 8, !tbaa !151
  %210 = icmp eq i8* %208, null
  br i1 %210, label %211, label %229

; <label>:211:                                    ; preds = %198
  %212 = trunc i64 %146 to i32
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %.loopexit, label %214

; <label>:214:                                    ; preds = %211
  %215 = shl i64 %146, 32
  %216 = ashr exact i64 %215, 32
  br label %217

; <label>:217:                                    ; preds = %217, %214
  %218 = phi i64 [ %216, %214 ], [ %219, %217 ]
  %219 = add nsw i64 %218, -1
  %220 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %219
  %221 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %220, align 8, !tbaa !7
  %222 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %221, i64 0, i32 2
  %223 = load i8*, i8** %222, align 8, !tbaa !151
  %224 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %223) #13
  %225 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %224 to i8*
  tail call void @halide_free(i8* %0, i8* %225) #12
  %226 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %220, align 8, !tbaa !7
  %227 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %226, i64 0, i32 2
  store i8* null, i8** %227, align 8, !tbaa !151
  %228 = icmp sgt i64 %218, 1
  br i1 %228, label %217, label %.loopexit

; <label>:229:                                    ; preds = %198
  %230 = getelementptr inbounds i8, i8* %208, i64 64
  store i8* %230, i8** %209, align 8, !tbaa !151
  %231 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* nonnull %230) #13
  %232 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %231, i64 0, i32 1
  store i32 %8, i32* %232, align 8, !tbaa !173
  %233 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %231, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %233, align 8, !tbaa !175
  %234 = add nuw nsw i64 %146, 1
  %235 = icmp slt i64 %234, %144
  br i1 %235, label %145, label %.loopexit

.loopexit:                                        ; preds = %229, %217, %211, %.loopexit4, %.loopexit2
  %236 = phi i32 [ 0, %.loopexit2 ], [ -1, %211 ], [ 1, %.loopexit4 ], [ -1, %217 ], [ 1, %229 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  ret i32 %236
}

; Function Attrs: nounwind
define weak i32 @halide_memoization_cache_store(i8*, i8*, i32, %struct.halide_buffer_t*, i32, %struct.halide_buffer_t**) local_unnamed_addr #0 {
  %7 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, align 8, !tbaa !7
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %7, i64 0, i32 2
  %9 = load i8*, i8** %8, align 8, !tbaa !151
  %10 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %9) #13
  %11 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %10, i64 0, i32 1
  %12 = load i32, i32* %11, align 8, !tbaa !173
  %13 = and i32 %12, 255
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*], [256 x %"struct.Halide::Runtime::Internal::CacheEntry"*]* @_ZN6Halide7Runtime8Internal13cache_entriesE, i64 0, i64 %14
  %16 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %15, align 8, !tbaa !7
  %17 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %16, null
  br i1 %17, label %.loopexit4, label %18

; <label>:18:                                     ; preds = %6
  %19 = sext i32 %2 to i64
  %20 = icmp sgt i32 %4, 0
  br i1 %20, label %21, label %.preheader

.preheader:                                       ; preds = %18
  br label %71

; <label>:21:                                     ; preds = %18
  %22 = sext i32 %4 to i64
  br label %23

; <label>:23:                                     ; preds = %44, %21
  %24 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %16, %21 ], [ %46, %44 ]
  %25 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 6
  %26 = load i32, i32* %25, align 8, !tbaa !165
  %27 = icmp eq i32 %26, %12
  br i1 %27, label %28, label %44

; <label>:28:                                     ; preds = %23
  %29 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 4
  %30 = load i64, i64* %29, align 8, !tbaa !164
  %31 = icmp eq i64 %30, %19
  br i1 %31, label %32, label %44

; <label>:32:                                     ; preds = %28
  %33 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 5
  %34 = load i8*, i8** %33, align 8, !tbaa !169
  %35 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %34, i8* %1, i64 %19) #13
  br i1 %35, label %36, label %44

; <label>:36:                                     ; preds = %32
  %37 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 10
  %38 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %37, align 8, !tbaa !168
  %39 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %38) #13
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %36
  %41 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 8
  %42 = load i32, i32* %41, align 8, !tbaa !154
  %43 = icmp eq i32 %42, %4
  br i1 %43, label %67, label %44

; <label>:44:                                     ; preds = %70, %40, %36, %32, %28, %23
  %45 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 0
  %46 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %45, align 8, !tbaa !7
  %47 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %46, null
  br i1 %47, label %.loopexit4, label %23

; <label>:48:                                     ; preds = %67, %48
  %49 = phi %struct.halide_buffer_t* [ %69, %67 ], [ %57, %48 ]
  %50 = phi i64 [ 0, %67 ], [ %64, %48 ]
  %51 = phi i8 [ 1, %67 ], [ %63, %48 ]
  %52 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %50
  %53 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %52, align 8, !tbaa !7
  %54 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %49, i64 %50, i32 6
  %55 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %54, align 8, !tbaa !136
  %56 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %53, %struct.halide_dimension_t* %55) #13
  %57 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %68, align 8, !tbaa !156
  %58 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %57, i64 %50, i32 2
  %59 = load i8*, i8** %58, align 8, !tbaa !151
  %60 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %53, i64 0, i32 2
  %61 = load i8*, i8** %60, align 8, !tbaa !151
  %62 = icmp eq i8* %59, %61
  %63 = select i1 %62, i8 0, i8 %51
  %64 = add nuw nsw i64 %50, 1
  %65 = icmp slt i64 %64, %22
  %66 = and i1 %65, %56
  br i1 %66, label %48, label %70

; <label>:67:                                     ; preds = %40
  %68 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %24, i64 0, i32 11
  %69 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %68, align 8, !tbaa !156
  br label %48

; <label>:70:                                     ; preds = %48
  br i1 %56, label %92, label %44

; <label>:71:                                     ; preds = %108, %.preheader
  %72 = phi %"struct.Halide::Runtime::Internal::CacheEntry"* [ %110, %108 ], [ %16, %.preheader ]
  %73 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %72, i64 0, i32 6
  %74 = load i32, i32* %73, align 8, !tbaa !165
  %75 = icmp eq i32 %74, %12
  br i1 %75, label %76, label %108

; <label>:76:                                     ; preds = %71
  %77 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %72, i64 0, i32 4
  %78 = load i64, i64* %77, align 8, !tbaa !164
  %79 = icmp eq i64 %78, %19
  br i1 %79, label %80, label %108

; <label>:80:                                     ; preds = %76
  %81 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %72, i64 0, i32 5
  %82 = load i8*, i8** %81, align 8, !tbaa !169
  %83 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m(i8* %82, i8* %1, i64 %19) #13
  br i1 %83, label %84, label %108

; <label>:84:                                     ; preds = %80
  %85 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %72, i64 0, i32 10
  %86 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %85, align 8, !tbaa !168
  %87 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t(%struct.halide_buffer_t* %3, %struct.halide_dimension_t* %86) #13
  br i1 %87, label %88, label %108

; <label>:88:                                     ; preds = %84
  %89 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %72, i64 0, i32 8
  %90 = load i32, i32* %89, align 8, !tbaa !154
  %91 = icmp eq i32 %90, %4
  br i1 %91, label %.loopexit5, label %108

; <label>:92:                                     ; preds = %70
  %93 = and i8 %63, 1
  %94 = icmp eq i8 %93, 0
  br i1 %94, label %95, label %.loopexit5

; <label>:95:                                     ; preds = %92
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([135 x i8], [135 x i8]* @.str.9.47, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %.loopexit5

.loopexit5:                                       ; preds = %95, %92, %88
  br i1 %20, label %96, label %.loopexit

; <label>:96:                                     ; preds = %.loopexit5
  %97 = zext i32 %4 to i64
  br label %98

; <label>:98:                                     ; preds = %98, %96
  %99 = phi i64 [ 0, %96 ], [ %106, %98 ]
  %100 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %99
  %101 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %100, align 8, !tbaa !7
  %102 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %101, i64 0, i32 2
  %103 = load i8*, i8** %102, align 8, !tbaa !151
  %104 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %103) #13
  %105 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %104, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %105, align 8, !tbaa !175
  %106 = add nuw nsw i64 %99, 1
  %107 = icmp eq i64 %106, %97
  br i1 %107, label %.loopexit, label %98

; <label>:108:                                    ; preds = %88, %84, %80, %76, %71
  %109 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %72, i64 0, i32 0
  %110 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %109, align 8, !tbaa !7
  %111 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %110, null
  br i1 %111, label %.loopexit4, label %71

.loopexit4:                                       ; preds = %108, %44, %6
  %112 = icmp sgt i32 %4, 0
  br i1 %112, label %113, label %.loopexit2

; <label>:113:                                    ; preds = %.loopexit4
  %114 = zext i32 %4 to i64
  br label %120

.loopexit2:                                       ; preds = %174, %.loopexit4
  %115 = phi i64 [ 0, %.loopexit4 ], [ %183, %174 ]
  %116 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  %117 = add i64 %116, %115
  store i64 %117, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  tail call void @_ZN6Halide7Runtime8Internal11prune_cacheEv() #13
  %118 = tail call i8* @halide_malloc(i8* null, i64 80) #12
  %119 = icmp ne i8* %118, null
  br i1 %119, label %186, label %190

; <label>:120:                                    ; preds = %174, %113
  %121 = phi i64 [ 0, %113 ], [ %184, %174 ]
  %122 = phi i64 [ 0, %113 ], [ %183, %174 ]
  %123 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %121
  %124 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %123, align 8, !tbaa !7
  %125 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %124, i64 0, i32 5
  %126 = load i32, i32* %125, align 4, !tbaa !134
  %127 = icmp sgt i32 %126, 0
  br i1 %127, label %131, label %128

; <label>:128:                                    ; preds = %120
  %129 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %124, i64 0, i32 4, i32 1
  %130 = load i8, i8* %129, align 1, !tbaa !108
  br label %174

; <label>:131:                                    ; preds = %120
  %132 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %124, i64 0, i32 6
  %133 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %132, align 8, !tbaa !136
  %134 = sext i32 %126 to i64
  br label %135

; <label>:135:                                    ; preds = %148, %131
  %136 = phi i64 [ 0, %131 ], [ %150, %148 ]
  %137 = phi i64 [ 0, %131 ], [ %149, %148 ]
  %138 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %133, i64 %136, i32 2
  %139 = load i32, i32* %138, align 4, !tbaa !141
  %140 = icmp sgt i32 %139, 0
  br i1 %140, label %141, label %148

; <label>:141:                                    ; preds = %135
  %142 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %133, i64 %136, i32 1
  %143 = load i32, i32* %142, align 4, !tbaa !138
  %144 = add nsw i32 %143, -1
  %145 = mul nsw i32 %144, %139
  %146 = sext i32 %145 to i64
  %147 = add nsw i64 %137, %146
  br label %148

; <label>:148:                                    ; preds = %141, %135
  %149 = phi i64 [ %147, %141 ], [ %137, %135 ]
  %150 = add nuw nsw i64 %136, 1
  %151 = icmp eq i64 %150, %134
  br i1 %151, label %152, label %135

; <label>:152:                                    ; preds = %148
  %153 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %124, i64 0, i32 4, i32 1
  %154 = load i8, i8* %153, align 1, !tbaa !108
  br label %155

; <label>:155:                                    ; preds = %168, %152
  %156 = phi i64 [ 0, %152 ], [ %170, %168 ]
  %157 = phi i64 [ 0, %152 ], [ %169, %168 ]
  %158 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %133, i64 %156, i32 2
  %159 = load i32, i32* %158, align 4, !tbaa !141
  %160 = icmp slt i32 %159, 0
  br i1 %160, label %161, label %168

; <label>:161:                                    ; preds = %155
  %162 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %133, i64 %156, i32 1
  %163 = load i32, i32* %162, align 4, !tbaa !138
  %164 = add nsw i32 %163, -1
  %165 = mul nsw i32 %164, %159
  %166 = sext i32 %165 to i64
  %167 = add nsw i64 %157, %166
  br label %168

; <label>:168:                                    ; preds = %161, %155
  %169 = phi i64 [ %167, %161 ], [ %157, %155 ]
  %170 = add nuw nsw i64 %156, 1
  %171 = icmp eq i64 %170, %134
  br i1 %171, label %172, label %155

; <label>:172:                                    ; preds = %168
  %173 = add nsw i64 %149, 1
  br label %174

; <label>:174:                                    ; preds = %172, %128
  %175 = phi i8 [ %130, %128 ], [ %154, %172 ]
  %176 = phi i64 [ 1, %128 ], [ %173, %172 ]
  %177 = phi i64 [ 0, %128 ], [ %169, %172 ]
  %178 = zext i8 %175 to i64
  %179 = add nuw nsw i64 %178, 7
  %180 = lshr i64 %179, 3
  %181 = sub i64 %176, %177
  %182 = mul i64 %181, %180
  %183 = add i64 %182, %122
  %184 = add nuw nsw i64 %121, 1
  %185 = icmp eq i64 %184, %114
  br i1 %185, label %.loopexit2, label %120

; <label>:186:                                    ; preds = %.loopexit2
  %187 = bitcast i8* %118 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  %188 = sext i32 %2 to i64
  %189 = tail call zeroext i1 @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_(%"struct.Halide::Runtime::Internal::CacheEntry"* %187, i8* %1, i64 %188, i32 %12, %struct.halide_buffer_t* %3, i32 %4, %struct.halide_buffer_t** %5) #13
  br i1 %189, label %206, label %190

; <label>:190:                                    ; preds = %186, %.loopexit2
  %191 = load i64, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  %192 = sub i64 %191, %115
  store i64 %192, i64* @_ZN6Halide7Runtime8Internal18current_cache_sizeE, align 8, !tbaa !89
  br i1 %112, label %193, label %.loopexit1

; <label>:193:                                    ; preds = %190
  %194 = zext i32 %4 to i64
  br label %195

.loopexit1:                                       ; preds = %195, %190
  br i1 %119, label %205, label %.loopexit

; <label>:195:                                    ; preds = %195, %193
  %196 = phi i64 [ 0, %193 ], [ %203, %195 ]
  %197 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %196
  %198 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %197, align 8, !tbaa !7
  %199 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %198, i64 0, i32 2
  %200 = load i8*, i8** %199, align 8, !tbaa !151
  %201 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %200) #13
  %202 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %201, i64 0, i32 0
  store %"struct.Halide::Runtime::Internal::CacheEntry"* null, %"struct.Halide::Runtime::Internal::CacheEntry"** %202, align 8, !tbaa !175
  %203 = add nuw nsw i64 %196, 1
  %204 = icmp eq i64 %203, %194
  br i1 %204, label %.loopexit1, label %195

; <label>:205:                                    ; preds = %.loopexit1
  tail call void @halide_free(i8* %0, i8* nonnull %118) #12
  br label %.loopexit

; <label>:206:                                    ; preds = %186
  %207 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %15 to i64*
  %208 = load i64, i64* %207, align 8, !tbaa !7
  %209 = bitcast i8* %118 to i64*
  store i64 %208, i64* %209, align 8, !tbaa !152
  %210 = load i64, i64* bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE to i64*), align 8, !tbaa !7
  %211 = getelementptr inbounds i8, i8* %118, i64 16
  %212 = bitcast i8* %211 to i64*
  store i64 %210, i64* %212, align 8, !tbaa !172
  %213 = icmp eq i64 %210, 0
  br i1 %213, label %218, label %214

; <label>:214:                                    ; preds = %206
  %215 = inttoptr i64 %210 to %"struct.Halide::Runtime::Internal::CacheEntry"*
  %216 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %215, i64 0, i32 1
  %217 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %216 to i8**
  store i8* %118, i8** %217, align 8, !tbaa !171
  br label %218

; <label>:218:                                    ; preds = %214, %206
  store i8* %118, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal18most_recently_usedE to i8**), align 8, !tbaa !7
  %219 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE, align 8, !tbaa !7
  %220 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %219, null
  br i1 %220, label %221, label %222

; <label>:221:                                    ; preds = %218
  store i8* %118, i8** bitcast (%"struct.Halide::Runtime::Internal::CacheEntry"** @_ZN6Halide7Runtime8Internal19least_recently_usedE to i8**), align 8, !tbaa !7
  br label %222

; <label>:222:                                    ; preds = %221, %218
  %223 = bitcast %"struct.Halide::Runtime::Internal::CacheEntry"** %15 to i8**
  store i8* %118, i8** %223, align 8, !tbaa !7
  %224 = getelementptr inbounds i8, i8* %118, i64 52
  %225 = bitcast i8* %224 to i32*
  store i32 %4, i32* %225, align 4, !tbaa !166
  br i1 %112, label %226, label %.loopexit

; <label>:226:                                    ; preds = %222
  %227 = zext i32 %4 to i64
  br label %228

; <label>:228:                                    ; preds = %228, %226
  %229 = phi i64 [ 0, %226 ], [ %236, %228 ]
  %230 = getelementptr inbounds %struct.halide_buffer_t*, %struct.halide_buffer_t** %5, i64 %229
  %231 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %230, align 8, !tbaa !7
  %232 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %231, i64 0, i32 2
  %233 = load i8*, i8** %232, align 8, !tbaa !151
  %234 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %233) #13
  %235 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %234 to i8**
  store i8* %118, i8** %235, align 8, !tbaa !175
  %236 = add nuw nsw i64 %229, 1
  %237 = icmp eq i64 %236, %227
  br i1 %237, label %.loopexit, label %228

.loopexit:                                        ; preds = %228, %222, %205, %.loopexit1, %98, %.loopexit5
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  ret i32 0
}

; Function Attrs: nounwind
define weak void @halide_memoization_cache_release(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call %"struct.Halide::Runtime::Internal::CacheBlockHeader"* @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh(i8* %1) #13
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheBlockHeader", %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3, i64 0, i32 0
  %5 = load %"struct.Halide::Runtime::Internal::CacheEntry"*, %"struct.Halide::Runtime::Internal::CacheEntry"** %4, align 8, !tbaa !175
  %6 = icmp eq %"struct.Halide::Runtime::Internal::CacheEntry"* %5, null
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %2
  %8 = bitcast %"struct.Halide::Runtime::Internal::CacheBlockHeader"* %3 to i8*
  tail call void @halide_free(i8* %0, i8* %8) #12
  br label %18

; <label>:9:                                      ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  %10 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CacheEntry", %"struct.Halide::Runtime::Internal::CacheEntry"* %5, i64 0, i32 7
  %11 = load i32, i32* %10, align 4, !tbaa !166
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([136 x i8], [136 x i8]* @.str.12.48, i64 0, i64 0)) #12
  tail call void @abort() #12
  %14 = load i32, i32* %10, align 4, !tbaa !166
  br label %15

; <label>:15:                                     ; preds = %13, %9
  %16 = phi i32 [ %11, %9 ], [ %14, %13 ]
  %17 = add i32 %16, -1
  store i32 %17, i32* %10, align 4, !tbaa !166
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal16memoization_lockE) #12
  br label %18

; <label>:18:                                     ; preds = %15, %7
  ret void
}

; Function Attrs: norecurse nounwind
define weak i8* @halide_string_to_string(i8*, i8*, i8*) local_unnamed_addr #2 {
  %4 = icmp ult i8* %0, %1
  br i1 %4, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %3
  br label %6

; <label>:5:                                      ; preds = %11
  store i8 0, i8* %8, align 1, !tbaa !11
  br label %.loopexit

; <label>:6:                                      ; preds = %11, %.preheader
  %7 = phi i8* [ %13, %11 ], [ %2, %.preheader ]
  %8 = phi i8* [ %12, %11 ], [ %0, %.preheader ]
  %9 = load i8, i8* %7, align 1, !tbaa !11
  store i8 %9, i8* %8, align 1, !tbaa !11
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %.loopexit, label %11

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds i8, i8* %8, i64 1
  %13 = getelementptr inbounds i8, i8* %7, i64 1
  %14 = icmp eq i8* %12, %1
  br i1 %14, label %5, label %6

.loopexit:                                        ; preds = %6, %5, %3
  %15 = phi i8* [ %1, %5 ], [ %0, %3 ], [ %8, %6 ]
  ret i8* %15
}

; Function Attrs: nounwind
define weak i8* @halide_uint64_to_string(i8*, i8*, i64, i32) local_unnamed_addr #0 {
  %5 = alloca [32 x i8], align 1
  %6 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #10
  %7 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 31
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 30
  %9 = icmp sgt i32 %3, 0
  %10 = icmp ne i64 %2, 0
  %11 = or i1 %10, %9
  br i1 %11, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %4
  br label %15

.loopexit:                                        ; preds = %15, %4
  %12 = phi i8* [ %8, %4 ], [ %24, %15 ]
  %13 = getelementptr inbounds i8, i8* %12, i64 1
  %14 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %13) #13
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #10
  ret i8* %14

; <label>:15:                                     ; preds = %15, %.preheader
  %16 = phi i64 [ %19, %15 ], [ %2, %.preheader ]
  %17 = phi i8* [ %24, %15 ], [ %8, %.preheader ]
  %18 = phi i32 [ %25, %15 ], [ 0, %.preheader ]
  %19 = udiv i64 %16, 10
  %20 = mul i64 %19, -10
  %21 = add i64 %20, %16
  %22 = trunc i64 %21 to i8
  %23 = add i8 %22, 48
  store i8 %23, i8* %17, align 1, !tbaa !11
  %24 = getelementptr inbounds i8, i8* %17, i64 -1
  %25 = add nuw nsw i32 %18, 1
  %26 = icmp slt i32 %25, %3
  %27 = icmp ugt i64 %16, 9
  %28 = or i1 %27, %26
  br i1 %28, label %15, label %.loopexit
}

; Function Attrs: nounwind
define weak i8* @halide_int64_to_string(i8*, i8*, i64, i32) local_unnamed_addr #0 {
  %5 = icmp slt i64 %2, 0
  %6 = icmp ult i8* %0, %1
  %7 = and i1 %6, %5
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 45, i8* %0, align 1, !tbaa !11
  %10 = sub nsw i64 0, %2
  br label %11

; <label>:11:                                     ; preds = %8, %4
  %12 = phi i64 [ %10, %8 ], [ %2, %4 ]
  %13 = phi i8* [ %9, %8 ], [ %0, %4 ]
  %14 = tail call i8* @halide_uint64_to_string(i8* %13, i8* %1, i64 %12, i32 %3) #13
  ret i8* %14
}

; Function Attrs: nounwind
define weak i8* @halide_double_to_string(i8*, i8*, double, i32) local_unnamed_addr #0 {
  %5 = alloca double, align 8
  %6 = alloca i64, align 8
  %7 = alloca [512 x i8], align 1
  store double %2, double* %5, align 8, !tbaa !131
  %8 = bitcast i64* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #10
  store i64 0, i64* %6, align 8, !tbaa !89
  %9 = bitcast double* %5 to i8*
  %10 = call i8* @memcpy(i8* nonnull %8, i8* nonnull %9, i64 8) #12
  %11 = load i64, i64* %6, align 8, !tbaa !89
  %12 = and i64 %11, 4503599627370495
  %13 = lshr i64 %11, 52
  %14 = trunc i64 %13 to i32
  %15 = and i32 %14, 2047
  %16 = lshr i64 %11, 63
  %17 = trunc i64 %16 to i32
  %18 = icmp eq i32 %15, 2047
  br i1 %18, label %19, label %32

; <label>:19:                                     ; preds = %4
  %20 = icmp eq i64 %12, 0
  %21 = icmp ne i32 %17, 0
  br i1 %20, label %27, label %22

; <label>:22:                                     ; preds = %19
  br i1 %21, label %23, label %25

; <label>:23:                                     ; preds = %22
  %24 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i64 0, i64 0)) #13
  br label %179

; <label>:25:                                     ; preds = %22
  %26 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.58, i64 0, i64 0)) #13
  br label %179

; <label>:27:                                     ; preds = %19
  br i1 %21, label %28, label %30

; <label>:28:                                     ; preds = %27
  %29 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.59, i64 0, i64 0)) #13
  br label %179

; <label>:30:                                     ; preds = %27
  %31 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.60, i64 0, i64 0)) #13
  br label %179

; <label>:32:                                     ; preds = %4
  %33 = icmp eq i32 %15, 0
  %34 = icmp eq i64 %12, 0
  %35 = and i1 %34, %33
  br i1 %35, label %36, label %49

; <label>:36:                                     ; preds = %32
  %37 = icmp eq i32 %3, 0
  %38 = icmp ne i32 %17, 0
  br i1 %37, label %44, label %39

; <label>:39:                                     ; preds = %36
  br i1 %38, label %40, label %42

; <label>:40:                                     ; preds = %39
  %41 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4.61, i64 0, i64 0)) #13
  br label %179

; <label>:42:                                     ; preds = %39
  %43 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5.62, i64 0, i64 0)) #13
  br label %179

; <label>:44:                                     ; preds = %36
  br i1 %38, label %45, label %47

; <label>:45:                                     ; preds = %44
  %46 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6.63, i64 0, i64 0)) #13
  br label %179

; <label>:47:                                     ; preds = %44
  %48 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7.64, i64 0, i64 0)) #13
  br label %179

; <label>:49:                                     ; preds = %32
  %50 = icmp eq i32 %17, 0
  br i1 %50, label %54, label %51

; <label>:51:                                     ; preds = %49
  %52 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.65, i64 0, i64 0)) #13
  %53 = fsub double -0.000000e+00, %2
  store double %53, double* %5, align 8, !tbaa !131
  br label %54

; <label>:54:                                     ; preds = %51, %49
  %55 = phi double [ %53, %51 ], [ %2, %49 ]
  %56 = phi i8* [ %52, %51 ], [ %0, %49 ]
  %57 = icmp eq i32 %3, 0
  br i1 %57, label %101, label %58

; <label>:58:                                     ; preds = %54
  %59 = fcmp olt double %55, 1.000000e+00
  br i1 %59, label %.preheader23, label %67

.preheader23:                                     ; preds = %58
  br label %60

; <label>:60:                                     ; preds = %60, %.preheader23
  %61 = phi i32 [ %64, %60 ], [ 0, %.preheader23 ]
  %62 = phi double [ %63, %60 ], [ %55, %.preheader23 ]
  %63 = fmul double %62, 1.000000e+01
  %64 = add nsw i32 %61, -1
  %65 = fcmp olt double %63, 1.000000e+00
  br i1 %65, label %60, label %66

; <label>:66:                                     ; preds = %60
  store double %63, double* %5, align 8, !tbaa !131
  br label %67

; <label>:67:                                     ; preds = %66, %58
  %68 = phi double [ %63, %66 ], [ %55, %58 ]
  %69 = phi i32 [ %64, %66 ], [ 0, %58 ]
  %70 = fcmp ult double %68, 1.000000e+01
  br i1 %70, label %78, label %.preheader22

.preheader22:                                     ; preds = %67
  br label %71

; <label>:71:                                     ; preds = %71, %.preheader22
  %72 = phi i32 [ %75, %71 ], [ %69, %.preheader22 ]
  %73 = phi double [ %74, %71 ], [ %68, %.preheader22 ]
  %74 = fdiv double %73, 1.000000e+01
  %75 = add nsw i32 %72, 1
  %76 = fcmp ult double %74, 1.000000e+01
  br i1 %76, label %77, label %71

; <label>:77:                                     ; preds = %71
  store double %74, double* %5, align 8, !tbaa !131
  br label %78

; <label>:78:                                     ; preds = %77, %67
  %79 = phi double [ %74, %77 ], [ %68, %67 ]
  %80 = phi i32 [ %75, %77 ], [ %69, %67 ]
  %81 = fmul double %79, 1.000000e+06
  %82 = fadd double %81, 5.000000e-01
  %83 = fptoui double %82 to i64
  %84 = udiv i64 %83, 1000000
  %85 = mul i64 %84, -1000000
  %86 = add i64 %85, %83
  %87 = call i8* @halide_int64_to_string(i8* %56, i8* %1, i64 %84, i32 1) #13
  %88 = call i8* @halide_string_to_string(i8* %87, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #13
  %89 = call i8* @halide_int64_to_string(i8* %88, i8* %1, i64 %86, i32 6) #13
  %90 = icmp sgt i32 %80, -1
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %78
  %92 = call i8* @halide_string_to_string(i8* %89, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10.67, i64 0, i64 0)) #13
  br label %96

; <label>:93:                                     ; preds = %78
  %94 = call i8* @halide_string_to_string(i8* %89, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.68, i64 0, i64 0)) #13
  %95 = sub nsw i32 0, %80
  br label %96

; <label>:96:                                     ; preds = %93, %91
  %97 = phi i32 [ %80, %91 ], [ %95, %93 ]
  %98 = phi i8* [ %92, %91 ], [ %94, %93 ]
  %99 = sext i32 %97 to i64
  %100 = call i8* @halide_int64_to_string(i8* %98, i8* %1, i64 %99, i32 2) #13
  br label %179

; <label>:101:                                    ; preds = %54
  br i1 %33, label %102, label %104

; <label>:102:                                    ; preds = %101
  %103 = call i8* @halide_double_to_string(i8* %56, i8* %1, double 0.000000e+00, i32 0) #13
  br label %179

; <label>:104:                                    ; preds = %101
  %105 = or i64 %12, 4503599627370496
  %106 = add nsw i32 %15, -1075
  %107 = icmp ult i32 %15, 1075
  br i1 %107, label %108, label %138

; <label>:108:                                    ; preds = %104
  %109 = icmp ult i32 %15, 1023
  br i1 %109, label %116, label %110

; <label>:110:                                    ; preds = %108
  %111 = sub nsw i32 1075, %15
  %112 = zext i32 %111 to i64
  %113 = lshr i64 %105, %112
  %114 = shl i64 %113, %112
  %115 = sub i64 %105, %114
  br label %116

; <label>:116:                                    ; preds = %110, %108
  %117 = phi i64 [ %113, %110 ], [ 0, %108 ]
  %118 = phi i64 [ %115, %110 ], [ %105, %108 ]
  %119 = uitofp i64 %118 to double
  %120 = zext i32 %106 to i64
  %121 = shl i64 %120, 52
  %122 = add i64 %121, 4696837146684686336
  %123 = bitcast i64 %122 to double
  %124 = fmul double %123, %119
  %125 = fadd double %124, 5.000000e-01
  %126 = fptoui double %125 to i64
  %127 = uitofp i64 %126 to double
  %128 = fcmp oeq double %125, %127
  %129 = and i64 %126, 1
  %130 = icmp ne i64 %129, 0
  %131 = and i1 %130, %128
  %132 = sext i1 %131 to i64
  %133 = add i64 %132, %126
  %134 = icmp eq i64 %133, 1000000
  %135 = zext i1 %134 to i64
  %136 = add i64 %117, %135
  %137 = select i1 %134, i64 0, i64 %133
  br label %138

; <label>:138:                                    ; preds = %116, %104
  %139 = phi i64 [ %136, %116 ], [ %105, %104 ]
  %140 = phi i32 [ 0, %116 ], [ %106, %104 ]
  %141 = phi i64 [ %137, %116 ], [ 0, %104 ]
  %142 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %142) #10
  %143 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 512
  %144 = getelementptr inbounds [512 x i8], [512 x i8]* %7, i64 0, i64 480
  %145 = call i8* @halide_int64_to_string(i8* nonnull %144, i8* nonnull %143, i64 %139, i32 1) #13
  %146 = icmp sgt i32 %140, 0
  br i1 %146, label %.preheader21, label %.loopexit

.preheader21:                                     ; preds = %138
  br label %151

.loopexit:                                        ; preds = %175, %138
  %147 = phi i8* [ %144, %138 ], [ %176, %175 ]
  %148 = call i8* @halide_string_to_string(i8* %56, i8* %1, i8* %147) #13
  %149 = call i8* @halide_string_to_string(i8* %148, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #13
  %150 = call i8* @halide_int64_to_string(i8* %149, i8* %1, i64 %141, i32 6) #13
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %142) #10
  br label %179

; <label>:151:                                    ; preds = %175, %.preheader21
  %152 = phi i32 [ %177, %175 ], [ 0, %.preheader21 ]
  %153 = phi i8* [ %176, %175 ], [ %144, %.preheader21 ]
  %154 = icmp eq i8* %145, %153
  br i1 %154, label %175, label %.preheader

.preheader:                                       ; preds = %151
  br label %156

; <label>:155:                                    ; preds = %156
  br i1 %166, label %173, label %175

; <label>:156:                                    ; preds = %156, %.preheader
  %157 = phi i8* [ %159, %156 ], [ %145, %.preheader ]
  %158 = phi i32 [ %168, %156 ], [ 0, %.preheader ]
  %159 = getelementptr inbounds i8, i8* %157, i64 -1
  %160 = load i8, i8* %159, align 1, !tbaa !11
  %161 = add i8 %160, -48
  %162 = sext i8 %161 to i32
  %163 = shl nsw i32 %162, 1
  %164 = or i32 %163, %158
  %165 = trunc i32 %164 to i8
  %166 = icmp sgt i8 %165, 9
  %167 = add nsw i32 %164, 246
  %168 = zext i1 %166 to i32
  %169 = select i1 %166, i32 %167, i32 %164
  %170 = trunc i32 %169 to i8
  %171 = add i8 %170, 48
  store i8 %171, i8* %159, align 1, !tbaa !11
  %172 = icmp eq i8* %159, %153
  br i1 %172, label %155, label %156

; <label>:173:                                    ; preds = %155
  %174 = getelementptr inbounds i8, i8* %153, i64 -1
  store i8 49, i8* %174, align 1, !tbaa !11
  br label %175

; <label>:175:                                    ; preds = %173, %155, %151
  %176 = phi i8* [ %174, %173 ], [ %153, %155 ], [ %145, %151 ]
  %177 = add nuw nsw i32 %152, 1
  %178 = icmp eq i32 %177, %140
  br i1 %178, label %.loopexit, label %151

; <label>:179:                                    ; preds = %.loopexit, %102, %96, %47, %45, %42, %40, %30, %28, %25, %23
  %180 = phi i8* [ %24, %23 ], [ %26, %25 ], [ %29, %28 ], [ %31, %30 ], [ %41, %40 ], [ %43, %42 ], [ %46, %45 ], [ %48, %47 ], [ %103, %102 ], [ %100, %96 ], [ %150, %.loopexit ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #10
  ret i8* %180
}

; Function Attrs: nounwind
define weak i8* @halide_pointer_to_string(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = alloca [20 x i8], align 1
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #10
  call void @llvm.memset.p0i8.i64(i8* nonnull %5, i8 0, i64 20, i32 1, i1 false)
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i64 0, i64 18
  %7 = ptrtoint i8* %2 to i64
  br label %8

; <label>:8:                                      ; preds = %8, %3
  %9 = phi i32 [ 0, %3 ], [ %18, %8 ]
  %10 = phi i64 [ %7, %3 ], [ %16, %8 ]
  %11 = phi i8* [ %6, %3 ], [ %15, %8 ]
  %12 = and i64 %10, 15
  %13 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.12.71, i64 0, i64 %12
  %14 = load i8, i8* %13, align 1, !tbaa !11
  %15 = getelementptr inbounds i8, i8* %11, i64 -1
  store i8 %14, i8* %11, align 1, !tbaa !11
  %16 = lshr i64 %10, 4
  %17 = icmp ne i64 %16, 0
  %18 = add nuw nsw i32 %9, 1
  %19 = icmp ult i32 %18, 16
  %20 = and i1 %19, %17
  br i1 %20, label %8, label %21

; <label>:21:                                     ; preds = %8
  %22 = getelementptr inbounds i8, i8* %11, i64 -2
  store i8 120, i8* %15, align 1, !tbaa !11
  store i8 48, i8* %22, align 1, !tbaa !11
  %23 = call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %22) #13
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #10
  ret i8* %23
}

; Function Attrs: nounwind
define weak i8* @halide_type_to_string(i8*, i8*, %struct.halide_type_t*) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 0
  %5 = load i8, i8* %4, align 2, !tbaa !176
  %6 = icmp ult i8 %5, 4
  br i1 %6, label %switch.lookup, label %8

switch.lookup:                                    ; preds = %3
  %7 = sext i8 %5 to i64
  %switch.gep = getelementptr inbounds [4 x i8*], [4 x i8*]* @switch.table.halide_type_to_string, i64 0, i64 %7
  %switch.load = load i8*, i8** %switch.gep, align 8
  br label %8

; <label>:8:                                      ; preds = %switch.lookup, %3
  %9 = phi i8* [ %switch.load, %switch.lookup ], [ getelementptr inbounds ([14 x i8], [14 x i8]* @.str.17.72, i64 0, i64 0), %3 ]
  %10 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* nonnull %9) #13
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 1
  %12 = load i8, i8* %11, align 1, !tbaa !108
  %13 = zext i8 %12 to i64
  %14 = tail call i8* @halide_uint64_to_string(i8* %10, i8* %1, i64 %13, i32 1) #13
  %15 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %2, i64 0, i32 2
  %16 = load i16, i16* %15, align 2, !tbaa !177
  %17 = icmp eq i16 %16, 1
  br i1 %17, label %23, label %18

; <label>:18:                                     ; preds = %8
  %19 = tail call i8* @halide_string_to_string(i8* %14, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18.77, i64 0, i64 0)) #13
  %20 = load i16, i16* %15, align 2, !tbaa !177
  %21 = zext i16 %20 to i64
  %22 = tail call i8* @halide_uint64_to_string(i8* %19, i8* %1, i64 %21, i32 1) #13
  br label %23

; <label>:23:                                     ; preds = %18, %8
  %24 = phi i8* [ %22, %18 ], [ %14, %8 ]
  ret i8* %24
}

; Function Attrs: nounwind
define weak i8* @halide_buffer_to_string(i8*, i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %2, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.78, i64 0, i64 0)) #13
  br label %61

; <label>:7:                                      ; preds = %3
  %8 = tail call i8* @halide_string_to_string(i8* %0, i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20.79, i64 0, i64 0)) #13
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !178
  %11 = tail call i8* @halide_uint64_to_string(i8* %8, i8* %1, i64 %10, i32 1) #13
  %12 = tail call i8* @halide_string_to_string(i8* %11, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 1
  %14 = bitcast %struct.halide_device_interface_t** %13 to i8**
  %15 = load i8*, i8** %14, align 8, !tbaa !179
  %16 = tail call i8* @halide_pointer_to_string(i8* %12, i8* %1, i8* %15) #13
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %18 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !151
  %20 = tail call i8* @halide_pointer_to_string(i8* %17, i8* %1, i8* %19) #13
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 3
  %23 = load i64, i64* %22, align 8, !tbaa !180
  %24 = tail call i8* @halide_uint64_to_string(i8* %21, i8* %1, i64 %23, i32 1) #13
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %26 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4
  %27 = tail call i8* @halide_type_to_string(i8* %25, i8* %1, %struct.halide_type_t* nonnull %26) #13
  %28 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %29 = load i32, i32* %28, align 4, !tbaa !134
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %.loopexit

; <label>:31:                                     ; preds = %7
  %32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 6
  br label %35

.loopexit:                                        ; preds = %35, %7
  %33 = phi i8* [ %27, %7 ], [ %56, %35 ]
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #13
  br label %61

; <label>:35:                                     ; preds = %35, %31
  %36 = phi i64 [ 0, %31 ], [ %57, %35 ]
  %37 = phi i8* [ %27, %31 ], [ %56, %35 ]
  %38 = tail call i8* @halide_string_to_string(i8* %37, i8* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22.82, i64 0, i64 0)) #13
  %39 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !136
  %40 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %39, i64 %36, i32 0
  %41 = load i32, i32* %40, align 4, !tbaa !140
  %42 = sext i32 %41 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %38, i8* %1, i64 %42, i32 1) #13
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %45 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !136
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %45, i64 %36, i32 1
  %47 = load i32, i32* %46, align 4, !tbaa !138
  %48 = sext i32 %47 to i64
  %49 = tail call i8* @halide_int64_to_string(i8* %44, i8* %1, i64 %48, i32 1) #13
  %50 = tail call i8* @halide_string_to_string(i8* %49, i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #13
  %51 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %32, align 8, !tbaa !136
  %52 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %51, i64 %36, i32 2
  %53 = load i32, i32* %52, align 4, !tbaa !141
  %54 = sext i32 %53 to i64
  %55 = tail call i8* @halide_int64_to_string(i8* %50, i8* %1, i64 %54, i32 1) #13
  %56 = tail call i8* @halide_string_to_string(i8* %55, i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23.83, i64 0, i64 0)) #13
  %57 = add nuw nsw i64 %36, 1
  %58 = load i32, i32* %28, align 4, !tbaa !134
  %59 = sext i32 %58 to i64
  %60 = icmp slt i64 %57, %59
  br i1 %60, label %35, label %.loopexit

; <label>:61:                                     ; preds = %.loopexit, %5
  %62 = phi i8* [ %6, %5 ], [ %34, %.loopexit ]
  ret i8* %62
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %4 = load i64, i64* %3, align 8, !tbaa !180
  %5 = and i64 %4, 2
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %24, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = and i64 %4, 1
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %24

; <label>:12:                                     ; preds = %7
  %13 = icmp eq %struct.halide_device_interface_t* %9, null
  br i1 %13, label %24, label %14

; <label>:14:                                     ; preds = %12
  %15 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %9, i64 0, i32 15
  %16 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %15, align 8, !tbaa !181
  %17 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %16, i64 0, i32 6
  %18 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %17, align 8, !tbaa !183
  %19 = tail call i32 %18(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %14
  %22 = load i64, i64* %3, align 8, !tbaa !180
  %23 = and i64 %22, -3
  store i64 %23, i64* %3, align 8, !tbaa !180
  tail call void @halide_msan_annotate_buffer_is_initialized(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  br label %24

; <label>:24:                                     ; preds = %21, %14, %12, %7, %2
  %25 = phi i32 [ 0, %2 ], [ 0, %21 ], [ -14, %7 ], [ -19, %12 ], [ -14, %14 ]
  ret i32 %25
}

; Function Attrs: nounwind
define weak void @halide_device_release(i8*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %1, i64 0, i32 15
  %4 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %3, align 8, !tbaa !181
  %5 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %4, i64 0, i32 5
  %6 = load i32 (i8*)*, i32 (i8*)** %5, align 8, !tbaa !185
  %7 = tail call i32 %6(i8* %0) #12
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9.88, i64 0, i64 0)) #12
  br label %29

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = icmp ne %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !178
  %12 = icmp ne i64 %11, 0
  %13 = xor i1 %12, true
  %14 = or i1 %9, %13
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %.predBB1.split

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

; <label>:29:                                     ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %.predBB2.split, label %34

.predBB1.split:                                   ; preds = %22
  %32 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  br label %34

.predBB2.split:                                   ; preds = %29
  %33 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* %1) #13
  br label %34

; <label>:34:                                     ; preds = %.predBB2.split, %.predBB1.split, %29
  %35 = phi i32 [ %30, %29 ], [ %32, %.predBB1.split ], [ %33, %.predBB2.split ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %35
}

; Function Attrs: nounwind
define linkonce i32 @copy_to_device_already_locked(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10.89, i64 0, i64 0)) #12
  br label %30

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = icmp ne %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !178
  %13 = icmp ne i64 %12, 0
  %14 = xor i1 %13, true
  %15 = or i1 %10, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

; <label>:30:                                     ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %72

; <label>:33:                                     ; preds = %30, %23
  %34 = icmp eq %struct.halide_device_interface_t* %2, null
  br i1 %34, label %35, label %41

; <label>:35:                                     ; preds = %33
  %36 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %37 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %36, align 8, !tbaa !179
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %35
  %40 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %72

; <label>:41:                                     ; preds = %35, %33
  %42 = phi %struct.halide_device_interface_t* [ %2, %33 ], [ %37, %35 ]
  %43 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %44 = load i64, i64* %43, align 8, !tbaa !178
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %51, label %46

; <label>:46:                                     ; preds = %41
  %47 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %48 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %47, align 8, !tbaa !179
  %49 = icmp eq %struct.halide_device_interface_t* %48, %42
  br i1 %49, label %54, label %50

; <label>:50:                                     ; preds = %46
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.12.90, i64 0, i64 0)) #12
  br label %72

; <label>:51:                                     ; preds = %41
  %52 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %42) #13
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %72

; <label>:54:                                     ; preds = %51, %46
  %55 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %56 = load i64, i64* %55, align 8, !tbaa !180
  %57 = and i64 %56, 1
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %72, label %59

; <label>:59:                                     ; preds = %54
  %60 = and i64 %56, 2
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %62, label %72

; <label>:62:                                     ; preds = %59
  %63 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %42, i64 0, i32 15
  %64 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %63, align 8, !tbaa !181
  %65 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %64, i64 0, i32 7
  %66 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %65, align 8, !tbaa !186
  %67 = tail call i32 %66(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %72

; <label>:69:                                     ; preds = %62
  %70 = load i64, i64* %55, align 8, !tbaa !180
  %71 = and i64 %70, -2
  store i64 %71, i64* %55, align 8, !tbaa !180
  br label %72

; <label>:72:                                     ; preds = %69, %62, %59, %54, %51, %50, %39, %30
  %73 = phi i32 [ %40, %39 ], [ -42, %50 ], [ %31, %30 ], [ 0, %69 ], [ 0, %54 ], [ %52, %51 ], [ -15, %59 ], [ -15, %62 ]
  ret i32 %73
}

; Function Attrs: nounwind
define weak i32 @halide_device_malloc(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18.91, i64 0, i64 0)) #12
  br label %30

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = icmp ne %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !178
  %13 = icmp ne i64 %12, 0
  %14 = xor i1 %13, true
  %15 = or i1 %10, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

; <label>:30:                                     ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %56

; <label>:33:                                     ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !179
  br label %36

; <label>:36:                                     ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  %39 = icmp eq %struct.halide_device_interface_t* %37, %2
  %40 = or i1 %38, %39
  br i1 %40, label %42, label %41

; <label>:41:                                     ; preds = %36
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.20.92, i64 0, i64 0)) #12
  br label %56

; <label>:42:                                     ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !187
  tail call void %46() #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 2
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !188
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !189
  tail call void %53() #12
  %54 = icmp eq i32 %50, 0
  %55 = select i1 %54, i32 0, i32 -16
  br label %56

; <label>:56:                                     ; preds = %42, %41, %30
  %57 = phi i32 [ %31, %30 ], [ -42, %41 ], [ %55, %42 ]
  ret i32 %57
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %4 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* %1, %struct.halide_device_interface_t* %2) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %4
}

; Function Attrs: nounwind
define weak i32 @halide_device_sync(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.17.93, i64 0, i64 0)) #12
  br label %29

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = icmp ne %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !178
  %12 = icmp ne i64 %11, 0
  %13 = xor i1 %12, true
  %14 = or i1 %9, %13
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

; <label>:29:                                     ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %48

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !179
  br label %35

; <label>:35:                                     ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %35
  %39 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %48

; <label>:40:                                     ; preds = %35
  %41 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %42 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %41, align 8, !tbaa !181
  %43 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %42, i64 0, i32 4
  %44 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %43, align 8, !tbaa !190
  %45 = tail call i32 %44(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %46 = icmp eq i32 %45, 0
  %47 = select i1 %46, i32 0, i32 -17
  br label %48

; <label>:48:                                     ; preds = %40, %38, %29
  %49 = phi i32 [ %30, %29 ], [ %39, %38 ], [ %47, %40 ]
  ret i32 %49
}

; Function Attrs: nounwind
define weak i32 @halide_device_free(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21.96, i64 0, i64 0)) #12
  br label %29

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = icmp ne %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !178
  %12 = icmp ne i64 %11, 0
  %13 = xor i1 %12, true
  %14 = or i1 %9, %13
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

; <label>:29:                                     ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %61

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !179
  br label %35

; <label>:35:                                     ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

; <label>:38:                                     ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !187
  tail call void %42() #12
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 3
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !191
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !189
  tail call void %49() #12
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !178
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

; <label>:53:                                     ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.22.97, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %54

; <label>:54:                                     ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -18
  br label %61

; <label>:57:                                     ; preds = %35
  %58 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %59 = load i64, i64* %58, align 8, !tbaa !180
  %60 = and i64 %59, -3
  store i64 %60, i64* %58, align 8, !tbaa !180
  br label %61

; <label>:61:                                     ; preds = %57, %54, %29
  %62 = phi i32 [ %30, %29 ], [ 0, %57 ], [ %56, %54 ]
  ret i32 %62
}

; Function Attrs: nounwind
define weak void @halide_device_free_as_destructor(i8*, i8*) local_unnamed_addr #0 {
  %3 = bitcast i8* %1 to %struct.halide_buffer_t*
  %4 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %3) #13
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_device_and_host_malloc(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23.98, i64 0, i64 0)) #12
  br label %30

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = icmp ne %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !178
  %13 = icmp ne i64 %12, 0
  %14 = xor i1 %13, true
  %15 = or i1 %10, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %36

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

; <label>:30:                                     ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %56

; <label>:33:                                     ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !179
  br label %36

; <label>:36:                                     ; preds = %33, %23
  %37 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %38 = icmp eq %struct.halide_device_interface_t* %37, null
  %39 = icmp eq %struct.halide_device_interface_t* %37, %2
  %40 = or i1 %38, %39
  br i1 %40, label %42, label %41

; <label>:41:                                     ; preds = %36
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25.99, i64 0, i64 0)) #12
  br label %56

; <label>:42:                                     ; preds = %36
  %43 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %44 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %45 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %44, i64 0, i32 0
  %46 = load void ()*, void ()** %45, align 8, !tbaa !187
  tail call void %46() #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 8
  %49 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %48, align 8, !tbaa !192
  %50 = tail call i32 %49(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %51 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %43, align 8, !tbaa !181
  %52 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %51, i64 0, i32 1
  %53 = load void ()*, void ()** %52, align 8, !tbaa !189
  tail call void %53() #12
  %54 = icmp eq i32 %50, 0
  br i1 %54, label %56, label %55

; <label>:55:                                     ; preds = %42
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.26.100, i64 0, i64 0)) #12
  br label %56

; <label>:56:                                     ; preds = %55, %42, %41, %30
  %57 = phi i32 [ %31, %30 ], [ -42, %41 ], [ -16, %55 ], [ 0, %42 ]
  ret i32 %57
}

; Function Attrs: nounwind
define weak i32 @halide_device_and_host_free(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.27.101, i64 0, i64 0)) #12
  br label %29

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = icmp ne %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !178
  %12 = icmp ne i64 %11, 0
  %13 = xor i1 %12, true
  %14 = or i1 %9, %13
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

; <label>:29:                                     ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %66

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !179
  br label %35

; <label>:35:                                     ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

; <label>:38:                                     ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !187
  tail call void %42() #12
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 9
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !193
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !189
  tail call void %49() #12
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !178
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

; <label>:53:                                     ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.28.102, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %54

; <label>:54:                                     ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -18
  br label %66

; <label>:57:                                     ; preds = %35
  %58 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %59 = load i8*, i8** %58, align 8, !tbaa !151
  %60 = icmp eq i8* %59, null
  br i1 %60, label %62, label %61

; <label>:61:                                     ; preds = %57
  tail call void @halide_free(i8* %0, i8* nonnull %59) #12
  store i8* null, i8** %58, align 8, !tbaa !151
  br label %62

; <label>:62:                                     ; preds = %61, %57
  %63 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %64 = load i64, i64* %63, align 8, !tbaa !180
  %65 = and i64 %64, -3
  store i64 %65, i64* %63, align 8, !tbaa !180
  br label %66

; <label>:66:                                     ; preds = %62, %54, %29
  %67 = phi i32 [ %30, %29 ], [ 0, %62 ], [ %56, %54 ]
  ret i32 %67
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_and_host_malloc(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29.103, i64 0, i64 0)) #12
  br label %30

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = icmp ne %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !178
  %13 = icmp ne i64 %12, 0
  %14 = xor i1 %13, true
  %15 = or i1 %10, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %33

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

; <label>:30:                                     ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %100

; <label>:33:                                     ; preds = %30, %23
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %35 = load i32, i32* %34, align 4, !tbaa !134
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %40, label %37

; <label>:37:                                     ; preds = %33
  %38 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 4, i32 1
  %39 = load i8, i8* %38, align 1, !tbaa !108
  br label %83

; <label>:40:                                     ; preds = %33
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 6
  %42 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %41, align 8, !tbaa !136
  %43 = sext i32 %35 to i64
  br label %44

; <label>:44:                                     ; preds = %57, %40
  %45 = phi i64 [ 0, %40 ], [ %59, %57 ]
  %46 = phi i64 [ 0, %40 ], [ %58, %57 ]
  %47 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 %45, i32 2
  %48 = load i32, i32* %47, align 4, !tbaa !141
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %57

; <label>:50:                                     ; preds = %44
  %51 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 %45, i32 1
  %52 = load i32, i32* %51, align 4, !tbaa !138
  %53 = add nsw i32 %52, -1
  %54 = mul nsw i32 %53, %48
  %55 = sext i32 %54 to i64
  %56 = add nsw i64 %46, %55
  br label %57

; <label>:57:                                     ; preds = %50, %44
  %58 = phi i64 [ %56, %50 ], [ %46, %44 ]
  %59 = add nuw nsw i64 %45, 1
  %60 = icmp eq i64 %59, %43
  br i1 %60, label %61, label %44

; <label>:61:                                     ; preds = %57
  %62 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 4, i32 1
  %63 = load i8, i8* %62, align 1, !tbaa !108
  br label %64

; <label>:64:                                     ; preds = %77, %61
  %65 = phi i64 [ 0, %61 ], [ %79, %77 ]
  %66 = phi i64 [ 0, %61 ], [ %78, %77 ]
  %67 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 %65, i32 2
  %68 = load i32, i32* %67, align 4, !tbaa !141
  %69 = icmp slt i32 %68, 0
  br i1 %69, label %70, label %77

; <label>:70:                                     ; preds = %64
  %71 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %42, i64 %65, i32 1
  %72 = load i32, i32* %71, align 4, !tbaa !138
  %73 = add nsw i32 %72, -1
  %74 = mul nsw i32 %73, %68
  %75 = sext i32 %74 to i64
  %76 = add nsw i64 %66, %75
  br label %77

; <label>:77:                                     ; preds = %70, %64
  %78 = phi i64 [ %76, %70 ], [ %66, %64 ]
  %79 = add nuw nsw i64 %65, 1
  %80 = icmp eq i64 %79, %43
  br i1 %80, label %81, label %64

; <label>:81:                                     ; preds = %77
  %82 = add nsw i64 %58, 1
  br label %83

; <label>:83:                                     ; preds = %81, %37
  %84 = phi i8 [ %39, %37 ], [ %63, %81 ]
  %85 = phi i64 [ 1, %37 ], [ %82, %81 ]
  %86 = phi i64 [ 0, %37 ], [ %78, %81 ]
  %87 = zext i8 %84 to i64
  %88 = add nuw nsw i64 %87, 7
  %89 = lshr i64 %88, 3
  %90 = sub i64 %85, %86
  %91 = mul i64 %90, %89
  %92 = tail call i8* @halide_malloc(i8* %0, i64 %91) #12
  %93 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  store i8* %92, i8** %93, align 8, !tbaa !151
  %94 = icmp eq i8* %92, null
  br i1 %94, label %100, label %95

; <label>:95:                                     ; preds = %83
  %96 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2) #13
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %95
  %99 = load i8*, i8** %93, align 8, !tbaa !151
  tail call void @halide_free(i8* %0, i8* %99) #12
  store i8* null, i8** %93, align 8, !tbaa !151
  br label %100

; <label>:100:                                    ; preds = %98, %95, %83, %30
  %101 = phi i32 [ %31, %30 ], [ -1, %83 ], [ 0, %95 ], [ %96, %98 ]
  ret i32 %101
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_and_host_free(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.30.104, i64 0, i64 0)) #12
  br label %30

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = icmp ne %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !178
  %13 = icmp ne i64 %12, 0
  %14 = xor i1 %13, true
  %15 = or i1 %10, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %.predBB1.split

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

; <label>:30:                                     ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.predBB2.split, label %44

.predBB1.split:                                   ; preds = %23
  %33 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  br label %35

.predBB2.split:                                   ; preds = %30
  %34 = tail call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* %1) #13
  br label %35

; <label>:35:                                     ; preds = %.predBB2.split, %.predBB1.split
  %phi.call = phi i32 [ %33, %.predBB1.split ], [ %34, %.predBB2.split ]
  %36 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %37 = load i8*, i8** %36, align 8, !tbaa !151
  %38 = icmp eq i8* %37, null
  br i1 %38, label %40, label %39

; <label>:39:                                     ; preds = %35
  tail call void @halide_free(i8* %0, i8* nonnull %37) #12
  store i8* null, i8** %36, align 8, !tbaa !151
  br label %40

; <label>:40:                                     ; preds = %39, %35
  %41 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %42 = load i64, i64* %41, align 8, !tbaa !180
  %43 = and i64 %42, -4
  store i64 %43, i64* %41, align 8, !tbaa !180
  br label %44

; <label>:44:                                     ; preds = %40, %30
  %45 = phi i32 [ %phi.call, %40 ], [ %31, %30 ]
  ret i32 %45
}

; Function Attrs: nounwind
define weak i32 @halide_device_wrap_native(i8*, %struct.halide_buffer_t*, i64, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %5 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %4
  %7 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.31.105, i64 0, i64 0)) #12
  br label %31

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %10 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %9, align 8, !tbaa !179
  %11 = icmp ne %struct.halide_device_interface_t* %10, null
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %13 = load i64, i64* %12, align 8, !tbaa !178
  %14 = icmp ne i64 %13, 0
  %15 = xor i1 %14, true
  %16 = or i1 %11, %15
  br i1 %16, label %19, label %17

; <label>:17:                                     ; preds = %8
  %18 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %31

; <label>:19:                                     ; preds = %8
  %20 = xor i1 %11, true
  %21 = or i1 %14, %20
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %19
  %23 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %31

; <label>:24:                                     ; preds = %19
  %25 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %26 = load i64, i64* %25, align 8, !tbaa !180
  %27 = and i64 %26, 3
  %28 = icmp eq i64 %27, 3
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %24
  %30 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %31

; <label>:31:                                     ; preds = %29, %22, %17, %6
  %32 = phi i32 [ %7, %6 ], [ %23, %22 ], [ %18, %17 ], [ %30, %29 ]
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %58

; <label>:34:                                     ; preds = %31
  %35 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %36 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %35, align 8, !tbaa !179
  br label %37

; <label>:37:                                     ; preds = %34, %24
  %38 = phi %struct.halide_device_interface_t** [ %35, %34 ], [ %9, %24 ]
  %39 = phi %struct.halide_device_interface_t* [ %36, %34 ], [ %10, %24 ]
  %40 = icmp eq %struct.halide_device_interface_t* %39, null
  %41 = icmp eq %struct.halide_device_interface_t* %39, %3
  %42 = or i1 %40, %41
  br i1 %42, label %44, label %43

; <label>:43:                                     ; preds = %37
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.32.106, i64 0, i64 0)) #12
  br label %58

; <label>:44:                                     ; preds = %37
  %45 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %3, i64 0, i32 15
  %46 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !181
  %47 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %46, i64 0, i32 0
  %48 = load void ()*, void ()** %47, align 8, !tbaa !187
  tail call void %48() #12
  store %struct.halide_device_interface_t* %3, %struct.halide_device_interface_t** %38, align 8, !tbaa !179
  %49 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !181
  %50 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %49, i64 0, i32 14
  %51 = load i32 (i8*, %struct.halide_buffer_t*, i64)*, i32 (i8*, %struct.halide_buffer_t*, i64)** %50, align 8, !tbaa !194
  %52 = tail call i32 %51(i8* %0, %struct.halide_buffer_t* nonnull %1, i64 %2) #12
  %53 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %45, align 8, !tbaa !181
  %54 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %53, i64 0, i32 1
  %55 = load void ()*, void ()** %54, align 8, !tbaa !189
  tail call void %55() #12
  %56 = icmp eq i32 %52, 0
  %57 = select i1 %56, i32 0, i32 -16
  br label %58

; <label>:58:                                     ; preds = %44, %43, %31
  %59 = phi i32 [ %32, %31 ], [ -42, %43 ], [ %57, %44 ]
  ret i32 %59
}

; Function Attrs: nounwind
define weak i32 @halide_device_detach_native(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33.107, i64 0, i64 0)) #12
  br label %29

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = icmp ne %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !178
  %12 = icmp ne i64 %11, 0
  %13 = xor i1 %12, true
  %14 = or i1 %9, %13
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

; <label>:29:                                     ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %57

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %34 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %33, align 8, !tbaa !179
  br label %35

; <label>:35:                                     ; preds = %32, %22
  %36 = phi %struct.halide_device_interface_t* [ %34, %32 ], [ %8, %22 ]
  %37 = icmp eq %struct.halide_device_interface_t* %36, null
  br i1 %37, label %57, label %38

; <label>:38:                                     ; preds = %35
  %39 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %36, i64 0, i32 15
  %40 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %41 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %40, i64 0, i32 0
  %42 = load void ()*, void ()** %41, align 8, !tbaa !187
  tail call void %42() #12
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 15
  %45 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %44, align 8, !tbaa !195
  %46 = tail call i32 %45(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  %47 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %39, align 8, !tbaa !181
  %48 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %47, i64 0, i32 1
  %49 = load void ()*, void ()** %48, align 8, !tbaa !189
  tail call void %49() #12
  %50 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !178
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %54, label %53

; <label>:53:                                     ; preds = %38
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.34.108, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %54

; <label>:54:                                     ; preds = %53, %38
  %55 = icmp eq i32 %46, 0
  %56 = select i1 %55, i32 0, i32 -33
  ret i32 %56

; <label>:57:                                     ; preds = %35, %29
  %58 = phi i32 [ 0, %35 ], [ %30, %29 ]
  ret i32 %58
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_wrap_native(i8*, %struct.halide_buffer_t*, i64) local_unnamed_addr #0 {
  %4 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %3
  %6 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.35.109, i64 0, i64 0)) #12
  br label %30

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = icmp ne %struct.halide_device_interface_t* %9, null
  %11 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !178
  %13 = icmp ne i64 %12, 0
  %14 = xor i1 %13, true
  %15 = or i1 %10, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %7
  %17 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %30

; <label>:18:                                     ; preds = %7
  %19 = xor i1 %10, true
  %20 = or i1 %13, %19
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %30

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %25 = load i64, i64* %24, align 8, !tbaa !180
  %26 = and i64 %25, 3
  %27 = icmp eq i64 %26, 3
  br i1 %27, label %28, label %37

; <label>:28:                                     ; preds = %23
  %29 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %30

; <label>:30:                                     ; preds = %28, %21, %16, %5
  %31 = phi i32 [ %6, %5 ], [ %22, %21 ], [ %17, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %44

; <label>:33:                                     ; preds = %30
  %34 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %35 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %34, align 8, !tbaa !179
  %36 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  br label %37

; <label>:37:                                     ; preds = %33, %23
  %38 = phi i64* [ %36, %33 ], [ %11, %23 ]
  %39 = phi %struct.halide_device_interface_t* [ %35, %33 ], [ %9, %23 ]
  %40 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %39, i64 0, i32 15
  %41 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %40, align 8, !tbaa !181
  %42 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %41, i64 0, i32 0
  %43 = load void ()*, void ()** %42, align 8, !tbaa !187
  tail call void %43() #12
  store i64 %2, i64* %38, align 8, !tbaa !178
  br label %44

; <label>:44:                                     ; preds = %37, %30
  %45 = phi i32 [ 0, %37 ], [ %31, %30 ]
  ret i32 %45
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_detach_native(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.halide_buffer_t* %1, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @halide_error_buffer_is_null(i8* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.36, i64 0, i64 0)) #12
  br label %29

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = icmp ne %struct.halide_device_interface_t* %8, null
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !178
  %12 = icmp ne i64 %11, 0
  %13 = xor i1 %12, true
  %14 = or i1 %9, %13
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %6
  %16 = tail call i32 @halide_error_no_device_interface(i8* %0) #12
  br label %29

; <label>:17:                                     ; preds = %6
  %18 = xor i1 %9, true
  %19 = or i1 %12, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %17
  %21 = tail call i32 @halide_error_device_interface_no_device(i8* %0) #12
  br label %29

; <label>:22:                                     ; preds = %17
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %24 = load i64, i64* %23, align 8, !tbaa !180
  %25 = and i64 %24, 3
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %27, label %35

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @halide_error_host_and_device_dirty(i8* %0) #12
  br label %29

; <label>:29:                                     ; preds = %27, %20, %15, %4
  %30 = phi i32 [ %5, %4 ], [ %21, %20 ], [ %16, %15 ], [ %28, %27 ]
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %46

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %34 = load i64, i64* %33, align 8, !tbaa !178
  br label %35

; <label>:35:                                     ; preds = %32, %22
  %36 = phi i64* [ %33, %32 ], [ %10, %22 ]
  %37 = phi i64 [ %34, %32 ], [ %11, %22 ]
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %46, label %39

; <label>:39:                                     ; preds = %35
  %40 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %41 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %40, align 8, !tbaa !179
  %42 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %41, i64 0, i32 15
  %43 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %42, align 8, !tbaa !181
  %44 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %43, i64 0, i32 1
  %45 = load void ()*, void ()** %44, align 8, !tbaa !189
  tail call void %45() #12
  store i64 0, i64* %36, align 8, !tbaa !178
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %40, align 8, !tbaa !179
  br label %46

; <label>:46:                                     ; preds = %39, %35, %29
  %47 = phi i32 [ 0, %39 ], [ %30, %29 ], [ 0, %35 ]
  ret i32 %47
}

; Function Attrs: nounwind
define weak void @halide_device_and_host_free_as_destructor(i8*, i8*) local_unnamed_addr #0 {
  %3 = bitcast i8* %1 to %struct.halide_buffer_t*
  %4 = tail call i32 @halide_device_and_host_free(i8* %0, %struct.halide_buffer_t* %3) #13
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_device_host_nop_free(i8*, i8*) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: norecurse nounwind
define weak i32 @halide_default_buffer_copy(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*) local_unnamed_addr #2 {
  ret i32 -39
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy_already_locked(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %5 = alloca %"struct.Halide::Runtime::Internal::device_copy", align 8
  %6 = icmp ne %struct.halide_device_interface_t* %2, null
  br i1 %6, label %7, label %21

; <label>:7:                                      ; preds = %4
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 1
  %9 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %8, align 8, !tbaa !179
  %10 = icmp eq %struct.halide_device_interface_t* %9, null
  %11 = icmp eq %struct.halide_device_interface_t* %9, %2
  %12 = or i1 %10, %11
  br i1 %12, label %14, label %13

; <label>:13:                                     ; preds = %7
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.42, i64 0, i64 0)) #12
  br label %130

; <label>:14:                                     ; preds = %7
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  %16 = load i64, i64* %15, align 8, !tbaa !178
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %14
  %19 = tail call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #13
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %130

; <label>:21:                                     ; preds = %18, %14, %4
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %23 = load i64, i64* %22, align 8, !tbaa !178
  %24 = icmp eq i64 %23, 0
  %25 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 2
  %26 = load i8*, i8** %25, align 8, !tbaa !151
  br i1 %24, label %37, label %27

; <label>:27:                                     ; preds = %21
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %27
  %30 = icmp eq %struct.halide_device_interface_t* %2, null
  br label %50

; <label>:31:                                     ; preds = %27
  %32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %33 = load i64, i64* %32, align 8, !tbaa !180
  %34 = and i64 %33, 1
  %35 = icmp ne i64 %34, 0
  %36 = icmp eq %struct.halide_device_interface_t* %2, null
  br label %40

; <label>:37:                                     ; preds = %21
  %38 = icmp eq %struct.halide_device_interface_t* %2, null
  %39 = icmp eq i8* %26, null
  br i1 %39, label %50, label %._crit_edge

._crit_edge:                                      ; preds = %37
  %.phi.trans.insert = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 3
  %.pre = load i64, i64* %.phi.trans.insert, align 8, !tbaa !180
  br label %40

; <label>:40:                                     ; preds = %._crit_edge, %31
  %41 = phi i64 [ %33, %31 ], [ %.pre, %._crit_edge ]
  %42 = phi i1 [ %36, %31 ], [ %38, %._crit_edge ]
  %43 = phi i1 [ %35, %31 ], [ true, %._crit_edge ]
  %44 = and i64 %41, 2
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %50, label %46

; <label>:46:                                     ; preds = %40
  %47 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %48 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %47, align 8, !tbaa !179
  %49 = icmp ne %struct.halide_device_interface_t* %48, null
  br label %50

; <label>:50:                                     ; preds = %46, %40, %37, %29
  %51 = phi i1 [ false, %37 ], [ true, %40 ], [ true, %46 ], [ false, %29 ]
  %52 = phi i1 [ %38, %37 ], [ %42, %40 ], [ %42, %46 ], [ %30, %29 ]
  %53 = phi i1 [ true, %37 ], [ %43, %40 ], [ %43, %46 ], [ false, %29 ]
  %54 = phi i1 [ true, %37 ], [ false, %40 ], [ %49, %46 ], [ true, %29 ]
  %55 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %56 = load i8*, i8** %55, align 8, !tbaa !151
  %57 = icmp ne i8* %56, null
  %58 = xor i1 %52, true
  %59 = or i1 %57, %58
  br i1 %59, label %60, label %130

; <label>:60:                                     ; preds = %50
  %61 = xor i1 %6, true
  %62 = or i1 %53, %61
  br i1 %62, label %70, label %63

; <label>:63:                                     ; preds = %60
  %64 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %65 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %64, align 8, !tbaa !181
  %66 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %65, i64 0, i32 10
  %67 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %66, align 8, !tbaa !196
  %68 = tail call i32 %67(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #12
  %69 = icmp eq i32 %68, -42
  br i1 %69, label %70, label %117

; <label>:70:                                     ; preds = %63, %60
  %71 = or i1 %51, %57
  br i1 %71, label %72, label %130

; <label>:72:                                     ; preds = %70
  %73 = or i1 %54, %58
  br i1 %73, label %76, label %74

; <label>:74:                                     ; preds = %72
  %75 = bitcast %"struct.Halide::Runtime::Internal::device_copy"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 416, i8* nonnull %75) #10
  call void @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b(%"struct.Halide::Runtime::Internal::device_copy"* nonnull sret %5, %struct.halide_buffer_t* nonnull %1, i1 zeroext true, %struct.halide_buffer_t* nonnull %3, i1 zeroext true) #13
  call void @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv(%"struct.Halide::Runtime::Internal::device_copy"* nonnull dereferenceable(416) %5, i8* %0) #13
  call void @llvm.lifetime.end.p0i8(i64 416, i8* nonnull %75) #10
  br label %120

; <label>:76:                                     ; preds = %72
  br i1 %52, label %77, label %91

; <label>:77:                                     ; preds = %76
  %78 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %79 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %78, align 8, !tbaa !179
  %80 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %79, i64 0, i32 15
  %81 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %80, align 8, !tbaa !181
  %82 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %81, i64 0, i32 10
  %83 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %82, align 8, !tbaa !196
  %84 = tail call i32 %83(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #12
  %85 = icmp eq i32 %84, -42
  br i1 %85, label %86, label %117

; <label>:86:                                     ; preds = %77
  %87 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %130

; <label>:89:                                     ; preds = %86
  %90 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #13
  br label %117

; <label>:91:                                     ; preds = %76
  %92 = xor i1 %57, true
  %93 = or i1 %53, %92
  br i1 %93, label %108, label %94

; <label>:94:                                     ; preds = %91
  %95 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %96 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %95, align 8, !tbaa !179
  %97 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %96, i64 0, i32 15
  %98 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %97, align 8, !tbaa !181
  %99 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %98, i64 0, i32 10
  %100 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %99, align 8, !tbaa !196
  %101 = tail call i32 %100(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* null, %struct.halide_buffer_t* nonnull %3) #12
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %130

; <label>:103:                                    ; preds = %94
  %104 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 3
  %105 = load i64, i64* %104, align 8, !tbaa !180
  %106 = or i64 %105, 1
  store i64 %106, i64* %104, align 8, !tbaa !180
  %107 = tail call i32 @copy_to_device_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %3, %struct.halide_device_interface_t* nonnull %2) #13
  br label %117

; <label>:108:                                    ; preds = %91
  %109 = tail call i32 @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t(i8* %0, %struct.halide_buffer_t* nonnull %1) #13
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %130

; <label>:111:                                    ; preds = %108
  %112 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %113 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %112, align 8, !tbaa !181
  %114 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %113, i64 0, i32 10
  %115 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*)** %114, align 8, !tbaa !196
  %116 = tail call i32 %115(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* nonnull %2, %struct.halide_buffer_t* nonnull %3) #12
  br label %117

; <label>:117:                                    ; preds = %111, %103, %89, %77, %63
  %118 = phi i32 [ %90, %89 ], [ %84, %77 ], [ %107, %103 ], [ %116, %111 ], [ %68, %63 ]
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %130

; <label>:120:                                    ; preds = %117, %74
  %121 = icmp eq %struct.halide_buffer_t* %3, %1
  br i1 %121, label %130, label %122

; <label>:122:                                    ; preds = %120
  %123 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 3
  %124 = load i64, i64* %123, align 8, !tbaa !180
  %125 = and i64 %124, -4
  br i1 %6, label %126, label %128

; <label>:126:                                    ; preds = %122
  %127 = or i64 %125, 2
  store i64 %127, i64* %123, align 8, !tbaa !180
  br label %130

; <label>:128:                                    ; preds = %122
  %129 = or i64 %125, 1
  store i64 %129, i64* %123, align 8, !tbaa !180
  br label %130

; <label>:130:                                    ; preds = %128, %126, %120, %117, %108, %94, %86, %70, %50, %18, %13
  %131 = phi i32 [ -42, %13 ], [ %19, %18 ], [ -34, %50 ], [ 0, %120 ], [ 0, %126 ], [ 0, %128 ], [ -42, %70 ], [ %118, %117 ], [ %109, %108 ], [ %101, %94 ], [ %87, %86 ]
  ret i32 %131
}

; Function Attrs: nounwind
define weak i32 @halide_buffer_copy(i8*, %struct.halide_buffer_t*, %struct.halide_device_interface_t*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %5 = icmp ne %struct.halide_device_interface_t* %2, null
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %4
  %7 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %8 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %7, align 8, !tbaa !181
  %9 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %8, i64 0, i32 0
  %10 = load void ()*, void ()** %9, align 8, !tbaa !187
  tail call void %10() #12
  br label %11

; <label>:11:                                     ; preds = %6, %4
  %12 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %13 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %12, align 8, !tbaa !179
  %14 = icmp eq %struct.halide_device_interface_t* %13, null
  br i1 %14, label %20, label %15

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %13, i64 0, i32 15
  %17 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %16, align 8, !tbaa !181
  %18 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %17, i64 0, i32 0
  %19 = load void ()*, void ()** %18, align 8, !tbaa !187
  tail call void %19() #12
  br label %20

; <label>:20:                                     ; preds = %15, %11
  %21 = tail call i32 @halide_buffer_copy_already_locked(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_device_interface_t* %2, %struct.halide_buffer_t* %3) #13
  br i1 %5, label %22, label %27

; <label>:22:                                     ; preds = %20
  %23 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %2, i64 0, i32 15
  %24 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %23, align 8, !tbaa !181
  %25 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %24, i64 0, i32 1
  %26 = load void ()*, void ()** %25, align 8, !tbaa !189
  tail call void %26() #12
  br label %27

; <label>:27:                                     ; preds = %22, %20
  %28 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %12, align 8, !tbaa !179
  %29 = icmp eq %struct.halide_device_interface_t* %28, null
  br i1 %29, label %35, label %30

; <label>:30:                                     ; preds = %27
  %31 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %28, i64 0, i32 15
  %32 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %31, align 8, !tbaa !181
  %33 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %32, i64 0, i32 1
  %34 = load void ()*, void ()** %33, align 8, !tbaa !189
  tail call void %34() #12
  br label %35

; <label>:35:                                     ; preds = %30, %27
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %21
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_crop(i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #12
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_slice(i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.59, i64 0, i64 0)) #12
  ret i32 -40
}

; Function Attrs: nounwind
define weak i32 @halide_device_crop(i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %4 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !178
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %32, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !178
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %7
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #12
  br label %32

; <label>:12:                                     ; preds = %7
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %14 = load i32, i32* %13, align 4, !tbaa !134
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !134
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %19, label %18

; <label>:18:                                     ; preds = %12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.61, i64 0, i64 0)) #12
  br label %32

; <label>:19:                                     ; preds = %12
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %21 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !179
  %22 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %21, i64 0, i32 15
  %23 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %22, align 8, !tbaa !181
  %24 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %23, i64 0, i32 0
  %25 = load void ()*, void ()** %24, align 8, !tbaa !187
  tail call void %25() #12
  %26 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %20, align 8, !tbaa !179
  %27 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %26, i64 0, i32 15
  %28 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %27, align 8, !tbaa !181
  %29 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %28, i64 0, i32 11
  %30 = load i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, %struct.halide_buffer_t*)** %29, align 8, !tbaa !197
  %31 = tail call i32 %30(i8* %0, %struct.halide_buffer_t* nonnull %1, %struct.halide_buffer_t* nonnull %2) #12
  br label %32

; <label>:32:                                     ; preds = %19, %18, %11, %3
  %33 = phi i32 [ -41, %11 ], [ -41, %18 ], [ %31, %19 ], [ 0, %3 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %33
}

; Function Attrs: nounwind
define weak i32 @halide_device_slice(i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %6 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !178
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %35, label %9

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !178
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %14, label %13

; <label>:13:                                     ; preds = %9
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0)) #12
  br label %35

; <label>:14:                                     ; preds = %9
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 5
  %16 = load i32, i32* %15, align 4, !tbaa !134
  %17 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 5
  %18 = load i32, i32* %17, align 4, !tbaa !134
  %19 = add nsw i32 %18, 1
  %20 = icmp eq i32 %16, %19
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %14
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.64, i64 0, i64 0)) #12
  br label %35

; <label>:22:                                     ; preds = %14
  %23 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %24 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !179
  %25 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %24, i64 0, i32 15
  %26 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %25, align 8, !tbaa !181
  %27 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %26, i64 0, i32 0
  %28 = load void ()*, void ()** %27, align 8, !tbaa !187
  tail call void %28() #12
  %29 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %23, align 8, !tbaa !179
  %30 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %29, i64 0, i32 15
  %31 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %30, align 8, !tbaa !181
  %32 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %31, i64 0, i32 12
  %33 = load i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*, i32, i32, %struct.halide_buffer_t*)** %32, align 8, !tbaa !198
  %34 = tail call i32 %33(i8* %0, %struct.halide_buffer_t* nonnull %1, i32 %2, i32 %3, %struct.halide_buffer_t* nonnull %4) #12
  br label %35

; <label>:35:                                     ; preds = %22, %21, %13, %5
  %36 = phi i32 [ -41, %13 ], [ -41, %21 ], [ %34, %22 ], [ 0, %5 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  ret i32 %36
}

; Function Attrs: nounwind
define weak i32 @halide_default_device_release_crop(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !178
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %2
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.58, i64 0, i64 0)) #12
  br label %7

; <label>:7:                                      ; preds = %6, %2
  %8 = phi i32 [ -40, %6 ], [ 0, %2 ]
  ret i32 %8
}

; Function Attrs: nounwind
define weak i32 @halide_device_release_crop(i8*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !178
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %17, label %6

; <label>:6:                                      ; preds = %2
  tail call void @halide_mutex_lock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %1, i64 0, i32 1
  %8 = load %struct.halide_device_interface_t*, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  %9 = getelementptr inbounds %struct.halide_device_interface_t, %struct.halide_device_interface_t* %8, i64 0, i32 15
  %10 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !181
  %11 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %10, i64 0, i32 13
  %12 = load i32 (i8*, %struct.halide_buffer_t*)*, i32 (i8*, %struct.halide_buffer_t*)** %11, align 8, !tbaa !199
  %13 = tail call i32 %12(i8* %0, %struct.halide_buffer_t* nonnull %1) #12
  store i64 0, i64* %3, align 8, !tbaa !178
  %14 = load %struct.halide_device_interface_impl_t*, %struct.halide_device_interface_impl_t** %9, align 8, !tbaa !181
  %15 = getelementptr inbounds %struct.halide_device_interface_impl_t, %struct.halide_device_interface_impl_t* %14, i64 0, i32 1
  %16 = load void ()*, void ()** %15, align 8, !tbaa !189
  tail call void %16() #12
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %7, align 8, !tbaa !179
  tail call void @halide_mutex_unlock(%struct.halide_mutex* nonnull @_ZN6Halide7Runtime8Internal17device_copy_mutexE) #12
  br label %17

; <label>:17:                                     ; preds = %6, %2
  %18 = phi i32 [ %13, %6 ], [ 0, %2 ]
  ret i32 %18
}

; Function Attrs: nounwind
define weak float @halide_float16_bits_to_float(i16 zeroext) local_unnamed_addr #0 {
  %2 = zext i16 %0 to i32
  %3 = shl nuw i32 %2, 16
  %4 = and i32 %3, -2147483648
  %5 = and i32 %2, 1023
  %6 = lshr i32 %2, 10
  %7 = and i32 %6, 31
  %8 = icmp eq i32 %7, 0
  %9 = icmp ne i32 %5, 0
  %10 = and i1 %9, %8
  br i1 %10, label %11, label %21

; <label>:11:                                     ; preds = %1
  %12 = tail call i32 @llvm.ctlz.i32(i32 %5, i1 true), !range !200
  %13 = xor i32 %12, 31
  %14 = shl i32 1, %13
  %15 = xor i32 %14, -1
  %16 = and i32 %5, %15
  %17 = sub nsw i32 23, %13
  %18 = shl i32 %16, %17
  %19 = shl nuw nsw i32 %13, 23
  %20 = add nuw nsw i32 %19, 864026624
  br label %28

; <label>:21:                                     ; preds = %1
  %22 = shl nuw nsw i32 %5, 13
  br i1 %8, label %28, label %23

; <label>:23:                                     ; preds = %21
  %24 = icmp eq i32 %7, 31
  br i1 %24, label %28, label %25

; <label>:25:                                     ; preds = %23
  %26 = shl nuw nsw i32 %7, 23
  %27 = add nuw nsw i32 %26, 939524096
  br label %28

; <label>:28:                                     ; preds = %25, %23, %21, %11
  %29 = phi i32 [ %20, %11 ], [ %22, %23 ], [ %22, %21 ], [ %22, %25 ]
  %30 = phi i32 [ %18, %11 ], [ 2139095040, %23 ], [ 0, %21 ], [ %27, %25 ]
  %31 = or i32 %29, %4
  %32 = or i32 %31, %30
  %33 = bitcast i32 %32 to float
  ret float %33
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.ctlz.i32(i32, i1) #7

; Function Attrs: nounwind
define weak double @halide_float16_bits_to_double(i16 zeroext) local_unnamed_addr #0 {
  %2 = tail call float @halide_float16_bits_to_float(i16 zeroext %0) #13
  %3 = fpext float %2 to double
  ret double %3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bounds_inference_call_failed(i8*, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #12
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([41 x i8], [41 x i8]* @.str.112, i64 0, i64 0)) #12
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #12
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #12
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %25

.predBB2.split2:                                  ; preds = %17
  %22 = ptrtoint i8* %21 to i64
  %23 = sub i64 1, %5
  %24 = add i64 %23, %22
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %24) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  tail call void @halide_free(i8* %0, i8* nonnull %4) #12
  br label %25

; <label>:25:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_extern_stage_failed(i8*, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #12
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2.114, i64 0, i64 0)) #12
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1.113, i64 0, i64 0)) #12
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #12
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %25

.predBB2.split2:                                  ; preds = %17
  %22 = ptrtoint i8* %21 to i64
  %23 = sub i64 1, %5
  %24 = add i64 %23, %22
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %24) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  tail call void @halide_free(i8* %0, i8* nonnull %4) #12
  br label %25

; <label>:25:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 %2
}

; Function Attrs: nounwind
define weak i32 @halide_error_explicit_bounds_too_small(i8*, i8*, i8*, i32, i32, i32, i32) local_unnamed_addr #0 {
  %8 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %9 = ptrtoint i8* %8 to i64
  %10 = icmp eq i8* %8, null
  br i1 %10, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %7
  %11 = getelementptr inbounds i8, i8* %8, i64 1023
  store i8 0, i8* %11, align 1, !tbaa !11
  %12 = tail call i8* @halide_string_to_string(i8* nonnull %8, i8* nonnull %11, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #12
  br label %14

.predBB1.split:                                   ; preds = %7
  %13 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3.115, i64 0, i64 0)) #12
  br label %14

; <label>:14:                                     ; preds = %.predBB1.split, %.predBB2.split
  %15 = phi i8* [ null, %.predBB1.split ], [ %11, %.predBB2.split ]
  %phi.call = phi i8* [ %13, %.predBB1.split ], [ %12, %.predBB2.split ]
  %16 = icmp eq i8* %2, null
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %21

; <label>:19:                                     ; preds = %14
  %20 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %15, i8* nonnull %2) #12
  br label %21

; <label>:21:                                     ; preds = %19, %17
  %22 = phi i8* [ %20, %19 ], [ %18, %17 ]
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %15, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4.116, i64 0, i64 0)) #12
  %24 = icmp eq i8* %1, null
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %21
  %26 = tail call i8* @halide_string_to_string(i8* %23, i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %29

; <label>:27:                                     ; preds = %21
  %28 = tail call i8* @halide_string_to_string(i8* %23, i8* %15, i8* nonnull %1) #12
  br label %29

; <label>:29:                                     ; preds = %27, %25
  %30 = phi i8* [ %28, %27 ], [ %26, %25 ]
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %15, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5.117, i64 0, i64 0)) #12
  %32 = sext i32 %3 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %15, i64 %32, i32 1) #12
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %15, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %35 = sext i32 %4 to i64
  %36 = tail call i8* @halide_int64_to_string(i8* %34, i8* %15, i64 %35, i32 1) #12
  %37 = tail call i8* @halide_string_to_string(i8* %36, i8* %15, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7.119, i64 0, i64 0)) #12
  %38 = sext i32 %5 to i64
  %39 = tail call i8* @halide_int64_to_string(i8* %37, i8* %15, i64 %38, i32 1) #12
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %15, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %41 = sext i32 %6 to i64
  %42 = tail call i8* @halide_int64_to_string(i8* %40, i8* %15, i64 %41, i32 1) #12
  %43 = tail call i8* @halide_string_to_string(i8* %42, i8* %15, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #12
  br i1 %10, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %29
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %47

.predBB2.split2:                                  ; preds = %29
  %44 = ptrtoint i8* %43 to i64
  %45 = sub i64 1, %9
  %46 = add i64 %45, %44
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %8, i64 %46) #12
  tail call void @halide_error(i8* %0, i8* nonnull %8) #12
  tail call void @halide_free(i8* %0, i8* nonnull %8) #12
  br label %47

; <label>:47:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -2
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_type(i8*, i8*, i32, i32) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.halide_type_t, align 2
  %8 = alloca %struct.halide_type_t, align 2
  store i32 %2, i32* %5, align 4, !tbaa !99
  store i32 %3, i32* %6, align 4, !tbaa !99
  %9 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #10
  store i8 0, i8* %9, align 2, !tbaa !176
  %10 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 1
  store i8 0, i8* %10, align 1, !tbaa !108
  %11 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %7, i64 0, i32 2
  store i16 0, i16* %11, align 2, !tbaa !177
  %12 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #10
  store i8 0, i8* %12, align 2, !tbaa !176
  %13 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 1
  store i8 0, i8* %13, align 1, !tbaa !108
  %14 = getelementptr inbounds %struct.halide_type_t, %struct.halide_type_t* %8, i64 0, i32 2
  store i16 0, i16* %14, align 2, !tbaa !177
  %15 = bitcast i32* %6 to i8*
  %16 = call i8* @memcpy(i8* nonnull %9, i8* nonnull %15, i64 4) #12
  %17 = bitcast i32* %5 to i8*
  %18 = call i8* @memcpy(i8* nonnull %12, i8* nonnull %17, i64 4) #12
  %19 = call i8* @halide_malloc(i8* %0, i64 1024) #12
  %20 = ptrtoint i8* %19 to i64
  %21 = icmp eq i8* %19, null
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %4
  %23 = getelementptr inbounds i8, i8* %19, i64 1023
  store i8 0, i8* %23, align 1, !tbaa !11
  br label %24

; <label>:24:                                     ; preds = %22, %4
  %25 = phi i8* [ %23, %22 ], [ null, %4 ]
  %26 = icmp eq i8* %1, null
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %24
  %28 = call i8* @halide_string_to_string(i8* %19, i8* %25, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %31

; <label>:29:                                     ; preds = %24
  %30 = call i8* @halide_string_to_string(i8* %19, i8* %25, i8* nonnull %1) #12
  br label %31

; <label>:31:                                     ; preds = %29, %27
  %32 = phi i8* [ %30, %29 ], [ %28, %27 ]
  %33 = call i8* @halide_string_to_string(i8* %32, i8* %25, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9.121, i64 0, i64 0)) #12
  %34 = call i8* @halide_type_to_string(i8* %33, i8* %25, %struct.halide_type_t* nonnull %7) #12
  %35 = call i8* @halide_string_to_string(i8* %34, i8* %25, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.122, i64 0, i64 0)) #12
  %36 = call i8* @halide_type_to_string(i8* %35, i8* %25, %struct.halide_type_t* nonnull %8) #12
  br i1 %21, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %31
  call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  call void @halide_free(i8* %0, i8* null) #12
  br label %40

.predBB2.split:                                   ; preds = %31
  %37 = ptrtoint i8* %36 to i64
  %38 = sub i64 1, %20
  %39 = add i64 %38, %37
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %19, i64 %39) #12
  call void @halide_error(i8* %0, i8* nonnull %19) #12
  call void @halide_free(i8* %0, i8* nonnull %19) #12
  br label %40

; <label>:40:                                     ; preds = %.predBB2.split, %.predBB1.split
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #10
  ret i32 -3
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_dimensions(i8*, i8*, i32, i32) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %9, align 1, !tbaa !11
  br label %10

; <label>:10:                                     ; preds = %8, %4
  %11 = phi i8* [ %9, %8 ], [ null, %4 ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %5, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %5, i8* %11, i8* nonnull %1) #12
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11.123, i64 0, i64 0)) #12
  %20 = sext i32 %3 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %11, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12.124, i64 0, i64 0)) #12
  %23 = sext i32 %2 to i64
  %24 = tail call i8* @halide_int64_to_string(i8* %22, i8* %11, i64 %23, i32 1) #12
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %11, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13.125, i64 0, i64 0)) #12
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %29

.predBB2.split:                                   ; preds = %17
  %26 = ptrtoint i8* %25 to i64
  %27 = sub i64 1, %6
  %28 = add i64 %27, %26
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %28) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %29

; <label>:29:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -43
}

; Function Attrs: nounwind
define weak i32 @halide_error_access_out_of_bounds(i8*, i8*, i32, i32, i32, i32, i32) local_unnamed_addr #0 {
  %8 = icmp slt i32 %3, %5
  br i1 %8, label %9, label %36

; <label>:9:                                      ; preds = %7
  %10 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %11 = ptrtoint i8* %10 to i64
  %12 = icmp eq i8* %10, null
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds i8, i8* %10, i64 1023
  store i8 0, i8* %14, align 1, !tbaa !11
  br label %15

; <label>:15:                                     ; preds = %13, %9
  %16 = phi i8* [ %14, %13 ], [ null, %9 ]
  %17 = icmp eq i8* %1, null
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %15
  %19 = tail call i8* @halide_string_to_string(i8* %10, i8* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %22

; <label>:20:                                     ; preds = %15
  %21 = tail call i8* @halide_string_to_string(i8* %10, i8* %16, i8* nonnull %1) #12
  br label %22

; <label>:22:                                     ; preds = %20, %18
  %23 = phi i8* [ %21, %20 ], [ %19, %18 ]
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %16, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #12
  %25 = sext i32 %3 to i64
  %26 = tail call i8* @halide_int64_to_string(i8* %24, i8* %16, i64 %25, i32 1) #12
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %16, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.127, i64 0, i64 0)) #12
  %28 = sext i32 %5 to i64
  %29 = tail call i8* @halide_int64_to_string(i8* %27, i8* %16, i64 %28, i32 1) #12
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %16, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #12
  %31 = sext i32 %2 to i64
  %32 = tail call i8* @halide_int64_to_string(i8* %30, i8* %16, i64 %31, i32 1) #12
  br i1 %12, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %22
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %65

.predBB2.split:                                   ; preds = %22
  %33 = ptrtoint i8* %32 to i64
  %34 = sub i64 1, %11
  %35 = add i64 %34, %33
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %10, i64 %35) #12
  tail call void @halide_error(i8* %0, i8* nonnull %10) #12
  tail call void @halide_free(i8* %0, i8* nonnull %10) #12
  br label %65

; <label>:36:                                     ; preds = %7
  %37 = icmp sgt i32 %4, %6
  br i1 %37, label %38, label %65

; <label>:38:                                     ; preds = %36
  %39 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %40 = ptrtoint i8* %39 to i64
  %41 = icmp eq i8* %39, null
  br i1 %41, label %44, label %42

; <label>:42:                                     ; preds = %38
  %43 = getelementptr inbounds i8, i8* %39, i64 1023
  store i8 0, i8* %43, align 1, !tbaa !11
  br label %44

; <label>:44:                                     ; preds = %42, %38
  %45 = phi i8* [ %43, %42 ], [ null, %38 ]
  %46 = icmp eq i8* %1, null
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %44
  %48 = tail call i8* @halide_string_to_string(i8* %39, i8* %45, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %51

; <label>:49:                                     ; preds = %44
  %50 = tail call i8* @halide_string_to_string(i8* %39, i8* %45, i8* nonnull %1) #12
  br label %51

; <label>:51:                                     ; preds = %49, %47
  %52 = phi i8* [ %50, %49 ], [ %48, %47 ]
  %53 = tail call i8* @halide_string_to_string(i8* %52, i8* %45, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14.126, i64 0, i64 0)) #12
  %54 = sext i32 %4 to i64
  %55 = tail call i8* @halide_int64_to_string(i8* %53, i8* %45, i64 %54, i32 1) #12
  %56 = tail call i8* @halide_string_to_string(i8* %55, i8* %45, i8* nonnull getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17.129, i64 0, i64 0)) #12
  %57 = sext i32 %6 to i64
  %58 = tail call i8* @halide_int64_to_string(i8* %56, i8* %45, i64 %57, i32 1) #12
  %59 = tail call i8* @halide_string_to_string(i8* %58, i8* %45, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16.128, i64 0, i64 0)) #12
  %60 = sext i32 %2 to i64
  %61 = tail call i8* @halide_int64_to_string(i8* %59, i8* %45, i64 %60, i32 1) #12
  br i1 %41, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %51
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %65

.predBB2.split2:                                  ; preds = %51
  %62 = ptrtoint i8* %61 to i64
  %63 = sub i64 1, %40
  %64 = add i64 %63, %62
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %39, i64 %64) #12
  tail call void @halide_error(i8* %0, i8* nonnull %39) #12
  tail call void @halide_free(i8* %0, i8* nonnull %39) #12
  br label %65

; <label>:65:                                     ; preds = %.predBB2.split2, %.predBB1.split1, %36, %.predBB2.split, %.predBB1.split
  ret i32 -4
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_allocation_too_large(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.18.130, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_uint64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_uint64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -5
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_negative(i8*, i8*, i32, i32) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.21.133, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.22.134, i64 0, i64 0)) #12
  %21 = sext i32 %2 to i64
  %22 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %21, i32 1) #12
  %23 = tail call i8* @halide_string_to_string(i8* %22, i8* %12, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23.135, i64 0, i64 0)) #12
  %24 = sext i32 %3 to i64
  %25 = tail call i8* @halide_int64_to_string(i8* %23, i8* %12, i64 %24, i32 1) #12
  %26 = tail call i8* @halide_string_to_string(i8* %25, i8* %12, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %30

.predBB2.split2:                                  ; preds = %18
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %6
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %29) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -28
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_extents_too_large(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.24.136, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20.132, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_int64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -6
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraints_make_required_region_smaller(i8*, i8*, i32, i32, i32, i32, i32) local_unnamed_addr #0 {
  %8 = add i32 %5, -1
  %9 = add i32 %8, %6
  %10 = add i32 %3, -1
  %11 = add i32 %10, %4
  %12 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %13 = ptrtoint i8* %12 to i64
  %14 = icmp eq i8* %12, null
  br i1 %14, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %7
  %15 = getelementptr inbounds i8, i8* %12, i64 1023
  store i8 0, i8* %15, align 1, !tbaa !11
  %16 = tail call i8* @halide_string_to_string(i8* nonnull %12, i8* nonnull %15, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #12
  br label %18

.predBB1.split:                                   ; preds = %7
  %17 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @.str.25.137, i64 0, i64 0)) #12
  br label %18

; <label>:18:                                     ; preds = %.predBB1.split, %.predBB2.split
  %19 = phi i8* [ null, %.predBB1.split ], [ %15, %.predBB2.split ]
  %phi.call = phi i8* [ %17, %.predBB1.split ], [ %16, %.predBB2.split ]
  %20 = icmp eq i8* %1, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %19, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %25

; <label>:23:                                     ; preds = %18
  %24 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %19, i8* nonnull %1) #12
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  %27 = tail call i8* @halide_string_to_string(i8* %26, i8* %19, i8* nonnull getelementptr inbounds ([54 x i8], [54 x i8]* @.str.26.138, i64 0, i64 0)) #12
  %28 = sext i32 %2 to i64
  %29 = tail call i8* @halide_int64_to_string(i8* %27, i8* %19, i64 %28, i32 1) #12
  %30 = tail call i8* @halide_string_to_string(i8* %29, i8* %19, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #12
  %31 = tail call i8* @halide_string_to_string(i8* %30, i8* %19, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.28.140, i64 0, i64 0)) #12
  %32 = sext i32 %5 to i64
  %33 = tail call i8* @halide_int64_to_string(i8* %31, i8* %19, i64 %32, i32 1) #12
  %34 = tail call i8* @halide_string_to_string(i8* %33, i8* %19, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %35 = sext i32 %9 to i64
  %36 = tail call i8* @halide_int64_to_string(i8* %34, i8* %19, i64 %35, i32 1) #12
  %37 = tail call i8* @halide_string_to_string(i8* %36, i8* %19, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27.139, i64 0, i64 0)) #12
  %38 = tail call i8* @halide_string_to_string(i8* %37, i8* %19, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29.141, i64 0, i64 0)) #12
  %39 = sext i32 %3 to i64
  %40 = tail call i8* @halide_int64_to_string(i8* %38, i8* %19, i64 %39, i32 1) #12
  %41 = tail call i8* @halide_string_to_string(i8* %40, i8* %19, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6.118, i64 0, i64 0)) #12
  %42 = sext i32 %11 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %41, i8* %19, i64 %42, i32 1) #12
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %19, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  br i1 %14, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %48

.predBB2.split2:                                  ; preds = %25
  %45 = ptrtoint i8* %44 to i64
  %46 = sub i64 1, %13
  %47 = add i64 %46, %45
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %12, i64 %47) #12
  tail call void @halide_error(i8* %0, i8* nonnull %12) #12
  tail call void @halide_free(i8* %0, i8* nonnull %12) #12
  br label %48

; <label>:48:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -7
}

; Function Attrs: nounwind
define weak i32 @halide_error_constraint_violated(i8*, i8*, i32, i8*, i32) local_unnamed_addr #0 {
  %6 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %7 = ptrtoint i8* %6 to i64
  %8 = icmp eq i8* %6, null
  br i1 %8, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %5
  %9 = getelementptr inbounds i8, i8* %6, i64 1023
  store i8 0, i8* %9, align 1, !tbaa !11
  %10 = tail call i8* @halide_string_to_string(i8* nonnull %6, i8* nonnull %9, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #12
  br label %12

.predBB1.split:                                   ; preds = %5
  %11 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31.143, i64 0, i64 0)) #12
  br label %12

; <label>:12:                                     ; preds = %.predBB1.split, %.predBB2.split
  %13 = phi i8* [ null, %.predBB1.split ], [ %9, %.predBB2.split ]
  %phi.call = phi i8* [ %11, %.predBB1.split ], [ %10, %.predBB2.split ]
  %14 = icmp eq i8* %1, null
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %19

; <label>:17:                                     ; preds = %12
  %18 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %13, i8* nonnull %1) #12
  br label %19

; <label>:19:                                     ; preds = %17, %15
  %20 = phi i8* [ %18, %17 ], [ %16, %15 ]
  %21 = tail call i8* @halide_string_to_string(i8* %20, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #12
  %22 = sext i32 %2 to i64
  %23 = tail call i8* @halide_int64_to_string(i8* %21, i8* %13, i64 %22, i32 1) #12
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %13, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33.145, i64 0, i64 0)) #12
  %25 = icmp eq i8* %3, null
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %19
  %27 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %30

; <label>:28:                                     ; preds = %19
  %29 = tail call i8* @halide_string_to_string(i8* %24, i8* %13, i8* nonnull %3) #12
  br label %30

; <label>:30:                                     ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = tail call i8* @halide_string_to_string(i8* %31, i8* %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #12
  %33 = sext i32 %4 to i64
  %34 = tail call i8* @halide_int64_to_string(i8* %32, i8* %13, i64 %33, i32 1) #12
  %35 = tail call i8* @halide_string_to_string(i8* %34, i8* %13, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #12
  br i1 %8, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %30
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %39

.predBB2.split2:                                  ; preds = %30
  %36 = ptrtoint i8* %35 to i64
  %37 = sub i64 1, %7
  %38 = add i64 %37, %36
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %6, i64 %38) #12
  tail call void @halide_error(i8* %0, i8* nonnull %6) #12
  tail call void @halide_free(i8* %0, i8* nonnull %6) #12
  br label %39

; <label>:39:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -8
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_i64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_int64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_u64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_uint64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_uint64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_small_f64(i8*, i8*, double, double) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_double_to_string(i8* %20, i8* %12, double %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.35.147, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_double_to_string(i8* %22, i8* %12, double %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -9
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_i64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_int64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_int64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_u64(i8*, i8*, i64, i64) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_uint64_to_string(i8* %20, i8* %12, i64 %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_uint64_to_string(i8* %22, i8* %12, i64 %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_param_too_large_f64(i8*, i8*, double, double) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34.146, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19.131, i64 0, i64 0)) #12
  %21 = tail call i8* @halide_double_to_string(i8* %20, i8* %12, double %2, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %12, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.36.148, i64 0, i64 0)) #12
  %23 = tail call i8* @halide_double_to_string(i8* %22, i8* %12, double %3, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %18
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %27

.predBB2.split2:                                  ; preds = %18
  %24 = ptrtoint i8* %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %24
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %26) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %27

; <label>:27:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -10
}

; Function Attrs: nounwind
define weak i32 @halide_error_out_of_memory(i8*) local_unnamed_addr #0 {
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.37, i64 0, i64 0)) #12
  ret i32 -11
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_argument_is_null(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #12
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0)) #12
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.39, i64 0, i64 0)) #12
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %22

.predBB2.split2:                                  ; preds = %16
  %19 = ptrtoint i8* %18 to i64
  %20 = sub i64 1, %4
  %21 = add i64 %20, %19
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %21) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  tail call void @halide_free(i8* %0, i8* nonnull %3) #12
  br label %22

; <label>:22:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -12
}

; Function Attrs: nounwind
define weak i32 @halide_error_debug_to_file_failed(i8*, i8*, i8*, i32) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %1, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %1) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i64 0, i64 0)) #12
  %21 = icmp eq i8* %2, null
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %23 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %26

; <label>:24:                                     ; preds = %18
  %25 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* nonnull %2) #12
  br label %26

; <label>:26:                                     ; preds = %24, %22
  %27 = phi i8* [ %25, %24 ], [ %23, %22 ]
  %28 = tail call i8* @halide_string_to_string(i8* %27, i8* %12, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42.149, i64 0, i64 0)) #12
  %29 = sext i32 %3 to i64
  %30 = tail call i8* @halide_int64_to_string(i8* %28, i8* %12, i64 %29, i32 1) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %26
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %34

.predBB2.split2:                                  ; preds = %26
  %31 = ptrtoint i8* %30 to i64
  %32 = sub i64 1, %6
  %33 = add i64 %32, %31
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %33) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %34

; <label>:34:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -13
}

; Function Attrs: nounwind
define weak i32 @halide_error_failed_to_upgrade_buffer_t(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([51 x i8], [51 x i8]* @.str.43, i64 0, i64 0)) #12
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([51 x i8], [51 x i8]* @.str.43, i64 0, i64 0)) #12
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.187, i64 0, i64 0)) #12
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %25

; <label>:23:                                     ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #12
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %30

.predBB2.split2:                                  ; preds = %25
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %5
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %29) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  tail call void @halide_free(i8* %0, i8* nonnull %4) #12
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -29
}

; Function Attrs: nounwind
define weak i32 @halide_error_failed_to_downgrade_buffer_t(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.45, i64 0, i64 0)) #12
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.45, i64 0, i64 0)) #12
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.187, i64 0, i64 0)) #12
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %25

; <label>:23:                                     ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #12
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %30

.predBB2.split2:                                  ; preds = %25
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %5
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %29) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  tail call void @halide_free(i8* %0, i8* nonnull %4) #12
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -30
}

; Function Attrs: nounwind
define weak i32 @halide_error_unaligned_host_ptr(i8*, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #12
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #12
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.47, i64 0, i64 0)) #12
  %20 = sext i32 %2 to i64
  %21 = tail call i8* @halide_int64_to_string(i8* %19, i8* %11, i64 %20, i32 1) #12
  %22 = tail call i8* @halide_string_to_string(i8* %21, i8* %11, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.48, i64 0, i64 0)) #12
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %17
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %26

.predBB2.split2:                                  ; preds = %17
  %23 = ptrtoint i8* %22 to i64
  %24 = sub i64 1, %5
  %25 = add i64 %24, %23
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %25) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  tail call void @halide_free(i8* %0, i8* nonnull %4) #12
  br label %26

; <label>:26:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -24
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_is_null(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #12
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.46, i64 0, i64 0)) #12
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.49, i64 0, i64 0)) #12
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %22

.predBB2.split2:                                  ; preds = %16
  %19 = ptrtoint i8* %18 to i64
  %20 = sub i64 1, %4
  %21 = add i64 %20, %19
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %21) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  tail call void @halide_free(i8* %0, i8* nonnull %3) #12
  br label %22

; <label>:22:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -34
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_fold(i8*, i8*, i8*, i8*) local_unnamed_addr #0 {
  %5 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %6 = ptrtoint i8* %5 to i64
  %7 = icmp eq i8* %5, null
  br i1 %7, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %4
  %8 = getelementptr inbounds i8, i8* %5, i64 1023
  store i8 0, i8* %8, align 1, !tbaa !11
  %9 = tail call i8* @halide_string_to_string(i8* nonnull %5, i8* nonnull %8, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #12
  br label %11

.predBB1.split:                                   ; preds = %4
  %10 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.50, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB1.split, %.predBB2.split
  %12 = phi i8* [ null, %.predBB1.split ], [ %8, %.predBB2.split ]
  %phi.call = phi i8* [ %10, %.predBB1.split ], [ %9, %.predBB2.split ]
  %13 = icmp eq i8* %2, null
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %12, i8* nonnull %2) #12
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = phi i8* [ %17, %16 ], [ %15, %14 ]
  %20 = tail call i8* @halide_string_to_string(i8* %19, i8* %12, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %21 = icmp eq i8* %1, null
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %23 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %26

; <label>:24:                                     ; preds = %18
  %25 = tail call i8* @halide_string_to_string(i8* %20, i8* %12, i8* nonnull %1) #12
  br label %26

; <label>:26:                                     ; preds = %24, %22
  %27 = phi i8* [ %25, %24 ], [ %23, %22 ]
  %28 = tail call i8* @halide_string_to_string(i8* %27, i8* %12, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i64 0, i64 0)) #12
  %29 = icmp eq i8* %3, null
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %26
  %31 = tail call i8* @halide_string_to_string(i8* %28, i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %34

; <label>:32:                                     ; preds = %26
  %33 = tail call i8* @halide_string_to_string(i8* %28, i8* %12, i8* nonnull %3) #12
  br label %34

; <label>:34:                                     ; preds = %32, %30
  %35 = phi i8* [ %33, %32 ], [ %31, %30 ]
  %36 = tail call i8* @halide_string_to_string(i8* %35, i8* %12, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  br i1 %7, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %34
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %40

.predBB2.split2:                                  ; preds = %34
  %37 = ptrtoint i8* %36 to i64
  %38 = sub i64 1, %6
  %39 = add i64 %38, %37
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %5, i64 %39) #12
  tail call void @halide_error(i8* %0, i8* nonnull %5) #12
  tail call void @halide_free(i8* %0, i8* nonnull %5) #12
  br label %40

; <label>:40:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -25
}

; Function Attrs: nounwind
define weak i32 @halide_error_bad_extern_fold(i8*, i8*, i32, i32, i32, i32, i32) local_unnamed_addr #0 {
  %8 = icmp slt i32 %3, %5
  br i1 %8, label %13, label %9

; <label>:9:                                      ; preds = %7
  %10 = add nsw i32 %4, %3
  %11 = add nsw i32 %6, %5
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %53

; <label>:13:                                     ; preds = %9, %7
  %14 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %15 = ptrtoint i8* %14 to i64
  %16 = icmp eq i8* %14, null
  br i1 %16, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %13
  %17 = getelementptr inbounds i8, i8* %14, i64 1023
  store i8 0, i8* %17, align 1, !tbaa !11
  %18 = tail call i8* @halide_string_to_string(i8* nonnull %14, i8* nonnull %17, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %20

.predBB1.split:                                   ; preds = %13
  %19 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %20

; <label>:20:                                     ; preds = %.predBB1.split, %.predBB2.split
  %21 = phi i8* [ null, %.predBB1.split ], [ %17, %.predBB2.split ]
  %phi.call = phi i8* [ %19, %.predBB1.split ], [ %18, %.predBB2.split ]
  %22 = sext i32 %2 to i64
  %23 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %21, i64 %22, i32 1) #12
  %24 = tail call i8* @halide_string_to_string(i8* %23, i8* %21, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %25 = icmp eq i8* %1, null
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %20
  %27 = tail call i8* @halide_string_to_string(i8* %24, i8* %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %30

; <label>:28:                                     ; preds = %20
  %29 = tail call i8* @halide_string_to_string(i8* %24, i8* %21, i8* nonnull %1) #12
  br label %30

; <label>:30:                                     ; preds = %28, %26
  %31 = phi i8* [ %29, %28 ], [ %27, %26 ]
  %32 = tail call i8* @halide_string_to_string(i8* %31, i8* %21, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #12
  %33 = sext i32 %3 to i64
  %34 = tail call i8* @halide_int64_to_string(i8* %32, i8* %21, i64 %33, i32 1) #12
  %35 = tail call i8* @halide_string_to_string(i8* %34, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %36 = add nsw i32 %4, %3
  %37 = add nsw i32 %36, -1
  %38 = sext i32 %37 to i64
  %39 = tail call i8* @halide_int64_to_string(i8* %35, i8* %21, i64 %38, i32 1) #12
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #12
  %41 = tail call i8* @halide_string_to_string(i8* %40, i8* %21, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.57.150, i64 0, i64 0)) #12
  %42 = sext i32 %5 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %41, i8* %21, i64 %42, i32 1) #12
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %45 = add nsw i32 %6, %5
  %46 = add nsw i32 %45, -1
  %47 = sext i32 %46 to i64
  %48 = tail call i8* @halide_int64_to_string(i8* %44, i8* %21, i64 %47, i32 1) #12
  %49 = tail call i8* @halide_string_to_string(i8* %48, i8* %21, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58.151, i64 0, i64 0)) #12
  br i1 %16, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %30
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %88

.predBB2.split2:                                  ; preds = %30
  %50 = ptrtoint i8* %49 to i64
  %51 = sub i64 1, %15
  %52 = add i64 %51, %50
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %14, i64 %52) #12
  tail call void @halide_error(i8* %0, i8* nonnull %14) #12
  tail call void @halide_free(i8* %0, i8* nonnull %14) #12
  br label %88

; <label>:53:                                     ; preds = %9
  %54 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %55 = ptrtoint i8* %54 to i64
  %56 = icmp eq i8* %54, null
  br i1 %56, label %.predBB1.split3, label %.predBB2.split4

.predBB2.split4:                                  ; preds = %53
  %57 = getelementptr inbounds i8, i8* %54, i64 1023
  store i8 0, i8* %57, align 1, !tbaa !11
  %58 = tail call i8* @halide_string_to_string(i8* nonnull %54, i8* nonnull %57, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %60

.predBB1.split3:                                  ; preds = %53
  %59 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.53, i64 0, i64 0)) #12
  br label %60

; <label>:60:                                     ; preds = %.predBB1.split3, %.predBB2.split4
  %61 = phi i8* [ null, %.predBB1.split3 ], [ %57, %.predBB2.split4 ]
  %phi.call5 = phi i8* [ %59, %.predBB1.split3 ], [ %58, %.predBB2.split4 ]
  %62 = sext i32 %2 to i64
  %63 = tail call i8* @halide_int64_to_string(i8* %phi.call5, i8* %61, i64 %62, i32 1) #12
  %64 = tail call i8* @halide_string_to_string(i8* %63, i8* %61, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %65 = icmp eq i8* %1, null
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %60
  %67 = tail call i8* @halide_string_to_string(i8* %64, i8* %61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %70

; <label>:68:                                     ; preds = %60
  %69 = tail call i8* @halide_string_to_string(i8* %64, i8* %61, i8* nonnull %1) #12
  br label %70

; <label>:70:                                     ; preds = %68, %66
  %71 = phi i8* [ %69, %68 ], [ %67, %66 ]
  %72 = tail call i8* @halide_string_to_string(i8* %71, i8* %61, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.54, i64 0, i64 0)) #12
  %73 = sext i32 %3 to i64
  %74 = tail call i8* @halide_int64_to_string(i8* %72, i8* %61, i64 %73, i32 1) #12
  %75 = tail call i8* @halide_string_to_string(i8* %74, i8* %61, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i64 0, i64 0)) #12
  %76 = add nsw i32 %10, -1
  %77 = sext i32 %76 to i64
  %78 = tail call i8* @halide_int64_to_string(i8* %75, i8* %61, i64 %77, i32 1) #12
  %79 = tail call i8* @halide_string_to_string(i8* %78, i8* %61, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.56, i64 0, i64 0)) #12
  %80 = tail call i8* @halide_string_to_string(i8* %79, i8* %61, i8* nonnull getelementptr inbounds ([47 x i8], [47 x i8]* @.str.59.152, i64 0, i64 0)) #12
  %81 = tail call i8* @halide_string_to_string(i8* %80, i8* %61, i8* nonnull getelementptr inbounds ([30 x i8], [30 x i8]* @.str.60.153, i64 0, i64 0)) #12
  %82 = sext i32 %6 to i64
  %83 = tail call i8* @halide_int64_to_string(i8* %81, i8* %61, i64 %82, i32 1) #12
  %84 = tail call i8* @halide_string_to_string(i8* %83, i8* %61, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30.142, i64 0, i64 0)) #12
  br i1 %56, label %.predBB1.split6, label %.predBB2.split7

.predBB1.split6:                                  ; preds = %70
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %88

.predBB2.split7:                                  ; preds = %70
  %85 = ptrtoint i8* %84 to i64
  %86 = sub i64 1, %55
  %87 = add i64 %86, %85
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %54, i64 %87) #12
  tail call void @halide_error(i8* %0, i8* nonnull %54) #12
  tail call void @halide_free(i8* %0, i8* nonnull %54) #12
  br label %88

; <label>:88:                                     ; preds = %.predBB2.split7, %.predBB1.split6, %.predBB2.split2, %.predBB1.split1
  ret i32 -35
}

; Function Attrs: nounwind
define weak i32 @halide_error_fold_factor_too_small(i8*, i8*, i8*, i32, i8*, i32) local_unnamed_addr #0 {
  %7 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %8 = ptrtoint i8* %7 to i64
  %9 = icmp eq i8* %7, null
  br i1 %9, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %6
  %10 = getelementptr inbounds i8, i8* %7, i64 1023
  store i8 0, i8* %10, align 1, !tbaa !11
  %11 = tail call i8* @halide_string_to_string(i8* nonnull %7, i8* nonnull %10, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #12
  br label %13

.predBB1.split:                                   ; preds = %6
  %12 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([18 x i8], [18 x i8]* @.str.61.154, i64 0, i64 0)) #12
  br label %13

; <label>:13:                                     ; preds = %.predBB1.split, %.predBB2.split
  %14 = phi i8* [ null, %.predBB1.split ], [ %10, %.predBB2.split ]
  %phi.call = phi i8* [ %12, %.predBB1.split ], [ %11, %.predBB2.split ]
  %15 = sext i32 %3 to i64
  %16 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %14, i64 %15, i32 1) #12
  %17 = tail call i8* @halide_string_to_string(i8* %16, i8* %14, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.62, i64 0, i64 0)) #12
  %18 = icmp eq i8* %2, null
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %13
  %20 = tail call i8* @halide_string_to_string(i8* %17, i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %23

; <label>:21:                                     ; preds = %13
  %22 = tail call i8* @halide_string_to_string(i8* %17, i8* %14, i8* nonnull %2) #12
  br label %23

; <label>:23:                                     ; preds = %21, %19
  %24 = phi i8* [ %22, %21 ], [ %20, %19 ]
  %25 = tail call i8* @halide_string_to_string(i8* %24, i8* %14, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i64 0, i64 0)) #12
  %26 = icmp eq i8* %1, null
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23
  %28 = tail call i8* @halide_string_to_string(i8* %25, i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %31

; <label>:29:                                     ; preds = %23
  %30 = tail call i8* @halide_string_to_string(i8* %25, i8* %14, i8* nonnull %1) #12
  br label %31

; <label>:31:                                     ; preds = %29, %27
  %32 = phi i8* [ %30, %29 ], [ %28, %27 ]
  %33 = tail call i8* @halide_string_to_string(i8* %32, i8* %14, i8* nonnull getelementptr inbounds ([61 x i8], [61 x i8]* @.str.63, i64 0, i64 0)) #12
  %34 = icmp eq i8* %4, null
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %31
  %36 = tail call i8* @halide_string_to_string(i8* %33, i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %39

; <label>:37:                                     ; preds = %31
  %38 = tail call i8* @halide_string_to_string(i8* %33, i8* %14, i8* nonnull %4) #12
  br label %39

; <label>:39:                                     ; preds = %37, %35
  %40 = phi i8* [ %38, %37 ], [ %36, %35 ]
  %41 = tail call i8* @halide_string_to_string(i8* %40, i8* %14, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32.144, i64 0, i64 0)) #12
  %42 = sext i32 %5 to i64
  %43 = tail call i8* @halide_int64_to_string(i8* %41, i8* %14, i64 %42, i32 1) #12
  %44 = tail call i8* @halide_string_to_string(i8* %43, i8* %14, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.64.155, i64 0, i64 0)) #12
  br i1 %9, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %39
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %48

.predBB2.split2:                                  ; preds = %39
  %45 = ptrtoint i8* %44 to i64
  %46 = sub i64 1, %8
  %47 = add i64 %46, %45
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %7, i64 %47) #12
  tail call void @halide_error(i8* %0, i8* nonnull %7) #12
  tail call void @halide_free(i8* %0, i8* nonnull %7) #12
  br label %48

; <label>:48:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -26
}

; Function Attrs: nounwind
define weak i32 @halide_error_requirement_failed(i8*, i8*, i8*) local_unnamed_addr #0 {
  %4 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %5 = ptrtoint i8* %4 to i64
  %6 = icmp eq i8* %4, null
  br i1 %6, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1023
  store i8 0, i8* %7, align 1, !tbaa !11
  %8 = tail call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %7, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #12
  br label %10

.predBB1.split:                                   ; preds = %3
  %9 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.65, i64 0, i64 0)) #12
  br label %10

; <label>:10:                                     ; preds = %.predBB1.split, %.predBB2.split
  %11 = phi i8* [ null, %.predBB1.split ], [ %7, %.predBB2.split ]
  %phi.call = phi i8* [ %9, %.predBB1.split ], [ %8, %.predBB2.split ]
  %12 = icmp eq i8* %1, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %11, i8* nonnull %1) #12
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %18 = phi i8* [ %16, %15 ], [ %14, %13 ]
  %19 = tail call i8* @halide_string_to_string(i8* %18, i8* %11, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3.167, i64 0, i64 0)) #12
  %20 = icmp eq i8* %2, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %17
  %22 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %25

; <label>:23:                                     ; preds = %17
  %24 = tail call i8* @halide_string_to_string(i8* %19, i8* %11, i8* nonnull %2) #12
  br label %25

; <label>:25:                                     ; preds = %23, %21
  %26 = phi i8* [ %24, %23 ], [ %22, %21 ]
  br i1 %6, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %25
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %30

.predBB2.split2:                                  ; preds = %25
  %27 = ptrtoint i8* %26 to i64
  %28 = sub i64 1, %5
  %29 = add i64 %28, %27
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %29) #12
  tail call void @halide_error(i8* %0, i8* nonnull %4) #12
  tail call void @halide_free(i8* %0, i8* nonnull %4) #12
  br label %30

; <label>:30:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -27
}

; Function Attrs: nounwind
define weak i32 @halide_error_specialize_fail(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #12
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([59 x i8], [59 x i8]* @.str.67, i64 0, i64 0)) #12
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %21

.predBB2.split2:                                  ; preds = %16
  %18 = ptrtoint i8* %17 to i64
  %19 = sub i64 1, %4
  %20 = add i64 %19, %18
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %20) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  tail call void @halide_free(i8* %0, i8* nonnull %3) #12
  br label %21

; <label>:21:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -31
}

; Function Attrs: nounwind
define weak i32 @halide_error_no_device_interface(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([55 x i8], [55 x i8]* @.str.68, i64 0, i64 0)) #12
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #12
  tail call void @halide_error(i8* %0, i8* nonnull %2) #12
  tail call void @halide_free(i8* %0, i8* nonnull %2) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -19
}

; Function Attrs: nounwind
define weak i32 @halide_error_device_interface_no_device(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([56 x i8], [56 x i8]* @.str.69, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([56 x i8], [56 x i8]* @.str.69, i64 0, i64 0)) #12
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #12
  tail call void @halide_error(i8* %0, i8* nonnull %2) #12
  tail call void @halide_free(i8* %0, i8* nonnull %2) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -36
}

; Function Attrs: nounwind
define weak i32 @halide_error_host_and_device_dirty(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([49 x i8], [49 x i8]* @.str.70, i64 0, i64 0)) #12
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #12
  tail call void @halide_error(i8* %0, i8* nonnull %2) #12
  tail call void @halide_free(i8* %0, i8* nonnull %2) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -37
}

; Function Attrs: nounwind
define weak i32 @halide_error_buffer_is_null(i8*, i8*) local_unnamed_addr #0 {
  %3 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %4 = ptrtoint i8* %3 to i64
  %5 = icmp eq i8* %3, null
  br i1 %5, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %2
  %6 = getelementptr inbounds i8, i8* %3, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %3, i8* nonnull %6, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #12
  br label %9

.predBB1.split:                                   ; preds = %2
  %8 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([26 x i8], [26 x i8]* @.str.71, i64 0, i64 0)) #12
  br label %9

; <label>:9:                                      ; preds = %.predBB1.split, %.predBB2.split
  %10 = phi i8* [ null, %.predBB1.split ], [ %6, %.predBB2.split ]
  %phi.call = phi i8* [ %8, %.predBB1.split ], [ %7, %.predBB2.split ]
  %11 = icmp eq i8* %1, null
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = tail call i8* @halide_string_to_string(i8* %phi.call, i8* %10, i8* nonnull %1) #12
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = phi i8* [ %15, %14 ], [ %13, %12 ]
  %18 = tail call i8* @halide_string_to_string(i8* %17, i8* %10, i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i64 0, i64 0)) #12
  br i1 %5, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %16
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %22

.predBB2.split2:                                  ; preds = %16
  %19 = ptrtoint i8* %18 to i64
  %20 = sub i64 1, %4
  %21 = add i64 %20, %19
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %3, i64 %21) #12
  tail call void @halide_error(i8* %0, i8* nonnull %3) #12
  tail call void @halide_free(i8* %0, i8* nonnull %3) #12
  br label %22

; <label>:22:                                     ; preds = %.predBB2.split2, %.predBB1.split1
  ret i32 -38
}

; Function Attrs: nounwind
define weak i32 @halide_error_integer_division_by_zero(i8*) local_unnamed_addr #0 {
  %2 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.predBB1.split, label %.predBB2.split

.predBB1.split:                                   ; preds = %1
  %4 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.73, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %11

.predBB2.split:                                   ; preds = %1
  %5 = ptrtoint i8* %2 to i64
  %6 = getelementptr inbounds i8, i8* %2, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = tail call i8* @halide_string_to_string(i8* nonnull %2, i8* nonnull %6, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str.73, i64 0, i64 0)) #12
  %8 = ptrtoint i8* %7 to i64
  %9 = sub i64 1, %5
  %10 = add i64 %9, %8
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %2, i64 %10) #12
  tail call void @halide_error(i8* %0, i8* nonnull %2) #12
  tail call void @halide_free(i8* %0, i8* nonnull %2) #12
  br label %11

; <label>:11:                                     ; preds = %.predBB2.split, %.predBB1.split
  ret i32 -44
}

; Function Attrs: nounwind
define linkonce i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8*, %struct.buffer_t*, %struct.halide_buffer_t*) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  store i32 4, i32* %4, align 4, !tbaa !134
  %5 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %1, i64 0, i32 2, i64 0
  %6 = load i32, i32* %5, align 4, !tbaa !99
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %37, %33, %10, %3
  %9 = phi i32 [ 0, %3 ], [ 1, %10 ], [ 2, %33 ], [ 3, %37 ]
  store i32 %9, i32* %4, align 4, !tbaa !134
  br label %14

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %1, i64 0, i32 2, i64 1
  %12 = load i32, i32* %11, align 4, !tbaa !99
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %8, label %33

; <label>:14:                                     ; preds = %37, %8
  %15 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %1, i64 0, i32 5
  %16 = load i32, i32* %15, align 8, !tbaa !201
  switch i32 %16, label %29 [
    i32 1, label %17
    i32 2, label %20
    i32 4, label %23
    i32 8, label %26
  ]

; <label>:17:                                     ; preds = %14
  %18 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4, i32 0
  %19 = bitcast i8* %18 to i32*
  store i32 67585, i32* %19, align 2
  br label %31

; <label>:20:                                     ; preds = %14
  %21 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4, i32 0
  %22 = bitcast i8* %21 to i32*
  store i32 69633, i32* %22, align 2
  br label %31

; <label>:23:                                     ; preds = %14
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4, i32 0
  %25 = bitcast i8* %24 to i32*
  store i32 73729, i32* %25, align 2
  br label %31

; <label>:26:                                     ; preds = %14
  %27 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4, i32 0
  %28 = bitcast i8* %27 to i32*
  store i32 81921, i32* %28, align 2
  br label %31

; <label>:29:                                     ; preds = %14
  %30 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1.165, i64 0, i64 0)) #12
  br label %31

; <label>:31:                                     ; preds = %29, %26, %23, %20, %17
  %32 = phi i32 [ %30, %29 ], [ 0, %26 ], [ 0, %23 ], [ 0, %20 ], [ 0, %17 ]
  ret i32 %32

; <label>:33:                                     ; preds = %10
  %34 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %1, i64 0, i32 2, i64 2
  %35 = load i32, i32* %34, align 4, !tbaa !99
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %8, label %37

; <label>:37:                                     ; preds = %33
  %38 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %1, i64 0, i32 2, i64 3
  %39 = load i32, i32* %38, align 4, !tbaa !99
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %8, label %14
}

; Function Attrs: nounwind
define weak i32 @halide_upgrade_buffer_t(i8*, i8*, %struct.buffer_t*, %struct.halide_buffer_t*, i32) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 1
  %7 = load i8*, i8** %6, align 8, !tbaa !203
  %8 = icmp eq i8* %7, null
  %9 = ptrtoint i8* %7 to i64
  br i1 %8, label %10, label %17

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !204
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %16 = bitcast i8** %15 to i64*
  store i64 %9, i64* %16, align 8, !tbaa !151
  br label %71

; <label>:17:                                     ; preds = %10, %5
  %18 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 5
  %19 = load i32, i32* %18, align 8, !tbaa !201
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4
  %21 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 4, i32 1
  %22 = load i8, i8* %21, align 1, !tbaa !108
  %23 = zext i8 %22 to i32
  %24 = add nuw nsw i32 %23, 7
  %25 = lshr i32 %24, 3
  %26 = icmp eq i32 %19, %25
  br i1 %26, label %48, label %27

; <label>:27:                                     ; preds = %17
  %28 = tail call i8* @halide_malloc(i8* %0, i64 1024) #12
  %29 = ptrtoint i8* %28 to i64
  %30 = icmp eq i8* %28, null
  br i1 %30, label %.predBB1.split, label %.predBB2.split

.predBB2.split:                                   ; preds = %27
  %31 = getelementptr inbounds i8, i8* %28, i64 1023
  store i8 0, i8* %31, align 1, !tbaa !11
  %32 = tail call i8* @halide_string_to_string(i8* nonnull %28, i8* nonnull %31, i8* nonnull getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.166, i64 0, i64 0)) #12
  br label %34

.predBB1.split:                                   ; preds = %27
  %33 = tail call i8* @halide_string_to_string(i8* null, i8* null, i8* nonnull getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.166, i64 0, i64 0)) #12
  br label %34

; <label>:34:                                     ; preds = %.predBB1.split, %.predBB2.split
  %35 = phi i8* [ null, %.predBB1.split ], [ %31, %.predBB2.split ]
  %phi.call = phi i8* [ %33, %.predBB1.split ], [ %32, %.predBB2.split ]
  %36 = load i32, i32* %18, align 8, !tbaa !201
  %37 = sext i32 %36 to i64
  %38 = tail call i8* @halide_int64_to_string(i8* %phi.call, i8* %35, i64 %37, i32 1) #12
  %39 = tail call i8* @halide_string_to_string(i8* %38, i8* %35, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3.167, i64 0, i64 0)) #12
  %40 = tail call i8* @halide_string_to_string(i8* %39, i8* %35, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4.168, i64 0, i64 0)) #12
  %41 = tail call i8* @halide_type_to_string(i8* %40, i8* %35, %struct.halide_type_t* nonnull %20) #12
  %42 = tail call i8* @halide_string_to_string(i8* %41, i8* %35, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5.169, i64 0, i64 0)) #12
  br i1 %30, label %.predBB1.split1, label %.predBB2.split2

.predBB1.split1:                                  ; preds = %34
  %43 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* %1, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_error(i8* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8.170, i64 0, i64 0)) #12
  tail call void @halide_free(i8* %0, i8* null) #12
  br label %104

.predBB2.split2:                                  ; preds = %34
  %44 = ptrtoint i8* %42 to i64
  %45 = sub i64 1, %29
  %46 = add i64 %45, %44
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %28, i64 %46) #12
  %47 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* %1, i8* nonnull %28) #12
  tail call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %28, i64 %46) #12
  tail call void @halide_free(i8* %0, i8* nonnull %28) #12
  br label %104

; <label>:48:                                     ; preds = %17
  %49 = icmp eq i32 %4, 0
  br i1 %49, label %56, label %50

; <label>:50:                                     ; preds = %48
  %51 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %52 = load i8*, i8** %51, align 8, !tbaa !151
  %53 = icmp eq i8* %52, %7
  br i1 %53, label %104, label %54

; <label>:54:                                     ; preds = %50
  %55 = tail call i32 @halide_error_failed_to_upgrade_buffer_t(i8* %0, i8* %1, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.6.171, i64 0, i64 0)) #12
  br label %104

; <label>:56:                                     ; preds = %48
  %57 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 0
  %58 = load i64, i64* %57, align 8, !tbaa !204
  %59 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 2
  %60 = bitcast i8** %59 to i64*
  store i64 %9, i64* %60, align 8, !tbaa !151
  %61 = icmp eq i64 %58, 0
  br i1 %61, label %71, label %62

; <label>:62:                                     ; preds = %56
  %63 = inttoptr i64 %58 to %"struct.Halide::Runtime::Internal::old_dev_wrapper"*
  %64 = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %63, i64 0, i32 0
  %65 = load i64, i64* %64, align 8, !tbaa !205
  %66 = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %63, i64 0, i32 1
  %67 = bitcast %struct.halide_device_interface_t** %66 to i64*
  %68 = load i64, i64* %67, align 8, !tbaa !207
  %69 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 1
  %70 = bitcast %struct.halide_device_interface_t** %69 to i64*
  store i64 %68, i64* %70, align 8, !tbaa !179
  br label %73

; <label>:71:                                     ; preds = %56, %14
  %72 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 1
  store %struct.halide_device_interface_t* null, %struct.halide_device_interface_t** %72, align 8, !tbaa !179
  br label %73

; <label>:73:                                     ; preds = %71, %62
  %74 = phi i64 [ 0, %71 ], [ %65, %62 ]
  %75 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 0
  store i64 %74, i64* %75, align 8
  %76 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 5
  %77 = load i32, i32* %76, align 4, !tbaa !134
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %.loopexit

; <label>:79:                                     ; preds = %73
  %80 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %81 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %80, align 8, !tbaa !136
  %82 = sext i32 %77 to i64
  br label %92

.loopexit:                                        ; preds = %92, %73
  %83 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 3
  %84 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 6
  %85 = load i8, i8* %84, align 4, !tbaa !208, !range !14
  %86 = zext i8 %85 to i64
  %87 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 7
  %88 = load i8, i8* %87, align 1, !tbaa !209, !range !14
  %89 = icmp eq i8 %88, 0
  %90 = or i64 %86, 2
  %91 = select i1 %89, i64 %86, i64 %90
  store i64 %91, i64* %83, align 8, !tbaa !180
  br label %104

; <label>:92:                                     ; preds = %92, %79
  %93 = phi i64 [ 0, %79 ], [ %103, %92 ]
  %94 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 4, i64 %93
  %95 = load i32, i32* %94, align 4, !tbaa !99
  %96 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %81, i64 %93, i32 0
  store i32 %95, i32* %96, align 4, !tbaa !140
  %97 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 2, i64 %93
  %98 = load i32, i32* %97, align 4, !tbaa !99
  %99 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %81, i64 %93, i32 1
  store i32 %98, i32* %99, align 4, !tbaa !138
  %100 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %2, i64 0, i32 3, i64 %93
  %101 = load i32, i32* %100, align 4, !tbaa !99
  %102 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %81, i64 %93, i32 2
  store i32 %101, i32* %102, align 4, !tbaa !141
  %103 = add nuw nsw i64 %93, 1
  %exitcond = icmp eq i64 %103, %82
  br i1 %exitcond, label %.loopexit, label %92

; <label>:104:                                    ; preds = %.loopexit, %54, %50, %.predBB2.split2, %.predBB1.split1
  %105 = phi i32 [ %55, %54 ], [ 0, %.loopexit ], [ 0, %50 ], [ %43, %.predBB1.split1 ], [ %47, %.predBB2.split2 ]
  ret i32 %105
}

; Function Attrs: nounwind
define weak i32 @halide_downgrade_buffer_t(i8*, i8*, %struct.halide_buffer_t*, %struct.buffer_t*) local_unnamed_addr #0 {
  %5 = bitcast %struct.buffer_t* %3 to i8*
  %6 = tail call i8* @memset(i8* %5, i32 0, i64 72) #12
  %7 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 5
  %8 = load i32, i32* %7, align 4, !tbaa !134
  %9 = icmp sgt i32 %8, 4
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %4
  %11 = tail call i32 @halide_error_failed_to_downgrade_buffer_t(i8* %0, i8* %1, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.7.172, i64 0, i64 0)) #12
  br label %44

; <label>:12:                                     ; preds = %4
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 2
  %14 = bitcast i8** %13 to i64*
  %15 = load i64, i64* %14, align 8, !tbaa !151
  %16 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 1
  %17 = bitcast i8** %16 to i64*
  store i64 %15, i64* %17, align 8, !tbaa !203
  %18 = icmp sgt i32 %8, 0
  br i1 %18, label %19, label %.loopexit

; <label>:19:                                     ; preds = %12
  %20 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 6
  %21 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %20, align 8, !tbaa !136
  br label %29

.loopexit:                                        ; preds = %29, %12
  %22 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 4, i32 1
  %23 = load i8, i8* %22, align 1, !tbaa !108
  %24 = zext i8 %23 to i32
  %25 = add nuw nsw i32 %24, 7
  %26 = lshr i32 %25, 3
  %27 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 5
  store i32 %26, i32* %27, align 8, !tbaa !201
  %28 = tail call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* %1, %struct.halide_buffer_t* nonnull %2, %struct.buffer_t* nonnull %3) #13
  br label %44

; <label>:29:                                     ; preds = %29, %19
  %30 = phi i64 [ 0, %19 ], [ %40, %29 ]
  %31 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %30, i32 0
  %32 = load i32, i32* %31, align 4, !tbaa !140
  %33 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 4, i64 %30
  store i32 %32, i32* %33, align 4, !tbaa !99
  %34 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %30, i32 1
  %35 = load i32, i32* %34, align 4, !tbaa !138
  %36 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 2, i64 %30
  store i32 %35, i32* %36, align 4, !tbaa !99
  %37 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %21, i64 %30, i32 2
  %38 = load i32, i32* %37, align 4, !tbaa !141
  %39 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 3, i64 %30
  store i32 %38, i32* %39, align 4, !tbaa !99
  %40 = add nuw nsw i64 %30, 1
  %41 = load i32, i32* %7, align 4, !tbaa !134
  %42 = sext i32 %41 to i64
  %43 = icmp slt i64 %40, %42
  br i1 %43, label %29, label %.loopexit

; <label>:44:                                     ; preds = %.loopexit, %10
  %45 = phi i32 [ %11, %10 ], [ %28, %.loopexit ]
  ret i32 %45
}

; Function Attrs: nounwind
define weak i32 @halide_downgrade_buffer_t_device_fields(i8*, i8*, %struct.halide_buffer_t*, %struct.buffer_t*) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 3
  %6 = load i64, i64* %5, align 8, !tbaa !180
  %7 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 6
  %8 = trunc i64 %6 to i8
  %9 = and i8 %8, 1
  store i8 %9, i8* %7, align 4, !tbaa !208
  %10 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 7
  %11 = lshr i64 %6, 1
  %12 = trunc i64 %11 to i8
  %13 = and i8 %12, 1
  store i8 %13, i8* %10, align 1, !tbaa !209
  %14 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !178
  %16 = icmp eq i64 %15, 0
  %17 = getelementptr inbounds %struct.buffer_t, %struct.buffer_t* %3, i64 0, i32 0
  %18 = load i64, i64* %17, align 8, !tbaa !204
  %19 = icmp ne i64 %18, 0
  br i1 %16, label %35, label %20

; <label>:20:                                     ; preds = %4
  br i1 %19, label %21, label %29

; <label>:21:                                     ; preds = %20
  %22 = inttoptr i64 %18 to %"struct.Halide::Runtime::Internal::old_dev_wrapper"*
  %23 = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %22, i64 0, i32 0
  store i64 %15, i64* %23, align 8, !tbaa !205
  %24 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %2, i64 0, i32 1
  %25 = bitcast %struct.halide_device_interface_t** %24 to i64*
  %26 = load i64, i64* %25, align 8, !tbaa !179
  %27 = getelementptr inbounds %"struct.Halide::Runtime::Internal::old_dev_wrapper", %"struct.Halide::Runtime::Internal::old_dev_wrapper"* %22, i64 0, i32 1
  %28 = bitcast %struct.halide_device_interface_t** %27 to i64*
  store i64 %26, i64* %28, align 8, !tbaa !207
  br label %38

; <label>:29:                                     ; preds = %20
  %30 = tail call i8* @malloc(i64 16) #12
  %31 = bitcast %struct.halide_buffer_t* %2 to <2 x i64>*
  %32 = load <2 x i64>, <2 x i64>* %31, align 8, !tbaa !11
  %33 = bitcast i8* %30 to <2 x i64>*
  store <2 x i64> %32, <2 x i64>* %33, align 8, !tbaa !11
  %34 = ptrtoint i8* %30 to i64
  store i64 %34, i64* %17, align 8, !tbaa !204
  br label %38

; <label>:35:                                     ; preds = %4
  br i1 %19, label %36, label %38

; <label>:36:                                     ; preds = %35
  %37 = inttoptr i64 %18 to i8*
  tail call void @free(i8* %37) #12
  store i64 0, i64* %17, align 8, !tbaa !204
  br label %38

; <label>:38:                                     ; preds = %36, %35, %29, %21
  ret i32 0
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_host_legacy(i8*, %struct.buffer_t*) local_unnamed_addr #0 {
  %3 = alloca %struct.halide_buffer_t, align 8
  %4 = alloca [4 x %struct.halide_dimension_t], align 4
  %5 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %5) #10
  %6 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  %7 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #10
  %8 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %4, i64 0, i64 0
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %10 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %10, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %8, %struct.halide_dimension_t** %9, align 8, !tbaa !136
  %11 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3) #13
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %14 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3, i32 0) #13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %13
  %17 = call i32 @halide_copy_to_host(i8* %0, %struct.halide_buffer_t* nonnull %3) #12
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %16
  %20 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %3, %struct.buffer_t* %1) #13
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  br label %23

; <label>:23:                                     ; preds = %19, %16, %13, %2
  %24 = phi i32 [ 1, %16 ], [ %22, %19 ], [ 1, %13 ], [ 1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #10
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %5) #10
  ret i32 %24
}

; Function Attrs: nounwind
define weak i32 @halide_copy_to_device_legacy(i8*, %struct.buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = alloca %struct.halide_buffer_t, align 8
  %5 = alloca [4 x %struct.halide_dimension_t], align 4
  %6 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %6) #10
  %7 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  %8 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %7) #10
  %9 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 6
  %11 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %11, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %9, %struct.halide_dimension_t** %10, align 8, !tbaa !136
  %12 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4) #13
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %3
  %15 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4, i32 0) #13
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %14
  %18 = call i32 @halide_copy_to_device(i8* %0, %struct.halide_buffer_t* nonnull %4, %struct.halide_device_interface_t* %2) #12
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %17
  %21 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %4, %struct.buffer_t* %1) #13
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i32
  br label %24

; <label>:24:                                     ; preds = %20, %17, %14, %3
  %25 = phi i32 [ 1, %17 ], [ %23, %20 ], [ 1, %14 ], [ 1, %3 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %7) #10
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %6) #10
  ret i32 %25
}

; Function Attrs: nounwind
define weak i32 @halide_device_sync_legacy(i8*, %struct.buffer_t*) local_unnamed_addr #0 {
  %3 = alloca %struct.halide_buffer_t, align 8
  %4 = alloca [4 x %struct.halide_dimension_t], align 4
  %5 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %5) #10
  %6 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  %7 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #10
  %8 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %4, i64 0, i64 0
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %10 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %10, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %8, %struct.halide_dimension_t** %9, align 8, !tbaa !136
  %11 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3) #13
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %14 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3, i32 0) #13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %13
  %17 = call i32 @halide_device_sync(i8* %0, %struct.halide_buffer_t* nonnull %3) #12
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %16
  %20 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %3, %struct.buffer_t* %1) #13
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  br label %23

; <label>:23:                                     ; preds = %19, %16, %13, %2
  %24 = phi i32 [ 1, %16 ], [ %22, %19 ], [ 1, %13 ], [ 1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #10
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %5) #10
  ret i32 %24
}

; Function Attrs: nounwind
define weak i32 @halide_device_malloc_legacy(i8*, %struct.buffer_t*, %struct.halide_device_interface_t*) local_unnamed_addr #0 {
  %4 = alloca %struct.halide_buffer_t, align 8
  %5 = alloca [4 x %struct.halide_dimension_t], align 4
  %6 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %6) #10
  %7 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  %8 = bitcast %struct.halide_buffer_t* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %7) #10
  %9 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %5, i64 0, i64 0
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %4, i64 0, i32 6
  %11 = bitcast [4 x %struct.halide_dimension_t]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %11, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %9, %struct.halide_dimension_t** %10, align 8, !tbaa !136
  %12 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4) #13
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %3
  %15 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %4, i32 0) #13
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %14
  %18 = call i32 @halide_device_malloc(i8* %0, %struct.halide_buffer_t* nonnull %4, %struct.halide_device_interface_t* %2) #12
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %17
  %21 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %4, %struct.buffer_t* %1) #13
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i32
  br label %24

; <label>:24:                                     ; preds = %20, %17, %14, %3
  %25 = phi i32 [ 1, %17 ], [ %23, %20 ], [ 1, %14 ], [ 1, %3 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %7) #10
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %6) #10
  ret i32 %25
}

; Function Attrs: nounwind
define weak i32 @halide_device_free_legacy(i8*, %struct.buffer_t*) local_unnamed_addr #0 {
  %3 = alloca %struct.halide_buffer_t, align 8
  %4 = alloca [4 x %struct.halide_dimension_t], align 4
  %5 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %5) #10
  %6 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  %7 = bitcast %struct.halide_buffer_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 56, i32 8, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #10
  %8 = getelementptr inbounds [4 x %struct.halide_dimension_t], [4 x %struct.halide_dimension_t]* %4, i64 0, i64 0
  %9 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %3, i64 0, i32 6
  %10 = bitcast [4 x %struct.halide_dimension_t]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %10, i8 0, i64 64, i32 4, i1 false)
  store %struct.halide_dimension_t* %8, %struct.halide_dimension_t** %9, align 8, !tbaa !136
  %11 = call i32 @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t(i8* %0, %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3) #13
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %2
  %14 = call i32 @halide_upgrade_buffer_t(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.buffer_t* %1, %struct.halide_buffer_t* nonnull %3, i32 0) #13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %13
  %17 = call i32 @halide_device_free(i8* %0, %struct.halide_buffer_t* nonnull %3) #12
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %16
  %20 = call i32 @halide_downgrade_buffer_t_device_fields(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0), %struct.halide_buffer_t* nonnull %3, %struct.buffer_t* %1) #13
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  br label %23

; <label>:23:                                     ; preds = %19, %16, %13, %2
  %24 = phi i32 [ 1, %16 ], [ %22, %19 ], [ 1, %13 ], [ 1, %2 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #10
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %5) #10
  ret i32 %24
}

; Function Attrs: nounwind
define weak void @halide_profiler_shutdown() #0 {
  %1 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 7
  %3 = load %struct.halide_thread*, %struct.halide_thread** %2, align 8, !tbaa !210
  %4 = icmp eq %struct.halide_thread* %3, null
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %0
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 3
  store i32 -2, i32* %6, align 8, !tbaa !212
  tail call void @halide_join_thread(%struct.halide_thread* nonnull %3) #12
  store %struct.halide_thread* null, %struct.halide_thread** %2, align 8, !tbaa !210
  store i32 -1, i32* %6, align 8, !tbaa !212
  tail call void @halide_profiler_report_unlocked(i8* null, %struct.halide_profiler_state* %1) #13
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %1) #13
  br label %7

; <label>:7:                                      ; preds = %5, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak %struct.halide_profiler_state* @halide_profiler_get_state() local_unnamed_addr #2 {
  ret %struct.halide_profiler_state* @_ZZ25halide_profiler_get_stateE1s
}

; Function Attrs: nounwind
define weak void @halide_profiler_report_unlocked(i8*, %struct.halide_profiler_state*) local_unnamed_addr #0 {
  %3 = alloca [1024 x i8], align 1
  %4 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %4) #10
  %5 = ptrtoint [1024 x i8]* %3 to i64
  %6 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 1023
  store i8 0, i8* %6, align 1, !tbaa !11
  %7 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 5
  %8 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %7, align 8, !tbaa !7
  %9 = icmp eq %struct.halide_profiler_pipeline_stats* %8, null
  %10 = sub i64 1, %5
  br i1 %9, label %.loopexit9, label %.preheader53

.preheader53:                                     ; preds = %2
  br label %13

.loopexit9:                                       ; preds = %.loopexit6, %2
  %11 = phi i64 [ %5, %2 ], [ %298, %.loopexit6 ]
  %12 = add i64 %11, %10
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %12) #12
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %4) #10
  ret void

; <label>:13:                                     ; preds = %.loopexit6, %.preheader53
  %14 = phi %struct.halide_profiler_pipeline_stats* [ %301, %.loopexit6 ], [ %8, %.preheader53 ]
  %15 = phi i64 [ %298, %.loopexit6 ], [ %5, %.preheader53 ]
  %16 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 0
  %17 = load i64, i64* %16, align 8, !tbaa !213
  %18 = uitofp i64 %17 to float
  %19 = fdiv float %18, 1.000000e+06
  %20 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 11
  %21 = load i32, i32* %20, align 8, !tbaa !215
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.loopexit6, label %23

; <label>:23:                                     ; preds = %13
  store i8 0, i8* %4, align 1, !tbaa !11
  %24 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 13
  %25 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 4
  %26 = load i64, i64* %25, align 8, !tbaa !216
  %27 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 5
  %28 = load i64, i64* %27, align 8, !tbaa !217
  %29 = icmp eq i64 %26, %28
  %30 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 6
  %31 = load i8*, i8** %30, align 8, !tbaa !218
  %32 = icmp eq i8* %31, null
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %23
  %34 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %37

; <label>:35:                                     ; preds = %23
  %36 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %6, i8* nonnull %31) #12
  br label %37

; <label>:37:                                     ; preds = %35, %33
  %38 = phi i8* [ %36, %35 ], [ %34, %33 ]
  %39 = call i8* @halide_string_to_string(i8* %38, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #12
  %40 = call i8* @halide_string_to_string(i8* %39, i8* nonnull %6, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8.176, i64 0, i64 0)) #12
  %41 = fpext float %19 to double
  %42 = call i8* @halide_double_to_string(i8* %40, i8* nonnull %6, double %41, i32 0) #12
  %43 = call i8* @halide_string_to_string(i8* %42, i8* nonnull %6, i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9.177, i64 0, i64 0)) #12
  %44 = call i8* @halide_string_to_string(i8* %43, i8* nonnull %6, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10.178, i64 0, i64 0)) #12
  %45 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 12
  %46 = load i32, i32* %45, align 4, !tbaa !219
  %47 = sext i32 %46 to i64
  %48 = call i8* @halide_int64_to_string(i8* %44, i8* nonnull %6, i64 %47, i32 1) #12
  %49 = call i8* @halide_string_to_string(i8* %48, i8* nonnull %6, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11.179, i64 0, i64 0)) #12
  %50 = load i32, i32* %20, align 8, !tbaa !215
  %51 = sext i32 %50 to i64
  %52 = call i8* @halide_int64_to_string(i8* %49, i8* nonnull %6, i64 %51, i32 1) #12
  %53 = call i8* @halide_string_to_string(i8* %52, i8* nonnull %6, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12.180, i64 0, i64 0)) #12
  %54 = load i32, i32* %20, align 8, !tbaa !215
  %55 = sitofp i32 %54 to float
  %56 = fdiv float %19, %55
  %57 = fpext float %56 to double
  %58 = call i8* @halide_double_to_string(i8* %53, i8* nonnull %6, double %57, i32 0) #12
  %59 = call i8* @halide_string_to_string(i8* %58, i8* nonnull %6, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13.181, i64 0, i64 0)) #12
  br i1 %29, label %70, label %60

; <label>:60:                                     ; preds = %37
  %61 = uitofp i64 %26 to double
  %62 = uitofp i64 %28 to double
  %63 = fadd double %62, 1.000000e-10
  %64 = fdiv double %61, %63
  %65 = fptrunc double %64 to float
  %66 = call i8* @halide_string_to_string(i8* %59, i8* nonnull %6, i8* nonnull getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14.182, i64 0, i64 0)) #12
  %67 = fpext float %65 to double
  %68 = call i8* @halide_double_to_string(i8* %66, i8* nonnull %6, double %67, i32 0) #12
  %69 = call i8* @halide_string_to_string(i8* %68, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #12
  br label %70

; <label>:70:                                     ; preds = %60, %37
  %71 = phi i8* [ %59, %37 ], [ %69, %60 ]
  %72 = call i8* @halide_string_to_string(i8* %71, i8* nonnull %6, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15.183, i64 0, i64 0)) #12
  %73 = load i32, i32* %24, align 8, !tbaa !220
  %74 = sext i32 %73 to i64
  %75 = call i8* @halide_int64_to_string(i8* %72, i8* nonnull %6, i64 %74, i32 1) #12
  %76 = call i8* @halide_string_to_string(i8* %75, i8* nonnull %6, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16.184, i64 0, i64 0)) #12
  %77 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 2
  %78 = load i64, i64* %77, align 8, !tbaa !221
  %79 = call i8* @halide_uint64_to_string(i8* %76, i8* nonnull %6, i64 %78, i32 1) #12
  %80 = call i8* @halide_string_to_string(i8* %79, i8* nonnull %6, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17.185, i64 0, i64 0)) #12
  %81 = ptrtoint i8* %80 to i64
  %82 = add i64 %10, %81
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %82) #12
  call void @halide_print(i8* %0, i8* nonnull %4) #12
  %83 = load i64, i64* %16, align 8, !tbaa !213
  %84 = icmp eq i64 %83, 0
  br i1 %84, label %85, label %.loopexit7

; <label>:85:                                     ; preds = %70
  %86 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 3
  %87 = load i64, i64* %86, align 8, !tbaa !222
  %88 = icmp eq i64 %87, 0
  br i1 %88, label %89, label %.loopexit7

; <label>:89:                                     ; preds = %85
  %90 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 9
  %91 = load i32, i32* %90, align 8, !tbaa !223
  %92 = icmp sgt i32 %91, 0
  br i1 %92, label %93, label %.loopexit6

; <label>:93:                                     ; preds = %89
  %94 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 7
  %95 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %94, align 8, !tbaa !224
  %96 = sext i32 %91 to i64
  br label %99

; <label>:97:                                     ; preds = %99
  %98 = icmp slt i64 %104, %96
  br i1 %98, label %99, label %.loopexit6

; <label>:99:                                     ; preds = %97, %93
  %100 = phi i64 [ 0, %93 ], [ %104, %97 ]
  %101 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %95, i64 %100, i32 4
  %102 = load i64, i64* %101, align 8, !tbaa !225
  %103 = icmp eq i64 %102, 0
  %104 = add nuw nsw i64 %100, 1
  br i1 %103, label %97, label %.loopexit7

.loopexit7:                                       ; preds = %99, %85, %70
  %105 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 9
  %106 = load i32, i32* %105, align 8, !tbaa !223
  %107 = icmp sgt i32 %106, 0
  br i1 %107, label %108, label %.loopexit6

; <label>:108:                                    ; preds = %.loopexit7
  %109 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 7
  br label %110

; <label>:110:                                    ; preds = %292, %108
  %111 = phi i32 [ %106, %108 ], [ %293, %292 ]
  %112 = phi i64 [ 0, %108 ], [ %295, %292 ]
  store i8 0, i8* %4, align 1, !tbaa !11
  %113 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %109, align 8, !tbaa !224
  %114 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112
  %115 = icmp eq i64 %112, 0
  br i1 %115, label %116, label %120

; <label>:116:                                    ; preds = %110
  %117 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %114, i64 0, i32 0
  %118 = load i64, i64* %117, align 8, !tbaa !227
  %119 = icmp eq i64 %118, 0
  br i1 %119, label %292, label %120

; <label>:120:                                    ; preds = %116, %110
  %121 = call i8* @halide_string_to_string(i8* nonnull %4, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18.186, i64 0, i64 0)) #12
  %122 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 7
  %123 = load i8*, i8** %122, align 8, !tbaa !228
  %124 = icmp eq i8* %123, null
  br i1 %124, label %125, label %127

; <label>:125:                                    ; preds = %120
  %126 = call i8* @halide_string_to_string(i8* %121, i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30.174, i64 0, i64 0)) #12
  br label %129

; <label>:127:                                    ; preds = %120
  %128 = call i8* @halide_string_to_string(i8* %121, i8* nonnull %6, i8* nonnull %123) #12
  br label %129

; <label>:129:                                    ; preds = %127, %125
  %130 = phi i8* [ %128, %127 ], [ %126, %125 ]
  %131 = call i8* @halide_string_to_string(i8* %130, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19.187, i64 0, i64 0)) #12
  %132 = ptrtoint i8* %131 to i64
  %133 = sub i64 %132, %5
  %134 = icmp ult i64 %133, 25
  br i1 %134, label %.preheader51, label %.loopexit5

.preheader51:                                     ; preds = %129
  br label %135

; <label>:135:                                    ; preds = %135, %.preheader51
  %136 = phi i8* [ %137, %135 ], [ %131, %.preheader51 ]
  %137 = call i8* @halide_string_to_string(i8* %136, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #12
  %138 = ptrtoint i8* %137 to i64
  %139 = sub i64 %138, %5
  %140 = icmp ult i64 %139, 25
  br i1 %140, label %135, label %.loopexit5

.loopexit5:                                       ; preds = %135, %129
  %141 = phi i8* [ %131, %129 ], [ %137, %135 ]
  %142 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %114, i64 0, i32 0
  %143 = load i64, i64* %142, align 8, !tbaa !227
  %144 = uitofp i64 %143 to float
  %145 = load i32, i32* %20, align 8, !tbaa !215
  %146 = sitofp i32 %145 to float
  %147 = fmul float %146, 1.000000e+06
  %148 = fdiv float %144, %147
  %149 = fpext float %148 to double
  %150 = call i8* @halide_double_to_string(i8* %141, i8* nonnull %6, double %149, i32 0) #12
  %151 = icmp eq i8* %150, null
  br i1 %151, label %156, label %152

; <label>:152:                                    ; preds = %.loopexit5
  %153 = getelementptr inbounds i8, i8* %150, i64 -3
  %154 = icmp ult i8* %153, %4
  %155 = select i1 %154, i8* %4, i8* %153
  store i8 0, i8* %155, align 1, !tbaa !11
  br label %156

; <label>:156:                                    ; preds = %152, %.loopexit5
  %157 = phi i8* [ null, %.loopexit5 ], [ %155, %152 ]
  %158 = call i8* @halide_string_to_string(i8* %157, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21.189, i64 0, i64 0)) #12
  %159 = ptrtoint i8* %158 to i64
  %160 = sub i64 %159, %5
  %161 = icmp ult i64 %160, 35
  br i1 %161, label %.preheader50, label %.loopexit4

.preheader50:                                     ; preds = %156
  br label %162

; <label>:162:                                    ; preds = %162, %.preheader50
  %163 = phi i8* [ %164, %162 ], [ %158, %.preheader50 ]
  %164 = call i8* @halide_string_to_string(i8* %163, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #12
  %165 = ptrtoint i8* %164 to i64
  %166 = sub i64 %165, %5
  %167 = icmp ult i64 %166, 35
  br i1 %167, label %162, label %.loopexit4

.loopexit4:                                       ; preds = %162, %156
  %168 = phi i8* [ %158, %156 ], [ %164, %162 ]
  %169 = load i64, i64* %16, align 8, !tbaa !213
  %170 = icmp eq i64 %169, 0
  br i1 %170, label %175, label %171

; <label>:171:                                    ; preds = %.loopexit4
  %172 = load i64, i64* %142, align 8, !tbaa !227
  %173 = mul i64 %172, 100
  %174 = udiv i64 %173, %169
  br label %175

; <label>:175:                                    ; preds = %171, %.loopexit4
  %176 = phi i64 [ %174, %171 ], [ 0, %.loopexit4 ]
  %177 = call i8* @halide_string_to_string(i8* %168, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22.190, i64 0, i64 0)) #12
  %178 = shl i64 %176, 32
  %179 = ashr exact i64 %178, 32
  %180 = call i8* @halide_int64_to_string(i8* %177, i8* nonnull %6, i64 %179, i32 1) #12
  %181 = call i8* @halide_string_to_string(i8* %180, i8* nonnull %6, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23.191, i64 0, i64 0)) #12
  %182 = ptrtoint i8* %181 to i64
  %183 = sub i64 %182, %5
  %184 = icmp ult i64 %183, 43
  br i1 %184, label %.preheader49, label %.loopexit3

.preheader49:                                     ; preds = %175
  br label %185

; <label>:185:                                    ; preds = %185, %.preheader49
  %186 = phi i8* [ %187, %185 ], [ %181, %.preheader49 ]
  %187 = call i8* @halide_string_to_string(i8* %186, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #12
  %188 = ptrtoint i8* %187 to i64
  %189 = sub i64 %188, %5
  %190 = icmp ult i64 %189, 43
  br i1 %190, label %185, label %.loopexit3.loopexit

.loopexit3.loopexit:                              ; preds = %185
  %191 = ptrtoint i8* %187 to i64
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit, %175
  %192 = phi i8* [ %181, %175 ], [ %187, %.loopexit3.loopexit ]
  %193 = phi i64 [ %182, %175 ], [ %191, %.loopexit3.loopexit ]
  br i1 %29, label %.loopexit2, label %194

; <label>:194:                                    ; preds = %.loopexit3
  %195 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 5
  %196 = load i64, i64* %195, align 8, !tbaa !229
  %197 = uitofp i64 %196 to double
  %198 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 6
  %199 = load i64, i64* %198, align 8, !tbaa !230
  %200 = uitofp i64 %199 to double
  %201 = fadd double %200, 1.000000e-10
  %202 = fdiv double %197, %201
  %203 = fptrunc double %202 to float
  %204 = call i8* @halide_string_to_string(i8* %192, i8* nonnull %6, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.24.192, i64 0, i64 0)) #12
  %205 = fpext float %203 to double
  %206 = call i8* @halide_double_to_string(i8* %204, i8* nonnull %6, double %205, i32 0) #12
  %207 = icmp eq i8* %206, null
  br i1 %207, label %212, label %208

; <label>:208:                                    ; preds = %194
  %209 = getelementptr inbounds i8, i8* %206, i64 -3
  %210 = icmp ult i8* %209, %4
  %211 = select i1 %210, i8* %4, i8* %209
  store i8 0, i8* %211, align 1, !tbaa !11
  br label %212

; <label>:212:                                    ; preds = %208, %194
  %213 = phi i8* [ null, %194 ], [ %211, %208 ]
  %214 = ptrtoint i8* %213 to i64
  %215 = sub i64 %214, %5
  %216 = icmp ult i64 %215, 58
  br i1 %216, label %.preheader48, label %.loopexit2

.preheader48:                                     ; preds = %212
  br label %217

; <label>:217:                                    ; preds = %217, %.preheader48
  %218 = phi i8* [ %219, %217 ], [ %213, %.preheader48 ]
  %219 = call i8* @halide_string_to_string(i8* %218, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #12
  %220 = ptrtoint i8* %219 to i64
  %221 = sub i64 %220, %5
  %222 = icmp ult i64 %221, 58
  br i1 %222, label %217, label %.loopexit2.loopexit

.loopexit2.loopexit:                              ; preds = %217
  %223 = ptrtoint i8* %219 to i64
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %212, %.loopexit3
  %224 = phi i64 [ %193, %.loopexit3 ], [ %214, %212 ], [ %223, %.loopexit2.loopexit ]
  %225 = phi i64 [ 58, %.loopexit3 ], [ 73, %212 ], [ 73, %.loopexit2.loopexit ]
  %226 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 8
  %227 = load i32, i32* %226, align 8, !tbaa !231
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %234, label %229

; <label>:229:                                    ; preds = %.loopexit2
  %230 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 3
  %231 = load i64, i64* %230, align 8, !tbaa !232
  %232 = sext i32 %227 to i64
  %233 = udiv i64 %231, %232
  br label %234

; <label>:234:                                    ; preds = %229, %.loopexit2
  %235 = phi i64 [ %233, %229 ], [ 0, %.loopexit2 ]
  %236 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 2
  %237 = load i64, i64* %236, align 8, !tbaa !233
  %238 = icmp eq i64 %237, 0
  br i1 %238, label %274, label %239

; <label>:239:                                    ; preds = %234
  %240 = inttoptr i64 %224 to i8*
  %241 = call i8* @halide_string_to_string(i8* %240, i8* nonnull %6, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25.193, i64 0, i64 0)) #12
  %242 = load i64, i64* %236, align 8, !tbaa !233
  %243 = call i8* @halide_uint64_to_string(i8* %241, i8* nonnull %6, i64 %242, i32 1) #12
  %244 = ptrtoint i8* %243 to i64
  %245 = sub i64 %244, %5
  %246 = icmp ult i64 %245, %225
  br i1 %246, label %.preheader47, label %.loopexit1

.preheader47:                                     ; preds = %239
  br label %247

; <label>:247:                                    ; preds = %247, %.preheader47
  %248 = phi i8* [ %249, %247 ], [ %243, %.preheader47 ]
  %249 = call i8* @halide_string_to_string(i8* %248, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #12
  %250 = ptrtoint i8* %249 to i64
  %251 = sub i64 %250, %5
  %252 = icmp ult i64 %251, %225
  br i1 %252, label %247, label %.loopexit1

.loopexit1:                                       ; preds = %247, %239
  %253 = phi i8* [ %243, %239 ], [ %249, %247 ]
  %254 = call i8* @halide_string_to_string(i8* %253, i8* nonnull %6, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.26.194, i64 0, i64 0)) #12
  %255 = load i32, i32* %226, align 8, !tbaa !231
  %256 = sext i32 %255 to i64
  %257 = call i8* @halide_int64_to_string(i8* %254, i8* nonnull %6, i64 %256, i32 1) #12
  %258 = add nuw nsw i64 %225, 15
  %259 = ptrtoint i8* %257 to i64
  %260 = sub i64 %259, %5
  %261 = icmp ult i64 %260, %258
  br i1 %261, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %.loopexit1
  br label %262

; <label>:262:                                    ; preds = %262, %.preheader
  %263 = phi i8* [ %264, %262 ], [ %257, %.preheader ]
  %264 = call i8* @halide_string_to_string(i8* %263, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20.188, i64 0, i64 0)) #12
  %265 = ptrtoint i8* %264 to i64
  %266 = sub i64 %265, %5
  %267 = icmp ult i64 %266, %258
  br i1 %267, label %262, label %.loopexit

.loopexit:                                        ; preds = %262, %.loopexit1
  %268 = phi i8* [ %257, %.loopexit1 ], [ %264, %262 ]
  %269 = call i8* @halide_string_to_string(i8* %268, i8* nonnull %6, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27.195, i64 0, i64 0)) #12
  %270 = shl i64 %235, 32
  %271 = ashr exact i64 %270, 32
  %272 = call i8* @halide_int64_to_string(i8* %269, i8* nonnull %6, i64 %271, i32 1) #12
  %273 = ptrtoint i8* %272 to i64
  br label %274

; <label>:274:                                    ; preds = %.loopexit, %234
  %275 = phi i64 [ %224, %234 ], [ %273, %.loopexit ]
  %276 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %113, i64 %112, i32 4
  %277 = load i64, i64* %276, align 8, !tbaa !225
  %278 = icmp eq i64 %277, 0
  br i1 %278, label %285, label %279

; <label>:279:                                    ; preds = %274
  %280 = inttoptr i64 %275 to i8*
  %281 = call i8* @halide_string_to_string(i8* %280, i8* nonnull %6, i8* nonnull getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28.196, i64 0, i64 0)) #12
  %282 = load i64, i64* %276, align 8, !tbaa !225
  %283 = call i8* @halide_uint64_to_string(i8* %281, i8* nonnull %6, i64 %282, i32 1) #12
  %284 = ptrtoint i8* %283 to i64
  br label %285

; <label>:285:                                    ; preds = %279, %274
  %286 = phi i64 [ %275, %274 ], [ %284, %279 ]
  %287 = inttoptr i64 %286 to i8*
  %288 = call i8* @halide_string_to_string(i8* %287, i8* nonnull %6, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7.175, i64 0, i64 0)) #12
  %289 = ptrtoint i8* %288 to i64
  %290 = add i64 %10, %289
  call void @halide_msan_annotate_memory_is_initialized(i8* %0, i8* nonnull %4, i64 %290) #12
  call void @halide_print(i8* %0, i8* nonnull %4) #12
  %291 = load i32, i32* %105, align 8, !tbaa !223
  br label %292

; <label>:292:                                    ; preds = %285, %116
  %293 = phi i32 [ %111, %116 ], [ %291, %285 ]
  %294 = phi i64 [ %5, %116 ], [ %289, %285 ]
  %295 = add nuw nsw i64 %112, 1
  %296 = sext i32 %293 to i64
  %297 = icmp slt i64 %295, %296
  br i1 %297, label %110, label %.loopexit6

.loopexit6:                                       ; preds = %292, %.loopexit7, %97, %89, %13
  %298 = phi i64 [ %15, %13 ], [ %81, %.loopexit7 ], [ %81, %89 ], [ %294, %292 ], [ %81, %97 ]
  %299 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 8
  %300 = bitcast i8** %299 to %struct.halide_profiler_pipeline_stats**
  %301 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %300, align 8, !tbaa !7
  %302 = icmp eq %struct.halide_profiler_pipeline_stats* %301, null
  br i1 %302, label %.loopexit9, label %13
}

; Function Attrs: nounwind
define weak void @halide_profiler_reset_unlocked(%struct.halide_profiler_state*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %0, i64 0, i32 5
  %3 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %2, align 8, !tbaa !234
  %4 = icmp eq %struct.halide_profiler_pipeline_stats* %3, null
  br i1 %4, label %.loopexit, label %5

; <label>:5:                                      ; preds = %1
  %6 = bitcast %struct.halide_profiler_pipeline_stats** %2 to i64*
  br label %7

; <label>:7:                                      ; preds = %7, %5
  %8 = phi %struct.halide_profiler_pipeline_stats* [ %3, %5 ], [ %16, %7 ]
  %9 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 8
  %10 = bitcast i8** %9 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !235
  store i64 %11, i64* %6, align 8, !tbaa !234
  %12 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 7
  %13 = bitcast %struct.halide_profiler_func_stats** %12 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !224
  tail call void @free(i8* %14) #12
  %15 = bitcast %struct.halide_profiler_pipeline_stats* %8 to i8*
  tail call void @free(i8* %15) #12
  %16 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %2, align 8, !tbaa !234
  %17 = icmp eq %struct.halide_profiler_pipeline_stats* %16, null
  br i1 %17, label %.loopexit, label %7

.loopexit:                                        ; preds = %7, %1
  %18 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %0, i64 0, i32 2
  store i32 0, i32* %18, align 4, !tbaa !236
  ret void
}

; Function Attrs: nounwind
define linkonce %struct.halide_profiler_pipeline_stats* @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy(i8*, i32, i64*) local_unnamed_addr #0 {
  %4 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %5 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 5
  %6 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %5, align 8, !tbaa !7
  %7 = icmp eq %struct.halide_profiler_pipeline_stats* %6, null
  br i1 %7, label %.loopexit2, label %.preheader

.preheader:                                       ; preds = %3
  br label %8

; <label>:8:                                      ; preds = %17, %.preheader
  %9 = phi %struct.halide_profiler_pipeline_stats* [ %20, %17 ], [ %6, %.preheader ]
  %10 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %9, i64 0, i32 6
  %11 = load i8*, i8** %10, align 8, !tbaa !218
  %12 = icmp eq i8* %11, %0
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %8
  %14 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %9, i64 0, i32 9
  %15 = load i32, i32* %14, align 8, !tbaa !223
  %16 = icmp eq i32 %15, %1
  br i1 %16, label %.loopexit1, label %17

; <label>:17:                                     ; preds = %13, %8
  %18 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %9, i64 0, i32 8
  %19 = bitcast i8** %18 to %struct.halide_profiler_pipeline_stats**
  %20 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %19, align 8, !tbaa !7
  %21 = icmp eq %struct.halide_profiler_pipeline_stats* %20, null
  br i1 %21, label %.loopexit2, label %8

.loopexit2:                                       ; preds = %17, %3
  %22 = tail call i8* @malloc(i64 96) #12
  %23 = bitcast i8* %22 to %struct.halide_profiler_pipeline_stats*
  %24 = icmp eq i8* %22, null
  br i1 %24, label %.loopexit1, label %25

; <label>:25:                                     ; preds = %.loopexit2
  %26 = bitcast %struct.halide_profiler_pipeline_stats** %5 to i64*
  %27 = load i64, i64* %26, align 8, !tbaa !234
  %28 = getelementptr inbounds i8, i8* %22, i64 64
  %29 = bitcast i8* %28 to i64*
  store i64 %27, i64* %29, align 8, !tbaa !235
  %30 = getelementptr inbounds i8, i8* %22, i64 48
  %31 = bitcast i8* %30 to i8**
  store i8* %0, i8** %31, align 8, !tbaa !218
  %32 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 2
  %33 = load i32, i32* %32, align 4, !tbaa !236
  %34 = getelementptr inbounds i8, i8* %22, i64 76
  %35 = bitcast i8* %34 to i32*
  store i32 %33, i32* %35, align 4, !tbaa !237
  %36 = getelementptr inbounds i8, i8* %22, i64 72
  %37 = bitcast i8* %36 to i32*
  store i32 %1, i32* %37, align 8, !tbaa !223
  %38 = getelementptr inbounds i8, i8* %22, i64 80
  %39 = bitcast i8* %38 to i32*
  store i32 0, i32* %39, align 8, !tbaa !215
  %40 = getelementptr inbounds i8, i8* %22, i64 84
  %41 = bitcast i8* %40 to i32*
  store i32 0, i32* %41, align 4, !tbaa !219
  %42 = getelementptr inbounds i8, i8* %22, i64 88
  %43 = bitcast i8* %42 to i32*
  store i32 0, i32* %43, align 8, !tbaa !220
  %44 = sext i32 %1 to i64
  %45 = mul nsw i64 %44, 72
  call void @llvm.memset.p0i8.i64(i8* nonnull %22, i8 0, i64 48, i32 8, i1 false)
  %46 = tail call i8* @malloc(i64 %45) #12
  %47 = getelementptr inbounds i8, i8* %22, i64 56
  %48 = bitcast i8* %47 to i8**
  store i8* %46, i8** %48, align 8, !tbaa !224
  %49 = icmp eq i8* %46, null
  %50 = bitcast i8* %46 to %struct.halide_profiler_func_stats*
  br i1 %49, label %51, label %52

; <label>:51:                                     ; preds = %25
  tail call void @free(i8* nonnull %22) #12
  br label %.loopexit1

; <label>:52:                                     ; preds = %25
  %53 = icmp sgt i32 %1, 0
  br i1 %53, label %54, label %.loopexit

; <label>:54:                                     ; preds = %52
  %55 = zext i32 %1 to i64
  br label %59

.loopexit:                                        ; preds = %59, %52
  %56 = load i32, i32* %32, align 4, !tbaa !236
  %57 = add nsw i32 %56, %1
  store i32 %57, i32* %32, align 4, !tbaa !236
  %58 = bitcast %struct.halide_profiler_pipeline_stats** %5 to i8**
  store i8* %22, i8** %58, align 8, !tbaa !234
  br label %.loopexit1

; <label>:59:                                     ; preds = %59, %54
  %60 = phi i64 [ 0, %54 ], [ %68, %59 ]
  %61 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %50, i64 %60, i32 0
  store i64 0, i64* %61, align 8, !tbaa !227
  %62 = getelementptr inbounds i64, i64* %2, i64 %60
  %63 = load i64, i64* %62, align 8, !tbaa !89
  %64 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %50, i64 %60, i32 7
  %65 = bitcast i8** %64 to i64*
  store i64 %63, i64* %65, align 8, !tbaa !228
  %66 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %50, i64 %60, i32 1
  %67 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %50, i64 %60, i32 8
  store i32 0, i32* %67, align 8, !tbaa !231
  %68 = add nuw nsw i64 %60, 1
  %69 = icmp eq i64 %68, %55
  %70 = bitcast i64* %66 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %70, i8 0, i64 48, i32 8, i1 false)
  br i1 %69, label %.loopexit, label %59

.loopexit1:                                       ; preds = %.loopexit, %51, %.loopexit2, %13
  %71 = phi %struct.halide_profiler_pipeline_stats* [ %23, %.loopexit ], [ null, %51 ], [ null, %.loopexit2 ], [ %9, %13 ]
  ret %struct.halide_profiler_pipeline_stats* %71
}

; Function Attrs: norecurse nounwind
define linkonce void @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi(%struct.halide_profiler_state*, i32, i64, i32) local_unnamed_addr #2 {
  %5 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %0, i64 0, i32 5
  %6 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %5, align 8, !tbaa !7
  %7 = icmp eq %struct.halide_profiler_pipeline_stats* %6, null
  %8 = ptrtoint %struct.halide_profiler_pipeline_stats* %6 to i64
  br i1 %7, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %4
  br label %9

; <label>:9:                                      ; preds = %57, %.preheader
  %10 = phi %struct.halide_profiler_pipeline_stats* [ %60, %57 ], [ %6, %.preheader ]
  %11 = phi %struct.halide_profiler_pipeline_stats* [ %10, %57 ], [ null, %.preheader ]
  %12 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 10
  %13 = load i32, i32* %12, align 4, !tbaa !237
  %14 = icmp sgt i32 %13, %1
  br i1 %14, label %57, label %15

; <label>:15:                                     ; preds = %9
  %16 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 9
  %17 = load i32, i32* %16, align 8, !tbaa !223
  %18 = add nsw i32 %17, %13
  %19 = icmp sgt i32 %18, %1
  br i1 %19, label %20, label %57

; <label>:20:                                     ; preds = %15
  %21 = icmp eq %struct.halide_profiler_pipeline_stats* %11, null
  br i1 %21, label %28, label %22

; <label>:22:                                     ; preds = %20
  %23 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 8
  %24 = bitcast i8** %23 to i64*
  %25 = load i64, i64* %24, align 8, !tbaa !235
  %26 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %11, i64 0, i32 8
  %27 = bitcast i8** %26 to i64*
  store i64 %25, i64* %27, align 8, !tbaa !235
  store i64 %8, i64* %24, align 8, !tbaa !235
  store %struct.halide_profiler_pipeline_stats* %10, %struct.halide_profiler_pipeline_stats** %5, align 8, !tbaa !234
  br label %28

; <label>:28:                                     ; preds = %22, %20
  %29 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 7
  %30 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %29, align 8, !tbaa !224
  %31 = sext i32 %1 to i64
  %32 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %30, i64 %31
  %33 = sext i32 %13 to i64
  %34 = sub nsw i64 0, %33
  %35 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %32, i64 %34
  %36 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %35, i64 0, i32 0
  %37 = load i64, i64* %36, align 8, !tbaa !227
  %38 = add i64 %37, %2
  store i64 %38, i64* %36, align 8, !tbaa !227
  %39 = sext i32 %3 to i64
  %40 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %35, i64 0, i32 5
  %41 = bitcast i64* %40 to <2 x i64>*
  %42 = load <2 x i64>, <2 x i64>* %41, align 8, !tbaa !89
  %43 = insertelement <2 x i64> <i64 undef, i64 1>, i64 %39, i32 0
  %44 = add <2 x i64> %42, %43
  %45 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> %44, <2 x i64>* %45, align 8, !tbaa !89
  %46 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 0
  %47 = load i64, i64* %46, align 8, !tbaa !213
  %48 = add i64 %47, %2
  store i64 %48, i64* %46, align 8, !tbaa !213
  %49 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 12
  %50 = load i32, i32* %49, align 4, !tbaa !219
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %49, align 4, !tbaa !219
  %52 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 4
  %53 = bitcast i64* %52 to <2 x i64>*
  %54 = load <2 x i64>, <2 x i64>* %53, align 8, !tbaa !89
  %55 = add <2 x i64> %54, %43
  %56 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> %55, <2 x i64>* %56, align 8, !tbaa !89
  br label %.loopexit

; <label>:57:                                     ; preds = %15, %9
  %58 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %10, i64 0, i32 8
  %59 = bitcast i8** %58 to %struct.halide_profiler_pipeline_stats**
  %60 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %59, align 8, !tbaa !7
  %61 = icmp eq %struct.halide_profiler_pipeline_stats* %60, null
  br i1 %61, label %.loopexit, label %9

.loopexit:                                        ; preds = %57, %28, %4
  ret void
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %5 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %5) #12
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 3
  %7 = load i32, i32* %6, align 8, !tbaa !212
  %8 = icmp eq i32 %7, -2
  br i1 %8, label %.loopexit, label %9

; <label>:9:                                      ; preds = %1
  %10 = bitcast i32* %2 to i8*
  %11 = bitcast i32* %3 to i8*
  %12 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 6
  %13 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 4
  %14 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %4, i64 0, i32 1
  br label %15

; <label>:15:                                     ; preds = %36, %9
  %16 = call i64 @halide_current_time_ns(i8* null) #12
  br label %17

; <label>:17:                                     ; preds = %34, %15
  %18 = phi i64 [ %16, %15 ], [ %26, %34 ]
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #10
  %19 = load void (i32*, i32*)*, void (i32*, i32*)** %12, align 8, !tbaa !238
  %20 = icmp eq void (i32*, i32*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %17
  call void %19(i32* nonnull %2, i32* nonnull %3) #12
  br label %25

; <label>:22:                                     ; preds = %17
  %23 = load i32, i32* %6, align 8, !tbaa !212
  store i32 %23, i32* %2, align 4, !tbaa !99
  %24 = load i32, i32* %13, align 4, !tbaa !239
  store i32 %24, i32* %3, align 4, !tbaa !99
  br label %25

; <label>:25:                                     ; preds = %22, %21
  %26 = call i64 @halide_current_time_ns(i8* null) #12
  %27 = load i32, i32* %2, align 4, !tbaa !99
  %28 = icmp eq i32 %27, -2
  br i1 %28, label %36, label %29

; <label>:29:                                     ; preds = %25
  %30 = icmp sgt i32 %27, -1
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %29
  %32 = sub i64 %26, %18
  %33 = load i32, i32* %3, align 4, !tbaa !99
  call void @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi(%struct.halide_profiler_state* nonnull %4, i32 %27, i64 %32, i32 %33) #13
  br label %34

; <label>:34:                                     ; preds = %31, %29
  %35 = load i32, i32* %14, align 8, !tbaa !240
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %5) #12
  call void @halide_sleep_ms(i8* null, i32 %35) #12
  call void @halide_mutex_lock(%struct.halide_mutex* nonnull %5) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #10
  br label %17

; <label>:36:                                     ; preds = %25
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #10
  %37 = load i32, i32* %6, align 8, !tbaa !212
  %38 = icmp eq i32 %37, -2
  br i1 %38, label %.loopexit, label %15

.loopexit:                                        ; preds = %36, %1
  call void @halide_mutex_unlock(%struct.halide_mutex* nonnull %5) #12
  ret void
}

; Function Attrs: nounwind
define weak %struct.halide_profiler_pipeline_stats* @halide_profiler_get_pipeline_state(i8*) local_unnamed_addr #0 {
  %2 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %3 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %3) #12
  %4 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 5
  %5 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %4, align 8, !tbaa !7
  %6 = icmp eq %struct.halide_profiler_pipeline_stats* %5, null
  br i1 %6, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %1
  br label %7

; <label>:7:                                      ; preds = %12, %.preheader
  %8 = phi %struct.halide_profiler_pipeline_stats* [ %15, %12 ], [ %5, %.preheader ]
  %9 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 6
  %10 = load i8*, i8** %9, align 8, !tbaa !218
  %11 = icmp eq i8* %10, %0
  br i1 %11, label %.loopexit, label %12

; <label>:12:                                     ; preds = %7
  %13 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %8, i64 0, i32 8
  %14 = bitcast i8** %13 to %struct.halide_profiler_pipeline_stats**
  %15 = load %struct.halide_profiler_pipeline_stats*, %struct.halide_profiler_pipeline_stats** %14, align 8, !tbaa !7
  %16 = icmp eq %struct.halide_profiler_pipeline_stats* %15, null
  br i1 %16, label %.loopexit, label %7

.loopexit:                                        ; preds = %12, %7, %1
  %17 = phi %struct.halide_profiler_pipeline_stats* [ null, %1 ], [ %8, %7 ], [ null, %12 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %3) #12
  ret %struct.halide_profiler_pipeline_stats* %17
}

; Function Attrs: nounwind
define weak i32 @halide_profiler_pipeline_start(i8*, i8*, i32, i64*) local_unnamed_addr #0 {
  %5 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %6 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %5, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %6) #12
  %7 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %5, i64 0, i32 7
  %8 = load %struct.halide_thread*, %struct.halide_thread** %7, align 8, !tbaa !210
  %9 = icmp eq %struct.halide_thread* %8, null
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %4
  %11 = tail call i32 @halide_start_clock(i8* %0) #12
  %12 = tail call %struct.halide_thread* @halide_spawn_thread(void (i8*)* nonnull @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, i8* null) #12
  store %struct.halide_thread* %12, %struct.halide_thread** %7, align 8, !tbaa !210
  br label %13

; <label>:13:                                     ; preds = %10, %4
  %14 = tail call %struct.halide_profiler_pipeline_stats* @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy(i8* %1, i32 %2, i64* %3) #13
  %15 = icmp eq %struct.halide_profiler_pipeline_stats* %14, null
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %13
  %17 = tail call i32 @halide_error_out_of_memory(i8* %0) #12
  br label %24

; <label>:18:                                     ; preds = %13
  %19 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 11
  %20 = load i32, i32* %19, align 8, !tbaa !215
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %19, align 8, !tbaa !215
  %22 = getelementptr inbounds %struct.halide_profiler_pipeline_stats, %struct.halide_profiler_pipeline_stats* %14, i64 0, i32 10
  %23 = load i32, i32* %22, align 4, !tbaa !237
  br label %24

; <label>:24:                                     ; preds = %18, %16
  %25 = phi i32 [ %23, %18 ], [ %17, %16 ]
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %6) #12
  ret i32 %25
}

; Function Attrs: nounwind
define weak void @halide_profiler_stack_peak_update(i8*, i8*, i64*) local_unnamed_addr #0 {
  %4 = icmp eq i8* %1, null
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %3
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.197, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %6

; <label>:6:                                      ; preds = %5, %3
  %7 = getelementptr inbounds i8, i8* %1, i64 72
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 8, !tbaa !223
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %.loopexit

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds i8, i8* %1, i64 56
  %13 = bitcast i8* %12 to %struct.halide_profiler_func_stats**
  br label %14

.loopexit:                                        ; preds = %34, %6
  ret void

; <label>:14:                                     ; preds = %34, %11
  %15 = phi i32 [ %9, %11 ], [ %35, %34 ]
  %16 = phi i64 [ 0, %11 ], [ %36, %34 ]
  %17 = getelementptr inbounds i64, i64* %2, i64 %16
  %18 = load i64, i64* %17, align 8, !tbaa !89
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %34, label %20

; <label>:20:                                     ; preds = %14
  %21 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %13, align 8, !tbaa !224
  %22 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %16, i32 4
  %23 = load i64, i64* %22, align 8, !tbaa !89
  %24 = icmp ult i64 %23, %18
  br i1 %24, label %.preheader, label %34

.preheader:                                       ; preds = %20
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader
  %26 = phi i64 [ %28, %25 ], [ %23, %.preheader ]
  %27 = cmpxchg i64* %22, i64 %26, i64 %18 seq_cst seq_cst
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = icmp ne i64 %26, %28
  %30 = icmp ult i64 %28, %18
  %31 = and i1 %29, %30
  br i1 %31, label %25, label %32

; <label>:32:                                     ; preds = %25
  %33 = load i32, i32* %8, align 8, !tbaa !223
  br label %34

; <label>:34:                                     ; preds = %32, %20, %14
  %35 = phi i32 [ %33, %32 ], [ %15, %20 ], [ %15, %14 ]
  %36 = add nuw nsw i64 %16, 1
  %37 = sext i32 %35 to i64
  %38 = icmp slt i64 %36, %37
  br i1 %38, label %14, label %.loopexit
}

; Function Attrs: nounwind
define weak void @halide_profiler_memory_allocate(i8*, i8*, i32, i64) local_unnamed_addr #0 {
  %5 = icmp eq i64 %3, 0
  br i1 %5, label %.loopexit, label %6

; <label>:6:                                      ; preds = %4
  %7 = icmp eq i8* %1, null
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %6
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.1.198, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %9

; <label>:9:                                      ; preds = %8, %6
  %10 = icmp sgt i32 %2, -1
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @.str.2.199, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %12

; <label>:12:                                     ; preds = %11, %9
  %13 = getelementptr inbounds i8, i8* %1, i64 72
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 8, !tbaa !223
  %16 = icmp sgt i32 %15, %2
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %12
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([144 x i8], [144 x i8]* @.str.3.200, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %18

; <label>:18:                                     ; preds = %17, %12
  %19 = getelementptr inbounds i8, i8* %1, i64 56
  %20 = bitcast i8* %19 to %struct.halide_profiler_func_stats**
  %21 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %20, align 8, !tbaa !224
  %22 = sext i32 %2 to i64
  %23 = getelementptr inbounds i8, i8* %1, i64 88
  %24 = bitcast i8* %23 to i32*
  %25 = atomicrmw add i32* %24, i32 1 seq_cst
  %26 = getelementptr inbounds i8, i8* %1, i64 24
  %27 = bitcast i8* %26 to i64*
  %28 = atomicrmw add i64* %27, i64 %3 seq_cst
  %29 = getelementptr inbounds i8, i8* %1, i64 8
  %30 = bitcast i8* %29 to i64*
  %31 = atomicrmw add i64* %30, i64 %3 seq_cst
  %32 = add i64 %31, %3
  %33 = getelementptr inbounds i8, i8* %1, i64 16
  %34 = bitcast i8* %33 to i64*
  %35 = load i64, i64* %34, align 8, !tbaa !89
  %36 = icmp ult i64 %35, %32
  br i1 %36, label %.preheader2, label %.loopexit1

.preheader2:                                      ; preds = %18
  br label %37

; <label>:37:                                     ; preds = %37, %.preheader2
  %38 = phi i64 [ %40, %37 ], [ %35, %.preheader2 ]
  %39 = cmpxchg i64* %34, i64 %38, i64 %32 seq_cst seq_cst
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = icmp ne i64 %38, %40
  %42 = icmp ult i64 %40, %32
  %43 = and i1 %41, %42
  br i1 %43, label %37, label %.loopexit1

.loopexit1:                                       ; preds = %37, %18
  %44 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 8
  %45 = atomicrmw add i32* %44, i32 1 seq_cst
  %46 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 3
  %47 = atomicrmw add i64* %46, i64 %3 seq_cst
  %48 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 1
  %49 = atomicrmw add i64* %48, i64 %3 seq_cst
  %50 = add i64 %49, %3
  %51 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 2
  %52 = load i64, i64* %51, align 8, !tbaa !89
  %53 = icmp ult i64 %52, %50
  br i1 %53, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %.loopexit1
  br label %54

; <label>:54:                                     ; preds = %54, %.preheader
  %55 = phi i64 [ %57, %54 ], [ %52, %.preheader ]
  %56 = cmpxchg i64* %51, i64 %55, i64 %50 seq_cst seq_cst
  %57 = extractvalue { i64, i1 } %56, 0
  %58 = icmp ne i64 %55, %57
  %59 = icmp ult i64 %57, %50
  %60 = and i1 %58, %59
  br i1 %60, label %54, label %.loopexit

.loopexit:                                        ; preds = %54, %.loopexit1, %4
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_memory_free(i8*, i8*, i32, i64) local_unnamed_addr #0 {
  %5 = icmp eq i64 %3, 0
  br i1 %5, label %28, label %6

; <label>:6:                                      ; preds = %4
  %7 = icmp eq i8* %1, null
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %6
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.4.201, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %9

; <label>:9:                                      ; preds = %8, %6
  %10 = icmp sgt i32 %2, -1
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %9
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @.str.5.202, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %12

; <label>:12:                                     ; preds = %11, %9
  %13 = getelementptr inbounds i8, i8* %1, i64 72
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 8, !tbaa !223
  %16 = icmp sgt i32 %15, %2
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %12
  tail call void @halide_print(i8* %0, i8* getelementptr inbounds ([144 x i8], [144 x i8]* @.str.6.203, i64 0, i64 0)) #12
  tail call void @abort() #12
  br label %18

; <label>:18:                                     ; preds = %17, %12
  %19 = getelementptr inbounds i8, i8* %1, i64 56
  %20 = bitcast i8* %19 to %struct.halide_profiler_func_stats**
  %21 = load %struct.halide_profiler_func_stats*, %struct.halide_profiler_func_stats** %20, align 8, !tbaa !224
  %22 = sext i32 %2 to i64
  %23 = getelementptr inbounds i8, i8* %1, i64 8
  %24 = bitcast i8* %23 to i64*
  %25 = atomicrmw sub i64* %24, i64 %3 seq_cst
  %26 = getelementptr inbounds %struct.halide_profiler_func_stats, %struct.halide_profiler_func_stats* %21, i64 %22, i32 1
  %27 = atomicrmw sub i64* %26, i64 %3 seq_cst
  br label %28

; <label>:28:                                     ; preds = %18, %4
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_report(i8*) local_unnamed_addr #0 {
  %2 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %3 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %2, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %3) #12
  tail call void @halide_profiler_report_unlocked(i8* %0, %struct.halide_profiler_state* %2) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %3) #12
  ret void
}

; Function Attrs: nounwind
define weak void @halide_profiler_reset() local_unnamed_addr #0 {
  %1 = tail call %struct.halide_profiler_state* @halide_profiler_get_state() #13
  %2 = getelementptr inbounds %struct.halide_profiler_state, %struct.halide_profiler_state* %1, i64 0, i32 0
  tail call void @halide_mutex_lock(%struct.halide_mutex* %2) #12
  tail call void @halide_profiler_reset_unlocked(%struct.halide_profiler_state* %1) #13
  tail call void @halide_mutex_unlock(%struct.halide_mutex* %2) #12
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_profiler_pipeline_end(i8*, i8*) local_unnamed_addr #2 {
  %3 = getelementptr inbounds i8, i8* %1, i64 16
  %4 = bitcast i8* %3 to i32*
  store i32 -1, i32* %4, align 8, !tbaa !212
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_msan_annotate_memory_is_initialized(i8*, i8*, i64) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_msan_annotate_buffer_is_initialized(i8*, %struct.halide_buffer_t*) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: norecurse nounwind
define weak void @halide_msan_annotate_buffer_is_initialized_as_destructor(i8*, i8*) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nounwind
define weak i32 @halide_default_can_use_target_features(i32, i64*) #0 {
  %3 = alloca %"struct.Halide::Runtime::Internal::CpuFeatures", align 8
  %4 = load i1, i1* @_ZZ38halide_default_can_use_target_featuresE11initialized, align 1
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %2
  %6 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #10
  call void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* nonnull sret %3) #12
  %7 = call i8* @memcpy(i8* bitcast ([2 x i64]* @_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage to i8*), i8* nonnull %6, i64 16) #12
  store i1 true, i1* @_ZZ38halide_default_can_use_target_featuresE11initialized, align 1
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #10
  br label %8

; <label>:8:                                      ; preds = %5, %2
  %9 = icmp eq i32 %0, 1
  br i1 %9, label %11, label %10

; <label>:10:                                     ; preds = %8
  call void @halide_error(i8* null, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.208, i64 0, i64 0)) #12
  br label %11

; <label>:11:                                     ; preds = %10, %8
  %12 = load i64, i64* %1, align 8, !tbaa !89
  %13 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage, i64 0, i64 0), align 8, !tbaa !89
  %14 = and i64 %13, %12
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %20, label %16

; <label>:16:                                     ; preds = %11
  %17 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @_ZZ38halide_default_can_use_target_featuresE20cpu_features_storage, i64 0, i64 1), align 8, !tbaa !89
  %18 = and i64 %17, %14
  %19 = icmp eq i64 %18, %14
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %16, %11
  br label %21

; <label>:21:                                     ; preds = %20, %16
  %22 = phi i32 [ 0, %16 ], [ 1, %20 ]
  ret i32 %22
}

; Function Attrs: norecurse nounwind
define weak i32 (i32, i64*)* @halide_set_custom_can_use_target_features(i32 (i32, i64*)*) local_unnamed_addr #2 {
  %2 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !7
  store i32 (i32, i64*)* %0, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !7
  ret i32 (i32, i64*)* %2
}

; Function Attrs: nounwind
define weak i32 @halide_can_use_target_features(i32, i64*) local_unnamed_addr #0 {
  %3 = load i32 (i32, i64*)*, i32 (i32, i64*)** @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, align 8, !tbaa !7
  %4 = tail call i32 %3(i32 %0, i64* %1) #12
  ret i32 %4
}

; Function Attrs: nounwind
define linkonce void @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv(%"struct.Halide::Runtime::Internal::CpuFeatures"* noalias sret) local_unnamed_addr #0 {
  %2 = alloca [4 x i32], align 4
  %3 = alloca [4 x i32], align 4
  %4 = getelementptr inbounds %"struct.Halide::Runtime::Internal::CpuFeatures", %"struct.Halide::Runtime::Internal::CpuFeatures"* %0, i64 0, i32 1, i64 0
  %5 = bitcast %"struct.Halide::Runtime::Internal::CpuFeatures"* %0 to <2 x i64>*
  store <2 x i64> <i64 2061584302832, i64 0>, <2 x i64>* %5, align 8, !tbaa !89
  %6 = bitcast [4 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #10
  %7 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 0
  store i32 1, i32* %7, align 4, !tbaa !99
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, 0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %7) #10
  %8 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 2
  %9 = load i32, i32* %8, align 4, !tbaa !99
  %10 = and i32 %9, 4096
  %11 = icmp eq i32 %10, 0
  %12 = lshr i32 %9, 15
  %13 = and i32 %12, 16
  %14 = lshr i32 %9, 23
  %15 = and i32 %14, 32
  %16 = or i32 %15, %13
  %17 = lshr i32 %9, 20
  %18 = and i32 %17, 512
  %19 = or i32 %16, %18
  %20 = zext i32 %19 to i64
  %21 = or i64 %20, 128
  %22 = select i1 %11, i64 %20, i64 %21
  %23 = and i32 %9, 805830656
  %24 = icmp ne i32 %23, 0
  %25 = xor i1 %11, true
  %26 = or i1 %24, %25
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %1
  store i64 %22, i64* %4, align 8, !tbaa !89
  br label %28

; <label>:28:                                     ; preds = %27, %1
  %29 = and i32 %9, 1879048192
  %30 = icmp eq i32 %29, 1879048192
  br i1 %30, label %31, label %58

; <label>:31:                                     ; preds = %28
  %32 = bitcast [4 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %32) #10
  %33 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  store i32 7, i32* %33, align 4, !tbaa !99
  call void asm sideeffect inteldialect "xchg ebx, esi\0A\09mov eax, dword ptr $$0 $0\0A\09mov ecx, 0\0A\09cpuid\0A\09mov dword ptr $$0 $0, eax\0A\09mov dword ptr $$4 $0, ebx\0A\09mov dword ptr $$8 $0, ecx\0A\09mov dword ptr $$12 $0, edx\0A\09xchg ebx, esi", "=*m,~{eax},~{ebx},~{ecx},~{edx},~{esi},~{dirflag},~{fpsr},~{flags}"(i32* nonnull %33) #10
  %34 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 1
  %35 = load i32, i32* %34, align 4, !tbaa !99
  %36 = and i32 %35, 32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %40, label %38

; <label>:38:                                     ; preds = %31
  %39 = or i64 %22, 64
  store i64 %39, i64* %4, align 8, !tbaa !89
  br label %40

; <label>:40:                                     ; preds = %38, %31
  %41 = phi i64 [ %22, %31 ], [ %39, %38 ]
  %42 = and i32 %35, 268500992
  %43 = icmp eq i32 %42, 268500992
  br i1 %43, label %44, label %57

; <label>:44:                                     ; preds = %40
  %45 = and i32 %35, 469827584
  %46 = icmp eq i32 %45, 469827584
  %47 = select i1 %46, i64 412316860416, i64 137438953472
  %48 = or i64 %41, %47
  %49 = and i32 %35, -805109760
  %50 = icmp eq i32 %49, -805109760
  %51 = or i64 %48, 549755813888
  %52 = select i1 %50, i64 %51, i64 %48
  store i64 %52, i64* %4, align 8, !tbaa !89
  %53 = and i32 %35, -803012608
  %54 = icmp eq i32 %53, -803012608
  br i1 %54, label %55, label %57

; <label>:55:                                     ; preds = %44
  %56 = or i64 %52, 1099511627776
  store i64 %56, i64* %4, align 8, !tbaa !89
  br label %57

; <label>:57:                                     ; preds = %55, %44, %40
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %32) #10
  br label %58

; <label>:58:                                     ; preds = %57, %28
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #10
  ret void
}

declare void @abort() local_unnamed_addr #4

; Function Attrs: nounwind
define i32 @dilate3x3_batch_02_sample_14(%struct.halide_buffer_t* noalias %input.buffer, %struct.halide_buffer_t* noalias %output.buffer) local_unnamed_addr #8 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca %closure_t, align 8
  %3 = alloca [8 x i32], align 4
  %4 = alloca [8 x i32], align 4
  %5 = icmp eq %struct.halide_buffer_t* %output.buffer, null
  br i1 %5, label %"assert failed", label %"assert succeeded", !prof !241

"assert failed":                                  ; preds = %entry
  %6 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0)) #10
  br label %destructor_block

"assert succeeded":                               ; preds = %entry
  %7 = icmp eq %struct.halide_buffer_t* %input.buffer, null
  br i1 %7, label %"assert failed1", label %"assert succeeded2", !prof !241

destructor_block:                                 ; preds = %"produce output", %_halide_buffer_is_bounds_query.exit54, %"assert failed9", %"assert failed7", %"assert failed5", %"assert failed3", %"assert failed1", %"assert failed"
  %8 = phi i32 [ %6, %"assert failed" ], [ %9, %"assert failed1" ], [ %78, %"assert failed3" ], [ %81, %"assert failed5" ], [ %90, %"assert failed7" ], [ %96, %"assert failed9" ], [ 0, %_halide_buffer_is_bounds_query.exit54 ], [ %351, %"produce output" ]
  ret i32 %8

"assert failed1":                                 ; preds = %"assert succeeded"
  %9 = tail call i32 @halide_error_buffer_argument_is_null(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0)) #10
  br label %destructor_block

"assert succeeded2":                              ; preds = %"assert succeeded"
  %10 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !151
  %12 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #10
  %13 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 4, i32 0
  %14 = call i8* @memcpy(i8* nonnull %12, i8* nonnull %13, i64 4) #12
  %15 = load i32, i32* %1, align 4, !tbaa !99
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #10
  %16 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 5
  %17 = load i32, i32* %16, align 4, !tbaa !134
  %18 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 6
  %19 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %18, align 8, !tbaa !136
  %20 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %19, i64 0, i32 0
  %21 = load i32, i32* %20, align 4, !tbaa !140
  %22 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %19, i64 0, i32 1
  %23 = load i32, i32* %22, align 4, !tbaa !138
  %24 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %19, i64 0, i32 2
  %25 = load i32, i32* %24, align 4, !tbaa !141
  %26 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %19, i64 1, i32 0
  %27 = load i32, i32* %26, align 4, !tbaa !140
  %28 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %19, i64 1, i32 1
  %29 = load i32, i32* %28, align 4, !tbaa !138
  %30 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %19, i64 1, i32 2
  %31 = load i32, i32* %30, align 4, !tbaa !141
  %32 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 2
  %33 = load i8*, i8** %32, align 8, !tbaa !151
  %34 = bitcast i32* %0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %34) #10
  %35 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 4, i32 0
  %36 = call i8* @memcpy(i8* nonnull %34, i8* nonnull %35, i64 4) #12
  %37 = load i32, i32* %0, align 4, !tbaa !99
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %34) #10
  %38 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 5
  %39 = load i32, i32* %38, align 4, !tbaa !134
  %40 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 6
  %41 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %40, align 8, !tbaa !136
  %42 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %41, i64 0, i32 0
  %43 = load i32, i32* %42, align 4, !tbaa !140
  %44 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %41, i64 0, i32 1
  %45 = load i32, i32* %44, align 4, !tbaa !138
  %46 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %41, i64 0, i32 2
  %47 = load i32, i32* %46, align 4, !tbaa !141
  %48 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %41, i64 1, i32 0
  %49 = load i32, i32* %48, align 4, !tbaa !140
  %50 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %41, i64 1, i32 1
  %51 = load i32, i32* %50, align 4, !tbaa !138
  %52 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %41, i64 1, i32 2
  %53 = load i32, i32* %52, align 4, !tbaa !141
  %54 = add nsw i32 %23, %21
  %a1 = add nsw i32 %54, -1
  %55 = icmp sgt i32 %45, %a1
  %a0 = select i1 %55, i32 %a1, i32 %45
  %56 = icmp sgt i32 %a0, %21
  %57 = select i1 %56, i32 %a0, i32 %21
  %a4 = add nsw i32 %54, 62
  %58 = icmp sgt i32 %45, %a4
  %a3 = select i1 %58, i32 %a4, i32 %45
  %59 = icmp slt i32 %a3, 62
  %60 = select i1 %59, i32 %a3, i32 62
  %a2 = add nsw i32 %60, -63
  %61 = icmp sgt i32 %a2, %21
  %62 = select i1 %61, i32 %a2, i32 %21
  %input.extent.0.required.s = sub nsw i32 %57, %62
  %63 = add nsw i32 %29, %27
  %a9 = add nsw i32 %63, -1
  %64 = icmp sgt i32 %51, %a9
  %a8 = select i1 %64, i32 %a9, i32 %51
  %65 = icmp sgt i32 %a8, %27
  %66 = select i1 %65, i32 %a8, i32 %27
  %67 = icmp slt i32 %63, 0
  %68 = select i1 %67, i32 %63, i32 0
  %a10 = add nsw i32 %68, -1
  %69 = icmp sgt i32 %a10, %27
  %70 = select i1 %69, i32 %a10, i32 %27
  %input.extent.1.required.s = sub nsw i32 %66, %70
  %71 = load i8*, i8** %10, align 8, !tbaa !151
  %72 = icmp eq i8* %71, null
  br i1 %72, label %_halide_buffer_is_bounds_query.exit, label %"assert succeeded6"

_halide_buffer_is_bounds_query.exit:              ; preds = %"assert succeeded2"
  %73 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 0
  %74 = load i64, i64* %73, align 8, !tbaa !178
  %75 = icmp ne i64 %74, 0
  %76 = icmp eq i32 %62, 0
  %77 = or i1 %76, %75
  br i1 %77, label %_halide_buffer_is_bounds_query.exit47, label %"assert failed3", !prof !242

"assert failed3":                                 ; preds = %_halide_buffer_is_bounds_query.exit
  %78 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 0, i32 0, i32 %input.extent.0.required.s, i32 %62, i32 %57) #10
  br label %destructor_block

_halide_buffer_is_bounds_query.exit47:            ; preds = %_halide_buffer_is_bounds_query.exit
  %79 = icmp eq i32 %70, 0
  %80 = or i1 %79, %75
  br i1 %80, label %"assert succeeded6", label %"assert failed5", !prof !242

"assert failed5":                                 ; preds = %_halide_buffer_is_bounds_query.exit47
  %81 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 1, i32 0, i32 %input.extent.1.required.s, i32 %70, i32 %66) #10
  br label %destructor_block

"assert succeeded6":                              ; preds = %_halide_buffer_is_bounds_query.exit47, %"assert succeeded2"
  %82 = load i8*, i8** %32, align 8, !tbaa !151
  %83 = icmp eq i8* %82, null
  br i1 %83, label %_halide_buffer_is_bounds_query.exit48, label %_halide_buffer_is_bounds_query.exit49.thread

_halide_buffer_is_bounds_query.exit48:            ; preds = %"assert succeeded6"
  %84 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 0
  %85 = load i64, i64* %84, align 8, !tbaa !178
  %86 = icmp eq i64 %85, 0
  %87 = icmp slt i32 %45, 256
  %.demorgan = and i1 %87, %86
  br i1 %.demorgan, label %"assert failed7", label %_halide_buffer_is_bounds_query.exit49, !prof !241

"assert failed7":                                 ; preds = %_halide_buffer_is_bounds_query.exit48
  %88 = add nsw i32 %45, -256
  %89 = add nsw i32 %45, -1
  %90 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 0, i32 0, i32 255, i32 %88, i32 %89) #10
  br label %destructor_block

_halide_buffer_is_bounds_query.exit49.thread:     ; preds = %"assert succeeded6"
  %91 = icmp slt i32 %45, 256
  %92 = icmp slt i32 %51, 32
  br label %"assert succeeded10"

_halide_buffer_is_bounds_query.exit49:            ; preds = %_halide_buffer_is_bounds_query.exit48
  %93 = icmp slt i32 %51, 32
  %.demorgan45 = and i1 %93, %86
  br i1 %.demorgan45, label %"assert failed9", label %"assert succeeded10", !prof !241

"assert failed9":                                 ; preds = %_halide_buffer_is_bounds_query.exit49
  %94 = add nsw i32 %51, -32
  %95 = add nsw i32 %51, -1
  %96 = call i32 @halide_error_constraints_make_required_region_smaller(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 1, i32 0, i32 31, i32 %94, i32 %95) #10
  br label %destructor_block

"assert succeeded10":                             ; preds = %_halide_buffer_is_bounds_query.exit49, %_halide_buffer_is_bounds_query.exit49.thread
  %97 = phi i1 [ %92, %_halide_buffer_is_bounds_query.exit49.thread ], [ %93, %_halide_buffer_is_bounds_query.exit49 ]
  %98 = phi i1 [ %91, %_halide_buffer_is_bounds_query.exit49.thread ], [ %87, %_halide_buffer_is_bounds_query.exit49 ]
  br i1 %72, label %_halide_buffer_is_bounds_query.exit50, label %after_bb

_halide_buffer_is_bounds_query.exit50:            ; preds = %"assert succeeded10"
  %99 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 0
  %100 = load i64, i64* %99, align 8, !tbaa !178
  %101 = icmp eq i64 %100, 0
  br i1 %101, label %_halide_buffer_init.exit, label %after_bb

_halide_buffer_init.exit:                         ; preds = %_halide_buffer_is_bounds_query.exit50
  %102 = bitcast %struct.halide_dimension_t** %18 to i8**
  %103 = load i8*, i8** %102, align 8, !tbaa !136
  %104 = add nsw i32 %input.extent.0.required.s, 1
  %105 = add nsw i32 %input.extent.1.required.s, 1
  %106 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 0
  store i32 0, i32* %106, align 4
  %107 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 1
  store i32 %104, i32* %107, align 4
  %108 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 2
  store i32 1, i32* %108, align 4
  %109 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 3
  store i32 0, i32* %109, align 4
  %110 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 4
  store i32 0, i32* %110, align 4
  %111 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 5
  store i32 %105, i32* %111, align 4
  %112 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 6
  store i32 %104, i32* %112, align 4
  %113 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 7
  store i32 0, i32* %113, align 4
  %114 = bitcast %struct.halide_buffer_t* %input.buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* %114, i8 0, i64 24, i32 8, i1 false)
  store i8 1, i8* %13, align 8, !tbaa !243
  %115 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 4, i32 1
  store i8 8, i8* %115, align 1, !tbaa !244
  %116 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 4, i32 2
  store i16 1, i16* %116, align 2, !tbaa !245
  store i32 2, i32* %16, align 4, !tbaa !134
  %117 = bitcast [8 x i32]* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %103, i8* nonnull %117, i64 16, i32 4, i1 false) #10, !tbaa.struct !137
  %118 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %18, align 8, !tbaa !136
  %119 = getelementptr inbounds [8 x i32], [8 x i32]* %4, i64 0, i64 4
  %120 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %118, i64 1
  %121 = bitcast %struct.halide_dimension_t* %120 to i8*
  %122 = bitcast i32* %119 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %121, i8* nonnull %122, i64 16, i32 4, i1 false) #10, !tbaa.struct !137
  %123 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 3
  store i64 0, i64* %123, align 8, !tbaa !180
  %.pre = load i8*, i8** %32, align 8, !tbaa !151
  br label %after_bb

after_bb:                                         ; preds = %_halide_buffer_init.exit, %_halide_buffer_is_bounds_query.exit50, %"assert succeeded10"
  %124 = phi i8* [ %82, %"assert succeeded10" ], [ %82, %_halide_buffer_is_bounds_query.exit50 ], [ %.pre, %_halide_buffer_init.exit ]
  %125 = icmp eq i8* %124, null
  br i1 %125, label %_halide_buffer_is_bounds_query.exit51, label %after_bb13

_halide_buffer_is_bounds_query.exit51:            ; preds = %after_bb
  %126 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 0
  %127 = load i64, i64* %126, align 8, !tbaa !178
  %128 = icmp eq i64 %127, 0
  br i1 %128, label %_halide_buffer_init.exit52, label %after_bb13

_halide_buffer_init.exit52:                       ; preds = %_halide_buffer_is_bounds_query.exit51
  %129 = bitcast %struct.halide_dimension_t** %40 to i8**
  %130 = load i8*, i8** %129, align 8, !tbaa !136
  %131 = icmp sgt i32 %45, 256
  %132 = select i1 %131, i32 %45, i32 256
  %133 = icmp sgt i32 %51, 32
  %134 = select i1 %133, i32 %51, i32 32
  %135 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 0
  store i32 0, i32* %135, align 4
  %136 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  store i32 %132, i32* %136, align 4
  %137 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 2
  store i32 1, i32* %137, align 4
  %138 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 3
  store i32 0, i32* %138, align 4
  %139 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 4
  store i32 0, i32* %139, align 4
  %140 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 5
  store i32 %134, i32* %140, align 4
  %141 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 6
  store i32 %132, i32* %141, align 4
  %142 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 7
  store i32 0, i32* %142, align 4
  %143 = bitcast %struct.halide_buffer_t* %output.buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* %143, i8 0, i64 24, i32 8, i1 false)
  store i8 1, i8* %35, align 8, !tbaa !243
  %144 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 4, i32 1
  store i8 8, i8* %144, align 1, !tbaa !244
  %145 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 4, i32 2
  store i16 1, i16* %145, align 2, !tbaa !245
  store i32 2, i32* %38, align 4, !tbaa !134
  %146 = bitcast [8 x i32]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %130, i8* nonnull %146, i64 16, i32 4, i1 false) #10, !tbaa.struct !137
  %147 = load %struct.halide_dimension_t*, %struct.halide_dimension_t** %40, align 8, !tbaa !136
  %148 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 4
  %149 = getelementptr inbounds %struct.halide_dimension_t, %struct.halide_dimension_t* %147, i64 1
  %150 = bitcast %struct.halide_dimension_t* %149 to i8*
  %151 = bitcast i32* %148 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %150, i8* nonnull %151, i64 16, i32 4, i1 false) #10, !tbaa.struct !137
  %152 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 3
  store i64 0, i64* %152, align 8, !tbaa !180
  br label %after_bb13

after_bb13:                                       ; preds = %_halide_buffer_init.exit52, %_halide_buffer_is_bounds_query.exit51, %after_bb
  %153 = load i8*, i8** %10, align 8, !tbaa !151
  %154 = icmp eq i8* %153, null
  br i1 %154, label %155, label %_halide_buffer_is_bounds_query.exit53

; <label>:155:                                    ; preds = %after_bb13
  %156 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %input.buffer, i64 0, i32 0
  %157 = load i64, i64* %156, align 8, !tbaa !178
  %158 = icmp eq i64 %157, 0
  br label %_halide_buffer_is_bounds_query.exit53

_halide_buffer_is_bounds_query.exit53:            ; preds = %155, %after_bb13
  %159 = phi i1 [ false, %after_bb13 ], [ %158, %155 ]
  %160 = load i8*, i8** %32, align 8, !tbaa !151
  %161 = icmp eq i8* %160, null
  br i1 %161, label %162, label %_halide_buffer_is_bounds_query.exit54

; <label>:162:                                    ; preds = %_halide_buffer_is_bounds_query.exit53
  %163 = getelementptr inbounds %struct.halide_buffer_t, %struct.halide_buffer_t* %output.buffer, i64 0, i32 0
  %164 = load i64, i64* %163, align 8, !tbaa !178
  %165 = icmp eq i64 %164, 0
  br label %_halide_buffer_is_bounds_query.exit54

_halide_buffer_is_bounds_query.exit54:            ; preds = %162, %_halide_buffer_is_bounds_query.exit53
  %166 = phi i1 [ false, %_halide_buffer_is_bounds_query.exit53 ], [ %165, %162 ]
  %167 = or i1 %159, %166
  br i1 %167, label %destructor_block, label %true_bb14

true_bb14:                                        ; preds = %_halide_buffer_is_bounds_query.exit54
  %168 = icmp ne i32 %15, 67585
  %169 = zext i1 %168 to i64
  %170 = icmp ne i32 %17, 2
  %171 = zext i1 %170 to i64
  %172 = shl nuw nsw i64 %171, 1
  %173 = icmp ne i32 %37, 67585
  %174 = zext i1 %173 to i64
  %175 = shl nuw nsw i64 %174, 2
  %176 = icmp ne i32 %39, 2
  %177 = zext i1 %176 to i64
  %178 = shl nuw nsw i64 %177, 3
  %179 = icmp sge i32 %57, %54
  %180 = zext i1 %179 to i64
  %181 = shl nuw nsw i64 %180, 4
  %a26.lobit = lshr i32 %23, 31
  %182 = shl nuw nsw i32 %a26.lobit, 5
  %183 = zext i32 %182 to i64
  %184 = icmp sge i32 %66, %63
  %185 = zext i1 %184 to i64
  %186 = shl nuw nsw i64 %185, 6
  %input.extent.1.lobit = lshr i32 %29, 31
  %187 = shl nuw nsw i32 %input.extent.1.lobit, 7
  %188 = zext i32 %187 to i64
  %189 = add nsw i32 %43, 256
  %190 = select i1 %98, i32 %45, i32 256
  %191 = icmp sgt i32 %189, %190
  %192 = zext i1 %191 to i64
  %output.min.0.lobit = lshr i32 %43, 31
  %193 = zext i32 %output.min.0.lobit to i64
  %194 = or i64 %192, %193
  %195 = shl nuw nsw i64 %194, 8
  %a21.lobit = lshr i32 %45, 31
  %196 = shl nuw nsw i32 %a21.lobit, 9
  %197 = zext i32 %196 to i64
  %198 = add nsw i32 %49, 32
  %199 = select i1 %97, i32 %51, i32 32
  %200 = icmp sgt i32 %198, %199
  %201 = zext i1 %200 to i64
  %output.min.1.lobit = lshr i32 %49, 31
  %202 = zext i32 %output.min.1.lobit to i64
  %203 = or i64 %201, %202
  %204 = shl nuw nsw i64 %203, 10
  %a20.lobit = lshr i32 %51, 31
  %205 = shl nuw nsw i32 %a20.lobit, 11
  %206 = zext i32 %205 to i64
  %207 = icmp ne i32 %25, 1
  %208 = zext i1 %207 to i64
  %209 = shl nuw nsw i64 %208, 12
  %210 = icmp ne i32 %21, 0
  %211 = zext i1 %210 to i64
  %212 = shl nuw nsw i64 %211, 13
  %213 = icmp ne i32 %27, 0
  %214 = zext i1 %213 to i64
  %215 = shl nuw nsw i64 %214, 14
  %216 = icmp ne i32 %47, 1
  %217 = zext i1 %216 to i64
  %218 = shl nuw nsw i64 %217, 15
  %219 = icmp ne i32 %43, 0
  %220 = zext i1 %219 to i64
  %221 = shl nuw nsw i64 %220, 16
  %222 = icmp ne i32 %49, 0
  %223 = zext i1 %222 to i64
  %224 = shl nuw nsw i64 %223, 17
  %225 = or i64 %172, %169
  %226 = or i64 %225, %212
  %227 = or i64 %226, %183
  %228 = or i64 %227, %209
  %229 = or i64 %228, %215
  %230 = or i64 %229, %188
  %231 = or i64 %230, %175
  %232 = or i64 %231, %178
  %233 = or i64 %232, %221
  %234 = or i64 %233, %197
  %235 = or i64 %234, %218
  %236 = or i64 %235, %224
  %237 = or i64 %236, %206
  %238 = or i64 %237, %181
  %239 = or i64 %238, %186
  %240 = or i64 %239, %204
  %241 = or i64 %240, %195
  %242 = or i64 %241, -9223372036854775808
  %243 = call i64 @llvm.cttz.i64(i64 %242, i1 true), !range !246
  %trunc = trunc i64 %243 to i6
  switch i6 %trunc, label %no_errors_bb [
    i6 0, label %assert_failed
    i6 1, label %assert_failed17
    i6 2, label %assert_failed18
    i6 3, label %assert_failed19
    i6 4, label %assert_failed20
    i6 5, label %assert_failed21
    i6 6, label %assert_failed22
    i6 7, label %assert_failed23
    i6 8, label %assert_failed24
    i6 9, label %assert_failed25
    i6 10, label %assert_failed26
    i6 11, label %assert_failed27
    i6 12, label %assert_failed28
    i6 13, label %assert_failed29
    i6 14, label %assert_failed30
    i6 15, label %assert_failed31
    i6 16, label %assert_failed32
    i6 17, label %assert_failed33
  ], !prof !242

no_errors_bb:                                     ; preds = %true_bb14
  %244 = sext i32 %29 to i64
  %245 = sext i32 %23 to i64
  %input.total_extent.1 = mul nsw i64 %244, %245
  %246 = sext i32 %51 to i64
  %247 = sext i32 %45 to i64
  %output.total_extent.1 = mul nsw i64 %246, %247
  %248 = icmp sgt i32 %23, -1
  %249 = sub nsw i64 0, %245
  %250 = select i1 %248, i64 %245, i64 %249
  %251 = icmp ugt i64 %250, 2147483647
  %252 = zext i1 %251 to i64
  %253 = sext i32 %31 to i64
  %x1 = mul nsw i64 %253, %244
  %254 = icmp sgt i64 %x1, -1
  %255 = sub nsw i64 0, %x1
  %256 = select i1 %254, i64 %x1, i64 %255
  %257 = icmp ugt i64 %256, 2147483647
  %258 = zext i1 %257 to i64
  %259 = shl nuw nsw i64 %258, 1
  %260 = icmp sgt i64 %input.total_extent.1, 2147483647
  %261 = zext i1 %260 to i64
  %262 = shl nuw nsw i64 %261, 2
  %263 = icmp sgt i32 %45, -1
  %264 = sub nsw i64 0, %247
  %265 = select i1 %263, i64 %247, i64 %264
  %266 = icmp ugt i64 %265, 2147483647
  %267 = zext i1 %266 to i64
  %268 = shl nuw nsw i64 %267, 3
  %269 = sext i32 %53 to i64
  %x3 = mul nsw i64 %269, %246
  %270 = icmp sgt i64 %x3, -1
  %271 = sub nsw i64 0, %x3
  %272 = select i1 %270, i64 %x3, i64 %271
  %273 = icmp ugt i64 %272, 2147483647
  %274 = zext i1 %273 to i64
  %275 = shl nuw nsw i64 %274, 4
  %276 = icmp sgt i64 %output.total_extent.1, 2147483647
  %277 = zext i1 %276 to i64
  %278 = shl nuw nsw i64 %277, 5
  %279 = icmp eq i8* %11, null
  %280 = zext i1 %279 to i64
  %281 = shl nuw nsw i64 %280, 6
  %282 = icmp eq i8* %33, null
  %283 = zext i1 %282 to i64
  %284 = shl nuw nsw i64 %283, 7
  %285 = or i64 %281, %252
  %286 = or i64 %285, %262
  %287 = or i64 %286, %284
  %288 = or i64 %287, %259
  %289 = or i64 %288, %268
  %290 = or i64 %289, %278
  %291 = or i64 %290, %275
  %292 = or i64 %291, -9223372036854775808
  %293 = call i64 @llvm.cttz.i64(i64 %292, i1 true), !range !246
  %trunc46 = trunc i64 %293 to i6
  switch i6 %trunc46, label %"produce output" [
    i6 0, label %assert_failed35
    i6 1, label %assert_failed36
    i6 2, label %assert_failed37
    i6 3, label %assert_failed38
    i6 4, label %assert_failed39
    i6 5, label %assert_failed40
    i6 6, label %assert_failed41
    i6 7, label %assert_failed42
  ], !prof !242

assert_failed:                                    ; preds = %true_bb14
  %294 = call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 %15, i32 67585) #10
  ret i32 %294

assert_failed17:                                  ; preds = %true_bb14
  %295 = call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 %17, i32 2) #10
  ret i32 %295

assert_failed18:                                  ; preds = %true_bb14
  %296 = call i32 @halide_error_bad_type(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 %37, i32 67585) #10
  ret i32 %296

assert_failed19:                                  ; preds = %true_bb14
  %297 = call i32 @halide_error_bad_dimensions(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 %39, i32 2) #10
  ret i32 %297

assert_failed20:                                  ; preds = %true_bb14
  %298 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 0, i32 %62, i32 %57, i32 %21, i32 %a1) #10
  ret i32 %298

assert_failed21:                                  ; preds = %true_bb14
  %299 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 0, i32 %23) #10
  ret i32 %299

assert_failed22:                                  ; preds = %true_bb14
  %300 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 1, i32 %70, i32 %66, i32 %27, i32 %a9) #10
  ret i32 %300

assert_failed23:                                  ; preds = %true_bb14
  %301 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0), i32 1, i32 %29) #10
  ret i32 %301

assert_failed24:                                  ; preds = %true_bb14
  %302 = add nsw i32 %190, -256
  %303 = add i32 %45, -1
  %304 = add i32 %303, %43
  %305 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 0, i32 %302, i32 %303, i32 %43, i32 %304) #10
  ret i32 %305

assert_failed25:                                  ; preds = %true_bb14
  %306 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 0, i32 %45) #10
  ret i32 %306

assert_failed26:                                  ; preds = %true_bb14
  %307 = add nsw i32 %199, -32
  %308 = add i32 %51, -1
  %309 = add i32 %308, %49
  %310 = call i32 @halide_error_access_out_of_bounds(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 1, i32 %307, i32 %308, i32 %49, i32 %309) #10
  ret i32 %310

assert_failed27:                                  ; preds = %true_bb14
  %311 = call i32 @halide_error_buffer_extents_negative(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0), i32 1, i32 %51) #10
  ret i32 %311

assert_failed28:                                  ; preds = %true_bb14
  %312 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.216, i64 0, i64 0), i32 %25, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.217, i64 0, i64 0), i32 1) #10
  ret i32 %312

assert_failed29:                                  ; preds = %true_bb14
  %313 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.218, i64 0, i64 0), i32 %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #10
  ret i32 %313

assert_failed30:                                  ; preds = %true_bb14
  %314 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.220, i64 0, i64 0), i32 %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #10
  ret i32 %314

assert_failed31:                                  ; preds = %true_bb14
  %315 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.221, i64 0, i64 0), i32 %47, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.217, i64 0, i64 0), i32 1) #10
  ret i32 %315

assert_failed32:                                  ; preds = %true_bb14
  %316 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.222, i64 0, i64 0), i32 %43, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #10
  ret i32 %316

assert_failed33:                                  ; preds = %true_bb14
  %317 = call i32 @halide_error_constraint_violated(i8* null, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.223, i64 0, i64 0), i32 %49, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.219, i64 0, i64 0), i32 0) #10
  ret i32 %317

assert_failed35:                                  ; preds = %no_errors_bb
  %318 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0), i64 %250, i64 2147483647) #10
  ret i32 %318

assert_failed36:                                  ; preds = %no_errors_bb
  %319 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0), i64 %256, i64 2147483647) #10
  ret i32 %319

assert_failed37:                                  ; preds = %no_errors_bb
  %320 = call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.213, i64 0, i64 0), i64 %input.total_extent.1, i64 2147483647) #10
  ret i32 %320

assert_failed38:                                  ; preds = %no_errors_bb
  %321 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %265, i64 2147483647) #10
  ret i32 %321

assert_failed39:                                  ; preds = %no_errors_bb
  %322 = call i32 @halide_error_buffer_allocation_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %272, i64 2147483647) #10
  ret i32 %322

assert_failed40:                                  ; preds = %no_errors_bb
  %323 = call i32 @halide_error_buffer_extents_too_large(i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0), i64 %output.total_extent.1, i64 2147483647) #10
  ret i32 %323

assert_failed41:                                  ; preds = %no_errors_bb
  %324 = call i32 @halide_error_host_is_null(i8* null, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.214, i64 0, i64 0)) #10
  ret i32 %324

assert_failed42:                                  ; preds = %no_errors_bb
  %325 = call i32 @halide_error_host_is_null(i8* null, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.215, i64 0, i64 0)) #10
  ret i32 %325

"produce output":                                 ; preds = %no_errors_bb
  %b28 = add nsw i32 %45, -256
  %326 = add nsw i32 %45, 255
  %a22 = ashr i32 %326, 8
  %327 = icmp slt i32 %a22, 1
  %b25 = select i1 %327, i32 %a22, i32 1
  %t72 = icmp sgt i32 %45, 0
  %328 = icmp sgt i32 %b28, %23
  %a25 = select i1 %328, i32 %23, i32 %b28
  %b27 = add nsw i32 %23, -257
  %329 = icmp sgt i32 %b27, %a25
  %a24 = select i1 %329, i32 %a25, i32 %b27
  %b26 = add nsw i32 %45, -1
  %330 = icmp sgt i32 %b26, %a24
  %331 = select i1 %330, i32 %a24, i32 %b26
  %332 = ashr i32 %331, 8
  %a23 = add nsw i32 %332, 1
  %333 = icmp sgt i32 %a23, %b25
  %t71 = select i1 %333, i32 %a23, i32 %b25
  %334 = add nsw i32 %51, 31
  %t69 = ashr i32 %334, 5
  %t70 = add nsw i32 %51, -32
  %t75 = add nsw i32 %23, -1
  %335 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 0
  store i32 %29, i32* %335, align 8
  %336 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 1
  store i32 %31, i32* %336, align 4
  %337 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 2
  store i32 %53, i32* %337, align 8
  %338 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 3
  store i32 %t70, i32* %338, align 4
  %339 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 4
  store i32 %t71, i32* %339, align 8
  %340 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 5
  store i1 %t72, i1* %340, align 4
  %341 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 6
  store i32 %t75, i32* %341, align 8
  %342 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 7
  store i32 %b28, i32* %342, align 4
  %343 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 8
  store i32 %190, i32* %343, align 8
  %344 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 9
  store i32 %a22, i32* %344, align 4
  %345 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 10
  store i32 %b25, i32* %345, align 8
  %346 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 11
  store i8* %11, i8** %346, align 8
  %347 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 12
  store %struct.halide_buffer_t* %input.buffer, %struct.halide_buffer_t** %347, align 8
  %348 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 13
  store i8* %33, i8** %348, align 8
  %349 = getelementptr inbounds %closure_t, %closure_t* %2, i64 0, i32 14
  store %struct.halide_buffer_t* %output.buffer, %struct.halide_buffer_t** %349, align 8
  %350 = bitcast %closure_t* %2 to i8*
  %351 = call i32 @halide_do_par_for(i8* null, i32 (i8*, i32, i8*)* nonnull @dilate3x3_batch_02_sample_14.par_for.output.s0.y.y, i32 0, i32 %t69, i8* nonnull %350)
  br label %destructor_block
}

; Function Attrs: nounwind readnone speculatable
declare i64 @llvm.cttz.i64(i64, i1) #7

; Function Attrs: norecurse nounwind
define internal i32 @dilate3x3_batch_02_sample_14.par_for.output.s0.y.y(i8* nocapture readnone %__user_context, i32 %output.s0.y.y, i8* noalias nocapture readonly %closure) #9 {
entry:
  %max_y51 = alloca [128 x i8], align 64
  %repeat_edge53 = alloca [10880 x i8], align 64
  %0 = bitcast i8* %closure to i32*
  %b50 = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %closure, i64 4
  %2 = bitcast i8* %1 to i32*
  %input.stride.1 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %closure, i64 8
  %4 = bitcast i8* %3 to i32*
  %output.stride.1 = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %closure, i64 12
  %6 = bitcast i8* %5 to i32*
  %b41 = load i32, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %closure, i64 16
  %8 = bitcast i8* %7 to i32*
  %t71 = load i32, i32* %8, align 4
  %9 = getelementptr inbounds i8, i8* %closure, i64 20
  %10 = bitcast i8* %9 to i1*
  %t72 = load i1, i1* %10, align 1
  %11 = getelementptr inbounds i8, i8* %closure, i64 24
  %12 = bitcast i8* %11 to i32*
  %t75 = load i32, i32* %12, align 4
  %13 = getelementptr inbounds i8, i8* %closure, i64 28
  %14 = bitcast i8* %13 to i32*
  %b67 = load i32, i32* %14, align 4
  %15 = getelementptr inbounds i8, i8* %closure, i64 32
  %16 = bitcast i8* %15 to i32*
  %t82 = load i32, i32* %16, align 4
  %17 = getelementptr inbounds i8, i8* %closure, i64 36
  %18 = bitcast i8* %17 to i32*
  %t83 = load i32, i32* %18, align 4
  %19 = getelementptr inbounds i8, i8* %closure, i64 40
  %20 = bitcast i8* %19 to i32*
  %t84 = load i32, i32* %20, align 4
  %21 = getelementptr inbounds i8, i8* %closure, i64 48
  %22 = bitcast i8* %21 to i8**
  %input = load i8*, i8** %22, align 8
  %23 = getelementptr inbounds i8, i8* %closure, i64 64
  %24 = bitcast i8* %23 to i8**
  %output = load i8*, i8** %24, align 8
  %a27 = shl nsw i32 %output.s0.y.y, 5
  %25 = icmp sgt i32 %b41, %a27
  %a41 = select i1 %25, i32 %a27, i32 %b41
  %b31 = add nsw i32 %b50, -1
  br i1 %t72, label %"produce repeat_edge", label %after_bb

after_bb:                                         ; preds = %"end for output.s0.x.xi.xi", %entry
  %26 = icmp sgt i32 %a41, 1
  %a40 = select i1 %26, i32 %a41, i32 1
  %b42 = add nsw i32 %a41, 34
  %27 = icmp sgt i32 %b42, %a40
  %t102 = select i1 %27, i32 %a40, i32 %b42
  %a42 = add i32 %a41, 33
  %28 = icmp sgt i32 %b50, %a42
  %b47 = select i1 %28, i32 %a42, i32 %b50
  %a45 = add nsw i32 %t102, -1
  %29 = icmp sgt i32 %a45, %b47
  %30 = select i1 %29, i32 %a45, i32 %b47
  %a46 = sub nsw i32 %b47, %t102
  %31 = icmp slt i32 %a41, 1
  %32 = select i1 %31, i32 %a41, i32 1
  %t97 = sub nsw i32 1, %32
  %33 = icmp slt i32 %t84, %t71
  br i1 %33, label %"for output.s0.x.x.preheader", label %"end for output.s0.x.x", !prof !242

"for output.s0.x.x.preheader":                    ; preds = %after_bb
  %34 = icmp sgt i32 %a46, -1
  %35 = select i1 %34, i32 %a46, i32 -1
  %36 = add nsw i32 %a41, -1
  %37 = add nsw i32 %t97, %36
  %38 = icmp sgt i32 %t97, 0
  %39 = add i32 %35, %t102
  %40 = icmp sgt i32 %t102, %39
  %41 = icmp slt i32 %30, %a42
  %42 = sext i32 %input.stride.1 to i64
  %43 = sext i32 %a41 to i64
  %max_y51.0.sroa_cast69 = bitcast [128 x i8]* %max_y51 to <64 x i8>*
  %max_y51.64.sroa_idx81 = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 64
  %max_y51.64.sroa_cast82 = bitcast i8* %max_y51.64.sroa_idx81 to <64 x i8>*
  %max_y51.1.sroa_idx73 = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 1
  %max_y51.1.sroa_cast74 = bitcast i8* %max_y51.1.sroa_idx73 to <64 x i8>*
  %max_y51.2.sroa_idx77 = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 2
  %max_y51.2.sroa_cast78 = bitcast i8* %max_y51.2.sroa_idx77 to <64 x i8>*
  %44 = sext i32 %36 to i64
  %45 = sext i32 %b31 to i64
  %46 = sext i32 %a45 to i64
  %47 = sext i32 %30 to i64
  br label %"for output.s0.x.x"

"produce repeat_edge":                            ; preds = %entry
  %48 = add nsw i32 %a41, -1
  %49 = sub i32 320, %t82
  %50 = insertelement <64 x i32> undef, i32 %t75, i32 0
  %51 = shufflevector <64 x i32> %50, <64 x i32> undef, <16 x i32> zeroinitializer
  %52 = add nsw i32 %a41, 32
  %53 = sext i32 %48 to i64
  %54 = sext i32 %b31 to i64
  br label %"for repeat_edge.s0._1"

"for repeat_edge.s0._1":                          ; preds = %"end for repeat_edge.s0._0._0", %"produce repeat_edge"
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %"end for repeat_edge.s0._0._0" ], [ %53, %"produce repeat_edge" ]
  %55 = icmp slt i64 %indvars.iv125, %54
  %56 = trunc i64 %indvars.iv125 to i32
  %a28 = select i1 %55, i32 %56, i32 %b31
  %57 = icmp sgt i32 %a28, 0
  %58 = select i1 %57, i32 %a28, i32 0
  %t88 = mul nsw i32 %58, %input.stride.1
  %59 = trunc i64 %indvars.iv125 to i32
  %60 = sub i32 %59, %a41
  %61 = mul i32 %60, 320
  %t89 = add i32 %49, %61
  %62 = insertelement <64 x i32> undef, i32 %t88, i32 0
  %63 = shufflevector <64 x i32> %62, <64 x i32> undef, <64 x i32> zeroinitializer
  %64 = sext i32 %t89 to i64
  br label %"for repeat_edge.s0._0._0"

"for repeat_edge.s0._0._0":                       ; preds = %"for repeat_edge.s0._0._0", %"for repeat_edge.s0._1"
  %repeat_edge.s0._0._0 = phi i32 [ 0, %"for repeat_edge.s0._1" ], [ %418, %"for repeat_edge.s0._0._0" ]
  %a30 = shl nsw i32 %repeat_edge.s0._0._0, 6
  %65 = icmp ult i32 %a30, 194
  %66 = select i1 %65, i32 %a30, i32 194
  %repeat_edge.s0._0._0i.base.s = add nsw i32 %66, %t82
  %67 = add nsw i32 %repeat_edge.s0._0._0i.base.s, -257
  %68 = insertelement <64 x i32> undef, i32 %67, i32 0
  %69 = shufflevector <64 x i32> %68, <64 x i32> undef, <64 x i32> zeroinitializer
  %a32 = add nsw <64 x i32> %69, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %70 = shufflevector <64 x i32> %a32, <64 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %71 = icmp sgt <16 x i32> %51, %70
  %72 = shufflevector <64 x i32> %a32, <64 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %73 = icmp sgt <16 x i32> %51, %72
  %74 = shufflevector <64 x i32> %a32, <64 x i32> undef, <16 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %75 = icmp sgt <16 x i32> %51, %74
  %76 = shufflevector <64 x i32> %a32, <64 x i32> undef, <16 x i32> <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %77 = icmp sgt <16 x i32> %51, %76
  %78 = select <16 x i1> %71, <16 x i32> %70, <16 x i32> %51
  %79 = select <16 x i1> %73, <16 x i32> %72, <16 x i32> %51
  %80 = select <16 x i1> %75, <16 x i32> %74, <16 x i32> %51
  %81 = select <16 x i1> %77, <16 x i32> %76, <16 x i32> %51
  %82 = icmp sgt <16 x i32> %78, zeroinitializer
  %83 = icmp sgt <16 x i32> %79, zeroinitializer
  %84 = icmp sgt <16 x i32> %80, zeroinitializer
  %85 = icmp sgt <16 x i32> %81, zeroinitializer
  %86 = select <16 x i1> %82, <16 x i32> %78, <16 x i32> zeroinitializer
  %87 = select <16 x i1> %83, <16 x i32> %79, <16 x i32> zeroinitializer
  %88 = select <16 x i1> %84, <16 x i32> %80, <16 x i32> zeroinitializer
  %89 = select <16 x i1> %85, <16 x i32> %81, <16 x i32> zeroinitializer
  %90 = shufflevector <16 x i32> %86, <16 x i32> %87, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %91 = shufflevector <16 x i32> %88, <16 x i32> %89, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %92 = shufflevector <32 x i32> %90, <32 x i32> %91, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %93 = add nsw <64 x i32> %92, %63
  %94 = extractelement <64 x i32> %93, i32 0
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %input, i64 %95
  %97 = load i8, i8* %96, align 1, !tbaa !247
  %98 = insertelement <64 x i8> undef, i8 %97, i32 0
  %99 = extractelement <64 x i32> %93, i32 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %input, i64 %100
  %102 = load i8, i8* %101, align 1, !tbaa !247
  %103 = insertelement <64 x i8> %98, i8 %102, i32 1
  %104 = extractelement <64 x i32> %93, i32 2
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8* %input, i64 %105
  %107 = load i8, i8* %106, align 1, !tbaa !247
  %108 = insertelement <64 x i8> %103, i8 %107, i32 2
  %109 = extractelement <64 x i32> %93, i32 3
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8* %input, i64 %110
  %112 = load i8, i8* %111, align 1, !tbaa !247
  %113 = insertelement <64 x i8> %108, i8 %112, i32 3
  %114 = extractelement <64 x i32> %93, i32 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8* %input, i64 %115
  %117 = load i8, i8* %116, align 1, !tbaa !247
  %118 = insertelement <64 x i8> %113, i8 %117, i32 4
  %119 = extractelement <64 x i32> %93, i32 5
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8* %input, i64 %120
  %122 = load i8, i8* %121, align 1, !tbaa !247
  %123 = insertelement <64 x i8> %118, i8 %122, i32 5
  %124 = extractelement <64 x i32> %93, i32 6
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8* %input, i64 %125
  %127 = load i8, i8* %126, align 1, !tbaa !247
  %128 = insertelement <64 x i8> %123, i8 %127, i32 6
  %129 = extractelement <64 x i32> %93, i32 7
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8* %input, i64 %130
  %132 = load i8, i8* %131, align 1, !tbaa !247
  %133 = insertelement <64 x i8> %128, i8 %132, i32 7
  %134 = extractelement <64 x i32> %93, i32 8
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8* %input, i64 %135
  %137 = load i8, i8* %136, align 1, !tbaa !247
  %138 = insertelement <64 x i8> %133, i8 %137, i32 8
  %139 = extractelement <64 x i32> %93, i32 9
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8* %input, i64 %140
  %142 = load i8, i8* %141, align 1, !tbaa !247
  %143 = insertelement <64 x i8> %138, i8 %142, i32 9
  %144 = extractelement <64 x i32> %93, i32 10
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8* %input, i64 %145
  %147 = load i8, i8* %146, align 1, !tbaa !247
  %148 = insertelement <64 x i8> %143, i8 %147, i32 10
  %149 = extractelement <64 x i32> %93, i32 11
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8* %input, i64 %150
  %152 = load i8, i8* %151, align 1, !tbaa !247
  %153 = insertelement <64 x i8> %148, i8 %152, i32 11
  %154 = extractelement <64 x i32> %93, i32 12
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8* %input, i64 %155
  %157 = load i8, i8* %156, align 1, !tbaa !247
  %158 = insertelement <64 x i8> %153, i8 %157, i32 12
  %159 = extractelement <64 x i32> %93, i32 13
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8* %input, i64 %160
  %162 = load i8, i8* %161, align 1, !tbaa !247
  %163 = insertelement <64 x i8> %158, i8 %162, i32 13
  %164 = extractelement <64 x i32> %93, i32 14
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i8, i8* %input, i64 %165
  %167 = load i8, i8* %166, align 1, !tbaa !247
  %168 = insertelement <64 x i8> %163, i8 %167, i32 14
  %169 = extractelement <64 x i32> %93, i32 15
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8* %input, i64 %170
  %172 = load i8, i8* %171, align 1, !tbaa !247
  %173 = insertelement <64 x i8> %168, i8 %172, i32 15
  %174 = extractelement <64 x i32> %93, i32 16
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i8, i8* %input, i64 %175
  %177 = load i8, i8* %176, align 1, !tbaa !247
  %178 = insertelement <64 x i8> %173, i8 %177, i32 16
  %179 = extractelement <64 x i32> %93, i32 17
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i8, i8* %input, i64 %180
  %182 = load i8, i8* %181, align 1, !tbaa !247
  %183 = insertelement <64 x i8> %178, i8 %182, i32 17
  %184 = extractelement <64 x i32> %93, i32 18
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8* %input, i64 %185
  %187 = load i8, i8* %186, align 1, !tbaa !247
  %188 = insertelement <64 x i8> %183, i8 %187, i32 18
  %189 = extractelement <64 x i32> %93, i32 19
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i8, i8* %input, i64 %190
  %192 = load i8, i8* %191, align 1, !tbaa !247
  %193 = insertelement <64 x i8> %188, i8 %192, i32 19
  %194 = extractelement <64 x i32> %93, i32 20
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8* %input, i64 %195
  %197 = load i8, i8* %196, align 1, !tbaa !247
  %198 = insertelement <64 x i8> %193, i8 %197, i32 20
  %199 = extractelement <64 x i32> %93, i32 21
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8* %input, i64 %200
  %202 = load i8, i8* %201, align 1, !tbaa !247
  %203 = insertelement <64 x i8> %198, i8 %202, i32 21
  %204 = extractelement <64 x i32> %93, i32 22
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8* %input, i64 %205
  %207 = load i8, i8* %206, align 1, !tbaa !247
  %208 = insertelement <64 x i8> %203, i8 %207, i32 22
  %209 = extractelement <64 x i32> %93, i32 23
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8* %input, i64 %210
  %212 = load i8, i8* %211, align 1, !tbaa !247
  %213 = insertelement <64 x i8> %208, i8 %212, i32 23
  %214 = extractelement <64 x i32> %93, i32 24
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i8, i8* %input, i64 %215
  %217 = load i8, i8* %216, align 1, !tbaa !247
  %218 = insertelement <64 x i8> %213, i8 %217, i32 24
  %219 = extractelement <64 x i32> %93, i32 25
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i8, i8* %input, i64 %220
  %222 = load i8, i8* %221, align 1, !tbaa !247
  %223 = insertelement <64 x i8> %218, i8 %222, i32 25
  %224 = extractelement <64 x i32> %93, i32 26
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i8, i8* %input, i64 %225
  %227 = load i8, i8* %226, align 1, !tbaa !247
  %228 = insertelement <64 x i8> %223, i8 %227, i32 26
  %229 = extractelement <64 x i32> %93, i32 27
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i8, i8* %input, i64 %230
  %232 = load i8, i8* %231, align 1, !tbaa !247
  %233 = insertelement <64 x i8> %228, i8 %232, i32 27
  %234 = extractelement <64 x i32> %93, i32 28
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i8, i8* %input, i64 %235
  %237 = load i8, i8* %236, align 1, !tbaa !247
  %238 = insertelement <64 x i8> %233, i8 %237, i32 28
  %239 = extractelement <64 x i32> %93, i32 29
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i8, i8* %input, i64 %240
  %242 = load i8, i8* %241, align 1, !tbaa !247
  %243 = insertelement <64 x i8> %238, i8 %242, i32 29
  %244 = extractelement <64 x i32> %93, i32 30
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i8, i8* %input, i64 %245
  %247 = load i8, i8* %246, align 1, !tbaa !247
  %248 = insertelement <64 x i8> %243, i8 %247, i32 30
  %249 = extractelement <64 x i32> %93, i32 31
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i8, i8* %input, i64 %250
  %252 = load i8, i8* %251, align 1, !tbaa !247
  %253 = insertelement <64 x i8> %248, i8 %252, i32 31
  %254 = extractelement <64 x i32> %93, i32 32
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds i8, i8* %input, i64 %255
  %257 = load i8, i8* %256, align 1, !tbaa !247
  %258 = insertelement <64 x i8> %253, i8 %257, i32 32
  %259 = extractelement <64 x i32> %93, i32 33
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i8, i8* %input, i64 %260
  %262 = load i8, i8* %261, align 1, !tbaa !247
  %263 = insertelement <64 x i8> %258, i8 %262, i32 33
  %264 = extractelement <64 x i32> %93, i32 34
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i8, i8* %input, i64 %265
  %267 = load i8, i8* %266, align 1, !tbaa !247
  %268 = insertelement <64 x i8> %263, i8 %267, i32 34
  %269 = extractelement <64 x i32> %93, i32 35
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i8, i8* %input, i64 %270
  %272 = load i8, i8* %271, align 1, !tbaa !247
  %273 = insertelement <64 x i8> %268, i8 %272, i32 35
  %274 = extractelement <64 x i32> %93, i32 36
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i8, i8* %input, i64 %275
  %277 = load i8, i8* %276, align 1, !tbaa !247
  %278 = insertelement <64 x i8> %273, i8 %277, i32 36
  %279 = extractelement <64 x i32> %93, i32 37
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i8, i8* %input, i64 %280
  %282 = load i8, i8* %281, align 1, !tbaa !247
  %283 = insertelement <64 x i8> %278, i8 %282, i32 37
  %284 = extractelement <64 x i32> %93, i32 38
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i8, i8* %input, i64 %285
  %287 = load i8, i8* %286, align 1, !tbaa !247
  %288 = insertelement <64 x i8> %283, i8 %287, i32 38
  %289 = extractelement <64 x i32> %93, i32 39
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8* %input, i64 %290
  %292 = load i8, i8* %291, align 1, !tbaa !247
  %293 = insertelement <64 x i8> %288, i8 %292, i32 39
  %294 = extractelement <64 x i32> %93, i32 40
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i8, i8* %input, i64 %295
  %297 = load i8, i8* %296, align 1, !tbaa !247
  %298 = insertelement <64 x i8> %293, i8 %297, i32 40
  %299 = extractelement <64 x i32> %93, i32 41
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds i8, i8* %input, i64 %300
  %302 = load i8, i8* %301, align 1, !tbaa !247
  %303 = insertelement <64 x i8> %298, i8 %302, i32 41
  %304 = extractelement <64 x i32> %93, i32 42
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i8, i8* %input, i64 %305
  %307 = load i8, i8* %306, align 1, !tbaa !247
  %308 = insertelement <64 x i8> %303, i8 %307, i32 42
  %309 = extractelement <64 x i32> %93, i32 43
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds i8, i8* %input, i64 %310
  %312 = load i8, i8* %311, align 1, !tbaa !247
  %313 = insertelement <64 x i8> %308, i8 %312, i32 43
  %314 = extractelement <64 x i32> %93, i32 44
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i8, i8* %input, i64 %315
  %317 = load i8, i8* %316, align 1, !tbaa !247
  %318 = insertelement <64 x i8> %313, i8 %317, i32 44
  %319 = extractelement <64 x i32> %93, i32 45
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds i8, i8* %input, i64 %320
  %322 = load i8, i8* %321, align 1, !tbaa !247
  %323 = insertelement <64 x i8> %318, i8 %322, i32 45
  %324 = extractelement <64 x i32> %93, i32 46
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds i8, i8* %input, i64 %325
  %327 = load i8, i8* %326, align 1, !tbaa !247
  %328 = insertelement <64 x i8> %323, i8 %327, i32 46
  %329 = extractelement <64 x i32> %93, i32 47
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds i8, i8* %input, i64 %330
  %332 = load i8, i8* %331, align 1, !tbaa !247
  %333 = insertelement <64 x i8> %328, i8 %332, i32 47
  %334 = extractelement <64 x i32> %93, i32 48
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds i8, i8* %input, i64 %335
  %337 = load i8, i8* %336, align 1, !tbaa !247
  %338 = insertelement <64 x i8> %333, i8 %337, i32 48
  %339 = extractelement <64 x i32> %93, i32 49
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds i8, i8* %input, i64 %340
  %342 = load i8, i8* %341, align 1, !tbaa !247
  %343 = insertelement <64 x i8> %338, i8 %342, i32 49
  %344 = extractelement <64 x i32> %93, i32 50
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds i8, i8* %input, i64 %345
  %347 = load i8, i8* %346, align 1, !tbaa !247
  %348 = insertelement <64 x i8> %343, i8 %347, i32 50
  %349 = extractelement <64 x i32> %93, i32 51
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds i8, i8* %input, i64 %350
  %352 = load i8, i8* %351, align 1, !tbaa !247
  %353 = insertelement <64 x i8> %348, i8 %352, i32 51
  %354 = extractelement <64 x i32> %93, i32 52
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds i8, i8* %input, i64 %355
  %357 = load i8, i8* %356, align 1, !tbaa !247
  %358 = insertelement <64 x i8> %353, i8 %357, i32 52
  %359 = extractelement <64 x i32> %93, i32 53
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i8, i8* %input, i64 %360
  %362 = load i8, i8* %361, align 1, !tbaa !247
  %363 = insertelement <64 x i8> %358, i8 %362, i32 53
  %364 = extractelement <64 x i32> %93, i32 54
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i8, i8* %input, i64 %365
  %367 = load i8, i8* %366, align 1, !tbaa !247
  %368 = insertelement <64 x i8> %363, i8 %367, i32 54
  %369 = extractelement <64 x i32> %93, i32 55
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i8, i8* %input, i64 %370
  %372 = load i8, i8* %371, align 1, !tbaa !247
  %373 = insertelement <64 x i8> %368, i8 %372, i32 55
  %374 = extractelement <64 x i32> %93, i32 56
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds i8, i8* %input, i64 %375
  %377 = load i8, i8* %376, align 1, !tbaa !247
  %378 = insertelement <64 x i8> %373, i8 %377, i32 56
  %379 = extractelement <64 x i32> %93, i32 57
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds i8, i8* %input, i64 %380
  %382 = load i8, i8* %381, align 1, !tbaa !247
  %383 = insertelement <64 x i8> %378, i8 %382, i32 57
  %384 = extractelement <64 x i32> %93, i32 58
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds i8, i8* %input, i64 %385
  %387 = load i8, i8* %386, align 1, !tbaa !247
  %388 = insertelement <64 x i8> %383, i8 %387, i32 58
  %389 = extractelement <64 x i32> %93, i32 59
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds i8, i8* %input, i64 %390
  %392 = load i8, i8* %391, align 1, !tbaa !247
  %393 = insertelement <64 x i8> %388, i8 %392, i32 59
  %394 = extractelement <64 x i32> %93, i32 60
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds i8, i8* %input, i64 %395
  %397 = load i8, i8* %396, align 1, !tbaa !247
  %398 = insertelement <64 x i8> %393, i8 %397, i32 60
  %399 = extractelement <64 x i32> %93, i32 61
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds i8, i8* %input, i64 %400
  %402 = load i8, i8* %401, align 1, !tbaa !247
  %403 = insertelement <64 x i8> %398, i8 %402, i32 61
  %404 = extractelement <64 x i32> %93, i32 62
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds i8, i8* %input, i64 %405
  %407 = load i8, i8* %406, align 1, !tbaa !247
  %408 = insertelement <64 x i8> %403, i8 %407, i32 62
  %409 = extractelement <64 x i32> %93, i32 63
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds i8, i8* %input, i64 %410
  %412 = load i8, i8* %411, align 1, !tbaa !247
  %413 = insertelement <64 x i8> %408, i8 %412, i32 63
  %414 = sext i32 %repeat_edge.s0._0._0i.base.s to i64
  %415 = add nsw i64 %414, %64
  %416 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %415
  %417 = bitcast i8* %416 to <64 x i8>*
  store <64 x i8> %413, <64 x i8>* %417, align 1, !tbaa !250
  %418 = add nuw nsw i32 %repeat_edge.s0._0._0, 1
  %419 = icmp eq i32 %418, 5
  br i1 %419, label %"end for repeat_edge.s0._0._0", label %"for repeat_edge.s0._0._0"

"end for repeat_edge.s0._0._0":                   ; preds = %"for repeat_edge.s0._0._0"
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %420 = icmp eq i32 %52, %56
  br i1 %420, label %"consume repeat_edge", label %"for repeat_edge.s0._1"

"consume repeat_edge":                            ; preds = %"end for repeat_edge.s0._0._0"
  %t90 = add nsw i32 %t82, -256
  %max_y51.0.sroa_cast71 = bitcast [128 x i8]* %max_y51 to <64 x i8>*
  %max_y51.64.sroa_idx83 = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 64
  %max_y51.64.sroa_cast84 = bitcast i8* %max_y51.64.sroa_idx83 to <64 x i8>*
  %max_y51.1.sroa_idx75 = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 1
  %max_y51.1.sroa_cast76 = bitcast i8* %max_y51.1.sroa_idx75 to <64 x i8>*
  %max_y51.2.sroa_idx79 = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 2
  %max_y51.2.sroa_cast80 = bitcast i8* %max_y51.2.sroa_idx79 to <64 x i8>*
  br label %"for output.s0.y.yi"

"for output.s0.y.yi":                             ; preds = %"end for output.s0.x.xi.xi", %"consume repeat_edge"
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %"end for output.s0.x.xi.xi" ], [ 0, %"consume repeat_edge" ]
  %421 = mul nuw nsw i64 %indvars.iv122, 5
  %422 = trunc i64 %indvars.iv122 to i32
  %423 = add nsw i32 %a41, %422
  %424 = mul nsw i32 %423, %output.stride.1
  %t92 = add nsw i32 %t90, %424
  %425 = sext i32 %t92 to i64
  br label %"for output.s0.x.xi.xi"

"for output.s0.x.xi.xi":                          ; preds = %"for output.s0.x.xi.xi", %"for output.s0.y.yi"
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %"for output.s0.x.xi.xi" ], [ 0, %"for output.s0.y.yi" ]
  %426 = add nuw nsw i64 %indvars.iv119, %421
  %427 = shl nuw nsw i64 %426, 6
  %428 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %427
  %429 = bitcast i8* %428 to <64 x i8>*
  %430 = load <64 x i8>, <64 x i8>* %429, align 64, !tbaa !250
  %431 = add nuw nsw i64 %427, 64
  %432 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %431
  %433 = bitcast i8* %432 to <64 x i8>*
  %434 = load <64 x i8>, <64 x i8>* %433, align 64, !tbaa !250
  %435 = add nuw nsw i64 %427, 320
  %436 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %435
  %437 = bitcast i8* %436 to <64 x i8>*
  %438 = load <64 x i8>, <64 x i8>* %437, align 64, !tbaa !250
  %439 = add nuw nsw i64 %427, 384
  %440 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %439
  %441 = bitcast i8* %440 to <64 x i8>*
  %442 = load <64 x i8>, <64 x i8>* %441, align 64, !tbaa !250
  %443 = add nuw nsw i64 %427, 640
  %444 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %443
  %445 = bitcast i8* %444 to <64 x i8>*
  %446 = load <64 x i8>, <64 x i8>* %445, align 64, !tbaa !250
  %447 = add nuw nsw i64 %427, 704
  %448 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %447
  %449 = bitcast i8* %448 to <64 x i8>*
  %450 = load <64 x i8>, <64 x i8>* %449, align 64, !tbaa !250
  %451 = icmp ugt <64 x i8> %438, %446
  %b35 = select <64 x i1> %451, <64 x i8> %438, <64 x i8> %446
  %452 = icmp ugt <64 x i8> %430, %b35
  %453 = select <64 x i1> %452, <64 x i8> %430, <64 x i8> %b35
  store <64 x i8> %453, <64 x i8>* %max_y51.0.sroa_cast71, align 64
  %454 = icmp ugt <64 x i8> %442, %450
  %b37 = select <64 x i1> %454, <64 x i8> %442, <64 x i8> %450
  %455 = icmp ugt <64 x i8> %434, %b37
  %456 = select <64 x i1> %455, <64 x i8> %434, <64 x i8> %b37
  store <64 x i8> %456, <64 x i8>* %max_y51.64.sroa_cast84, align 64
  %max_y51.1.a38 = load <64 x i8>, <64 x i8>* %max_y51.1.sroa_cast76, align 1
  %max_y51.2.b40 = load <64 x i8>, <64 x i8>* %max_y51.2.sroa_cast80, align 2
  %457 = icmp ugt <64 x i8> %max_y51.1.a38, %max_y51.2.b40
  %b39 = select <64 x i1> %457, <64 x i8> %max_y51.1.a38, <64 x i8> %max_y51.2.b40
  %458 = icmp ugt <64 x i8> %453, %b39
  %459 = select <64 x i1> %458, <64 x i8> %453, <64 x i8> %b39
  %460 = shl nuw nsw i64 %indvars.iv119, 6
  %461 = add nsw i64 %460, %425
  %462 = getelementptr inbounds i8, i8* %output, i64 %461
  %463 = bitcast i8* %462 to <64 x i8>*
  store <64 x i8> %459, <64 x i8>* %463, align 1, !tbaa !252
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %464 = icmp eq i64 %indvars.iv.next120, 4
  br i1 %464, label %"end for output.s0.x.xi.xi", label %"for output.s0.x.xi.xi"

"end for output.s0.x.xi.xi":                      ; preds = %"for output.s0.x.xi.xi"
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %465 = icmp eq i64 %indvars.iv.next123, 32
  br i1 %465, label %after_bb, label %"for output.s0.y.yi"

"for output.s0.x.x":                              ; preds = %"end for output.s0.y.yi20", %"for output.s0.x.x.preheader"
  %output.s0.x.x = phi i32 [ %549, %"end for output.s0.y.yi20" ], [ %t84, %"for output.s0.x.x.preheader" ]
  %a50 = shl nsw i32 %output.s0.x.x, 8
  %466 = icmp sgt i32 %b67, %a50
  %output.s0.x.xi.base = select i1 %466, i32 %a50, i32 %b67
  %t106 = add nsw i32 %output.s0.x.xi.base, -1
  br i1 %38, label %"for repeat_edge.s0._12.preheader", label %"end for repeat_edge.s0._13", !prof !242

"for repeat_edge.s0._12.preheader":               ; preds = %"for output.s0.x.x"
  br label %"for repeat_edge.s0._12"

"end for output.s0.x.x":                          ; preds = %"end for output.s0.y.yi20", %after_bb
  %467 = icmp slt i32 %t71, %t83
  br i1 %467, label %"for output.s0.x.x29.preheader", label %destructor_block, !prof !242

"for output.s0.x.x29.preheader":                  ; preds = %"end for output.s0.x.x"
  %468 = add nsw i32 %a41, -1
  %469 = insertelement <64 x i32> undef, i32 %t75, i32 0
  %470 = shufflevector <64 x i32> %469, <64 x i32> undef, <16 x i32> zeroinitializer
  %471 = add nsw i32 %a41, 32
  %max_y51.0.sroa_cast = bitcast [128 x i8]* %max_y51 to <64 x i8>*
  %max_y51.64.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 64
  %max_y51.64.sroa_cast = bitcast i8* %max_y51.64.sroa_idx to <64 x i8>*
  %max_y51.1.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 1
  %max_y51.1.sroa_cast = bitcast i8* %max_y51.1.sroa_idx to <64 x i8>*
  %max_y51.2.sroa_idx = getelementptr inbounds [128 x i8], [128 x i8]* %max_y51, i64 0, i64 2
  %max_y51.2.sroa_cast = bitcast i8* %max_y51.2.sroa_idx to <64 x i8>*
  %472 = sext i32 %468 to i64
  %473 = sext i32 %b31 to i64
  %474 = sext i32 %a41 to i64
  br label %"for output.s0.x.x29"

"for repeat_edge.s0._12":                         ; preds = %"end for repeat_edge.s0._0._05", %"for repeat_edge.s0._12.preheader"
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %"end for repeat_edge.s0._0._05" ], [ %44, %"for repeat_edge.s0._12.preheader" ]
  %475 = icmp slt i64 %indvars.iv97, %45
  %476 = trunc i64 %indvars.iv97 to i32
  %a51 = select i1 %475, i32 %476, i32 %b31
  %477 = icmp sgt i32 %a51, 0
  %478 = select i1 %477, i32 %a51, i32 0
  %479 = mul nsw i32 %478, %input.stride.1
  %t107 = add nsw i32 %479, %t106
  %480 = sub nsw i64 %indvars.iv97, %43
  %481 = mul nsw i64 %480, 320
  %482 = add nsw i64 %481, 320
  %483 = sext i32 %t107 to i64
  br label %"for repeat_edge.s0._0._04"

"end for repeat_edge.s0._13":                     ; preds = %"end for repeat_edge.s0._0._05", %"for output.s0.x.x"
  br i1 %40, label %"end for repeat_edge.s0._18", label %"for repeat_edge.s0._17.preheader", !prof !241

"for repeat_edge.s0._17.preheader":               ; preds = %"end for repeat_edge.s0._13"
  %t111 = add nsw i32 %output.s0.x.xi.base, 193
  %484 = sext i32 %t111 to i64
  %485 = sext i32 %t106 to i64
  br label %"for repeat_edge.s0._17"

"for repeat_edge.s0._0._04":                      ; preds = %"for repeat_edge.s0._0._04", %"for repeat_edge.s0._12"
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %"for repeat_edge.s0._0._04" ], [ 0, %"for repeat_edge.s0._12" ]
  %a53 = shl nuw nsw i64 %indvars.iv95, 6
  %486 = icmp ult i64 %a53, 194
  %487 = select i1 %486, i64 %a53, i64 194
  %488 = add nsw i64 %487, %483
  %489 = getelementptr inbounds i8, i8* %input, i64 %488
  %490 = bitcast i8* %489 to <64 x i8>*
  %491 = load <64 x i8>, <64 x i8>* %490, align 1, !tbaa !247
  %492 = add nsw i64 %487, %482
  %493 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %492
  %494 = bitcast i8* %493 to <64 x i8>*
  store <64 x i8> %491, <64 x i8>* %494, align 2, !tbaa !250
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %495 = icmp eq i64 %indvars.iv.next96, 5
  br i1 %495, label %"end for repeat_edge.s0._0._05", label %"for repeat_edge.s0._0._04"

"end for repeat_edge.s0._0._05":                  ; preds = %"for repeat_edge.s0._0._04"
  %indvars.iv.next98 = add nsw i64 %indvars.iv97, 1
  %496 = trunc i64 %indvars.iv.next98 to i32
  %497 = icmp eq i32 %37, %496
  br i1 %497, label %"end for repeat_edge.s0._13", label %"for repeat_edge.s0._12"

"for repeat_edge.s0._17":                         ; preds = %"end for repeat_edge.s0._0._010", %"for repeat_edge.s0._17.preheader"
  %indvars.iv104 = phi i64 [ %46, %"for repeat_edge.s0._17.preheader" ], [ %indvars.iv.next105, %"end for repeat_edge.s0._0._010" ]
  %498 = sub nsw i64 %indvars.iv104, %43
  %499 = mul nsw i64 %498, 5
  %500 = mul nsw i64 %indvars.iv104, %42
  %501 = add nsw i64 %500, %485
  br label %"for repeat_edge.s0._0._09"

"end for repeat_edge.s0._18":                     ; preds = %"end for repeat_edge.s0._0._010", %"end for repeat_edge.s0._13"
  br i1 %41, label %"for repeat_edge.s0._112.preheader", label %"for output.s0.y.yi19.preheader", !prof !242

"for repeat_edge.s0._112.preheader":              ; preds = %"end for repeat_edge.s0._18"
  br label %"for repeat_edge.s0._112"

"for repeat_edge.s0._0._09":                      ; preds = %"for repeat_edge.s0._0._09", %"for repeat_edge.s0._17"
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %"for repeat_edge.s0._0._09" ], [ 0, %"for repeat_edge.s0._17" ]
  %502 = shl nuw nsw i64 %indvars.iv100, 6
  %503 = add nsw i64 %502, %501
  %504 = getelementptr inbounds i8, i8* %input, i64 %503
  %505 = bitcast i8* %504 to <64 x i8>*
  %506 = load <64 x i8>, <64 x i8>* %505, align 1, !tbaa !247
  %507 = add nsw i64 %indvars.iv100, %499
  %508 = shl nsw i64 %507, 6
  %509 = add nsw i64 %508, 320
  %510 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %509
  %511 = bitcast i8* %510 to <64 x i8>*
  store <64 x i8> %506, <64 x i8>* %511, align 64, !tbaa !250
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %512 = icmp eq i64 %indvars.iv.next101, 4
  br i1 %512, label %"end for repeat_edge.s0._0._010", label %"for repeat_edge.s0._0._09"

"end for repeat_edge.s0._0._010":                 ; preds = %"for repeat_edge.s0._0._09"
  %513 = add nsw i64 %500, %484
  %514 = getelementptr inbounds i8, i8* %input, i64 %513
  %515 = bitcast i8* %514 to <64 x i8>*
  %516 = load <64 x i8>, <64 x i8>* %515, align 1, !tbaa !247
  %517 = mul nsw i64 %498, 320
  %518 = add nsw i64 %517, 514
  %519 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %518
  %520 = bitcast i8* %519 to <64 x i8>*
  store <64 x i8> %516, <64 x i8>* %520, align 2, !tbaa !250
  %indvars.iv.next105 = add nsw i64 %indvars.iv104, 1
  %521 = trunc i64 %indvars.iv.next105 to i32
  %522 = icmp eq i32 %39, %521
  br i1 %522, label %"end for repeat_edge.s0._18", label %"for repeat_edge.s0._17"

"for repeat_edge.s0._112":                        ; preds = %"end for repeat_edge.s0._0._016", %"for repeat_edge.s0._112.preheader"
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %"end for repeat_edge.s0._0._016" ], [ %47, %"for repeat_edge.s0._112.preheader" ]
  %523 = icmp slt i64 %indvars.iv110, %45
  %524 = trunc i64 %indvars.iv110 to i32
  %a55 = select i1 %523, i32 %524, i32 %b31
  %525 = icmp sgt i32 %a55, 0
  %526 = select i1 %525, i32 %a55, i32 0
  %527 = mul nsw i32 %526, %input.stride.1
  %t115 = add nsw i32 %527, %t106
  %528 = sub nsw i64 %indvars.iv110, %43
  %529 = mul nsw i64 %528, 320
  %530 = add nsw i64 %529, 320
  %531 = sext i32 %t115 to i64
  br label %"for repeat_edge.s0._0._015"

"for repeat_edge.s0._0._015":                     ; preds = %"for repeat_edge.s0._0._015", %"for repeat_edge.s0._112"
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %"for repeat_edge.s0._0._015" ], [ 0, %"for repeat_edge.s0._112" ]
  %a57 = shl nuw nsw i64 %indvars.iv108, 6
  %532 = icmp ult i64 %a57, 194
  %533 = select i1 %532, i64 %a57, i64 194
  %534 = add nsw i64 %533, %531
  %535 = getelementptr inbounds i8, i8* %input, i64 %534
  %536 = bitcast i8* %535 to <64 x i8>*
  %537 = load <64 x i8>, <64 x i8>* %536, align 1, !tbaa !247
  %538 = add nsw i64 %533, %530
  %539 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %538
  %540 = bitcast i8* %539 to <64 x i8>*
  store <64 x i8> %537, <64 x i8>* %540, align 2, !tbaa !250
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %541 = icmp eq i64 %indvars.iv.next109, 5
  br i1 %541, label %"end for repeat_edge.s0._0._016", label %"for repeat_edge.s0._0._015"

"end for repeat_edge.s0._0._016":                 ; preds = %"for repeat_edge.s0._0._015"
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  %542 = trunc i64 %indvars.iv.next111 to i32
  %543 = icmp eq i32 %a42, %542
  br i1 %543, label %"for output.s0.y.yi19.preheader", label %"for repeat_edge.s0._112"

"for output.s0.y.yi19.preheader":                 ; preds = %"end for repeat_edge.s0._0._016", %"end for repeat_edge.s0._18"
  br label %"for output.s0.y.yi19"

"for output.s0.y.yi19":                           ; preds = %"end for output.s0.x.xi.xi23", %"for output.s0.y.yi19.preheader"
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %"end for output.s0.x.xi.xi23" ], [ 0, %"for output.s0.y.yi19.preheader" ]
  %544 = mul nuw nsw i64 %indvars.iv116, 5
  %545 = trunc i64 %indvars.iv116 to i32
  %546 = add nsw i32 %a41, %545
  %547 = mul nsw i32 %546, %output.stride.1
  %t118 = add nsw i32 %547, %output.s0.x.xi.base
  %548 = sext i32 %t118 to i64
  br label %"for output.s0.x.xi.xi22"

"end for output.s0.y.yi20":                       ; preds = %"end for output.s0.x.xi.xi23"
  %549 = add nsw i32 %output.s0.x.x, 1
  %550 = icmp eq i32 %549, %t71
  br i1 %550, label %"end for output.s0.x.x", label %"for output.s0.x.x"

"for output.s0.x.xi.xi22":                        ; preds = %"for output.s0.x.xi.xi22", %"for output.s0.y.yi19"
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %"for output.s0.x.xi.xi22" ], [ 0, %"for output.s0.y.yi19" ]
  %551 = add nuw nsw i64 %indvars.iv113, %544
  %552 = shl nuw nsw i64 %551, 6
  %553 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %552
  %554 = bitcast i8* %553 to <64 x i8>*
  %555 = load <64 x i8>, <64 x i8>* %554, align 64, !tbaa !250
  %556 = add nuw nsw i64 %552, 64
  %557 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %556
  %558 = bitcast i8* %557 to <64 x i8>*
  %559 = load <64 x i8>, <64 x i8>* %558, align 64, !tbaa !250
  %560 = add nuw nsw i64 %552, 320
  %561 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %560
  %562 = bitcast i8* %561 to <64 x i8>*
  %563 = load <64 x i8>, <64 x i8>* %562, align 64, !tbaa !250
  %564 = add nuw nsw i64 %552, 384
  %565 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %564
  %566 = bitcast i8* %565 to <64 x i8>*
  %567 = load <64 x i8>, <64 x i8>* %566, align 64, !tbaa !250
  %568 = add nuw nsw i64 %552, 640
  %569 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %568
  %570 = bitcast i8* %569 to <64 x i8>*
  %571 = load <64 x i8>, <64 x i8>* %570, align 64, !tbaa !250
  %572 = add nuw nsw i64 %552, 704
  %573 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %572
  %574 = bitcast i8* %573 to <64 x i8>*
  %575 = load <64 x i8>, <64 x i8>* %574, align 64, !tbaa !250
  %576 = icmp ugt <64 x i8> %563, %571
  %b61 = select <64 x i1> %576, <64 x i8> %563, <64 x i8> %571
  %577 = icmp ugt <64 x i8> %555, %b61
  %578 = select <64 x i1> %577, <64 x i8> %555, <64 x i8> %b61
  store <64 x i8> %578, <64 x i8>* %max_y51.0.sroa_cast69, align 64
  %579 = icmp ugt <64 x i8> %567, %575
  %b63 = select <64 x i1> %579, <64 x i8> %567, <64 x i8> %575
  %580 = icmp ugt <64 x i8> %559, %b63
  %581 = select <64 x i1> %580, <64 x i8> %559, <64 x i8> %b63
  store <64 x i8> %581, <64 x i8>* %max_y51.64.sroa_cast82, align 64
  %max_y51.1.a64 = load <64 x i8>, <64 x i8>* %max_y51.1.sroa_cast74, align 1
  %max_y51.2.b66 = load <64 x i8>, <64 x i8>* %max_y51.2.sroa_cast78, align 2
  %582 = icmp ugt <64 x i8> %max_y51.1.a64, %max_y51.2.b66
  %b65 = select <64 x i1> %582, <64 x i8> %max_y51.1.a64, <64 x i8> %max_y51.2.b66
  %583 = icmp ugt <64 x i8> %578, %b65
  %584 = select <64 x i1> %583, <64 x i8> %578, <64 x i8> %b65
  %585 = shl nuw nsw i64 %indvars.iv113, 6
  %586 = add nsw i64 %585, %548
  %587 = getelementptr inbounds i8, i8* %output, i64 %586
  %588 = bitcast i8* %587 to <64 x i8>*
  store <64 x i8> %584, <64 x i8>* %588, align 1, !tbaa !252
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %589 = icmp eq i64 %indvars.iv.next114, 4
  br i1 %589, label %"end for output.s0.x.xi.xi23", label %"for output.s0.x.xi.xi22"

"end for output.s0.x.xi.xi23":                    ; preds = %"for output.s0.x.xi.xi22"
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %590 = icmp eq i64 %indvars.iv.next117, 32
  br i1 %590, label %"end for output.s0.y.yi20", label %"for output.s0.y.yi19"

"for output.s0.x.x29":                            ; preds = %"end for output.s0.y.yi42", %"for output.s0.x.x29.preheader"
  %output.s0.x.x31 = phi i32 [ %964, %"end for output.s0.y.yi42" ], [ %t71, %"for output.s0.x.x29.preheader" ]
  %a65 = shl nsw i32 %output.s0.x.x31, 8
  %591 = icmp sgt i32 %b67, %a65
  %output.s0.x.xi.base32 = select i1 %591, i32 %a65, i32 %b67
  %t123 = add nsw i32 %output.s0.x.xi.base32, -1
  br label %"for repeat_edge.s0._134"

"for repeat_edge.s0._134":                        ; preds = %"end for repeat_edge.s0._0._038", %"for output.s0.x.x29"
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %"end for repeat_edge.s0._0._038" ], [ %472, %"for output.s0.x.x29" ]
  %592 = icmp slt i64 %indvars.iv86, %473
  %593 = trunc i64 %indvars.iv86 to i32
  %a66 = select i1 %592, i32 %593, i32 %b31
  %594 = icmp sgt i32 %a66, 0
  %595 = select i1 %594, i32 %a66, i32 0
  %t124 = mul nsw i32 %595, %input.stride.1
  %596 = sub nsw i64 %indvars.iv86, %474
  %597 = mul nsw i64 %596, 320
  %598 = add nsw i64 %597, 320
  %599 = insertelement <64 x i32> undef, i32 %t124, i32 0
  %600 = shufflevector <64 x i32> %599, <64 x i32> undef, <64 x i32> zeroinitializer
  br label %"for repeat_edge.s0._0._037"

"for repeat_edge.s0._0._037":                     ; preds = %"for repeat_edge.s0._0._037", %"for repeat_edge.s0._134"
  %indvars.iv = phi i64 [ %indvars.iv.next, %"for repeat_edge.s0._0._037" ], [ 0, %"for repeat_edge.s0._134" ]
  %601 = shl nsw i64 %indvars.iv, 6
  %602 = icmp ult i64 %601, 194
  %603 = icmp ult i64 %601, 194
  %604 = select i1 %603, i64 %601, i64 194
  %605 = trunc i64 %604 to i32
  %606 = add nsw i32 %t123, %605
  %607 = insertelement <64 x i32> undef, i32 %606, i32 0
  %608 = shufflevector <64 x i32> %607, <64 x i32> undef, <64 x i32> zeroinitializer
  %a69 = add nsw <64 x i32> %608, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %609 = shufflevector <64 x i32> %a69, <64 x i32> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %610 = icmp sgt <16 x i32> %470, %609
  %611 = shufflevector <64 x i32> %a69, <64 x i32> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %612 = icmp sgt <16 x i32> %470, %611
  %613 = shufflevector <64 x i32> %a69, <64 x i32> undef, <16 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %614 = icmp sgt <16 x i32> %470, %613
  %615 = shufflevector <64 x i32> %a69, <64 x i32> undef, <16 x i32> <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %616 = icmp sgt <16 x i32> %470, %615
  %617 = select <16 x i1> %610, <16 x i32> %609, <16 x i32> %470
  %618 = select <16 x i1> %612, <16 x i32> %611, <16 x i32> %470
  %619 = select <16 x i1> %614, <16 x i32> %613, <16 x i32> %470
  %620 = select <16 x i1> %616, <16 x i32> %615, <16 x i32> %470
  %621 = icmp sgt <16 x i32> %617, zeroinitializer
  %622 = icmp sgt <16 x i32> %618, zeroinitializer
  %623 = icmp sgt <16 x i32> %619, zeroinitializer
  %624 = icmp sgt <16 x i32> %620, zeroinitializer
  %625 = select <16 x i1> %621, <16 x i32> %617, <16 x i32> zeroinitializer
  %626 = select <16 x i1> %622, <16 x i32> %618, <16 x i32> zeroinitializer
  %627 = select <16 x i1> %623, <16 x i32> %619, <16 x i32> zeroinitializer
  %628 = select <16 x i1> %624, <16 x i32> %620, <16 x i32> zeroinitializer
  %629 = shufflevector <16 x i32> %625, <16 x i32> %626, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %630 = shufflevector <16 x i32> %627, <16 x i32> %628, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %631 = shufflevector <32 x i32> %629, <32 x i32> %630, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %632 = add nsw <64 x i32> %631, %600
  %633 = extractelement <64 x i32> %632, i32 0
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds i8, i8* %input, i64 %634
  %636 = load i8, i8* %635, align 1, !tbaa !247
  %637 = insertelement <64 x i8> undef, i8 %636, i32 0
  %638 = extractelement <64 x i32> %632, i32 1
  %639 = sext i32 %638 to i64
  %640 = getelementptr inbounds i8, i8* %input, i64 %639
  %641 = load i8, i8* %640, align 1, !tbaa !247
  %642 = insertelement <64 x i8> %637, i8 %641, i32 1
  %643 = extractelement <64 x i32> %632, i32 2
  %644 = sext i32 %643 to i64
  %645 = getelementptr inbounds i8, i8* %input, i64 %644
  %646 = load i8, i8* %645, align 1, !tbaa !247
  %647 = insertelement <64 x i8> %642, i8 %646, i32 2
  %648 = extractelement <64 x i32> %632, i32 3
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds i8, i8* %input, i64 %649
  %651 = load i8, i8* %650, align 1, !tbaa !247
  %652 = insertelement <64 x i8> %647, i8 %651, i32 3
  %653 = extractelement <64 x i32> %632, i32 4
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds i8, i8* %input, i64 %654
  %656 = load i8, i8* %655, align 1, !tbaa !247
  %657 = insertelement <64 x i8> %652, i8 %656, i32 4
  %658 = extractelement <64 x i32> %632, i32 5
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds i8, i8* %input, i64 %659
  %661 = load i8, i8* %660, align 1, !tbaa !247
  %662 = insertelement <64 x i8> %657, i8 %661, i32 5
  %663 = extractelement <64 x i32> %632, i32 6
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds i8, i8* %input, i64 %664
  %666 = load i8, i8* %665, align 1, !tbaa !247
  %667 = insertelement <64 x i8> %662, i8 %666, i32 6
  %668 = extractelement <64 x i32> %632, i32 7
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds i8, i8* %input, i64 %669
  %671 = load i8, i8* %670, align 1, !tbaa !247
  %672 = insertelement <64 x i8> %667, i8 %671, i32 7
  %673 = extractelement <64 x i32> %632, i32 8
  %674 = sext i32 %673 to i64
  %675 = getelementptr inbounds i8, i8* %input, i64 %674
  %676 = load i8, i8* %675, align 1, !tbaa !247
  %677 = insertelement <64 x i8> %672, i8 %676, i32 8
  %678 = extractelement <64 x i32> %632, i32 9
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds i8, i8* %input, i64 %679
  %681 = load i8, i8* %680, align 1, !tbaa !247
  %682 = insertelement <64 x i8> %677, i8 %681, i32 9
  %683 = extractelement <64 x i32> %632, i32 10
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds i8, i8* %input, i64 %684
  %686 = load i8, i8* %685, align 1, !tbaa !247
  %687 = insertelement <64 x i8> %682, i8 %686, i32 10
  %688 = extractelement <64 x i32> %632, i32 11
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds i8, i8* %input, i64 %689
  %691 = load i8, i8* %690, align 1, !tbaa !247
  %692 = insertelement <64 x i8> %687, i8 %691, i32 11
  %693 = extractelement <64 x i32> %632, i32 12
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds i8, i8* %input, i64 %694
  %696 = load i8, i8* %695, align 1, !tbaa !247
  %697 = insertelement <64 x i8> %692, i8 %696, i32 12
  %698 = extractelement <64 x i32> %632, i32 13
  %699 = sext i32 %698 to i64
  %700 = getelementptr inbounds i8, i8* %input, i64 %699
  %701 = load i8, i8* %700, align 1, !tbaa !247
  %702 = insertelement <64 x i8> %697, i8 %701, i32 13
  %703 = extractelement <64 x i32> %632, i32 14
  %704 = sext i32 %703 to i64
  %705 = getelementptr inbounds i8, i8* %input, i64 %704
  %706 = load i8, i8* %705, align 1, !tbaa !247
  %707 = insertelement <64 x i8> %702, i8 %706, i32 14
  %708 = extractelement <64 x i32> %632, i32 15
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds i8, i8* %input, i64 %709
  %711 = load i8, i8* %710, align 1, !tbaa !247
  %712 = insertelement <64 x i8> %707, i8 %711, i32 15
  %713 = extractelement <64 x i32> %632, i32 16
  %714 = sext i32 %713 to i64
  %715 = getelementptr inbounds i8, i8* %input, i64 %714
  %716 = load i8, i8* %715, align 1, !tbaa !247
  %717 = insertelement <64 x i8> %712, i8 %716, i32 16
  %718 = extractelement <64 x i32> %632, i32 17
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds i8, i8* %input, i64 %719
  %721 = load i8, i8* %720, align 1, !tbaa !247
  %722 = insertelement <64 x i8> %717, i8 %721, i32 17
  %723 = extractelement <64 x i32> %632, i32 18
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds i8, i8* %input, i64 %724
  %726 = load i8, i8* %725, align 1, !tbaa !247
  %727 = insertelement <64 x i8> %722, i8 %726, i32 18
  %728 = extractelement <64 x i32> %632, i32 19
  %729 = sext i32 %728 to i64
  %730 = getelementptr inbounds i8, i8* %input, i64 %729
  %731 = load i8, i8* %730, align 1, !tbaa !247
  %732 = insertelement <64 x i8> %727, i8 %731, i32 19
  %733 = extractelement <64 x i32> %632, i32 20
  %734 = sext i32 %733 to i64
  %735 = getelementptr inbounds i8, i8* %input, i64 %734
  %736 = load i8, i8* %735, align 1, !tbaa !247
  %737 = insertelement <64 x i8> %732, i8 %736, i32 20
  %738 = extractelement <64 x i32> %632, i32 21
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds i8, i8* %input, i64 %739
  %741 = load i8, i8* %740, align 1, !tbaa !247
  %742 = insertelement <64 x i8> %737, i8 %741, i32 21
  %743 = extractelement <64 x i32> %632, i32 22
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds i8, i8* %input, i64 %744
  %746 = load i8, i8* %745, align 1, !tbaa !247
  %747 = insertelement <64 x i8> %742, i8 %746, i32 22
  %748 = extractelement <64 x i32> %632, i32 23
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds i8, i8* %input, i64 %749
  %751 = load i8, i8* %750, align 1, !tbaa !247
  %752 = insertelement <64 x i8> %747, i8 %751, i32 23
  %753 = extractelement <64 x i32> %632, i32 24
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds i8, i8* %input, i64 %754
  %756 = load i8, i8* %755, align 1, !tbaa !247
  %757 = insertelement <64 x i8> %752, i8 %756, i32 24
  %758 = extractelement <64 x i32> %632, i32 25
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds i8, i8* %input, i64 %759
  %761 = load i8, i8* %760, align 1, !tbaa !247
  %762 = insertelement <64 x i8> %757, i8 %761, i32 25
  %763 = extractelement <64 x i32> %632, i32 26
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds i8, i8* %input, i64 %764
  %766 = load i8, i8* %765, align 1, !tbaa !247
  %767 = insertelement <64 x i8> %762, i8 %766, i32 26
  %768 = extractelement <64 x i32> %632, i32 27
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds i8, i8* %input, i64 %769
  %771 = load i8, i8* %770, align 1, !tbaa !247
  %772 = insertelement <64 x i8> %767, i8 %771, i32 27
  %773 = extractelement <64 x i32> %632, i32 28
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds i8, i8* %input, i64 %774
  %776 = load i8, i8* %775, align 1, !tbaa !247
  %777 = insertelement <64 x i8> %772, i8 %776, i32 28
  %778 = extractelement <64 x i32> %632, i32 29
  %779 = sext i32 %778 to i64
  %780 = getelementptr inbounds i8, i8* %input, i64 %779
  %781 = load i8, i8* %780, align 1, !tbaa !247
  %782 = insertelement <64 x i8> %777, i8 %781, i32 29
  %783 = extractelement <64 x i32> %632, i32 30
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds i8, i8* %input, i64 %784
  %786 = load i8, i8* %785, align 1, !tbaa !247
  %787 = insertelement <64 x i8> %782, i8 %786, i32 30
  %788 = extractelement <64 x i32> %632, i32 31
  %789 = sext i32 %788 to i64
  %790 = getelementptr inbounds i8, i8* %input, i64 %789
  %791 = load i8, i8* %790, align 1, !tbaa !247
  %792 = insertelement <64 x i8> %787, i8 %791, i32 31
  %793 = extractelement <64 x i32> %632, i32 32
  %794 = sext i32 %793 to i64
  %795 = getelementptr inbounds i8, i8* %input, i64 %794
  %796 = load i8, i8* %795, align 1, !tbaa !247
  %797 = insertelement <64 x i8> %792, i8 %796, i32 32
  %798 = extractelement <64 x i32> %632, i32 33
  %799 = sext i32 %798 to i64
  %800 = getelementptr inbounds i8, i8* %input, i64 %799
  %801 = load i8, i8* %800, align 1, !tbaa !247
  %802 = insertelement <64 x i8> %797, i8 %801, i32 33
  %803 = extractelement <64 x i32> %632, i32 34
  %804 = sext i32 %803 to i64
  %805 = getelementptr inbounds i8, i8* %input, i64 %804
  %806 = load i8, i8* %805, align 1, !tbaa !247
  %807 = insertelement <64 x i8> %802, i8 %806, i32 34
  %808 = extractelement <64 x i32> %632, i32 35
  %809 = sext i32 %808 to i64
  %810 = getelementptr inbounds i8, i8* %input, i64 %809
  %811 = load i8, i8* %810, align 1, !tbaa !247
  %812 = insertelement <64 x i8> %807, i8 %811, i32 35
  %813 = extractelement <64 x i32> %632, i32 36
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds i8, i8* %input, i64 %814
  %816 = load i8, i8* %815, align 1, !tbaa !247
  %817 = insertelement <64 x i8> %812, i8 %816, i32 36
  %818 = extractelement <64 x i32> %632, i32 37
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds i8, i8* %input, i64 %819
  %821 = load i8, i8* %820, align 1, !tbaa !247
  %822 = insertelement <64 x i8> %817, i8 %821, i32 37
  %823 = extractelement <64 x i32> %632, i32 38
  %824 = sext i32 %823 to i64
  %825 = getelementptr inbounds i8, i8* %input, i64 %824
  %826 = load i8, i8* %825, align 1, !tbaa !247
  %827 = insertelement <64 x i8> %822, i8 %826, i32 38
  %828 = extractelement <64 x i32> %632, i32 39
  %829 = sext i32 %828 to i64
  %830 = getelementptr inbounds i8, i8* %input, i64 %829
  %831 = load i8, i8* %830, align 1, !tbaa !247
  %832 = insertelement <64 x i8> %827, i8 %831, i32 39
  %833 = extractelement <64 x i32> %632, i32 40
  %834 = sext i32 %833 to i64
  %835 = getelementptr inbounds i8, i8* %input, i64 %834
  %836 = load i8, i8* %835, align 1, !tbaa !247
  %837 = insertelement <64 x i8> %832, i8 %836, i32 40
  %838 = extractelement <64 x i32> %632, i32 41
  %839 = sext i32 %838 to i64
  %840 = getelementptr inbounds i8, i8* %input, i64 %839
  %841 = load i8, i8* %840, align 1, !tbaa !247
  %842 = insertelement <64 x i8> %837, i8 %841, i32 41
  %843 = extractelement <64 x i32> %632, i32 42
  %844 = sext i32 %843 to i64
  %845 = getelementptr inbounds i8, i8* %input, i64 %844
  %846 = load i8, i8* %845, align 1, !tbaa !247
  %847 = insertelement <64 x i8> %842, i8 %846, i32 42
  %848 = extractelement <64 x i32> %632, i32 43
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds i8, i8* %input, i64 %849
  %851 = load i8, i8* %850, align 1, !tbaa !247
  %852 = insertelement <64 x i8> %847, i8 %851, i32 43
  %853 = extractelement <64 x i32> %632, i32 44
  %854 = sext i32 %853 to i64
  %855 = getelementptr inbounds i8, i8* %input, i64 %854
  %856 = load i8, i8* %855, align 1, !tbaa !247
  %857 = insertelement <64 x i8> %852, i8 %856, i32 44
  %858 = extractelement <64 x i32> %632, i32 45
  %859 = sext i32 %858 to i64
  %860 = getelementptr inbounds i8, i8* %input, i64 %859
  %861 = load i8, i8* %860, align 1, !tbaa !247
  %862 = insertelement <64 x i8> %857, i8 %861, i32 45
  %863 = extractelement <64 x i32> %632, i32 46
  %864 = sext i32 %863 to i64
  %865 = getelementptr inbounds i8, i8* %input, i64 %864
  %866 = load i8, i8* %865, align 1, !tbaa !247
  %867 = insertelement <64 x i8> %862, i8 %866, i32 46
  %868 = extractelement <64 x i32> %632, i32 47
  %869 = sext i32 %868 to i64
  %870 = getelementptr inbounds i8, i8* %input, i64 %869
  %871 = load i8, i8* %870, align 1, !tbaa !247
  %872 = insertelement <64 x i8> %867, i8 %871, i32 47
  %873 = extractelement <64 x i32> %632, i32 48
  %874 = sext i32 %873 to i64
  %875 = getelementptr inbounds i8, i8* %input, i64 %874
  %876 = load i8, i8* %875, align 1, !tbaa !247
  %877 = insertelement <64 x i8> %872, i8 %876, i32 48
  %878 = extractelement <64 x i32> %632, i32 49
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds i8, i8* %input, i64 %879
  %881 = load i8, i8* %880, align 1, !tbaa !247
  %882 = insertelement <64 x i8> %877, i8 %881, i32 49
  %883 = extractelement <64 x i32> %632, i32 50
  %884 = sext i32 %883 to i64
  %885 = getelementptr inbounds i8, i8* %input, i64 %884
  %886 = load i8, i8* %885, align 1, !tbaa !247
  %887 = insertelement <64 x i8> %882, i8 %886, i32 50
  %888 = extractelement <64 x i32> %632, i32 51
  %889 = sext i32 %888 to i64
  %890 = getelementptr inbounds i8, i8* %input, i64 %889
  %891 = load i8, i8* %890, align 1, !tbaa !247
  %892 = insertelement <64 x i8> %887, i8 %891, i32 51
  %893 = extractelement <64 x i32> %632, i32 52
  %894 = sext i32 %893 to i64
  %895 = getelementptr inbounds i8, i8* %input, i64 %894
  %896 = load i8, i8* %895, align 1, !tbaa !247
  %897 = insertelement <64 x i8> %892, i8 %896, i32 52
  %898 = extractelement <64 x i32> %632, i32 53
  %899 = sext i32 %898 to i64
  %900 = getelementptr inbounds i8, i8* %input, i64 %899
  %901 = load i8, i8* %900, align 1, !tbaa !247
  %902 = insertelement <64 x i8> %897, i8 %901, i32 53
  %903 = extractelement <64 x i32> %632, i32 54
  %904 = sext i32 %903 to i64
  %905 = getelementptr inbounds i8, i8* %input, i64 %904
  %906 = load i8, i8* %905, align 1, !tbaa !247
  %907 = insertelement <64 x i8> %902, i8 %906, i32 54
  %908 = extractelement <64 x i32> %632, i32 55
  %909 = sext i32 %908 to i64
  %910 = getelementptr inbounds i8, i8* %input, i64 %909
  %911 = load i8, i8* %910, align 1, !tbaa !247
  %912 = insertelement <64 x i8> %907, i8 %911, i32 55
  %913 = extractelement <64 x i32> %632, i32 56
  %914 = sext i32 %913 to i64
  %915 = getelementptr inbounds i8, i8* %input, i64 %914
  %916 = load i8, i8* %915, align 1, !tbaa !247
  %917 = insertelement <64 x i8> %912, i8 %916, i32 56
  %918 = extractelement <64 x i32> %632, i32 57
  %919 = sext i32 %918 to i64
  %920 = getelementptr inbounds i8, i8* %input, i64 %919
  %921 = load i8, i8* %920, align 1, !tbaa !247
  %922 = insertelement <64 x i8> %917, i8 %921, i32 57
  %923 = extractelement <64 x i32> %632, i32 58
  %924 = sext i32 %923 to i64
  %925 = getelementptr inbounds i8, i8* %input, i64 %924
  %926 = load i8, i8* %925, align 1, !tbaa !247
  %927 = insertelement <64 x i8> %922, i8 %926, i32 58
  %928 = extractelement <64 x i32> %632, i32 59
  %929 = sext i32 %928 to i64
  %930 = getelementptr inbounds i8, i8* %input, i64 %929
  %931 = load i8, i8* %930, align 1, !tbaa !247
  %932 = insertelement <64 x i8> %927, i8 %931, i32 59
  %933 = extractelement <64 x i32> %632, i32 60
  %934 = sext i32 %933 to i64
  %935 = getelementptr inbounds i8, i8* %input, i64 %934
  %936 = load i8, i8* %935, align 1, !tbaa !247
  %937 = insertelement <64 x i8> %932, i8 %936, i32 60
  %938 = extractelement <64 x i32> %632, i32 61
  %939 = sext i32 %938 to i64
  %940 = getelementptr inbounds i8, i8* %input, i64 %939
  %941 = load i8, i8* %940, align 1, !tbaa !247
  %942 = insertelement <64 x i8> %937, i8 %941, i32 61
  %943 = extractelement <64 x i32> %632, i32 62
  %944 = sext i32 %943 to i64
  %945 = getelementptr inbounds i8, i8* %input, i64 %944
  %946 = load i8, i8* %945, align 1, !tbaa !247
  %947 = insertelement <64 x i8> %942, i8 %946, i32 62
  %948 = extractelement <64 x i32> %632, i32 63
  %949 = sext i32 %948 to i64
  %950 = getelementptr inbounds i8, i8* %input, i64 %949
  %951 = load i8, i8* %950, align 1, !tbaa !247
  %952 = insertelement <64 x i8> %947, i8 %951, i32 63
  %953 = select i1 %602, i64 %601, i64 194
  %954 = add nsw i64 %953, %598
  %955 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %954
  %956 = bitcast i8* %955 to <64 x i8>*
  store <64 x i8> %952, <64 x i8>* %956, align 2, !tbaa !250
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %957 = icmp eq i64 %indvars.iv.next, 5
  br i1 %957, label %"end for repeat_edge.s0._0._038", label %"for repeat_edge.s0._0._037"

"end for repeat_edge.s0._0._038":                 ; preds = %"for repeat_edge.s0._0._037"
  %indvars.iv.next87 = add nsw i64 %indvars.iv86, 1
  %958 = icmp eq i32 %471, %593
  br i1 %958, label %"for output.s0.y.yi41.preheader", label %"for repeat_edge.s0._134"

"for output.s0.y.yi41.preheader":                 ; preds = %"end for repeat_edge.s0._0._038"
  br label %"for output.s0.y.yi41"

"for output.s0.y.yi41":                           ; preds = %"end for output.s0.x.xi.xi45", %"for output.s0.y.yi41.preheader"
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %"end for output.s0.x.xi.xi45" ], [ 0, %"for output.s0.y.yi41.preheader" ]
  %959 = mul nuw nsw i64 %indvars.iv92, 5
  %960 = trunc i64 %indvars.iv92 to i32
  %961 = add nsw i32 %a41, %960
  %962 = mul nsw i32 %961, %output.stride.1
  %t127 = add nsw i32 %962, %output.s0.x.xi.base32
  %963 = sext i32 %t127 to i64
  br label %"for output.s0.x.xi.xi44"

"end for output.s0.y.yi42":                       ; preds = %"end for output.s0.x.xi.xi45"
  %964 = add nsw i32 %output.s0.x.x31, 1
  %965 = icmp eq i32 %964, %t83
  br i1 %965, label %destructor_block, label %"for output.s0.x.x29"

"for output.s0.x.xi.xi44":                        ; preds = %"for output.s0.x.xi.xi44", %"for output.s0.y.yi41"
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %"for output.s0.x.xi.xi44" ], [ 0, %"for output.s0.y.yi41" ]
  %966 = add nuw nsw i64 %indvars.iv89, %959
  %967 = shl nuw nsw i64 %966, 6
  %968 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %967
  %969 = bitcast i8* %968 to <64 x i8>*
  %970 = load <64 x i8>, <64 x i8>* %969, align 64, !tbaa !250
  %971 = add nuw nsw i64 %967, 64
  %972 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %971
  %973 = bitcast i8* %972 to <64 x i8>*
  %974 = load <64 x i8>, <64 x i8>* %973, align 64, !tbaa !250
  %975 = add nuw nsw i64 %967, 320
  %976 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %975
  %977 = bitcast i8* %976 to <64 x i8>*
  %978 = load <64 x i8>, <64 x i8>* %977, align 64, !tbaa !250
  %979 = add nuw nsw i64 %967, 384
  %980 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %979
  %981 = bitcast i8* %980 to <64 x i8>*
  %982 = load <64 x i8>, <64 x i8>* %981, align 64, !tbaa !250
  %983 = add nuw nsw i64 %967, 640
  %984 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %983
  %985 = bitcast i8* %984 to <64 x i8>*
  %986 = load <64 x i8>, <64 x i8>* %985, align 64, !tbaa !250
  %987 = add nuw nsw i64 %967, 704
  %988 = getelementptr inbounds [10880 x i8], [10880 x i8]* %repeat_edge53, i64 0, i64 %987
  %989 = bitcast i8* %988 to <64 x i8>*
  %990 = load <64 x i8>, <64 x i8>* %989, align 64, !tbaa !250
  %991 = icmp ugt <64 x i8> %978, %986
  %b74 = select <64 x i1> %991, <64 x i8> %978, <64 x i8> %986
  %992 = icmp ugt <64 x i8> %970, %b74
  %993 = select <64 x i1> %992, <64 x i8> %970, <64 x i8> %b74
  store <64 x i8> %993, <64 x i8>* %max_y51.0.sroa_cast, align 64
  %994 = icmp ugt <64 x i8> %982, %990
  %b76 = select <64 x i1> %994, <64 x i8> %982, <64 x i8> %990
  %995 = icmp ugt <64 x i8> %974, %b76
  %996 = select <64 x i1> %995, <64 x i8> %974, <64 x i8> %b76
  store <64 x i8> %996, <64 x i8>* %max_y51.64.sroa_cast, align 64
  %max_y51.1.a77 = load <64 x i8>, <64 x i8>* %max_y51.1.sroa_cast, align 1
  %max_y51.2.b79 = load <64 x i8>, <64 x i8>* %max_y51.2.sroa_cast, align 2
  %997 = icmp ugt <64 x i8> %max_y51.1.a77, %max_y51.2.b79
  %b78 = select <64 x i1> %997, <64 x i8> %max_y51.1.a77, <64 x i8> %max_y51.2.b79
  %998 = icmp ugt <64 x i8> %993, %b78
  %999 = select <64 x i1> %998, <64 x i8> %993, <64 x i8> %b78
  %1000 = shl nuw nsw i64 %indvars.iv89, 6
  %1001 = add nsw i64 %1000, %963
  %1002 = getelementptr inbounds i8, i8* %output, i64 %1001
  %1003 = bitcast i8* %1002 to <64 x i8>*
  store <64 x i8> %999, <64 x i8>* %1003, align 1, !tbaa !252
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %1004 = icmp eq i64 %indvars.iv.next90, 4
  br i1 %1004, label %"end for output.s0.x.xi.xi45", label %"for output.s0.x.xi.xi44"

"end for output.s0.x.xi.xi45":                    ; preds = %"for output.s0.x.xi.xi44"
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %1005 = icmp eq i64 %indvars.iv.next93, 32
  br i1 %1005, label %"end for output.s0.y.yi42", label %"for output.s0.y.yi41"

destructor_block:                                 ; preds = %"end for output.s0.y.yi42", %"end for output.s0.x.x"
  ret i32 0
}

; Function Attrs: nounwind
define i32 @dilate3x3_batch_02_sample_14_argv(i8** nocapture readonly) local_unnamed_addr #10 {
entry:
  %1 = bitcast i8** %0 to %struct.halide_buffer_t**
  %2 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %1, align 8
  %3 = getelementptr i8*, i8** %0, i64 1
  %4 = bitcast i8** %3 to %struct.halide_buffer_t**
  %5 = load %struct.halide_buffer_t*, %struct.halide_buffer_t** %4, align 8
  %6 = tail call i32 @dilate3x3_batch_02_sample_14(%struct.halide_buffer_t* %2, %struct.halide_buffer_t* %5) #14
  ret i32 %6
}

; Function Attrs: norecurse nounwind readnone
define nonnull %struct.halide_filter_metadata_t* @dilate3x3_batch_02_sample_14_metadata() local_unnamed_addr #11 {
entry:
  ret %struct.halide_filter_metadata_t* @dilate3x3_batch_02_sample_14_metadata_storage
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone speculatable }
attributes #8 = { nounwind "reciprocal-estimates"="none" }
attributes #9 = { norecurse nounwind "reciprocal-estimates"="none" }
attributes #10 = { nounwind }
attributes #11 = { norecurse nounwind readnone }
attributes #12 = { nobuiltin nounwind }
attributes #13 = { nobuiltin }
attributes #14 = { noinline }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, !"halide_use_soft_float_abi", i32 0}
!3 = !{i32 2, !"halide_mcpu", !"skylake-avx512"}
!4 = !{i32 2, !"halide_mattrs", !"+fma,+f16c,+avx512f,+avx512cd,+avx512vl,+avx512bw,+avx512dq"}
!5 = !{i32 2, !"halide_per_instruction_fast_math_flags", i32 0}
!6 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"bool", !9, i64 0}
!14 = !{i8 0, i8 2}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !9, i64 0}
!17 = !{!18, !8, i64 0}
!18 = !{!"_ZTSN6Halide7Runtime8Internal4workE", !19, i64 0, !8, i64 56, !8, i64 64, !8, i64 72, !20, i64 80, !8, i64 88, !20, i64 96, !8, i64 104, !20, i64 112, !20, i64 116, !20, i64 120, !13, i64 124}
!19 = !{!"_ZTS22halide_parallel_task_t", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !20, i64 32, !20, i64 36, !20, i64 40, !20, i64 44, !13, i64 48}
!20 = !{!"int", !9, i64 0}
!21 = !{!18, !20, i64 36}
!22 = !{!18, !20, i64 40}
!23 = !{!18, !13, i64 48}
!24 = !{!18, !8, i64 24}
!25 = !{!18, !20, i64 32}
!26 = !{!18, !8, i64 8}
!27 = !{!18, !20, i64 44}
!28 = !{!18, !8, i64 16}
!29 = !{!18, !8, i64 56}
!30 = !{!18, !8, i64 104}
!31 = !{!18, !8, i64 72}
!32 = !{!18, !20, i64 80}
!33 = !{!18, !8, i64 88}
!34 = !{!18, !20, i64 116}
!35 = !{!36, !8, i64 8}
!36 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization15parking_controlE", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24}
!37 = !{!36, !8, i64 24}
!38 = !{!39, !8, i64 32}
!39 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization21mutex_parking_controlE", !8, i64 32}
!40 = !{!36, !8, i64 0}
!41 = !{!36, !8, i64 16}
!42 = !{!43, !13, i64 2121}
!43 = !{!"_ZTSN6Halide7Runtime8Internal12work_queue_tE", !44, i64 0, !20, i64 8, !20, i64 12, !8, i64 16, !20, i64 24, !20, i64 28, !20, i64 32, !45, i64 40, !45, i64 48, !45, i64 56, !20, i64 64, !20, i64 68, !9, i64 72, !13, i64 2120, !13, i64 2121, !20, i64 2124}
!44 = !{!"_ZTS12halide_mutex", !9, i64 0}
!45 = !{!"_ZTS11halide_cond", !9, i64 0}
!46 = !{!43, !20, i64 8}
!47 = !{!43, !20, i64 24}
!48 = !{!43, !20, i64 2124}
!49 = !{!43, !20, i64 28}
!50 = !{!18, !20, i64 112}
!51 = !{!18, !20, i64 96}
!52 = !{!43, !8, i64 16}
!53 = !{!43, !20, i64 68}
!54 = !{!18, !8, i64 64}
!55 = !{!43, !20, i64 64}
!56 = !{!43, !20, i64 32}
!57 = !{!43, !13, i64 2120}
!58 = !{!18, !20, i64 120}
!59 = !{!60, !8, i64 0}
!60 = !{!"_ZTS26halide_semaphore_acquire_t", !8, i64 0, !20, i64 8}
!61 = !{!60, !20, i64 8}
!62 = !{!18, !13, i64 124}
!63 = !{!64, !8, i64 144}
!64 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization10queue_dataE", !65, i64 0, !68, i64 136, !8, i64 144, !68, i64 152}
!65 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization13thread_parkerE", !66, i64 0, !67, i64 64, !13, i64 128}
!66 = !{!"_ZTS15pthread_mutex_t", !9, i64 0}
!67 = !{!"_ZTS14pthread_cond_t", !9, i64 0}
!68 = !{!"long long", !9, i64 0}
!69 = !{!70, !8, i64 16}
!70 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization11hash_bucketE", !71, i64 0, !8, i64 8, !8, i64 16}
!71 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization9word_lockE", !68, i64 0}
!72 = !{!64, !68, i64 152}
!73 = !{!65, !13, i64 128}
!74 = !{!75, !8, i64 152}
!75 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization20word_lock_queue_dataE", !65, i64 0, !8, i64 136, !8, i64 144, !8, i64 152}
!76 = !{!75, !8, i64 136}
!77 = !{!75, !8, i64 144}
!78 = !{!79, !8, i64 32}
!79 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization25broadcast_parking_controlE", !8, i64 32, !8, i64 40}
!80 = !{!79, !8, i64 40}
!81 = !{!82, !8, i64 32}
!82 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization20wait_parking_controlE", !8, i64 32, !8, i64 40}
!83 = !{!82, !8, i64 40}
!84 = !{!85, !68, i64 8}
!85 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization15validate_actionE", !13, i64 0, !68, i64 8}
!86 = !{!85, !13, i64 0}
!87 = !{!64, !68, i64 136}
!88 = !{!70, !8, i64 8}
!89 = !{!68, !68, i64 0}
!90 = !{!91, !8, i64 0}
!91 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization11bucket_pairE", !8, i64 0, !8, i64 8}
!92 = !{!91, !8, i64 8}
!93 = !{!94, !8, i64 0}
!94 = !{!"_ZTSN6Halide7Runtime8Internal14spawned_threadE", !8, i64 0, !8, i64 8, !16, i64 16}
!95 = !{!94, !8, i64 8}
!96 = !{!94, !16, i64 16}
!97 = !{!19, !20, i64 40}
!98 = !{i64 0, i64 8, !7, i64 8, i64 8, !7, i64 16, i64 8, !7, i64 24, i64 8, !7, i64 32, i64 4, !99, i64 36, i64 4, !99, i64 40, i64 4, !99, i64 44, i64 4, !99, i64 48, i64 1, !12}
!99 = !{!20, !20, i64 0}
!100 = !{!101, !8, i64 32}
!101 = !{!"_ZTSN6Halide7Runtime8Internal15Synchronization22signal_parking_controlE", !8, i64 32, !8, i64 40}
!102 = !{!101, !8, i64 40}
!103 = !{!104, !106, i64 34}
!104 = !{!"_ZTS20halide_trace_event_t", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !105, i64 32, !107, i64 36, !20, i64 40, !20, i64 44, !20, i64 48}
!105 = !{!"_ZTS13halide_type_t", !9, i64 0, !9, i64 1, !106, i64 2}
!106 = !{!"short", !9, i64 0}
!107 = !{!"_ZTS25halide_trace_event_code_t", !9, i64 0}
!108 = !{!105, !9, i64 1}
!109 = !{!104, !20, i64 48}
!110 = !{!104, !8, i64 0}
!111 = !{!104, !8, i64 24}
!112 = !{!113, !20, i64 0}
!113 = !{!"_ZTSN6Halide7Runtime8Internal23SharedExclusiveSpinLockE", !20, i64 0}
!114 = !{!115, !20, i64 4}
!115 = !{!"_ZTSN6Halide7Runtime8Internal11TraceBufferE", !113, i64 0, !20, i64 4, !20, i64 8, !9, i64 12}
!116 = !{!115, !20, i64 8}
!117 = !{!118, !20, i64 0}
!118 = !{!"_ZTS21halide_trace_packet_t", !20, i64 0, !20, i64 4, !105, i64 8, !107, i64 12, !20, i64 16, !20, i64 20, !20, i64 24}
!119 = !{!118, !20, i64 4}
!120 = !{!104, !8, i64 16}
!121 = !{!104, !8, i64 8}
!122 = !{!118, !20, i64 24}
!123 = !{!118, !106, i64 10}
!124 = !{!104, !107, i64 36}
!125 = !{!104, !9, i64 33}
!126 = !{!104, !20, i64 44}
!127 = !{!104, !9, i64 32}
!128 = !{!106, !106, i64 0}
!129 = !{!130, !130, i64 0}
!130 = !{!"float", !9, i64 0}
!131 = !{!132, !132, i64 0}
!132 = !{!"double", !9, i64 0}
!133 = !{!104, !20, i64 40}
!134 = !{!135, !20, i64 36}
!135 = !{!"_ZTS15halide_buffer_t", !68, i64 0, !8, i64 8, !8, i64 16, !68, i64 24, !105, i64 32, !20, i64 36, !8, i64 40, !8, i64 48}
!136 = !{!135, !8, i64 40}
!137 = !{i64 0, i64 4, !99, i64 4, i64 4, !99, i64 8, i64 4, !99, i64 12, i64 4, !99}
!138 = !{!139, !20, i64 4}
!139 = !{!"_ZTS18halide_dimension_t", !20, i64 0, !20, i64 4, !20, i64 8, !20, i64 12}
!140 = !{!139, !20, i64 0}
!141 = !{!139, !20, i64 8}
!142 = !{!143, !106, i64 0}
!143 = !{!"_ZTSN6Halide7Runtime8Internal18halide_tiff_headerE", !106, i64 0, !106, i64 2, !20, i64 4, !106, i64 8, !9, i64 10, !20, i64 190, !9, i64 194, !9, i64 202}
!144 = !{!143, !106, i64 2}
!145 = !{!143, !20, i64 4}
!146 = !{!143, !106, i64 8}
!147 = !{!148, !106, i64 0}
!148 = !{!"_ZTSN6Halide7Runtime8Internal8tiff_tagE", !106, i64 0, !106, i64 2, !20, i64 4, !9, i64 8}
!149 = !{!148, !106, i64 2}
!150 = !{!148, !20, i64 4}
!151 = !{!135, !8, i64 16}
!152 = !{!153, !8, i64 0}
!153 = !{!"_ZTSN6Halide7Runtime8Internal10CacheEntryE", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !16, i64 32, !8, i64 40, !20, i64 48, !20, i64 52, !20, i64 56, !20, i64 60, !8, i64 64, !8, i64 72}
!154 = !{!153, !20, i64 56}
!155 = !{!153, !8, i64 24}
!156 = !{!153, !8, i64 72}
!157 = !{!158, !68, i64 0}
!158 = !{!"_ZTSN6Halide7Runtime8Internal11device_copyE", !68, i64 0, !68, i64 8, !68, i64 16, !9, i64 24, !9, i64 152, !9, i64 280, !68, i64 408}
!159 = !{!158, !68, i64 8}
!160 = !{!158, !68, i64 408}
!161 = !{!158, !68, i64 16}
!162 = !{i64 0, i64 8, !89, i64 8, i64 8, !89, i64 16, i64 8, !89, i64 24, i64 128, !11, i64 152, i64 128, !11, i64 280, i64 128, !11, i64 408, i64 8, !89}
!163 = !{!139, !20, i64 12}
!164 = !{!153, !16, i64 32}
!165 = !{!153, !20, i64 48}
!166 = !{!153, !20, i64 52}
!167 = !{!153, !20, i64 60}
!168 = !{!153, !8, i64 64}
!169 = !{!153, !8, i64 40}
!170 = !{i64 0, i64 8, !89, i64 8, i64 8, !7, i64 16, i64 8, !7, i64 24, i64 8, !89, i64 32, i64 1, !11, i64 33, i64 1, !11, i64 34, i64 2, !128, i64 36, i64 4, !99, i64 40, i64 8, !7, i64 48, i64 8, !7}
!171 = !{!153, !8, i64 8}
!172 = !{!153, !8, i64 16}
!173 = !{!174, !20, i64 8}
!174 = !{!"_ZTSN6Halide7Runtime8Internal16CacheBlockHeaderE", !8, i64 0, !20, i64 8}
!175 = !{!174, !8, i64 0}
!176 = !{!105, !9, i64 0}
!177 = !{!105, !106, i64 2}
!178 = !{!135, !68, i64 0}
!179 = !{!135, !8, i64 8}
!180 = !{!135, !68, i64 24}
!181 = !{!182, !8, i64 120}
!182 = !{!"_ZTS25halide_device_interface_t", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !8, i64 96, !8, i64 104, !8, i64 112, !8, i64 120}
!183 = !{!184, !8, i64 48}
!184 = !{!"_ZTS30halide_device_interface_impl_t", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !8, i64 96, !8, i64 104, !8, i64 112, !8, i64 120}
!185 = !{!184, !8, i64 40}
!186 = !{!184, !8, i64 56}
!187 = !{!184, !8, i64 0}
!188 = !{!184, !8, i64 16}
!189 = !{!184, !8, i64 8}
!190 = !{!184, !8, i64 32}
!191 = !{!184, !8, i64 24}
!192 = !{!184, !8, i64 64}
!193 = !{!184, !8, i64 72}
!194 = !{!184, !8, i64 112}
!195 = !{!184, !8, i64 120}
!196 = !{!184, !8, i64 80}
!197 = !{!184, !8, i64 88}
!198 = !{!184, !8, i64 96}
!199 = !{!184, !8, i64 104}
!200 = !{i32 22, i32 33}
!201 = !{!202, !20, i64 64}
!202 = !{!"_ZTS8buffer_t", !68, i64 0, !8, i64 8, !9, i64 16, !9, i64 32, !9, i64 48, !20, i64 64, !13, i64 68, !13, i64 69, !9, i64 70}
!203 = !{!202, !8, i64 8}
!204 = !{!202, !68, i64 0}
!205 = !{!206, !68, i64 0}
!206 = !{!"_ZTSN6Halide7Runtime8Internal15old_dev_wrapperE", !68, i64 0, !8, i64 8}
!207 = !{!206, !8, i64 8}
!208 = !{!202, !13, i64 68}
!209 = !{!202, !13, i64 69}
!210 = !{!211, !8, i64 40}
!211 = !{!"_ZTS21halide_profiler_state", !44, i64 0, !20, i64 8, !20, i64 12, !20, i64 16, !20, i64 20, !8, i64 24, !8, i64 32, !8, i64 40}
!212 = !{!211, !20, i64 16}
!213 = !{!214, !68, i64 0}
!214 = !{!"_ZTS30halide_profiler_pipeline_stats", !68, i64 0, !68, i64 8, !68, i64 16, !68, i64 24, !68, i64 32, !68, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !20, i64 72, !20, i64 76, !20, i64 80, !20, i64 84, !20, i64 88}
!215 = !{!214, !20, i64 80}
!216 = !{!214, !68, i64 32}
!217 = !{!214, !68, i64 40}
!218 = !{!214, !8, i64 48}
!219 = !{!214, !20, i64 84}
!220 = !{!214, !20, i64 88}
!221 = !{!214, !68, i64 16}
!222 = !{!214, !68, i64 24}
!223 = !{!214, !20, i64 72}
!224 = !{!214, !8, i64 56}
!225 = !{!226, !68, i64 32}
!226 = !{!"_ZTS26halide_profiler_func_stats", !68, i64 0, !68, i64 8, !68, i64 16, !68, i64 24, !68, i64 32, !68, i64 40, !68, i64 48, !8, i64 56, !20, i64 64}
!227 = !{!226, !68, i64 0}
!228 = !{!226, !8, i64 56}
!229 = !{!226, !68, i64 40}
!230 = !{!226, !68, i64 48}
!231 = !{!226, !20, i64 64}
!232 = !{!226, !68, i64 24}
!233 = !{!226, !68, i64 16}
!234 = !{!211, !8, i64 24}
!235 = !{!214, !8, i64 64}
!236 = !{!211, !20, i64 12}
!237 = !{!214, !20, i64 76}
!238 = !{!211, !8, i64 32}
!239 = !{!211, !20, i64 20}
!240 = !{!211, !20, i64 8}
!241 = !{!"branch_weights", i32 0, i32 1073741824}
!242 = !{!"branch_weights", i32 1073741824, i32 0}
!243 = !{!135, !9, i64 32}
!244 = !{!135, !9, i64 33}
!245 = !{!135, !106, i64 34}
!246 = !{i64 0, i64 64}
!247 = !{!248, !248, i64 0}
!248 = !{!"input", !249, i64 0}
!249 = !{!"Halide buffer"}
!250 = !{!251, !251, i64 0}
!251 = !{!"repeat_edge", !249, i64 0}
!252 = !{!253, !253, i64 0}
!253 = !{!"output", !249, i64 0}
